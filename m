Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.15782.1621809244138608921
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u4L6jL++;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id i13so29713888edb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mTLDBl54lmvjmA/KFXRFGBYSOe7NXlih5rg4oMiMPG0=;
        b=u4L6jL++t3rp6dQaHCyG9IfXPKTbyxLiOO3ncQRYwwCWEa2/I7IH+MIycRNOQLTIB4
         IxW3VI9jbkZEFLoxsvgDykqGEGRcsLyzlYINY+77HTdWS9PIZ0rZ2WEnZyZRtbK4vOKt
         cMO6866+iPRrgHpUnCbNL+OQcmFb62aRpOmvXj6f3zxohohn5ljCVNdYHh53eehD7pUz
         r3720diQl4b86gMDO+Hz/iR9JG8btRmu7OGbAf7eRcAl0Hm3KQBN1M6c2G3Hpu01ETr2
         w5Er+yBgsaZ/WoDZdl+iEuN6pePNYs6puDguf77ji/KPU29f76SE2Yro21d/2VXZ6trh
         +7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mTLDBl54lmvjmA/KFXRFGBYSOe7NXlih5rg4oMiMPG0=;
        b=ZEIqgXkEfodlY9TAM9tbPYyfYUGA0vKYBl1xYz4EZ7q9OQvfhkh0hdjWVQB0F/6Ojb
         tPbjpK9C/+caMyuAqbXyjClPK+5VgFn0KuqC9PGbZ2J+2o7nb7Qry1bNlmDiaq9O7G1K
         z48MeKTuT5KhgyC7FGP0hXosEyHNcy9IEaRy6Bcfdeopj2albOKVWMWs6lyix8szDJ9W
         yLhQst/2PwaXac3gF6dJIezPk1C7P0xuADEJ4bPPGbwE7NRuh9zHLaG9NJ9UhMHmyofE
         VhD6Yv3Oq2fJCHBA2OzQAyG+7npKkXYx9mig/EzFksZC1NxCJYR/QQHjCRTQuHsUStdd
         FhHQ==
X-Gm-Message-State: AOAM5309Kp2z5JXOiDdst89MPE4Hf40h4g8OfBt9pNmCF+I5kbVHBrAN
	kMJPSvrX8lHC8geuy0BkkCymPBkf8Rg=
X-Google-Smtp-Source: ABdhPJx1xMzcCr/0zVJX6zdftNvKkgeFXzwM/qT41HOjX5+cm//RMeFBoZg/QRlnJjJl6du0Wim/fg==
X-Received: by 2002:a50:c352:: with SMTP id q18mr23030446edb.30.1621809242421;
        Sun, 23 May 2021 15:34:02 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:01 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] fltk: upgrade 1.3.5 -> 1.3.6
Date: Mon, 24 May 2021 00:33:47 +0200
Message-Id: <20210523223353.2576671-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* DOPTION_BUILD_EXAMPLES was deprecated in favor of FLTK_BUILD_TEST
* FLTK_BUILD_TEST fails for native due to reduced build
* FLTK_BUILD_TEST fails for cross due ti trying to run cross fluid
* Patches: 0002.. adjust / 0003.. upstream has acknowledged it a bad ides so
  change was commented out / 0004.. upstreamed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb   |   5 +-
 meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
 meta-oe/recipes-support/fltk/fltk.inc         |   5 +-
 ...ways-build-fluid-and-export-pointers.patch |  24 +--
 ...ce-shared-libs-with-unsuffixed-names.patch |  41 ----
 ...-when-enable-package-config-examples.patch | 182 ------------------
 6 files changed, 19 insertions(+), 245 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 2636287e3..5d5a236be 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -9,12 +9,15 @@ EXTRA_OECMAKE += " \
     -DOPTION_USE_THREADS=OFF \
     -DOPTION_USE_XDBE=OFF \
     -DOPTION_USE_XFT=OFF \
-    -DOPTION_BUILD_EXAMPLES=OFF \
+    -DFLTK_BUILD_TEST=OFF \
     -DOPTION_USE_XINERAMA=OFF \
     -DOPTION_USE_XFIXES=OFF \
     -DOPTION_USE_XCURSOR=OFF \
 "
 
