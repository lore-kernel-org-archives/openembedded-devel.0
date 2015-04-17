Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 168E373D59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 14:16:24 +0000 (UTC)
Received: by wgso17 with SMTP id o17so114949674wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XEeKapfOnZBVxb8Ae/vnXKDzofgxlFMgMHlVyjO/F1s=;
	b=i5C/z4yEREehrJCSQMwiRIq/APz217a2+oNQfU3O14U5VF0oooTAAb5g6e5AOQXwAM
	eFPPwv5ALgnAM0aGmFo0oHDVJbw3m0JL91pgoXzr9uTILGTMb7gJBPNrCEFU2ToYZLOw
	AIsVqI3AojTshkEw0DYT2sBWVEn+oS2Df74/ViliilN+/slbMEFfFYdFQsPHlVliqmkF
	9dDM6B3ZLfTjC3aUUkFyEj87+kUXX4zv1HhW87HsejrSqk54b6A0vfrPlQARYQ2QdwoA
	NNnou/C005rJ3GKO1ANnqGHIvWmTVqkN817MjNpEK1xIqyDdlECM0sOOtmRAyy5A/Nnh
	c4jw==
X-Received: by 10.194.61.244 with SMTP id t20mr6176067wjr.83.1429280185382;
	Fri, 17 Apr 2015 07:16:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xy2sm14853025wjc.14.2015.04.17.07.16.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Apr 2015 07:16:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:16:43 +0200
Message-Id: <1429280204-27191-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429280204-27191-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429280204-27191-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 2/3] git-recipes: upgrade to latest revision in 5.4 branch
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
X-List-Received-Date: Fri, 17 Apr 2015 14:16:27 -0000

* this gets us close to 5.4.2 for people who want to test it in advance
* I plan to apply this to fido branch (as well as final upgrade to 5.4.2
  recipes
* I'm preparing similar patch for 5.5 revisions, which will be applied
  only in master branch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb            |  2 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  |  4 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  4 +-
 .../0003-Add-external-hostbindir-option.patch      |  8 +--
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  6 +-
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  4 +-
 ...mintegration-Undefine-CursorShape-from-X..patch |  4 +-
 ...ump-path-length-from-256-to-512-character.patch |  4 +-
 ...gl-error-for-platforms-only-supporting-on.patch |  4 +-
 .../0009-QOpenGLPaintDevice-sub-area-support.patch |  4 +-
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch |  4 +-
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |  4 +-
 ...-build-it-in-configure-but-allow-to-build.patch |  4 +-
 ...external-hostbindir-option-for-native-sdk.patch |  4 +-
 .../0012-Set-paths-for-target-properly.patch       |  4 +-
 ...reserve-built-qmake-and-swap-with-native-.patch |  4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  4 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 22 +++---
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch | 53 ---------------
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 .../0001-Unix-Clear-serial_struct-instances.patch  | 10 +--
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  4 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  4 +-
 .../0003-add-noqtwebkit-configuration.patch        |  4 +-
 recipes-qt/qt5/qttools-native_git.bb               |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 ...yland-include-server-buffer-only-when-bui.patch |  4 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  4 +-
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  4 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  4 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 +-
 ...amples-enable-building-examples-by-defaul.patch |  4 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 10 +--
 .../0002-Remove-TEXTREL-tag-in-x86.patch           | 79 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 54 files changed, 178 insertions(+), 152 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
 create mode 100644 recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 9832eee..b120733 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -38,7 +38,7 @@ SRC_URI += " \
     file://OEQt5Toolchain.cmake \
 "
 
-SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
+SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index b659f90..7ce1747 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepends ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index a1ce9f2..f34aed4 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From e04fdddaeb59006c2d599b8b261ce714341029ba Mon Sep 17 00:00:00 2001
+From 08f6be97c3f088fd8a2d752441c638093eedd990 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/12] Add linux-oe-g++ platform
@@ -347,5 +347,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 306af7f..ec2bcb4 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 182e7a96a99e9bcabcbd8858c377035a47e4e3e8 Mon Sep 17 00:00:00 2001
+From 31fa051d53e26301ef6abf72bd3f992d7c16cad2 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
@@ -35,5 +35,5 @@ index d66007b..91ca643 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 4451751..779ea91 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 457efc32bb79060a0a58a82ff8a35d67655ef6d6 Mon Sep 17 00:00:00 2001
+From cf4e996876e0b467b7aae124c7cb285f677bf6b0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/12] Add -external-hostbindir option
@@ -95,10 +95,10 @@ index 0a00d6d..ad5f4cd 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 7961f65..e11b23d 100644
+index 79b4eab..8c6913e 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -192,7 +192,11 @@ defineTest(qtAddRpathLink) {
+@@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -229,5 +229,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 20ddff9..c586775 100644
--- a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From 8c5554c1ee9a18548c166f6c3a7b487b9d3cdc3e Mon Sep 17 00:00:00 2001
+From bf9f8df42f5a7ac4a0cb4bdad8c849228aa79b35 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
@@ -80,7 +80,7 @@ index eb65e73..4db40d0 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index d213f9e..915c596 100644
+index 2437efe..2e1f014 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -192,10 +192,25 @@ unix|mingw {
@@ -110,5 +110,5 @@ index d213f9e..915c596 100644
  }
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 02dc13a..9723bea 100644
--- a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,4 +1,4 @@
-From 825043f0a657cd4b8c3af0e00c79684388460d5c Mon Sep 17 00:00:00 2001
+From f8a4e063b45b5b941738dd90ea7c74063bc1e49f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
 Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
@@ -93,5 +93,5 @@ index 7cc3300..ccbd974a 100644
  }
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 251cdc6..04fb370 100644
--- a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From b4d4c91bb504c9e90b69a2d78453bf3523ec6822 Mon Sep 17 00:00:00 2001
+From 6061c8457ea1f76745bd9918e61bda01ef96ce56 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 2b5d5f5..a0aab03 100644
  
  class QEGLPlatformScreen;
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
index 23bfa77..be75d72 100644
--- a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From e4235e3a0ebe4494ad1f4f550ddb070100e530e1 Mon Sep 17 00:00:00 2001
+From a6b01490248be28c1db3abd5f710c5d7d9afee55 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
 Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
