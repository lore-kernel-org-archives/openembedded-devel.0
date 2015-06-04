Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id F3F627580D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:09:00 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so43471675wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SQ6gp+gSgwVGoJYECUB+m3wCRd5LUEG6rja5Lw/IkwY=;
	b=HiIEcROMAYxk2bcz2sp0ny1bxoFm9yhaqEFvSTbPOqcfYHSMg5hPlJ+NxvV3xX1k0j
	6QsL9uznOdFkzX2mZUAVdwQGmHifg9oQ/VaqCorI1eXA8GoqY9ZN7M8B93Di9avG0qCD
	MAeLiDpaXbWAMExjn2aLP9S37dSdQ3CaajEaI/abiImcnySOPE8kcpinlKNykggRScyR
	Is4KMJTFhRraC7vJLEL8VCfhihtuHlTez3Id7cDz1EeeA4uUObQ3MREZngXmI57IaOU5
	sSM5LFcFTZZA6jFVD3Y5mmz3Dc/erTmkcY0+P4dualiNz/Be0F0lpjcrycfYeOMrhxEV
	VHeg==
X-Received: by 10.181.13.172 with SMTP id ez12mr6029976wid.91.1433412541693;
	Thu, 04 Jun 2015 03:09:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id js3sm5011170wjc.5.2015.06.04.03.09.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 03:09:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:11 +0200
Message-Id: <1433412551-20986-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][fido][PATCH 7/7] qt5: upgrade to latest revision in 5.4 branches
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
X-List-Received-Date: Thu, 04 Jun 2015 10:09:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                            | 2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb                           | 2 +-
 recipes-qt/qt5/qt5-git.inc                                        | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb                               | 2 +-
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch          | 4 ++--
 ...002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch | 4 ++--
 recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch   | 6 +++---
 .../0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch   | 4 ++--
 .../0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch | 4 ++--
 ...006-qeglplatformintegration-Undefine-CursorShape-from-X..patch | 4 ++--
 ...007-configure-bump-path-length-from-256-to-512-character.patch | 4 ++--
 ...008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch | 4 ++--
 .../qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch     | 4 ++--
 ...010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch | 4 ++--
 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch                 | 4 ++--
 ...011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch | 4 ++--
 .../0012-Add-external-hostbindir-option-for-native-sdk.patch      | 4 ++--
 recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch    | 4 ++--
 ...013-configure-preserve-built-qmake-and-swap-with-native-.patch | 4 ++--
 recipes-qt/qt5/qtbase_git.bb                                      | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb                              | 2 +-
 recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch   | 6 +++---
 recipes-qt/qt5/qtdeclarative_git.bb                               | 2 +-
 recipes-qt/qt5/qtenginio_git.bb                                   | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb                          | 2 +-
 ...001-qtimageformats.pro-Make-the-dependencies-determinist.patch | 4 ++--
 recipes-qt/qt5/qtimageformats_git.bb                              | 2 +-
 recipes-qt/qt5/qtlocation_git.bb                                  | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                                | 2 +-
 recipes-qt/qt5/qtquick1_git.bb                                    | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb                             | 2 +-
 recipes-qt/qt5/qtscript_git.bb                                    | 2 +-
 recipes-qt/qt5/qtsensors_git.bb                                   | 2 +-
 .../qtserialport/0001-Unix-Clear-serial_struct-instances.patch    | 4 ++--
 recipes-qt/qt5/qtserialport_git.bb                                | 2 +-
 recipes-qt/qt5/qtsvg_git.bb                                       | 2 +-
 recipes-qt/qt5/qttools-native_git.bb                              | 2 +-
 .../0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch      | 4 ++--
 .../0002-assistant-help-fix-linking-of-dependent-libraries.patch  | 4 ++--
 recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch    | 4 ++--
 recipes-qt/qt5/qttools_git.bb                                     | 2 +-
 recipes-qt/qt5/qttranslations_git.bb                              | 2 +-
 recipes-qt/qt5/qtwayland-native_git.bb                            | 2 +-
 ...001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch | 4 ++--
 ...001-examples-wayland-include-server-buffer-only-when-bui.patch | 8 ++++----
 recipes-qt/qt5/qtwayland_git.bb                                   | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                                | 2 +-
 ...001-chromium-base.gypi-include-atomicops_internals_x86_g.patch | 6 +++---
 ...001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch | 6 +++---
 ...002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch | 6 +++---
 .../0003-functions.prf-allow-build-for-linux-oe-g-platform.patch  | 6 +++---
 recipes-qt/qt5/qtwebengine_git.bb                                 | 2 +-
 ...001-qtwebkit-examples-enable-building-examples-by-defaul.patch | 4 ++--
 recipes-qt/qt5/qtwebkit-examples_git.bb                           | 2 +-
 .../qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch       | 4 ++--
 recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch      | 4 ++--
 recipes-qt/qt5/qtwebkit_git.bb                                    | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                                | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb                                 | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                               | 2 +-
 60 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 6506928..ce5e97f 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -280,4 +280,4 @@ do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "2cb17c1fb903434274e58692c9f0df619affdab0"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 7380a4e..73e5d22 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -42,4 +42,4 @@ do_install() {
     rm -rf ${D}${libdir}
 }
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 2e77d45..b0571bf 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,4 +10,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.4.1+git${SRCPV}"
+PV = "5.4.2+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 8163bd2..f84f38e 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -121,4 +121,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "2cb17c1fb903434274e58692c9f0df619affdab0"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index f34aed4..0f6bcbe 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 08f6be97c3f088fd8a2d752441c638093eedd990 Mon Sep 17 00:00:00 2001
+From ec414ca0df1ec459b5abd753cf0d730572715e17 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/12] Add linux-oe-g++ platform
@@ -347,5 +347,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index ec2bcb4..69e3fdb 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 31fa051d53e26301ef6abf72bd3f992d7c16cad2 Mon Sep 17 00:00:00 2001
+From f681cc3a7cb36e2bcc5e26e767236e86a5d49841 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
@@ -35,5 +35,5 @@ index d66007b..91ca643 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 779ea91..af22406 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From cf4e996876e0b467b7aae124c7cb285f677bf6b0 Mon Sep 17 00:00:00 2001
+From 47b88e13ed8f4bb3bd34ac24dcf4b908dcba6753 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/12] Add -external-hostbindir option
@@ -163,7 +163,7 @@ index 6d0de44..ddf7478 100644
  
  # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 7213a84..a977417 100644
