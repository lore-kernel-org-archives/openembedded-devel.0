Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7EB71B9B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:47:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a136so5580089pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vhIjliKoQljQyL3xo0u2bROg/tvnu6oAh5lpj/LhIb4=;
	b=YSxnBnnmYX3WzCVy4WLkKWGuseigUWpRxFUTPMuTyD2VriXRPANLqeVeZvDZpJjUDh
	TeErlJe1ki7I1snfaXg3dNbQEGKDvyyRM1+HD6HDhPuUJBBuBDjh/bCEWwNvhY+GImQy
	35QSNJwNHs5UijbvV9CB0NZ79wJTP7slDAaeCgxYB5MDNuYyWExYLDJL8xgrIsetAGj+
	PhMekgEfOdNbLcpVAx1+r8qzh3pSGIeVPT5AnMATRdHz3GnJ510ueQbZpsY0tKDw8EIW
	He1CdjUQ8ZbmpdEAhXieesq0UYE/oHjUWjHZjM64fHxRh8mnCswN6cSk/milFcwhUejL
	RjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vhIjliKoQljQyL3xo0u2bROg/tvnu6oAh5lpj/LhIb4=;
	b=gcniYRzgGcCjSLTesn58UGZrVaYPxaqcS2KTUrlTfX2lja+acT0znM7969rdfgiQr1
	KJfHacK84RhzVkhuQBty+TwocwYrz8//3oxPEn1+sUIwAKfoHzT8WPqJ0oX/6BZG82Ox
	JIYlOPa6QBw0WFfQMUYdEejR8zd03rGw/8FuY+mCXX0zPu5u9XwMqlDVs33h8qrDYxeD
	AxpSOqLcblxTmTWfRQXSHvCo/diX4kE20kXDIdhwwoNi02I7ak68hRw2AjVUeG0Q1jge
	et52PYotjbToip3ySTWMU7TsQKLov00v0dC+IlJ2VNLDGDD+kWXD7urOw1tZI8+nDQ15
	Gk0A==
X-Gm-Message-State: ABUngvdgWfFNb9rAY8CST9aEL1yfqkhibYC25g8nnEGbWQk4pYjbQiXSSju+PMhvU/s1IA==
X-Received: by 10.99.213.21 with SMTP id c21mr16039991pgg.176.1478198867858;
	Thu, 03 Nov 2016 11:47:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	128sm14482324pfy.4.2016.11.03.11.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 11:47:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 11:47:40 -0700
Message-Id: <20161103184740.13712-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103184740.13712-1-raj.khem@gmail.com>
References: <20161103184740.13712-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 8/8 V2] kodi: Add krypton/17.x Jarvis/16.x recipes
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
X-List-Received-Date: Thu, 03 Nov 2016 18:47:48 -0000

16.x is the default since its the latest released version

remove obsoleted xbmc recipes
rename to recipes-mediacenter

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes V1->V2:

- Add recipe for 16.x release and make it default

 .../kodi/jsonschemabuilder-native.bb               |   24 +
 ...re-don-t-try-to-run-stuff-to-find-tinyxml.patch |   25 +
 ...uild-breakages-due-to-architecture-specif.patch |   83 ++
 .../0003-configure-add-aarch64-support.patch       |   50 +
 ...gure-remove-gles-neon-wayland-assumptions.patch |   39 +
 .../kodi/kodi-16/0005-handle-SIGTERM.patch         |  158 +++
 ...-to-read-frequency-output-if-using-intel-.patch |   26 +
 .../kodi/kodi-16/0006-ffmpeg30.patch               |  646 +++++++++
 ...b.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch |   85 ++
 ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 ++
 ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 ++++++++++++++++++++
 ...10-curl-support-version-7.5.0-and-upwards.patch |   34 +
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 +
 ...re-don-t-try-to-run-stuff-to-find-tinyxml.patch |   25 +
 .../kodi/kodi-17/0002-handle-SIGTERM.patch         |  163 +++
 ...-to-read-frequency-output-if-using-intel-.patch |   26 +
 .../kodi/kodi-17/0004-Disable-DVD-support.patch    |   35 +
 .../0001-Update-to-p8-platform.patch               |  427 ++++++
 .../kodi/kodi-addon-pvr-hts_git.bb                 |   55 +
 .../0001-Fix-build-after-platform-rename.patch     |   67 +
 .../0001-fix-cross-compile-badness.patch           |   40 +
 .../kodi-platform-02_no-multi-lib.patch            |   12 +
 .../recipes-mediacenter/kodi/kodi-platform_git.bb  |   39 +
 .../recipes-mediacenter/kodi/kodi-startup.bb       |   20 +
 .../kodi/kodi-startup/kodi.service                 |   14 +
 .../recipes-mediacenter/kodi/kodi_16.bb            |  188 +++
 .../recipes-mediacenter/kodi/kodi_17.bb            |  181 +++
 ...on-t-run-python-distutils-to-find-STAGING.patch |   31 -
 ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch |   97 --
 ...d-ios-Add-memory-barriers-to-cas-assembly.patch |   69 -
 ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |   43 -
 .../xbmc/configure.in-Avoid-running-code.patch     |   32 -
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |   97 --
 33 files changed, 4012 insertions(+), 369 deletions(-)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0002-arm64-Fix-build-breakages-due-to-architecture-specif.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0003-configure-add-aarch64-support.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0004-configure-remove-gles-neon-wayland-assumptions.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0005-handle-SIGTERM.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-add-support-to-read-frequency-output-if-using-intel-.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-ffmpeg30.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0007-https-github.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0010-curl-support-version-7.5.0-and-upwards.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-16/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-to-p8-platform.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-compile-badness.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_no-multi-lib.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb

