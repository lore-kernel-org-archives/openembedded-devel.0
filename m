Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2951E78D63
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w717BlF1004313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:47 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:33 +0800
Message-ID: <cd7e1330ab65278ab4fe2c3e8c9b9e2c5f13ea79.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/16] lvm2/libdevmapper: 2.02.177 -> 2.02.180
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:47 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch | 29 ++++++++------
 .../lvm2/files/0005-do-not-build-manual.patch      | 46 ++++++++++++++--------
 ...mapper_2.02.177.bb => libdevmapper_2.02.180.bb} |  4 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |  4 +-
 .../lvm2/{lvm2_2.02.177.bb => lvm2_2.02.180.bb}    |  4 +-
 5 files changed, 51 insertions(+), 36 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.177.bb => libdevmapper_2.02.180.bb} (63%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.177.bb => lvm2_2.02.180.bb} (93%)

diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index 425ba74..517b9a5 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -1,6 +1,6 @@
-From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Tue, 25 Oct 2016 11:59:40 +0000
+From 3bba45890985b877b823836e78a1c8ac3c878856 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 31 Jul 2018 15:04:29 +0800
 Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
 
 Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
@@ -16,20 +16,23 @@ filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loo
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
- configure.in | 1 -
- 1 file changed, 1 deletion(-)
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
 
-Index: LVM2.2.02.177/configure.in
-===================================================================
---- LVM2.2.02.177.orig/configure.in
-+++ LVM2.2.02.177/configure.in
-@@ -1870,7 +1870,6 @@ if test "$BUILD_DMFILEMAPD" = yes; then
+diff --git a/configure.ac b/configure.ac
+index e427708..aa374ea 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1791,8 +1791,6 @@ if test "$BUILD_DMFILEMAPD" = yes; then
  fi
  
  ################################################################################
--AC_PATH_TOOL(MODPROBE_CMD, modprobe)
- 
+-AC_PATH_TOOL(MODPROBE_CMD, modprobe, [], [$PATH_SBIN])
+-
  if test -n "$MODPROBE_CMD"; then
  	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
+ fi
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 01477e0..e3ce4c8 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -1,6 +1,6 @@
-From d8bb25e34d6533ba78eaae697771ee499a66706f Mon Sep 17 00:00:00 2001
+From 51d661ff33bb254d7b335a9c87acf5c6e7a94192 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 2 Aug 2017 03:41:37 -0400
+Date: Tue, 31 Jul 2018 15:08:34 +0800
 Subject: [PATCH] do not build manual
 
 On some host (ubuntu 1404), build manual failed.
@@ -15,24 +15,33 @@ Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.in  | 4 ++--
- configure.in | 1 -
- 2 files changed, 2 insertions(+), 3 deletions(-)
+ Makefile.in  | 6 +++---
+ configure.ac | 1 -
+ 2 files changed, 3 insertions(+), 4 deletions(-)
 
-Index: LVM2.2.02.177/Makefile.in
-===================================================================
---- LVM2.2.02.177.orig/Makefile.in
-+++ LVM2.2.02.177/Makefile.in
+diff --git a/Makefile.in b/Makefile.in
+index e2f5a84..acf31e5 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
  
--SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
-+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
+-SUBDIRS = conf daemons include lib libdaemon libdm man scripts device_mapper tools
++SUBDIRS = conf daemons include lib libdaemon libdm scripts device_mapper tools
  
  ifeq ("@UDEV_RULES@", "yes")
    SUBDIRS += udev
-@@ -69,7 +69,7 @@ liblvm.device-mapper: include.device-map
+@@ -41,7 +41,7 @@ ifeq ($(MAKECMDGOALS),clean)
+ endif
+ # FIXME Should use intermediate Makefiles here!
+ ifeq ($(MAKECMDGOALS),distclean)
+-  SUBDIRS = conf include man test scripts \
++  SUBDIRS = conf include test scripts \
+     libdaemon lib tools daemons libdm \
+     udev po liblvm python device_mapper
+ tools.distclean: test.distclean
+@@ -71,7 +71,7 @@ liblvm.device-mapper: include.device-mapper
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
  scripts.device-mapper: include.device-mapper
@@ -41,11 +50,11 @@ Index: LVM2.2.02.177/Makefile.in
  
  ifeq ("@INTL@", "yes")
  lib.pofile: include.pofile
-Index: LVM2.2.02.177/configure.in
-===================================================================
---- LVM2.2.02.177.orig/configure.in
-+++ LVM2.2.02.177/configure.in
-@@ -2216,7 +2216,6 @@ libdm/Makefile
+diff --git a/configure.ac b/configure.ac
+index aa374ea..5a92cba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2124,7 +2124,6 @@ libdm/Makefile
  libdm/libdevmapper.pc
  liblvm/Makefile
  liblvm/liblvm2app.pc
@@ -53,3 +62,6 @@ Index: LVM2.2.02.177/configure.in
  po/Makefile
  python/Makefile
  python/setup.py
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
similarity index 63%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
index 211a472..f3f11ef 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.177.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "ee6cfbc5a0c5696ffae79dac04ee7a2b"
-SRC_URI[sha256sum] = "4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
+SRC_URI[md5sum] = "bc26da66e96727babbd288bb0f050339"
+SRC_URI[sha256sum] = "24997e26dfc916151707c9da504d38d0473bec3481a8230b676bc079041bead6"
 
 DEPENDS += "autoconf-archive-native"
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3a1e82b..75f4d89 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -5,9 +5,9 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
-DEPENDS += "util-linux"
+DEPENDS += "util-linux libaio"
 
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
+SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
similarity index 93%
rename from meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
index 1d9de3d..5b9b2f7 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.177.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
@@ -1,7 +1,7 @@
 require lvm2.inc
 
-SRC_URI[md5sum] = "ee6cfbc5a0c5696ffae79dac04ee7a2b"
-SRC_URI[sha256sum] = "4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
+SRC_URI[md5sum] = "bc26da66e96727babbd288bb0f050339"
+SRC_URI[sha256sum] = "24997e26dfc916151707c9da504d38d0473bec3481a8230b676bc079041bead6"
 
 SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
 
-- 
2.7.4