+# lib/libfltk.a(Fl_Native_File_Chooser.cxx.o): undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
+LDFLAGS += "-ldl"
+
 do_install_append() {
     # make sure native fltk-config is not used accidentaly
     rm -f ${D}${bindir}/fltk-config
diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 09344cf7d..51b4a0bc8 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -5,14 +5,10 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 inherit features_check binconfig lib_package gtk-icon-cache mime mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " \
-    file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch \
-    file://0004-Fix-build-error-when-enable-package-config-examples.patch \
-"
-
 EXTRA_OECMAKE = " \
     -DOPTION_BUILD_SHARED_LIBS=ON \
     -DOPTION_USE_THREADS=ON \
+    -DFLTK_BUILD_TEST=OFF \
     -DOPTION_USE_XDBE=ON \
     -DOPTION_USE_XFT=ON \
     -DFLTK_CONFIG_PATH=${libdir}/cmake \
@@ -20,7 +16,6 @@ EXTRA_OECMAKE = " \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,fltk-native"
 PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
 PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
 PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
index 97a1fbfc7..403cbddbb 100644
--- a/meta-oe/recipes-support/fltk/fltk.inc
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -11,9 +11,8 @@ SRC_URI = " \
     file://0002-always-build-fluid-and-export-pointers.patch \
 "
 
-PV = "1.3.5"
-SRC_URI[md5sum] = "0de2b45a1896be2b4a8cafae89b84248"
-SRC_URI[sha256sum] = "2933c72400f9e7c0f4c3a81a1ce98bc9582b2a3edc44b8597ccd26e240e32c3c"
+PV = "1.3.6"
+SRC_URI[sha256sum] = "20d2627c97b4485ee3eab5522303985bc22b798a878ba80239e6d43dcfed067e"
 
 inherit cmake pkgconfig
 
diff --git a/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch b/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
index cca977c66..0d91aab3a 100644
--- a/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
+++ b/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
@@ -1,6 +1,6 @@
 From 16010cb1a69ea2326d8102b7f1e34b65aca4b278 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 28 Feb 2017 01:20:42 +0100
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 22 May 2021 12:33:15 +0200
 Subject: [PATCH] always build fluid and export pointers
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -8,24 +8,24 @@ Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  CMake/export.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMake/export.cmake b/CMake/export.cmake
-index 968186a..95e04eb 100644
+index 6e8bc5d..71b6f6c 100644
 --- a/CMake/export.cmake
 +++ b/CMake/export.cmake
-@@ -21,7 +21,7 @@
- # final config and export
+@@ -20,7 +20,7 @@
  #######################################################################
+ 
  # Set the fluid executable path
--if(CMAKE_CROSSCOMPILING)
-+if(FALSE)
-    find_file(FLUID_PATH
-       NAMES fluid fluid.exe
-       PATHS ENV PATH
+-if (CMAKE_CROSSCOMPILING)
++if (FALSE)
+   find_file(FLUID_PATH
+     NAMES fluid fluid.exe
+     PATHS ENV PATH
 -- 
-2.9.3
+2.31.1
 
diff --git a/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch b/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch
deleted file mode 100644
index 1f2f8aecf..000000000
--- a/meta-oe/recipes-support/fltk/fltk/0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bc38fb41044503c9debf5710910c51dd29674b6a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 15 Dec 2017 22:14:01 +0100
-Subject: [PATCH] CMake build: Force shared libs with unsuffixed names
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-For windows build sake CMake complains when a project wants to build shared and
-static libraries with same name. This caused the authors of fltk to generate
-libraries with names suffixed by '_SHARED' when building fltk with cmake -
-autotools builds do not suffix.
-
-Reasons to build shared libs with correct names:
-
-* Shared libraries are the preferred choice for embedded devices
-* There are projects (e.g yoshimi) expecting shared libraries with unsuffixed
-  names - as created by autotools build. These projects link against static
-  libraries by accident causing unusable binaries.
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- CMake/macros.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMake/macros.cmake b/CMake/macros.cmake
-index 4def62d..ab675f0 100644
---- a/CMake/macros.cmake
-+++ b/CMake/macros.cmake
-@@ -49,7 +49,7 @@ macro(FL_ADD_LIBRARY LIBNAME LIBTYPE LIBFILES)
- 	    PROPERTIES
- 	    VERSION ${FLTK_VERSION_FULL}
- 	    SOVERSION ${FLTK_VERSION_MAJOR}.${FLTK_VERSION_MINOR}
--	    PREFIX "lib"    # for MSVC static/shared coexistence
-+	    OUTPUT_NAME ${LIBNAME} CLEAN_DIRECT_OUTPUT 1
- 	    )
-     endif (${LIBTYPE} STREQUAL "SHARED")
- 
--- 
-2.9.5
-
diff --git a/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch b/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
deleted file mode 100644
index 974c02fe6..000000000
--- a/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-Fix build error when enable package config examples.
-
-Upstream-Status: Backport [https://github.com/fltk/fltk/commit/16774dd]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-
-From 16774ddc4e000c89e560fde0ced8be9814ef041e Mon Sep 17 00:00:00 2001
-From: Albrecht Schlosser <albrechts.fltk@online.de>
-Date: Wed, 8 Feb 2017 02:06:52 +0000
-Subject: [PATCH] Rename test/help demo program to test/help_dialog.
-
-This change avoids a name conflict with CMake's auto-generated target 'help'
-for "Unix Makefiles", "Ninja", and supposedly other generators as well.
-
-
-git-svn-id: file:///fltk/svn/fltk/branches/branch-1.4@12171 ea41ed52-d2ee-0310-a9c1-e6b18d33e121
----
- CMake/macros.cmake                        |  5 -----
- documentation/src/examples.dox            |  8 +++----
- test/CMakeLists.txt                       | 27 +++++++++++++++++++----
- test/demo.menu                            |  2 +-
- test/{help.cxx => help_dialog.cxx}        |  6 ++---
- test/{help-test.html => help_dialog.html} |  0
- 6 files changed, 31 insertions(+), 17 deletions(-)
- rename test/{help.cxx => help_dialog.cxx} (88%)
- rename test/{help-test.html => help_dialog.html} (100%)
-
-diff --git a/CMake/macros.cmake b/CMake/macros.cmake
-index 5b0d0fa..7134fcb 100644
---- a/CMake/macros.cmake
-+++ b/CMake/macros.cmake
-@@ -90,11 +90,6 @@ function(CREATE_EXAMPLE NAME SOURCES LIBRARIES)
- 
-     set (tname ${NAME})		# target name
- 
--    # rename reserved target name "help" (CMake 2.8.12 and later)
--    if (${tname} MATCHES "^help$")
--        set (tname "test_help")
--    endif (${tname} MATCHES "^help$")
--
-     foreach(src ${SOURCES})
-         if ("${src}" MATCHES "\\.fl$")
-             list(APPEND flsrcs ${src})
-diff --git a/documentation/src/examples.dox b/documentation/src/examples.dox
-index 5105b7b..7961b02 100644
---- a/documentation/src/examples.dox
-+++ b/documentation/src/examples.dox
-@@ -60,7 +60,7 @@ you build FLTK, unlike those in the 'test' directory shown below.
- </tr>
- <tr>
- <td> \ref examples_hello           </td>
--<td> \ref examples_help            </td>
-+<td> \ref examples_help_dialog     </td>
- <td> \ref examples_iconize         </td>
- <td> \ref examples_image           </td>
- <td> \ref examples_inactive        </td>
-@@ -326,13 +326,13 @@ easily under FLTK.
- tiny demo shows how little is needed to get a functioning application
- running with FLTK. Quite impressive, I'd say.
- 
--\subsection examples_help help
-+\subsection examples_help_dialog help_dialog
- 
- \par
--\c help displays the built-in FLTK help browser. The 
-+\c help_dialog displays the built-in FLTK help browser. The
- Fl_Help_Dialog understands a subset of html and renders
- various image formats. This widget makes it easy to provide help
--pages to the user without depending on the operating system's 
-+pages to the user without depending on the operating system's
- html browser.
- 
- \subsection examples_iconize iconize
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 22ec9ab..4caffa5 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -1,3 +1,22 @@
-+#
-+# "$Id$"
-+#
-+# CMakeLists.txt used to build test and demo apps by the CMake build system
-+#
-+# Copyright 2004-2017 by Bill Spitzak and others.
-+#
-+# This library is free software. Distribution and use rights are outlined in
-+# the file "COPYING" which should have been included with this file.  If this
-+# file is missing or damaged, see the license at:
-+#
-+#     http://www.fltk.org/COPYING.php
-+#
-+# Please report all bugs and problems on the following page:
-+#
-+#     http://www.fltk.org/str.php
-+#
-+#######################################################################
-+
- set(EXECUTABLE_OUTPUT_PATH ${FLTK_BINARY_DIR}/bin/examples)
- 
- #######################################################################
-@@ -64,7 +83,7 @@ CREATE_EXAMPLE(file_chooser file_chooser.cxx "fltk;fltk_images")
- CREATE_EXAMPLE(fonts fonts.cxx fltk)
- CREATE_EXAMPLE(forms forms.cxx "fltk;fltk_forms")
- CREATE_EXAMPLE(hello hello.cxx fltk)
--CREATE_EXAMPLE(help help.cxx "fltk;fltk_images")
-+CREATE_EXAMPLE(help_dialog help_dialog.cxx "fltk;fltk_images")
- CREATE_EXAMPLE(icon icon.cxx fltk)
- CREATE_EXAMPLE(iconize iconize.cxx fltk)
- CREATE_EXAMPLE(image image.cxx fltk)
-@@ -134,7 +153,7 @@ endif(FLTK_HAVE_CAIRO)
- # Note: this is incomplete as of 11 Feb 2015
- # Todo: currently all files are copied, but some of them need configuration:
- # - demo.menu: fluid can't be started (wrong path)
--# - demo.menu: help (help-test.html) can't find its images (not copied)
-+# - demo.menu: help_dialog (help_dialog.html) can't find its images (not copied)
- # - maybe more ...
- 
- # prepare for a "better" test file installation path
-@@ -149,11 +168,11 @@ configure_file(demo.menu ${TESTFILE_PATH}/demo.menu COPYONLY)
- 
- # use target directory only to avoid redundancy
- configure_file(rgb.txt ${TESTFILE_PATH} COPYONLY)
--configure_file(help-test.html ${TESTFILE_PATH} COPYONLY)
-+configure_file(help_dialog.html ${TESTFILE_PATH} COPYONLY)
- configure_file(browser.cxx ${TESTFILE_PATH} COPYONLY)
- configure_file(editor.cxx ${TESTFILE_PATH} COPYONLY)
- if(APPLE AND NOT OPTION_APPLE_X11)
-     configure_file(browser.cxx "${TESTFILE_PATH}/browser.app/Contents/Resources/browser.cxx" COPYONLY)
-     configure_file(rgb.txt ${TESTFILE_PATH}/colbrowser.app/Contents/Resources/rgb.txt COPYONLY)
--    configure_file(help-test.html ${TESTFILE_PATH}/help.app/Contents/Resources/help-test.html COPYONLY)
-+    configure_file(help_dialog.html ${TESTFILE_PATH}/help_dialog.app/Contents/Resources/help_dialog.html COPYONLY)
- endif(APPLE AND NOT OPTION_APPLE_X11)
-diff --git a/test/demo.menu b/test/demo.menu
-index 337a71c..97e522a 100644
---- a/test/demo.menu
-+++ b/test/demo.menu
-@@ -77,7 +77,7 @@
- 	@o:Font Tests...:@of
- 		@of:Fonts:fonts
- 		@of:UTF-8:utf8
--	@o:HelpDialog:help
-+	@o:HelpDialog:help_dialog
- 	@o:Input Choice:input_choice
- 	@o:Preferences:preferences
- 	@o:Threading:threads
-diff --git a/test/help.cxx b/test/help_dialog.cxx
-similarity index 88%
-rename from test/help.cxx
-rename to test/help_dialog.cxx
-index f5c51d6..7866641 100644
---- a/test/help.cxx
-+++ b/test/help_dialog.cxx
-@@ -3,7 +3,7 @@
- //
- // Fl_Help_Dialog test program.
- //
--// Copyright 1999-2010 by Easy Software Products.
-+// Copyright 2011-2017 by Bill Spitzak and others.
- //
- // This library is free software. Distribution and use rights are outlined in
- // the file "COPYING" which should have been included with this file.  If this
-@@ -46,13 +46,13 @@ main(int  argc,			// I - Number of command-line arguments
-     strcpy(buf, argv[0]);
-     char *slash = strrchr(buf, '/');
-     if (slash)
--      strcpy(slash, "/../Resources/help-test.html");
-+      strcpy(slash, "/../Resources/help_dialog.html");
-     help->load(buf);
-   
- #else
-   
-   if (argc <= 1)
--    help->load("help-test.html");
-+    help->load("help_dialog.html");
-   else
-     help->load(argv[1]);
-   
-diff --git a/test/help-test.html b/test/help_dialog.html
-similarity index 100%
-rename from test/help-test.html
-rename to test/help_dialog.html
-- 
2.31.1

