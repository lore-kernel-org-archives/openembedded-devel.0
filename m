Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 591E67F978
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:35 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i6so16064941pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hzfdrrjchjDQAUnsT/2w90tweGmgkh5vVMcfTdGuNcY=;
	b=Ju4ZHLnWMuQzfM5qudp/1/boyxM58VQuj8tQLa8ZmFkKtWYTzrZCHaic50fCQhy2BL
	FSepwFXN4U+L42NlSIQxv4SU9OiIprOk+2+E8MaxMF+4JMqWxULsFwSdIY8hewIX5yQ7
	hWb2ibFudkuJdEwR+mc9s9V7vKbhpv45w0AiIUEOGQKfI6p5jR8e5vXqY0egJPrwTh9N
	ENLGyd9TctJrxEQ98wE/A/QcbrXO/4LfqTUtojy2yFVvBAZoHU9D0AlvkLPUH57A+heW
	wJF3hN68siiBa1e22Ywt67o3dYQfK5lWieGSASPJutaCoUraP4qKmCTcBuzxdLlBbOUE
	EMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hzfdrrjchjDQAUnsT/2w90tweGmgkh5vVMcfTdGuNcY=;
	b=J/16ymy9EZCL2hknqhzxkmY6Mi+YD8cnA7JlKfKBgdCc+OUzPvPunHCszR9R19mKku
	n5l5jEDnCe4sh9Hr7qgX9hBKUFLAwgYad/2k7UeCR9JtNkos+2pe2mUVcmbRDf1k7QFH
	98HcNGyt/ZW6YkoWIDOmLHiRXCATq8MO22AtSCG6UDWMCSOXsUMIcu/OAA1KdgvMTSPf
	VXus7lbFQ4EEfG9RdQN67qSmpgLaL6q1/BlGqjRWXrNUIy/74V1HeKWcUNREU/9wX1+e
	Zv4AJOXDZtdvSXeqHRWahz4UeXXE0PPgmkB96McPzWbDWhOcY6MAPSl2zi74foi+m+WI
	eolw==
X-Gm-Message-State: APjAAAXV+aIuuPdU+x8p4vPJxHkpZeGoxJSSAV1WlglbtOyKo1Pz2MPN
	7ipixO86z+8cLs60Gc7tsvv9Khe2AQs=
X-Google-Smtp-Source: APXvYqxKcU2WZ8Y4K6Q+to/Ki0VvC0ZksMTQlSrVSehBIukKr24onoEMVcWgwWMZpxmiyTLlG3ClDg==
X-Received: by 2002:a62:6401:: with SMTP id y1mr70462175pfb.18.1578019776197; 
	Thu, 02 Jan 2020 18:49:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:02 -0800
Message-Id: <9371e4c7e6511c82e42caa72d51132f24c5613e2.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 05/17] fltk: fix build error when enable package config examples
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:36 -0000

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix fltk build error when enable package config
'examples'. Drop the useless parts such as .gitignore and Makefile
from the patch.

fltk-native is also required by package config 'examples'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bbecc5dfc4d6da8ff3b4606d7cd24eeb2df0a7bc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb          |   7 +-
 ...-when-enable-package-config-examples.patch | 182 ++++++++++++++++++
 2 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index ec9e04bed62..0f30acc3a11 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -5,7 +5,10 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 inherit distro_features_check binconfig lib_package gtk-icon-cache mime
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch"
+SRC_URI += " \
+    file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch \
+    file://0004-Fix-build-error-when-enable-package-config-examples.patch \
+"
 
 EXTRA_OECMAKE = " \
     -DOPTION_BUILD_SHARED_LIBS=ON \
@@ -17,7 +20,7 @@ EXTRA_OECMAKE = " \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,"
+PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,fltk-native"
 PACKAGECONFIG[cairo] = "-DOPTION_CAIRO=ON,-DOPTION_CAIRO=OFF,cairo"
 PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
 PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
