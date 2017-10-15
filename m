Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 43C9077E8C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 18:24:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f4so30343982wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WO6WI4D9ducizt12tJLAqceCg6lOUgOT8ZTxscELliM=;
	b=sOXg1PJdOtEajLzNQW0tRsjj5XD2p1VoIQo8KYJQ6TQ3knF37ja0W43cpFVvqClwGx
	DlgHIFRw6KA5o7okqORx4QuaTVYMSKEcHn3TfH6WCKMv878rYecmfcp768Yinq4El16I
	FaGShQD6MeGvBdF0PBwhFcnmROITpAMxRohBVt6PZD7kbE7n8jiM7o6uDFp0ynm0BEDS
	EupFDp2DThbihnrzMAjRmOtdKeakLjQPZa/HPWndasvHpEHWy5NttAVqcXyuLZ2rxiZs
	HfZl5J6y5c1h3o+sBtPgpbrjPqvmPob8/eFu+qhD3AK7pSExv6GrZBcbRyMR7bVHlZ3A
	FgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WO6WI4D9ducizt12tJLAqceCg6lOUgOT8ZTxscELliM=;
	b=PHVqTrg89nOiBs9AtGyDIBcJASRvovJrqFG7rHX5vY9EL1BZOLHc5ZrlokskRldDy/
	zw/pwvwW3yD0DUGN4Wn9f2Y5kq7/hX54bCJbmbrUpUIkhePVg7wxjfg3kBOhTW8XSvW3
	I8yL5XTpjkyRpWzfnChHH6adnGiPVB/ujUK48YDN1Qiy1oFpjWu7Vxf0UgoCWDPOHExx
	sQ5Q9fh57GCohOpqU6hCoXWwWayevdIOF7k+A+cbhOCYbarkXWrVzUNoSXRp31Rmcuog
	QPFYffziux9dRmWvlGBrrlGB+Vyn0X8MYFrkvhqbEmHVSX5tOE0GVS8WErwSkxzn1tVT
	zMWw==
X-Gm-Message-State: AMCzsaVd5PJY4rVh9l0Pmf4iExH/mCo5Ss9SvbzHx4zdqW0mtBArvLl9
	OReZT8VGpZjLrDPZmsJLtUljTw==
X-Google-Smtp-Source: AOwi7QAoK2rM6d/KzGxf2HNSXyV1AQ6C3PtvvWSnaCGbyiLJXIDN/OT2f5ALLDiYc30maD/nUEo30Q==
X-Received: by 10.28.4.135 with SMTP id 129mr5764863wme.34.1508091872069;
	Sun, 15 Oct 2017 11:24:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h201sm7379909wmd.27.2017.10.15.11.24.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Oct 2017 11:24:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Oct 2017 18:27:36 +0000
Message-Id: <1508092056-897-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Herman van Hazendonk <github.com@herrie.org>
Subject: [meta-qt5][PATCH] meta-qt5: Update to 5.9.2 release
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
X-List-Received-Date: Sun, 15 Oct 2017 18:24:32 -0000

From: Herman van Hazendonk <github.com@herrie.org>

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../libconnman-qt/libconnman-qt5_git.bb            |  4 +--
 recipes-connectivity/libqofono/libqofono_git.bb    |  4 +--
 recipes-qt/examples/qt5everywheredemo_1.0.bb       |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb |  4 +--
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 .../0001-Make-mapbox-gl-build-configurable.patch   | 27 -------------------
 recipes-qt/qt5/qtlocation_git.bb                   |  8 ++----
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...qtbug-61521.cpp-use-free-instead-of-cfree.patch | 25 -----------------
 recipes-qt/qt5/qtwebengine_git.bb                  |  5 ++--
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 recipes-qt/qtchooser/qtchooser_git.bb              |  4 +--
 recipes-qt/tufao/tufao_1.2.1.bb                    | 31 ----------------------
 recipes-qt/tufao/tufao_1.4.3.bb                    | 31 ++++++++++++++++++++++
 43 files changed, 76 insertions(+), 133 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
 delete mode 100644 recipes-qt/tufao/tufao_1.2.1.bb
 create mode 100644 recipes-qt/tufao/tufao_1.4.3.bb

