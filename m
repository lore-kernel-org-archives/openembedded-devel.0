Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37941.1795594105294281223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oNUO1MQy;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386bd881d39so3908341eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594105; x=1796198905; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RXH7Vaz5aI1LuuK9jueqlhuPu4iY2NsWPNmqWNEGo4=;
        b=oNUO1MQy1+TGvsF7+mxvf1wqsmL1dlvJTEbueITxzExWzNi0ooouZXWg5FWlcNpq2/
         opkDsooY/MmMvYaCXAw9SGA6i31YKAOW6mmGbwFgQVgMejC89mg+6Lklymb66gFzU3Ef
         WG6d9/BNZnpAeAUWOZP4/kvxGpFELjGMt2wvpW+dPgfxRxqPS6T0WoZjZL26ucaQ6134
         V5qnU4G99CH+84tUcQ7Rjv26nL0uMR7RiTAXUORBNUbe3gLD77eIOUPinpgq+BuSJAjk
         KQ7bHmp6H/Wa6ydJYyDrRzsgkNAiLtUVVwpkYr9IlkJ5UQ2lM1ACr9VG7J6NMpnQeoRo
         2hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594105; x=1796198905;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RXH7Vaz5aI1LuuK9jueqlhuPu4iY2NsWPNmqWNEGo4=;
        b=px80fC8x7WUr81lqHLZ00/tZ7NheKBF8dHRIQCslQrFQUNJaNIbilbAuBcL79uIzbK
         jtb1sA1IDqdFMC3Ud044/sdm1q5s8Ul3Q6XR6pdzUMnot1F5kxJfohq8D1CzsblNRzYB
         nHJ+sYtRQC4BcVyLtFKzPXuqafTbtwXYBYwkA14n8liQdMfsgrocQWO9dXgOrRMTgqeD
         C5PmewslwkAyfxiaDdu162kIaDZcCU4gk6v8xqp0eIqLRy73BEbPU6Ezy+Dw+hiE/BhB
         AT3e9qOCHVeLw9HHeiBF5VHrXTQSswl8i0R96fQK7pI9xfZ9gfw64m8+MURNyHcE74af
         lwVg==
X-Gm-Message-State: APuU4Z8knqUmShE6RgWmvJyoXM0+OvAUACC2XLZslmWmzT0Md+yJTITl
	fD/5k7BFQ7FmE7qHVr3WxJowXqfzcBDwwxHXKosKBwCFh9brSb//hzouoYafJVfx
X-Gm-Gg: AZFdTZcq4G4fpNsqRVfkCiPXL65cjqw2vVpCl88kQKiMxXbPmR6T+cIC1fqR0PZtzUZ
	LM1v0bdGxQl401bEnXRxOvO7ZOGKVN1laaUO5swwV7OuHktQvgPok3+vYHnaOyFRJIUVBFX6jNK
	Zw5XoZ28Z3FGfLl3Vg/vD0dsjFJz2gtEID1RgMGfl2BP+McgKhkVrJN8MhcX4wtg/Y7gW6LFuHF
	ozG+wV1ucQCG7TuMovy57sncppHFCAq5ztjRSX/pGpHKQqx3MjRZSRZ89eJtwPAV/aDPhWEWmfn
	SSpzf5dt4D5I39RszZEJGXRkxqHy/gTWmF1cAgr/jQ2a1vGLu40rLSxoYPLphH+cL197IzdsOc0
	sy2I+UOWvF1eRgtvcRWk42KBQK8qwIUuR4guOw7Wwac+YVZbf325gIOcWF0k/kuqTKwhx3MCz0/
	proP5Ik88vwJ8MgdCtWSJEwb4ki9HQS4sSj7b7cG8l9d7ZaxBZysam9bd9KnWt28buiu382DQe7
	Jz3EOrwgrHQZ/eWMyVH/FazTHOKSUWcr2OXkvr+/G2uxDx+917O6mj3c0ne1I7TAdYaQcJRv1Ub
	SyXacShI2YF3FUT1xE5e4Y9YuxDf7wJ+2dear7qJ3jcT16n2M0zoX5k/Zn74A7LUcFop8IRuuI2
	nSf95MPXO1DQ7+mQmaFCMLGYc0hZ92XPCjsJ5ZHNNjnnO8zZaC8sSnRBBMQNVkA+BBCQSKbTVZQ
	8+NItpN7FLJbf86Ep+uXh2ny2bGUKEM7B1vIYEBdtgwJ8MriaEPS6ARI/Fb9YJ5eosxdE4PMQPD
	MkYmURoh6UHHHPKVE3iFHr4zYORH+p5inQs4+tAvbw9TrppmTizhMdlJy+9NmuHz5IJv5sw1FNn
	27mo
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr22100129eec.6.1795594104384;
        Wed, 25 Nov 2026 00:08:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 33/55] fltk: upgrade 1.3.11 -> 1.4.5
