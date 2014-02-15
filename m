Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3976E9AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2014 04:48:36 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id up15so13049571pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 20:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OZ1CY27UJJhSuAegF6j+okjMJ93OEJkK1jrwR1apfng=;
	b=JRbMYYUYIAh3vV6j3ZWqhJWdgX1YJ3LsE39uYFrlo9oEJdsz/d9OvtL68zC2++j29b
	yytZPFwcFWZdHP7sO+WDiqzKpQEYCUSj1crtQ5eue9zwhuCzuIDbNglKBsdaXVxZeNZs
	O9sW5Y3eF1WZRDSrvLwPtw843rpfDlF3Nws6JH4MmLu/ORHx/wrfwNEvlZuRCTUJuiQj
	0Tul2sQifFkh5+AWEJRubmb0rs8+nXMOsoIn4W5ScD+AXkgZ7iHxF1sfkr/XAjUlXny4
	WfELaMTHKVxTRaEslbxzfJMu/mXIgNE/cctXNls/wjXLqFXAEfEdWYYPUP7lcYa5T2TK
	ZAoQ==
X-Received: by 10.68.203.102 with SMTP id kp6mr13425277pbc.14.1392439717007;
	Fri, 14 Feb 2014 20:48:37 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id1sm22941733pbc.11.2014.02.14.20.48.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Feb 2014 20:48:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2014 20:48:59 -0800
Message-Id: <1392439739-14570-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH V3] libmicrohttpd: upgrade to 0.9.33
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Feb 2014 04:48:36 -0000

libmicrohttpd is needed by systemd-journald-gatewayd
Remove older recipes and move to recipes-support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   16 -------------
 .../libmicrohttpd/libmicrohttpd_0.9.33.bb}         |   24 ++++++++++++++------
 2 files changed, 17 insertions(+), 23 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
 rename meta-oe/{recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb => recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb} (18%)

diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
deleted file mode 100644
index ebaa485..0000000
--- a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
-
-DEPENDS = "libgcrypt curl"
-
-# ftp://ftp.nluug.nl/pub/gnu/${PN}/ has only 0.9.* and newer now
-SRC_URI = "http://mirrors.usc.edu/pub/gnu/${PN}/${P}.tar.gz"
-SRC_URI[md5sum] = "61698da6aa04744ea076c327f66fc05a"
-SRC_URI[sha256sum] = "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371"
-
-inherit autotools lib_package
-
-do_compile_append() {
-    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-}
diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
similarity index 18%
rename from meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
index 802ae40..523b8dd 100644
--- a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
@@ -1,16 +1,26 @@
-DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
-LICENSE = "LGPLv2.1"
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "libgcrypt gnutls"
 
-DEPENDS = "libgcrypt curl"
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3"
+SRC_URI[sha256sum] = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
 
-SRC_URI = "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
-SRC_URI[md5sum] = "a10496b7f1b495aaf6897584da52f51b"
-SRC_URI[sha256sum] = "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2e796ab8478f7e9cb"
+inherit autotools lib_package
 
+EXTRA_OECONF += "-disable-static --enable-gnutls"
 
-inherit autotools lib_package
+PACKAGECONFIG ?= "curl"
+PACKAGECONFIG_append_class-target = "\
+        ${@base_contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)} \
+"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 
 do_compile_append() {
 	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
+
-- 
1.7.10.4


