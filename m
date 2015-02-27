Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id DFA44737C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:16 +0000 (UTC)
Received: by wiwh11 with SMTP id h11so2987151wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CHibRAsB7yCHAz5WYKUr6MqLHuE1lYiM+QfnwRLKAc8=;
	b=qistU0ErZF5Bt4NEEtm2K5aGHg9XxSQUOCRwpfIDFrZmyztuD74l358nZn5FK4FHf1
	ijpg3ppLCURXWnzyP6KHKCwq31VL7S/7BuJX+2GG1LZ2FjqWIR3f6zwNOQBAc9svQ/JC
	rFVbCvnoSXLnfXLP0Yn0uEeh7O0/6vWURsAOLjul0MZNzc+3xWMyG6aOIHC3OB66evfK
	ubZ2TeWAFXouLikYMXvWvQ8bh9jW3ZXOSWSzrfI0jMiAbrDzLj6jYsn2cbrRbFIXwYn4
	onIEkK0UWI4LFkz37q6lfqv3y52CoSFtpklUv+op/qj/5UXiwAAm1axoERG7a+mkhAgj
	q1Sg==
X-Received: by 10.180.106.103 with SMTP id gt7mr10296994wib.59.1425070577365; 
	Fri, 27 Feb 2015 12:56:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ka1sm7564316wjc.2.2015.02.27.12.56.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:27 +0100