@@ -25,5 +25,5 @@ index ad5f4cd..c19ff6a 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index e7e5084..e4d4327 100644
--- a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,4 +1,4 @@
-From 715b5d739b36588cd2e34962b33a59da1f5427fe Mon Sep 17 00:00:00 2001
+From d1712999887b9809cce57b1e6c008c454330cd2e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
 Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
@@ -68,5 +68,5 @@ index 39a3ef9..2c05979 100644
  
      if (isRaster()) {
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
index 2f5835c..bebb3d9 100644
--- a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From ab8aa4e79e156ac6df8cd36e287faf838bc32344 Mon Sep 17 00:00:00 2001
+From a34538ff13c520fa85df689255469a316f037d0d Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
@@ -153,5 +153,5 @@ index cd268cd..997bc35 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
index 1f92eed..f2eed11 100644
--- a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -1,4 +1,4 @@
-From 276b5046788007bcbc5607046becdd44151960c0 Mon Sep 17 00:00:00 2001
+From 16a55457ce31d467cb331ab8e94b672757ef42b9 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 18 Dec 2014 13:41:09 +0100
 Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
@@ -38,5 +38,5 @@ index 9a846d4..07869ef 100644
  if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
      message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index 3ff193a..da17878 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From c87f9a5ec9a08c415ede4d5118deeb4177778338 Mon Sep 17 00:00:00 2001
+From 5a6ad20dd4fde6a0581be895d763aae43f1fc2b6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/13] Always build uic
@@ -27,5 +27,5 @@ index 83f7587..9dbcf70 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 83457f0..96198b1 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From f298d49fd1b88ae9bf8f35339a52cd333f42434b Mon Sep 17 00:00:00 2001
+From 6c0cc990522454e0c9e52ba969c3a8c5937157b8 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
@@ -64,5 +64,5 @@ index 89d6ea5..0ff4a96 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
index 82505a7..4c044c0 100644
--- a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From e598364920b2ff4a90aaaaeb0c58162d1cb64221 Mon Sep 17 00:00:00 2001
+From 6425d71d52c5587f323fe28af62530d5c82b02fd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
@@ -104,5 +104,5 @@ index 6e9d4aa..0ca4daf 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
index 204819c..0a7eb15 100644
--- a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
@@ -1,4 +1,4 @@
-From dbfa83051ddb8db0b4a59b226d4e4a41101ae26e Mon Sep 17 00:00:00 2001
+From 84c23fc01b28087de35604ef971227b57fb77876 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 22 Jan 2015 16:09:35 +0100
 Subject: [PATCH 12/12] Set paths for target properly