Date: Wed, 25 Nov 2026 00:06:49 -0800
Message-ID: <20261125080732.2419614-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133036
Content-Type: text/plain; charset="utf-8"

FLTK 1.4 is a new ABI (libfltk.so.1.4); the API is mostly source
compatible with 1.3.
- New Wayland backend (hybrid Wayland/X11 library on Linux), with
  client-side decorations through libdecor and Cairo/Pango drawing
- HiDPI support and GUI scaling on all platforms
- CMake is the primary build system ("modern CMake" targets); the
  OPTION_* CMake options were renamed to FLTK_*
- New Fl_Flex and Fl_Grid layout widgets, fltk-options tool, SVG
  image support
- 1.4.1-1.4.5 are bug-fix releases (Wayland, X11, macOS, Windows)

Recipe changes: map the renamed CMake options (FLTK_BUILD_SHARED_LIBS,
FLTK_USE_PTHREADS, FLTK_USE_XFT/XINERAMA/XFIXES/XCURSOR, FLTK_BUILD_GL,
FLTK_OPTION_CAIRO_WINDOW); OPTION_USE_XDBE no longer exists. Add a
wayland PACKAGECONFIG, enabled with the wayland distro feature, using
the system libdecor; it also needs the X11 extensions because the
library is hybrid. fltk-native and x11-only builds disable the
Wayland backend. GL now links libGLU, so add libglu. Disable docs and
examples. FLTK_CONFIG_PATH is no longer settable; the CMake files stay
in ${datadir}/fltk and UseFLTK.cmake is gone, so sed all installed
*.cmake files.

Patches: disable_test.patch touched the unused autotools Makefile;
the Fl_Preferences dlopen guard and linking libdl are upstream; 1.4
always builds fluid when cross-compiling, so drop all four. Refresh
the "do not export fluid" patch, which is still needed because fluid
is not staged in the sysroot.

fltk-native: CMake cannot find the host libm in the native sysroot, so
the trunc() check fails and the fallback definition clashes with glibc's
declaration; preset HAVE_TRUNC.

License-Update: COPYING only switches its URLs to https and the bug
tracker link from str.php to bugs.php.

Move UPSTREAM_CHECK_URI to fltk.inc and add an UPSTREAM_CHECK_REGEX
matching the release source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb   | 22 +++++-----
 meta-oe/recipes-support/fltk/fltk.bb          | 35 +++++++--------
 meta-oe/recipes-support/fltk/fltk.inc         | 23 ++++++----
 ...xx-do-not-use-dlopen-in-case-glibc-s.patch | 41 -----------------
 ...ways-build-fluid-and-export-pointers.patch | 31 -------------
 ...Lists.txt-Do-not-export-fluid-target.patch | 26 +++++------
 .../fltk/fltk/disable_test.patch              | 13 ------
 .../fltk/fltk/fltk-native-link-libdl.patch    | 44 -------------------
 8 files changed, 52 insertions(+), 183 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/disable_test.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 322a28430f..8dab8daa41 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -2,21 +2,19 @@ require ${BPN}.inc
 
 DEPENDS = "zlib-native jpeg-native libpng-native libxext-native libxft-native"
 
