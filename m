Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3457A770D8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2016 11:57:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w143so9850721wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2016 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ICoaWt91g+GzhZVtiNnDEV5fMLmg38+s2HGC+SjZExU=;
	b=kKwpVsNjpLWIj5SeurCo78J71+BQ9gW9fysWZ5oFDjEKf2hxivBB5slNTbTERNP1vu
	CmumvUdbt5SVvs6OOwu/QLcuNbtA22BBZlLOQ3eM9FD7M38quOdeYg2G60P91aZxcBq2
	r0upjt+CrukwtGkcJhG9uSEiX4SlLRmYN6o06j0XnUnReCXyPtcdKNcEg662kOB54O5I
	V6Bx0cniKkUkg+u1YDJioTp/DVTd7M2b0fQQbPyA2fTFyqTUhqGU5Fo43ElaD8UVbwgF
	5GYHQdc7OAGDaWMHEMv1KM91Eaj6LgnkZBVx2OgcqLYy/ETY/Ty22uVgKtPj01G9+/sq
	TmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ICoaWt91g+GzhZVtiNnDEV5fMLmg38+s2HGC+SjZExU=;
	b=lkMVg3n1nRjSPrLgfz0+GA5hPKP2QN7tmmdXhOL9ok9OV5cd/ZIy6CiQe0lYDwMVPn
	6ylP3pFNT17le9qvimWO+ZQFR8gwXq0hUoCUW/qi2jFaBYlFRM5Eg6uEMadJYyZe81bz
	qXQGlD+7Wu1NAiHMYx2BVSM6PFbcGpIgeggUANkyMXGOlQm5XGCNhGSkVvH4KMxpCX/m
	j7sBzh5FITQr/9Vw5F744KNliGfFMUgtH/izUNdeHolNtJ47v30i//FN2jpOu77vhm5O
	SCKKTtH7MaJs41R29uVeGPdrVP9NdlmhZ0n0hhBmSrbBQT3ms3O3iEGWzzVJKbfoO3Ra
	lZag==
X-Gm-Message-State: AOPr4FXpW8gCuoo92Vqlu5QXZeUOQKLBNyEBkSSd5tZOCAIoDben9Cbumk9Dle+a9VEuqA==
X-Received: by 10.28.183.134 with SMTP id h128mr9669108wmf.63.1462017443462;
	Sat, 30 Apr 2016 04:57:23 -0700 (PDT)
Received: from localhost.localdomain (p54AA5862.dip0.t-ipconnect.de.
	[84.170.88.98]) by smtp.googlemail.com with ESMTPSA id
	i4sm19235890wjj.49.2016.04.30.04.57.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Apr 2016 04:57:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Apr 2016 13:57:09 +0200
Message-Id: <1462017429-26604-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] replace base_contains by bb.utils.contains
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
X-List-Received-Date: Sat, 30 Apr 2016 11:57:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 34 +++++++++++-----------
 recipes-qt/qt5/qt5.inc                             |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       | 10 +++----
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  8 ++---
 recipes-qt/qt5/qtlocation_git.bb                   |  4 +--
 recipes-qt/qt5/qttools_git.bb                      |  4 +--
 recipes-qt/qt5/qtwebengine_git.bb                  |  2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 9 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index cc4d4b5..f64db8f 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -12,11 +12,11 @@ USE_RUBY = " \
     qtquick1-dev \
     qtquick1-mkspecs \
     qtquick1-plugins \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins', '', d)} \
     qttranslations-qtquick1 \
     qtwebkit-dev \
     qtwebkit-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebkit-qmlplugins', '', d)} \
 "
 
 # Requires Wayland to work
