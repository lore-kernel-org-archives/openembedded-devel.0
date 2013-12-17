Return-Path: <andrei@gherzan.ro>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id DBFCF60CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:41:02 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id w5so2815654qac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SSNylJvvwdYWQaor+vL0kyataeg/LNEY3brtuL4ZmJA=;
	b=EizWddwgbOVzrYlkn+CgUX4JaWAu4NaV4TS/Rbyo6u613qMlttXGaA3t4bkGaXA0Vg
	ij/UTwLCboUljXRyR7nABGtspfdVwc5gd9G/Yq80Ud4GhF6AC+p3Fkvl/44nNpwIOBp7
	qOV8EEHaoMD1ag34iO0TUn68bsod5/rZbomu5cxWVVugIS7inCVbEWuamQNLk+uavaex
	cvM2cb56OzyaLYn45jf7483USafVTNVH5wixbMNv5TbqTNUbD2Ze+Lt210lbEsHTctTb
	gC4kxf3QAmIx620d19pRPafc0ZxbjQqEjc2521EstLkwAq7nsZYC5MAHY1nndaDotqUW
	KkBA==
X-Gm-Message-State: ALoCoQkq8cs6hHjGauAp29v4p7pNFEufNanAtdZw7vugcUmQRaT4E2/0Bqp+DlIDAQm/wX+WYdyB
X-Received: by 10.49.106.37 with SMTP id gr5mr44425259qeb.75.1387298463376;
	Tue, 17 Dec 2013 08:41:03 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPSA id
	fc16sm52897824qeb.3.2013.12.17.08.41.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 08:41:02 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2013 18:40:49 +0200
Message-Id: <1387298449-20000-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: [meta-multimedia][PATCH 1/1] xbmc: Update to v12.2
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
X-List-Received-Date: Tue, 17 Dec 2013 16:41:03 -0000

* exported TEXTUREPACKER_NATIVE_ROOT variable to compile
TexturePacker using native sysroot
* added libsdl-image-native needed by TexturePacker
* added missing dependency on taglib
* remove already merged patches
* define PACKAGECONFIG for sdl, airplay and ssh configuration
* have above PACKAGECONFIG values activated by default
* use internal ffmpeg - there are some known issues while compiling
with external libav
* define use_arch to be passed to internal ffmpeg configuration
script

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
Change-Id: I538f4907a9d1dd5df31648bfb60a18cacfed9d69
---
 ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch | 118 ++++++++++-----------
 ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  82 +++++++-------
 ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 --------
 .../xbmc/configure.in-Avoid-running-code.patch     |  32 ------
 .../xbmc/{xbmc_git.bb => xbmc_12.2.bb}             |  27 +++--
 5 files changed, 108 insertions(+), 194 deletions(-)
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch
 delete mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
 rename meta-multimedia/recipes-mediacentre/xbmc/{xbmc_git.bb => xbmc_12.2.bb} (74%)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
index e0a4037..d3ae75e 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch
@@ -24,74 +24,68 @@ The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails wi
         make[1]: *** [Atomics.o] Error 1
         make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/threads'
         make: *** [xbmc/threads/threads.a] Error 2
----
- xbmc/threads/Atomics.cpp |    8 --------
- 1 files changed, 0 insertions(+), 8 deletions(-)
 
-diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
-index 5b09f18..0a98a7e 100644
---- a/xbmc/threads/Atomics.cpp
-+++ b/xbmc/threads/Atomics.cpp
-@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
- {
+Index: git/xbmc/threads/Atomics.cpp
+===================================================================
+--- git.orig/xbmc/threads/Atomics.cpp
++++ git/xbmc/threads/Atomics.cpp
+@@ -168,14 +166,12 @@ long AtomicIncrement(volatile long* pAdd
+ #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
    register long val;
    asm volatile (
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
+-    "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+     "1:                     \n" 
+     "ldrex   %0, [%1]       \n" // (val = *pAddr)
+     "add     %0,  #1        \n" // (val += 1)
+     "strex   r1,  %0, [%1]	\n"
+     "cmp     r1,   #0       \n"
+     "bne     1b             \n"
+-    "dmb     ish            \n" // Memory barrier.
+     : "=&r" (val)
+     : "r"(pAddr)
+     : "r1"
+@@ -246,14 +242,12 @@ long AtomicAdd(volatile long* pAddr, lon
+ #elif defined(__arm__) && !defined(__ARM_ARCH_5__)
    register long val;
    asm volatile (
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
+-    "dmb      ish           \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+   "1:                       \n" 
+     "ldrex   %0, [%1]       \n" // (val = *pAddr)
+     "add     %0,  %2        \n" // (val += amount)
+     "strex   r1,  %0, [%1]	\n"
+     "cmp     r1,   #0       \n"
+     "bne     1b             \n"
+-    "dmb     ish            \n" // Memory barrier.
+     : "=&r" (val)
+     : "r"(pAddr), "r"(amount)
+     : "r1"
+@@ -324,14 +318,12 @@ long AtomicDecrement(volatile long* pAdd
+ #elif defined(__arm__)
    register long val;
    asm volatile (
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
+-    "dmb      ish           \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+     "1:                     \n" 
+     "ldrex   %0, [%1]       \n" // (val = *pAddr)
+     "sub     %0,  #1        \n" // (val -= 1)
+     "strex   r1,  %0, [%1]	\n"
+     "cmp     r1,   #0       \n"
+     "bne     1b             \n"
+-    "dmb     ish            \n" // Memory barrier.
+     : "=&r" (val)
+     : "r"(pAddr)
+     : "r1"
+@@ -403,14 +395,12 @@ long AtomicSubtract(volatile long* pAddr
+ #elif defined(__arm__)
    register long val;
    asm volatile (
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
+-    "dmb     ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+     "1:                     \n" 
+     "ldrex   %0, [%1]       \n" // (val = *pAddr)
+     "sub     %0,  %2        \n" // (val -= amount)
+     "strex   r1,  %0, [%1]	\n"
+     "cmp     r1,   #0       \n"
+     "bne     1b             \n"
+-    "dmb     ish            \n" // Memory barrier.
+     : "=&r" (val)
+     : "r"(pAddr), "r"(amount)
+     : "r1"
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
index 629017b..f93fa9e 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch
@@ -16,54 +16,50 @@ The build (OpenEmbedded `angstrom-2010.x` for `MACHINE = "beagleboard") fails wi
         make[1]: *** [Atomics.o] Error 1
         make[1]: Leaving directory `/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xbmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/threads'
         make: *** [xbmc/threads/threads.a] Error 2
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
+Index: git/xbmc/threads/Atomics.cpp
+===================================================================
+--- git.orig/xbmc/threads/Atomics.cpp
++++ git/xbmc/threads/Atomics.cpp
+@@ -43,24 +43,24 @@ long cas(volatile long *pAddr, long expe
+     : "cc", "memory");                              /* Clobbers */
+   return prev;
+ 
+-#elif defined(__arm__)
 -  register long prev;
 -  asm volatile (
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
+-    "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
+-    "1:                      \n"
+-    "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,
+-    "cmp      %0,  %2        \n" // Verify that the current value (%0) == old value (%2)
+-    "bne      2f             \n" // Bail if the two values are not equal [not as expected]
+-    "strex    r1,  %3, [%1]  \n"
+-    "cmp      r1,  #0        \n"
+-    "bne      1b             \n"
+-    "dmb      ish            \n" // Memory barrier.
+-    "2:                      \n"
+-    : "=&r" (prev)
+-    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
+-    : "r1"
+-    );
 -  return prev;
-+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
++//#elif defined(__arm__)
 +//  register long prev;
 +//  asm volatile (
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
++//    "dmb      ish            \n" // Memory barrier. Make sure all memory accesses appearing before this complete before any that appear after
++//    "1:                      \n"
++//    "ldrex    %0, [%1]       \n" // Load the current value of *pAddr(%1) into prev (%0) and lock pAddr,
++//    "cmp      %0,  %2        \n" // Verify that the current value (%0) == old value (%2)
++//    "bne      2f             \n" // Bail if the two values are not equal [not as expected]
++//    "strex    r1,  %3, [%1]  \n"
++//    "cmp      r1,  #0        \n"
++//    "bne      1b             \n"
++//    "dmb      ish            \n" // Memory barrier.
++//    "2:                      \n"
++//    : "=&r" (prev)
++//    : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
++//    : "r1"
++//    );
 +//  return prev;
- }
  
  #elif defined(__mips__)
--- 
-1.7.2.5
-
+ // TODO:
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
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
similarity index 74%
rename from meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
rename to meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
index 2316fb7..a3adeac 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb
@@ -3,20 +3,14 @@ DESCRIPTION = "XBMC Media Center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml libmad"
+DEPENDS = "libusb1 libcec expat yajl gperf-native libxmu fribidi mpeg2dec samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 jasper zip-native zlib libtinyxml libmad taglib libsdl-image-native"
 #require recipes/egl/egl.inc
 
-
-SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
-
-PV = "11.0+gitr${SRCPV}"
-PR = "r14"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden \
+SRCREV = "32b1a5ef9e7f257a2559a3b766e85a55b22aec5f"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=frodo \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
            file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
-           file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch \
-           file://configure.in-Avoid-running-code.patch \
 "
 
 inherit autotools gettext python-dir
@@ -30,18 +24,20 @@ CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)} sdl airplay ssh"
 PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
 PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl-mixer libsdl-image"
+PACKAGECONFIG[airplay] = "--enable-airplay,--disable-airplay,libplist"
+PACKAGECONFIG[ssh] = "--enable-ssh,--disable-ssh,libssh"
 
 EXTRA_OECONF = " \
-    --disable-rpath \
     --enable-libusb \
-    --enable-airplay \
     --disable-optical-drive \
     --enable-external-libraries \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
-"
+    --disable-external-ffmpeg \
+    --with-arch=${TARGET_ARCH} \
+    "
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
@@ -55,6 +51,9 @@ export STAGING_LIBDIR
 export STAGING_INCDIR
 export PYTHON_DIR
 
+#Needed by TexturePacker to compile it using native sysroot
+export TEXTUREPACKER_NATIVE_ROOT = "${STAGING_DIR_NATIVE}/usr"
+
 do_configure() {
     sh bootstrap
     oe_runconf
-- 
1.8.1.4


