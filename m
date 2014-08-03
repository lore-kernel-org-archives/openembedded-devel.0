Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE19609C0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Aug 2014 16:01:03 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so6389495wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Aug 2014 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8snpCAe2nS077FNEgtYfMkwTfgq1j9s2+8Pkq2Vd/9g=;
	b=hPDgjdrhayJCEEOp3s3K0UUmfZNvIu9YAe6EZfCThyfRU5LcP4QQ5UtPSlL/dbM/kq
	3Y4ooX7KegaCS449+94MuEEEnSdQrEeqJXyB+kLKjmSy6lmljjoclz+xDR1OHr1QgfCf
	B/3nfqlWGfEXPGTeRxLUiNhLSdVEXNWH4Ld+erh3/n88x3dDzosXd4Ra1tr6rFwdTj9G
	OfpQLhMMDfZV4RbUaPADBYFyFUS+hHrUgEedkJhJQ1fuZxwBablVBfz0oU+Ms/AcSbKN
	eKRxfqN6SJNE/9PUYrtKG21g1vEgAsriv6O4bNig7a4H6/rO5za9Tsp4DGFKFk8evUIX
	wkMA==
X-Received: by 10.194.109.71 with SMTP id hq7mr25090346wjb.114.1407081664225; 
	Sun, 03 Aug 2014 09:01:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fc7sm36705623wjc.37.2014.08.03.09.01.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Aug 2014 09:01:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Aug 2014 18:01:28 +0200
Message-Id: <1407081689-21804-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH 1/2] dfu-util-native: upgrade to 0.7 and drop 0.4
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
X-List-Received-Date: Sun, 03 Aug 2014 16:01:07 -0000

