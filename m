Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpfy-0001Et-3B
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:54:54 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so926309wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KgW/d2F6l4t06qyStOqGZW/Qk7omzABfvXpCRZ518uU=;
	b=bql0bLv0A2aH7X/0kfHT1qIxFTL/zXsJUWeH36hrWsAWnnZafaC+wCJdYmaH5gwSbT
	77pGtp9L13vwgynO98fSQ7WbVWjEjmDIAiTY7yQQ4MOycBxoyS0itq08ooGi9MZi0iJ2
	psmLBLw13aDbjEh1fxDeG77xdp6SUzv1D5zl+kBlb2cxv+HF6ESJtg3i4ZYOwxa2pWYz
	hYgcZ1DwfSf4tSu2F+J6Fx6vhmHqE5hy63sEp5C+xbREuAhIRkrMHeACAV1q8qzLnhH9
	fSBus4w4uT/GkQer6vkJWWpfLv1bxYsvjVXCw/8Yvlrviwqm5T7Ed+ssGcgY4iekx3ZH
	9RaQ==
Received: by 10.180.93.68 with SMTP id cs4mr6100997wib.14.1344606185182;
	Fri, 10 Aug 2012 06:43:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm11615607wib.3.2012.08.10.06.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:55 +0200
Message-Id: <39cefce7e1d8785a03d1200099e84c851f3d0198.1344599409.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344599409.git.Martin.Jansa@gmail.com>
References: <cover.1344599409.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] gpsd: update to 3.7, drop older 3.5 and git recipe
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
X-List-Received-Date: Fri, 10 Aug 2012 13:54:54 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...disable-html-and-man-docs-building-becaus.patch |    0
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |    0
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   30 +++++
 .../0004-SConstruct-remove-rpath.patch             |   21 ++--
 ...respect-sysroot-setting-when-prepending-L.patch |   36 ------
 ...struct-respect-sysroot-also-in-SPLINTOPTS.patch |   29 -----
 ...strptime-prototype-is-not-provided-unless.patch |   39 ------
 .../gpsd/{gpsd_3.5.bb => gpsd_3.7.bb}              |    8 +-
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |  127 --------------------
 9 files changed, 44 insertions(+), 246 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd => gpsd-3.7}/0004-SConstruct-remove-rpath.patch (78%)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.5.bb => gpsd_3.7.bb} (93%)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_git.bb

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
new file mode 100644
index 0000000..40baa01
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
@@ -0,0 +1,30 @@
+From f5f262be8ae54bd0c0f52802f2007ec89163756f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 11:52:35 +0200
+Subject: [PATCH 1/2] SConstruct: respect sysroot also in SPLINTOPTS
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+---
+ SConstruct |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index a25e88a..a1bddb9 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1277,7 +1277,10 @@ def Utility(target, source, action):
+ 
+ # Report splint warnings
+ # Note: test_bits.c is unsplintable because of the PRI64 macros.
+-splintopts = "-I/usr/include/libusb-1.0 +quiet"
++if not env['sysroot']:
++    splintopts = "-I/usr/include/libusb-1.0 +quiet"
++else:
++    splintopts = "-I%s/usr/include/libusb-1.0 +quiet" % env['sysroot']
+ # splint does not know about multi-arch, work around that
+ ma_status, ma = _getstatusoutput('dpkg-architecture -qDEB_HOST_MULTIARCH')
+ if ma_status == 0:
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch
similarity index 78%
rename from meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch
index add624b..83b98bb 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0004-SConstruct-remove-rpath.patch
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.7/0004-SConstruct-remove-rpath.patch
@@ -1,7 +1,7 @@
-From b59f8c5bf8519a5ca114696e79b8690ebb68e0d3 Mon Sep 17 00:00:00 2001
+From 7d736bbd517c12d19d7b85a5b0db84732b2f86da Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 24 Apr 2012 16:24:35 +0200
-Subject: [PATCH 4/4] SConstruct: remove rpath
+Subject: [PATCH 2/2] SConstruct: remove rpath
 
 * even with correct prefix (without DESTDIR) included it's redundant
   WARNING: QA Issue: libgps:
