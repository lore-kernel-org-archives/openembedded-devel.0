Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B413B74F35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6I7VVNw012398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:20 +0800
Message-ID: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] libblockdev: 2.16 -> 2.18
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:31 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-fix-configure-and-compile-failures.patch  | 64 ++++++++++++----------
 .../{libblockdev_2.16.bb => libblockdev_2.18.bb}   | 12 ++--
 2 files changed, 41 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.16.bb => libblockdev_2.18.bb} (81%)

diff --git a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
index 745883e..9c050b7 100644
--- a/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
+++ b/meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
@@ -1,7 +1,7 @@
-From 86686ccbf43c5d9e8c8dc97c66ba09e522050e5e Mon Sep 17 00:00:00 2001
+From 21654e3719e0a289e735918b234f7aae6766e3a1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 27 Jul 2017 10:06:24 +0800
-Subject: [PATCH 1/3] fix configure and compile failures
+Date: Wed, 18 Jul 2018 11:26:28 +0800
+Subject: [PATCH] fix configure and compile failures
 
 1. Fix do_configure failure
 ---------------------------
@@ -9,9 +9,6 @@ Subject: [PATCH 1/3] fix configure and compile failures
 ../tmp/6tvtK.c:1:38: fatal error: volume_key/libvolume_key.h:
 No such file or directory
 | #include <volume_key/libvolume_key.h>
-|Checking header dmraid/dmraid.h existence and usability.../tmp/
-ktVJ6.c:1:27: fatal error: dmraid/dmraid.h: No such file or directory
-| #include <dmraid/dmraid.h>
 ---------------------------
 We explictly add volume_key and dmraid to DEPENDS, do not need
 configure to test.
@@ -28,12 +25,20 @@ autoheader: Use AC_DEFINE([LIBMOUNT_NEW_ERR_API], [], [Description])
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Checking header dmraid/dmraid.h existence and usability.../tmp/
+ktVJ6.c:1:27: fatal error: dmraid/dmraid.h: No such file or directory
+| #include <dmraid/dmraid.h>
+
+fix this by add --disable-dmraid
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- configure.ac | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
+ configure.ac | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d41a307..b036e04 100644
+index a37f337..a8cfe2f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -9,6 +9,8 @@ AC_DISABLE_STATIC
@@ -45,35 +50,38 @@ index d41a307..b036e04 100644
  AM_PATH_PYTHON
  
  AM_PROG_AR
-@@ -154,7 +156,6 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])
+@@ -194,10 +196,9 @@ LIBBLOCKDEV_PKG_CHECK_MODULES([KMOD], [libkmod >= 19])
  AS_IF([test "x$with_crypto" != "xno"],
        [LIBBLOCKDEV_PKG_CHECK_MODULES([CRYPTSETUP], [libcryptsetup >= 1.6.7])
-        LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])
--       LIBBLOCKDEV_CHECK_HEADER([volume_key/libvolume_key.h], [$GLIB_CFLAGS $NSS_CFLAGS], [libvolume_key.h not available])
+       AS_IF([$PKG_CONFIG --atleast-version=2.0 libcryptsetup],
+-            [AC_DEFINE([LIBCRYPTSETUP_2])], [])
++            [AC_DEFINE([LIBCRYPTSETUP_2], [1], [new version of libcryptsetup])])
+       AS_IF([test "x$with_escrow" != "xno"],
+-            [LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])
+-             LIBBLOCKDEV_CHECK_HEADER([volume_key/libvolume_key.h], [$GLIB_CFLAGS $NSS_CFLAGS], [libvolume_key.h not available])],
++            [LIBBLOCKDEV_PKG_CHECK_MODULES([NSS], [nss >= 3.18.0])],
+             [])
        ],
        [])
- 
-@@ -162,10 +163,6 @@ AS_IF([test "x$with_dm" != "xno" -o "x$with_lvm" != "xno" -o "x$with_lvm_dbus" !
-       [LIBBLOCKDEV_PKG_CHECK_MODULES([DEVMAPPER], [devmapper >= 1.02.93])],
-       [])
- 
--AS_IF([test "x$with_dm" != "xno"],
--      [LIBBLOCKDEV_CHECK_HEADER([dmraid/dmraid.h], [], [dmraid.h not available])],
--      [])
--
- AS_IF([test "x$with_part" != "xno" -o "x$with_fs" != "xno"],
-       [LIBBLOCKDEV_PKG_CHECK_MODULES([PARTED], [libparted >= 3.1])]
-       [])
-@@ -174,7 +171,8 @@ AS_IF([test "x$with_fs" != "xno"],
+@@ -218,7 +219,8 @@ AS_IF([test "x$with_fs" != "xno"],
        [LIBBLOCKDEV_PKG_CHECK_MODULES([MOUNT], [mount >= 2.23.0])
         # new versions of libmount has some new functions we can use
         AS_IF([$PKG_CONFIG --atleast-version=2.30.0 mount],
 -             [AC_DEFINE([LIBMOUNT_NEW_ERR_API])], [])
-+             [AC_DEFINE([LIBMOUNT_NEW_ERR_API], [1], [new versions of libmount has some new functions we can use])],
-+             [])
++       [AC_DEFINE([LIBMOUNT_NEW_ERR_API], [1], [new versions of libmount has some new functions we can use])],
++       [])
  
         LIBBLOCKDEV_PKG_CHECK_MODULES([BLKID], [blkid >= 2.23.0])
         # older versions of libblkid don't support BLKID_SUBLKS_BADCSUM so let's just
+@@ -243,7 +245,7 @@ AS_IF([test "x$with_nvdimm" != "xno"],
+        LIBBLOCKDEV_PKG_CHECK_MODULES([NDCTL], [libndctl >= 58.4])
+        # new versions of libndctl new modes
+        AS_IF([$PKG_CONFIG --atleast-version=60 libndctl],
+-             [AC_DEFINE([LIBNDCTL_NEW_MODES])], [])]
++             [AC_DEFINE([LIBNDCTL_NEW_MODES], [1], [new version of libndctl new modes])], [])]
+       [])
+ 
+ AS_IF([test "x$with_vdo" != "xno"],
 -- 
-2.14.3
+2.7.4
 
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
similarity index 81%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
index 0c954aa..4dbd04c 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
@@ -18,16 +18,10 @@ DEPENDS += " \
     btrfs-tools \
 "
 
-SRCREV = "e2e0899efe8dd3f111ff955fb6c1dc10b0bd2075"
+SRCREV = "0debeb45562ac3d8f6f43f6f942b238abab55be9"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
     file://0001-fix-configure-and-compile-failures.patch \
-    file://0002-remove-python2-support.patch \
-    file://0003-remove-dmraid-while-compiling-with-with-dm.patch \
-    file://0005-fix-a-clang-compiling-issue.patch \
-"
-SRC_URI_append_libc-musl = " \
-    file://0004-fix-compile-failure-against-musl-C-library.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -40,12 +34,16 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
 PACKAGECONFIG ??= "python3 lvm dm kmod parted fs"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
+PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools"
 PACKAGECONFIG[dm] = "--with-dm, --without-dm"
+PACKAGECONFIG[dmraid] = "--with-dmraid, --without-dmraid"
 PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] = "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
+PACKAGECONFIG[nvdimm] = "--with-nvdimm, --without-nvdimm"
+PACKAGECONFIG[vdo] = "--with-vdo, --without-vdo"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
 
-- 
2.7.4