* fold .inc file into .bb
* add usbpath patch from 0.4 to 0.7, otherwise dfu-util fails to build
  when built after usbpath recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-Revert-Makefile.am-Drop-static-dfu-util.patch | 49 ----------------
 .../dfu-util/dfu-util-0.4/no-usbpath.patch         | 20 -------
 ...u-util-native_0.4.bb => dfu-util-native_0.7.bb} |  2 +-
 meta-oe/recipes-support/dfu-util/dfu-util.inc      |  9 ---
 ...0001-configure.ac-Don-t-check-for-usbpath.patch | 38 ++++++++++++
 ...2-Revert-Makefile.am-Drop-static-dfu-util.patch | 67 ++++++++++++++++++++++
 .../dfu-util/dfu-util/configure.patch              | 12 ----
 meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb   | 10 ----
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb   | 12 +++-
 9 files changed, 117 insertions(+), 102 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util-0.4/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util-0.4/no-usbpath.patch
 rename meta-oe/recipes-support/dfu-util/{dfu-util-native_0.4.bb => dfu-util-native_0.7.bb} (87%)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util.inc
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util/configure.patch
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-0.4/0001-Revert-Makefile.am-Drop-static-dfu-util.patch b/meta-oe/recipes-support/dfu-util/dfu-util-0.4/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
deleted file mode 100644
index 9ffc582..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util-0.4/0001-Revert-Makefile.am-Drop-static-dfu-util.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b379db29534ce6fa2e185f559e817398b3feb9ea Mon Sep 17 00:00:00 2001
-From: Martin JaMa Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 11 Aug 2011 11:19:52 +0200
-Subject: [PATCH] Revert "Makefile.am: Drop static dfu-util"
-
-This reverts commit fe0426ddc04f503d148c5e5f931f16b8f674f071.
-
-Conflicts:
-
-	src/Makefile.am
-
-Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
----
- src/Makefile.am |   15 ++++++++++++++-
- 1 files changed, 14 insertions(+), 1 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 0674413..ed87891 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CFLAGS = -Wall
- 
--bin_PROGRAMS = dfu-util
-+bin_PROGRAMS = dfu-util dfu-util_static
- dfu_util_SOURCES = main.c \
- 		dfu_load.c \
- 		dfu_load.h \
-@@ -11,3 +11,17 @@ dfu_util_SOURCES = main.c \
- 		dfu_file.h \
- 		quirks.c \
- 		quirks.h
-+
-+dfu_util_static_SOURCES = main.c \
-+		dfu_load.c \
-+		dfu_load.h \
-+		dfu.c \
-+		dfu.h \
-+		usb_dfu.h \
-+		dfu_file.c \
-+		dfu_file.h \
-+		quirks.c \
-+		quirks.h
-+
-+dfu_util_static_LDFLAGS = -static
-+dfu_util_static_LDADD = -lusb-1.0 -lrt -lpthread
--- 
-1.7.6
-
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-0.4/no-usbpath.patch b/meta-oe/recipes-support/dfu-util/dfu-util-0.4/no-usbpath.patch
deleted file mode 100644
index e4f943e..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util-0.4/no-usbpath.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: dfu-util-0.4/configure.ac
-===================================================================
---- dfu-util-0.4.orig/configure.ac	2011-08-10 22:22:30.000000000 +0200
-+++ dfu-util-0.4/configure.ac	2011-08-10 22:22:57.000000000 +0200
-@@ -18,14 +18,12 @@
- # Checks for libraries.
- PKG_CHECK_MODULES(USB, libusb-1.0 >= 1.0.0,,
-                  AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
--AC_CHECK_LIB([usbpath],[usb_path2devnum],,,-lusb)
--
- LIBS="$LIBS $USB_LIBS"
- CFLAGS="$CFLAGS $USB_CFLAGS"
- 
- # Checks for header files.
- AC_HEADER_STDC
--AC_CHECK_HEADERS([stdlib.h string.h stdio.h usbpath.h])
-+AC_CHECK_HEADERS([stdlib.h string.h stdio.h])
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb
similarity index 87%
rename from meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
rename to meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb
index ce6e566..8be9d85 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.4.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.7.bb
@@ -6,7 +6,7 @@ do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 DEPENDS = "libusb1-native"
 
 FILESPATH =. "${FILE_DIRNAME}/${BPN}-${PV}:"
-SRC_URI += "file://0001-Revert-Makefile.am-Drop-static-dfu-util.patch"
+SRC_URI += "file://0002-Revert-Makefile.am-Drop-static-dfu-util.patch"
 
 do_deploy() {
     install -d ${DEPLOY_DIR_TOOLS}
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util.inc b/meta-oe/recipes-support/dfu-util/dfu-util.inc
deleted file mode 100644
index 892acad..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "USB Device Firmware Upgrade utility"
-SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "http://dfu-util.gnumonks.org/releases/dfu-util-${PV}.tar.gz"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
new file mode 100644
index 0000000..a583c33
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0001-configure.ac-Don-t-check-for-usbpath.patch
@@ -0,0 +1,38 @@
+From 63f6f6882f3813ab22c62806feeab942579a2acf Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 3 Aug 2014 17:50:06 +0200
+Subject: [PATCH 1/2] configure.ac: Don't check for usbpath
+
+* otherwise it fails to build with -lusb
+  | main.o: In function `resolve_device_path':
+  | dfu-util/0.7-r0/dfu-util-0.7/src/main.c:371: undefined reference to `usb_path2devnum'
+  | collect2: error: ld returned 1 exit status
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 700b556..fb58473 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,14 +22,13 @@ AS_IF([test x$native_libusb = xno], [
+     PKG_CHECK_MODULES([USB], [libusb-1.0 >= 1.0.0],,
+         AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
+ ])
+-AC_CHECK_LIB([usbpath],[usb_path2devnum],,,-lusb)
+ 
+ LIBS="$LIBS $USB_LIBS"
+ CFLAGS="$CFLAGS $USB_CFLAGS"
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([usbpath.h windows.h])
++AC_CHECK_HEADERS([windows.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+-- 
+2.0.2
+
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch b/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
new file mode 100644
index 0000000..de17808
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util/0002-Revert-Makefile.am-Drop-static-dfu-util.patch
@@ -0,0 +1,67 @@
+From 440a026379ff111aaa8314db1c29ffae8f482824 Mon Sep 17 00:00:00 2001
+From: Martin JaMa Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 11 Aug 2011 11:19:52 +0200
+Subject: [PATCH 2/2] Revert "Makefile.am: Drop static dfu-util"
+
+This reverts commit fe0426ddc04f503d148c5e5f931f16b8f674f071.
+
+Signed-off-by: Martin JaMa Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac    |  2 +-
+ src/Makefile.am | 20 +++++++++++++++++++-
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fb58473..09b9e5a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ AS_IF([test x$native_libusb = xno], [
+         AC_MSG_ERROR([*** Required libusb-1.0 >= 1.0.0 not installed ***]))
+ ])
+ 
+-LIBS="$LIBS $USB_LIBS"
++LIBS="$LIBS $USB_LIBS -lpthread"
+ CFLAGS="$CFLAGS $USB_CFLAGS"
+ 
+ # Checks for header files.
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 99df307..28d53f7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,6 +1,6 @@
+ AM_CFLAGS = -Wall
+ 
+-bin_PROGRAMS = dfu-util dfu-suffix
++bin_PROGRAMS = dfu-util dfu-util_static dfu-suffix
+ dfu_util_SOURCES = main.c \
+ 		portable.h \
+ 		dfu_load.c \
+@@ -17,6 +17,24 @@ dfu_util_SOURCES = main.c \
+ 		quirks.c \
+ 		quirks.h
+ 
++dfu_util_static_SOURCES = main.c \
++		portable.h \
++		dfu_load.c \
++		dfu_load.h \
++		dfuse.c \
++		dfuse.h \
++		dfuse_mem.c \
++		dfuse_mem.h \
++		dfu.c \
++		dfu.h \
++		usb_dfu.h \
++		dfu_file.c \
++		dfu_file.h \
++		quirks.c \
++		quirks.h
++
++dfu_util_static_LDFLAGS = -static
++
+ dfu_suffix_SOURCES = suffix.c \
+ 		dfu_file.h \
+ 		dfu_file.c \
+-- 
+2.0.2
+
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch b/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch
deleted file mode 100644
index c83d510..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util/configure.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr dfu-util-0.4.orig/configure.ac dfu-util-0.4/configure.ac
---- dfu-util-0.4.orig/configure.ac	2014-07-18 08:18:45.407552416 +0200
-+++ dfu-util-0.4/configure.ac	2014-07-18 20:05:11.934894143 +0200
-@@ -4,7 +4,7 @@
- AC_PREREQ(2.59)
- AC_INIT([dfu-util],[0.4])
- AC_CONFIG_AUX_DIR(m4)
--AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER([config.h])
- 
- # Test for new silent rules and enable only if they are available
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb
deleted file mode 100644
index 9f55a86..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dfu-util.inc
-
-DEPENDS = "libusb1"
-
-SRC_URI += "file://no-usbpath.patch \
-    file://configure.patch \
-"
-
-SRC_URI[md5sum] = "2cf466fabb881e8598fa02f286d3242c"
-SRC_URI[sha256sum] = "f60fea987aa06ee03da22a656d1d113ac224458ec4442bcf1764a62f0930bd07"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
index c4c030d..aa2b84d 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -1,4 +1,14 @@
-require dfu-util.inc
+DESCRIPTION = "USB Device Firmware Upgrade utility"
+SECTION = "devel"
+AUTHOR = "Harald Welte <laforge@openmoko.org>"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
+    file://0001-configure.ac-Don-t-check-for-usbpath.patch \
+"
+
+inherit autotools pkgconfig
 
 DEPENDS = "libusb1"
 
-- 
2.0.2