@@ -36,9 +36,9 @@ USE_X11 = " \
 RDEPENDS_${PN} += " \
     packagegroup-core-standalone-sdk-target \
     libsqlite3-dev \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-dev', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-mkspecs', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qt3d-qmlplugins', '', d)} \
     qtbase-dev \
     qtbase-fonts \
     qtbase-mkspecs \
@@ -50,30 +50,30 @@ RDEPENDS_${PN} += " \
     qttranslations-qthelp \
     qtconnectivity-dev \
     qtconnectivity-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qmlplugins', '', d)} \
     qttranslations-qtconnectivity \
     qtdeclarative-dev \
     qtdeclarative-mkspecs \
     qtdeclarative-plugins \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qmlplugins', '', d)} \
     qtdeclarative-staticdev \
     qttranslations-qmlviewer \
     qttranslations-qtdeclarative \
     qtenginio-dev \
     qtenginio-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplugins', '', d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtgraphicaleffects-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtenginio-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtgraphicaleffects-qmlplugins', '', d)} \
     qtimageformats-dev \
     qtimageformats-plugins \
     qtlocation-dev \
     qtlocation-mkspecs \
     qtlocation-plugins \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplugins', '', d)} \
     qttranslations-qtlocation \
     qtmultimedia-dev \
     qtmultimedia-mkspecs \
     qtmultimedia-plugins \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtmultimedia-qmlplugins', '', d)} \
     qttranslations-qtmultimedia \
     qtscript-dev \
     qtscript-mkspecs \
@@ -81,7 +81,7 @@ RDEPENDS_${PN} += " \
     qtsensors-dev \
     qtsensors-mkspecs \
     qtsensors-plugins \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins', '', d)} \
     qtserialport-dev \
     qtserialport-mkspecs \
     qtsvg-dev \
@@ -89,21 +89,21 @@ RDEPENDS_${PN} += " \
     qtsvg-plugins \
     qtsystems-dev \
     qtsystems-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsystems-qmlplugins', '', d)} \
     qttools-dev \
     qttools-mkspecs \
     qttools-staticdev \
     qttools-tools \
-    ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${USE_RUBY} \
-    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebsockets-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebsockets-qmlplugins', '', d)} \
     qttranslations-qtwebsockets \
     qtwebchannel-dev \
     qtwebchannel-mkspecs \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', 'qtwebchannel-qmlplugins', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtwebchannel-qmlplugins', '', d)} \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
     qttranslations-qtxmlpatterns \
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 85d7d89..f9cb2b4 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -6,7 +6,7 @@ inherit qmake5
 PACKAGECONFIG_OPENSSL ?= "openssl"
 
 PACKAGECONFIG[examples] = ""
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'examples', 'QT_BUILD_PARTS+=examples', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'examples', 'QT_BUILD_PARTS+=examples', '', d)}"
 
 # we don't want conflicts with qt4
 OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 09f8ebd..b85c563 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -34,12 +34,12 @@ RDEPENDS_${PN}-tools += "perl"
 # PACKAGECONFIG is kept rather minimal for people who don't need
 # stuff like webkit (and it's easier to add options than remove)
 
-PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
-PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor glib gtkstyle xkb', '', d)}"
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
+PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor glib gtkstyle xkb', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
-PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG_MULTIMEDIA ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG_DISTRO ?= ""
 # Either release or debug, can be overridden in bbappends
 PACKAGECONFIG_RELEASE ?= "release"
@@ -254,7 +254,7 @@ FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_QT_FONTS}/*.qpf*"
 FILES_${PN}-fonts                = "${OE_QMAKE_PATH_QT_FONTS}/README \
                                     ${OE_QMAKE_PATH_QT_FONTS}/fontdir"
 
-RRECOMMENDS_${PN}-plugins += "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
+RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
 sysroot_stage_dirs_append() {
     # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index bf3a108..72b3d7b 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -32,7 +32,7 @@ do_configure_prepend() {
     echo "QT_TOOL.syncqt.binary = \"${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt\"" > ${B}/.qmake.cache
 }
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
 SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
 
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 4c4431d..573b330 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -23,9 +23,9 @@ PACKAGECONFIG[libmng] = ",,libmng"
 PACKAGECONFIG[libtiff] = ",,tiff"
 PACKAGECONFIG[libwebp] = ",,libwebp"
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_LIBMNG_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_LIBMNG_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
 SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index d573b6b..8a41551 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -26,7 +26,7 @@ do_configure_prepend() {
     sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qtlocation.pro
 }
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
 SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 3a27bbd..e0b23b4 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -28,8 +28,8 @@ PACKAGECONFIG_class-nativesdk ??= "linguistonly"
 PACKAGECONFIG[linguistonly] = ""
 PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
 SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 98b4bab..427cd95 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -22,7 +22,7 @@ DEPENDS += " \
 # qtwebengine will have additional dependencies:
 # contains(QT_CONFIG, xcb): REQUIRED_PACKAGES += libdrm xcomposite xcursor xi xrandr xscrnsaver xtst
 # xscreensaver isn't covered in qtbase DEPENDS
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver', '', d)}"
 
 DEPENDS += "yasm-native"
 EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 63d02fa..933220d 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,6 +17,6 @@ PACKAGECONFIG ?= "examples"
 
 DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
-RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
+RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
 SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
-- 
2.5.5