+index 65fd1f9..457518b 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
@@ -229,5 +229,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index c586775..0cd6296 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From bf9f8df42f5a7ac4a0cb4bdad8c849228aa79b35 Mon Sep 17 00:00:00 2001
+From 3f0f3ded0b4a85a04a0c492e33d8517e598ae08e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
@@ -110,5 +110,5 @@ index 2437efe..2e1f014 100644
  }
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 9723bea..c373a7f 100644
--- a/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,4 +1,4 @@
-From f8a4e063b45b5b941738dd90ea7c74063bc1e49f Mon Sep 17 00:00:00 2001
+From 9c07ef1c5a56deda170a3946a7c285d534d59fda Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
 Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
@@ -93,5 +93,5 @@ index 7cc3300..ccbd974a 100644
  }
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 04fb370..6a056df 100644
--- a/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From 6061c8457ea1f76745bd9918e61bda01ef96ce56 Mon Sep 17 00:00:00 2001
+From 4699b5b9af628e120db9ab26e25bc7069d35562a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 2b5d5f5..a0aab03 100644
  
  class QEGLPlatformScreen;
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
index be75d72..4cdad00 100644
--- a/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From a6b01490248be28c1db3abd5f710c5d7d9afee55 Mon Sep 17 00:00:00 2001
+From 6ddd04ae7fc935b91384d99bf1c16532b91ac76b Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
 Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
@@ -25,5 +25,5 @@ index ad5f4cd..c19ff6a 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index e4d4327..7f4171d 100644
--- a/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,4 +1,4 @@
-From d1712999887b9809cce57b1e6c008c454330cd2e Mon Sep 17 00:00:00 2001
+From 5c0a8f073e7412d01e7f2ef05bbe06954fd39eaa Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
 Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