diff --git a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
new file mode 100644
index 0000000..094ccff
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Kodi Media Center"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://JsonSchemaBuilder.cpp;beginline=2;endline=18;md5=1f67721215c03f66545390f6e45b99c7"
+
+SRCREV = "b587e98911fcedc4b800cd923a882c7aeeaa2146"
+
+PV = "16.0+gitr${SRCPV}"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Jarvis"
+
+inherit autotools-brokensep gettext native
+
+S = "${WORKDIR}/git/tools/depends/native/JsonSchemaBuilder/src"
+
+do_compile_prepend() {
+    for i in $(find . -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
+    done
+
+    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
+    done
+}
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
new file mode 100644
index 0000000..772ab2c
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
@@ -0,0 +1,25 @@
+From 27fc03853c9305d285a80563db27aea5ddebda2a Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 6 Feb 2016 15:43:01 +0100
+Subject: [PATCH 1/7] configure: don't try to run stuff to find tinyxml
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 95f285b..d26c5d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1109,7 +1109,7 @@ AC_CHECK_LIB([bluetooth],   [hci_devid],, AC_MSG_RESULT([Could not find suitable
+ AC_LANG_PUSH([C++])
+ PKG_CHECK_MODULES([TINYXML], [tinyxml >= 2.6.2],
+   [INCLUDES="$INCLUDES $TINYXML_CFLAGS"; LIBS="$LIBS $TINYXML_LIBS"],
+-  [AC_RUN_IFELSE(
++  [AC_COMPILE_IFELSE(
+    [AC_LANG_SOURCE([[
+ #include <stdlib.h>
+ #include <tinyxml.h>
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0002-arm64-Fix-build-breakages-due-to-architecture-specif.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0002-arm64-Fix-build-breakages-due-to-architecture-specif.patch
new file mode 100644
index 0000000..8da5cb9
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0002-arm64-Fix-build-breakages-due-to-architecture-specif.patch
@@ -0,0 +1,83 @@
+From 0ef6bf309d3acf433e1c113306c8a9933c7fb7da Mon Sep 17 00:00:00 2001
+From: Edmund Grimley Evans <edmund.grimley.evans@gmail.com>
+Date: Wed, 26 Aug 2015 08:00:58 +0200
+Subject: [PATCH 2/7] arm64: Fix build breakages due to architecture specific
+ guards
+
+Origin: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=796532
+---
+ xbmc/cores/DllLoader/DllLoader.h            | 2 +-
+ xbmc/cores/DllLoader/ldt_keeper.c           | 2 +-
+ xbmc/cores/VideoRenderers/LinuxRendererGL.h | 2 +-
+ xbmc/threads/Atomics.cpp                    | 2 +-
+ xbmc/utils/MathUtils.h                      | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/DllLoader.h b/xbmc/cores/DllLoader/DllLoader.h
+index 070aee6..e669203 100644
+--- a/xbmc/cores/DllLoader/DllLoader.h
++++ b/xbmc/cores/DllLoader/DllLoader.h
+@@ -23,7 +23,7 @@
+ #include "coffldr.h"
+ #include "LibraryLoader.h"
+ 
+-#if defined(__linux__) && !defined(__powerpc__) && !defined(__arm__) && !defined(__mips__)
++#if defined(__linux__) && !defined(__powerpc__) && !defined(__arm__) && !defined(__mips__) && !defined(__aarch64__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+ #endif
+diff --git a/xbmc/cores/DllLoader/ldt_keeper.c b/xbmc/cores/DllLoader/ldt_keeper.c
+index 8af9a86..1c0cdb2 100644
+--- a/xbmc/cores/DllLoader/ldt_keeper.c
++++ b/xbmc/cores/DllLoader/ldt_keeper.c
+@@ -19,7 +19,7 @@
+  */
+ 
+ //#ifndef __powerpc__
+-#if !defined(__powerpc__) && !defined(__ppc__) && !defined(__arm__) && !defined(__mips__)
++#if !defined(__powerpc__) && !defined(__ppc__) && !defined(__arm__) && !defined(__mips__) && !defined(__aarch64__)
+ 
+ #include "ldt_keeper.h"
+ 
+diff --git a/xbmc/cores/VideoRenderers/LinuxRendererGL.h b/xbmc/cores/VideoRenderers/LinuxRendererGL.h
+index fcdea8d..5a3e3df 100644
+--- a/xbmc/cores/VideoRenderers/LinuxRendererGL.h
++++ b/xbmc/cores/VideoRenderers/LinuxRendererGL.h
+@@ -323,7 +323,7 @@ protected:
+ 
+ 
+ inline int NP2( unsigned x ) {
+-#if defined(TARGET_POSIX) && !defined(__POWERPC__) && !defined(__PPC__) && !defined(__arm__) && !defined(__mips__)
++#if defined(TARGET_POSIX) && !defined(__POWERPC__) && !defined(__PPC__) && !defined(__arm__) && !defined(__mips__) && !defined(__aarch64__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+ 
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 417b2b6..c172867 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -106,7 +106,7 @@ long cas(volatile long *pAddr, long expectedVal, long swapVal)
+ ///////////////////////////////////////////////////////////////////////////
+ long long cas2(volatile long long* pAddr, long long expectedVal, long long swapVal)
+ {
+-#if defined(__ppc__) || defined(__powerpc__) || defined(__arm__)// PowerPC and ARM
++#if defined(__ppc__) || defined(__powerpc__) || defined(__arm__) || defined(__aarch64__) // PowerPC and ARM
+ // Not available/required
+ // Hack to allow compilation
+   throw "cas2 is not implemented";
+diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
+index 21b6a37..1039ba9 100644
+--- a/xbmc/utils/MathUtils.h
++++ b/xbmc/utils/MathUtils.h
+@@ -35,7 +35,7 @@
+ #if defined(__ppc__) || \
+     defined(__powerpc__) || \
+     defined(__mips__) || \
+-    defined(__arm__)
++    defined(__arm__) || defined(__aarch64__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
+ 
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0003-configure-add-aarch64-support.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0003-configure-add-aarch64-support.patch
new file mode 100644
index 0000000..6bf58c6
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0003-configure-add-aarch64-support.patch
@@ -0,0 +1,50 @@
+From 8d7649565863731593e1a4123195b6ce9961cd12 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 9 Feb 2016 13:35:36 +0100
+Subject: [PATCH 3/7] configure: add aarch64 support
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure.ac    | 11 +++++++++++
+ m4/xbmc_arch.m4 |  3 +++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d26c5d0..8aad06d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -656,6 +656,17 @@ case $host in
+      use_wayland=no
+      USE_STATIC_FFMPEG=1
+      ;;
++  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
++     target_platform=target_linux
++     ARCH="aarch64"
++     use_arch="aarch64"
++     use_joystick=no
++     use_neon=yes
++     use_gles=yes
++     use_gl=no
++     use_wayland=no
++     USE_STATIC_FFMPEG=1
++     ;;
+   arm*-*linux-android*)
+      target_platform=target_android
+      use_arch="arm"
+diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
+index 0b66a82..ad09584 100644
+--- a/m4/xbmc_arch.m4
++++ b/m4/xbmc_arch.m4
+@@ -63,6 +63,9 @@ case $host in
+   arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
++  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
++     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
++     ;;
+   mips*-*-linux-gnu*|mips*-*-linux-uclibc*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0004-configure-remove-gles-neon-wayland-assumptions.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0004-configure-remove-gles-neon-wayland-assumptions.patch
new file mode 100644
index 0000000..6232e0d
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0004-configure-remove-gles-neon-wayland-assumptions.patch
@@ -0,0 +1,39 @@
+From e9c7f4d2b134e7b8721487c19a50d9e443db95b5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 11 Feb 2016 14:56:49 +0100
+Subject: [PATCH 4/7] configure: remove gles/neon/wayland assumptions
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure.ac | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8aad06d..e7178ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -650,10 +650,6 @@ case $host in
+      ARCH="arm"
+      use_arch="arm"
+      use_joystick=no
+-     use_neon=yes
+-     use_gles=yes
+-     use_gl=no
+-     use_wayland=no
+      USE_STATIC_FFMPEG=1
+      ;;
+   aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
+@@ -661,10 +657,6 @@ case $host in
+      ARCH="aarch64"
+      use_arch="aarch64"
+      use_joystick=no
+-     use_neon=yes
+-     use_gles=yes
+-     use_gl=no
+-     use_wayland=no
+      USE_STATIC_FFMPEG=1
+      ;;
+   arm*-*linux-android*)
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0005-handle-SIGTERM.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0005-handle-SIGTERM.patch
new file mode 100644
index 0000000..efb774e
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0005-handle-SIGTERM.patch
@@ -0,0 +1,158 @@
+From bc991427b10a83ac652ba0186f0b8bd46d441c8a Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Mon, 15 Dec 2014 21:28:54 +0200
+Subject: [PATCH 5/7] handle SIGTERM
+
+0. CApplication::Stop cant be trusted. (deadlocks crashes and boo)
+
+so, when shutdown/reboot is requested:
+
+1. save an exit code (for CEC...)
+2. call CPowerManager::{Reboot,PowerDown}
+3. ... then systemd sends TERM and waits xx seconds before sending KILL
+4. CApplication::Stop has xx seconds to save guisettings.xml and boo
+5. CEC thread has xx seconds to switch off after it received OnQuit
+6. addons / pvrmanager / cec / everything else.. are free to deadlock / crash now, we dont care
+7. KILL
+---
+ xbmc/Application.cpp     | 17 ++++++++++++-----
+ xbmc/Application.h       |  1 +
+ xbmc/XBApplicationEx.cpp |  1 +
+ xbmc/XBApplicationEx.h   |  1 +
+ xbmc/main/main.cpp       | 15 +++++++++++++++
+ 5 files changed, 30 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/Application.cpp b/xbmc/Application.cpp
+index 0e3d6da..74c3b7b 100644
+--- a/xbmc/Application.cpp
++++ b/xbmc/Application.cpp
+@@ -2502,12 +2502,12 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+   switch (pMsg->dwMessage)
+   {
+   case TMSG_POWERDOWN:
+-    Stop(EXITCODE_POWERDOWN);
++    SetExitCode(EXITCODE_POWERDOWN);
+     g_powerManager.Powerdown();
+     break;
+ 
+   case TMSG_QUIT:
+-    Stop(EXITCODE_QUIT);
++    SetExitCode(EXITCODE_QUIT);
+     break;
+   
+   case TMSG_SHUTDOWN:
+@@ -2528,12 +2528,13 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+ 
+   case TMSG_RESTART:
+   case TMSG_RESET:
+-    Stop(EXITCODE_REBOOT);
++    SetExitCode(EXITCODE_REBOOT);
+     g_powerManager.Reboot();
+     break;
+ 
+   case TMSG_RESTARTAPP:
+ #if defined(TARGET_WINDOWS) || defined(TARGET_LINUX)
++    SetExitCode(EXITCODE_RESTARTAPP);
+     Stop(EXITCODE_RESTARTAPP);
+ #endif
+     break;
+@@ -2920,12 +2921,19 @@ bool CApplication::Cleanup()
+   }
+ }
+ 
++void CApplication::SetExitCode(int exitCode)
++{
++  // save it for CEC
++  m_ExitCode = exitCode;
++  m_ExitCodeSet = true;
++}
++
+ void CApplication::Stop(int exitCode)
+ {
+   try
+   {
+     CVariant vExitCode(CVariant::VariantTypeObject);
+-    vExitCode["exitcode"] = exitCode;
++    vExitCode["exitcode"] = m_ExitCode;
+     CAnnouncementManager::GetInstance().Announce(System, "xbmc", "OnQuit", vExitCode);
+ 
+     // Abort any active screensaver
+@@ -2952,7 +2960,6 @@ void CApplication::Stop(int exitCode)
+ 
+     m_bStop = true;
+     m_AppFocused = false;
+-    m_ExitCode = exitCode;
+     CLog::Log(LOGNOTICE, "stop all");
+ 
+     // cancel any jobs from the jobmanager
+diff --git a/xbmc/Application.h b/xbmc/Application.h
+index d7e5eee..b9fe604 100644
+--- a/xbmc/Application.h
++++ b/xbmc/Application.h
+@@ -154,6 +154,7 @@ public:
+   void StartPVRManager();
+   void StopPVRManager();
+   bool IsCurrentThread() const;
++  void SetExitCode(int exitCode);
+   void Stop(int exitCode);
+   void RestartApp();
+   void UnloadSkin(bool forReload = false);
+diff --git a/xbmc/XBApplicationEx.cpp b/xbmc/XBApplicationEx.cpp
+index 048a6c1..fa99ac1 100644
+--- a/xbmc/XBApplicationEx.cpp
++++ b/xbmc/XBApplicationEx.cpp
+@@ -40,6 +40,7 @@ CXBApplicationEx::CXBApplicationEx()
+   m_bStop = false;
+   m_AppFocused = true;
+   m_ExitCode = EXITCODE_QUIT;
++  m_ExitCodeSet = false;
+   m_renderGUI = false;
+ }
+ 
+diff --git a/xbmc/XBApplicationEx.h b/xbmc/XBApplicationEx.h
+index c46cba1..ed3f35f 100644
+--- a/xbmc/XBApplicationEx.h
++++ b/xbmc/XBApplicationEx.h
+@@ -40,6 +40,7 @@ public:
+   // Variables for timing
+   bool m_bStop;
+   int  m_ExitCode;
++  bool m_ExitCodeSet;
+   bool m_AppFocused;
+   bool m_renderGUI;
+ 
+diff --git a/xbmc/main/main.cpp b/xbmc/main/main.cpp
+index 01027f8..4cfb04e 100644
+--- a/xbmc/main/main.cpp
++++ b/xbmc/main/main.cpp
+@@ -41,12 +41,27 @@
+ #include "input/linux/LIRC.h"
+ #endif
+ #include "XbmcContext.h"
++#include "Application.h"
++
++void xbmc_term_handler(int signum)
++{
++  CLog::Log(LOGINFO, "Received SIGTERM...");
++  if (!g_application.m_ExitCodeSet)
++    g_application.SetExitCode(EXITCODE_RESTARTAPP);
++  g_application.Stop(EXITCODE_RESTARTAPP);
++}
+ 
+ #ifdef __cplusplus
+ extern "C"
+ #endif
+ int main(int argc, char* argv[])
+ {
++  // SIGTERM handler
++  struct sigaction action;
++  memset(&action, 0, sizeof(struct sigaction));
++  action.sa_handler = xbmc_term_handler;
++  sigaction(SIGTERM, &action, NULL);
++
+   // set up some xbmc specific relationships
+   XBMC::Context context;
+ 
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-add-support-to-read-frequency-output-if-using-intel-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-add-support-to-read-frequency-output-if-using-intel-.patch
new file mode 100644
index 0000000..059abca
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-add-support-to-read-frequency-output-if-using-intel-.patch
@@ -0,0 +1,26 @@
+From 3145f271b9ac67a34481e4e3ad371b4769aca2f0 Mon Sep 17 00:00:00 2001
+From: Stephan Raue <stephan@openelec.tv>
+Date: Mon, 1 Sep 2014 03:16:37 +0200
+Subject: [PATCH 6/7] add support to read frequency output if using intel's
+ pstate driver
+
+---
+ xbmc/utils/CPUInfo.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xbmc/utils/CPUInfo.cpp b/xbmc/utils/CPUInfo.cpp
+index 660d355..8074520 100644
+--- a/xbmc/utils/CPUInfo.cpp
++++ b/xbmc/utils/CPUInfo.cpp
+@@ -269,6 +269,8 @@ CCPUInfo::CCPUInfo(void)
+     m_fProcTemperature = fopen("/sys/class/thermal/thermal_zone0/temp", "r");  // On Raspberry PIs
+ 
+   m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", "r");
++  if (m_fCPUFreq == NULL)
++    m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", "r");
+   if (!m_fCPUFreq)
+   {
+     m_cpuInfoForFreq = true;
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-ffmpeg30.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-ffmpeg30.patch
new file mode 100644
index 0000000..9164d48
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0006-ffmpeg30.patch
@@ -0,0 +1,646 @@
+Add support for ffmpeg 3.0
+
+Changes from original commit are only in file paths & quilt refresh.
+
+commit c31b7d374062f87c7512d9872cbceac920465913
+Author: Philip Langdale <philipl@overt.org>
+Date:   Mon Sep 21 19:49:36 2015 -0700
+
+    ffmpeg: Update AVPixelFormat and AV_PIX_FMT_* to compile with master
+    
+    The deprecated PixelFormat and PIX_FMT_* names have been removed in
+    ffmpeg master.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/media-tv/kodi/files/kodi-16-ffmpeg3.patch]
+
+Index: xbmc-16.0-Jarvis/xbmc/cores/FFmpeg.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/FFmpeg.h
++++ xbmc-16.0-Jarvis/xbmc/cores/FFmpeg.h
+@@ -24,7 +24,6 @@
+ #include "utils/CPUInfo.h"
+ 
+ extern "C" {
+-#include "libswscale/swscale.h"
+ #include "libavcodec/avcodec.h"
+ #include "libavformat/avformat.h"
+ #include "libavutil/avutil.h"
+@@ -33,23 +32,6 @@ extern "C" {
+ #include "libpostproc/postprocess.h"
+ }
+ 
+-inline int SwScaleCPUFlags()
+-{
+-  unsigned int cpuFeatures = g_cpuInfo.GetCPUFeatures();
+-  int flags = 0;
+-
+-  if (cpuFeatures & CPU_FEATURE_MMX)
+-    flags |= SWS_CPU_CAPS_MMX;
+-  if (cpuFeatures & CPU_FEATURE_MMX2)
+-    flags |= SWS_CPU_CAPS_MMX2;
+-  if (cpuFeatures & CPU_FEATURE_3DNOW)
+-    flags |= SWS_CPU_CAPS_3DNOW;
+-  if (cpuFeatures & CPU_FEATURE_ALTIVEC)
+-    flags |= SWS_CPU_CAPS_ALTIVEC;
+-
+-  return flags;
+-}
+-
+ inline int PPCPUFlags()
+ {
+   unsigned int cpuFeatures = g_cpuInfo.GetCPUFeatures();
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/DVDCodecUtils.cpp
+@@ -39,7 +39,7 @@ extern "C" {
+ #include "libswscale/swscale.h"
+ }
+ 
+-// allocate a new picture (PIX_FMT_YUV420P)
++// allocate a new picture (AV_PIX_FMT_YUV420P)
+ DVDVideoPicture* CDVDCodecUtils::AllocatePicture(int iWidth, int iHeight)
+ {
+   DVDVideoPicture* pPicture = new DVDVideoPicture;
+@@ -264,13 +264,13 @@ DVDVideoPicture* CDVDCodecUtils::Convert
+ 
+         int dstformat;
+         if (format == RENDER_FMT_UYVY422)
+-          dstformat = PIX_FMT_UYVY422;
++          dstformat = AV_PIX_FMT_UYVY422;
+         else
+-          dstformat = PIX_FMT_YUYV422;
++          dstformat = AV_PIX_FMT_YUYV422;
+ 
+-        struct SwsContext *ctx = sws_getContext(pSrc->iWidth, pSrc->iHeight, PIX_FMT_YUV420P,
++        struct SwsContext *ctx = sws_getContext(pSrc->iWidth, pSrc->iHeight, AV_PIX_FMT_YUV420P,
+                                                            pPicture->iWidth, pPicture->iHeight, (AVPixelFormat)dstformat,
+-                                                           SWS_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++                                                           SWS_BILINEAR, NULL, NULL, NULL);
+         sws_scale(ctx, src, srcStride, 0, pSrc->iHeight, dst, dstStride);
+         sws_freeContext(ctx);
+       }
+@@ -403,25 +403,25 @@ double CDVDCodecUtils::NormalizeFramedur
+ }
+ 
+ struct EFormatMap {
+-  PixelFormat   pix_fmt;
++  AVPixelFormat   pix_fmt;
+   ERenderFormat format;
+ };
+ 
+ static const EFormatMap g_format_map[] = {
+-   { PIX_FMT_YUV420P,     RENDER_FMT_YUV420P    }
+-,  { PIX_FMT_YUVJ420P,    RENDER_FMT_YUV420P    }
+-,  { PIX_FMT_YUV420P10,   RENDER_FMT_YUV420P10  }
+-,  { PIX_FMT_YUV420P16,   RENDER_FMT_YUV420P16  }
+-,  { PIX_FMT_UYVY422,     RENDER_FMT_UYVY422    }
+-,  { PIX_FMT_YUYV422,     RENDER_FMT_YUYV422    }
+-,  { PIX_FMT_VAAPI_VLD,   RENDER_FMT_VAAPI      }
+-,  { PIX_FMT_DXVA2_VLD,   RENDER_FMT_DXVA       }
+-,  { PIX_FMT_NONE     ,   RENDER_FMT_NONE       }
++   { AV_PIX_FMT_YUV420P,     RENDER_FMT_YUV420P    }
++,  { AV_PIX_FMT_YUVJ420P,    RENDER_FMT_YUV420P    }
++,  { AV_PIX_FMT_YUV420P10,   RENDER_FMT_YUV420P10  }
++,  { AV_PIX_FMT_YUV420P16,   RENDER_FMT_YUV420P16  }
++,  { AV_PIX_FMT_UYVY422,     RENDER_FMT_UYVY422    }
++,  { AV_PIX_FMT_YUYV422,     RENDER_FMT_YUYV422    }
++,  { AV_PIX_FMT_VAAPI_VLD,   RENDER_FMT_VAAPI      }
++,  { AV_PIX_FMT_DXVA2_VLD,   RENDER_FMT_DXVA       }
++,  { AV_PIX_FMT_NONE     ,   RENDER_FMT_NONE       }
+ };
+ 
+ ERenderFormat CDVDCodecUtils::EFormatFromPixfmt(int fmt)
+ {
+-  for(const EFormatMap *p = g_format_map; p->pix_fmt != PIX_FMT_NONE; ++p)
++  for(const EFormatMap *p = g_format_map; p->pix_fmt != AV_PIX_FMT_NONE; ++p)
+   {
+     if(p->pix_fmt == fmt)
+       return p->format;
+@@ -431,10 +431,10 @@ ERenderFormat CDVDCodecUtils::EFormatFro
+ 
+ int CDVDCodecUtils::PixfmtFromEFormat(ERenderFormat fmt)
+ {
+-  for(const EFormatMap *p = g_format_map; p->pix_fmt != PIX_FMT_NONE; ++p)
++  for(const EFormatMap *p = g_format_map; p->pix_fmt != AV_PIX_FMT_NONE; ++p)
+   {
+     if(p->format == fmt)
+       return p->pix_fmt;
+   }
+-  return PIX_FMT_NONE;
++  return AV_PIX_FMT_NONE;
+ }
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.cpp
+@@ -77,8 +77,8 @@ enum DecoderState
+   STATE_SW_MULTI
+ };
+ 
+-enum PixelFormat CDVDVideoCodecFFmpeg::GetFormat( struct AVCodecContext * avctx
+-                                                , const PixelFormat * fmt )
++enum AVPixelFormat CDVDVideoCodecFFmpeg::GetFormat( struct AVCodecContext * avctx
++                                                , const AVPixelFormat * fmt )
+ {
+   CDVDVideoCodecFFmpeg* ctx  = (CDVDVideoCodecFFmpeg*)avctx->opaque;
+ 
+@@ -104,8 +104,8 @@ enum PixelFormat CDVDVideoCodecFFmpeg::G
+     avctx->hwaccel_context = 0;
+   }
+ 
+-  const PixelFormat * cur = fmt;
+-  while(*cur != PIX_FMT_NONE)
++  const AVPixelFormat * cur = fmt;
++  while(*cur != AV_PIX_FMT_NONE)
+   {
+ #ifdef HAVE_LIBVDPAU
+     if(VDPAU::CDecoder::IsVDPAUFormat(*cur) && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVDPAU))
+@@ -137,7 +137,7 @@ enum PixelFormat CDVDVideoCodecFFmpeg::G
+ #endif
+ #ifdef HAVE_LIBVA
+     // mpeg4 vaapi decoding is disabled
+-    if(*cur == PIX_FMT_VAAPI_VLD && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVAAPI))
++    if(*cur == AV_PIX_FMT_VAAPI_VLD && CSettings::GetInstance().GetBool(CSettings::SETTING_VIDEOPLAYER_USEVAAPI))
+     {
+       VAAPI::CDecoder* dec = new VAAPI::CDecoder();
+       if(dec->Open(avctx, ctx->m_pCodecContext, *cur, ctx->m_uSurfacesCount) == true)
+@@ -214,11 +214,11 @@ bool CDVDVideoCodecFFmpeg::Open(CDVDStre
+ 
+   for(std::vector<ERenderFormat>::iterator it = options.m_formats.begin(); it != options.m_formats.end(); ++it)
+   {
+-    m_formats.push_back((PixelFormat)CDVDCodecUtils::PixfmtFromEFormat(*it));
++    m_formats.push_back((AVPixelFormat)CDVDCodecUtils::PixfmtFromEFormat(*it));
+     if(*it == RENDER_FMT_YUV420P)
+-      m_formats.push_back(PIX_FMT_YUVJ420P);
++      m_formats.push_back(AV_PIX_FMT_YUVJ420P);
+   }
+-  m_formats.push_back(PIX_FMT_NONE); /* always add none to get a terminated list in ffmpeg world */
++  m_formats.push_back(AV_PIX_FMT_NONE); /* always add none to get a terminated list in ffmpeg world */
+ 
+   pCodec = avcodec_find_decoder(hints.codec);
+ 
+@@ -655,7 +655,7 @@ bool CDVDVideoCodecFFmpeg::GetPictureCom
+   pDvdVideoPicture->color_transfer = m_pCodecContext->color_trc;
+   pDvdVideoPicture->color_matrix = m_pCodecContext->colorspace;
+   if(m_pCodecContext->color_range == AVCOL_RANGE_JPEG
+-  || m_pCodecContext->pix_fmt     == PIX_FMT_YUVJ420P)
++  || m_pCodecContext->pix_fmt     == AV_PIX_FMT_YUVJ420P)
+     pDvdVideoPicture->color_range = 1;
+   else
+     pDvdVideoPicture->color_range = 0;
+@@ -738,8 +738,8 @@ bool CDVDVideoCodecFFmpeg::GetPicture(DV
+   pDvdVideoPicture->iFlags |= pDvdVideoPicture->data[0] ? 0 : DVP_FLAG_DROPPED;
+   pDvdVideoPicture->extended_format = 0;
+ 
+-  PixelFormat pix_fmt;
+-  pix_fmt = (PixelFormat)m_pFrame->format;
++  AVPixelFormat pix_fmt;
++  pix_fmt = (AVPixelFormat)m_pFrame->format;
+ 
+   pDvdVideoPicture->format = CDVDCodecUtils::EFormatFromPixfmt(pix_fmt);
+   return true;
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecFFmpeg.h
+@@ -46,7 +46,7 @@ public:
+     public:
+              IHardwareDecoder() {}
+     virtual ~IHardwareDecoder() {};
+-    virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces) = 0;
++    virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces) = 0;
+     virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame) = 0;
+     virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture) = 0;
+     virtual int  Check     (AVCodecContext* avctx) = 0;
+@@ -77,7 +77,7 @@ public:
+   void               SetHardware(IHardwareDecoder* hardware);
+ 
+ protected:
+-  static enum PixelFormat GetFormat(struct AVCodecContext * avctx, const PixelFormat * fmt);
++  static enum AVPixelFormat GetFormat(struct AVCodecContext * avctx, const AVPixelFormat * fmt);
+ 
+   int  FilterOpen(const std::string& filters, bool scale);
+   void FilterClose();
+@@ -119,7 +119,7 @@ protected:
+   int m_iLastKeyframe;
+   double m_dts;
+   bool   m_started;
+-  std::vector<PixelFormat> m_formats;
++  std::vector<AVPixelFormat> m_formats;
+   double m_decoderPts;
+   int    m_skippedDeint;
+   bool   m_requestSkipDeint;
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DVDVideoCodecVDA.cpp
+@@ -554,11 +554,11 @@ void CDVDVideoCodecVDA::DisplayQueuePop(
+ 
+ void CDVDVideoCodecVDA::UYVY422_to_YUV420P(uint8_t *yuv422_ptr, int yuv422_stride, DVDVideoPicture *picture)
+ {
+-  // convert PIX_FMT_UYVY422 to PIX_FMT_YUV420P.
++  // convert AV_PIX_FMT_UYVY422 to AV_PIX_FMT_YUV420P.
+   struct SwsContext *swcontext = sws_getContext(
+-    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_UYVY422, 
+-    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_YUV420P, 
+-    SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_UYVY422,
++    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_YUV420P,
++    SWS_FAST_BILINEAR, NULL, NULL, NULL);
+   if (swcontext)
+   {
+     uint8_t  *src[] = { yuv422_ptr, 0, 0, 0 };
+@@ -574,11 +574,11 @@ void CDVDVideoCodecVDA::UYVY422_to_YUV42
+ 
+ void CDVDVideoCodecVDA::BGRA_to_YUV420P(uint8_t *bgra_ptr, int bgra_stride, DVDVideoPicture *picture)
+ {
+-  // convert PIX_FMT_BGRA to PIX_FMT_YUV420P.
++  // convert AV_PIX_FMT_BGRA to AV_PIX_FMT_YUV420P.
+   struct SwsContext *swcontext = sws_getContext(
+-    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_BGRA, 
+-    m_videobuffer.iWidth, m_videobuffer.iHeight, PIX_FMT_YUV420P, 
+-    SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_BGRA,
++    m_videobuffer.iWidth, m_videobuffer.iHeight, AV_PIX_FMT_YUV420P,
++    SWS_FAST_BILINEAR, NULL, NULL, NULL);
+   if (swcontext)
+   {
+     uint8_t  *src[] = { bgra_ptr, 0, 0, 0 };
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.cpp
+@@ -886,7 +886,7 @@ static bool CheckCompatibility(AVCodecCo
+   return true;
+ }
+ 
+-bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum PixelFormat fmt, unsigned int surfaces)
++bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum AVPixelFormat fmt, unsigned int surfaces)
+ {
+   if (!CheckCompatibility(avctx))
+     return false;
+@@ -1135,9 +1135,9 @@ bool CDecoder::OpenDecoder()
+   return true;
+ }
+ 
+-bool CDecoder::Supports(enum PixelFormat fmt)
++bool CDecoder::Supports(enum AVPixelFormat fmt)
+ {
+-  if(fmt == PIX_FMT_DXVA2_VLD)
++  if(fmt == AV_PIX_FMT_DXVA2_VLD)
+     return true;
+   return false;
+ }
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/DXVA.h
+@@ -141,7 +141,7 @@ class CDecoder
+ public:
+   CDecoder();
+  ~CDecoder();
+-  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces);
++  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces);
+   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
+   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
+   virtual int  Check     (AVCodecContext* avctx);
+@@ -154,7 +154,7 @@ public:
+   int   GetBuffer(AVCodecContext *avctx, AVFrame *pic, int flags);
+   void  RelBuffer(uint8_t *data);
+ 
+-  static bool      Supports(enum PixelFormat fmt);
++  static bool      Supports(enum AVPixelFormat fmt);
+ 
+   void CloseDXVADecoder();
+ 
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.cpp
+@@ -479,7 +479,7 @@ CDecoder::~CDecoder()
+   Close();
+ }
+ 
+-bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat fmt, unsigned int surfaces)
++bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat fmt, unsigned int surfaces)
+ {
+   // don't support broken wrappers by default
+   // nvidia cards with a vaapi to vdpau wrapper
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VAAPI.h
+@@ -406,7 +406,7 @@ public:
+   CDecoder();
+   virtual ~CDecoder();
+ 
+-  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
++  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
+   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
+   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
+   virtual void Reset();
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.cpp
+@@ -186,7 +186,7 @@ void CDecoder::Close()
+   m_bitstream = NULL;
+ }
+ 
+-bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum PixelFormat fmt, unsigned int surfaces)
++bool CDecoder::Open(AVCodecContext *avctx, AVCodecContext* mainctx, enum AVPixelFormat fmt, unsigned int surfaces)
+ {
+   Close();
+ 
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDA.h
+@@ -35,7 +35,7 @@ class CDecoder
+ public:
+   CDecoder();
+  ~CDecoder();
+-  virtual bool Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
++  virtual bool Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
+   virtual int Decode(AVCodecContext* avctx, AVFrame* frame);
+   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
+   virtual int Check(AVCodecContext* avctx);
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.cpp
+@@ -486,7 +486,7 @@ CDecoder::CDecoder() : m_vdpauOutput(&m_
+   m_vdpauConfig.context = 0;
+ }
+ 
+-bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat fmt, unsigned int surfaces)
++bool CDecoder::Open(AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat fmt, unsigned int surfaces)
+ {
+   // check if user wants to decode this format with VDPAU
+   std::string gpuvendor = g_Windowing.GetRenderVendor();
+@@ -760,7 +760,7 @@ int CDecoder::Check(AVCodecContext* avct
+   return 0;
+ }
+ 
+-bool CDecoder::IsVDPAUFormat(PixelFormat format)
++bool CDecoder::IsVDPAUFormat(AVPixelFormat format)
+ {
+   if (format == AV_PIX_FMT_VDPAU)
+     return true;
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/VDPAU.h
+@@ -556,7 +556,7 @@ public:
+   CDecoder();
+   virtual ~CDecoder();
+ 
+-  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum PixelFormat, unsigned int surfaces = 0);
++  virtual bool Open      (AVCodecContext* avctx, AVCodecContext* mainctx, const enum AVPixelFormat, unsigned int surfaces = 0);
+   virtual int  Decode    (AVCodecContext* avctx, AVFrame* frame);
+   virtual bool GetPicture(AVCodecContext* avctx, AVFrame* frame, DVDVideoPicture* picture);
+   virtual void Reset();
+@@ -571,7 +571,7 @@ public:
+   bool Supports(VdpVideoMixerFeature feature);
+   bool Supports(EINTERLACEMETHOD method);
+   EINTERLACEMETHOD AutoInterlaceMethod();
+-  static bool IsVDPAUFormat(PixelFormat fmt);
++  static bool IsVDPAUFormat(AVPixelFormat fmt);
+ 
+   static void FFReleaseBuffer(void *opaque, uint8_t *data);
+   static int FFGetBuffer(AVCodecContext *avctx, AVFrame *pic, int flags);
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
+@@ -1638,7 +1638,7 @@ void CDVDDemuxFFmpeg::ParsePacket(AVPack
+ 
+   // for video we need a decoder to get desired information into codec context
+   if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO && st->codec->extradata &&
+-      (!st->codec->width || st->codec->pix_fmt == PIX_FMT_NONE))
++      (!st->codec->width || st->codec->pix_fmt == AV_PIX_FMT_NONE))
+   {
+     // open a decoder, it will be cleared down by ffmpeg on closing the stream
+     if (!st->codec->codec)
+@@ -1695,7 +1695,7 @@ bool CDVDDemuxFFmpeg::IsVideoReady()
+       st = m_pFormatContext->streams[idx];
+       if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO)
+       {
+-        if (st->codec->width && st->codec->pix_fmt != PIX_FMT_NONE)
++        if (st->codec->width && st->codec->pix_fmt != AV_PIX_FMT_NONE)
+           return true;
+         hasVideo = true;
+       }
+@@ -1708,7 +1708,7 @@ bool CDVDDemuxFFmpeg::IsVideoReady()
+       st = m_pFormatContext->streams[i];
+       if (st->codec->codec_type == AVMEDIA_TYPE_VIDEO)
+       {
+-        if (st->codec->width && st->codec->pix_fmt != PIX_FMT_NONE)
++        if (st->codec->width && st->codec->pix_fmt != AV_PIX_FMT_NONE)
+           return true;
+         hasVideo = true;
+       }
+Index: xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDFileInfo.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/dvdplayer/DVDFileInfo.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/dvdplayer/DVDFileInfo.cpp
+@@ -275,7 +275,7 @@ bool CDVDFileInfo::ExtractThumb(const st
+ 
+             uint8_t *pOutBuf = new uint8_t[nWidth * nHeight * 4];
+             struct SwsContext *context = sws_getContext(picture.iWidth, picture.iHeight,
+-                  PIX_FMT_YUV420P, nWidth, nHeight, PIX_FMT_BGRA, SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++                  AV_PIX_FMT_YUV420P, nWidth, nHeight, AV_PIX_FMT_BGRA, SWS_FAST_BILINEAR, NULL, NULL, NULL);
+ 
+             if (context)
+             {
+Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGL.cpp
+@@ -2932,7 +2932,7 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
+   }
+   else if (m_format == RENDER_FMT_NV12)
+   {
+-    srcFormat = PIX_FMT_NV12;
++    srcFormat = AV_PIX_FMT_NV12;
+     for (int i = 0; i < 2; i++)
+     {
+       src[i]       = im->plane[i];
+@@ -2941,13 +2941,13 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
+   }
+   else if (m_format == RENDER_FMT_YUYV422)
+   {
+-    srcFormat    = PIX_FMT_YUYV422;
++    srcFormat    = AV_PIX_FMT_YUYV422;
+     src[0]       = im->plane[0];
+     srcStride[0] = im->stride[0];
+   }
+   else if (m_format == RENDER_FMT_UYVY422)
+   {
+-    srcFormat    = PIX_FMT_UYVY422;
++    srcFormat    = AV_PIX_FMT_UYVY422;
+     src[0]       = im->plane[0];
+     srcStride[0] = im->stride[0];
+   }
+@@ -2965,8 +2965,8 @@ void CLinuxRendererGL::ToRGBFrame(YV12Im
+ 
+   m_context = sws_getCachedContext(m_context,
+                                                  im->width, im->height, (AVPixelFormat)srcFormat,
+-                                                 im->width, im->height, (AVPixelFormat)PIX_FMT_BGRA,
+-                                                 SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++                                                 im->width, im->height, (AVPixelFormat)AV_PIX_FMT_BGRA,
++                                                 SWS_FAST_BILINEAR, NULL, NULL, NULL);
+ 
+   uint8_t *dst[]       = { m_rgbBuffer, 0, 0, 0 };
+   int      dstStride[] = { (int)m_sourceWidth * 4, 0, 0, 0 };
+@@ -2995,7 +2995,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
+ 
+   if (m_format == RENDER_FMT_YUV420P)
+   {
+-    srcFormat = PIX_FMT_YUV420P;
++    srcFormat = AV_PIX_FMT_YUV420P;
+     for (int i = 0; i < 3; i++)
+     {
+       srcTop[i]       = im->plane[i];
+@@ -3006,7 +3006,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
+   }
+   else if (m_format == RENDER_FMT_NV12)
+   {
+-    srcFormat = PIX_FMT_NV12;
++    srcFormat = AV_PIX_FMT_NV12;
+     for (int i = 0; i < 2; i++)
+     {
+       srcTop[i]       = im->plane[i];
+@@ -3017,7 +3017,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
+   }
+   else if (m_format == RENDER_FMT_YUYV422)
+   {
+-    srcFormat       = PIX_FMT_YUYV422;
++    srcFormat       = AV_PIX_FMT_YUYV422;
+     srcTop[0]       = im->plane[0];
+     srcStrideTop[0] = im->stride[0] * 2;
+     srcBot[0]       = im->plane[0] + im->stride[0];
+@@ -3025,7 +3025,7 @@ void CLinuxRendererGL::ToRGBFields(YV12I
+   }
+   else if (m_format == RENDER_FMT_UYVY422)
+   {
+-    srcFormat       = PIX_FMT_UYVY422;
++    srcFormat       = AV_PIX_FMT_UYVY422;
+     srcTop[0]       = im->plane[0];
+     srcStrideTop[0] = im->stride[0] * 2;
+     srcBot[0]       = im->plane[0] + im->stride[0];
+@@ -3045,8 +3045,8 @@ void CLinuxRendererGL::ToRGBFields(YV12I
+ 
+   m_context = sws_getCachedContext(m_context,
+                                                  im->width, im->height >> 1, (AVPixelFormat)srcFormat,
+-                                                 im->width, im->height >> 1, (AVPixelFormat)PIX_FMT_BGRA,
+-                                                 SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++                                                 im->width, im->height >> 1, (AVPixelFormat)AV_PIX_FMT_BGRA,
++                                                 SWS_FAST_BILINEAR, NULL, NULL, NULL);
+   uint8_t *dstTop[]    = { m_rgbBuffer, 0, 0, 0 };
+   uint8_t *dstBot[]    = { m_rgbBuffer + m_sourceWidth * m_sourceHeight * 2, 0, 0, 0 };
+   int      dstStride[] = { (int)m_sourceWidth * 4, 0, 0, 0 };
+Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/LinuxRendererGLES.cpp
+@@ -2006,8 +2006,8 @@ void CLinuxRendererGLES::UploadYV12Textu
+ #endif
+     {
+       m_sw_context = sws_getCachedContext(m_sw_context,
+-        im->width, im->height, PIX_FMT_YUV420P,
+-        im->width, im->height, PIX_FMT_RGBA,
++        im->width, im->height, AV_PIX_FMT_YUV420P,
++        im->width, im->height, AV_PIX_FMT_RGBA,
+         SWS_FAST_BILINEAR, NULL, NULL, NULL);
+ 
+       uint8_t *src[]  = { im->plane[0], im->plane[1], im->plane[2], 0 };
+Index: xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/WinRenderer.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/cores/VideoRenderers/WinRenderer.cpp
++++ xbmc-16.0-Jarvis/xbmc/cores/VideoRenderers/WinRenderer.cpp
+@@ -94,16 +94,16 @@ CWinRenderer::~CWinRenderer()
+   UnInit();
+ }
+ 
+-static enum PixelFormat PixelFormatFromFormat(ERenderFormat format)
++static enum AVPixelFormat PixelFormatFromFormat(ERenderFormat format)
+ {
+-  if (format == RENDER_FMT_DXVA)      return PIX_FMT_NV12;
+-  if (format == RENDER_FMT_YUV420P)   return PIX_FMT_YUV420P;
+-  if (format == RENDER_FMT_YUV420P10) return PIX_FMT_YUV420P10;
+-  if (format == RENDER_FMT_YUV420P16) return PIX_FMT_YUV420P16;
+-  if (format == RENDER_FMT_NV12)      return PIX_FMT_NV12;
+-  if (format == RENDER_FMT_UYVY422)   return PIX_FMT_UYVY422;
+-  if (format == RENDER_FMT_YUYV422)   return PIX_FMT_YUYV422;
+-  return PIX_FMT_NONE;
++  if (format == RENDER_FMT_DXVA)      return AV_PIX_FMT_NV12;
++  if (format == RENDER_FMT_YUV420P)   return AV_PIX_FMT_YUV420P;
++  if (format == RENDER_FMT_YUV420P10) return AV_PIX_FMT_YUV420P10;
++  if (format == RENDER_FMT_YUV420P16) return AV_PIX_FMT_YUV420P16;
++  if (format == RENDER_FMT_NV12)      return AV_PIX_FMT_NV12;
++  if (format == RENDER_FMT_UYVY422)   return AV_PIX_FMT_UYVY422;
++  if (format == RENDER_FMT_YUYV422)   return AV_PIX_FMT_YUYV422;
++  return AV_PIX_FMT_NONE;
+ }
+ 
+ void CWinRenderer::ManageTextures()
+@@ -719,13 +719,13 @@ void CWinRenderer::Render(DWORD flags)
+ 
+ void CWinRenderer::RenderSW()
+ {
+-  enum PixelFormat format = PixelFormatFromFormat(m_format);
++  enum AVPixelFormat format = PixelFormatFromFormat(m_format);
+ 
+   // 1. convert yuv to rgb
+   m_sw_scale_ctx = sws_getCachedContext(m_sw_scale_ctx,
+                                         m_sourceWidth, m_sourceHeight, format,
+-                                        m_sourceWidth, m_sourceHeight, PIX_FMT_BGRA,
+-                                        SWS_FAST_BILINEAR | SwScaleCPUFlags(), NULL, NULL, NULL);
++                                        m_sourceWidth, m_sourceHeight, AV_PIX_FMT_BGRA,
++                                        SWS_FAST_BILINEAR, NULL, NULL, NULL);
+ 
+   YUVBuffer* buf = (YUVBuffer*)m_VideoBuffers[m_iYV12RenderBuffer];
+ 
+Index: xbmc-16.0-Jarvis/xbmc/pictures/Picture.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/pictures/Picture.cpp
++++ xbmc-16.0-Jarvis/xbmc/pictures/Picture.cpp
+@@ -342,9 +342,9 @@ bool CPicture::ScaleImage(uint8_t *in_pi
+                           uint8_t *out_pixels, unsigned int out_width, unsigned int out_height, unsigned int out_pitch,
+                           CPictureScalingAlgorithm::Algorithm scalingAlgorithm /* = CPictureScalingAlgorithm::NoAlgorithm */)
+ {
+-  struct SwsContext *context = sws_getContext(in_width, in_height, PIX_FMT_BGRA,
+-                                                         out_width, out_height, PIX_FMT_BGRA,
+-                                                         CPictureScalingAlgorithm::ToSwscale(scalingAlgorithm) | SwScaleCPUFlags(), NULL, NULL, NULL);
++  struct SwsContext *context = sws_getContext(in_width, in_height, AV_PIX_FMT_BGRA,
++                                                         out_width, out_height, AV_PIX_FMT_BGRA,
++                                                         CPictureScalingAlgorithm::ToSwscale(scalingAlgorithm), NULL, NULL, NULL);
+ 
+   uint8_t *src[] = { in_pixels, 0, 0, 0 };
+   int     srcStride[] = { (int)in_pitch, 0, 0, 0 };
+Index: xbmc-16.0-Jarvis/xbmc/video/FFmpegVideoDecoder.cpp
+===================================================================
+--- xbmc-16.0-Jarvis.orig/xbmc/video/FFmpegVideoDecoder.cpp
++++ xbmc-16.0-Jarvis/xbmc/video/FFmpegVideoDecoder.cpp
+@@ -252,7 +252,7 @@ bool FFmpegVideoDecoder::nextFrame( CBas
+       return false;
+ 
+     // Due to a bug in swsscale we need to allocate one extra line of data
+-    if ( avpicture_alloc( m_pFrameRGB, PIX_FMT_RGB32, m_frameRGBwidth, m_frameRGBheight + 1 ) < 0 )
++    if ( avpicture_alloc( m_pFrameRGB, AV_PIX_FMT_RGB32, m_frameRGBwidth, m_frameRGBheight + 1 ) < 0 )
+       return false;
+   }
+ 
+@@ -287,7 +287,7 @@ bool FFmpegVideoDecoder::nextFrame( CBas
+ 
+   // We got the video frame, render it into the picture buffer
+   struct SwsContext * context = sws_getContext( m_pCodecCtx->width, m_pCodecCtx->height, m_pCodecCtx->pix_fmt,
+-                           m_frameRGBwidth, m_frameRGBheight, PIX_FMT_RGB32, SWS_FAST_BILINEAR, NULL, NULL, NULL );
++                           m_frameRGBwidth, m_frameRGBheight, AV_PIX_FMT_RGB32, SWS_FAST_BILINEAR, NULL, NULL, NULL );
+ 
+   sws_scale( context, m_pFrame->data, m_pFrame->linesize, 0, m_pCodecCtx->height,
+                                                                      m_pFrameRGB->data, m_pFrameRGB->linesize );
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0007-https-github.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0007-https-github.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch
new file mode 100644
index 0000000..89a06a5
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0007-https-github.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch
@@ -0,0 +1,85 @@
+From 1ec2dca41d4e50d06f35a98f2fef6f81fd0571ae Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 19 Feb 2016 10:41:36 +0100
+Subject: [PATCH 7/7] 
+ https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/kodi/patches/kodi-999.42-KEY_EPG.patch
+
+---
+ system/keymaps/keyboard.xml            | 2 ++
+ xbmc/input/XBMC_keysym.h               | 1 +
+ xbmc/input/XBMC_keytable.cpp           | 1 +
+ xbmc/input/XBMC_vkeys.h                | 1 +
+ xbmc/input/linux/LinuxInputDevices.cpp | 1 +
+ 5 files changed, 6 insertions(+)
+
+diff --git a/system/keymaps/keyboard.xml b/system/keymaps/keyboard.xml
+index 9833cff..4bcc1ce 100644
+--- a/system/keymaps/keyboard.xml
++++ b/system/keymaps/keyboard.xml
+@@ -95,6 +95,7 @@
+       <sleep>ActivateWindow(shutdownmenu)</sleep>
+       <!-- PVR windows -->
+       <e>ActivateWindow(TVGuide)</e>
++      <epg>ActivateWindow(TVGuide)</epg>
+       <h>ActivateWindow(TVChannels)</h>
+       <j>ActivateWindow(RadioChannels)</j>
+       <k>ActivateWindow(TVRecordings)</k>
+@@ -246,6 +247,7 @@
+   <TVGuide>
+     <keyboard>
+       <e>PreviousMenu</e>
++      <epg>PreviousMenu</epg>
+     </keyboard>
+   </TVGuide>
+   <MyFiles>
+diff --git a/xbmc/input/XBMC_keysym.h b/xbmc/input/XBMC_keysym.h
+index 89c21f5..e7410ec 100644
+--- a/xbmc/input/XBMC_keysym.h
++++ b/xbmc/input/XBMC_keysym.h
+@@ -229,6 +229,7 @@ typedef enum {
+   XBMCK_FAVORITES   = 0x14d,
+   XBMCK_HOMEPAGE    = 0x14e,
+   XBMCK_CONFIG      = 0x14f,
++  XBMCK_EPG         = 0x150,
+ 
+   // Add any other keys here
+ 
+diff --git a/xbmc/input/XBMC_keytable.cpp b/xbmc/input/XBMC_keytable.cpp
+index 4d05464..14fd384 100644
+--- a/xbmc/input/XBMC_keytable.cpp
++++ b/xbmc/input/XBMC_keytable.cpp
+@@ -243,6 +243,7 @@ static const XBMCKEYTABLE XBMCKeyTable[] =
+ , { XBMCK_FAVORITES,              0,    0, XBMCVK_FAVORITES,     "favorites" }
+ , { XBMCK_HOMEPAGE ,              0,    0, XBMCVK_HOMEPAGE,      "homepage" }
+ , { XBMCK_CONFIG,                 0,    0, XBMCVK_CONFIG,        "config" }
++, { XBMCK_EPG   ,                 0,    0, XBMCVK_EPG,           "epg" }
+ };
+ 
+ static int XBMCKeyTableSize = sizeof(XBMCKeyTable)/sizeof(XBMCKEYTABLE);
+diff --git a/xbmc/input/XBMC_vkeys.h b/xbmc/input/XBMC_vkeys.h
+index af114c9..4e3787c 100644
+--- a/xbmc/input/XBMC_vkeys.h
++++ b/xbmc/input/XBMC_vkeys.h
+@@ -221,6 +221,7 @@ typedef enum {
+   XBMCVK_FAVORITES      = 0xE9,
+   XBMCVK_HOMEPAGE       = 0xEA,
+   XBMCVK_CONFIG         = 0xEB,
++  XBMCVK_EPG            = 0xEC,
+ 
+   XBMCVK_LAST           = 0xFF
+ } XBMCVKey;
+diff --git a/xbmc/input/linux/LinuxInputDevices.cpp b/xbmc/input/linux/LinuxInputDevices.cpp
+index 9f3e866..73f338f 100644
+--- a/xbmc/input/linux/LinuxInputDevices.cpp
++++ b/xbmc/input/linux/LinuxInputDevices.cpp
+@@ -268,6 +268,7 @@ KeyMap keyMap[] = {
+   { KEY_FILE          , XBMCK_LAUNCH_FILE_BROWSER},
+   { KEY_SELECT        , XBMCK_RETURN      },
+   { KEY_CONFIG        , XBMCK_CONFIG      },
++  { KEY_EPG           , XBMCK_EPG         },
+   // The Little Black Box Remote Additions
+   { 384               , XBMCK_LEFT        }, // Red
+   { 378               , XBMCK_RIGHT       }, // Green
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
new file mode 100644
index 0000000..dc428d6
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
@@ -0,0 +1,82 @@
+From 78571ed421e3fd3d5244cd76670e4e1bab69132f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 May 2016 17:30:28 +0200
+Subject: [PATCH 1/1] Fix nullpadding issue when reading certain id3v1 tags
+
+backported from upstream commit to master branch:
+
+https://github.com/xbmc/xbmc/commit/cdabf9dd9e82f4b2d639fb769db08227a7c52046
+
+to fix problems with taglib-1.11:
+
+http://trac.kodi.tv/ticket/16454
+https://github.com/taglib/taglib/issues/741#issuecomment-218059031
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/music/tags/TagLoaderTagLib.cpp | 21 ---------------------
+ xbmc/music/tags/TagLoaderTagLib.h   |  3 +++
+ 2 files changed, 3 insertions(+), 21 deletions(-)
+
+diff --git a/xbmc/music/tags/TagLoaderTagLib.cpp b/xbmc/music/tags/TagLoaderTagLib.cpp
+index b78a591..0fc346a 100644
+--- a/xbmc/music/tags/TagLoaderTagLib.cpp
++++ b/xbmc/music/tags/TagLoaderTagLib.cpp
+@@ -46,31 +46,12 @@
+ #include "utils/URIUtils.h"
+ #include "utils/log.h"
+ #include "utils/StringUtils.h"
+-#include "utils/CharsetConverter.h"
+ #include "utils/Base64.h"
+ #include "settings/AdvancedSettings.h"
+ 
+ using namespace TagLib;
+ using namespace MUSIC_INFO;
+ 
+-template<class T>
+-class TagStringHandler : public T
+-{
+-public:
+-  TagStringHandler() {}
+-  virtual ~TagStringHandler() {}
+-  virtual String parse(const ByteVector &data) const
+-  {
+-    std::string strSource(data.data(), data.size());
+-    std::string strUTF8;
+-    g_charsetConverter.unknownToUTF8(strSource, strUTF8);
+-    return String(strUTF8, String::UTF8);
+-  }
+-};
+-
+-static const TagStringHandler<ID3v1::StringHandler> ID3v1StringHandler;
+-static const TagStringHandler<ID3v2::Latin1StringHandler> ID3v2StringHandler;
+-
+ CTagLoaderTagLib::CTagLoaderTagLib()
+ {
+ }
+@@ -824,8 +805,6 @@ bool CTagLoaderTagLib::Load(const std::string& strFileName, CMusicInfoTag& tag,
+     return false;
+   }
+ 
+-  ID3v1::Tag::setStringHandler(&ID3v1StringHandler);
+-  ID3v2::Tag::setLatin1StringHandler(&ID3v2StringHandler);
+   TagLib::File*              file = NULL;
+   TagLib::APE::File*         apeFile = NULL;
+   TagLib::ASF::File*         asfFile = NULL;
+diff --git a/xbmc/music/tags/TagLoaderTagLib.h b/xbmc/music/tags/TagLoaderTagLib.h
+index f83ea4f..0edb84f 100644
+--- a/xbmc/music/tags/TagLoaderTagLib.h
++++ b/xbmc/music/tags/TagLoaderTagLib.h
+@@ -44,6 +44,9 @@
+ #include <taglib/mp4tag.h>
+ #include "ImusicInfoTagLoader.h"
+ 
++#include <string>
++#include <vector>
++
+ namespace MUSIC_INFO
+ {
+   class CMusicInfoTag;
+-- 
+2.8.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
new file mode 100644
index 0000000..a8de36c
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
@@ -0,0 +1,1438 @@
+From 8f82e51563f0e1bc9b7a8adf669ad2b66e7ce3e5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 28 Apr 2016 17:17:40 +0200
+Subject: [PATCH] lib/cximage-6.0: fix compilation with gcc6
+
+For a quick fix I renamed min() to cxmin() and max() to cxmax() to
+prevent the conflict with the gcc definition.
+
+Forum thread for reference:
+http://forum.kodi.tv/showthread.php?tid=263884
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream: https://github.com/xbmc/xbmc/pull/9703)
+---
+ lib/cximage-6.0/CxImage/ximabmp.cpp  |   6 +-
+ lib/cximage-6.0/CxImage/ximadef.h    |   8 +-
+ lib/cximage-6.0/CxImage/ximadsp.cpp  | 182 +++++++++++++++++------------------
+ lib/cximage-6.0/CxImage/ximage.cpp   |   4 +-
+ lib/cximage-6.0/CxImage/ximagif.cpp  |   6 +-
+ lib/cximage-6.0/CxImage/ximahist.cpp |  12 +--
+ lib/cximage-6.0/CxImage/ximaint.cpp  |   8 +-
+ lib/cximage-6.0/CxImage/ximaiter.h   |   4 +-
+ lib/cximage-6.0/CxImage/ximajbg.cpp  |   2 +-
+ lib/cximage-6.0/CxImage/ximapal.cpp  |  14 +--
+ lib/cximage-6.0/CxImage/ximapng.cpp  |  12 +--
+ lib/cximage-6.0/CxImage/ximaraw.cpp  |   4 +-
+ lib/cximage-6.0/CxImage/ximasel.cpp  |  50 +++++-----
+ lib/cximage-6.0/CxImage/ximath.cpp   |   8 +-
+ lib/cximage-6.0/CxImage/ximatif.cpp  |   6 +-
+ lib/cximage-6.0/CxImage/ximatran.cpp | 138 +++++++++++++-------------
+ lib/cximage-6.0/CxImage/ximawnd.cpp  |  16 +--
+ 17 files changed, 236 insertions(+), 244 deletions(-)
+
+diff --git a/lib/cximage-6.0/CxImage/ximabmp.cpp b/lib/cximage-6.0/CxImage/ximabmp.cpp
+index 726ff91..55842b1 100644
+--- a/lib/cximage-6.0/CxImage/ximabmp.cpp
++++ b/lib/cximage-6.0/CxImage/ximabmp.cpp
+@@ -46,7 +46,7 @@ bool CxImageBMP::Encode(CxFile * hFile)
+ 		bihtoh(&infohdr);
+ 
+ 		// Write the file header
+-		hFile->Write(&hdr,min(14,sizeof(BITMAPFILEHEADER)),1);
++		hFile->Write(&hdr,cxmin(14,sizeof(BITMAPFILEHEADER)),1);
+ 		hFile->Write(&infohdr,sizeof(BITMAPINFOHEADER),1);
+ 		 //and DIB+ALPHA interlaced
+ 		BYTE *srcalpha = AlphaGetPointer();
+@@ -64,7 +64,7 @@ bool CxImageBMP::Encode(CxFile * hFile)
+ #endif //CXIMAGE_SUPPORT_ALPHA
+ 	{
+ 		// Write the file header
+-		hFile->Write(&hdr,min(14,sizeof(BITMAPFILEHEADER)),1);
++		hFile->Write(&hdr,cxmin(14,sizeof(BITMAPFILEHEADER)),1);
+ 		//copy attributes
+ 		memcpy(pDib,&head,sizeof(BITMAPINFOHEADER));
+ 		bihtoh((BITMAPINFOHEADER*)pDib);
+@@ -86,7 +86,7 @@ bool CxImageBMP::Decode(CxFile * hFile)
+ 	BITMAPFILEHEADER   bf;
+ 	DWORD off = hFile->Tell(); //<CSC>
+   cx_try {
+-	if (hFile->Read(&bf,min(14,sizeof(bf)),1)==0) cx_throw("Not a BMP");
++	if (hFile->Read(&bf,cxmin(14,sizeof(bf)),1)==0) cx_throw("Not a BMP");
+ 
+ 	bf.bfSize = my_ntohl(bf.bfSize); 
+ 	bf.bfOffBits = my_ntohl(bf.bfOffBits); 
+diff --git a/lib/cximage-6.0/CxImage/ximadef.h b/lib/cximage-6.0/CxImage/ximadef.h
+index fe383bf..53ea452 100644
+--- a/lib/cximage-6.0/CxImage/ximadef.h
++++ b/lib/cximage-6.0/CxImage/ximadef.h
+@@ -53,12 +53,8 @@
+  #define CXIMAGE_SUPPORT_WINDOWS 0
+ #endif
+ 
+-#ifndef min
+-#define min(a,b) (((a)<(b))?(a):(b))
+-#endif
+-#ifndef max
+-#define max(a,b) (((a)>(b))?(a):(b))
+-#endif
++#define cxmin(a,b) (((a)<(b))?(a):(b))
++#define cxmax(a,b) (((a)>(b))?(a):(b))
+ 
+ #ifndef PI
+  #define PI 3.141592653589793f
+diff --git a/lib/cximage-6.0/CxImage/ximadsp.cpp b/lib/cximage-6.0/CxImage/ximadsp.cpp
+index 8425bb2..813253b 100644
+--- a/lib/cximage-6.0/CxImage/ximadsp.cpp
++++ b/lib/cximage-6.0/CxImage/ximadsp.cpp
+@@ -389,8 +389,8 @@ RGBQUAD CxImage::RGBtoHSL(RGBQUAD lRGBColor)
+ 	G = lRGBColor.rgbGreen;
+ 	B = lRGBColor.rgbBlue;
+ 
+-	cMax = max( max(R,G), B);	/* calculate lightness */
+-	cMin = min( min(R,G), B);
++	cMax = cxmax( cxmax(R,G), B);	/* calculate lightness */
++	cMin = cxmin( cxmin(R,G), B);
+ 	L = (BYTE)((((cMax+cMin)*HSLMAX)+RGBMAX)/(2*RGBMAX));
+ 
+ 	if (cMax==cMin){			/* r=g=b --> achromatic case */
+@@ -489,9 +489,9 @@ RGBQUAD CxImage::YUVtoRGB(RGBQUAD lYUVColor)
+ 	G = (int)( Y - 0.344f * U - 0.714f * V);
+ 	B = (int)( Y + 1.770f * U);
+ 
+-	R= min(255,max(0,R));
+-	G= min(255,max(0,G));
+-	B= min(255,max(0,B));
++	R= cxmin(255,cxmax(0,R));
++	G= cxmin(255,cxmax(0,G));
++	B= cxmin(255,cxmax(0,B));
+ 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
+ 	return rgb;
+ }
+@@ -510,9 +510,9 @@ RGBQUAD CxImage::RGBtoYUV(RGBQUAD lRGBColor)
+ 	U = (int)((B-Y) * 0.565f + 128);
+ 	V = (int)((R-Y) * 0.713f + 128);
+ 
+-	Y= min(255,max(0,Y));
+-	U= min(255,max(0,U));
+-	V= min(255,max(0,V));
++	Y= cxmin(255,cxmax(0,Y));
++	U= cxmin(255,cxmax(0,U));
++	V= cxmin(255,cxmax(0,V));
+ 	RGBQUAD yuv={(BYTE)V,(BYTE)U,(BYTE)Y,0};
+ 	return yuv;
+ }
+@@ -528,9 +528,9 @@ RGBQUAD CxImage::YIQtoRGB(RGBQUAD lYIQColor)
+ 	G = (int)( Y - 0.273f * I - 0.647f * Q);
+ 	B = (int)( Y - 1.104f * I + 1.701f * Q);
+ 
+-	R= min(255,max(0,R));
+-	G= min(255,max(0,G));
+-	B= min(255,max(0,B));
++	R= cxmin(255,cxmax(0,R));
++	G= cxmin(255,cxmax(0,G));
++	B= cxmin(255,cxmax(0,B));
+ 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
+ 	return rgb;
+ }
+@@ -546,9 +546,9 @@ RGBQUAD CxImage::RGBtoYIQ(RGBQUAD lRGBColor)
+ 	I = (int)( 0.5960f * R - 0.2742f * G - 0.3219f * B + 128);
+ 	Q = (int)( 0.2109f * R - 0.5229f * G + 0.3120f * B + 128);
+ 
+-	Y= min(255,max(0,Y));
+-	I= min(255,max(0,I));
+-	Q= min(255,max(0,Q));
++	Y= cxmin(255,cxmax(0,Y));
++	I= cxmin(255,cxmax(0,I));
++	Q= cxmin(255,cxmax(0,Q));
+ 	RGBQUAD yiq={(BYTE)Q,(BYTE)I,(BYTE)Y,0};
+ 	return yiq;
+ }
+@@ -565,9 +565,9 @@ RGBQUAD CxImage::XYZtoRGB(RGBQUAD lXYZColor)
+ 	G = (int)( -0.969256f * X + 1.875992f * Y + 0.041556f * Z * k);
+ 	B = (int)(  0.055648f * X - 0.204043f * Y + 1.057311f * Z * k);
+ 
+-	R= min(255,max(0,R));
+-	G= min(255,max(0,G));
+-	B= min(255,max(0,B));
++	R= cxmin(255,cxmax(0,R));
++	G= cxmin(255,cxmax(0,G));
++	B= cxmin(255,cxmax(0,B));
+ 	RGBQUAD rgb={(BYTE)B,(BYTE)G,(BYTE)R,0};
+ 	return rgb;
+ }
+@@ -583,9 +583,9 @@ RGBQUAD CxImage::RGBtoXYZ(RGBQUAD lRGBColor)
+ 	Y = (int)( 0.212671f * R + 0.715160f * G + 0.072169f * B);
+ 	Z = (int)((0.019334f * R + 0.119193f * G + 0.950227f * B)*0.918483657f);
+ 
+-	//X= min(255,max(0,X));
+-	//Y= min(255,max(0,Y));
+-	//Z= min(255,max(0,Z));
++	//X= cxmin(255,cxmax(0,X));
++	//Y= cxmin(255,cxmax(0,Y));
++	//Z= cxmin(255,cxmax(0,Z));
+ 	RGBQUAD xyz={(BYTE)Z,(BYTE)Y,(BYTE)X,0};
+ 	return xyz;
+ }
+@@ -707,7 +707,7 @@ bool CxImage::Light(long brightness, long contrast)
+ 
+ 	BYTE cTable[256]; //<nipper>
+ 	for (int i=0;i<256;i++)	{
+-		cTable[i] = (BYTE)max(0,min(255,(int)((i-128)*c + brightness + 0.5f)));
++		cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)((i-128)*c + brightness + 0.5f)));
+ 	}
+ 
+ 	return Lut(cTable);
+@@ -830,11 +830,11 @@ bool CxImage::Filter(long* kernel, long Ksize, long Kfactor, long Koffset)
+ 						}
+ 					}
+ 					if (Kfactor==0 || ksumcur==0){
+-						cPtr2[iY1] = (BYTE)min(255, max(0,(int)(b + Koffset)));
++						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)(b + Koffset)));
+ 					} else if (ksumtot == ksumcur) {
+-						cPtr2[iY1] = (BYTE)min(255, max(0,(int)(b/Kfactor + Koffset)));
++						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)(b/Kfactor + Koffset)));
+ 					} else {
+-						cPtr2[iY1] = (BYTE)min(255, max(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
++						cPtr2[iY1] = (BYTE)cxmin(255, cxmax(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
+ 					}
+ 				}
+ 			}
+@@ -863,17 +863,17 @@ bool CxImage::Filter(long* kernel, long Ksize, long Kfactor, long Koffset)
+ 						}
+ 					}
+ 					if (Kfactor==0 || ksumcur==0){
+-						c.rgbRed   = (BYTE)min(255, max(0,(int)(r + Koffset)));
+-						c.rgbGreen = (BYTE)min(255, max(0,(int)(g + Koffset)));
+-						c.rgbBlue  = (BYTE)min(255, max(0,(int)(b + Koffset)));
++						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(r + Koffset)));
++						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(g + Koffset)));
++						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(b + Koffset)));
+ 					} else if (ksumtot == ksumcur) {
+-						c.rgbRed   = (BYTE)min(255, max(0,(int)(r/Kfactor + Koffset)));
+-						c.rgbGreen = (BYTE)min(255, max(0,(int)(g/Kfactor + Koffset)));
+-						c.rgbBlue  = (BYTE)min(255, max(0,(int)(b/Kfactor + Koffset)));
++						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(r/Kfactor + Koffset)));
++						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(g/Kfactor + Koffset)));
++						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(b/Kfactor + Koffset)));
+ 					} else {
+-						c.rgbRed   = (BYTE)min(255, max(0,(int)((r*ksumtot)/(ksumcur*Kfactor) + Koffset)));
+-						c.rgbGreen = (BYTE)min(255, max(0,(int)((g*ksumtot)/(ksumcur*Kfactor) + Koffset)));
+-						c.rgbBlue  = (BYTE)min(255, max(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
++						c.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)((r*ksumtot)/(ksumcur*Kfactor) + Koffset)));
++						c.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)((g*ksumtot)/(ksumcur*Kfactor) + Koffset)));
++						c.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)((b*ksumtot)/(ksumcur*Kfactor) + Koffset)));
+ 					}
+ 					tmp.BlindSetPixelColor(x,y,c);
+ 				}
+@@ -1078,8 +1078,8 @@ bool CxImage::Edge(long Ksize)
+ // 
+ void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffset, bool bMixAlpha)
+ {
+-    long lWide = min(GetWidth(),imgsrc2.GetWidth()-lXOffset);
+-    long lHeight = min(GetHeight(),imgsrc2.GetHeight()-lYOffset);
++    long lWide = cxmin(GetWidth(),imgsrc2.GetWidth()-lXOffset);
++    long lHeight = cxmin(GetHeight(),imgsrc2.GetHeight()-lYOffset);
+ 
+ 	bool bEditAlpha = imgsrc2.AlphaIsValid() & bMixAlpha;
+ 
+@@ -1112,16 +1112,16 @@ void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffse
+ 						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)((rgb1.rgbReserved+rgb2.rgbReserved)/2);
+ 					break;
+ 					case OpAdd:
+-						rgbDest.rgbBlue = (BYTE)max(0,min(255,rgb1.rgbBlue+rgb2.rgbBlue));
+-						rgbDest.rgbGreen = (BYTE)max(0,min(255,rgb1.rgbGreen+rgb2.rgbGreen));
+-						rgbDest.rgbRed = (BYTE)max(0,min(255,rgb1.rgbRed+rgb2.rgbRed));
+-						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)max(0,min(255,rgb1.rgbReserved+rgb2.rgbReserved));
++						rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,rgb1.rgbBlue+rgb2.rgbBlue));
++						rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,rgb1.rgbGreen+rgb2.rgbGreen));
++						rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,rgb1.rgbRed+rgb2.rgbRed));
++						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)cxmax(0,cxmin(255,rgb1.rgbReserved+rgb2.rgbReserved));
+ 					break;
+ 					case OpSub:
+-						rgbDest.rgbBlue = (BYTE)max(0,min(255,rgb1.rgbBlue-rgb2.rgbBlue));
+-						rgbDest.rgbGreen = (BYTE)max(0,min(255,rgb1.rgbGreen-rgb2.rgbGreen));
+-						rgbDest.rgbRed = (BYTE)max(0,min(255,rgb1.rgbRed-rgb2.rgbRed));
+-						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)max(0,min(255,rgb1.rgbReserved-rgb2.rgbReserved));
++						rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,rgb1.rgbBlue-rgb2.rgbBlue));
++						rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,rgb1.rgbGreen-rgb2.rgbGreen));
++						rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,rgb1.rgbRed-rgb2.rgbRed));
++						if (bEditAlpha) rgbDest.rgbReserved = (BYTE)cxmax(0,cxmin(255,rgb1.rgbReserved-rgb2.rgbReserved));
+ 					break;
+ 					case OpAnd:
+ 						rgbDest.rgbBlue = (BYTE)(rgb1.rgbBlue&rgb2.rgbBlue);
+@@ -1202,11 +1202,11 @@ void CxImage::Mix(CxImage & imgsrc2, ImageOpType op, long lXOffset, long lYOffse
+ 							double dSmallAmt = dSmall*((double)rgb2.rgbBlue);
+ 
+ 							if( lAverage < lThresh+1){
+-								rgbDest.rgbBlue = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbBlue) +
++								rgbDest.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbBlue) +
+ 												dSmallAmt)));
+-								rgbDest.rgbGreen = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbGreen) +
++								rgbDest.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbGreen) +
+ 												dSmallAmt)));
+-								rgbDest.rgbRed = (BYTE)max(0,min(255,(int)(dLarge*((double)rgb1.rgbRed) +
++								rgbDest.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(dLarge*((double)rgb1.rgbRed) +
+ 												dSmallAmt)));
+ 							}
+ 							else
+@@ -1274,9 +1274,9 @@ bool CxImage::ShiftRGB(long r, long g, long b)
+ #endif //CXIMAGE_SUPPORT_SELECTION
+ 				{
+ 					color = BlindGetPixelColor(x,y);
+-					color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + r)));
+-					color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + g)));
+-					color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + b)));
++					color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + r)));
++					color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + g)));
++					color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + b)));
+ 					BlindSetPixelColor(x,y,color);
+ 				}
+ 			}
+@@ -1284,9 +1284,9 @@ bool CxImage::ShiftRGB(long r, long g, long b)
+ 	} else {
+ 		for(DWORD j=0; j<head.biClrUsed; j++){
+ 			color = GetPaletteColor((BYTE)j);
+-			color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + r)));
+-			color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + g)));
+-			color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + b)));
++			color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + r)));
++			color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + g)));
++			color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + b)));
+ 			SetPaletteColor((BYTE)j,color);
+ 		}
+ 	}
+@@ -1310,7 +1310,7 @@ bool CxImage::Gamma(float gamma)
+ 
+ 	BYTE cTable[256]; //<nipper>
+ 	for (int i=0;i<256;i++)	{
+-		cTable[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
++		cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
+ 	}
+ 
+ 	return Lut(cTable);
+@@ -1337,21 +1337,21 @@ bool CxImage::GammaRGB(float gammaR, float gammaG, float gammaB)
+ 	dMax = pow(255.0, dinvgamma) / 255.0;
+ 	BYTE cTableR[256];
+ 	for (i=0;i<256;i++)	{
+-		cTableR[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
++		cTableR[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
+ 	}
+ 
+ 	dinvgamma = 1/gammaG;
+ 	dMax = pow(255.0, dinvgamma) / 255.0;
+ 	BYTE cTableG[256];
+ 	for (i=0;i<256;i++)	{
+-		cTableG[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
++		cTableG[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
+ 	}
+ 
+ 	dinvgamma = 1/gammaB;
+ 	dMax = pow(255.0, dinvgamma) / 255.0;
+ 	BYTE cTableB[256];
+ 	for (i=0;i<256;i++)	{
+-		cTableB[i] = (BYTE)max(0,min(255,(int)( pow((double)i, dinvgamma) / dMax)));
++		cTableB[i] = (BYTE)cxmax(0,cxmin(255,(int)( pow((double)i, dinvgamma) / dMax)));
+ 	}
+ 
+ 	return Lut(cTableR, cTableG, cTableB);
+@@ -1442,11 +1442,11 @@ bool CxImage::Noise(long level)
+ 			{
+ 				color = BlindGetPixelColor(x,y);
+ 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
+-				color.rgbRed = (BYTE)max(0,min(255,(int)(color.rgbRed + n)));
++				color.rgbRed = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbRed + n)));
+ 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
+-				color.rgbGreen = (BYTE)max(0,min(255,(int)(color.rgbGreen + n)));
++				color.rgbGreen = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbGreen + n)));
+ 				n=(long)((rand()/(float)RAND_MAX - 0.5)*level);
+-				color.rgbBlue = (BYTE)max(0,min(255,(int)(color.rgbBlue + n)));
++				color.rgbBlue = (BYTE)cxmax(0,cxmin(255,(int)(color.rgbBlue + n)));
+ 				BlindSetPixelColor(x,y,color);
+ 			}
+ 		}
+@@ -1561,8 +1561,8 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
+ 
+ 	//DFT buffers
+ 	double *real2,*imag2;
+-	real2 = (double*)malloc(max(w,h) * sizeof(double));
+-	imag2 = (double*)malloc(max(w,h) * sizeof(double));
++	real2 = (double*)malloc(cxmax(w,h) * sizeof(double));
++	imag2 = (double*)malloc(cxmax(w,h) * sizeof(double));
+ 
+ 	/* Transform the rows */
+ 	real = (double *)malloc(w * sizeof(double));
+@@ -1617,7 +1617,7 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
+ 
+ 	/* converting from double to byte, there is a HUGE loss in the dynamics
+ 	  "nn" tries to keep an acceptable SNR, but 8bit=48dB: don't ask more */
+-	double nn=pow((double)2,(double)log((double)max(w,h))/(double)log((double)2)-4);
++	double nn=pow((double)2,(double)log((double)cxmax(w,h))/(double)log((double)2)-4);
+ 	//reversed gain for reversed transform
+ 	if (direction==-1) nn=1/nn;
+ 	//bMagnitude : just to see it on the screen
+@@ -1626,15 +1626,15 @@ bool CxImage::FFT2(CxImage* srcReal, CxImage* srcImag, CxImage* dstReal, CxImage
+ 	for (j=0;j<h;j++) {
+ 		for (k=0;k<w;k++) {
+ 			if (bMagnitude){
+-				tmpReal->SetPixelIndex(k,j,(BYTE)max(0,min(255,(nn*(3+log(_cabs(grid[k][j])))))));
++				tmpReal->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(nn*(3+log(_cabs(grid[k][j])))))));
+ 				if (grid[k][j].x==0){
+-					tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128+(atan(grid[k][j].y/0.0000000001)*nn)))));
++					tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128+(atan(grid[k][j].y/0.0000000001)*nn)))));
+ 				} else {
+-					tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128+(atan(grid[k][j].y/grid[k][j].x)*nn)))));
++					tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128+(atan(grid[k][j].y/grid[k][j].x)*nn)))));
+ 				}
+ 			} else {
+-				tmpReal->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128 + grid[k][j].x*nn))));
+-				tmpImag->SetPixelIndex(k,j,(BYTE)max(0,min(255,(128 + grid[k][j].y*nn))));
++				tmpReal->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128 + grid[k][j].x*nn))));
++				tmpImag->SetPixelIndex(k,j,(BYTE)cxmax(0,cxmin(255,(128 + grid[k][j].y*nn))));
+ 			}
+ 		}
+ 	}
+@@ -1922,7 +1922,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
+ 
+ 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
+ 
+-			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
++			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
+ 		}
+ 	}
+ 
+@@ -1943,7 +1943,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
+ 
+ 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
+ 
+-			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
++			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
+ 		}
+ 	}
+ 	for (x=0;x<=w;x+=w){
+@@ -1963,7 +1963,7 @@ bool CxImage::RepairChannel(CxImage *ch, float radius)
+ 
+ 			correction = ((1.0+iy*iy)*ixx - ix*iy*ixy + (1.0+ix*ix)*iyy)/(1.0+ix*ix+iy*iy);
+ 
+-			tmp.BlindSetPixelIndex(x,y,(BYTE)min(255,max(0,(xy0 + radius * correction + 0.5))));
++			tmp.BlindSetPixelIndex(x,y,(BYTE)cxmin(255,cxmax(0,(xy0 + radius * correction + 0.5))));
+ 		}
+ 	}
+ 
+@@ -2621,8 +2621,8 @@ bool CxImage::SelectiveBlur(float radius, BYTE threshold, CxImage* iDst)
+ 	}
+ 
+ 	//build the difference mask
+-	BYTE thresh_dw = (BYTE)max( 0 ,(int)(128 - threshold));
+-	BYTE thresh_up = (BYTE)min(255,(int)(128 + threshold));
++	BYTE thresh_dw = (BYTE)cxmax( 0 ,(int)(128 - threshold));
++	BYTE thresh_up = (BYTE)cxmin(255,(int)(128 + threshold));
+ 	long kernel[]={-100,-100,-100,-100,801,-100,-100,-100,-100};
+ 	if (!Tmp.Filter(kernel,3,800,128)){
+ 		delete [] pPalette;
+@@ -2755,7 +2755,7 @@ bool CxImage::UnsharpMask(float radius /*= 5.0*/, float amount /*= 0.5*/, int th
+ 					if (abs(diff) < threshold){
+ 						dest_row[z] = cur_row[z];
+ 					} else {
+-						dest_row[z] = (BYTE)min(255, max(0,(int)(cur_row[z] + amount * diff)));
++						dest_row[z] = (BYTE)cxmin(255, cxmax(0,(int)(cur_row[z] + amount * diff)));
+ 					}
+ 				}
+ 			}
+@@ -2952,7 +2952,7 @@ bool CxImage::RedEyeRemove(float strength)
+ 				float a = 1.0f-5.0f*((float)((x-0.5f*(xmax+xmin))*(x-0.5f*(xmax+xmin))+(y-0.5f*(ymax+ymin))*(y-0.5f*(ymax+ymin))))/((float)((xmax-xmin)*(ymax-ymin)));
+ 				if (a<0) a=0;
+ 				color = BlindGetPixelColor(x,y);
+-				color.rgbRed = (BYTE)(a*min(color.rgbGreen,color.rgbBlue)+(1.0f-a)*color.rgbRed);
++				color.rgbRed = (BYTE)(a*cxmin(color.rgbGreen,color.rgbBlue)+(1.0f-a)*color.rgbRed);
+ 				BlindSetPixelColor(x,y,color);
+ 			}
+ 		}
+@@ -2990,7 +2990,7 @@ bool CxImage::Saturate(const long saturation, const long colorspace)
+ 	case 1:
+ 		{
+ 			for (int i=0;i<256;i++)	{
+-				cTable[i] = (BYTE)max(0,min(255,(int)(i + saturation)));
++				cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)(i + saturation)));
+ 			}
+ 			for(long y=ymin; y<ymax; y++){
+ 				info.nProgress = (long)(100*(y-ymin)/(ymax-ymin));
+@@ -3012,7 +3012,7 @@ bool CxImage::Saturate(const long saturation, const long colorspace)
+ 	case 2:
+ 		{
+ 			for (int i=0;i<256;i++)	{
+-				cTable[i] = (BYTE)max(0,min(255,(int)((i-128)*(100 + saturation)/100.0f + 128.5f)));
++				cTable[i] = (BYTE)cxmax(0,cxmin(255,(int)((i-128)*(100 + saturation)/100.0f + 128.5f)));
+ 			}
+ 			for(long y=ymin; y<ymax; y++){
+ 				info.nProgress = (long)(100*(y-ymin)/(ymax-ymin));
+@@ -3242,10 +3242,10 @@ int  CxImage::OptimalThreshold(long method, RECT * pBox, CxImage* pContrastMask)
+ 
+ 	long xmin,xmax,ymin,ymax;
+ 	if (pBox){
+-		xmin = max(pBox->left,0);
+-		xmax = min(pBox->right,head.biWidth);
+-		ymin = max(pBox->bottom,0);
+-		ymax = min(pBox->top,head.biHeight);
++		xmin = cxmax(pBox->left,0);
++		xmax = cxmin(pBox->right,head.biWidth);
++		ymin = cxmax(pBox->bottom,0);
++		ymax = cxmin(pBox->top,head.biHeight);
+ 	} else {
+ 		xmin = ymin = 0;
+ 		xmax = head.biWidth; ymax=head.biHeight;
+@@ -3463,7 +3463,7 @@ bool CxImage::AdaptiveThreshold(long method, long nBoxSize, CxImage* pContrastMa
+ 			r.top = r.bottom + nBoxSize;
+ 			int threshold = OptimalThreshold(method, &r, pContrastMask);
+ 			if (threshold <0) return false;
+-			mask.SetPixelIndex(x,y,(BYTE)max(0,min(255,nBias+((1.0f-fGlobalLocalBalance)*threshold + fGlobalLocalBalance*globalthreshold))));
++			mask.SetPixelIndex(x,y,(BYTE)cxmax(0,cxmin(255,nBias+((1.0f-fGlobalLocalBalance)*threshold + fGlobalLocalBalance*globalthreshold))));
+ 		}
+ 	}
+ 
+@@ -3490,10 +3490,6 @@ bool CxImage::AdaptiveThreshold(long method, long nBoxSize, CxImage* pContrastMa
+  * Note: nOpacity=0 && bSelectFilledArea=true act as a "magic wand"
+  * \return true if everything is ok
+  */
+-#if defined(XBMC) && !defined(_WIN32)
+-int max(int a, int b) { return a > b ? a : b; }
+-int min(int a, int b) { return a < b ? a : b; }
+-#endif
+ 
+ bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFillColor, const BYTE nTolerance,
+ 						BYTE nOpacity, const bool bSelectFilledArea, const BYTE nSelectionLevel)
+@@ -3538,8 +3534,8 @@ bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFil
+ 	if (IsIndexed()){ //--- Generic indexed image, no tolerance OR Grayscale image with tolerance
+ 		BYTE idxRef = GetPixelIndex(xStart,yStart);
+ 		BYTE idxFill = GetNearestIndex(cFillColor);
+-		BYTE idxMin = (BYTE)min(255, max(0,(int)(idxRef - nTolerance)));
+-		BYTE idxMax = (BYTE)min(255, max(0,(int)(idxRef + nTolerance)));
++		BYTE idxMin = (BYTE)cxmin(255, cxmax(0,(int)(idxRef - nTolerance)));
++		BYTE idxMax = (BYTE)cxmin(255, cxmax(0,(int)(idxRef + nTolerance)));
+ 
+ 		while(!q.empty())
+ 		{
+@@ -3575,12 +3571,12 @@ bool CxImage::FloodFill(const long xStart, const long yStart, const RGBQUAD cFil
+ 	} else { //--- RGB image
+ 		RGBQUAD cRef = GetPixelColor(xStart,yStart);
+ 		RGBQUAD cRefMin, cRefMax;
+-		cRefMin.rgbRed   = (BYTE)min(255, max(0,(int)(cRef.rgbRed   - nTolerance)));
+-		cRefMin.rgbGreen = (BYTE)min(255, max(0,(int)(cRef.rgbGreen - nTolerance)));
+-		cRefMin.rgbBlue  = (BYTE)min(255, max(0,(int)(cRef.rgbBlue  - nTolerance)));
+-		cRefMax.rgbRed   = (BYTE)min(255, max(0,(int)(cRef.rgbRed   + nTolerance)));
+-		cRefMax.rgbGreen = (BYTE)min(255, max(0,(int)(cRef.rgbGreen + nTolerance)));
+-		cRefMax.rgbBlue  = (BYTE)min(255, max(0,(int)(cRef.rgbBlue  + nTolerance)));
++		cRefMin.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbRed   - nTolerance)));
++		cRefMin.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbGreen - nTolerance)));
++		cRefMin.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbBlue  - nTolerance)));
++		cRefMax.rgbRed   = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbRed   + nTolerance)));
++		cRefMax.rgbGreen = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbGreen + nTolerance)));
++		cRefMax.rgbBlue  = (BYTE)cxmin(255, cxmax(0,(int)(cRef.rgbBlue  + nTolerance)));
+ 
+ 		while(!q.empty())
+ 		{
+diff --git a/lib/cximage-6.0/CxImage/ximage.cpp b/lib/cximage-6.0/CxImage/ximage.cpp
+index e81d3c6..26c6993 100644
+--- a/lib/cximage-6.0/CxImage/ximage.cpp
++++ b/lib/cximage-6.0/CxImage/ximage.cpp
+@@ -460,7 +460,7 @@ bool CxImage::CreateFromArray(BYTE* pArray,DWORD dwWidth,DWORD dwHeight,DWORD dw
+ 				src+=4;
+ 			}
+ 		} else {
+-			memcpy(dst,src,min(info.dwEffWidth,dwBytesperline));
++			memcpy(dst,src,cxmin(info.dwEffWidth,dwBytesperline));
+ 		}
+ 	}
+ 	return true;
+@@ -500,7 +500,7 @@ bool CxImage::CreateFromMatrix(BYTE** ppMatrix,DWORD dwWidth,DWORD dwHeight,DWOR
+ 					src+=4;
+ 				}
+ 			} else {
+-				memcpy(dst,src,min(info.dwEffWidth,dwBytesperline));
++				memcpy(dst,src,cxmin(info.dwEffWidth,dwBytesperline));
+ 			}
+ 		}
+ 	}
+diff --git a/lib/cximage-6.0/CxImage/ximagif.cpp b/lib/cximage-6.0/CxImage/ximagif.cpp
+index b89e061..64b1ccc 100644
+--- a/lib/cximage-6.0/CxImage/ximagif.cpp
++++ b/lib/cximage-6.0/CxImage/ximagif.cpp
+@@ -478,7 +478,7 @@ bool CxImageGIF::Encode(CxFile * fp, CxImage ** pImages, int pagecount, bool bLo
+ 	ghost.EncodeHeader(fp);
+ 
+ 	if (m_loops!=1){
+-		ghost.SetLoops(max(0,m_loops-1));
++		ghost.SetLoops(cxmax(0,m_loops-1));
+ 		ghost.EncodeLoopExtension(fp);
+ 	}
+ 
+@@ -1340,10 +1340,10 @@ void CxImageGIF::GetComment(char* sz_comment_out)
+ ////////////////////////////////////////////////////////////////////////////////
+ void CxImageGIF::GifMix(CxImage & imgsrc2, struct_image & imgdesc)
+ {
+-	long ymin = max(0,(long)(GetHeight()-imgdesc.t - imgdesc.h));
++	long ymin = cxmax(0,(long)(GetHeight()-imgdesc.t - imgdesc.h));
+ 	long ymax = GetHeight()-imgdesc.t;
+ 	long xmin = imgdesc.l;
+-	long xmax = min(GetWidth(), (DWORD)(imgdesc.l + imgdesc.w));
++	long xmax = cxmin(GetWidth(), (DWORD)(imgdesc.l + imgdesc.w));
+ 
+ 	long ibg2= imgsrc2.GetTransIndex();
+     BYTE i2;
+diff --git a/lib/cximage-6.0/CxImage/ximahist.cpp b/lib/cximage-6.0/CxImage/ximahist.cpp
+index a2aed03..5391107 100644
+--- a/lib/cximage-6.0/CxImage/ximahist.cpp
++++ b/lib/cximage-6.0/CxImage/ximahist.cpp
+@@ -110,7 +110,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 	// calculate LUT
+ 	BYTE lut[256];
+ 	for (x = 0; x <256; x++){
+-		lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
++		lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
+ 	}
+ 
+ 	for (y=0; y<head.biHeight; y++)	{
+@@ -152,7 +152,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 		// calculate LUT
+ 		BYTE lut[256];
+ 		for (x = 0; x <256; x++){
+-			lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
++			lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
+ 		}
+ 
+ 		// normalize image
+@@ -225,7 +225,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 		BYTE range = maxR - minR;
+ 		if (range != 0)	{
+ 			for (x = 0; x <256; x++){
+-				lutR[x] = (BYTE)max(0,min(255,(255 * (x - minR) / range)));
++				lutR[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minR) / range)));
+ 			}
+ 		} else lutR[minR] = minR;
+ 
+@@ -233,7 +233,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 		range = maxG - minG;
+ 		if (range != 0)	{
+ 			for (x = 0; x <256; x++){
+-				lutG[x] = (BYTE)max(0,min(255,(255 * (x - minG) / range)));
++				lutG[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minG) / range)));
+ 			}
+ 		} else lutG[minG] = minG;
+ 			
+@@ -241,7 +241,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 		range = maxB - minB;
+ 		if (range != 0)	{
+ 			for (x = 0; x <256; x++){
+-				lutB[x] = (BYTE)max(0,min(255,(255 * (x - minB) / range)));
++				lutB[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minB) / range)));
+ 			}
+ 		} else lutB[minB] = minB;
+ 
+@@ -292,7 +292,7 @@ bool CxImage::HistogramStretch(long method, double threshold)
+ 		// calculate LUT
+ 		BYTE lut[256];
+ 		for (x = 0; x <256; x++){
+-			lut[x] = (BYTE)max(0,min(255,(255 * (x - minc) / (maxc - minc))));
++			lut[x] = (BYTE)cxmax(0,cxmin(255,(255 * (x - minc) / (maxc - minc))));
+ 		}
+ 
+ 		for(y=0; y<head.biHeight; y++){
+diff --git a/lib/cximage-6.0/CxImage/ximaint.cpp b/lib/cximage-6.0/CxImage/ximaint.cpp
+index 989d76c..5d49213 100644
+--- a/lib/cximage-6.0/CxImage/ximaint.cpp
++++ b/lib/cximage-6.0/CxImage/ximaint.cpp
+@@ -26,8 +26,8 @@ void CxImage::OverflowCoordinates(long &x, long &y, OverflowMethod const ofMetho
+   switch (ofMethod) {
+     case OM_REPEAT:
+       //clip coordinates
+-      x=max(x,0); x=min(x, head.biWidth-1);
+-      y=max(y,0); y=min(y, head.biHeight-1);
++      x=cxmax(x,0); x=cxmin(x, head.biWidth-1);
++      y=cxmax(y,0); y=cxmin(y, head.biHeight-1);
+       break;
+     case OM_WRAP:
+       //wrap coordinates
+@@ -59,8 +59,8 @@ void CxImage::OverflowCoordinates(float &x, float &y, OverflowMethod const ofMet
+   switch (ofMethod) {
+     case OM_REPEAT:
+       //clip coordinates
+-      x=max(x,0); x=min(x, head.biWidth-1);
+-      y=max(y,0); y=min(y, head.biHeight-1);
++      x=cxmax(x,0); x=cxmin(x, head.biWidth-1);
++      y=cxmax(y,0); y=cxmin(y, head.biHeight-1);
+       break;
+     case OM_WRAP:
+       //wrap coordinates
+diff --git a/lib/cximage-6.0/CxImage/ximaiter.h b/lib/cximage-6.0/CxImage/ximaiter.h
+index 9788919..01a720b 100644
+--- a/lib/cximage-6.0/CxImage/ximaiter.h
++++ b/lib/cximage-6.0/CxImage/ximaiter.h
+@@ -140,7 +140,7 @@ inline void CImageIterator::SetY(int y)
+ inline void CImageIterator::SetRow(BYTE *buf, int n)
+ {
+ 	if (n<0) n = (int)ima->GetEffWidth();
+-	else n = min(n,(int)ima->GetEffWidth());
++	else n = cxmin(n,(int)ima->GetEffWidth());
+ 
+ 	if ((IterImage!=NULL)&&(buf!=NULL)&&(n>0)) memcpy(IterImage,buf,n);
+ }
+@@ -148,7 +148,7 @@ inline void CImageIterator::SetRow(BYTE *buf, int n)
+ inline void CImageIterator::GetRow(BYTE *buf, int n)
+ {
+ 	if ((IterImage!=NULL)&&(buf!=NULL)&&(n>0))
+-		memcpy(buf,IterImage,min(n,(int)ima->GetEffWidth()));
++		memcpy(buf,IterImage,cxmin(n,(int)ima->GetEffWidth()));
+ }
+ /////////////////////////////////////////////////////////////////////
+ inline BYTE* CImageIterator::GetRow()
+diff --git a/lib/cximage-6.0/CxImage/ximajbg.cpp b/lib/cximage-6.0/CxImage/ximajbg.cpp
+index 06fb9bf..8a01e28 100644
+--- a/lib/cximage-6.0/CxImage/ximajbg.cpp
++++ b/lib/cximage-6.0/CxImage/ximajbg.cpp
+@@ -145,7 +145,7 @@ bool CxImageJBG::Encode(CxFile * hFile)
+ 	jbg_enc_init(&jbig_state, w, h, planes, &buffer, jbig_data_out, hFile);
+ 
+     //jbg_enc_layers(&jbig_state, 2);
+-    //jbg_enc_lrlmax(&jbig_state, 800, 600);
++    //jbg_enc_lrlcxmax(&jbig_state, 800, 600);
+ 
+ 	// Specify a few other options (each is ignored if negative)
+ 	int dl = -1, dh = -1, d = -1, l0 = -1, mx = -1;
+diff --git a/lib/cximage-6.0/CxImage/ximapal.cpp b/lib/cximage-6.0/CxImage/ximapal.cpp
+index b3bd3da..3788c98 100644
+--- a/lib/cximage-6.0/CxImage/ximapal.cpp
++++ b/lib/cximage-6.0/CxImage/ximapal.cpp
+@@ -398,8 +398,8 @@ void CxImage::RGBtoBGR(BYTE *buffer, int length)
+ {
+ 	if (buffer && (head.biClrUsed==0)){
+ 		BYTE temp;
+-		length = min(length,(int)info.dwEffWidth);
+-		length = min(length,(int)(3*head.biWidth));
++		length = cxmin(length,(int)info.dwEffWidth);
++		length = cxmin(length,(int)(3*head.biWidth));
+ 		for (int i=0;i<length;i+=3){
+ 			temp = buffer[i]; buffer[i] = buffer[i+2]; buffer[i+2] = temp;
+ 		}
+@@ -444,7 +444,7 @@ void CxImage::SetPalette(DWORD n, BYTE *r, BYTE *g, BYTE *b)
+ 	if (!g) g = r;
+ 	if (!b) b = g;
+ 	RGBQUAD* ppal=GetPalette();
+-	DWORD m=min(n,head.biClrUsed);
++	DWORD m=cxmin(n,head.biClrUsed);
+ 	for (DWORD i=0; i<m;i++){
+ 		ppal[i].rgbRed=r[i];
+ 		ppal[i].rgbGreen=g[i];
+@@ -457,7 +457,7 @@ void CxImage::SetPalette(rgb_color *rgb,DWORD nColors)
+ {
+ 	if ((!rgb)||(pDib==NULL)||(head.biClrUsed==0)) return;
+ 	RGBQUAD* ppal=GetPalette();
+-	DWORD m=min(nColors,head.biClrUsed);
++	DWORD m=cxmin(nColors,head.biClrUsed);
+ 	for (DWORD i=0; i<m;i++){
+ 		ppal[i].rgbRed=rgb[i].r;
+ 		ppal[i].rgbGreen=rgb[i].g;
+@@ -469,7 +469,7 @@ void CxImage::SetPalette(rgb_color *rgb,DWORD nColors)
+ void CxImage::SetPalette(RGBQUAD* pPal,DWORD nColors)
+ {
+ 	if ((pPal==NULL)||(pDib==NULL)||(head.biClrUsed==0)) return;
+-	memcpy(GetPalette(),pPal,min(GetPaletteSize(),nColors*sizeof(RGBQUAD)));
++	memcpy(GetPalette(),pPal,cxmin(GetPaletteSize(),nColors*sizeof(RGBQUAD)));
+ 	info.last_c_isvalid = false;
+ }
+ ////////////////////////////////////////////////////////////////////////////////
+@@ -654,10 +654,10 @@ void CxImage::SetClrImportant(DWORD ncolors)
+ 
+ 	switch(head.biBitCount){
+ 	case 1:
+-		head.biClrImportant = min(ncolors,2);
++		head.biClrImportant = cxmin(ncolors,2);
+ 		break;
+ 	case 4:
+-		head.biClrImportant = min(ncolors,16);
++		head.biClrImportant = cxmin(ncolors,16);
+ 		break;
+ 	case 8:
+ 		head.biClrImportant = ncolors;
+diff --git a/lib/cximage-6.0/CxImage/ximapng.cpp b/lib/cximage-6.0/CxImage/ximapng.cpp
+index a58441c..4b5cc50 100644
+--- a/lib/cximage-6.0/CxImage/ximapng.cpp
++++ b/lib/cximage-6.0/CxImage/ximapng.cpp
+@@ -206,9 +206,9 @@ bool CxImagePNG::Decode(CxFile *hFile)
+ 	} else SetGrayPalette(); //<DP> needed for grayscale PNGs
+ 	
+ #ifdef USE_NEW_LIBPNG_API
+-	int nshift = max(0,(_bit_depth>>3)-1)<<3;
++	int nshift = cxmax(0,(_bit_depth>>3)-1)<<3;
+ #else
+-	int nshift = max(0,(info_ptr->bit_depth>>3)-1)<<3;
++	int nshift = cxmax(0,(info_ptr->bit_depth>>3)-1)<<3;
+ #endif
+ 
+ #ifdef USE_NEW_LIBPNG_API
+@@ -255,10 +255,10 @@ bool CxImagePNG::Decode(CxFile *hFile)
+ 			if (pal){
+ 				DWORD ip;
+ #ifdef USE_NEW_LIBPNG_API
+-				for (ip=0;ip<min(head.biClrUsed,(unsigned long)_num_trans);ip++)
++				for (ip=0;ip<cxmin(head.biClrUsed,(unsigned long)_num_trans);ip++)
+ 					pal[ip].rgbReserved=_trans_alpha[ip];
+ #else
+-				for (ip=0;ip<min(head.biClrUsed,(unsigned long)info_ptr->num_trans);ip++)
++				for (ip=0;ip<cxmin(head.biClrUsed,(unsigned long)info_ptr->num_trans);ip++)
+ #if PNG_LIBPNG_VER > 10399
+ 					pal[ip].rgbReserved=info_ptr->trans_alpha[ip];
+ #else
+@@ -737,9 +737,9 @@ bool CxImagePNG::Encode(CxFile *hFile)
+ #endif // CXIMAGE_SUPPORT_ALPHA	// <vho>
+ 
+ #ifdef USE_NEW_LIBPNG_API
+-	int row_size = max(info.dwEffWidth, (_width * _channels * _bit_depth / 8));
++	int row_size = cxmax(info.dwEffWidth, (_width * _channels * _bit_depth / 8));
+ #else
+-	int row_size = max(info.dwEffWidth, info_ptr->width*info_ptr->channels*(info_ptr->bit_depth/8));
++	int row_size = cxmax(info.dwEffWidth, info_ptr->width*info_ptr->channels*(info_ptr->bit_depth/8));
+ 	info_ptr->rowbytes = row_size;
+ #endif
+ 	BYTE *row_pointers = new BYTE[row_size];
+diff --git a/lib/cximage-6.0/CxImage/ximaraw.cpp b/lib/cximage-6.0/CxImage/ximaraw.cpp
+index fd86f96..52d964d 100644
+--- a/lib/cximage-6.0/CxImage/ximaraw.cpp
++++ b/lib/cximage-6.0/CxImage/ximaraw.cpp
+@@ -216,7 +216,7 @@ bool CxImageRAW::Decode(CxFile *hFile)
+ 
+ 		DWORD size = dcr.width * (dcr.colors*dcr.opt.output_bps/8);
+ 		RGBtoBGR(ppm,size);
+-		memcpy(GetBits(dcr.height - 1 - row), ppm, min(size,GetEffWidth()));
++		memcpy(GetBits(dcr.height - 1 - row), ppm, cxmin(size,GetEffWidth()));
+ 	}
+ 	free (ppm);
+ 
+@@ -298,7 +298,7 @@ bool CxImageRAW::GetExifThumbnail(const char *filename, const char *outname, int
+ 			// Resizing.
+       		if (image.GetWidth() > 256 || image.GetHeight() > 256)
+ 		    {
+-				float amount = 256.0f / max(image.GetWidth(), image.GetHeight());
++				float amount = 256.0f / cxmax(image.GetWidth(), image.GetHeight());
+ 				image.Resample((long)(image.GetWidth() * amount), (long)(image.GetHeight() * amount), 0);
+ 		    }
+ 	      	
+diff --git a/lib/cximage-6.0/CxImage/ximasel.cpp b/lib/cximage-6.0/CxImage/ximasel.cpp
+index 3a7c9a1..37cd10f 100644
+--- a/lib/cximage-6.0/CxImage/ximasel.cpp
++++ b/lib/cximage-6.0/CxImage/ximasel.cpp
+@@ -113,15 +113,15 @@ bool CxImage::SelectionAddRect(RECT r, BYTE level)
+ 	if (r.left<r.right) {r2.left=r.left; r2.right=r.right; } else {r2.left=r.right ; r2.right=r.left; }
+ 	if (r.bottom<r.top) {r2.bottom=r.bottom; r2.top=r.top; } else {r2.bottom=r.top ; r2.top=r.bottom; }
+ 
+-	if (info.rSelectionBox.top <= r2.top) info.rSelectionBox.top = max(0L,min(head.biHeight,r2.top+1));
+-	if (info.rSelectionBox.left > r2.left) info.rSelectionBox.left = max(0L,min(head.biWidth,r2.left));
+-	if (info.rSelectionBox.right <= r2.right) info.rSelectionBox.right = max(0L,min(head.biWidth,r2.right+1));
+-	if (info.rSelectionBox.bottom > r2.bottom) info.rSelectionBox.bottom = max(0L,min(head.biHeight,r2.bottom));
++	if (info.rSelectionBox.top <= r2.top) info.rSelectionBox.top = cxmax(0L,cxmin(head.biHeight,r2.top+1));
++	if (info.rSelectionBox.left > r2.left) info.rSelectionBox.left = cxmax(0L,cxmin(head.biWidth,r2.left));
++	if (info.rSelectionBox.right <= r2.right) info.rSelectionBox.right = cxmax(0L,cxmin(head.biWidth,r2.right+1));
++	if (info.rSelectionBox.bottom > r2.bottom) info.rSelectionBox.bottom = cxmax(0L,cxmin(head.biHeight,r2.bottom));
+ 
+-	long ymin = max(0L,min(head.biHeight,r2.bottom));
+-	long ymax = max(0L,min(head.biHeight,r2.top+1));
+-	long xmin = max(0L,min(head.biWidth,r2.left));
+-	long xmax = max(0L,min(head.biWidth,r2.right+1));
++	long ymin = cxmax(0L,cxmin(head.biHeight,r2.bottom));
++	long ymax = cxmax(0L,cxmin(head.biHeight,r2.top+1));
++	long xmin = cxmax(0L,cxmin(head.biWidth,r2.left));
++	long xmax = cxmax(0L,cxmin(head.biWidth,r2.right+1));
+ 
+ 	for (long y=ymin; y<ymax; y++)
+ 		memset(pSelection + xmin + y * head.biWidth, level, xmax-xmin);
+@@ -144,18 +144,18 @@ bool CxImage::SelectionAddEllipse(RECT r, BYTE level)
+ 	long xcenter = (r.right + r.left)/2;
+ 	long ycenter = (r.top + r.bottom)/2;
+ 
+-	if (info.rSelectionBox.left > (xcenter - xradius)) info.rSelectionBox.left = max(0L,min(head.biWidth,(xcenter - xradius)));
+-	if (info.rSelectionBox.right <= (xcenter + xradius)) info.rSelectionBox.right = max(0L,min(head.biWidth,(xcenter + xradius + 1)));
+-	if (info.rSelectionBox.bottom > (ycenter - yradius)) info.rSelectionBox.bottom = max(0L,min(head.biHeight,(ycenter - yradius)));
+-	if (info.rSelectionBox.top <= (ycenter + yradius)) info.rSelectionBox.top = max(0L,min(head.biHeight,(ycenter + yradius + 1)));
++	if (info.rSelectionBox.left > (xcenter - xradius)) info.rSelectionBox.left = cxmax(0L,cxmin(head.biWidth,(xcenter - xradius)));
++	if (info.rSelectionBox.right <= (xcenter + xradius)) info.rSelectionBox.right = cxmax(0L,cxmin(head.biWidth,(xcenter + xradius + 1)));
++	if (info.rSelectionBox.bottom > (ycenter - yradius)) info.rSelectionBox.bottom = cxmax(0L,cxmin(head.biHeight,(ycenter - yradius)));
++	if (info.rSelectionBox.top <= (ycenter + yradius)) info.rSelectionBox.top = cxmax(0L,cxmin(head.biHeight,(ycenter + yradius + 1)));
+ 
+-	long xmin = max(0L,min(head.biWidth,xcenter - xradius));
+-	long xmax = max(0L,min(head.biWidth,xcenter + xradius + 1));
+-	long ymin = max(0L,min(head.biHeight,ycenter - yradius));
+-	long ymax = max(0L,min(head.biHeight,ycenter + yradius + 1));
++	long xmin = cxmax(0L,cxmin(head.biWidth,xcenter - xradius));
++	long xmax = cxmax(0L,cxmin(head.biWidth,xcenter + xradius + 1));
++	long ymin = cxmax(0L,cxmin(head.biHeight,ycenter - yradius));
++	long ymax = cxmax(0L,cxmin(head.biHeight,ycenter + yradius + 1));
+ 
+ 	long y,yo;
+-	for (y=ymin; y<min(ycenter,ymax); y++){
++	for (y=ymin; y<cxmin(ycenter,ymax); y++){
+ 		for (long x=xmin; x<xmax; x++){
+ 			yo = (long)(ycenter - yradius * sqrt(1-pow((float)(x - xcenter)/(float)xradius,2)));
+ 			if (yo<y) pSelection[x + y * head.biWidth] = level;
+@@ -268,10 +268,10 @@ bool CxImage::SelectionAddPolygon(POINT *points, long npoints, BYTE level)
+ 		RECT r2;
+ 		if (current->x < next->x) {r2.left=current->x; r2.right=next->x; } else {r2.left=next->x ; r2.right=current->x; }
+ 		if (current->y < next->y) {r2.bottom=current->y; r2.top=next->y; } else {r2.bottom=next->y ; r2.top=current->y; }
+-		if (localbox.top < r2.top) localbox.top = max(0L,min(head.biHeight-1,r2.top+1));
+-		if (localbox.left > r2.left) localbox.left = max(0L,min(head.biWidth-1,r2.left-1));
+-		if (localbox.right < r2.right) localbox.right = max(0L,min(head.biWidth-1,r2.right+1));
+-		if (localbox.bottom > r2.bottom) localbox.bottom = max(0L,min(head.biHeight-1,r2.bottom-1));
++		if (localbox.top < r2.top) localbox.top = cxmax(0L,cxmin(head.biHeight-1,r2.top+1));
++		if (localbox.left > r2.left) localbox.left = cxmax(0L,cxmin(head.biWidth-1,r2.left-1));
++		if (localbox.right < r2.right) localbox.right = cxmax(0L,cxmin(head.biWidth-1,r2.right+1));
++		if (localbox.bottom > r2.bottom) localbox.bottom = cxmax(0L,cxmin(head.biHeight-1,r2.bottom-1));
+ 
+ 		i++;
+ 	}
+@@ -385,10 +385,10 @@ bool CxImage::SelectionAddPolygon(POINT *points, long npoints, BYTE level)
+ 		for (x=localbox.left; x<=localbox.right; x++)
+ 			if (plocal[x + yoffset]!=1) pSelection[x + yoffset]=level;
+ 	}
+-	if (info.rSelectionBox.top <= localbox.top) info.rSelectionBox.top = min(head.biHeight,localbox.top + 1);
+-	if (info.rSelectionBox.left > localbox.left) info.rSelectionBox.left = min(head.biWidth,localbox.left);
+-	if (info.rSelectionBox.right <= localbox.right) info.rSelectionBox.right = min(head.biWidth,localbox.right + 1);
+-	if (info.rSelectionBox.bottom > localbox.bottom) info.rSelectionBox.bottom = min(head.biHeight,localbox.bottom);
++	if (info.rSelectionBox.top <= localbox.top) info.rSelectionBox.top = cxmin(head.biHeight,localbox.top + 1);
++	if (info.rSelectionBox.left > localbox.left) info.rSelectionBox.left = cxmin(head.biWidth,localbox.left);
++	if (info.rSelectionBox.right <= localbox.right) info.rSelectionBox.right = cxmin(head.biWidth,localbox.right + 1);
++	if (info.rSelectionBox.bottom > localbox.bottom) info.rSelectionBox.bottom = cxmin(head.biHeight,localbox.bottom);
+ 
+ 	free(plocal);
+ 	free(pix);
+diff --git a/lib/cximage-6.0/CxImage/ximath.cpp b/lib/cximage-6.0/CxImage/ximath.cpp
+index 37533e2..f84eb72 100644
+--- a/lib/cximage-6.0/CxImage/ximath.cpp
++++ b/lib/cximage-6.0/CxImage/ximath.cpp
+@@ -64,10 +64,10 @@ CxRect2 CxRect2::CrossSection(CxRect2 const &r2) const
+  */
+ {
+   CxRect2 cs;
+-  cs.botLeft.x=max(botLeft.x, r2.botLeft.x);
+-  cs.botLeft.y=max(botLeft.y, r2.botLeft.y);
+-  cs.topRight.x=min(topRight.x, r2.topRight.x);
+-  cs.topRight.y=min(topRight.y, r2.topRight.y);
++  cs.botLeft.x=cxmax(botLeft.x, r2.botLeft.x);
++  cs.botLeft.y=cxmax(botLeft.y, r2.botLeft.y);
++  cs.topRight.x=cxmin(topRight.x, r2.topRight.x);
++  cs.topRight.y=cxmin(topRight.y, r2.topRight.y);
+   if (cs.botLeft.x<=cs.topRight.x && cs.botLeft.y<=cs.topRight.y) {
+     return cs;
+   } else {
+diff --git a/lib/cximage-6.0/CxImage/ximatif.cpp b/lib/cximage-6.0/CxImage/ximatif.cpp
+index 658392a..002766c 100644
+--- a/lib/cximage-6.0/CxImage/ximatif.cpp
++++ b/lib/cximage-6.0/CxImage/ximatif.cpp
+@@ -470,9 +470,9 @@ bool CxImageTIF::Decode(CxFile * hFile)
+ 						if ( cb > 0.00304 ) cb = 1.055 * pow(cb,0.41667) - 0.055;
+ 							else            cb = 12.92 * cb;
+ 
+-						c.rgbRed  =(BYTE)max(0,min(255,(int)(cr*255)));
+-						c.rgbGreen=(BYTE)max(0,min(255,(int)(cg*255)));
+-						c.rgbBlue =(BYTE)max(0,min(255,(int)(cb*255)));
++						c.rgbRed  =(BYTE)cxmax(0,cxmin(255,(int)(cr*255)));
++						c.rgbGreen=(BYTE)cxmax(0,cxmin(255,(int)(cg*255)));
++						c.rgbBlue =(BYTE)cxmax(0,cxmin(255,(int)(cb*255)));
+ 
+ 						SetPixelColor(xi,yi,c);
+ #if CXIMAGE_SUPPORT_ALPHA
+diff --git a/lib/cximage-6.0/CxImage/ximatran.cpp b/lib/cximage-6.0/CxImage/ximatran.cpp
+index 64a71e7..84d5e03 100644
+--- a/lib/cximage-6.0/CxImage/ximatran.cpp
++++ b/lib/cximage-6.0/CxImage/ximatran.cpp
+@@ -302,12 +302,12 @@ bool CxImage::RotateLeft(CxImage* iDst)
+ 			for (ys = 0; ys < newHeight; ys+=RBLOCK) {
+ 				if (head.biBitCount==24) {
+ 					//RGB24 optimized pixel access:
+-					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){    //do rotation
++					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){    //do rotation
+ 						info.nProgress = (long)(100*x/newWidth);
+ 						x2=newWidth-x-1;
+ 						dstPtr = (BYTE*) imgDest.BlindGetPixelPointer(x,ys);
+ 						srcPtr = (BYTE*) BlindGetPixelPointer(ys, x2);
+-						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 							//imgDest.SetPixelColor(x, y, GetPixelColor(y, x2));
+ 							*(dstPtr) = *(srcPtr);
+ 							*(dstPtr+1) = *(srcPtr+1);
+@@ -318,19 +318,19 @@ bool CxImage::RotateLeft(CxImage* iDst)
+ 					}//for x
+ 				} else {
+ 					//anything else than 24bpp (and 1bpp): palette
+-					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 						info.nProgress = (long)(100*x/newWidth); //<Anatoly Ivasyuk>
+ 						x2=newWidth-x-1;
+-						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 							imgDest.SetPixelIndex(x, y, BlindGetPixelIndex(y, x2));
+ 						}//for y
+ 					}//for x
+ 				}//if (version selection)
+ #if CXIMAGE_SUPPORT_ALPHA
+ 				if (AlphaIsValid()) {
+-					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 						x2=newWidth-x-1;
+-						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 							imgDest.AlphaSet(x,y,BlindAlphaGet(y, x2));
+ 						}//for y
+ 					}//for x
+@@ -343,9 +343,9 @@ bool CxImage::RotateLeft(CxImage* iDst)
+ 					imgDest.info.rSelectionBox.right = newWidth-info.rSelectionBox.bottom;
+ 					imgDest.info.rSelectionBox.bottom = info.rSelectionBox.left;
+ 					imgDest.info.rSelectionBox.top = info.rSelectionBox.right;
+-					for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++					for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 						x2=newWidth-x-1;
+-						for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++						for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 							imgDest.SelectionSet(x,y,BlindSelectionGet(y, x2));
+ 						}//for y
+ 					}//for x
+@@ -447,12 +447,12 @@ bool CxImage::RotateRight(CxImage* iDst)
+ 			for (ys = 0; ys < newHeight; ys+=RBLOCK) {
+ 				if (head.biBitCount==24) {
+ 					//RGB24 optimized pixel access:
+-					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 						info.nProgress = (long)(100*y/newHeight); //<Anatoly Ivasyuk>
+ 						y2=newHeight-y-1;
+ 						dstPtr = (BYTE*) imgDest.BlindGetPixelPointer(xs,y);
+ 						srcPtr = (BYTE*) BlindGetPixelPointer(y2, xs);
+-						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 							//imgDest.SetPixelColor(x, y, GetPixelColor(y2, x));
+ 							*(dstPtr) = *(srcPtr);
+ 							*(dstPtr+1) = *(srcPtr+1);
+@@ -463,19 +463,19 @@ bool CxImage::RotateRight(CxImage* iDst)
+ 					}//for y
+ 				} else {
+ 					//anything else than BW & RGB24: palette
+-					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 						info.nProgress = (long)(100*y/newHeight); //<Anatoly Ivasyuk>
+ 						y2=newHeight-y-1;
+-						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 							imgDest.SetPixelIndex(x, y, BlindGetPixelIndex(y2, x));
+ 						}//for x
+ 					}//for y
+ 				}//if
+ #if CXIMAGE_SUPPORT_ALPHA
+ 				if (AlphaIsValid()){
+-					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 						y2=newHeight-y-1;
+-						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 							imgDest.AlphaSet(x,y,BlindAlphaGet(y2, x));
+ 						}//for x
+ 					}//for y
+@@ -488,9 +488,9 @@ bool CxImage::RotateRight(CxImage* iDst)
+ 					imgDest.info.rSelectionBox.right = info.rSelectionBox.top;
+ 					imgDest.info.rSelectionBox.bottom = newHeight-info.rSelectionBox.right;
+ 					imgDest.info.rSelectionBox.top = newHeight-info.rSelectionBox.left;
+-					for (y = ys; y < min(newHeight, ys+RBLOCK); y++){
++					for (y = ys; y < cxmin(newHeight, ys+RBLOCK); y++){
+ 						y2=newHeight-y-1;
+-						for (x = xs; x < min(newWidth, xs+RBLOCK); x++){
++						for (x = xs; x < cxmin(newWidth, xs+RBLOCK); x++){
+ 							imgDest.SelectionSet(x,y,BlindSelectionGet(y2, x));
+ 						}//for x
+ 					}//for y
+@@ -608,10 +608,10 @@ bool CxImage::Rotate(float angle, CxImage* iDst)
+ 	newP4.x = (float)(p4.x*cos_angle - p4.y*sin_angle);
+ 	newP4.y = (float)(p4.x*sin_angle + p4.y*cos_angle);
+ 
+-	leftTop.x = min(min(newP1.x,newP2.x),min(newP3.x,newP4.x));
+-	leftTop.y = min(min(newP1.y,newP2.y),min(newP3.y,newP4.y));
+-	rightBottom.x = max(max(newP1.x,newP2.x),max(newP3.x,newP4.x));
+-	rightBottom.y = max(max(newP1.y,newP2.y),max(newP3.y,newP4.y));
++	leftTop.x = cxmin(cxmin(newP1.x,newP2.x),cxmin(newP3.x,newP4.x));
++	leftTop.y = cxmin(cxmin(newP1.y,newP2.y),cxmin(newP3.y,newP4.y));
++	rightBottom.x = cxmax(cxmax(newP1.x,newP2.x),cxmax(newP3.x,newP4.x));
++	rightBottom.y = cxmax(cxmax(newP1.y,newP2.y),cxmax(newP3.y,newP4.y));
+ 	leftBottom.x = leftTop.x;
+ 	leftBottom.y = rightBottom.y;
+ 	rightTop.x = rightBottom.x;
+@@ -740,10 +740,10 @@ bool CxImage::Rotate2(float angle,
+ 	}//if
+ 
+ 	//(read new dimensions from location of corners)
+-	float minx = (float) min(min(newp[0].x,newp[1].x),min(newp[2].x,newp[3].x));
+-	float miny = (float) min(min(newp[0].y,newp[1].y),min(newp[2].y,newp[3].y));
+-	float maxx = (float) max(max(newp[0].x,newp[1].x),max(newp[2].x,newp[3].x));
+-	float maxy = (float) max(max(newp[0].y,newp[1].y),max(newp[2].y,newp[3].y));
++	float minx = (float) cxmin(cxmin(newp[0].x,newp[1].x),cxmin(newp[2].x,newp[3].x));
++	float miny = (float) cxmin(cxmin(newp[0].y,newp[1].y),cxmin(newp[2].y,newp[3].y));
++	float maxx = (float) cxmax(cxmax(newp[0].x,newp[1].x),cxmax(newp[2].x,newp[3].x));
++	float maxy = (float) cxmax(cxmax(newp[0].y,newp[1].y),cxmax(newp[2].y,newp[3].y));
+ 	int newWidth = (int) floor(maxx-minx+0.5f);
+ 	int newHeight= (int) floor(maxy-miny+0.5f);
+ 	float ssx=((maxx+minx)- ((float) newWidth-1))/2.0f;   //start for x
+@@ -1003,12 +1003,12 @@ bool CxImage::Resample(long newx, long newy, int mode, CxImage* iDst)
+ 				if (info.nEscape) break;
+ 				fY = y * yScale;
+ 				ifY = (int)fY;
+-				ifY1 = min(ymax, ifY+1);
++				ifY1 = cxmin(ymax, ifY+1);
+ 				dy = fY - ifY;
+ 				for(long x=0; x<newx; x++){
+ 					fX = x * xScale;
+ 					ifX = (int)fX;
+-					ifX1 = min(xmax, ifX+1);
++					ifX1 = cxmin(xmax, ifX+1);
+ 					dx = fX - ifX;
+ 					// Interpolate using the four nearest pixels in the source
+ 					if (head.biClrUsed){
+@@ -1328,9 +1328,9 @@ bool CxImage::DecreaseBpp(DWORD nbit, bool errordiffusion, RGBQUAD* ppal, DWORD
+ 				eb=(long)c.rgbBlue - (long)ce.rgbBlue;
+ 
+ 				c = GetPixelColor(x+1,y);
+-				c.rgbRed = (BYTE)min(255L,max(0L,(long)c.rgbRed + ((er*7)/16)));
+-				c.rgbGreen = (BYTE)min(255L,max(0L,(long)c.rgbGreen + ((eg*7)/16)));
+-				c.rgbBlue = (BYTE)min(255L,max(0L,(long)c.rgbBlue + ((eb*7)/16)));
++				c.rgbRed = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbRed + ((er*7)/16)));
++				c.rgbGreen = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbGreen + ((eg*7)/16)));
++				c.rgbBlue = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbBlue + ((eb*7)/16)));
+ 				SetPixelColor(x+1,y,c);
+ 				int coeff=1;
+ 				for(int i=-1; i<2; i++){
+@@ -1343,9 +1343,9 @@ bool CxImage::DecreaseBpp(DWORD nbit, bool errordiffusion, RGBQUAD* ppal, DWORD
+ 						coeff=1; break;
+ 					}
+ 					c = GetPixelColor(x+i,y+1);
+-					c.rgbRed = (BYTE)min(255L,max(0L,(long)c.rgbRed + ((er * coeff)/16)));
+-					c.rgbGreen = (BYTE)min(255L,max(0L,(long)c.rgbGreen + ((eg * coeff)/16)));
+-					c.rgbBlue = (BYTE)min(255L,max(0L,(long)c.rgbBlue + ((eb * coeff)/16)));
++					c.rgbRed = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbRed + ((er * coeff)/16)));
++					c.rgbGreen = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbGreen + ((eg * coeff)/16)));
++					c.rgbBlue = (BYTE)cxmin(255L,cxmax(0L,(long)c.rgbBlue + ((eb * coeff)/16)));
+ 					SetPixelColor(x+i,y+1,c);
+ 				}
+ 			}
+@@ -1566,10 +1566,10 @@ bool CxImage::Dither(long method)
+ 				}
+ 
+ 				nlevel = GetPixelIndex(x + 1, y) + (error * 8) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 1, y, level);
+ 				nlevel = GetPixelIndex(x + 2, y) + (error * 4) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 2, y, level);
+ 				int i;
+ 				for (i = -2; i < 3; i++) {
+@@ -1591,7 +1591,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 1, level);
+ 				}
+ 			}
+@@ -1620,10 +1620,10 @@ bool CxImage::Dither(long method)
+ 				}
+ 
+ 				nlevel = GetPixelIndex(x + 1, y) + (error * 8) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 1, y, level);
+ 				nlevel = GetPixelIndex(x + 2, y) + (error * 4) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 2, y, level);
+ 				int i;
+ 				for (i = -2; i < 3; i++) {
+@@ -1645,7 +1645,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 1, level);
+ 				}
+ 				for (i = -2; i < 3; i++) {
+@@ -1667,7 +1667,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 2, level);
+ 				}
+ 			}
+@@ -1696,10 +1696,10 @@ bool CxImage::Dither(long method)
+ 				}
+ 
+ 				nlevel = GetPixelIndex(x + 1, y) + (error * 7) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 1, y, level);
+ 				nlevel = GetPixelIndex(x + 2, y) + (error * 5) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 2, y, level);
+ 				int i;
+ 				for (i = -2; i < 3; i++) {
+@@ -1721,7 +1721,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 1, level);
+ 				}
+ 				for (i = -2; i < 3; i++) {
+@@ -1743,7 +1743,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 2, level);
+ 				}
+ 			}
+@@ -1772,10 +1772,10 @@ bool CxImage::Dither(long method)
+ 				}
+ 
+ 				nlevel = GetPixelIndex(x + 1, y) + (error * 5) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 1, y, level);
+ 				nlevel = GetPixelIndex(x + 2, y) + (error * 3) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(x + 2, y, level);
+ 				int i;
+ 				for (i = -2; i < 3; i++) {
+@@ -1797,7 +1797,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 1) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 1, level);
+ 				}
+ 				for (i = -1; i < 2; i++) {
+@@ -1813,7 +1813,7 @@ bool CxImage::Dither(long method)
+ 						break;
+ 					}
+ 					nlevel = GetPixelIndex(x + i, y + 2) + (error * coeff) / TotalCoeffSum;
+-					level = (BYTE)min(255, max(0, (int)nlevel));
++					level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 					SetPixelIndex(x + i, y + 2, level);
+ 				}
+ 			}
+@@ -1845,76 +1845,76 @@ bool CxImage::Dither(long method)
+ 				int tmp_index_y = y;
+ 				int tmp_coeff = 32;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x - 3;
+ 				tmp_index_y = y + 1;
+ 				tmp_coeff = 12;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x - 1;
+ 				tmp_coeff = 26;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x + 1;
+ 				tmp_coeff = 30;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x + 3;
+ 				tmp_coeff = 16;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x - 2;
+ 				tmp_index_y = y + 2;
+ 				tmp_coeff = 12;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x;
+ 				tmp_coeff = 26;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x + 2;
+ 				tmp_coeff = 12;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x - 3;
+ 				tmp_index_y = y + 3;
+ 				tmp_coeff = 5;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x - 1;
+ 				tmp_coeff = 12;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x + 1;
+ 				tmp_coeff = 12;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 
+ 				tmp_index_x = x + 3;
+ 				tmp_coeff = 5;
+ 				nlevel = GetPixelIndex(tmp_index_x, tmp_index_y) + (error * tmp_coeff) / TotalCoeffSum;
+-				level = (BYTE)min(255, max(0, (int)nlevel));
++				level = (BYTE)cxmin(255, cxmax(0, (int)nlevel));
+ 				SetPixelIndex(tmp_index_x, tmp_index_y, level);
+ 			}
+ 		}
+@@ -1941,7 +1941,7 @@ bool CxImage::Dither(long method)
+ 			Bmatrix[i] = (BYTE)(dither);
+ 		}
+ 
+-		int scale = max(0,(8-2*order));
++		int scale = cxmax(0,(8-2*order));
+ 		int level;
+ 		for (long y=0;y<head.biHeight;y++){
+ 			info.nProgress = (long)(100*y/head.biHeight);
+@@ -1981,7 +1981,7 @@ bool CxImage::Dither(long method)
+ 				}
+ 
+ 				nlevel = GetPixelIndex(x+1,y) + (error * 7)/16;
+-				level = (BYTE)min(255,max(0,(int)nlevel));
++				level = (BYTE)cxmin(255,cxmax(0,(int)nlevel));
+ 				SetPixelIndex(x+1,y,level);
+ 				for(int i=-1; i<2; i++){
+ 					switch(i){
+@@ -1993,7 +1993,7 @@ bool CxImage::Dither(long method)
+ 						coeff=1; break;
+ 					}
+ 					nlevel = GetPixelIndex(x+i,y+1) + (error * coeff)/16;
+-					level = (BYTE)min(255,max(0,(int)nlevel));
++					level = (BYTE)cxmin(255,cxmax(0,(int)nlevel));
+ 					SetPixelIndex(x+i,y+1,level);
+ 				}
+ 			}
+@@ -2031,7 +2031,7 @@ bool CxImage::CropRotatedRectangle( long topx, long topy, long width, long heigh
+ 	if ( fabs(angle)<0.0002 )
+ 		return Crop( topx, topy, topx+width, topy+height, iDst);
+ 
+-	startx = min(topx, topx - (long)(sin_angle*(double)height));
++	startx = cxmin(topx, topx - (long)(sin_angle*(double)height));
+ 	endx   = topx + (long)(cos_angle*(double)width);
+ 	endy   = topy + (long)(cos_angle*(double)height + sin_angle*(double)width);
+ 	// check: corners of the rectangle must be inside
+@@ -2079,10 +2079,10 @@ bool CxImage::Crop(long left, long top, long right, long bottom, CxImage* iDst)
+ {
+ 	if (!pDib) return false;
+ 
+-	long startx = max(0L,min(left,head.biWidth));
+-	long endx = max(0L,min(right,head.biWidth));
+-	long starty = head.biHeight - max(0L,min(top,head.biHeight));
+-	long endy = head.biHeight - max(0L,min(bottom,head.biHeight));
++	long startx = cxmax(0L,cxmin(left,head.biWidth));
++	long endx = cxmax(0L,cxmin(right,head.biWidth));
++	long starty = head.biHeight - cxmax(0L,cxmin(top,head.biHeight));
++	long endy = head.biHeight - cxmax(0L,cxmin(bottom,head.biHeight));
+ 
+ 	if (startx==endx || starty==endy) return false;
+ 
+@@ -2443,8 +2443,8 @@ bool CxImage::CircleTransform(int type,long rmax,float Koeff)
+ 						nx=x+(x%32)-16;
+ 						ny=y;
+ 					}
+-//					nx=max(xmin,min(nx,xmax));
+-//					ny=max(ymin,min(ny,ymax));
++//					nx=cxmax(xmin,cxmin(nx,xmax));
++//					ny=cxmax(ymin,cxmin(ny,ymax));
+ 				}
+ 				else { nx=-1;ny=-1;}
+ 				if (head.biClrUsed==0){
+diff --git a/lib/cximage-6.0/CxImage/ximawnd.cpp b/lib/cximage-6.0/CxImage/ximawnd.cpp
+index 2ae2f93..7029cc7 100644
+--- a/lib/cximage-6.0/CxImage/ximawnd.cpp
++++ b/lib/cximage-6.0/CxImage/ximawnd.cpp
+@@ -682,10 +682,10 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
+ 	RECT clipbox,paintbox;
+ 	GetClipBox(hdc,&clipbox);
+ 
+-	paintbox.top = min(clipbox.bottom,max(clipbox.top,y));
+-	paintbox.left = min(clipbox.right,max(clipbox.left,x));
+-	paintbox.right = max(clipbox.left,min(clipbox.right,x+cx));
+-	paintbox.bottom = max(clipbox.top,min(clipbox.bottom,y+cy));
++	paintbox.top = cxmin(clipbox.bottom,cxmax(clipbox.top,y));
++	paintbox.left = cxmin(clipbox.right,cxmax(clipbox.left,x));
++	paintbox.right = cxmax(clipbox.left,cxmin(clipbox.right,x+cx));
++	paintbox.bottom = cxmax(clipbox.top,cxmin(clipbox.bottom,y+cy));
+ 
+ 	long destw = paintbox.right - paintbox.left;
+ 	long desth = paintbox.bottom - paintbox.top;
+@@ -730,12 +730,12 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
+ 
+ 				for(yy=0;yy<desth;yy++){
+ 					dy = head.biHeight-(ymax-yy-y)*fy;
+-					sy = max(0L,(long)floor(dy));
++					sy = cxmax(0L,(long)floor(dy));
+ 					psrc = info.pImage+sy*info.dwEffWidth;
+ 					pdst = pbase+yy*ew;
+ 					for(xx=0;xx<destw;xx++){
+ 						dx = (xx+xmin-x)*fx;
+-						sx = max(0L,(long)floor(dx));
++						sx = cxmax(0L,(long)floor(dx));
+ #if CXIMAGE_SUPPORT_INTERPOLATION
+ 						if (bSmooth){
+ 							if (fx > 1 && fy > 1) { 
+@@ -813,7 +813,7 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
+ 				
+ 				for(yy=0;yy<desth;yy++){
+ 					dy = head.biHeight-(ymax-yy-y)*fy;
+-					sy = max(0L,(long)floor(dy));
++					sy = cxmax(0L,(long)floor(dy));
+ 
+ 					alphaoffset = sy*head.biWidth;
+ 					pdst = pbase + yy*ew;
+@@ -821,7 +821,7 @@ long CxImage::Draw(HDC hdc, long x, long y, long cx, long cy, RECT* pClipRect, b
+ 
+ 					for(xx=0;xx<destw;xx++){
+ 						dx = (xx+xmin-x)*fx;
+-						sx = max(0L,(long)floor(dx));
++						sx = cxmax(0L,(long)floor(dx));
+ 
+ 						if (bAlpha) a=pAlpha[alphaoffset+sx]; else a=255;
+ 						a =(BYTE)((a*(1+info.nAlphaMax))>>8);
+-- 
+2.8.0.rc3
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0010-curl-support-version-7.5.0-and-upwards.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0010-curl-support-version-7.5.0-and-upwards.patch
new file mode 100644
index 0000000..b6743ae
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0010-curl-support-version-7.5.0-and-upwards.patch
@@ -0,0 +1,34 @@
+From 7d3c70b163bc67aeb1fdef8fd2347b39f311c584 Mon Sep 17 00:00:00 2001
+From: fritsch <peter.fruehberger@gmail.com>
+Date: Sun, 24 Jul 2016 20:24:07 +0200
+Subject: [PATCH] Curl: Adjust multi_cleanup method which returns CURLMcode
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(backported from upstream commit:
+ https://github.com/xbmc/xbmc/commit/2a8d3e7f6cffea52740b8392a3be8ec251d5ff70)
+---
+ xbmc/filesystem/DllLibCurl.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xbmc/filesystem/DllLibCurl.h b/xbmc/filesystem/DllLibCurl.h
+index db97f92..9e78a91 100644
+--- a/xbmc/filesystem/DllLibCurl.h
++++ b/xbmc/filesystem/DllLibCurl.h
+@@ -52,7 +52,7 @@ namespace XCURL
+     virtual CURLMcode multi_fdset(CURLM *multi_handle, fd_set *read_fd_set, fd_set *write_fd_set, fd_set *exc_fd_set, int *max_fd)=0;
+     virtual CURLMcode multi_timeout(CURLM *multi_handle, long *timeout)=0;
+     virtual CURLMsg*  multi_info_read(CURLM *multi_handle, int *msgs_in_queue)=0;
+-    virtual void multi_cleanup(CURL_HANDLE * handle )=0;
++    virtual CURLMcode multi_cleanup(CURLM * handle )=0;
+     virtual struct curl_slist* slist_append(struct curl_slist *, const char *)=0;
+     virtual void  slist_free_all(struct curl_slist *)=0;
+   };
+@@ -77,7 +77,7 @@ namespace XCURL
+     DEFINE_METHOD5(CURLMcode, multi_fdset, (CURLM *p1, fd_set *p2, fd_set *p3, fd_set *p4, int *p5))
+     DEFINE_METHOD2(CURLMcode, multi_timeout, (CURLM *p1, long *p2))
+     DEFINE_METHOD2(CURLMsg*,  multi_info_read, (CURLM *p1, int *p2))
+-    DEFINE_METHOD1(void, multi_cleanup, (CURLM *p1))
++    DEFINE_METHOD1(CURLMcode, multi_cleanup, (CURLM *p1))
+     DEFINE_METHOD2(struct curl_slist*, slist_append, (struct curl_slist * p1, const char * p2))
+     DEFINE_METHOD1(void, slist_free_all, (struct curl_slist * p1))
+     DEFINE_METHOD1(const char *, easy_strerror, (CURLcode p1))
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
new file mode 100644
index 0000000..a3a9d50
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-16/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
@@ -0,0 +1,30 @@
+From a17e8d39cf01e26955574acd236b4ef5b54b8c3b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 5 Sep 2016 12:34:20 +0200
+Subject: [PATCH 2/2] xbmc_pvr_types.h: Fix compilation with gcc6
+
+Backport of upstream commit from master branch:
+https://github.com/xbmc/xbmc/commit/c8a346109926fa03bf6882c0b6e3885af0e0f8ed
+
+This patch can be removed when Kodi is bumped to 17.0-Krypton.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/addons/include/xbmc_pvr_types.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xbmc/addons/include/xbmc_pvr_types.h b/xbmc/addons/include/xbmc_pvr_types.h
+index c5ab20b..e518de1 100644
+--- a/xbmc/addons/include/xbmc_pvr_types.h
++++ b/xbmc/addons/include/xbmc_pvr_types.h
+@@ -34,6 +34,7 @@
+ #endif
+ #include <string.h>
+ #include <stdint.h>
++#include <stdio.h>
+ 
+ #include "xbmc_addon_types.h"
+ #include "xbmc_epg_types.h"
+-- 
+2.9.3
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
new file mode 100644
index 0000000..b3780db
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
@@ -0,0 +1,25 @@
+From 53c7b1667a41b25775d1dc009d8ced61f383da0b Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sat, 6 Feb 2016 15:43:01 +0100
+Subject: [PATCH 1/3] configure: don't try to run stuff to find tinyxml
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5a41fb4..243c7e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1043,7 +1043,7 @@ fi
+ AC_LANG_PUSH([C++])
+ PKG_CHECK_MODULES([TINYXML], [tinyxml >= 2.6.2],
+   [INCLUDES="$INCLUDES $TINYXML_CFLAGS"; LIBS="$LIBS $TINYXML_LIBS"],
+-  [AC_RUN_IFELSE(
++  [AC_COMPILE_IFELSE(
+    [AC_LANG_SOURCE([[
+ #include <stdlib.h>
+ #include <tinyxml.h>
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch
new file mode 100644
index 0000000..b2af5de
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-handle-SIGTERM.patch
@@ -0,0 +1,163 @@
+From 1c1484303a055bfde655ffae3829554aaefc2e07 Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Wed, 2 Nov 2016 11:28:34 -0700
+Subject: [PATCH 2/3] handle SIGTERM
+
+0. CApplication::Stop cant be trusted. (deadlocks crashes and boo)
+
+so, when shutdown/reboot is requested:
+
+1. save an exit code (for CEC...)
+2. call CPowerManager::{Reboot,PowerDown}
+3. ... then systemd sends TERM and waits xx seconds before sending KILL
+4. CApplication::Stop has xx seconds to save guisettings.xml and boo
+5. CEC thread has xx seconds to switch off after it received OnQuit
+6. addons / pvrmanager / cec / everything else.. are free to deadlock / crash now, we dont care
+7. KILL
+
+Signed-off-by: Stefan Saraev <stefan@saraev.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xbmc/Application.cpp         | 17 ++++++++++++-----
+ xbmc/Application.h           |  1 +
+ xbmc/XBApplicationEx.cpp     |  1 +
+ xbmc/XBApplicationEx.h       |  1 +
+ xbmc/platform/posix/main.cpp | 15 +++++++++++++++
+ 5 files changed, 30 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/Application.cpp b/xbmc/Application.cpp
+index 4c118e0..58b151a 100644
+--- a/xbmc/Application.cpp
++++ b/xbmc/Application.cpp
+@@ -2428,12 +2428,12 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+   switch (pMsg->dwMessage)
+   {
+   case TMSG_POWERDOWN:
+-    Stop(EXITCODE_POWERDOWN);
++    SetExitCode(EXITCODE_POWERDOWN);
+     g_powerManager.Powerdown();
+     break;
+ 
+   case TMSG_QUIT:
+-    Stop(EXITCODE_QUIT);
++    SetExitCode(EXITCODE_QUIT);
+     break;
+   
+   case TMSG_SHUTDOWN:
+@@ -2454,12 +2454,13 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
+ 
+   case TMSG_RESTART:
+   case TMSG_RESET:
+-    Stop(EXITCODE_REBOOT);
++    SetExitCode(EXITCODE_REBOOT);
+     g_powerManager.Reboot();
+     break;
+ 
+   case TMSG_RESTARTAPP:
+ #if defined(TARGET_WINDOWS) || defined(TARGET_LINUX)
++    SetExitCode(EXITCODE_RESTARTAPP);
+     Stop(EXITCODE_RESTARTAPP);
+ #endif
+     break;
+@@ -2883,6 +2884,13 @@ bool CApplication::Cleanup()
+   }
+ }
+ 
++void CApplication::SetExitCode(int exitCode)
++{
++  // save it for CEC
++  m_ExitCode = exitCode;
++  m_ExitCodeSet = true;
++}
++
+ void CApplication::Stop(int exitCode)
+ {
+   try
+@@ -2890,7 +2898,7 @@ void CApplication::Stop(int exitCode)
+     m_frameMoveGuard.unlock();
+ 
+     CVariant vExitCode(CVariant::VariantTypeObject);
+-    vExitCode["exitcode"] = exitCode;
++    vExitCode["exitcode"] = m_ExitCode;
+     CAnnouncementManager::GetInstance().Announce(System, "xbmc", "OnQuit", vExitCode);
+ 
+     // Abort any active screensaver
+@@ -2924,7 +2932,6 @@ void CApplication::Stop(int exitCode)
+ 
+     m_bStop = true;
+     m_AppFocused = false;
+-    m_ExitCode = exitCode;
+     CLog::Log(LOGNOTICE, "stop all");
+ 
+     // cancel any jobs from the jobmanager
+diff --git a/xbmc/Application.h b/xbmc/Application.h
+index 22aca81..9992677 100644
+--- a/xbmc/Application.h
++++ b/xbmc/Application.h
+@@ -160,6 +160,7 @@ public:
+   void StopPVRManager();
+   void ReinitPVRManager();
+   bool IsCurrentThread() const;
++  void SetExitCode(int exitCode);
+   void Stop(int exitCode);
+   void RestartApp();
+   void UnloadSkin(bool forReload = false);
+diff --git a/xbmc/XBApplicationEx.cpp b/xbmc/XBApplicationEx.cpp
+index 035aed2..34102f5 100644
+--- a/xbmc/XBApplicationEx.cpp
++++ b/xbmc/XBApplicationEx.cpp
+@@ -46,6 +46,7 @@ CXBApplicationEx::CXBApplicationEx()
+   m_bStop = false;
+   m_AppFocused = true;
+   m_ExitCode = EXITCODE_QUIT;
++  m_ExitCodeSet = false;
+   m_renderGUI = false;
+ }
+ 
+diff --git a/xbmc/XBApplicationEx.h b/xbmc/XBApplicationEx.h
+index 9bc14fa..f696b89 100644
+--- a/xbmc/XBApplicationEx.h
++++ b/xbmc/XBApplicationEx.h
+@@ -42,6 +42,7 @@ public:
+   // Variables for timing
+   bool m_bStop;
+   int  m_ExitCode;
++  bool m_ExitCodeSet;
+   bool m_AppFocused;
+   bool m_renderGUI;
+ 
+diff --git a/xbmc/platform/posix/main.cpp b/xbmc/platform/posix/main.cpp
+index a8b64e5..3d80032 100644
+--- a/xbmc/platform/posix/main.cpp
++++ b/xbmc/platform/posix/main.cpp
+@@ -41,12 +41,27 @@
+ #include "input/linux/LIRC.h"
+ #endif
+ #include "platform/XbmcContext.h"
++#include "Application.h"
++
++void xbmc_term_handler(int signum)
++{
++  CLog::Log(LOGINFO, "Received SIGTERM...");
++  if (!g_application.m_ExitCodeSet)
++    g_application.SetExitCode(EXITCODE_RESTARTAPP);
++  g_application.Stop(EXITCODE_RESTARTAPP);
++}
+ 
+ #ifdef __cplusplus
+ extern "C"
+ #endif
+ int main(int argc, char* argv[])
+ {
++  // SIGTERM handler
++  struct sigaction action;
++  memset(&action, 0, sizeof(struct sigaction));
++  action.sa_handler = xbmc_term_handler;
++  sigaction(SIGTERM, &action, NULL);
++
+   // set up some xbmc specific relationships
+   XBMC::Context context;
+ 
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch
new file mode 100644
index 0000000..d638550
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-add-support-to-read-frequency-output-if-using-intel-.patch
@@ -0,0 +1,26 @@
+From 4ef1e9dab9193f1a5305d25c8eda97f8f06ea154 Mon Sep 17 00:00:00 2001
+From: Stephan Raue <stephan@openelec.tv>
+Date: Mon, 1 Sep 2014 03:16:37 +0200
+Subject: [PATCH 3/3] add support to read frequency output if using intel's
+ pstate driver
+
+---
+ xbmc/utils/CPUInfo.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xbmc/utils/CPUInfo.cpp b/xbmc/utils/CPUInfo.cpp
+index 5e2ebbd..fd04d5a 100644
+--- a/xbmc/utils/CPUInfo.cpp
++++ b/xbmc/utils/CPUInfo.cpp
+@@ -274,6 +274,8 @@ CCPUInfo::CCPUInfo(void)
+     m_fProcTemperature = fopen("/sys/class/thermal/thermal_zone0/temp", "r");  // On Raspberry PIs
+ 
+   m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", "r");
++  if (m_fCPUFreq == NULL)
++    m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", "r");
+   if (!m_fCPUFreq)
+   {
+     m_cpuInfoForFreq = true;
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch
new file mode 100644
index 0000000..6f5f9a2
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-Disable-DVD-support.patch
@@ -0,0 +1,35 @@
+From 191cf3f084b4d34846711034a7fe3078f8243c82 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Nov 2016 12:39:20 -0700
+Subject: [PATCH 4/4] Disable DVD support
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 58b3a17..b7c3fce 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -10,8 +10,7 @@ EC_DIRS= \
+ 	tools/EventClients
+ 
+ DVDPCODECS_DIRS= \
+-	lib \
+-	lib/libdvd
++	lib
+ 
+ VideoPlayer_ARCHIVES=xbmc/cores/VideoPlayer/VideoPlayer.a \
+                    xbmc/cores/VideoPlayer/DVDCodecs/DVDCodecs.a \
+@@ -343,7 +342,6 @@ libaddon: exports
+ 	$(MAKE) -C lib/addons/library.xbmc.pvr
+ 	$(MAKE) -C lib/addons/library.kodi.inputstream
+ dvdpcodecs: dllloader
+-	$(MAKE) -C lib/libdvd
+ 
+ dvdpextcodecs:
+ 
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-to-p8-platform.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-to-p8-platform.patch
new file mode 100644
index 0000000..c4a6ae7
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-to-p8-platform.patch
@@ -0,0 +1,427 @@
+From 06a8224c99282ac1a606edd9e8ea3f591112942d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 18 Feb 2016 14:04:31 +0100
+Subject: [PATCH] Update to p8-platform
+
+---
+ CMakeLists.txt                         |  6 +++---
+ pvr.hts/changelog.txt                  |  4 ++--
+ src/AutoRecordings.cpp                 |  2 +-
+ src/HTSPConnection.cpp                 |  8 +++----
+ src/HTSPDemuxer.cpp                    |  2 +-
+ src/HTSPVFS.cpp                        |  6 +++---
+ src/TimeRecordings.cpp                 |  2 +-
+ src/Tvheadend.cpp                      |  4 ++--
+ src/Tvheadend.h                        | 38 +++++++++++++++++-----------------
+ src/client.cpp                         |  4 ++--
+ src/client.h                           |  4 ++--
+ src/tvheadend/Subscription.cpp         |  2 +-
+ src/tvheadend/Subscription.h           |  4 ++--
+ src/tvheadend/utilities/AsyncState.cpp |  4 ++--
+ src/tvheadend/utilities/AsyncState.h   |  6 +++---
+ 15 files changed, 48 insertions(+), 48 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0842682..cb04942 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,10 +6,10 @@ enable_language(CXX)
+ 
+ find_package(kodi REQUIRED)
+ find_package(kodiplatform REQUIRED)
+-find_package(platform REQUIRED)
++find_package(p8-platform REQUIRED)
+ 
+ include_directories(${kodiplatform_INCLUDE_DIRS}
+-                    ${platform_INCLUDE_DIRS}
++                    ${p8-platform_INCLUDE_DIRS}
+                     ${KODI_INCLUDE_DIR}
+                     ${PROJECT_SOURCE_DIR}/lib)
+ 
+@@ -95,7 +95,7 @@ list(APPEND HTS_SOURCES
+ 
+ add_subdirectory(lib/libhts)
+ 
+-set(DEPLIBS ${platform_LIBRARIES} hts)
++set(DEPLIBS ${p8-platform_LIBRARIES} hts)
+ if(WIN32)
+   list(APPEND DEPLIBS ws2_32)
+ endif()
+diff --git a/pvr.hts/changelog.txt b/pvr.hts/changelog.txt
+index 9ffa33c..1e7fe30 100644
+--- a/pvr.hts/changelog.txt
++++ b/pvr.hts/changelog.txt
+@@ -49,7 +49,7 @@
+ - fixed: Autorec: Start and stop time handling.
+ - fixed: LocaltimeToUTC conversion (timer settings clock display incorrect).
+ - fixed: Several issues with predictive tuning.
+-- added: build: Automatically fill in platform and library name.
++- added: build: Automatically fill in p8-platform and library name.
+ - fixed: Use epg data only for creation of epg-based timers.
+ - improved: Do not try to reconnect to tvh while suspending or not fully awake again.
+ 
+@@ -97,7 +97,7 @@
+ - added: support for creating repeating timers, aka time schedules
+ - fixed: conditions for addon restart after settings changes
+ - internal: fixed build system regressions introduced with move to cmake
+-- internal: updated to use libplatform
++- internal: updated to use libp8-platform
+ 
+ 2.1.7
+ - added: support for radio channel groups
+diff --git a/src/AutoRecordings.cpp b/src/AutoRecordings.cpp
+index 5fa60a0..d9e5e1d 100644
+--- a/src/AutoRecordings.cpp
++++ b/src/AutoRecordings.cpp
+@@ -26,7 +26,7 @@
+ #include "tvheadend/utilities/Utilities.h"
+ #include "tvheadend/utilities/Logger.h"
+ 
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::entity;
+ using namespace tvheadend::utilities;
+diff --git a/src/HTSPConnection.cpp b/src/HTSPConnection.cpp
+index aec1296..86f5004 100644
+--- a/src/HTSPConnection.cpp
++++ b/src/HTSPConnection.cpp
+@@ -19,9 +19,9 @@
+  *
+  */
+ 
+-#include "platform/threads/mutex.h"
+-#include "platform/util/StringUtils.h"
+-#include "platform/sockets/tcp.h"
++#include "p8-platform/threads/mutex.h"
++#include "p8-platform/util/StringUtils.h"
++#include "p8-platform/sockets/tcp.h"
+ 
+ extern "C" {
+ #include "libhts/htsmsg_binary.h"
+@@ -33,7 +33,7 @@ extern "C" {
+ 
+ using namespace std;
+ using namespace ADDON;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::utilities;
+ 
+diff --git a/src/HTSPDemuxer.cpp b/src/HTSPDemuxer.cpp
+index a6e1f12..7f45345 100644
+--- a/src/HTSPDemuxer.cpp
++++ b/src/HTSPDemuxer.cpp
+@@ -27,7 +27,7 @@
+ 
+ using namespace std;
+ using namespace ADDON;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::utilities;
+ 
+diff --git a/src/HTSPVFS.cpp b/src/HTSPVFS.cpp
+index 0463f56..0404bab 100644
+--- a/src/HTSPVFS.cpp
++++ b/src/HTSPVFS.cpp
+@@ -19,8 +19,8 @@
+  *
+  */
+ 
+-#include "platform/threads/mutex.h"
+-#include "platform/util/StringUtils.h"
++#include "p8-platform/threads/mutex.h"
++#include "p8-platform/util/StringUtils.h"
+ #include "tvheadend/utilities/Logger.h"
+ 
+ extern "C" {
+@@ -30,7 +30,7 @@ extern "C" {
+ #include "Tvheadend.h"
+ 
+ using namespace std;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend::utilities;
+ 
+ /*
+diff --git a/src/TimeRecordings.cpp b/src/TimeRecordings.cpp
+index 5d34938..97aae09 100644
+--- a/src/TimeRecordings.cpp
++++ b/src/TimeRecordings.cpp
+@@ -25,7 +25,7 @@
+ #include "tvheadend/utilities/Utilities.h"
+ #include "tvheadend/utilities/Logger.h"
+ 
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::entity;
+ using namespace tvheadend::utilities;
+diff --git a/src/Tvheadend.cpp b/src/Tvheadend.cpp
+index 2057241..14c3bd4 100644
+--- a/src/Tvheadend.cpp
++++ b/src/Tvheadend.cpp
+@@ -23,7 +23,7 @@
+ #include <ctime>
+ #include <memory>
+ 
+-#include "platform/util/StringUtils.h"
++#include "p8-platform/util/StringUtils.h"
+ 
+ #include "Tvheadend.h"
+ #include "tvheadend/utilities/Utilities.h"
+@@ -31,7 +31,7 @@
+ 
+ using namespace std;
+ using namespace ADDON;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::entity;
+ using namespace tvheadend::utilities;
+diff --git a/src/Tvheadend.h b/src/Tvheadend.h
+index 2ce4552..e794716 100644
+--- a/src/Tvheadend.h
++++ b/src/Tvheadend.h
+@@ -22,10 +22,10 @@
+  */
+ 
+ #include "client.h"
+-#include "platform/sockets/tcp.h"
+-#include "platform/threads/threads.h"
+-#include "platform/threads/mutex.h"
+-#include "platform/util/buffer.h"
++#include "p8-platform/sockets/tcp.h"
++#include "p8-platform/threads/threads.h"
++#include "p8-platform/threads/mutex.h"
++#include "p8-platform/util/buffer.h"
+ #include "kodi/xbmc_codec_types.h"
+ #include "kodi/xbmc_stream_utils.hpp"
+ #include "kodi/libXBMC_addon.h"
+@@ -88,7 +88,7 @@ class CHTSPMessage;
+ 
+ /* Typedefs */
+ typedef std::map<uint32_t,CHTSPResponse*> CHTSPResponseList;
+-typedef PLATFORM::SyncedBuffer<CHTSPMessage> CHTSPMessageQueue;
++typedef P8PLATFORM::SyncedBuffer<CHTSPMessage> CHTSPMessageQueue;
+ 
+ /*
+  * HTSP Response handler
+@@ -98,10 +98,10 @@ class CHTSPResponse
+ public:
+   CHTSPResponse();
+   ~CHTSPResponse();
+-  htsmsg_t *Get ( PLATFORM::CMutex &mutex, uint32_t timeout );
++  htsmsg_t *Get ( P8PLATFORM::CMutex &mutex, uint32_t timeout );
+   void      Set ( htsmsg_t *m );
+ private:
+-  PLATFORM::CCondition<volatile bool> m_cond;
++  P8PLATFORM::CCondition<volatile bool> m_cond;
+   bool                                m_flag;
+   htsmsg_t                           *m_msg;
+ };
+@@ -146,7 +146,7 @@ public:
+  * HTSP Connection registration thread
+  */
+ class CHTSPRegister
+-  : public PLATFORM::CThread
++  : public P8PLATFORM::CThread
+ {
+   friend class CHTSPConnection;
+ 
+@@ -163,7 +163,7 @@ private:
+  * HTSP Connection
+  */
+ class CHTSPConnection
+-  : public PLATFORM::CThread
++  : public P8PLATFORM::CThread
+ {
+   friend class CHTSPRegister;
+ 
+@@ -190,7 +190,7 @@ public:
+   inline bool IsConnected       ( void ) const { return m_ready; }
+   bool        WaitForConnection ( void );
+ 
+-  inline PLATFORM::CMutex& Mutex ( void ) { return m_mutex; }
++  inline P8PLATFORM::CMutex& Mutex ( void ) { return m_mutex; }
+ 
+   void        OnSleep ( void );
+   void        OnWake  ( void );
+@@ -202,10 +202,10 @@ private:
+   bool        SendHello        ( void );
+   bool        SendAuth         ( const std::string &u, const std::string &p );
+ 
+-  PLATFORM::CTcpSocket               *m_socket;
+-  PLATFORM::CMutex                    m_mutex;
++  P8PLATFORM::CTcpSocket               *m_socket;
++  P8PLATFORM::CMutex                    m_mutex;
+   CHTSPRegister                       m_regThread;
+-  PLATFORM::CCondition<volatile bool> m_regCond;
++  P8PLATFORM::CCondition<volatile bool> m_regCond;
+   bool                                m_ready;
+   uint32_t                            m_seq;
+   std::string                         m_serverName;
+@@ -273,13 +273,13 @@ public:
+   void SetStreamingProfile(const std::string &profile);
+ 
+ private:
+-  PLATFORM::CMutex                        m_mutex;
++  P8PLATFORM::CMutex                        m_mutex;
+   CHTSPConnection                        &m_conn;
+-  PLATFORM::SyncedBuffer<DemuxPacket*>    m_pktBuffer;
++  P8PLATFORM::SyncedBuffer<DemuxPacket*>    m_pktBuffer;
+   ADDON::XbmcStreamProperties             m_streams;
+   std::map<int,int>                       m_streamStat;
+   int64_t                                 m_seekTime;
+-  PLATFORM::CCondition<volatile int64_t>  m_seekCond;
++  P8PLATFORM::CCondition<volatile int64_t>  m_seekCond;
+   bool                                    m_seeking;
+   bool                                    m_speedChange;
+   tvheadend::status::SourceInfo           m_sourceInfo;
+@@ -350,7 +350,7 @@ private:
+  * Root object for Tvheadend connection
+  */
+ class CTvheadend
+-  : public PLATFORM::CThread
++  : public P8PLATFORM::CThread
+ {
+ public:
+   CTvheadend();
+@@ -422,7 +422,7 @@ private:
+    */
+   tvheadend::Profiles         m_profiles;
+ 
+-  PLATFORM::CMutex            m_mutex;
++  P8PLATFORM::CMutex            m_mutex;
+ 
+   CHTSPConnection             m_conn;
+ 
+@@ -519,7 +519,7 @@ public:
+    */
+   bool WaitForConnection ( void )
+   {
+-    PLATFORM::CLockObject lock(m_conn.Mutex());
++    P8PLATFORM::CLockObject lock(m_conn.Mutex());
+     return m_conn.WaitForConnection();
+   }
+   std::string GetServerName    ( void )
+diff --git a/src/client.cpp b/src/client.cpp
+index 94d2db9..3295914 100644
+--- a/src/client.cpp
++++ b/src/client.cpp
+@@ -22,14 +22,14 @@
+ #include "client.h"
+ #include "kodi/xbmc_pvr_dll.h"
+ #include "kodi/libKODI_guilib.h"
+-#include "platform/util/util.h"
++#include "p8-platform/util/util.h"
+ #include "Tvheadend.h"
+ #include "tvheadend/Settings.h"
+ #include "tvheadend/utilities/Logger.h"
+ 
+ using namespace std;
+ using namespace ADDON;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::utilities;
+ 
+diff --git a/src/client.h b/src/client.h
+index 3a5f950..a10659b 100644
+--- a/src/client.h
++++ b/src/client.h
+@@ -20,8 +20,8 @@
+  *
+  */
+ 
+-#include "platform/os.h"
+-#include "platform/threads/mutex.h"
++#include "p8-platform/os.h"
++#include "p8-platform/threads/mutex.h"
+ #include "kodi/libXBMC_addon.h"
+ #include "kodi/libXBMC_pvr.h"
+ #include "kodi/libXBMC_codec.h"
+diff --git a/src/tvheadend/Subscription.cpp b/src/tvheadend/Subscription.cpp
+index 182ca7f..e18af1e 100644
+--- a/src/tvheadend/Subscription.cpp
++++ b/src/tvheadend/Subscription.cpp
+@@ -23,7 +23,7 @@
+ #include "utilities/Logger.h"
+ #include "../Tvheadend.h"
+ 
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ using namespace tvheadend;
+ using namespace tvheadend::utilities;
+ 
+diff --git a/src/tvheadend/Subscription.h b/src/tvheadend/Subscription.h
+index b03bcce..363e5ef 100644
+--- a/src/tvheadend/Subscription.h
++++ b/src/tvheadend/Subscription.h
+@@ -22,7 +22,7 @@
+  */
+ 
+ #include <string>
+-#include "platform/threads/mutex.h"
++#include "p8-platform/threads/mutex.h"
+ 
+ extern "C"
+ {
+@@ -146,6 +146,6 @@ namespace tvheadend
+     std::string       m_profile;
+     CHTSPConnection   &m_conn;
+ 
+-    mutable PLATFORM::CMutex  m_mutex;
++    mutable P8PLATFORM::CMutex  m_mutex;
+   };
+ }
+diff --git a/src/tvheadend/utilities/AsyncState.cpp b/src/tvheadend/utilities/AsyncState.cpp
+index 0c30a93..1f4fdf3 100644
+--- a/src/tvheadend/utilities/AsyncState.cpp
++++ b/src/tvheadend/utilities/AsyncState.cpp
+@@ -22,7 +22,7 @@
+ #include "AsyncState.h"
+ 
+ using namespace tvheadend::utilities;
+-using namespace PLATFORM;
++using namespace P8PLATFORM;
+ 
+ struct Param {
+   eAsyncState state;
+@@ -37,7 +37,7 @@ AsyncState::AsyncState(int timeout)
+ 
+ eAsyncState AsyncState::GetState()
+ {
+-  PLATFORM::CLockObject lock(m_mutex);
++  P8PLATFORM::CLockObject lock(m_mutex);
+   return m_state;
+ }
+ 
+diff --git a/src/tvheadend/utilities/AsyncState.h b/src/tvheadend/utilities/AsyncState.h
+index 1d672da..0819cd8 100644
+--- a/src/tvheadend/utilities/AsyncState.h
++++ b/src/tvheadend/utilities/AsyncState.h
+@@ -22,7 +22,7 @@
+ #ifndef ASYNCSTATE_H
+ #define	ASYNCSTATE_H
+ 
+-#include "platform/threads/mutex.h"
++#include "p8-platform/threads/mutex.h"
+ 
+ namespace tvheadend {
+   namespace utilities {
+@@ -75,8 +75,8 @@ namespace tvheadend {
+       static bool PredicateCallback ( void *param );
+ 
+       eAsyncState m_state;
+-      PLATFORM::CMutex m_mutex;
+-      PLATFORM::CCondition<bool> m_condition;
++      P8PLATFORM::CMutex m_mutex;
++      P8PLATFORM::CCondition<bool> m_condition;
+       int m_timeout;
+ 
+     };
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
new file mode 100644
index 0000000..1f33a8a
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Kodi Media Center PVR plugins"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://src/client.cpp;md5=c8f6b73c5bc1048a3d6506700a7a91d2"
+
+DEPENDS = " \
+            zip-native \
+            p8platform \
+            kodi-platform \
+          "
+
+SRCREV_pvrhts = "7f75b70527922aef953123ff97ebaa22d9fb7cb4"
+
+SRCREV_FORMAT = "pvrhts"
+
+PV = "2.2.13+gitr${SRCPV}"
+SRC_URI = "git://github.com/kodi-pvr/pvr.hts.git;branch=Jarvis;destsuffix=pvr.hts;name=pvrhts \
+           file://0001-Update-to-p8-platform.patch \
+          "
+
+inherit cmake pkgconfig gettext
+
+S = "${WORKDIR}/pvr.hts"
+
+EXTRA_OECMAKE = " \
+	  -DADDONS_TO_BUILD=pvr.hts \
+	  -DADDON_SRC_PREFIX=${WORKDIR}/git \
+	  -DCMAKE_BUILD_TYPE=Debug \
+	  -DCMAKE_INSTALL_PREFIX=${datadir}/kodi/addons \
+          -DCMAKE_MODULE_PATH=${STAGING_DIR_HOST}${libdir}/kodi \
+          -DCMAKE_PREFIX_PATH=${STAGING_DIR_HOST}${prefix} \
+          -DPACKAGE_ZIP=1 \
+        "
+
+do_compile_prepend() {
+	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
+	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' \
+	          ${B}/CMakeFiles/*/flags.make
+	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g'\
+	          ${B}/CMakeFiles/*/link.txt
+}
+
+# Make zip package for manual installation
+do_install_append() {
+	install -d ${D}${datadir}/kodi/addons/packages/
+	( cd ${D}${datadir}/kodi/addons
+	  zip -r ${D}${datadir}/kodi/addons/packages/pvr.hts-${PV}.zip pvr.hts -x '*.debug*' )
+}
+
+# Doesn't get added automagically, dlopen()?
+RDEPENDS_${PN} = "libkodiplatform"
+
+INSANE_SKIP_${PN} = "dev-so"
+FILES_${PN} += "${datadir}/kodi"
+FILES_${PN}-dbg += "${datadir}/kodi/addons/*/.debug/"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
new file mode 100644
index 0000000..35e5134
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-after-platform-rename.patch
@@ -0,0 +1,67 @@
+From 7cf366faa7a24c7146c745c8cd8dc3ae3d1cabea Mon Sep 17 00:00:00 2001
+From: Garrett Brown <themagnificentmrb@gmail.com>
+Date: Thu, 7 Jan 2016 15:55:22 -0800
+Subject: [PATCH] Fix build after platform rename
+
+update source code to use renamed platform pkg
+---
+ CMakeLists.txt      | 6 +++---
+ debian/control      | 2 +-
+ src/util/XMLUtils.h | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2ce8c0d..bf6b659 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -8,7 +8,7 @@ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
+ find_package(kodi REQUIRED)
+ find_package(TinyXML REQUIRED)
+ find_package(Threads REQUIRED)
+-find_package(platform REQUIRED)
++find_package(p8-platform REQUIRED)
+ include(UseMultiArch.cmake)
+ include(CheckAtomic.cmake)
+ 
+@@ -36,10 +36,10 @@ endif()
+ 
+ set(SOURCES src/util/XMLUtils.cpp)
+ 
+-include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} ${platform_INCLUDE_DIRS})
++include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} ${p8-platform_INCLUDE_DIRS})
+ 
+ add_library(kodiplatform ${SOURCES} ${PLAT_SOURCES})
+-target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} ${platform_LIBRARIES})
++target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} ${p8-platform_LIBRARIES})
+ set_target_properties(kodiplatform PROPERTIES VERSION ${kodiplatform_VERSION_MAJOR}.${kodiplatform_VERSION_MINOR}.${kodiplatform_VERSION_PATCH}
+                                               SOVERSION ${kodiplatform_VERSION_MAJOR}.0)
+ 
+diff --git a/debian/control b/debian/control
+index 42cadb2..e40c982 100644
+--- a/debian/control
++++ b/debian/control
+@@ -1,7 +1,7 @@
+ Source: kodiplatform
+ Priority: extra
+ Maintainer: Arne Morten Kvarving <arne.morten.kvarving@sintef.no>
+-Build-Depends: debhelper (>= 8.0.0), cmake, libtinyxml-dev, kodi-addon-dev, libplatform-dev
++Build-Depends: debhelper (>= 8.0.0), cmake, libtinyxml-dev, kodi-addon-dev, libp8-platform-dev
+ Standards-Version: 3.9.2
+ Section: libs
+ 
+diff --git a/src/util/XMLUtils.h b/src/util/XMLUtils.h
+index f22fd07..a10d831 100644
+--- a/src/util/XMLUtils.h
++++ b/src/util/XMLUtils.h
+@@ -21,7 +21,7 @@
+  *
+  */
+ 
+-#include <platform/util/StdString.h>
++#include <p8-platform/util/StdString.h>
+ #include "tinyxml.h"
+ 
+ class XMLUtils
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-compile-badness.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-compile-badness.patch
new file mode 100644
index 0000000..27e9d21
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-compile-badness.patch
@@ -0,0 +1,40 @@
+From 3136317f096ea7fda4fb907e775a01952c4aae3d Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Fri, 19 Feb 2016 10:33:00 +0100
+Subject: [PATCH] fix cross compile badness
+
+From https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/kodi-platform/patches/kodi-platform-01_crosscompile-badness.patch
+---
+ CMakeLists.txt               | 2 +-
+ kodiplatform-config.cmake.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bf6b659..9abe773 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -22,7 +22,7 @@ if(NOT WIN32)
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
+ endif()
+ 
+-set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} "${CMAKE_INSTALL_PREFIX}/include/kodi")
++set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} "${CMAKE_INSTALL_PREFIX_TOOLCHAIN}/include/kodi")
+ IF(WIN32)
+   LIST(APPEND kodiplatform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/kodi/windows")
+ ENDIF(WIN32)
+diff --git a/kodiplatform-config.cmake.in b/kodiplatform-config.cmake.in
+index 3fc5273..60bdf1b 100644
+--- a/kodiplatform-config.cmake.in
++++ b/kodiplatform-config.cmake.in
+@@ -10,7 +10,7 @@
+ #
+ # propagate these properties from one build system to the other
+ set (kodiplatform_VERSION "@kodiplatform_VERSION_MAJOR@.@kodiplatform_VERSION_MINOR@")
+-set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
++set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX_TOOLCHAIN@/include)
+ set (kodiplatform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
+ set (kodiplatform_LINKER_FLAGS "@kodiplatform_LINKER_FLAGS@")
+ set (kodiplatform_CONFIG_VARS "@kodiplatform_CONFIG_VARS@")
+-- 
+2.0.1
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_no-multi-lib.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_no-multi-lib.patch
new file mode 100644
index 0000000..a13c53b
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_no-multi-lib.patch
@@ -0,0 +1,12 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9abe773..ae433fc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -9,7 +9,6 @@ find_package(kodi REQUIRED)
+ find_package(TinyXML REQUIRED)
+ find_package(Threads REQUIRED)
+ find_package(p8-platform REQUIRED)
+-include(UseMultiArch.cmake)
+ include(CheckAtomic.cmake)
+ 
+ set(kodiplatform_NAME kodiplatform)
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
new file mode 100644
index 0000000..5077454
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Platform support library used by libCEC and binary add-ons for Kodi"
+HOMEPAGE = "http://libcec.pulse-eight.com/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://src/util/XMLUtils.cpp;beginline=2;endline=18;md5=dae8e846500e70dd8ecee55f3f018c30"
+
+DEPENDS = "libtinyxml kodi"
+
+PV = "16.0.0"
+
+SRCREV = "15edaf78d6307eaa5e1d17028122d8bce9d55aa2"
+SRC_URI = "git://github.com/xbmc/kodi-platform.git \
+           file://0001-Fix-build-after-platform-rename.patch \
+           file://0001-fix-cross-compile-badness.patch \
+           file://kodi-platform-02_no-multi-lib.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX_TOOLCHAIN=${STAGING_DIR_TARGET} \
+                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
+                  -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} \
+                  -DKODI_INCLUDE_DIR=${STAGING_LIBDIR}/kodi \
+                  -DKODI_INCLUDE_DIR=${STAGING_INCDIR}/kodi \
+                "
+
+do_compile_prepend() {
+	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
+	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' \
+	          ${B}/CMakeFiles/kodiplatform.dir/flags.make
+	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g'\
+	          ${B}/CMakeFiles/kodiplatform.dir/link.txt
+}
+
+RPROVIDES_${PN} += "libkodiplatform"
+FILES_${PN}-dev += "${libdir}/*platform"
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
new file mode 100644
index 0000000..955d02b
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Systemd service for kodi startup"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+PV = "1.0"
+
+SRC_URI = "file://kodi.service"
+
+inherit systemd
+
+do_install() {
+	install -d ${D}/lib/systemd/system
+	install -m 0644 ${WORKDIR}/kodi.service ${D}/lib/systemd/system/ 
+}
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "kodi.service"
+
+RDEPENDS_${PN} += "xinit kodi"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
new file mode 100644
index 0000000..29d0394
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Kodi media thing
+
+[Service]
+User=root
+Type=simple
+SuccessExitStatus=0 1
+IOSchedulingClass=realtime
+IOSchedulingPriority=0
+
+ExecStart=/usr/bin/xinit /usr/bin/kodi-standalone -- /usr/bin/X :0 
+
+[Install]
+WantedBy=basic.target
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
new file mode 100644
index 0000000..38a53ee
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_16.bb
@@ -0,0 +1,188 @@
+SUMMARY = "Kodi Media Center"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=930e2a5f63425d8dd72dbd7391c43c46"
+
+FILESPATH =. "${FILE_DIRNAME}/kodi-16:"
+
+DEPENDS = " \
+            cmake-native \
+            curl-native \
+            gperf-native \
+            jsonschemabuilder-native \
+            nasm-native \
+            swig-native \
+            yasm-native \
+            zip-native \
+            avahi \
+            boost \
+            bzip2 \
+            curl \
+            dcadec \
+            enca \
+            expat \
+            faad2 \
+            ffmpeg \
+            fontconfig \
+            fribidi \
+            giflib \
+            jasper \
+            libass \
+            libcdio \
+            libcec \
+            libmad \
+            libmicrohttpd \
+            libmms \
+            libmms \
+            libmodplug \
+            libpcre \
+            libplist \
+            libsamplerate0 \
+            libsdl-image \
+            libsdl-mixer \
+            libsquish \
+            libssh \
+            libtinyxml \
+            libusb1 \
+            libxslt \
+            lzo \
+            mpeg2dec \
+            python \
+            samba \
+            sqlite3 \
+            taglib \
+            virtual/egl \
+            virtual/libsdl \
+            wavpack \
+            yajl \
+            zlib \
+            ${@enable_glew(bb, d)} \
+          "
+
+PROVIDES = "xbmc"
+
+SRCREV = "4982009b56d184f8ce7890e947d0bd986e49828a"
+PV = "16.1+gitr${SRCPV}"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Jarvis \
+           file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
+           file://0002-arm64-Fix-build-breakages-due-to-architecture-specif.patch \
+           file://0003-configure-add-aarch64-support.patch \
+           file://0004-configure-remove-gles-neon-wayland-assumptions.patch \
+           file://0005-handle-SIGTERM.patch \
+           file://0006-add-support-to-read-frequency-output-if-using-intel-.patch \
+           file://0006-ffmpeg30.patch \
+           file://0007-https-github.com-OpenELEC-OpenELEC.tv-blob-master-pa.patch \
+           file://0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch \
+           file://0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch \
+           file://0010-curl-support-version-7.5.0-and-upwards.patch \
+           file://0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch \
+"
+
+inherit autotools-brokensep gettext pythonnative
+
+S = "${WORKDIR}/git"
+
+# breaks compilation
+ASNEEDED = ""
+
+ACCEL ?= ""
+ACCEL_x86 = "vaapi vdpau"
+ACCEL_x86-64 = "vaapi vdpau"
+
+PACKAGECONFIG ??= "${ACCEL}"
+PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
+PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' opengl', ' openglesv2', d)}"
+
+PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
+PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
+PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
+PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+
+EXTRA_OECONF_append_rpi = "--disable-openmax --enable-player=omxplayer --with-platform=raspberry-pi"
+#LDFLAGS_append_rpi = " -lEGL -lGLESv2 -lbcm_host -lvcos -lvchiq_arm -lvchostif -lmmal -lmmal_core -lmmal_util "
+LDFLAGS_append_rpi = " -lvchostif "
+EXTRA_OECONF = " \
+    --disable-debug \
+    --disable-libcap \
+    --disable-ccache \
+    --disable-mid \
+    --enable-libusb \
+    --enable-airplay \
+    --enable-alsa \
+    --disable-optical-drive \
+    --with-ffmpeg=shared \
+    --enable-texturepacker=no \
+"
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+# for python modules
+export HOST_SYS
+export BUILD_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+export PYTHON_DIR
+
+def enable_glew(bb, d):
+    if bb.utils.contains('PACKAGECONFIG', 'x11', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d):
+        return "glew"
+    return ""
+
+do_configure() {
+    ( for i in $(find ${S} -name "configure.*" ) ; do
+       cd $(dirname $i) && gnu-configize --force || true
+    done )
+    make -C tools/depends/target/crossguid PREFIX=${STAGING_DIR_HOST}${prefix}
+
+    BOOTSTRAP_STANDALONE=1 make -f bootstrap.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
+    BOOTSTRAP_STANDALONE=1 make -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
+    oe_runconf
+}
+
+do_compile_prepend() {
+    for i in $(find . -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
+    done
+
+    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
+    done
+}
+
+INSANE_SKIP_${PN} = "rpaths"
+
+FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${libdir}/xbmc ${datadir}/xbmc"
+FILES_${PN}-dbg += "${libdir}/kodi/.debug ${libdir}/kodi/*/.debug ${libdir}/kodi/*/*/.debug ${libdir}/kodi/*/*/*/.debug"
+
+# kodi uses some kind of dlopen() method for libcec so we need to add it manually
+# OpenGL builds need glxinfo, that's in mesa-demos
+RRECOMMENDS_${PN}_append = " libcec \
+                             python \
+                             python-lang \
+                             python-re \
+                             python-netclient \
+                             python-html \
+                             python-difflib \
+                             python-json \
+                             python-zlib \
+                             python-shell \
+                             python-sqlite3 \
+                             python-compression \
+                             libcurl \
+                             ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr xdpyinfo', '', d)} \
+"
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 \
+                                        glibc-gconv-ibm850 \
+					glibc-gconv-unicode \
+                                        glibc-gconv-utf-32 \
+					glibc-charmap-utf-8 \
+					glibc-localedata-en-us \
+                                      "
+
+RPROVIDES_${PN} += "xbmc"
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
new file mode 100644
index 0000000..bdf077a
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -0,0 +1,181 @@
+SUMMARY = "Kodi Media Center"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=930e2a5f63425d8dd72dbd7391c43c46"
+
+DEFAULT_PREFERENCE = "-1"
+
+FILESPATH =. "${FILE_DIRNAME}/kodi-17:"
+
+DEPENDS = " \
+            cmake-native \
+            curl-native \
+            gperf-native \
+            jsonschemabuilder-native \
+            nasm-native \
+            swig-native \
+            yasm-native \
+            zip-native \
+            avahi \
+            boost \
+            bzip2 \
+            curl \
+            dcadec \
+            enca \
+            expat \
+            faad2 \
+            ffmpeg \
+            fontconfig \
+            fribidi \
+            giflib \
+            jasper \
+            libass \
+            libcdio \
+            libcec \
+            libmad \
+            libmicrohttpd \
+            libmms \
+            libmms \
+            libmodplug \
+            libpcre \
+            libplist \
+            libsamplerate0 \
+            libsdl-image \
+            libsdl-mixer \
+            libsquish \
+            libssh \
+            libtinyxml \
+            libusb1 \
+            libxslt \
+            lzo \
+            mpeg2dec \
+            python \
+            samba \
+            sqlite3 \
+            taglib \
+            virtual/egl \
+            virtual/libsdl \
+            wavpack \
+            yajl \
+            zlib \
+            ${@enable_glew(bb, d)} \
+          "
+
+PROVIDES = "xbmc"
+
+SRCREV = "32c7788e7cce711be5b7f3893c82dddd79658268"
+PV = "17.0+gitr${SRCPV}"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
+           file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
+           file://0002-handle-SIGTERM.patch \
+           file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
+           file://0004-Disable-DVD-support.patch \
+"
+
+inherit autotools-brokensep gettext pythonnative
+
+S = "${WORKDIR}/git"
+
+# breaks compilation
+ASNEEDED = ""
+
+ACCEL ?= ""
+ACCEL_x86 = "vaapi vdpau"
+ACCEL_x86-64 = "vaapi vdpau"
+
+PACKAGECONFIG ??= "${ACCEL}"
+PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)}"
+PACKAGECONFIG_append += "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', ' opengl', ' openglesv2', d)}"
+
+PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
+PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
+PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
+PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+
+EXTRA_OECONF_append_rpi = " --disable-openmax --enable-player=omxplayer --with-platform=raspberry-pi2"
+LDFLAGS_append_rpi = " -lvchostif "
+EXTRA_OECONF = " \
+    --disable-debug \
+    --disable-libcap \
+    --disable-ccache \
+    --disable-mid \
+    --enable-libusb \
+    --enable-alsa \
+    --enable-airplay \
+    --disable-optical-drive \
+    --with-ffmpeg=shared \
+    --enable-texturepacker=no \
+"
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+# for python modules
+export HOST_SYS
+export BUILD_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+export PYTHON_DIR
+
+def enable_glew(bb, d):
+    if bb.utils.contains('PACKAGECONFIG', 'x11', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d):
+        return "glew"
+    return ""
+
+do_configure() {
+    ( for i in $(find ${S} -name "configure.*" ) ; do
+       cd $(dirname $i) && gnu-configize --force || true
+    done )
+    make -C tools/depends/target/crossguid PREFIX=${STAGING_DIR_HOST}${prefix}
+
+    BOOTSTRAP_STANDALONE=1 make -f bootstrap.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
+    BOOTSTRAP_STANDALONE=1 make -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
+    oe_runconf
+}
+
+do_compile_prepend() {
+    for i in $(find . -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
+    done
+
+    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
+        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
+    done
+}
+
+INSANE_SKIP_${PN} = "rpaths"
+
+FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${libdir}/xbmc ${datadir}/xbmc"
+FILES_${PN}-dbg += "${libdir}/kodi/.debug ${libdir}/kodi/*/.debug ${libdir}/kodi/*/*/.debug ${libdir}/kodi/*/*/*/.debug"
+
+# kodi uses some kind of dlopen() method for libcec so we need to add it manually
+# OpenGL builds need glxinfo, that's in mesa-demos
+RRECOMMENDS_${PN}_append = " libcec \
+                             python \
+                             python-lang \
+                             python-re \
+                             python-netclient \
+                             python-html \
+                             python-difflib \
+                             python-json \
+                             python-zlib \
+                             python-shell \
+                             python-sqlite3 \
+                             python-compression \
+                             libcurl \
+                             ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr xdpyinfo', '', d)} \
+"
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 \
+                                        glibc-gconv-ibm850 \
+					glibc-gconv-unicode \
+                                        glibc-gconv-utf-32 \
+					glibc-charmap-utf-8 \
+					glibc-localedata-en-us \
+                                      "
+
+RPROVIDES_${PN} += "xbmc"
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
deleted file mode 100644
index dfc3959..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-python-distutils-to-find-STAGING.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0dce5a2abd9f42876616c35772a4d71c5399543c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 17 Dec 2011 11:38:15 +0100
-Subject: [PATCH 1/4] configure: don't run python distutils to find STAGING_INCDIR/python, it is not safe for per-machine sysroots
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- m4/ax_python_devel.m4 |    7 +------
- 1 files changed, 1 insertions(+), 6 deletions(-)
-
-diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index adbd207..dee70f6 100644
---- a/m4/ax_python_devel.m4
-+++ b/m4/ax_python_devel.m4
-@@ -151,12 +151,7 @@ $ac_distutils_result])
- 	#
- 	AC_MSG_CHECKING([for Python include path])
- 	if test -z "$PYTHON_CPPFLAGS"; then
--		python_path=`$PYTHON -c "import distutils.sysconfig; \
--			print (distutils.sysconfig.get_python_inc ());"`
--		if test -n "${python_path}"; then
--			python_path="-I$python_path"
--		fi
--		PYTHON_CPPFLAGS=$python_path
-+		PYTHON_CPPFLAGS="-I${STAGING_INCDIR}/${PYTHON_DIR}"
- 	fi
- 	AC_MSG_RESULT([$PYTHON_CPPFLAGS])
- 	AC_SUBST([PYTHON_CPPFLAGS])
--- 
-1.7.2.5
-
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
deleted file mode 100644
index e0a4037..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7b2a8a7869d257cba35f53f6d877877c29cdac27 Mon Sep 17 00:00:00 2001
-From: Paul Menzel <paulepanter@users.sourceforge.net>
-Date: Sun, 14 Aug 2011 21:53:47 +0200
-Subject: [PATCH 2/4] Revert "fixed:[ios] Add memory barriers to atomic Add/Subtract and Increment/Decrement functions to ensure synchronized accesses."
-
-This reverts commit 9a10c48710df79118e39e9b3bb0a15bf1fe694d1.
-
-The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
-
-        make -C xbmc/threads
-        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
-        CPP     Atomics.o
-        /tmp/ccIzTm3L.s: Assembler messages:
-        /tmp/ccIzTm3L.s:40: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:48: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:76: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:83: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:111: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:118: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:145: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:152: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:180: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccIzTm3L.s:187: Error: garbage following instruction -- `dmb ish'
-        make[1]: *** [Atomics.o] Error 1
-        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
-        make: *** [xbmc/threads/threads.a] Error 2
----
- xbmc/threads/Atomics.cpp |    8 --------
- 1 files changed, 0 insertions(+), 8 deletions(-)
-
-diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
-index 5b09f18..0a98a7e 100644
---- a/xbmc/threads/Atomics.cpp
-+++ b/xbmc/threads/Atomics.cpp
-@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "add     %0,  #1        \n" // (val += 1)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr)
-                 : "r1"
-@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long amount)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "add     %0,  %2        \n" // (val += amount)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr), "r"(amount)
-                 : "r1"
-@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
- {
-   register long val;
-   asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "sub     %0,  #1        \n" // (val -= 1)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr)
-                 : "r1"
-@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long amount)
- {
-   register long val;
-   asm volatile (
--                "dmb     ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
-                 "1:                     \n" 
-                 "ldrex   %0, [%1]       \n" // (val = *pAddr)
-                 "sub     %0,  %2        \n" // (val -= amount)
-                 "strex   r1,  %0, [%1]	\n"
-                 "cmp     r1,   #0       \n"
-                 "bne     1b             \n"
--                "dmb     ish            \n" // Memory barrier.
-                 : "=&r" (val)
-                 : "r"(pAddr), "r"(amount)
-                 : "r1"
--- 
-1.7.2.5
-
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
deleted file mode 100644
index 629017b..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From aaae1616a09d359b52e929f944ca0ceb4bb7f831 Mon Sep 17 00:00:00 2001
-From: Paul Menzel <paulepanter@users.sourceforge.net>
-Date: Sun, 14 Aug 2011 21:55:09 +0200
-Subject: [PATCH 3/4] Revert "fixed:[ios] Add memory barriers to cas() assembly to ensure alignment of memory accesses."
-
-This reverts commit 92bab651e2253d172879995b50985645b77fecd2.
-
-The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails with the following error.
-
-        CPP     Atomics.o
-        make[1]: Entering directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/windows'
-        CPP     GUIMediaWindow.o
-        /tmp/ccrsywuV.s: Assembler messages:
-        /tmp/ccrsywuV.s:40: Error: garbage following instruction -- `dmb ish'
-        /tmp/ccrsywuV.s:48: Error: garbage following instruction -- `dmb ish'
-        make[1]: *** [Atomics.o] Error 1
-        make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/threads'
-        make: *** [xbmc/threads/threads.a] Error 2
----
- xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
- 1 files changed, 16 insertions(+), 17 deletions(-)
-
-diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
-index 0a98a7e..0967eb2 100644
---- a/xbmc/threads/Atomics.cpp
-+++ b/xbmc/threads/Atomics.cpp
-@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal, long swapVal)
- #elif defined(__arm__)
- long cas(volatile long* pAddr, long expectedVal, long swapVal)
- {
--  register long prev;
--  asm volatile (
--                "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
--                "1:                      \n"
--                "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,
--                "cmp      %0,  %2        \n" // Verify that the current value (%0) == old value (%2)
--                "bne      2f             \n" // Bail if the two values are not equal [not as expected]
--                "strex    r1,  %3, [%1]  \n"
--                "cmp      r1,  #0        \n"
--                "bne      1b             \n"
--                "dmb      ish            \n" // Memory barrier.
--                "2:                      \n"
--                : "=&r" (prev)
--                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
--                : "r1"
--                );
--  return prev;
-+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
-+//  register long prev;
-+//  asm volatile (
-+//                "1:                      \n"
-+//                "ldrex    %0, [%1]       \n" /* Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,  */
-+//                "cmp      %0,  %2        \n" /* Verify that the current value (%0) == old value (%2) */
-+//                "bne      2f             \n" /* Bail if the two values are not equal [not as expected] */
-+//                "strex    r1,  %3, [%1]  \n"
-+//                "cmp      r1,  #0        \n"                
-+//                "bne      1b             \n"
-+//                "2:                        "
-+//                : "=&r" (prev)
-+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
-+//                : "r1"
-+//                );
-+//  return prev;
- }
- 
- #elif defined(__mips__)
--- 
-1.7.2.5
-
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
deleted file mode 100644
index 345e20e..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 11 Mar 2013 11:04:29 +0100
-Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-Stature: backport
-
- configure.in |   12 +++++++-----
- 1 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index ef94683..c8b459b 100755
---- a/configure.in
-+++ b/configure.in
-@@ -18,9 +18,14 @@ tolower(){
- # check for library basenames
- AC_DEFUN([XB_FIND_SONAME],
- [
-+  #set -x
-   if [[ "$host_vendor" != "apple" ]]; then
-     AC_MSG_CHECKING([for lib$2 soname])
-     $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M 2>/dev/null | grep "^LOAD.*$2" | awk '{V=2; print $V}')
-+    if [[ -z $$1_FILENAME ]]; then
-+      #try gold linker syntax
-+      $1_FILENAME=$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-t 3>&1 1>&2 2>&3 | grep "$2")
-+    fi
-     if [[ ! -z $$1_FILENAME ]]; then
-       $1_SONAME=$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | awk '{V=2; print $V}')
-     fi
-@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
-     AC_MSG_RESULT([$$1_SONAME])
-     AC_SUBST($1_SONAME)
-   fi
-+  #set +x
- ])
- 
- # Function to push and pop libs and includes for a command
--- 
-1.7.7.6
-
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
deleted file mode 100644
index 5c14059..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Sat, 6 Oct 2012 06:40:03 -0300
-Subject: [PATCH] configure.in: Avoid running code or we break cross-compile
-
-Upstream-Status: Backport [similar change done for 12.0]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- configure.in |    6 +-----
- 1 files changed, 1 insertions(+), 5 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index ef94683..d7efcb0 100755
---- a/configure.in
-+++ b/configure.in
-@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" = "yes"; then
-   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external FFmpeg libraries.])
- 
-   # Disable vdpau support if external libavcodec doesn't have it
--  AC_RUN_IFELSE(
--    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
--      [[avcodec_register_all();
--        AVCodec *codec = avcodec_find_decoder_by_name("vc1_vdpau");
--        return (codec) ? 0 : 1;]]),,
-+  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
-     [if test "x$use_vdpau" = "xyes"; then
-       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
-     else
--- 
-1.7.2.5
-
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
deleted file mode 100644
index 0d8dd5c..0000000
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ /dev/null
@@ -1,97 +0,0 @@
-SUMMARY = "XBMC Media Center"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
-
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml libmad"
-#require recipes/egl/egl.inc
-
-
-SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
-
-# multiple issues
-PNBLACKLIST[xbmc] ?= "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
-
-PV = "11.0+gitr${SRCPV}"
-PR = "r14"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Eden \
-           file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
-           file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
-           file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
-           file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch \
-           file://configure.in-Avoid-running-code.patch \
-"
-
-inherit autotools gettext python-dir
-
-S = "${WORKDIR}/git"
-
-# breaks compilation
-CCACHE = ""
-
-CACHED_CONFIGUREVARS += " \
-    ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
-"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
-PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
-PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
-
-EXTRA_OECONF = " \
-    --disable-rpath \
-    --enable-libusb \
-    --enable-airplay \
-    --disable-optical-drive \
-    --enable-external-libraries \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
-"
-
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-EXTRA_OECONF_append_armv7a = "--cpu=cortex-a8"
-
-# for python modules
-export STAGING_LIBDIR
-export STAGING_INCDIR
-export PYTHON_DIR
-
-do_configure() {
-    sh bootstrap
-    oe_runconf
-}
-
-PARALLEL_MAKE = ""
-
-do_compile_prepend() {
-    for i in $(find . -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
-    done
-
-    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
-    done
-}
-
-INSANE_SKIP_${PN} = "rpaths"
-
-# on ARM architectures xbmc will use GLES which will make the regular wrapper fail, so start it directly
-do_install_append_arm() {
-    sed -i -e 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g' ${D}${datadir}/applications/xbmc.desktop
-}
-
-FILES_${PN} += "${datadir}/xsessions ${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
-
-# xbmc uses some kind of dlopen() method for libcec so we need to add it manually
-# OpenGL builds need glxinfo, that's in mesa-demos
-RRECOMMENDS_${PN}_append = " libcec \
-                             python \
-                             python-lang \
-                             python-re \
-                             python-netclient \
-                             libcurl \
-                             xdpyinfo \
-                             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
-"
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
-- 
2.10.2


