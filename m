Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi2-0005nE-J0
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705911eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7wHiDNcw690MJzPHAWAwvuES2kK6B9sfpHBsIffnqZk=;
	b=FK3q1Mc1Q4YhXHUZveqQhfvaZEQmhWbtEFvpetCkAk30Y3PBIkoMtitvAi1hymMHyc
	Ur8Tj35mdSbZoHh+GJ0DCKKJwb9f9i5bnLGgfRK5jeMcitBlbsM3TGa2FISazuxMZN54
	YiC4hghG52AkQtuKQI2MELeuldXyUNuWdYF4WymDJQdgkp2TzFluaRx2TcdHrvM4Aj7l
	bgw65mhsTU4F2yRIBMUCFvKxTB9laI7xNwRLiNwC5ywH4jsWWulAG5OD90FJxo7g2Nbx
	6NvkeO/xYOhYKNFvLxQSQHEAFoWgFsXYS3+drtO1fIrjpKWVeKtwh6GPDfwPnmi7xdxw
	l8Zw==
Received: by 10.14.223.135 with SMTP id v7mr33906619eep.41.1355680707577;
	Sun, 16 Dec 2012 09:58:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm23879095eek.0.2012.12.16.09.58.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:55 +0100
Message-Id: <f30f91abda1271361f8c69fead8807ccf895b87f.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/26] fakeroot: update to upstream version 1.18.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

License is now GPLv3

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...t-native_1.12.4.bb => fakeroot-native_1.18.4.bb} |  4 ----
 .../fakeroot/fakeroot/configure-libtool.patch       | 20 --------------------
 .../recipes-core/fakeroot/fakeroot/fix-prefix.patch | 15 ---------------
 .../{fakeroot_1.12.4.bb => fakeroot_1.18.4.bb}      | 21 +++++++++++----------
 4 files changed, 11 insertions(+), 49 deletions(-)
 rename meta-oe/recipes-core/fakeroot/{fakeroot-native_1.12.4.bb => fakeroot-native_1.18.4.bb} (67%)
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch
 rename meta-oe/recipes-core/fakeroot/{fakeroot_1.12.4.bb => fakeroot_1.18.4.bb} (45%)

diff --git a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
similarity index 67%
rename from meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
rename to meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
index 1e9f15a..a27a60b 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
@@ -1,6 +1,5 @@
 require fakeroot_${PV}.bb
 
-SRC_URI += "file://fix-prefix.patch"
 S = "${WORKDIR}/fakeroot-${PV}"
 
 inherit native
@@ -14,6 +13,3 @@ python () {
 }
 
 RDEPENDS_${PN} = "util-linux-native"
-
-SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
-SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch b/meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch
deleted file mode 100644
index 46f7df7..0000000
--- a/meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: fakeroot-1.12.1/configure.ac
-===================================================================
---- fakeroot-1.12.1.orig/configure.ac
-+++ fakeroot-1.12.1/configure.ac
-@@ -2,14 +2,12 @@
- AC_INIT([fakeroot],[FAKEROOT_VERSION],[schizo@debian.org],[fakeroot])
- AC_PREREQ(2.61)
- AC_CONFIG_MACRO_DIR([build-aux])
--LT_PREREQ(2.1a)
- AC_CANONICAL_TARGET
- AM_INIT_AUTOMAKE
- AM_MAINTAINER_MODE
- AC_CONFIG_HEADERS([config.h])
- AC_PROG_MAKE_SET
--LT_INIT
--LT_LANG(C)
-+AC_PROG_LIBTOOL
- 
- AH_BOTTOM([#if ! HAVE_BUILTIN_EXPECT
- #define __builtin_expect(x, expected_value) (x)
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch b/meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch
deleted file mode 100644
index 3c47bd7..0000000
--- a/meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: fakeroot-1.12.1/scripts/fakeroot.in
-===================================================================
---- fakeroot-1.12.1.orig/scripts/fakeroot.in
-+++ fakeroot-1.12.1/scripts/fakeroot.in
-@@ -30,8 +30,8 @@
- }
- 
- # strip /bin/fakeroot to find install prefix
--PREFIX=@prefix@
--BINDIR=@bindir@
-+BINDIR=`dirname $0`
-+PREFIX=`dirname ${BINDIR}`
- 
- USEABSLIBPATH=@LDPRELOADABS@
- LIB=lib@fakeroot_transformed@@DLSUFFIX@
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
similarity index 45%
rename from meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
rename to meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
index 1cc5602..a277a69 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -1,27 +1,28 @@
 DESCRIPTION = "Gives a fake root environment"
 HOMEPAGE = "http://fakeroot.alioth.debian.org"
 SECTION = "base"
-LICENSE = "GPL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7686b00e9859a1a04043d33452bae823"
-PR = "r2"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+PR = "r0"
 
 SRC_URI = "\
-  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
-  file://configure-libtool.patch \
+  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
 "
-	    
+
 inherit autotools
 
+do_configure_prepend() {
+        mkdir -p ${S}/build-aux
+}
+
 do_install_append() {
         install -d ${D}${includedir}/fakeroot
         install -m 644 *.h ${D}${includedir}/fakeroot
-        install -d ${D}${libdir}/libfakeroot/
-        oe_libinstall -so libfakeroot ${D}${libdir}/libfakeroot/
 }
 
 # fakeroot needs getopt which is provided by the util-linux package
 RDEPENDS_${PN} = "util-linux"
 
 
-SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
-SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
+SRC_URI[md5sum] = "706171d8d520b1ca1576ac73f2ceb4f3"
+SRC_URI[sha256sum] = "0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2"
-- 
1.8.0.2