Message-Id: <1425070591-28158-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 3/7] recipes: Refresh patches to match git recipes
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc                | 18 ++---
 recipes-qt/qt5/qtbase-native.inc                   | 16 ++---
 recipes-qt/qt5/qtbase.inc                          | 17 +++--
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 11 ++--
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch | 10 +--
 .../0003-Add-external-hostbindir-option.patch      | 14 ++--
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch | 30 ---------
 ...e-Fix-pkgconfig-and-libtool-replacements.patch} |  8 +--
 ...fs-Print-the-chosen-config-in-debug-mode.patch} |  8 +--
 ...integration-Undefine-CursorShape-from-X..patch} |  6 +-
 ...mp-path-length-from-256-to-512-character.patch} |  8 +--
 ...l-error-for-platforms-only-supporting-on.patch} |  6 +-
 ...0009-QOpenGLPaintDevice-sub-area-support.patch} | 22 +++----
 ...onfigExtras.cmake-find-gl-es-include-dir.patch} |  6 +-
 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch  | 10 +--
 ...-build-it-in-configure-but-allow-to-build.patch | 21 +++---
 ...xternal-hostbindir-option-for-native-sdk.patch} | 76 +++++++++++-----------
 ...ch => 0012-Set-paths-for-target-properly.patch} | 14 ++--
 ...tch => 0013-Fix-build-of-egl-integration.patch} | 39 +++++++----
 ...eserve-built-qmake-and-swap-with-native-.patch} |  8 +--
 recipes-qt/qt5/qtbase_5.4.1.bb                     |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  8 +--
 ...ats.pro-Make-the-dependencies-determinist.patch |  4 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 33 +++++-----
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +-
 .../0003-add-noqtwebkit-configuration.patch        |  8 +--
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  4 +-
 ...yland-include-server-buffer-only-when-bui.patch |  4 +-
 ...amples-enable-building-examples-by-defaul.patch |  4 +-
 recipes-qt/qt5/qtwebkit.inc                        |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 19 +++---
 ....patch => 0002-Remove-TEXTREL-tag-in-x86.patch} | 51 +++++++++------
 33 files changed, 249 insertions(+), 246 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
 rename recipes-qt/qt5/qtbase/{0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch => 0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch} (96%)
 rename recipes-qt/qt5/qtbase/{0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch => 0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch} (97%)
 rename recipes-qt/qt5/qtbase/{0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (87%)
 rename recipes-qt/qt5/qtbase/{0008-configure-bump-path-length-from-256-to-512-character.patch => 0007-configure-bump-path-length-from-256-to-512-character.patch} (84%)
 rename recipes-qt/qt5/qtbase/{0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (94%)
 rename recipes-qt/qt5/qtbase/{0010-QOpenGLPaintDevice-sub-area-support.patch => 0009-QOpenGLPaintDevice-sub-area-support.patch} (90%)
 rename recipes-qt/qt5/qtbase/{0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch => 0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch} (90%)
 rename recipes-qt/qt5/qtbase/{0014-Add-external-hostbindir-option-native.patch => 0012-Add-external-hostbindir-option-for-native-sdk.patch} (84%)
 rename recipes-qt/qt5/qtbase/{0015-Set-paths-for-target-properly.patch => 0012-Set-paths-for-target-properly.patch} (87%)
 rename recipes-qt/qt5/qtbase/{0014-fix-build-of-egl-integration.patch => 0013-Fix-build-of-egl-integration.patch} (81%)
 rename recipes-qt/qt5/qtbase/{0012-configure-preserve-built-qmake-and-swap-with-native-.patch => 0013-configure-preserve-built-qmake-and-swap-with-native-.patch} (81%)
 rename recipes-qt/qt5/qtwebkit/{0002-qtwebkit-fix-textrel-x86.patch => 0002-Remove-TEXTREL-tag-in-x86.patch} (73%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 8a0b31a..3bad980 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -15,24 +15,24 @@ SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
-    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-    file://0014-Add-external-hostbindir-option-native.patch \
+    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index 6a0191d..7b44fb7 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -12,19 +12,19 @@ SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
-    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-    file://0014-Add-external-hostbindir-option-native.patch \
+    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 QT_CONF_PATH = "${B}/qt.conf"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4bb1a69..c6fe358 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -5,20 +5,19 @@ SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
-    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
-    file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
+    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
 "
 
 # specific for qtbase
 SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0015-Set-paths-for-target-properly.patch \
+    file://0012-Set-paths-for-target-properly.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 7a94dff..5f7ab14 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 81cd2947e9b1290498bdc2505a76fb053ff33be8 Mon Sep 17 00:00:00 2001
+From df887cc51d1cf5328e536708b461f475e9fb4577 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/11] Add linux-oe-g++ platform
+Subject: [PATCH 01/13] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -40,6 +40,7 @@ Subject: [PATCH 01/11] Add linux-oe-g++ platform
 Upstream-Status: Inappropriate [embedded specific]
                  too OE specific, probably cannot be upstreamed
 
+Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure                            |  66 ++++++++++++++++-------
@@ -51,7 +52,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 229fb4e..b7a6fe3 100755
+index 5ad29bb..0bcc175 100755
 --- a/configure
 +++ b/configure
 @@ -316,6 +316,16 @@ getQMakeConf()
@@ -195,7 +196,7 @@ index 6b37a04..dcf6025 100644
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000..ca26b10
+index 0000000..2ad2810
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
 @@ -0,0 +1,40 @@
@@ -346,5 +347,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index bae0dd3..f8420c0 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From aae38b0ff226f287ad40f6eb423f1b974f548b73 Mon Sep 17 00:00:00 2001
+From 046ff855191e587ce9263f40bd46183c175b6387 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/11] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/13] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 7ca0aa7..d68c51b 100644
+index d592032..c418c5e 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -139,7 +139,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -35,5 +35,5 @@ index 7ca0aa7..d68c51b 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 87e8f0f..ff26967 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From f2d51e50a7fbdf485696d1b8b2d29e64c729c76b Mon Sep 17 00:00:00 2001
+From 6c015d77a95910deec0a8c4a265587578531b476 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/11] Add -external-hostbindir option
+Subject: [PATCH 03/13] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -31,10 +31,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 11 files changed, 50 insertions(+), 13 deletions(-)
+ 7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index b7a6fe3..d715f6c 100755
+index 0bcc175..996ce50 100755
 --- a/configure
 +++ b/configure
 @@ -769,6 +769,7 @@ QT_HOST_BINS=
@@ -95,10 +95,10 @@ index b7a6fe3..d715f6c 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index a9a622d..b6f1db0 100644
+index 7961f65..e11b23d 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -191,7 +191,11 @@ defineTest(qtAddRpathLink) {
+@@ -192,7 +192,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -229,5 +229,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
deleted file mode 100644
index 83694b7..0000000
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 13a61389aa33fdfd5d9a1adf824d98c5ebf1cdff Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/11] configureapp: Prefix default LIBDIRS and INCDIRS with
- SYSROOT
-
-Upstream-Status: Pending
-  again a bit OE specific
----
- tools/configure/configureapp.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index d0a62c8..b3f3ff8 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -3384,8 +3384,8 @@ void Configure::generateQConfigPri()
-         configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
-         if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
-             // FIXME: add detection
--            configStream << "    QMAKE_DEFAULT_LIBDIRS = /lib /usr/lib" << endl;
--            configStream << "    QMAKE_DEFAULT_INCDIRS = /usr/include /usr/local/include" << endl;
-+            configStream << "    QMAKE_DEFAULT_LIBDIRS = $$[QT_SYSROOT]/lib $$[QT_SYSROOT]/usr/lib" << endl;
-+            configStream << "    QMAKE_DEFAULT_INCDIRS = $$[QT_SYSROOT]/usr/include $$[QT_SYSROOT]/usr/local/include" << endl;
-         }
-         configStream << "}" << endl;
-         configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
--- 
-2.1.3
-
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
similarity index 96%
rename from recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
rename to recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index a6e9089..45fca3a 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From 5778f98f990781710e72be8275dae32a7999330d Mon Sep 17 00:00:00 2001
+From 55e85e61eb93bce5b84f856ea5cc47af73e01a1d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/11] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 04/13] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index af9d6ca..a4781d6 100644
+index eb65e73..4db40d0 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
@@ -110,5 +110,5 @@ index d213f9e..915c596 100644
  }
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
similarity index 97%
rename from recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
rename to recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 042d763..4a71e0f 100644
--- a/recipes-qt/qt5/qtbase/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,7 +1,7 @@
-From 4a067c162d08596e3ec89dcfb3ecdf197b1bf22a Mon Sep 17 00:00:00 2001
+From 129d2a82da2ef6eede761967d981c5edcc0820d8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 06/11] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 05/13] Revert "eglfs: Print the chosen config in debug mode"
 
 With this change the build is failing with:
 | In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
