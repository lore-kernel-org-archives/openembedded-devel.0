Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tejkr-0006v1-1W
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2012 10:53:01 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so1026737lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2012 01:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TVVAMOyUkLLuyNyz0oh102usZt/swUC5wriz0K8xj70=;
	b=hx3LWP0fvKjQ5c3f1HCz5vk2fY+yO9lX0rl/yYrxQJpQTkWtgGbpz5wS3/sRqYYwKF
	R0VNUqrneFugFJcp1qwtr2leShN/A2ZYgcTpQKXKiN6FF3OSOXk85zXdfOXhp2b3/P1z
	086KoptnYyUtiet1iRzpqny/Qva14x/WyysnzAMNQ56VOjQtZqt1+C5DPegikNOZOc7v
	t7tisGFszboq0nK59gqZeub5QtA9rMTM1MjyZanfjxoGZAdHZAY09NPwu/m6yI6Zxvhy
	IBPXE9HwR/mP8p6K66p4zgi89nkq1MiU202yJl6j4kbkjoQIkS5TZjY4VIiQgn6H57+e
	xCnA==
Received: by 10.112.29.229 with SMTP id n5mr1976936lbh.130.1354354722632;
	Sat, 01 Dec 2012 01:38:42 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id q2sm2948466lbd.14.2012.12.01.01.38.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Dec 2012 01:38:41 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TejWx-00019j-9H; Sat, 01 Dec 2012 11:38:39 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2012 11:38:37 +0200
Message-Id: <1354354717-1024-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] fakeroot: update to upstream version 1.18.4
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
X-List-Received-Date: Sat, 01 Dec 2012 09:53:01 -0000

License is now GPLv3

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 ...-native_1.12.4.bb => fakeroot-native_1.18.4.bb} |    4 ---
 .../fakeroot/fakeroot/configure-libtool.patch      |   20 --------------
 .../fakeroot/fakeroot/fix-prefix.patch             |   15 -----------
 meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb   |   27 -------------------
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb   |   28 ++++++++++++++++++++
 5 files changed, 28 insertions(+), 66 deletions(-)
 rename meta-oe/recipes-core/fakeroot/{fakeroot-native_1.12.4.bb => fakeroot-native_1.18.4.bb} (67%)
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
 create mode 100644 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb

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
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
deleted file mode 100644
index 1cc5602..0000000
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Gives a fake root environment"
-HOMEPAGE = "http://fakeroot.alioth.debian.org"
-SECTION = "base"
-LICENSE = "GPL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7686b00e9859a1a04043d33452bae823"
-PR = "r2"
-
-SRC_URI = "\
-  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
-  file://configure-libtool.patch \
-"
-	    
-inherit autotools
-
-do_install_append() {
-        install -d ${D}${includedir}/fakeroot
-        install -m 644 *.h ${D}${includedir}/fakeroot
-        install -d ${D}${libdir}/libfakeroot/
-        oe_libinstall -so libfakeroot ${D}${libdir}/libfakeroot/
-}
-
-# fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS_${PN} = "util-linux"
-
-
-SRC_URI[md5sum] = "aaefede2405a40c87438e7e833d69b70"
-SRC_URI[sha256sum] = "dbcab1f495b857e67feff882e018ca59958b8d189ff1f76684d28e35463ec29d"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
new file mode 100644
index 0000000..a277a69
--- /dev/null
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Gives a fake root environment"
+HOMEPAGE = "http://fakeroot.alioth.debian.org"
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+PR = "r0"
+
+SRC_URI = "\
+  ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
+"
+
+inherit autotools
+
+do_configure_prepend() {
+        mkdir -p ${S}/build-aux
+}
+
+do_install_append() {
+        install -d ${D}${includedir}/fakeroot
+        install -m 644 *.h ${D}${includedir}/fakeroot
+}
+
+# fakeroot needs getopt which is provided by the util-linux package
+RDEPENDS_${PN} = "util-linux"
+
+
+SRC_URI[md5sum] = "706171d8d520b1ca1576ac73f2ceb4f3"
+SRC_URI[sha256sum] = "0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2"
-- 
1.7.10.4