diff --git a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
index 9605777..ecd295c 100644
--- a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://git.merproject.org/mer-core/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.1.10+git${SRCPV}"
+PV = "1.2.4+git${SRCPV}"
 
-SRCREV = "4d6def3053eaccaac04e4f9e03ee24dea8b9e8d8"
+SRCREV = "9d98e12ed60ae4fa9da62485cb8a82129ed1a464"
 SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https \
     file://0001-Don-t-use-MeeGo-as-prefix-in-order-to-make-this-a-co.patch \
 "
diff --git a/recipes-connectivity/libqofono/libqofono_git.bb b/recipes-connectivity/libqofono/libqofono_git.bb
index 88df135..18e9b8f 100644
--- a/recipes-connectivity/libqofono/libqofono_git.bb
+++ b/recipes-connectivity/libqofono/libqofono_git.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "54435de3bed0b454ef4ea3ea32c7234fcd9f24c6"
+SRCREV = "6916cd030b05f0bd137ea9b669fee48f20c19084"
 SRC_URI = "git://git.merproject.org/mer-core/libqofono.git"
 S = "${WORKDIR}/git"
 
-PV = "0.87+gitr${SRCPV}"
+PV = "0.92+gitr${SRCPV}"
 
 inherit qmake5
 
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 7735d90..779b528 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
-SRCREV = "c17fe9e0ec0882ac4c4dc1168095f569acab5d09"
+SRCREV = "35d72a2eba7456a2efc5eb8b77afbc00f69ba0ac"
 SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
 
 S = "${WORKDIR}/git/QtDemo"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 0cb75a6..6f8ab71 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "9d8c9ada161ad97634992c444196add0abb4f9d1"
+SRCREV = "143b721249af92fc27f48fb01914195516f7a087"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
index 2676bdd..383145b 100644
--- a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
+++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
 "
 
-PV = "1.1.3+gitr${SRCPV}"
+PV = "1.1.4+gitr${SRCPV}"
 
 DEPENDS = "qtbase"
 
@@ -17,7 +17,7 @@ DEPENDS = "qtbase"
 CXXFLAGS += "-Wno-narrowing"
 
 SRC_URI = "git://github.com/nemomobile/qt5-plugin-generic-vboxtouch.git"
