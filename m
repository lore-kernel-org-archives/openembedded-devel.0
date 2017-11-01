Return-Path: <joe@deserted.net>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D878277F90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 13:23:47 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id n137so5962357iod.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=UoyndAvm7PQSHi7DU+q9RT+UkwZvgSTKGwgiwYVPaYY=;
	b=EygNS1gTyiwvYWW/CGGbBv20AOo4QHur0qe3aoQZQGjG4PlMlxF13ICRKQS1q5V+Pe
	Z6cONVkPTWKG131loEU6iJ/limn6fxVe3/DD7rfAgI2xAgZZd9o0hoYYZivRbEuaOHNE
	YsrRtLYu62f1gm7aNKneQLuQKn36CLLYiqGiIZ7tHGib5ozxA7iuQRDewDBtggU9Kk16
	+/x2dyFr+EEFH01FrAOPHgRcm6wB51pf0f/bJn4jh+WKEbdHLYl37U8A4s5lWY1uX1LZ
	Fx5Tw2ExNoBYCEhaCsDYLReUwBVWysfIyPMBxLDvOMSrBDTv+rcNne1/uFPCgHfjcHuC
	lqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=UoyndAvm7PQSHi7DU+q9RT+UkwZvgSTKGwgiwYVPaYY=;
	b=Ij4Yb0aVnC0u/MdAQ1byjO6fBOmBopMDgGFpuYKIazcYwTFgQp8nlQM6U6wWLJXRJI
	SJKajYQImgv6guXa1Ru2Cl+i2WAxYIK1VTKuzYGAJ1JX0ImS8x2C1ObdWLymAJ7ZkO2/
	MEox8aMBz0kFJRY44Ud9sh3nqQCSzAeNaFoGW64lw5WGRAOBMA1+8KuoRi2UQx07G0Id
	5s83nyw4Zg+84pnigfVa+B+EFpq64tutzqHw7yNamG68MHcPX9y7oHIga34mYwAUGDGI
	IjRg2rE5pp+K4A27Xi1jfAUqKmhT2iIdJKaSZcCcYYdEnb9YtljpwTNcYU+9KMZQJPNZ
	WO4w==
X-Gm-Message-State: AMCzsaWHLDeXFay8mWfWpx5S5ADm+7mWsNF9mTCMiWDq/eWzXvAcXtnd
	8lZFZrva+LKLQEej+xaVNyUy8JZT
X-Google-Smtp-Source: ABhQp+T9YsBTEW5o91JmRNnbNn/e2uVhlkIkDYWV9eOS57AR7vEz1uFHY8VWc55951Yc1zNZUpT+XA==
X-Received: by 10.36.34.11 with SMTP id o11mr421611ito.70.1509542628725;
	Wed, 01 Nov 2017 06:23:48 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	d129sm256232ioe.1.2017.11.01.06.23.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 06:23:48 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 09:23:40 -0400
Message-Id: <1509542622-20015-5-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH v2 4/6] net-snmp: support openssl without 3des
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
X-List-Received-Date: Wed, 01 Nov 2017 13:23:48 -0000

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


