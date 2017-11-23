Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 54031781C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 06:20:27 +0000 (UTC)
Received: from localhost.localdomain (pD95EF7F0.dip0.t-ipconnect.de
	[217.94.247.240])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 79445280135;
	Thu, 23 Nov 2017 06:20:09 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Nov 2017 07:20:11 +0100
Message-Id: <20171123062011.6040-1-daniel@zonque.org>
X-Mailer: git-send-email 2.14.3
Subject: [meta-qt5][PATCH] Bump to Qt 5.9.3
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
X-List-Received-Date: Thu, 23 Nov 2017 06:20:28 -0000

Drop one qwebengine patch that went upstream.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtgamepad_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...ests-make-accessibility-tests-conditional.patch | 37 ----------------------
 recipes-qt/qt5/qtwebengine_git.bb                  |  9 +++---
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtwebview_git.bb                    |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 35 files changed, 37 insertions(+), 75 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 6f8ab71..8a6d271 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -37,6 +37,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "143b721249af92fc27f48fb01914195516f7a087"
+SRCREV = "6399bcf7a9564f3566e160803f6f2837ce8727af"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index ffa70e5..a653011 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.9.2+git${SRCPV}"
+PV = "5.9.3+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index b0f5970..10a0424 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -125,4 +125,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
+SRCREV = "4d8ae444c2b15ec7da5ef133aa5ad5a548180e21"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 3ac6b21..2fff961 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -228,4 +228,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "ec16ba393baf504d4b192cc349775c62d3c96aa0"
+SRCREV = "4d8ae444c2b15ec7da5ef133aa5ad5a548180e21"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 17479e2..3907dc4 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "a1aee8ecbefb74cd5eae380ced56bb43ff3cc40b"
+SRCREV = "3ec47336f19a00e590c75ee520ff123266aa53b0"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index d494481..a1cb286 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "e3af14e9169207e0e73f7e50191106895c29ddc4"
+SRCREV = "def384b950c7a21a14a4eaf27e5bfe9c487f7520"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index ca9866f..3da0853 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "6b3bdb84406b42b50bdf5a39ee9ca2fabd3e6d2f"
+SRCREV = "475d1bad05c14bfb06eb4472c2ba7b0f95bfa051"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 7c8eda7..0ffdc18 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "8329a8fb287094012989b965604ff9c9426f022a"
+SRCREV = "b94345779087f6598ab1204d6aebffa4ba581932"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 4ae870a..3a66d0e 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -30,6 +30,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "32218c3243fb4f0da83293c5bd6a663d8e3660ee"
+SRCREV = "08778586413adad7b3af35c7cb97416757d599c0"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index 7e6cb1b..b9de279 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "167566d228792c0f763b84a39ff5dc52fda046dd"
+SRCREV = "2ed733d1cbf7cdafdc084f74e9897faad578f648"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 8f70bc0..ad5a36f 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "1f6658cbaa5ffecbf9ba845ea81683dd2215cd34"
+SRCREV = "cb007fee657f8bc2e48c3c1969834114e06a4307"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 52dd34a..2c5ac1a 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "dc6dc3b088d1828ee6d31f92528e0c87272ad4ed"
+SRCREV = "18f057c28a169285dd9df18728baa152b22b29e3"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index baa25d8..8d4eb22 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -30,7 +30,7 @@ SRC_URI += " \
     ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "d919f47308b209c798e50d8ca1b9abd48ba94718"
+SRCREV_qtlocation = "64e8ed5fa20d343904a27ad86411223504367e89"
 SRCREV_qtlocation-mapboxgl = "1c633072fcea7ad153ab6f8ec40dd72d83541ead"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index f42bdc2..03cb4e3 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "1e2702e86dbd2b3de69c58438bcfcf6276124547"