-SRCREV = "d613ad1cc64d7a6a9b38df4d49146170be6876aa"
+SRCREV = "3f2bdb5a1d346f02d5ab185522271ba2288a42bb"
 S = "${WORKDIR}/git/vboxtouch"
 
 inherit qmake5
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 3a0699c..b0f5970 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -125,4 +125,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
+SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index dce2d77..3ac6b21 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -228,4 +228,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
+SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index f46cbc2..17479e2 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "25447e889dc43c0831100bee1625a6f667d364cf"
+SRCREV = "a1aee8ecbefb74cd5eae380ced56bb43ff3cc40b"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 26881f0..da6e999 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "1f47b1a7ae58702dccc57a9ccbaa905441f4fecb"
+SRCREV = "e3af14e9169207e0e73f7e50191106895c29ddc4"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 9e91a1d..ca9866f 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "94cc2b914a027fbcb7a1eb6cb34af45d0c07d2a4"
+SRCREV = "6b3bdb84406b42b50bdf5a39ee9ca2fabd3e6d2f"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 3737e10..7c8eda7 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "3f8ae713dfdbaeb34bdc52d905fe5ca16765cf7f"
+SRCREV = "8329a8fb287094012989b965604ff9c9426f022a"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 2cc969a..4ae870a 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "7c45b035b97ce705d536932965673dca7cfa489e"
+SRCREV = "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 1fa8e82..30d5eea 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 QT_MODULE_BRANCH = "dev"
-SRCREV = "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
+SRCREV = "23603a3b088178d8ec92fddb240e5a5c55d77d5a"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index a771d9d..7e6cb1b 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "1fc40deed6993265c436783cc367285bf9a2266a"
+SRCREV = "167566d228792c0f763b84a39ff5dc52fda046dd"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 6c6f3ae..8f70bc0 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "b6ff12df5496f3d296bb438ae343d5f771e93fec"
+SRCREV = "1f6658cbaa5ffecbf9ba845ea81683dd2215cd34"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 1e022f4..52dd34a 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "144a3535db9f95e60972d3c3b6eaceb65a604577"
+SRCREV = "dc6dc3b088d1828ee6d31f92528e0c87272ad4ed"
diff --git a/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch b/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
deleted file mode 100644
index 7db1676..0000000
--- a/recipes-qt/qt5/qtlocation/0001-Make-mapbox-gl-build-configurable.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From dbc899b088817cf6529d7e5cb8be7a6a95556127 Mon Sep 17 00:00:00 2001
-From: Samuli Piippo <samuli.piippo@qt.io>
-Date: Wed, 7 Jun 2017 13:29:29 +0300
-Subject: [PATCH] Make mapbox-gl build configurable
-
-mapbox-gl-native won't compile for ARMv5 or older, so disable the
-build by default.
-
-Task-number: QTBUG-61289
-Change-Id: I5f26200f2735b363c3c322f9035b331b9159c47b
----
- src/plugins/geoservices/geoservices.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/geoservices/geoservices.pro b/src/plugins/geoservices/geoservices.pro
-index 459897a8..d97e05d0 100644
---- a/src/plugins/geoservices/geoservices.pro
-+++ b/src/plugins/geoservices/geoservices.pro
-@@ -6,7 +6,7 @@ qtConfig(concurrent) {
-     SUBDIRS += osm
- }
- 
--qtConfig(opengl):qtConfig(c++14):!win32|mingw:!qnx {
-+mapboxgl:qtConfig(opengl):qtConfig(c++14):!win32|mingw:!qnx {
-     !exists(../../3rdparty/mapbox-gl-native/CMakeLists.txt) {
-         warning("Submodule mapbox-gl-native does not exist. Run 'git submodule update --init' on qtlocation.")
-     } else {
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 0aebbd3..baa25d8 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -13,10 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
 
-# Patches from https://github.com/meta-qt5/qtlocation/commits/b5.9
-# 5.9.meta-qt5.2
-SRC_URI += "file://0001-Make-mapbox-gl-build-configurable.patch"
-
 PACKAGECONFIG ??= ""
 # older geoclue 0.12.99 is needed
 PACKAGECONFIG[geoclue] = ",,geoclue"
@@ -34,7 +30,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "c832af789766fcebd8cfb15e53ce14f36278ca6d"
-SRCREV_qtlocation-mapboxgl = "9ecbe3642fb4a53b558598239b59bf1d0224c25b"
+SRCREV_qtlocation = "d919f47308b209c798e50d8ca1b9abd48ba94718"
+SRCREV_qtlocation-mapboxgl = "1c633072fcea7ad153ab6f8ec40dd72d83541ead"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 729b3ff..f42bdc2 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "343e281f0e7cc7fd9e1558e4d92f5019fa565181"
+SRCREV = "1e2702e86dbd2b3de69c58438bcfcf6276124547"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 0655b42..3006b8a 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "3d93f6436596e349e43c3798b675af66db71df8a"
+SRCREV = "1e2702e86dbd2b3de69c58438bcfcf6276124547"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index c1bbc8a..d694658 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -28,4 +28,4 @@ QT_MODULE_BRANCH = "dev"
 # one commit behind:
 # 8a7b80eb Use QRandomGenerator instead of q?rand
 # because QRandomGenerator is only since Qt 5.10
-SRCREV = "9bf0edd9bd46ecb900bcdc3349d14869b87ab7de"
+SRCREV = "4f7b6037720b21b8150f8495b7318d139d447541"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 4b2924b..64cfbdf 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "63f2f55462f2f040cfe175ada8aa1e01168597fc"
+SRCREV = "871d8e8e2faca0be870930d83f755a2ad484d30b"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 50d6ba6..aa0e6e3 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -28,4 +28,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "a77494140324c3ede1f7c16086593c070d81e2b3"
+SRCREV = "8476f8fff7dc5b6f140074d280828cc0f9590088"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 9fe2358..b4f5a71 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "86ee61734e0331459f9cfeb1ad56f773b7e994be"
+SRCREV = "08b74f4f30c304b80249a593a572808bc1892f66"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 36ca665..fc60d60 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "a1dff1a11ad303a1f82f181e6386194de90ec08f"
+SRCREV = "3caae998c8c1770cd96cadba24d89a60005c5fe7"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 6b2c28e..014b68f 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "1673dbed00ba68209b6de95981f1e3b4a2a24682"
+SRCREV = "c273f2e5c82a3ef8e55e360988b8cf31362e2ba9"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 0b30043..8df8913 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "1d37c357c843a2622d2af7e1684576e19a8c7c30"
+SRCREV = "ce5a3ced5eeefe05675736d3279d4d45bbb6df90"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 23f03ce..0425e43 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "93b539140c06da07d330c9ecad67ab5ed3f9b0c8"
+SRCREV = "cb9ade8beabd3cdcd469a45fa82a27fcc960532f"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index e3bd840..f9e04c8 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "0fcd0160662941a9ba800b36671e88d82790bd95"
+SRCREV = "bdcd7a97449502f92069d36196cc81064b1c02a0"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 911a709..0c6ce7e 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -30,4 +30,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "f364358a817ba57fa5aa9c67e731241249e704f8"
+SRCREV = "9c204e05ae7fefe9525b30238b469b1bb65d2537"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 151b4df..6930519 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "fdc5749b5603653c5d0c59db267f44fd1609457e"
+SRCREV = "90a701032ec5c8898e33b4fb4df0480634caaf8d"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 122d068..5b54455 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "dd8c39ea9312ec1441b3fdd830f9d42fe3258b58"
+SRCREV = "87218c4e68c4ebde8f5765f0dfe9a70a359ae05f"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 9847f39..979969b 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "7f70da6a644bc5b690066f0ab4814e1358f57e81"
+SRCREV = "d483ed2927cb8d4685d5d3c7ea1c71246381910b"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 7e12a33..1e0796a 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "b5229df6a08a902b11a2fc9529af6385f4d985d5"
+SRCREV = "61a638663c9061d7211849d3a9316661733a5ad9"
diff --git a/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch b/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
deleted file mode 100644
index d8d89b8..0000000
--- a/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 331de4be615b8552e498ac2f3deff4b49b4b0fc0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 20 Aug 2017 20:37:38 +0200
-Subject: [PATCH] qtbug-61521.cpp: use free instead of cfree
-
-* as cfree man says:
-  This  function  should  never  be used.  Use free(3) instead.
-  Starting with version 2.26, it has been removed from glibc.
----
- src/core/api/qtbug-61521.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/api/qtbug-61521.cpp b/src/core/api/qtbug-61521.cpp
-index 86d5998e..1dcc4cfa 100644
---- a/src/core/api/qtbug-61521.cpp
-+++ b/src/core/api/qtbug-61521.cpp
-@@ -100,7 +100,7 @@ SHIM_HIDDEN void* ShimCalloc(size_t n, size_t size) {
- }
- 
- SHIM_HIDDEN void ShimCFree(void* ptr) {
--    cfree(ptr);
-+    free(ptr);
- }
- 
- SHIM_HIDDEN void* ShimMemalign(size_t align, size_t s) {
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 7a9c614..4ced792 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -137,7 +137,6 @@ SRC_URI += " \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
-    file://0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
@@ -164,8 +163,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "99f84ffd2c0c78014a24534a863aa1c755abd51c"
-SRCREV_chromium = "21508b5b5421f10ba8627c3c66c5281efb39b2f9"
+SRCREV_qtwebengine = "c11c2c8981e647c1eb2c6753ce77d436b92fff87"
+SRCREV_chromium = "cfe8c60903b327ac94406661350f4ac05aa8c21b"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 448ce5c..eb3ab51 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fb71c823a7ae823345518ca33ccfe273fcf76494"
+SRCREV = "492981b93295f575ad77b6767dc5b8851287aa2e"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index 0bbb09e..79089ae 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "e4016a67bbffefed71a407494e249e978d212b3d"
+SRCREV = "ec640efd1d82cdc88157159cbaa048815696ee25"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index ed1440c..779f559 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f65d50eb063ad3c9a1d6f008f66e881d2e15f1d8"
+SRCREV = "8d7e1e0ec06724a4d332c050e9260530c708e773"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index f4f46f1..8b706dd 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "fcfa824402bb4edaf644fad786dac3560c743ebe"
+SRCREV = "8d7e1e0ec06724a4d332c050e9260530c708e773"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
diff --git a/recipes-qt/qtchooser/qtchooser_git.bb b/recipes-qt/qtchooser/qtchooser_git.bb
index f765645..5fad7d6 100644
--- a/recipes-qt/qtchooser/qtchooser_git.bb
+++ b/recipes-qt/qtchooser/qtchooser_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
 "
 S = "${WORKDIR}/git"
-SRCREV = "4717841185d34bbe450e3b24445f2d35e3325a6a"
-PV = "39+git${SRCREV}"
+SRCREV = "a1b6736e4f2daf86cd1626004d40ef57db85fbb5"
+#PV = "39+git${SRCREV}"
 
 inherit pkgconfig
 
diff --git a/recipes-qt/tufao/tufao_1.2.1.bb b/recipes-qt/tufao/tufao_1.2.1.bb
deleted file mode 100644
index 34b28b7..0000000
--- a/recipes-qt/tufao/tufao_1.2.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "An asynchronous web framework for C++ built on top of Qt"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
-DEPENDS = "qtbase"
-
-SRCREV = "a4832b4c941b5ff3f5fab23adcff39e6ad6cb4e5"
-SRC_URI = "git://github.com/vinipsmaker/tufao.git;protocol=http \
-           file://build-Fix-mkspecs-and-CMake-module-install-directori.patch"
-
-# This includes bugfixes from 1.x branch
-PV_append = "+${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-inherit cmake_qt5
-
-PACKAGES += "${PN}-mkspecs"
-
-FILES_${PN}-mkspecs = "\
-    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs \
-"
-
-FILES_${PN}-dev += " \
-    ${OE_QMAKE_PATH_LIBS}/lib*${SOLIBSDEV} \
-    ${OE_QMAKE_PATH_LIBS}/pkgconfig \
-    ${OE_QMAKE_PATH_LIBS}/cmake/* \
-    ${OE_QMAKE_PATH_LIBS}/*.prl \
-    ${OE_QMAKE_PATH_LIBS}/*.la \
-    ${OE_QMAKE_PATH_DATA}/* \
-    ${OE_QMAKE_PATH_HEADERS}/* \
-"
diff --git a/recipes-qt/tufao/tufao_1.4.3.bb b/recipes-qt/tufao/tufao_1.4.3.bb
new file mode 100644
index 0000000..4bb5ba0
--- /dev/null
+++ b/recipes-qt/tufao/tufao_1.4.3.bb
@@ -0,0 +1,31 @@
+SUMMARY = "An asynchronous web framework for C++ built on top of Qt"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "qtbase"
+
+SRCREV = "b8e35408fec166e885170c71a03b7f8f09ef649e"
+SRC_URI = "git://github.com/vinipsmaker/tufao.git;protocol=http \
+           file://build-Fix-mkspecs-and-CMake-module-install-directori.patch"
+
+# This includes bugfixes from 1.x branch
+PV_append = "+${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake_qt5
+
+PACKAGES += "${PN}-mkspecs"
+
+FILES_${PN}-mkspecs = "\
+    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs \
+"
+
+FILES_${PN}-dev += " \
+    ${OE_QMAKE_PATH_LIBS}/lib*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_LIBS}/pkgconfig \
+    ${OE_QMAKE_PATH_LIBS}/cmake/* \
+    ${OE_QMAKE_PATH_LIBS}/*.prl \
+    ${OE_QMAKE_PATH_LIBS}/*.la \
+    ${OE_QMAKE_PATH_DATA}/* \
+    ${OE_QMAKE_PATH_HEADERS}/* \
+"
-- 
2.7.4