@@ -68,7 +68,7 @@ index c1a491c..7a0fc87 100644
  
  #ifdef Q_OS_UNIX
 diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index 7cc3300..ccbd974 100644
+index 7cc3300..ccbd974a 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
 +++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
 @@ -37,7 +37,6 @@
@@ -93,5 +93,5 @@ index 7cc3300..ccbd974 100644
  }
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index c528f0c..84e5dba 100644
--- a/recipes-qt/qt5/qtbase/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 8e152449beb18454347cfdb300c50d113fa48383 Mon Sep 17 00:00:00 2001
+From f2092e73beaffe163a5c7f66f73956477f0d97a1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/11] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 06/13] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -26,5 +26,5 @@ index 4d7adce..c9b6873 100644
  
  class QEGLPlatformScreen;
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
rename to recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
index c20d6f1..1bbda75 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 3a31a14c9c244a22337f22d083a680f69a1b1ce8 Mon Sep 17 00:00:00 2001
+From 24e36583f44a17ce6d21e4392dd4f6a83ea9846a Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 08/11] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 07/13] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,7 +12,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index d715f6c..bd43281 100755
+index 996ce50..a40d471 100755
 --- a/configure
 +++ b/configure
 @@ -3622,7 +3622,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
@@ -25,5 +25,5 @@ index d715f6c..bd43281 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 200864a..f908e78 100644
--- a/recipes-qt/qt5/qtbase/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From 621d867223a135a9babd452d4918200bc6d0463b Mon Sep 17 00:00:00 2001
+From 7886d849487f0c0bbfa54f9ef9708fdc9cc84c04 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 09/11] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 08/13] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -68,5 +68,5 @@ index f5839e0..5ebde6d 100644
  
      if (isRaster()) {
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
index 986d2a9..f7062ff 100644
--- a/recipes-qt/qt5/qtbase/0010-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 46074ffb4525e8217acd78c9cbe29f3d62f85c78 Mon Sep 17 00:00:00 2001
+From 47ee1da94f74c46fd692bcd55c2770f6c3be92f3 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 10/11] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 09/13] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -81,10 +81,10 @@ index 0b01129..211f2f3 100644
  
      qreal dpmx;
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index c490726..1d775fd 100644
+index 8eeaa31..e17520e 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2002,7 +2002,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2080,7 +2080,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -95,16 +95,16 @@ index c490726..1d775fd 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2089,7 +2092,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2167,7 +2170,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
 -        d->funcs.glViewport(0, 0, d->width, d->height);
 +        d->funcs.glViewport(d->x, d->y, d->width, d->height);
          d->needsSync = false;
-         d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2132,6 +2135,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+         d->syncGlState();
+@@ -2209,6 +2212,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -112,7 +112,7 @@ index c490726..1d775fd 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2140,12 +2144,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2217,12 +2221,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -128,10 +128,10 @@ index c490726..1d775fd 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 5ef0366..c5b517d 100644
+index 9722ea3..07e3163 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -256,6 +256,7 @@ public:
+@@ -264,6 +264,7 @@ public:
      QOpenGL2PaintEngineEx* q;
      QOpenGLEngineShaderManager* shaderManager;
      QOpenGLPaintDevice* device;