+SRCREV = "f771b34d7e288c172f773d440d9ee46e85548f2f"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index e5ca4df..d32986c 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -9,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "47b80ecae6fe0b9a2c74f0b0feb243145695995e"
+SRCREV = "da3963e3d406b445223081cbdfe10858ba2036ae"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 64cfbdf..522f1d7 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "871d8e8e2faca0be870930d83f755a2ad484d30b"
+SRCREV = "2eb1d259c6441faa62dc1834664e71995dca9165"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index aa0e6e3..ddb1807 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -28,4 +28,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "8476f8fff7dc5b6f140074d280828cc0f9590088"
+SRCREV = "118c63b8b5c129b2566f19b7931529fbe60850f8"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 1e90323..4248cbe 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "6e0341bc878ff82d3c1039dcce09f92269546189"
+SRCREV = "c10eaf9148ec111c3fb752cc15e854e5c7fd3ea7"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index b4f5a71..7a141b4 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "08b74f4f30c304b80249a593a572808bc1892f66"
+SRCREV = "c5b7db2e5cbc4477da75691602af1cc5fad10af0"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index fc60d60..4390660 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "3caae998c8c1770cd96cadba24d89a60005c5fe7"
+SRCREV = "04a0d00d41087c431626cc82f6f01297b6d31e1d"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 014b68f..e691945 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "c273f2e5c82a3ef8e55e360988b8cf31362e2ba9"
+SRCREV = "5a76227267a118cbda84cdee6d4fd3008ea5d34a"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 8df8913..960cc1e 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "ce5a3ced5eeefe05675736d3279d4d45bbb6df90"
+SRCREV = "43845adcb402b2a55cac423b142a9139b4cac17d"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 0425e43..6eea082 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "cb9ade8beabd3cdcd469a45fa82a27fcc960532f"
+SRCREV = "f0d63a2f88ea88dcebdb1d9240006b35768f740d"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index f9e04c8..e1a622d 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "bdcd7a97449502f92069d36196cc81064b1c02a0"
+SRCREV = "c4c9b60dc4bbe3c3837c80ea63682f3ef9403277"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 6930519..3cb21e5 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "90a701032ec5c8898e33b4fb4df0480634caaf8d"
+SRCREV = "87a54985321a3b9785619cdeeef44fa469cce594"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 0238ce9..4d3a99b 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -111,4 +111,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "325a90e07e9dce4e5c915549e6c31a86423dfdd3"
+SRCREV = "2578a31f573d4f80a33153f4165216be59a51162"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 5b54455..f2d053b 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -53,4 +53,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "87218c4e68c4ebde8f5765f0dfe9a70a359ae05f"
+SRCREV = "e0d5dbf0b83d72109ff3e69b9ef64bb2e8dd6153"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 979969b..525e1d6 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "d483ed2927cb8d4685d5d3c7ea1c71246381910b"
+SRCREV = "916f9f843f31329669a8ec4864c929179bc5f737"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.9
 # 5.9.meta-qt5.2
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 1e0796a..e47ef9f 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "61a638663c9061d7211849d3a9316661733a5ad9"
+SRCREV = "10a2704788f0bdf8dad3f7872db11f76ca2f4a18"
diff --git a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch b/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
deleted file mode 100644
index 8b82010..0000000
--- a/recipes-qt/qt5/qtwebengine/0005-tests-make-accessibility-tests-conditional.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 006f08373cbaa8485311f491ab8e67433c0e9ad6 Mon Sep 17 00:00:00 2001
-From: Daniel Mack <daniel@zonque.org>
-Date: Tue, 24 Oct 2017 15:46:19 +0200
-Subject: [PATCH] tests: make accessibility tests conditional
-
-Only test the accessibility functions if accessibility was enabled in the Qt
-config.
----
- tests/auto/widgets/widgets.pro | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/auto/widgets/widgets.pro b/tests/auto/widgets/widgets.pro
-index 441eea0f..7bab18f0 100644
---- a/tests/auto/widgets/widgets.pro
-+++ b/tests/auto/widgets/widgets.pro
-@@ -1,7 +1,6 @@
- TEMPLATE = subdirs
- 
- SUBDIRS += \
--    qwebengineaccessibility \
-     qwebenginedefaultsurfaceformat \
-     qwebenginedownloads \
-     qwebenginefaviconmanager \
-@@ -14,6 +13,10 @@ SUBDIRS += \
-     qwebenginesettings \
-     qwebengineview
- 
-+qtConfig(accessibility) {
-+    SUBDIRS += qwebengineaccessibility
-+}
-+
- contains(WEBENGINE_CONFIG, use_spellchecker):!cross_compile {
-     !contains(WEBENGINE_CONFIG, use_native_spellchecker) {
-         SUBDIRS += qwebenginespellcheck
--- 
-2.13.6
-
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 519ccb4..d88071a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -42,7 +42,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
 # http://errors.yoctoproject.org/Errors/Details/150333/
 SECURITY_STRINGFORMAT = ""
 
-# To use system ffmpeg you need to enable also libwebp, opus, vpx											    
+# To use system ffmpeg you need to enable also libwebp, opus, vpx
 # Only depenedencies available in oe-core are enabled by default
 PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
 PACKAGECONFIG[opus] = "WEBENGINE_CONFIG+=use_system_opus,,libopus"
@@ -138,10 +138,9 @@ SRC_URI += " \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
-    file://0005-tests-make-accessibility-tests-conditional.patch \
 "
 
-# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
+# Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based
 # 56-based.meta-qt5.2
 SRC_URI += " \
     file://0001-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
@@ -165,8 +164,8 @@ SRC_URI_append_libc-musl = "\
     file://0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "c11c2c8981e647c1eb2c6753ce77d436b92fff87"
-SRCREV_chromium = "cfe8c60903b327ac94406661350f4ac05aa8c21b"
+SRCREV_qtwebengine = "bc6915f0ae19a5bd5223b2b722c4c7f684972e4f"
+SRCREV_chromium = "a83d8cdb8d8361eadb86ac48d020486f56543114"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index eb3ab51..4730752 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "492981b93295f575ad77b6767dc5b8851287aa2e"
+SRCREV = "67f6e5e282c21495794741dd2242e4965b716b96"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index 79089ae..e419ab6 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "ec640efd1d82cdc88157159cbaa048815696ee25"
+SRCREV = "abc6a559f2369e82018568ece2b2dcce268e3777"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d15fc2d..ed504dc 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "160435b0eb076c31a021004eeede143fc265bce4"
+SRCREV = "2ee45df917c1c3b93a4584d5bb3e887dba55fed8"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 8b706dd..cbf1cec 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "8d7e1e0ec06724a4d332c050e9260530c708e773"
+SRCREV = "fedfe78518ad4025d9fafbd408e448311edbc478"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.14.3