@@ -68,5 +68,5 @@ index 7a34b11..7bb4476 100755
  };
  static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
index 4b48b5b..0b271a3 100644
--- a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 4ccd1823b88c039415b68a1dc2040859178cb56f Mon Sep 17 00:00:00 2001
+From 6b980c8132800001b2f0c5c0e76f7cc7c60d14ee Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
@@ -26,5 +26,5 @@ index c19ff6a..2d920e3 100755
  echo "Running configuration tests..."
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index e558ee6..8ba9170 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -31,7 +31,7 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
+SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 1be31ea..ed6878c 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -25,7 +25,7 @@ SRC_URI += "\
     file://0012-Set-paths-for-target-properly.patch \
 "
 
-SRCREV = "a782369071db1d89448c0b94248d31fa877bcf8c"
+SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index d3586e2..0e62a23 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "dbf0bd93096f8ef54ebcf550ff104237742778dd"
+SRCREV = "b4bf23453e65995bdd8827b6e146edd5cafeddc3"
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
index 8766c34..1603100 100644
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From f1285bfd6f12cc4dc7727408a38edea13d3d0f46 Mon Sep 17 00:00:00 2001
+From 1abe7b1d4de10ba3739db8a685661e99fb274a00 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index af825c7..caa851a 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "d43a963e49956ba772644e9f3448dc3672147f77"
+SRCREV = "2b3c2339616680537145a9cc2e7567575add1abb"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5b3f440..9e2c703 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -2,4 +2,4 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "1.1"
-SRCREV = "5581890d3c5919c3bd4b6aafdba650c14a97c312"
+SRCREV = "30ee95cd19f9a435ce337b4f651175ed2e8ba2e5"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 1e45f2a..2439520 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 706c5aec2b49c685abe5e1ad4d09674d55add789 Mon Sep 17 00:00:00 2001
+From f7cc9df393826c1697e45e87c929ad17ab225256 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index db65e6b..149148e 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2cf398f541d68f60e0205820524b79b37045bf0f"
+SRCREV = "98f83553e9fe2aa5fc54b32513af6ba3aa60a07b"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index b0258a8..75b4f72 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e746e794dc27933467f6aed0c813e0cc9d0dae77"
+SRCREV = "b13fec3c7ed08b7d0e79c08312a3c3285eb20ef3"
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 4020471..e2a46df 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From a42d29588f9c65d8c480fd9fbcbbd0606f01170f Mon Sep 17 00:00:00 2001
+From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
@@ -13,6 +13,7 @@ Sergio Schvezov <sergio.schvezov@canonical.com>
 Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
 Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
 (cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 Conflicts:
 	src/gsttools/qgstreamervideorenderer.cpp
@@ -38,7 +39,7 @@ Conflicts:
  src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
  src/gsttools/qgstutils.cpp                         |  27 ++-
  src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 138 +++++++++++++-
+ src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
  src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
  .../qgstreameraudioprobecontrol_p.h                |   5 +-
  .../qgstreamervideoprobecontrol_p.h                |   4 +
@@ -58,7 +59,7 @@ Conflicts:
  .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
  .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
  .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 872 insertions(+), 130 deletions(-)
+ 36 files changed, 871 insertions(+), 129 deletions(-)
 
 diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
 index 02a7e34..6b9843a 100644
@@ -772,7 +773,7 @@ index 2b66f76..804dce9 100644
  #include <gst/gst.h>
  
 diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
-index 4960187..230fbf4 100644
+index b26369a..23674bb 100644
 --- a/src/gsttools/qgstreamervideowidget.cpp
 +++ b/src/gsttools/qgstreamervideowidget.cpp
 @@ -40,8 +40,13 @@
@@ -789,7 +790,7 @@ index 4960187..230fbf4 100644
  
  QT_BEGIN_NAMESPACE
  
-@@ -164,9 +169,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
+@@ -161,9 +166,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
  {
      GstMessage* gm = message.rawMessage();
  
@@ -804,7 +805,7 @@ index 4960187..230fbf4 100644
          setOverlay();
          QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
          return true;
-@@ -194,18 +203,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
+@@ -191,18 +200,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
  
  void QGstreamerVideoWidgetControl::setOverlay()
  {
@@ -835,7 +836,7 @@ index 4960187..230fbf4 100644
  
          if (caps) {
              m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
-@@ -220,8 +240,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
+@@ -217,8 +237,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
  
  void QGstreamerVideoWidgetControl::windowExposed()
  {
@@ -1134,7 +1135,7 @@ index 18702ec..93f22f5 100644
  }
  
 diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
-index f3e2d88..a964e82 100644
+index f3e2d88..94aaee7 100644
 --- a/src/gsttools/qvideosurfacegstsink.cpp
 +++ b/src/gsttools/qvideosurfacegstsink.cpp
 @@ -43,7 +43,11 @@
@@ -1317,11 +1318,10 @@ index f3e2d88..a964e82 100644
                      "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
                      "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
                      "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
--                    "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
 +#if GST_CHECK_VERSION(1,0,0)
 +                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
 +#else
-+                    "format"   , G_TYPE_STRING, qt_yuvColorLookup[index].fourcc,
+                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
 +#endif
                      NULL));
              continue;
@@ -2365,5 +2365,5 @@ index f2e760a..50bda3d 100644
  
  QT_END_NAMESPACE
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
deleted file mode 100644
index 1654e00..0000000
--- a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b5c058f62a79efa213e4492ac7209b3a92f45e3b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 5 Jul 2014 09:10:02 +0200
-Subject: [PATCH 2/2] qtmultimedia.pro: Respect
- OE_GSTREAMER_ENABLED,OE_GSTREAMER010_ENABLED and OE_OPENAL_ENABLED
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qtmultimedia.pro | 21 ++++++++++++---------
- 1 file changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 109dd81..54b67a8 100644
---- a/qtmultimedia.pro
-+++ b/qtmultimedia.pro
-@@ -1,7 +1,7 @@
- requires(qtHaveModule(gui))
- 
- load(configure)
--qtCompileTest(openal)
-+OE_OPENAL_ENABLED:qtCompileTest(openal)
- win32 {
-     qtCompileTest(directshow) {
-         qtCompileTest(wshellitem)
-@@ -18,14 +18,17 @@ win32 {
-     qtCompileTest(alsa)
-     qtCompileTest(pulseaudio)
-     !done_config_gstreamer {
--        gstver=1.0
--        cache(GST_VERSION, set, gstver);
--        qtCompileTest(gstreamer) {
--            qtCompileTest(gstreamer_photography)
--            qtCompileTest(gstreamer_encodingprofiles)
--            qtCompileTest(gstreamer_appsrc)
--            qtCompileTest(linux_v4l)
--        } else {
-+        OE_GSTREAMER_ENABLED {
-+            gstver=1.0
-+            cache(GST_VERSION, set, gstver);
-+            qtCompileTest(gstreamer) {
-+                qtCompileTest(gstreamer_photography)
-+                qtCompileTest(gstreamer_encodingprofiles)
-+                qtCompileTest(gstreamer_appsrc)
-+                qtCompileTest(linux_v4l)
-+            }
-+        }
-+        !OE_GSTREAMER_ENABLED:OE_GSTREAMER010_ENABLED {
-             gstver=0.10
-             cache(GST_VERSION, set, gstver);
-             # Force a re-run of the test
--- 
-2.1.3
-
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index fa8d67c..1795169 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "0e161675e6014faeeaa490a9c73a62c1577c674e"
+SRCREV = "6fe3061c1f6b7438d20c7bfb92c7652cedc5b049"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 6991e0e..7cc23d5 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "41119e843f099ce7d80f966cc754324bfe0f063f"
+SRCREV = "c78f720de6de9340492f8395109252919283a955"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 1b33c0e..ddc4ccf 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e10dcd4c98631d1d433073b43101b8c36be05520"
+SRCREV = "de9145dcd904068256e28e130fdfda2e8014efe8"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index a1d4172..4b99e38 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e12a92d71f2910c961a6ea7d6b28f7c9f55b4e96"
+SRCREV = "822df36f252c5a16cdf82f5666f36e7011df46c4"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 14a9949..982b2f7 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a6a01b612fdb162378c4c184351e7cb8e5a559a0"
+SRCREV = "26c99a8f7832a5549d315ad434e038ae3964e224"
diff --git a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
index b14cf01..d0f4eb9 100644
--- a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
+++ b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
@@ -1,4 +1,4 @@
-From 53afe73154c7c00b54cd280fa3d6c9127a2bc84b Mon Sep 17 00:00:00 2001
+From cdaa89e30e12d247a8086763d341e5f020151b67 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 9 Mar 2015 22:35:56 +1100
 Subject: [PATCH] Unix: Clear serial_struct instances
@@ -16,10 +16,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
-index 34ef41d..7cf356b 100644
+index cda73b2..62c454c 100644
 --- a/src/serialport/qserialport_unix.cpp
 +++ b/src/serialport/qserialport_unix.cpp
-@@ -439,6 +439,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
+@@ -451,6 +451,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
  {
      struct serial_struct currentSerialInfo;
  
@@ -28,7 +28,7 @@ index 34ef41d..7cf356b 100644
      if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
              && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
          currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
-@@ -469,6 +471,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
+@@ -481,6 +483,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
  
      struct serial_struct currentSerialInfo;
  
@@ -38,5 +38,5 @@ index 34ef41d..7cf356b 100644
          return decodeSystemError();
  
 -- 
-2.3.2
+2.3.5
 
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 7eb98b4..ea253d6 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -6,4 +6,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4
 
-SRCREV = "44f70d99a2ecd5f3f320650461f1d69142d11bcc"
+SRCREV = "37b614abbfb35d06a57e5b0824249c3abd5640e3"
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index ec58a11..cb12fc1 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 4d4794880eecd27b006b4d00f44c611162d24538 Mon Sep 17 00:00:00 2001
+From 6d3adbdeee29af76b41a319016dfd396659ac0b0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -151,5 +151,5 @@ index df240e3..27ee687 100644
  installed_cmake.depends = cmake
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index f473041..72fc3a4 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From d6fd9b34cd507b054e20c61aaf8bee4bf800abb1 Mon Sep 17 00:00:00 2001
+From 5bf38c5d5555ddcaea4a601fdfa304b3f0e5b943 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index 6eb4d84..7ceb84a 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 9868ff8a11f36712f9bc2fe45ad129214994947a Mon Sep 17 00:00:00 2001
+From c9f7a83107d01b30cb150f7783441fe73003cfa1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 159f1ba..bbaafc5 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 159f1ba..bbaafc5 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "638c278b76c56a51f83ef8c5cc9c03f18a887f74"
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
                     file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index fba976d..a16b6ff 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "35a64da9fd6fa38e92373798ed17f6cab73586ef"
+SRCREV = "1224b6890e0b0971e5eeea9f52d806f1890de0ed"
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 21cc637..e1a41db 100644
--- a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 256ceb71a2f56060a2716075b8258ad68d992b73 Mon Sep 17 00:00:00 2001
+From 90fc9f3f059c19e84ffd29718482a2f06ec3f0bf Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 200f586..3be3e51 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1e32e71403a6a9cb117343464fbc34564598e831"
+SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index f03bcb5..93ef54a 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1e32e71403a6a9cb117343464fbc34564598e831"
+SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index f9267dc..134133b 100644
--- a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From 09f65b11a89e90ac115fad2403d22c723b287f31 Mon Sep 17 00:00:00 2001
+From b6ca6c086aa21985e17d11592a830f18159f1c3b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -25,5 +25,5 @@ index 4c2547d..64c08ad 100644
  }
  
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index cbd67cf..8d1c5fd 100644
--- a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 22c68425fb780c435267a867677ec0f54d7dbcd2 Mon Sep 17 00:00:00 2001
+From cfe706846298d41defbf0386f85b17e70108b7af Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
@@ -25,5 +25,5 @@ index 64c08ad..b46478b 100644
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 57bac32..4e5e453 100644
--- a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From c2b2432649b15b4d7fcec24dd68501c4613e010a Mon Sep 17 00:00:00 2001
+From 9595a2dd48dbf45ba1661cf1fd4d38fac8192a4f Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
@@ -25,5 +25,5 @@ index b46478b..6205bf4 100644
  
    skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 45b1d8c..81c5333 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -11,8 +11,8 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
-SRCREV_qtwebengine = "8b2cb3b6b4546d333ff7d265d3875d2ed46c2c0a"
-SRCREV_chromium = "f9c03801de86b5e9da2b915a9e490c2f2254fecf"
+SRCREV_qtwebengine = "b0c48cb3a0c9630899a357fb8a01ba13ccad5395"
+SRCREV_chromium = "140893bef70011645c686f5fabe45018dd2e392a"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index e6d9199..dd73fe6 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From 71c988d599f624aa78772f9d68aa637d420e69c2 Mon Sep 17 00:00:00 2001
+From 52f75c43702ab04f3426025eea80155aa27b3422 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
@@ -25,5 +25,5 @@ index 3fcecf1..2da8a36 100644
 -SUBDIRS += doc
 +SUBDIRS += doc examples
 -- 
-2.3.1
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 0414cbb..7225ae5 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "69a9c9193abe008a9a52640b19a409e4a86c4899"
+SRCREV = "734663277730bc20dacf0a6b07427002a53cc107"
diff --git a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 3c6c4d3..886a954 100644
--- a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,7 +1,7 @@
-From 83a7ef8c92b4363bd0aa372c804858c5882db0af Mon Sep 17 00:00:00 2001
+From b3d43d2b8c1e11122ac36e3e0b102c2ffef83010 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
+Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
 
 Building qtwebkit causes a QA issue such that QtWebPluginProcess and
 QtWebProcess contain bad RPATHs which point into the build location. This fix
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index 9c52406..a68a101 100644
+index fd66af6..ef754c3 100644
 --- a/Tools/qmake/mkspecs/features/unix/default_post.prf
 +++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -59,7 +59,6 @@ linux-*g++* {
+@@ -61,7 +61,6 @@ linux-*g++* {
      }
  }
  
@@ -26,5 +26,5 @@ index 9c52406..a68a101 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.1.3
+2.3.5
 
diff --git a/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
new file mode 100644
index 0000000..de21a7c
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -0,0 +1,79 @@
+From 491cbd653eb7b992202f06bd2e62cf29f5f495af Mon Sep 17 00:00:00 2001
+From: Magnus Granberg <zorry@gentoo.org>
+Date: Fri, 27 Feb 2015 11:55:09 +0100
+Subject: [PATCH 2/2] Remove TEXTREL tag in x86
+
+Fix textrel QA warnings when building qtwebkit for x86:
+
+  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
+
+Patch from upstream webkit:
+
+  https://bugs.webkit.org/show_bug.cgi?id=70610
+
+Minor refresh required to apply cleanly to the older webkit sources used
+by qtwebkit. Specifically, the patch needed to be modified to account
+for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
+part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
+
+Upstream status [webkit] : backport
+Upstream status [qtwebkit] : unclear
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
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
+@@ -524,6 +524,30 @@ double jsRound(double d)
+     } \
+     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
+ 
++#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
++#define defineUnaryDoubleOpWrapper(function) \
++    asm( \
++        ".text\n" \
++        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
++        HIDE_SYMBOL(function##Thunk) "\n" \
++        SYMBOL_STRING(function##Thunk) ":" "\n" \
++        "pushl %ebx\n" \
++        "subl $20, %esp\n" \
++        "movsd %xmm0, (%esp) \n" \
++        "call __x86.get_pc_thunk.bx\n" \
++        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
++        "call " GLOBAL_REFERENCE(function) "\n" \
++        "fstpl (%esp) \n" \
++        "movsd (%esp), %xmm0 \n" \
++        "addl $20, %esp\n" \
++        "popl %ebx\n" \
++        "ret\n" \
++    );\
++    extern "C" { \
++        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
++    } \
++    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
++
+ #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
+ #define defineUnaryDoubleOpWrapper(function) \
+     asm( \
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index c7f25c0..3d39178 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "67aba37ab361fc117366e283365920013b8d8464"
+SRCREV = "738ad7e37c66f2afdbc7a77aff3ab7fa510361a2"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 2913d88..4c96e25 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "fc2b42c874fb41487b86700a04e932e2afaded94"
+SRCREV = "5b469aa3c4d6b9c68feb9cf92d03614077518894"
-- 
2.3.5