@@ -68,5 +68,5 @@ index 39a3ef9..2c05979 100644
  
      if (isRaster()) {
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
index bebb3d9..05110ea 100644
--- a/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From a34538ff13c520fa85df689255469a316f037d0d Mon Sep 17 00:00:00 2001
+From 3483a580cb9e5509cb59cd18b13a24c1a47a9224 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
@@ -153,5 +153,5 @@ index cd268cd..997bc35 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
index f2eed11..184b2d8 100644
--- a/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -1,4 +1,4 @@
-From 16a55457ce31d467cb331ab8e94b672757ef42b9 Mon Sep 17 00:00:00 2001
+From d5308f1a78e24402b16201846378917473d02873 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 18 Dec 2014 13:41:09 +0100
 Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
@@ -38,5 +38,5 @@ index 9a846d4..07869ef 100644
  if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
      message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index da17878..b9d4517 100644
--- a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 5a6ad20dd4fde6a0581be895d763aae43f1fc2b6 Mon Sep 17 00:00:00 2001
+From 14c4785ac0f01fa1d89d63601b9132add4ab1c2f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/13] Always build uic
@@ -27,5 +27,5 @@ index 83f7587..9dbcf70 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 96198b1..f5f2a23 100644
--- a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From 6c0cc990522454e0c9e52ba969c3a8c5937157b8 Mon Sep 17 00:00:00 2001
+From 51e7ea78d15a590f42154f19486f10d2019401e3 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
@@ -64,5 +64,5 @@ index 89d6ea5..0ff4a96 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
index 4c044c0..383b788 100644
--- a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 6425d71d52c5587f323fe28af62530d5c82b02fd Mon Sep 17 00:00:00 2001
+From d56aef32b8c9d1be04c047a16a55e84af71e25dd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
@@ -104,5 +104,5 @@ index 6e9d4aa..0ca4daf 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
index 0a7eb15..cb1005c 100644
--- a/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
+++ b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
@@ -1,4 +1,4 @@
-From 84c23fc01b28087de35604ef971227b57fb77876 Mon Sep 17 00:00:00 2001
+From 4dd60bf7b9db89fad8154168e71581ed648cf356 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Thu, 22 Jan 2015 16:09:35 +0100
 Subject: [PATCH 12/12] Set paths for target properly
@@ -68,5 +68,5 @@ index 7a34b11..7bb4476 100755
  };
  static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
index 0b271a3..ea90305 100644
--- a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 6b980c8132800001b2f0c5c0e76f7cc7c60d14ee Mon Sep 17 00:00:00 2001
+From d34774dc7447ff0d566b3281407c0998173a85e0 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
@@ -26,5 +26,5 @@ index c19ff6a..2d920e3 100755
  echo "Running configuration tests..."
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 44295a0..ec6ea17 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -269,4 +269,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
 }
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+SRCREV = "2cb17c1fb903434274e58692c9f0df619affdab0"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 8ed64fb..c758d04 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -21,4 +21,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "b4bf23453e65995bdd8827b6e146edd5cafeddc3"
+SRCREV = "aa00047183008edd739df472cf0490e9fffbe655"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 1603100..793aa84 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,7 +1,7 @@
-From 1abe7b1d4de10ba3739db8a685661e99fb274a00 Mon Sep 17 00:00:00 2001
+From 0aa4fc1dd4369c50c310e20bbe86cef5a1efb21f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
-Subject: [PATCH] qmltestexample: fix link
+Subject: [PATCH 1/2] qmltestexample: fix link
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5f628c2..9333016 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -27,4 +27,4 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "2b3c2339616680537145a9cc2e7567575add1abb"
+SRCREV = "2fdb6eba0a58b629db32f9eefec2f26df08d3d2e"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 2f13a2b..a0aff8f 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 QT_MODULE_BRANCH = "1.1"
-SRCREV = "30ee95cd19f9a435ce337b4f651175ed2e8ba2e5"
+SRCREV = "134dc76b7ff5152364f830b577e223b350560839"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index d7f0e87..9da5c94 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -16,4 +16,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "6eef4b5fa1836c9cb7ebc5dcb269a8d3114eb6c3"
+SRCREV = "c7ed28bece292e2745e02663ef519c76d16ec762"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 2439520..6085f01 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From f7cc9df393826c1697e45e87c929ad17ab225256 Mon Sep 17 00:00:00 2001
+From 85f45e1d9fc833c914cebb102840337193590356 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index bd2f893..31d4fb0 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -27,4 +27,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "98f83553e9fe2aa5fc54b32513af6ba3aa60a07b"
+SRCREV = "ec301681e4e2f5b293435ec7cf295350ee5acb18"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 7ff4c3d..12416bb 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "b13fec3c7ed08b7d0e79c08312a3c3285eb20ef3"
+SRCREV = "3678bc8b3e128bf244ae263a44576a40b72e5876"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 66bba54..bab9bee 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -34,4 +34,4 @@ SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "6fe3061c1f6b7438d20c7bfb92c7652cedc5b049"
+SRCREV = "cc0569a038f6116df559508518b6dacb15be8520"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index a90d2e3..928963b 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -16,4 +16,4 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
 # qttools
 
