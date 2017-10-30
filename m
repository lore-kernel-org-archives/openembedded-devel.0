Return-Path: <joe@deserted.net>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 50F3171CB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:20 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id j17so29217637iod.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=UoyndAvm7PQSHi7DU+q9RT+UkwZvgSTKGwgiwYVPaYY=;
	b=1++JuFrU/ACozwlFbhgCD8UMltAy1JcMN5/StaoieacxzezxuQJe1sNhjwMUSSLgXv
	S5FIfLKEGlH20g48xFIWknlXaZYSvXblDdmD+r+6jkOGeXh1pzz5IhYgdpL1lhGkAPmS
	yMsR1KZ5/o0oFx9cP3m9gZVBp4Q/gXMPzoW5nYwe/dynDzgbPBuz+mLhZXwtFPubtk8q
	oZMxMmTqxOsFlZzrIKfibGN3dq8Lq4NpnnpzxExCqg3Qfc4MbuFV1Ud+lGzunIOKJtnh
	rBNZOSS8oLHTaWTY/nvYWbWRmhqfnkJvoSyDSqmBySzxcPfkhk8Dd8wCOL/pQkk7wcTV
	Rtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=UoyndAvm7PQSHi7DU+q9RT+UkwZvgSTKGwgiwYVPaYY=;
	b=cD6orsn9QjN3PPBen1sd1WWlnAJj0+sELcPSajTBfIjpvmR8AcJ+1opts5teYdrvhe
	Zl4qP8cwycYt4t1zrR2xdkR0DvgiCq2kwe2PCaRCS7E9B7oqMDLRm+QoT+h3Q+U+1PVV
	moNyKvNcygjBjl5AWo2YzSy0e7qQu7rAZMw9iIhBsMHWEQA7MVYufDiWlZCuUTWLuLVS
	chS/zRtBlqdLDrSr04Y3KePAWOgRjqFhdaNR+DnljMAeMFuyP0YDr01TuIy8T+SJBWa5
	owluuW9QZstcuMpU5kZbDxb2ysOqD1aJvZvVxd94CENUB0oYnP2gOxn8J9luPx108y+j
	nbQw==
X-Gm-Message-State: AMCzsaXFroqrkQJIMK2F9FcVCV7QOlhLwwREgrtJVPXKAraoXyzyUeJM
	gJgvVilVbpBmGOFHqwG+hYY3PVm5
X-Google-Smtp-Source: ABhQp+Tozzh9IJoq+EJP6F/kjfdnPb/6PKvmPcDZDx/vyb/VV0o71IiXML1hE9gNNuPBpZFqf6K3og==
X-Received: by 10.36.118.210 with SMTP id z201mr7299658itb.78.1509387081288;
	Mon, 30 Oct 2017 11:11:21 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:20 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:11 -0400
Message-Id: <1509387073-21934-5-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 4/6] net-snmp: support openssl without 3des
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
X-List-Received-Date: Mon, 30 Oct 2017 18:11:20 -0000

From: Jackie Huang <jackie.huang@windriver.com>

net-snmp enables 3des support by default and fails to build with distro
feature openssl-no-weak-ciphers:

| ../../net-snmp-5.7.3/snmplib/scapi.c:82:25: fatal error: openssl/des.h: No such file or directory
|  #include <openssl/des.h>

To fix the issue:
* add a patch to include des.h only if it's found in openssl
* disable des when openssl-no-weak-ciphers is enabled

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../net-snmp/net-snmp-fix-for-disable-des.patch    | 32 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
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
index af6fd1b..849ae07 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
+           file://net-snmp-fix-for-disable-des.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
@@ -59,7 +60,8 @@ EXTRA_OECONF = "--enable-shared \
                 --with-defaults \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
+"
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
 EXTRA_OECONF += "--with-mib-modules=smux"
-- 
2.7.4