diff --git a/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch b/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
new file mode 100644
index 00000000000..974c02fe619
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/0004-Fix-build-error-when-enable-package-config-examples.patch
@@ -0,0 +1,182 @@
+Fix build error when enable package config examples.
+
+Upstream-Status: Backport [https://github.com/fltk/fltk/commit/16774dd]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+
+From 16774ddc4e000c89e560fde0ced8be9814ef041e Mon Sep 17 00:00:00 2001
+From: Albrecht Schlosser <albrechts.fltk@online.de>
+Date: Wed, 8 Feb 2017 02:06:52 +0000
+Subject: [PATCH] Rename test/help demo program to test/help_dialog.
+
+This change avoids a name conflict with CMake's auto-generated target 'help'
+for "Unix Makefiles", "Ninja", and supposedly other generators as well.
+
+
+git-svn-id: file:///fltk/svn/fltk/branches/branch-1.4@12171 ea41ed52-d2ee-0310-a9c1-e6b18d33e121
+---
+ CMake/macros.cmake                        |  5 -----
+ documentation/src/examples.dox            |  8 +++----
+ test/CMakeLists.txt                       | 27 +++++++++++++++++++----
+ test/demo.menu                            |  2 +-
+ test/{help.cxx => help_dialog.cxx}        |  6 ++---
+ test/{help-test.html => help_dialog.html} |  0
+ 6 files changed, 31 insertions(+), 17 deletions(-)
+ rename test/{help.cxx => help_dialog.cxx} (88%)
+ rename test/{help-test.html => help_dialog.html} (100%)
+
+diff --git a/CMake/macros.cmake b/CMake/macros.cmake
+index 5b0d0fa..7134fcb 100644
+--- a/CMake/macros.cmake
++++ b/CMake/macros.cmake
+@@ -90,11 +90,6 @@ function(CREATE_EXAMPLE NAME SOURCES LIBRARIES)
+ 
+     set (tname ${NAME})		# target name
+ 
+-    # rename reserved target name "help" (CMake 2.8.12 and later)
+-    if (${tname} MATCHES "^help$")
+-        set (tname "test_help")
+-    endif (${tname} MATCHES "^help$")
+-
+     foreach(src ${SOURCES})
+         if ("${src}" MATCHES "\\.fl$")
+             list(APPEND flsrcs ${src})
+diff --git a/documentation/src/examples.dox b/documentation/src/examples.dox
+index 5105b7b..7961b02 100644
+--- a/documentation/src/examples.dox
++++ b/documentation/src/examples.dox
+@@ -60,7 +60,7 @@ you build FLTK, unlike those in the 'test' directory shown below.
+ </tr>
+ <tr>
+ <td> \ref examples_hello           </td>
+-<td> \ref examples_help            </td>
++<td> \ref examples_help_dialog     </td>
+ <td> \ref examples_iconize         </td>
+ <td> \ref examples_image           </td>
+ <td> \ref examples_inactive        </td>
+@@ -326,13 +326,13 @@ easily under FLTK.
+ tiny demo shows how little is needed to get a functioning application
+ running with FLTK. Quite impressive, I'd say.
+ 
+-\subsection examples_help help
++\subsection examples_help_dialog help_dialog
+ 
+ \par
+-\c help displays the built-in FLTK help browser. The 
++\c help_dialog displays the built-in FLTK help browser. The
+ Fl_Help_Dialog understands a subset of html and renders
+ various image formats. This widget makes it easy to provide help
+-pages to the user without depending on the operating system's 
++pages to the user without depending on the operating system's
+ html browser.
+ 
+ \subsection examples_iconize iconize
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 22ec9ab..4caffa5 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -1,3 +1,22 @@
++#
++# "$Id$"
++#
++# CMakeLists.txt used to build test and demo apps by the CMake build system
++#
++# Copyright 2004-2017 by Bill Spitzak and others.
++#
++# This library is free software. Distribution and use rights are outlined in
++# the file "COPYING" which should have been included with this file.  If this
++# file is missing or damaged, see the license at:
++#
++#     http://www.fltk.org/COPYING.php
++#
++# Please report all bugs and problems on the following page:
++#
++#     http://www.fltk.org/str.php
++#
++#######################################################################
++
+ set(EXECUTABLE_OUTPUT_PATH ${FLTK_BINARY_DIR}/bin/examples)
+ 
+ #######################################################################
+@@ -64,7 +83,7 @@ CREATE_EXAMPLE(file_chooser file_chooser.cxx "fltk;fltk_images")
+ CREATE_EXAMPLE(fonts fonts.cxx fltk)
+ CREATE_EXAMPLE(forms forms.cxx "fltk;fltk_forms")
+ CREATE_EXAMPLE(hello hello.cxx fltk)
+-CREATE_EXAMPLE(help help.cxx "fltk;fltk_images")
++CREATE_EXAMPLE(help_dialog help_dialog.cxx "fltk;fltk_images")
+ CREATE_EXAMPLE(icon icon.cxx fltk)
+ CREATE_EXAMPLE(iconize iconize.cxx fltk)
+ CREATE_EXAMPLE(image image.cxx fltk)
+@@ -134,7 +153,7 @@ endif(FLTK_HAVE_CAIRO)
+ # Note: this is incomplete as of 11 Feb 2015
+ # Todo: currently all files are copied, but some of them need configuration:
+ # - demo.menu: fluid can't be started (wrong path)
+-# - demo.menu: help (help-test.html) can't find its images (not copied)
++# - demo.menu: help_dialog (help_dialog.html) can't find its images (not copied)
+ # - maybe more ...
+ 
+ # prepare for a "better" test file installation path
+@@ -149,11 +168,11 @@ configure_file(demo.menu ${TESTFILE_PATH}/demo.menu COPYONLY)
+ 
+ # use target directory only to avoid redundancy
+ configure_file(rgb.txt ${TESTFILE_PATH} COPYONLY)
+-configure_file(help-test.html ${TESTFILE_PATH} COPYONLY)
++configure_file(help_dialog.html ${TESTFILE_PATH} COPYONLY)
+ configure_file(browser.cxx ${TESTFILE_PATH} COPYONLY)
+ configure_file(editor.cxx ${TESTFILE_PATH} COPYONLY)
+ if(APPLE AND NOT OPTION_APPLE_X11)
+     configure_file(browser.cxx "${TESTFILE_PATH}/browser.app/Contents/Resources/browser.cxx" COPYONLY)
+     configure_file(rgb.txt ${TESTFILE_PATH}/colbrowser.app/Contents/Resources/rgb.txt COPYONLY)
+-    configure_file(help-test.html ${TESTFILE_PATH}/help.app/Contents/Resources/help-test.html COPYONLY)
++    configure_file(help_dialog.html ${TESTFILE_PATH}/help_dialog.app/Contents/Resources/help_dialog.html COPYONLY)
+ endif(APPLE AND NOT OPTION_APPLE_X11)
+diff --git a/test/demo.menu b/test/demo.menu
+index 337a71c..97e522a 100644
+--- a/test/demo.menu
++++ b/test/demo.menu
+@@ -77,7 +77,7 @@
+ 	@o:Font Tests...:@of
+ 		@of:Fonts:fonts
+ 		@of:UTF-8:utf8
+-	@o:HelpDialog:help
++	@o:HelpDialog:help_dialog
+ 	@o:Input Choice:input_choice
+ 	@o:Preferences:preferences
+ 	@o:Threading:threads
+diff --git a/test/help.cxx b/test/help_dialog.cxx
+similarity index 88%
+rename from test/help.cxx
+rename to test/help_dialog.cxx
+index f5c51d6..7866641 100644
+--- a/test/help.cxx
++++ b/test/help_dialog.cxx
+@@ -3,7 +3,7 @@
+ //
+ // Fl_Help_Dialog test program.
+ //
+-// Copyright 1999-2010 by Easy Software Products.
++// Copyright 2011-2017 by Bill Spitzak and others.
+ //
+ // This library is free software. Distribution and use rights are outlined in
+ // the file "COPYING" which should have been included with this file.  If this
+@@ -46,13 +46,13 @@ main(int  argc,			// I - Number of command-line arguments
+     strcpy(buf, argv[0]);
+     char *slash = strrchr(buf, '/');
+     if (slash)
+-      strcpy(slash, "/../Resources/help-test.html");
++      strcpy(slash, "/../Resources/help_dialog.html");
+     help->load(buf);
+   
+ #else
+   
+   if (argc <= 1)
+-    help->load("help-test.html");
++    help->load("help_dialog.html");
+   else
+     help->load(argv[1]);
+   
+diff --git a/test/help-test.html b/test/help_dialog.html
+similarity index 100%
+rename from test/help-test.html
+rename to test/help_dialog.html
-- 
2.17.1