@@ -153,5 +153,5 @@ index cd268cd..997bc35 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
similarity index 90%
rename from recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
rename to recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
index 6ea42bc..188ae15 100644
--- a/recipes-qt/qt5/qtbase/0013-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -1,7 +1,7 @@
-From f5df17e2a02cf67f3436b7fe640c6bf54ba93ad6 Mon Sep 17 00:00:00 2001
+From d6158c2cb6ce64af531246636c3b2adb35afeb72 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 18 Dec 2014 13:41:09 +0100
-Subject: [PATCH] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
+Subject: [PATCH 10/13] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -38,5 +38,5 @@ index 9a846d4..07869ef 100644
  if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
      message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
 -- 
-1.8.3.1
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index 86bf90d..b0870c8 100644
--- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From d48323aae1bee4b2398d61e1777815ffac15ccce Mon Sep 17 00:00:00 2001
+From fa0cf613bc9ef4de65de12791eedc337de85d911 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 11/12] Always build uic
+Subject: [PATCH 11/13] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 81f4fa5..74ec23d 100644
+index 83f7587..9dbcf70 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -162,7 +162,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index 81f4fa5..74ec23d 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 4d4291c..874bc69 100644
--- a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,7 +1,7 @@
-From ee542556da221be99fa3344630b78529555be2bc Mon Sep 17 00:00:00 2001
+From 7943ec2256163f6049d442ff00f579a5cbff5acc Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
+Subject: [PATCH 11/13] qmake: don't build it in configure, but allow to build
  it separately
 
 * it is already built in qtbase-native, so we don't need it in configure
@@ -18,13 +18,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  qmake/qmake.pri | 3 ++-
  qmake/qmake.pro | 2 ++
  3 files changed, 5 insertions(+), 2 deletions(-)
+---
+ configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
+ qmake/qmake.pro | 1 +
+ 3 files changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 43be722..39516d2 100755
+index a40d471..8d15f59 100755
 --- a/configure
 +++ b/configure
-@@ -3759,7 +3759,7 @@ setBootstrapVariable()
- }
+@@ -3724,7 +3724,7 @@ setBootstrapEvalVariable()
+ 
  
  # build qmake
 -if true; then ###[ '!' -f "$outpath/bin/qmake" ];
@@ -33,7 +38,7 @@ index 43be722..39516d2 100755
  
      mkdir -p "$outpath/qmake" || exit
 diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index 57dcbb0..e2c5845 100644
+index 4de41d6..69982b7 100644
 --- a/qmake/qmake.pri
 +++ b/qmake/qmake.pri
 @@ -82,7 +82,8 @@ bootstrap { #Qt code
@@ -47,7 +52,7 @@ index 57dcbb0..e2c5845 100644
     HEADERS+= \
          qbitarray.h \
 diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 89d6ea5..7c605b9 100644
+index 89d6ea5..0ff4a96 100644
 --- a/qmake/qmake.pro
 +++ b/qmake/qmake.pro
 @@ -8,6 +8,7 @@ CONFIG -= qt
@@ -59,5 +64,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch
rename to recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
index 08a1cbd..06476cb 100644
--- a/recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch
+++ b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,7 +1,7 @@
-From f2d51e50a7fbdf485696d1b8b2d29e64c729c76b Mon Sep 17 00:00:00 2001
+From 932cb18540fc4634e02d048cf9ab9e519ce0811d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/11] Add -external-hostbindir option
+Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -20,42 +20,18 @@ Upstream-Status: Pending
   Oswald) but in 5.2.0 I've noticed that he added something similar for
   android builds
 
+Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- qmake/property.cpp                          |  1 +
- tools/configure/configureapp.cpp            |  8 ++++++++
- src/corelib/global/qlibraryinfo.cpp         |  3 ++-
- src/corelib/global/qlibraryinfo.h           |  1 +
- 1 files changed, 50 insertions(+), 13 deletions(-)
+ qmake/property.cpp                  | 1 +
+ src/corelib/global/qlibraryinfo.cpp | 3 ++-
+ src/corelib/global/qlibraryinfo.h   | 1 +
+ tools/configure/configureapp.cpp    | 8 ++++++++
+ 4 files changed, 12 insertions(+), 1 deletion(-)
 
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 92422c2..d0a62c8 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
-             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
-         }
- 
-+        else if (configCmdLine.at(i) == "-external-hostbindir") {
-+            ++i;
-+            if (i == argCount)
-+                break;
-+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
-+        }
-+
-         else if (configCmdLine.at(i) == "-make-tool") {
-             ++i;
-             if (i == argCount)
-@@ -3995,6 +4002,7 @@ void Configure::generateQConfigCpp()
-                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
-                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
-+                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_targspec=" << targSpec << "\"," << endl
-                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
-                   << "#endif" << endl
 diff --git a/qmake/property.cpp b/qmake/property.cpp
 index 051e056..50da6ed 100644
 --- a/qmake/property.cpp
@@ -69,10 +45,10 @@ index 051e056..50da6ed 100644
      { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
  };
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index d68c51b..7191159 100644
+index c418c5e..c8c4188 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -349,7 +349,7 @@ QLibraryInfo::isDebugBuild()
+@@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -81,7 +57,7 @@ index d68c51b..7191159 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -375,6 +375,7 @@ static const struct {
+@@ -374,6 +374,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -101,6 +77,32 @@ index 543c4b3..a02e03a 100644
          TargetSpecPath,
          HostSpecPath,
          LastHostPath = HostSpecPath,
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 6e9d4aa..0ca4daf 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
+             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
+         }
+ 
++        else if (configCmdLine.at(i) == "-external-hostbindir") {
++            ++i;
++            if (i == argCount)
++                break;
++            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
++        }
++
+         else if (configCmdLine.at(i) == "-make-tool") {
+             ++i;
+             if (i == argCount)
+@@ -4004,6 +4011,7 @@ void Configure::generateQConfigCpp()
+                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
+                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
++                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_targspec=" << targSpec << "\"," << endl
+                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
+                   << "#endif" << endl
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
similarity index 87%
rename from recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch
rename to recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
index 28512f0..671c636 100644
--- a/recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch
+++ b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
@@ -1,7 +1,7 @@
-From d84b7386902e024a0cfe5a6689930e5548a60480 Mon Sep 17 00:00:00 2001
+From 62ec5bc2946911b2cd2f577d58f07f566d84c88d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 22 Jan 2015 16:09:35 +0100
-Subject: [PATCH] Set paths for target properly
+Subject: [PATCH 12/13] Set paths for target properly
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -10,14 +10,14 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure | 42 +++++++++++++++++++++---------------------
- 1 file changed, 21 insertions(+), 21 deletions(-)
+ configure | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
 
 diff --git a/configure b/configure
-index 43be722..0e1a64a 100755
+index 8d15f59..bf2bac0 100755
 --- a/configure
 +++ b/configure
-@@ -3634,28 +3634,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
+@@ -3639,28 +3639,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
      "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
      "qt_tstspath=$QT_SYSROOT_TESTS",
  #else
@@ -68,5 +68,5 @@ index 43be722..0e1a64a 100755
  };
  static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
 -- 
-1.8.3.1
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch b/recipes-qt/qt5/qtbase/0013-Fix-build-of-egl-integration.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch
rename to recipes-qt/qt5/qtbase/0013-Fix-build-of-egl-integration.patch
index f21e820..1fa4aca 100644
--- a/recipes-qt/qt5/qtbase/0014-fix-build-of-egl-integration.patch
+++ b/recipes-qt/qt5/qtbase/0013-Fix-build-of-egl-integration.patch
@@ -1,13 +1,25 @@
-commit f8c8c79029867a087c9a753269d82b808c16f047
-Author: Stephan Binner <stephan.binner@basyskom.com>
-Date:   Mon Feb 2 13:10:50 2015 +0100
+From 2cece4539990f9e7b0239681bd2fc2808aeb8dbc Mon Sep 17 00:00:00 2001
+From: Stephan Binner <stephan.binner@basyskom.com>
+Date: Mon, 2 Feb 2015 13:10:50 +0100
+Subject: [PATCH 13/13] Fix build of egl integration
 
-    Fix build of egl integration
-    
-    Add missing includes and reorder includes to avoid X defines breakage
-    
-    Change-Id: Iaf95ae2488df3d3301436262ed79f7091b4be0a9
-    Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
+Add missing includes and reorder includes to avoid X defines breakage
+
+Upstream-Status: Backport from 5.4 branch https://codereview.qt-project.org/#/c/105116/
+
+Change-Id: Iaf95ae2488df3d3301436262ed79f7091b4be0a9
+Reviewed-by: Laszlo Agocs <laszlo.agocs@theqtcompany.com>
+Signed-off-by: Stephan Binner <stephan.binner@basyskom.com>
+---
+ .../eglconvenience/qeglplatformcontext_p.h           |  1 +
+ .../eglconvenience/qeglplatformintegration_p.h       |  2 +-
+ src/plugins/platforms/eglfs/qeglfscontext.cpp        | 13 +++++++------
+ src/plugins/platforms/eglfs/qeglfshooks_stub.cpp     |  2 +-
+ src/plugins/platforms/eglfs/qeglfsintegration.cpp    | 20 ++++++++++----------
+ src/plugins/platforms/eglfs/qeglfsscreen.cpp         |  4 +++-
+ src/plugins/platforms/eglfs/qeglfswindow.cpp         |  6 ++++--
+ .../platforms/minimalegl/qminimaleglwindow.cpp       |  4 ++--
+ 8 files changed, 29 insertions(+), 23 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext_p.h b/src/platformsupport/eglconvenience/qeglplatformcontext_p.h
 index 7825c7b..0c10710 100644
@@ -22,7 +34,7 @@ index 7825c7b..0c10710 100644
  #include <qpa/qplatformopenglcontext.h>
  #include <QtCore/QVariant>
 diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index 4d7adce..2b5d5f5 100644
+index c9b6873..a0aab03 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 +++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 @@ -45,9 +45,9 @@
@@ -35,7 +47,7 @@ index 4d7adce..2b5d5f5 100644
 -#include <QtCore/QVariant>
  #include <EGL/egl.h>
  
- QT_BEGIN_NAMESPACE
+ // Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
 diff --git a/src/plugins/platforms/eglfs/qeglfscontext.cpp b/src/plugins/platforms/eglfs/qeglfscontext.cpp
 index 6216fa8..6470280 100644
 --- a/src/plugins/platforms/eglfs/qeglfscontext.cpp
@@ -139,7 +151,7 @@ index cd68540..bc93fe2 100644
  QT_BEGIN_NAMESPACE
  
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index f5839e0..39a3ef9 100644
+index 5ebde6d..2c05979 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
 @@ -31,8 +31,7 @@
@@ -179,3 +191,6 @@ index 906a130..d4bee2c 100644
  QT_BEGIN_NAMESPACE
  
  QMinimalEglWindow::QMinimalEglWindow(QWindow *w)
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
index 6a428ed..fb897c9 100644
--- a/recipes-qt/qt5/qtbase/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 9089bf90632ffc983625816c5b0f2f2509ffc176 Mon Sep 17 00:00:00 2001
+From 137890aa64442866a861f0a9f028ee632f19cae4 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
+Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,7 +13,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index bd43281..d331711 100755
+index a40d471..c007427 100755
 --- a/configure
 +++ b/configure
 @@ -3874,6 +3874,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
@@ -26,5 +26,5 @@ index bd43281..d331711 100755
  echo "Running configuration tests..."
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtbase_5.4.1.bb b/recipes-qt/qt5/qtbase_5.4.1.bb
index d423219..fed9df4 100644
--- a/recipes-qt/qt5/qtbase_5.4.1.bb
+++ b/recipes-qt/qt5/qtbase_5.4.1.bb
@@ -3,7 +3,7 @@ require ${PN}.inc
 
 # This patch is in 5.4 branch but didn't make it into 5.4.1 release
 SRC_URI += "\
-    file://0014-fix-build-of-egl-integration.patch \
+    file://0013-Fix-build-of-egl-integration.patch \
 "
 
 SRC_URI[md5sum] = "9507825e558c980fed602de1f16ec7ae"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index c597bce..478862c 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From fd077fa40e7750f5836a07dde4f9c65864f87c3f Mon Sep 17 00:00:00 2001
+From ccfd4907a2683fb0840fa4fd6a9d979395f4331c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -36,7 +36,7 @@ index b5893c5..1b00e6c 100644
  macx: CONFIG -= app_bundle
  
 diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjsengine/qjsengine.pro
-index a62eb75..73b6917 100644
+index fc2452c..919710f 100644
 --- a/tests/auto/qml/qjsengine/qjsengine.pro
 +++ b/tests/auto/qml/qjsengine/qjsengine.pro
 @@ -1,7 +1,7 @@
@@ -47,7 +47,7 @@ index a62eb75..73b6917 100644
 +QT +=  qml qml-private widgets testlib gui-private quick
  macx:CONFIG -= app_bundle
  SOURCES += tst_qjsengine.cpp
- 
+ RESOURCES += qjsengine.qrc
 diff --git a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
 index c6d442e..3181dcd 100644
 --- a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.1.1
+2.3.1
 
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index f473f23..1e45f2a 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 862ce82f7c0237b839539332c860e12c7d3c3e67 Mon Sep 17 00:00:00 2001
+From 706c5aec2b49c685abe5e1ad4d09674d55add789 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.1.1
+2.3.1
 
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 8c6c4fa..f66e864 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,7 +1,7 @@
-From 4af76880d63e8d392eb8add8b8999e3f5031675a Mon Sep 17 00:00:00 2001
+From 6a570205a17663e6adce9e5613eb7694fe2874dc Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
-Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
+Subject: [PATCH] Initial porting effort to GStreamer 1.0.
 
 Imported from git@github.com:jhodapp/qtmultimedia.git
 
@@ -38,7 +38,7 @@ Conflicts:
  src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
  src/gsttools/qgstutils.cpp                         |  27 ++-
  src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 138 +++++++++++++-
+ src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
  src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
  .../qgstreameraudioprobecontrol_p.h                |   5 +-
  .../qgstreamervideoprobecontrol_p.h                |   4 +
@@ -58,7 +58,7 @@ Conflicts:
  .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
  .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
  .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 872 insertions(+), 130 deletions(-)
+ 36 files changed, 871 insertions(+), 129 deletions(-)
 
 diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
 index 02a7e34..6b9843a 100644
@@ -1032,7 +1032,7 @@ index a373dcc..587b010 100644
  
          if (caps) {
 diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 556fc03..5ea2c59 100644
+index 1281d3f..fe3fba0 100644
 --- a/src/gsttools/qgstutils.cpp
 +++ b/src/gsttools/qgstutils.cpp
 @@ -89,8 +89,13 @@ static void addTagToMap(const GstTagList *list,
@@ -1083,7 +1083,7 @@ index 556fc03..5ea2c59 100644
  
  /*!
    Builds GstCaps for an audio format.
-@@ -579,7 +602,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
+@@ -581,7 +604,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
  
  void qt_gst_object_ref_sink(gpointer object)
  {
@@ -1134,7 +1134,7 @@ index 18702ec..93f22f5 100644
  }
  
 diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
-index f3e2d88..a964e82 100644
+index f3e2d88..94aaee7 100644
 --- a/src/gsttools/qvideosurfacegstsink.cpp
 +++ b/src/gsttools/qvideosurfacegstsink.cpp
 @@ -43,7 +43,11 @@
@@ -1317,11 +1317,10 @@ index f3e2d88..a964e82 100644
                      "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
                      "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
                      "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
--                    "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
 +#if GST_CHECK_VERSION(1,0,0)
 +                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
 +#else
-+                    "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
+                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
 +#endif
                      NULL));
              continue;
@@ -1689,10 +1688,10 @@ index f944a60..72d1cf1 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index a4038c5..9d1fdfa 100644
+index 1ed663b..e0c6b50 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -760,7 +760,11 @@ qint64 CameraBinSession::duration() const
+@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
          if (fileSink) {
              GstFormat format = GST_FORMAT_TIME;
              gint64 duration = 0;
@@ -1704,7 +1703,7 @@ index a4038c5..9d1fdfa 100644
              gst_object_unref(GST_OBJECT(fileSink));
              if (ret)
                  return duration / 1000000;
-@@ -797,8 +801,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1718,7 +1717,7 @@ index a4038c5..9d1fdfa 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -859,7 +868,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1730,7 +1729,7 @@ index a4038c5..9d1fdfa 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -869,7 +882,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1742,7 +1741,7 @@ index a4038c5..9d1fdfa 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1142,7 +1159,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1754,7 +1753,7 @@ index a4038c5..9d1fdfa 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1262,7 +1283,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
@@ -2365,5 +2364,5 @@ index f2e760a..50bda3d 100644
  
  QT_END_NAMESPACE
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index e4ad221..f2e5339 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From ff3f521648906d07ddc1e1aecaddadb95b0314f3 Mon Sep 17 00:00:00 2001
+From 80d7d1844e6e088bde4c83881ea38a52a7e608c2 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -151,5 +151,5 @@ index df240e3..27ee687 100644
  installed_cmake.depends = cmake
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 5cc317c..c6cf4a6 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 20dd8d70eb3db17173eb3965e757711cc694de2a Mon Sep 17 00:00:00 2001
+From 21163294f5f1ae633db63c5d27b458ba189dcc16 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index bf5957b..2e3349b 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 1d8bf41acc2235528f1d08505cf2dc8afd793aef Mon Sep 17 00:00:00 2001
+From e3aba30a9cece54dd6a7edfcb39cbb1805b3dcac Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 5f96377..71acdfc 100644
+index 6e82b07..56df78c 100644
 --- a/src/assistant/assistant/assistant.pro
 +++ b/src/assistant/assistant/assistant.pro
 @@ -1,4 +1,4 @@
@@ -25,7 +25,7 @@ index 5f96377..71acdfc 100644
      QT += webkitwidgets
  } else {
      DEFINES += QT_NO_WEBKIT
-@@ -72,7 +72,7 @@ SOURCES += aboutdialog.cpp \
+@@ -71,7 +71,7 @@ SOURCES += aboutdialog.cpp \
      openpageswidget.cpp \
      openpagesmanager.cpp \
      openpagesswitcher.cpp
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index ae3d998..bcaf949 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 99c49a3304c1d08d164e0df252ca85f426381bb7 Mon Sep 17 00:00:00 2001
+From 9a9bc002354966b757bed13582f0bb927c3e7cc8 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 664fa3f..a55db12 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From cd1e17e8c6082fe8578d64baaff55f1f00c0f7a0 Mon Sep 17 00:00:00 2001
+From c4876f42d841db36197e5cb8a84c70df40a0f21e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index 34d9622..e6d9199 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From 50ab1eaf41445459422ef1fd4070ee158ea55d1c Mon Sep 17 00:00:00 2001
+From 71c988d599f624aa78772f9d68aa637d420e69c2 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
@@ -25,5 +25,5 @@ index 3fcecf1..2da8a36 100644
 -SUBDIRS += doc
 +SUBDIRS += doc examples
 -- 
-1.8.3.2
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index 9ea44b6..a575d86 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -10,7 +10,7 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveld
 
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-    file://0002-qtwebkit-fix-textrel-x86.patch \
+    file://0002-Remove-TEXTREL-tag-in-x86.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 9324da9..f1b9bdb 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,7 +1,7 @@
-From fe714df9641286e3f005e0021e1c6462fb0b061e Mon Sep 17 00:00:00 2001
+From 97d4af4ea8708829d6df276ae741c2076cb472e8 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
+Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
 
 Building qtwebkit causes a QA issue such that QtWebPluginProcess and
 QtWebProcess contain bad RPATHs which point into the build location. This fix
@@ -9,21 +9,22 @@ adds a patch to not include the rpath.prf which causes this problem.
 
 Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
 ---
- Tools/qmake/mkspecs/features/unix/default_post.prf | 2 --
- 1 file changed, 2 deletions(-)
+ Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index 9c52406..7ece013 100644
+index fd66af6..ef754c3 100644
 --- a/Tools/qmake/mkspecs/features/unix/default_post.prf
 +++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -59,8 +59,6 @@ linux-*g++* {
+@@ -61,7 +61,6 @@ linux-*g++* {
      }
  }
  
 -contains(TEMPLATE, app): CONFIG += rpath
--
+ 
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
-     !force_static_libs_as_shared:config_gnuld: QMAKE_LFLAGS += -Wl,--no-keep-memory
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
similarity index 73%
rename from recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch
rename to recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index e5f1538..64bfa3e 100644
--- a/recipes-qt/qt5/qtwebkit/0002-qtwebkit-fix-textrel-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,3 +1,8 @@
+From ecb13fa1c9fa45b7e307232b24331c040c88330b Mon Sep 17 00:00:00 2001
+From: Magnus Granberg <zorry@gentoo.org>
+Date: Fri, 27 Feb 2015 11:55:09 +0100
+Subject: [PATCH 2/2] Remove TEXTREL tag in x86
+
 Fix textrel QA warnings when building qtwebkit for x86:
 
   WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
@@ -14,27 +19,17 @@ part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
 Upstream status [webkit] : backport
 Upstream status [qtwebkit] : unclear
 
-
-From: Magnus Granberg <zorry@gentoo.org>
-Subject: Remove TEXTREL tag in x86
 Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Index: webkitgtk/Source/WTF/wtf/InlineASM.h
-===================================================================
---- webkitgtk.orig/Source/WTF/wtf/InlineASM.h
-+++ webkitgtk/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
-Index: webkitgtk/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-===================================================================
---- webkitgtk.orig/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ webkitgtk/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
+ Source/WTF/wtf/InlineASM.h                    |  2 ++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+index 9684df2..8af82d8 100644
+--- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
++++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
 @@ -524,6 +524,30 @@ double jsRound(double d)
      } \
      static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
@@ -66,3 +61,19 @@ Index: webkitgtk/Source/JavaScriptCore/jit/ThunkGenerators.cpp
  #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
  #define defineUnaryDoubleOpWrapper(function) \
      asm( \
+diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
+index 0a2fe78..2dc40ef 100644
+--- a/Source/WTF/wtf/InlineASM.h
++++ b/Source/WTF/wtf/InlineASM.h
+@@ -46,6 +46,8 @@
+ #define GLOBAL_REFERENCE(name) #name "@plt"
+ #elif CPU(X86) && COMPILER(MINGW)
+ #define GLOBAL_REFERENCE(name) "@" #name "@4"
++#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
++#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
+ #else
+ #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
+ #endif
+-- 
+2.3.1
+
-- 
2.3.1