-SRC_URI += "file://fltk-native-link-libdl.patch"
-
-UPSTREAM_CHECK_URI = "https://www.fltk.org/software.php"
-
 inherit native
 
 EXTRA_OECMAKE += " \
-    -DOPTION_BUILD_SHARED_LIBS=OFF \
-    -DOPTION_USE_THREADS=OFF \
-    -DOPTION_USE_XDBE=OFF \
-    -DOPTION_USE_XFT=OFF \
-    -DFLTK_BUILD_TEST=OFF \
-    -DOPTION_USE_XINERAMA=OFF \
-    -DOPTION_USE_XFIXES=OFF \
-    -DOPTION_USE_XCURSOR=OFF \
+    -DFLTK_BACKEND_WAYLAND=OFF \
+    -DFLTK_BUILD_SHARED_LIBS=OFF \
+    -DFLTK_BUILD_GL=OFF \
+    -DFLTK_USE_PTHREADS=OFF \
+    -DFLTK_USE_XFT=OFF \
+    -DFLTK_USE_XINERAMA=OFF \
+    -DFLTK_USE_XFIXES=OFF \
+    -DFLTK_USE_XCURSOR=OFF \
+    -DFLTK_USE_XRENDER=OFF \
+    -DHAVE_TRUNC=1 \
 "
 
 do_install:append() {
diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 4278a2fa3d..8873086cb1 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -1,35 +1,32 @@
 require ${BPN}.inc
 
-DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft libxrender"
 
 inherit features_check binconfig lib_package gtk-icon-cache mime mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch"
 
-UPSTREAM_CHECK_URI = "https://www.fltk.org/software.php"
-
-EXTRA_OECMAKE = " \
-    -DOPTION_BUILD_SHARED_LIBS=ON \
-    -DOPTION_USE_THREADS=ON \
-    -DFLTK_BUILD_TEST=OFF \
-    -DOPTION_USE_XDBE=ON \
-    -DOPTION_USE_XFT=ON \
-    -DFLTK_CONFIG_PATH=${libdir}/cmake \
+EXTRA_OECMAKE += " \
+    -DFLTK_BUILD_SHARED_LIBS=ON \
+    -DFLTK_USE_PTHREADS=ON \
+    -DFLTK_USE_XFT=ON \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+# The Wayland backend builds a hybrid Wayland/X11 library, which needs all optional X11 extensions
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'xinerama xfixes xcursor', '', d)}"
 
-PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
-PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
-PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
-PACKAGECONFIG[xfixes] = "-DOPTION_USE_XFIXES=ON,-DOPTION_USE_XFIXES=OFF,libxfixes"
-PACKAGECONFIG[xcursor] = "-DOPTION_USE_XCURSOR=ON,-DOPTION_USE_XCURSOR=OFF,libxcursor"
+PACKAGECONFIG[cairo] = "-DFLTK_OPTION_CAIRO_WINDOW=ON,-DFLTK_OPTION_CAIRO_WINDOW=OFF,cairo"
+FLTK_GL_DEPS = "virtual/libgl libglu ${@bb.utils.contains('PACKAGECONFIG', 'wayland', 'virtual/egl', '', d)}"
+PACKAGECONFIG[opengl] = "-DFLTK_BUILD_GL=ON,-DFLTK_BUILD_GL=OFF,${FLTK_GL_DEPS}"
+PACKAGECONFIG[wayland] = "-DFLTK_BACKEND_WAYLAND=ON -DFLTK_USE_SYSTEM_LIBDECOR=ON,-DFLTK_BACKEND_WAYLAND=OFF,wayland wayland-native wayland-protocols libxkbcommon libdecor cairo pango dbus"
+PACKAGECONFIG[xinerama] = "-DFLTK_USE_XINERAMA=ON,-DFLTK_USE_XINERAMA=OFF,libxinerama"
+PACKAGECONFIG[xfixes] = "-DFLTK_USE_XFIXES=ON,-DFLTK_USE_XFIXES=OFF,libxfixes"
+PACKAGECONFIG[xcursor] = "-DFLTK_USE_XCURSOR=ON,-DFLTK_USE_XCURSOR=OFF,libxcursor"
 
 do_install:append() {
-    sed -i -e 's,${TMPDIR},,g' ${D}${bindir}/fltk-config
-    sed -i -e 's,${TMPDIR},,g' ${D}${datadir}/fltk/UseFLTK.cmake
-    sed -i -e 's,${TMPDIR},,g' ${D}${datadir}/fltk/FLTK-Targets.cmake
+    sed -i -e 's,${TMPDIR},,g' ${D}${bindir}/fltk-config ${D}${datadir}/fltk/*.cmake
 }
 
 python populate_packages:prepend () {
diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index ab4aea73b4..dcbbe700c4 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -2,18 +2,23 @@ SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
 HOMEPAGE = "https://www.fltk.org"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-only AND LicenseRef-FLTK"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
+LIC_FILES_CHKSUM = "file://COPYING;md5=353c9fd4163eef6500f7e057aed0b083"
 
-SRC_URI = " \
-    https://github.com/fltk/fltk/releases/download/release-${PV}/${BP}-source.tar.bz2 \
-    file://disable_test.patch \
-    file://0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch \
-    file://0002-always-build-fluid-and-export-pointers.patch \
-"
+SRC_URI = "https://github.com/fltk/fltk/releases/download/release-${PV}/${BP}-source.tar.bz2"
+
+PV = "1.4.5"
+SRC_URI[sha256sum] = "b5a52489b7ffae196db2076adb4c1b18170db0d047f5e93539a382603461564b"
 
-PV = "1.3.11"
-SRC_URI[sha256sum] = "ca2e144e5f89173cd094cc273940d56230b1bf613083a0792e6406dc191cd99f"
+UPSTREAM_CHECK_URI = "https://www.fltk.org/software.php"
+UPSTREAM_CHECK_REGEX = "fltk-(?P<pver>\d+(\.\d+)+)-source\.tar"
 
 inherit cmake pkgconfig
 
+EXTRA_OECMAKE += " \
+    -DFLTK_BUILD_TEST=OFF \
+    -DFLTK_BUILD_EXAMPLES=OFF \
+    -DFLTK_BUILD_HTML_DOCS=OFF \
+    -DFLTK_BUILD_PDF_DOCS=OFF \
+"
+
 TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
diff --git a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
deleted file mode 100644
index 0d47dac2dd..0000000000
--- a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e76a062338063615c069fedc5a143cc38c34d9b2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 28 Feb 2017 01:00:21 +0100
-Subject: [PATCH] Fl_Preferences.cxx: do not use dlopen in case glibc's headers
- are missing
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx: In static member function ‘static int Fl_Plugin_Manager::load(const char*)’:
-| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:27: error: ‘RTLD_LAZY’ was not declared in this scope
-|      dl = dlopen(filename, RTLD_LAZY);
-|                            ^~~~~~~~~
-| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:36: error: ‘dlopen’ was not declared in this scope
-|      dl = dlopen(filename, RTLD_LAZY);
-|                                     ^
-| src/CMakeFiles/fltk.dir/build.make:1217: recipe for target 'src/CMakeFiles/fltk.dir/Fl_Preferences.cxx.o' failed
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/Fl_Preferences.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Fl_Preferences.cxx b/src/Fl_Preferences.cxx
-index 1233bb1..7857b9b 100644
---- a/src/Fl_Preferences.cxx
-+++ b/src/Fl_Preferences.cxx
-@@ -1737,7 +1737,7 @@ int Fl_Plugin_Manager::load(const char *filename) {
-   HMODULE dl = LoadLibrary(filename);
- #else
-   void * dl = NULL;
--# if HAVE_DLSYM
-+# if HAVE_DLSYM && HAVE_DLFCN_H
-     dl = dlopen(filename, RTLD_LAZY);
- # endif
- #endif
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch b/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
deleted file mode 100644
index 0d91aab3a1..0000000000
--- a/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 16010cb1a69ea2326d8102b7f1e34b65aca4b278 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 22 May 2021 12:33:15 +0200
-Subject: [PATCH] always build fluid and export pointers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- CMake/export.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMake/export.cmake b/CMake/export.cmake
-index 6e8bc5d..71b6f6c 100644
---- a/CMake/export.cmake
-+++ b/CMake/export.cmake
-@@ -20,7 +20,7 @@
- #######################################################################
- 
- # Set the fluid executable path
--if (CMAKE_CROSSCOMPILING)
-+if (FALSE)
-   find_file(FLUID_PATH
-     NAMES fluid fluid.exe
-     PATHS ENV PATH
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch
index 72bb48a32c..6c3058d9ac 100644
--- a/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch
+++ b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch
@@ -22,21 +22,19 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- fluid/CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
+ fluid/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/fluid/CMakeLists.txt b/fluid/CMakeLists.txt
-index 472c84c..f971121 100644
+index 7792446..df5a391 100644
 --- a/fluid/CMakeLists.txt
 +++ b/fluid/CMakeLists.txt
-@@ -86,7 +86,6 @@ if (APPLE AND (NOT OPTION_APPLE_X11))
-   install (TARGETS fluid DESTINATION ${FLTK_BINDIR})
- else()
-   install (TARGETS fluid
--    EXPORT FLTK-Targets
-     RUNTIME DESTINATION ${FLTK_BINDIR}
-     LIBRARY DESTINATION ${FLTK_LIBDIR}
-     ARCHIVE DESTINATION ${FLTK_LIBDIR}
--- 
-2.31.1
-
+@@ -194,7 +194,7 @@ target_link_libraries(fluid-lib PUBLIC fltk::images)
+ 
+ # Build targets
+ 
+-make_target(fluid TRUE "${MAIN_FILES}" fluid-lib fluid TRUE)
++make_target(fluid TRUE "${MAIN_FILES}" fluid-lib fluid FALSE)
+ 
+ # Build the console app on Windows
+ # This is done for all Windows targets, even if cross-compiling.
diff --git a/meta-oe/recipes-support/fltk/fltk/disable_test.patch b/meta-oe/recipes-support/fltk/fltk/disable_test.patch
deleted file mode 100644
index fe8be5a652..0000000000
--- a/meta-oe/recipes-support/fltk/fltk/disable_test.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
-
---- a/Makefile.orig	2015-11-26 15:35:31.485357862 +0800
-+++ b/Makefile	2015-11-26 15:35:37.037357764 +0800
-@@ -18,7 +18,7 @@
- 
- include makeinclude
- 
--DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid test documentation
-+DIRS = $(IMAGEDIRS) src $(CAIRODIR) fluid documentation
- 
- all: makeinclude fltk-config
- 	for dir in $(DIRS); do\
diff --git a/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch b/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
deleted file mode 100644
index e140ce2166..0000000000
--- a/meta-oe/recipes-support/fltk/fltk/fltk-native-link-libdl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Inappropriate [cross build specific]
-
-It fails to build fltk-native on Ubuntu 20.04 with glibc 2.31:
-
-| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `fl_dlopen(char const*, char const*)':
-| Fl_Native_File_Chooser.cxx:(.text+0x61a): undefined reference to `dlopen'
-| /path_to/tmp/hosttools/ld: lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): in function `Fl_GTK_File_Chooser::probe_for_GTK_libs()':
-| Fl_Native_File_Chooser.cxx:(.text+0xf92): undefined reference to `dlerror'
-
-The original fix in fltk-native recipe does not work any more because '-ldl'
-appears before lib/libfltk.a and causes dlopen() unresolved. The reason why it
-doesn't fail on other hosts is that the functions dlopen(), dlerror() etc. have
-been moved to libc.so since glibc 2.34 via the commits in glibc:
-
-0c1c3a771e dlfcn: Move dlopen into libc
-add8d7ea01 dlfcn: Move dlvsym into libc
-6dfc0207eb dlfcn: Move dlinfo into libc
-492560a32e dlfcn: Move dladdr1 into libc
-6a1ed32789 dlfcn: Move dlmopen into libc
-77f876c0e3 dlfcn: Move dlsym into libc
-602252b553 dlfcn: Move dladdr into libc
-d8cce17d2a dlfcn: Move dlclose into libc
-
-Append 'dl' to fltk link items explictly to fix the error.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- src/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index d153b1c..0fe5c11 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -306,7 +306,7 @@ endif (USE_XFT)
- #######################################################################
- 
- FL_ADD_LIBRARY (fltk STATIC "${STATIC_FILES}")
--target_link_libraries (fltk ${OPTIONAL_LIBS})
-+target_link_libraries (fltk ${OPTIONAL_LIBS} dl)
- 
- #######################################################################
- 
