Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFD2271985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v658JLwj016686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:21 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:25 +0800
Message-ID: <20170705081133.6496-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 02/10] net-snmp: disable des for openssl-no-weak-ciphers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jul 2017 08:19:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

net-snmp enables des support by default and fails to build with distro
feature openssl-no-weak-ciphers:

| ../../net-snmp-5.7.3/snmplib/scapi.c:82:25: fatal error: openssl/des.h: No such file or directory
|  #include <openssl/des.h>

To fix the issue:
* add a patch to include des.h only if it's found in openssl
* disable des when openssl-no-weak-ciphers is enabled

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../net-snmp/net-snmp-fix-for-disable-des.patch    | 32 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  5 +++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
new file mode 100644
index 0000000..25eb9c9
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
@@ -0,0 +1,32 @@
+From 270e952f58a7e5ddeabe5a15e3ddaaadf40017d0 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 22 Jun 2017 10:25:08 +0800
+Subject: [PATCH] net-snmp: fix for --disable-des
+
+Include des.h only if it's found in openssl so that
+the --disable-des works correctly.
+
+Upstream-Status: Submitted [net-snmp-coders@lists.sourceforge.net]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ snmplib/scapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/snmplib/scapi.c b/snmplib/scapi.c
+index 16ac829..271684b 100644
+--- a/snmplib/scapi.c
++++ b/snmplib/scapi.c
+@@ -79,7 +79,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support)
+ #include <openssl/hmac.h>
+ #include <openssl/evp.h>
+ #include <openssl/rand.h>
++#ifdef HAVE_OPENSSL_DES_H
+ #include <openssl/des.h>
++#endif
+ #ifdef HAVE_AES
+ #include <openssl/aes.h>
+ #endif
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 2d6887e..d3e72b2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0002-configure-fix-a-cc-check-issue.patch \
            file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
            file://0004-configure-fix-incorrect-variable.patch \
+           file://net-snmp-fix-for-disable-des.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
@@ -58,7 +59,9 @@ EXTRA_OECONF = "--enable-shared \
                 --with-defaults \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', '--disable-des', '', d)} \
+"
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
 EXTRA_OECONF += "--with-mib-modules=smux"
-- 
2.10.1