-SRCREV = "c78f720de6de9340492f8395109252919283a955"
+SRCREV = "ba0708a75784a92aee9523b7ee925ece18c69812"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 5afb31a..af11119 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -14,4 +14,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "de9145dcd904068256e28e130fdfda2e8014efe8"
+SRCREV = "093312f5f306db8fcb1028f62bd3061aa63ef732"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 489be2e..5751e20 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "822df36f252c5a16cdf82f5666f36e7011df46c4"
+SRCREV = "eb08742e8f874b8dab209c1cfe840c534c68ca3b"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 31131d8..ec33355 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -14,4 +14,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "26c99a8f7832a5549d315ad434e038ae3964e224"
+SRCREV = "40e5aff5318701b31e712cc352483b227f61a6a4"
diff --git a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
index d0f4eb9..e6b6194 100644
--- a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
+++ b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
@@ -1,4 +1,4 @@
-From cdaa89e30e12d247a8086763d341e5f020151b67 Mon Sep 17 00:00:00 2001
+From 6444a156db8b7d0ec367b8edc87c82acd0898698 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 9 Mar 2015 22:35:56 +1100
 Subject: [PATCH] Unix: Clear serial_struct instances
@@ -38,5 +38,5 @@ index cda73b2..62c454c 100644
          return decodeSystemError();
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index e95d564..c59eef6 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -18,4 +18,4 @@ SRC_URI += " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "b84fe7eb3d6d977a347bfbb82da724409b2eda69"
+SRCREV = "e257bdc9aae5583b187bafb5e69e4a6143e3bf4e"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 89f0815..1dce8c6 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "1fb79c9f2b50294b989cf2bdd8bfaaf0a458e2a8"
+SRCREV = "ccae23961e65b81b3c16a45d4e186e1e5657a2f6"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 219fc2e..13e1b79 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -23,4 +23,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index cb12fc1..285ae85 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 6d3adbdeee29af76b41a319016dfd396659ac0b0 Mon Sep 17 00:00:00 2001
+From b19c4a2f723525b995ef5b47db0e725a2bb9ab20 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
@@ -151,5 +151,5 @@ index df240e3..27ee687 100644
  installed_cmake.depends = cmake
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 72fc3a4..0f016c2 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 5bf38c5d5555ddcaea4a601fdfa304b3f0e5b943 Mon Sep 17 00:00:00 2001
+From 0805ac8c2c9f81643df211970666c15eac80cfb8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 7ceb84a..bbd338a 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From c9f7a83107d01b30cb150f7783441fe73003cfa1 Mon Sep 17 00:00:00 2001
+From 594d23ecc0f62e6a0ebfcb7b9cb879435211420a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 4ba2b8a..a4f63c7 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -24,4 +24,4 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRCREV = "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index b5fd345..9341453 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -93,4 +93,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "1224b6890e0b0971e5eeea9f52d806f1890de0ed"
+SRCREV = "f76e5c98b0c426ffed95443e45041c3c0deab0c6"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 3ae35b4..d03fb48 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -26,4 +26,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
+SRCREV = "182488129c3f6a67a7e781fdb7c0147777191991"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index a7be5e5..c1bf3bd 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From ecaf131c0307f198f8efbf06410976ded97aab80 Mon Sep 17 00:00:00 2001
+From be0881386edac8c39b5362d4efc4a05acb3e76c1 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.3.1
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index e1a41db..7588b2f 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,8 +1,8 @@
-From 90fc9f3f059c19e84ffd29718482a2f06ec3f0bf Mon Sep 17 00:00:00 2001
+From b7520d76235cea2e546e217052baf1c9324a261d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
-Subject: [PATCH] examples/wayland: include server-buffer only when building
- with opengles2
+Subject: [PATCH 1/2] examples/wayland: include server-buffer only when
+ building with opengles2
 
 * it's using glBindBuffer in
   server-buffer/client/serverbufferrenderer.cpp
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 7f1388d..065bc3c 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -45,4 +45,4 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
 
-SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
+SRCREV = "182488129c3f6a67a7e781fdb7c0147777191991"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index a800883..8433652 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "358e5acba3154a8ab4b53b22797c2c1eae4707dc"
+SRCREV = "7b5da1d3dd561bc871e7ab4bf8644d33f60d5793"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index b4a8852..64670f0 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
+From 59e305219cdaeac6d143cb0466a2f518b4050688 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
@@ -6,7 +6,7 @@ Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- chromium/base/base.gypi | 2 +-
+ src/3rdparty/chromium/base/base.gypi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
@@ -23,5 +23,5 @@ index a5a990a..af30cfa 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.3.1
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 134133b..447552e 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From b6ca6c086aa21985e17d11592a830f18159f1c3b Mon Sep 17 00:00:00 2001
+From 6e468c814087bac6ff88a1d7d02549e6cf8a152c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -25,5 +25,5 @@ index 4c2547d..64c08ad 100644
  }
  
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 8d1c5fd..e7f4f7f 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From cfe706846298d41defbf0386f85b17e70108b7af Mon Sep 17 00:00:00 2001
+From 7a4a82af04fb228526dfd72a1d42b53b402952d1 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -25,5 +25,5 @@ index 64c08ad..b46478b 100644
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 4e5e453..a932aef 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 9595a2dd48dbf45ba1661cf1fd4d38fac8192a4f Mon Sep 17 00:00:00 2001
+From 87f1a22e6a1a6b40712eb131ba128d4f1e2da9b8 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -25,5 +25,5 @@ index b46478b..6205bf4 100644
  
    skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index c14a556..4933c13 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -81,7 +81,7 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
-SRCREV_qtwebengine = "b0c48cb3a0c9630899a357fb8a01ba13ccad5395"
+SRCREV_qtwebengine = "55a7fc7651136510032166ff24eb5e7e49635145"
 SRCREV_chromium = "140893bef70011645c686f5fabe45018dd2e392a"
 SRCREV = "${SRCREV_qtwebengine}"
 
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index dd73fe6..3186e13 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From 52f75c43702ab04f3426025eea80155aa27b3422 Mon Sep 17 00:00:00 2001
+From f1367fc72dad78fb5625c6cd4b08914b34583d0f Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
@@ -25,5 +25,5 @@ index 3fcecf1..2da8a36 100644
 -SUBDIRS += doc
 +SUBDIRS += doc examples
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 7ae9fc7..0a5017f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -20,4 +20,4 @@ DEPENDS += "qtwebkit"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "734663277730bc20dacf0a6b07427002a53cc107"
+SRCREV = "9f20ed0b48f4e5adcc9558b2cc4171eb17f243dd"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 886a954..09876db 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From b3d43d2b8c1e11122ac36e3e0b102c2ffef83010 Mon Sep 17 00:00:00 2001
+From 5a9e19d69e4443ab6272aeca6d707e39fe1943ef Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
@@ -26,5 +26,5 @@ index fd66af6..ef754c3 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index de21a7c..e384282 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From 491cbd653eb7b992202f06bd2e62cf29f5f495af Mon Sep 17 00:00:00 2001
+From 22cad8ae3c1b8601ebf785ef5dfda4516056ee53 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH 2/2] Remove TEXTREL tag in x86
@@ -75,5 +75,5 @@ index 0a2fe78..2dc40ef 100644
  #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
  #endif
 -- 
-2.3.5
+2.4.2
 
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 085f35d..77568af 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -63,4 +63,4 @@ PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "738ad7e37c66f2afdbc7a77aff3ab7fa510361a2"
+SRCREV = "ea590d74eae21dd70b189e0b8ba4bfb6a9bddb94"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 9cd69b1..85e9156 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "5b469aa3c4d6b9c68feb9cf92d03614077518894"
+SRCREV = "0002e934391ace7b77665a227068c3e06d576772"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d286570..6f60f2b 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "bcc86311359e138ecc3a8fc1ce6eee1cda2ec0f5"
+SRCREV = "32b1ce9e1b1542f6779abcbcd78613b15149aaaa"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 8b58c5a..1be6853 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "db784fb1c01ca2a0e7ada2c407cd1aab3aa98fee"
+SRCREV = "c21924d67a8ef39282afdf3ae6fef798dfca7135"
-- 
2.4.2