@@ -14,28 +14,29 @@ Subject: [PATCH 4/4] SConstruct: remove rpath
   /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd/gpsd-3.5-r0/packages-split/libgps/usr/lib/libgps.so.20.0
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
 ---
  SConstruct |    7 +++++--
  1 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 0cf5799..3c919fc 100644
+index a1bddb9..3e7c607 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1152,8 +1152,11 @@ if qt_env:
+@@ -1205,8 +1205,11 @@ if qt_env:
  
  # We don't use installdir here in order to avoid having DESTDIR affect the rpath
- if env["shared"]:
+ if env["shared"] and env["chrpath"]:
 -    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
 -                      % (installdir('libdir', False), ))
-+    if env['sysroot']:
-+        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
-+    else:
++    if not env['sysroot']:
 +        env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
-+                         % (installdir('libdir', False), ))
++                          % (installdir('libdir', False), ))
++    else:
++        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
  
  if not env['debug'] and not env['profiling'] and env['strip']:
      env.AddPostAction(binaryinstall, '$STRIP $TARGET')
 -- 
-1.7.8.5
+1.7.5.4
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
deleted file mode 100644
index 6b720a5..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7427bb23092b3e395d14e42cd3b64691082fe826 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 10:58:26 +0200
-Subject: [PATCH 1/4] SConstruct: respect sysroot setting when prepending
- LIBPATH/RPATH
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- SConstruct |   11 ++++++++---
- 1 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 22bc9f4..21b2205 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -269,9 +269,14 @@ def installdir(dir, add_destdir=True):
-     return wrapped
- 
- # Honor the specified installation prefix in link paths.
--env.Prepend(LIBPATH=[installdir('libdir')])
--if env["shared"]:
--    env.Prepend(RPATH=[installdir('libdir')])
-+if env['sysroot']:
-+    env.Prepend(LIBPATH=[os.path.normpath("%s/%s/%s" % (env['sysroot'], env['prefix'], env['libdir']))])
-+    if env["shared"]:
-+        env.Prepend(RPATH=[os.path.normpath("%s/%s/%s" % (env['sysroot'], env['prefix'], env['libdir']))])
-+else:
-+    env.Prepend(LIBPATH=[installdir('libdir')])
-+    if env["shared"]:
-+        env.Prepend(RPATH=[installdir('libdir')])
- 
- # Give deheader a way to set compiler flags
- if 'MORECFLAGS' in os.environ:
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
deleted file mode 100644
index 55ef704..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5266eb72cbc8193faa2345b8774b0f159e61c067 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 11:52:35 +0200
-Subject: [PATCH 2/4] SConstruct: respect sysroot also in SPLINTOPTS
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- SConstruct |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 21b2205..0cf5799 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1224,7 +1224,10 @@ def Utility(target, source, action):
- 
- # Report splint warnings
- # Note: test_bits.c is unsplintable because of the PRI64 macros.
--env['SPLINTOPTS'] = "-I/usr/include/libusb-1.0 +quiet"
-+if env['sysroot']:
-+    env['SPLINTOPTS'] = "-I%s/usr/include/libusb-1.0 +quiet" % env['sysroot']
-+else:
-+    env['SPLINTOPTS'] = "-I/usr/include/libusb-1.0 +quiet"
- 
- def Splint(target,sources, description, params):
-     return Utility(target,sources+generated_sources,[
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
deleted file mode 100644
index c2d191c..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c6bb11767172407bfaaebd962b4d12cd8e8a1fb0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 14:57:04 +0200
-Subject: [PATCH 3/4] Revert "The strptime prototype is not provided unless
- explicitly requested."
-
-* This reverts commit 615d3eb14ea4833ce38ea89ec385308f4f679b33.
-* with _XOPEN_SOURCE defined, we don't have
-  CLOCK_REALTIME and timespec defined and build fails:
-  | arm-oe-linux-gnueabi-gcc -march=armv4t -mthumb -mthumb-interwork -mtune=arm920t --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta02 -o gpsutils.os -c -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta02 -O2 -fPIC gpsutils.c
-  | gpsutils.c: In function 'timestamp':
-  | gpsutils.c:299:22: error: storage size of 'ts' isn't known
-  | gpsutils.c:300:34: error: 'CLOCK_REALTIME' undeclared (first use in this function)
-  | gpsutils.c:300:34: note: each undeclared identifier is reported only once for each function it appears in
-  | gpsutils.c: In function 'unix_to_iso8601':
-  | gpsutils.c:385:11: warning: incompatible implicit declaration of built-in function 'snprintf' [enabled by default]
----
- gpsutils.c |    5 -----
- 1 files changed, 0 insertions(+), 5 deletions(-)
-
-diff --git a/gpsutils.c b/gpsutils.c
-index 60c4ae9..a1530ec 100644
---- a/gpsutils.c
-+++ b/gpsutils.c
-@@ -3,11 +3,6 @@
-  * This file is Copyright (c) 2010 by the GPSD project
-  * BSD terms apply: see the file COPYING in the distribution root for details.
-  */
--
--/* The strptime prototype is not provided unless explicitly requested.
-- *  So add the define that POSIX says to to avoid: */
--#define _XOPEN_SOURCE
--
- #include <stdio.h>
- #include <time.h>
- #include <sys/time.h>
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
similarity index 93%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 1e3ac0c..e8f4cad 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r5"
+PR = "r0"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
-  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-  file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
   file://0004-SConstruct-remove-rpath.patch \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
@@ -18,8 +16,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://gpsd \
   file://60-gpsd.rules \
 "
-SRC_URI[md5sum] = "e96881798a0ab67aa3cd5f3249f0e536"
-SRC_URI[sha256sum] = "5ebb0b00c49421eb8fbead81342e5ce63e82065e5ff27da586f10e342b999171"
+SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
+SRC_URI[sha256sum] = "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
 
 inherit scons update-rc.d python-dir pythonnative
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
deleted file mode 100644
index 380f3ba..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ /dev/null
@@ -1,127 +0,0 @@
-DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
-SECTION = "console/network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
-PROVIDES = "virtual/gpsd"
-
-PR = "r4"
-
-SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
-
-DEFAULT_PREFERENCE = "-1"
-PV = "3.5+gitr${SRCPV}"
-
-SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
-  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
-  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-  file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
-  file://0004-SConstruct-remove-rpath.patch \
-  file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
-  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
-  file://gpsd-default \
-  file://gpsd \
-  file://60-gpsd.rules \
-"
-S = "${WORKDIR}/git"
-
-inherit scons update-rc.d python-dir pythonnative
-
-INITSCRIPT_NAME = "gpsd"
-INITSCRIPT_PARAMS = "defaults 35"
-
-SYSTEMD_OESCONS ??= "false"
-
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-EXTRA_OESCONS = " \
-  sysroot=${STAGING_DIR_TARGET} \
-  libQgpsmm='false' \
-  debug='true' \
-  strip='false' \
-  systemd='${SYSTEMD_OESCONS}' \
-"
-# this cannot be used, because then chrpath is not found and only static lib is built
-# target=${HOST_SYS}
-
-do_compile_prepend() {
-    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
-    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
-    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
-
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
-}
-
-do_install() {
-    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
-    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
-    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
-
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
-
-    export DESTDIR="${D}"
-    # prefix is used for RPATH and DESTDIR/prefix for instalation
-    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
-      bbfatal "scons install execution failed."
-}
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
-    install -d ${D}/${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
-
-    #support for udev
-    install -d ${D}/${sysconfdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
-    install -d ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-
-    #support for python
-    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-}
-
-pkg_postinst_${PN}-conf() {
-	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
-}
-
-pkg_postrm_${PN}-conf() {
-	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
-}
-
-PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
-
-FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
-
-FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
-
-RDEPENDS_${PN} = "gpsd-gpsctl"
-RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
-
-DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
-FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
-RDEPENDS_gpsd-udev += "udev gpsd-conf"
-
-DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
-FILES_libgpsd = "${libdir}/libgpsd.so.*"
-
-DESCRIPTION_libgps = "C service library used for communicating with gpsd"
-FILES_libgps = "${libdir}/libgps.so.*"
-
-DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
-FILES_gpsd-conf = "${sysconfdir}"
-
-DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
-FILES_gpsd-gpsctl = "${bindir}/gpsctl"
-
-DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
-FILES_gps-utils = "${bindir}/*"
-RDEPENDS_gps-utils = "python-pygps"
-
-DESCRIPTION_python-pygps = "Python bindings to gpsd"
-FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
-- 
1.7.8.6



