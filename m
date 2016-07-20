Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2A49460722
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 10:33:16 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id l69so35106659lfg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hCAKe6mvzMTTzbXzMckLD+ucwQysjYJXguCMj3KK9ns=;
	b=muMmzZF6siHRTCnpaIskgCrsMGHgKumcgql9IKVqauWsB0MKArUxtX/sQeNWrAqKWW
	8LxI4uGtgrYMD0g3L6Bn9J63TQtR/ADDINs4H95Di4WRftuRbXf1vJB70tD1Eat4TBuf
	BchrBTWAf7eGX5tJTOkBbGxUz6BFnRSrGg5yPzmQ8EmEHA2W9ZppNNh/va+BUz0Qqegd
	EwQxBmnXKoKkDqdRjUzFUkIMe2X4sz9x4kZ6udQM46XJ+CT9QzeUOPTAPLPySCL22TnI
	3XiNCs2iQwKMTwVR0+7wngcuAWeRlBeGcezxxRFtPXaRSx/sjQOLrYSBioh6qGVr5/fQ
	xI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hCAKe6mvzMTTzbXzMckLD+ucwQysjYJXguCMj3KK9ns=;
	b=GlDTJhV6+OoBC+sOyao0qPuqTd/g/DkKb5u2ybE87jRBa6y12mV6Ofd5ocjG3RAFs8
	QuH1fsbETegnOK5qnTWpl3Q1s0fiBj2nEIJV+Eo22vgiSPbrK8USW2dDZWGRksoyjn9I
	JBfcY5z7Gjkm9Msl4dCq5/Tv0SIxiotnoZO5pC+TusXW+Jm4FgsT/z29SwWE2e5Xwwz0
	n7oNyD45p8JtWnMbCsebjTeJ/5risDVa02QyMCPisEwVLRVwPMcMesT/JzHqogad3LEO
	PQLWr+ErDaSp4ky7yHh6yxO6T7koPgBhCnsACnOGn+TFCcHgBi/G7gQFwdoL0ZZ6kRfr
	LXxw==
X-Gm-Message-State: ALyK8tL0mghcUMY5ljo6GupJ76o4GQnh+aNghTEu7ZXKsvCKX7+dN/8pV9sTjxEM7EUPl32R
X-Received: by 10.25.151.132 with SMTP id z126mr18218945lfd.18.1469010796775; 
	Wed, 20 Jul 2016 03:33:16 -0700 (PDT)
Received: from XPS13.IHU.local ([212.247.53.108])
	by smtp.gmail.com with ESMTPSA id 41sm475173lft.20.2016.07.20.03.33.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 03:33:15 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 12:30:48 +0200
Message-Id: <1469010648-25671-1-git-send-email-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.5.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] qt5: update the recipes to the latest LTS stable Qt 5.6.1-1
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
X-List-Received-Date: Wed, 20 Jul 2016 10:33:17 -0000

* The Qt 5.6 release featured a severe bug where the
Qt Quick applications would crash after some time (QTBUG-53761)

* qtdeclarative: Fix crashes when incubating objects asynchronously
with initial properties
* qtdeclarative: QML: Only release types if they aren't referenced anymore
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb   | 2 +-
 recipes-qt/qt5/qt5-git.inc               | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb      | 2 +-
 recipes-qt/qt5/qtbase_git.bb             | 2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb         | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb     | 2 +-
 recipes-qt/qt5/qtdeclarative_git.bb      | 2 +-
 recipes-qt/qt5/qtenginio_git.bb          | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
 recipes-qt/qt5/qtimageformats_git.bb     | 2 +-
 recipes-qt/qt5/qtlocation_git.bb         | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb       | 2 +-
 recipes-qt/qt5/qtquick1_git.bb           | 2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb   | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb    | 6 +-----
 recipes-qt/qt5/qtscript_git.bb           | 2 +-
 recipes-qt/qt5/qtsensors_git.bb          | 2 +-
 recipes-qt/qt5/qtserialport_git.bb       | 2 +-
 recipes-qt/qt5/qtsvg_git.bb              | 2 +-
 recipes-qt/qt5/qttools_git.bb            | 2 +-
 recipes-qt/qt5/qttranslations_git.bb     | 2 +-
 recipes-qt/qt5/qtwayland-native_git.bb   | 2 +-
 recipes-qt/qt5/qtwayland_git.bb          | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb       | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb        | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb       | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb        | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 2 +-
 28 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4e55141..87c5b9e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -257,4 +257,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8a6d93e..77d6241 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.0+git${SRCPV}"
+PV = "5.6.1-1+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 73900af..1bf4a13 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index b85c563..a2fb041 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 5b12d1a..0b91e8d 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "791ddce7d41b126ba4744a6701597f49dbf99f3b"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 03990d8..488e82f 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dedff12a896d51c469d2af82664b86a10f8fa7fe"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 72b3d7b..a5bc166 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
+SRCREV = "v5.6.1-1"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 04f5a79..327899d 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 606b873..c82c35d 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 573b330..7207d8a 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 8a41551..f8e6f25 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 328fdd7..1626a8e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 61b02a1..c23852e 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
+SRCREV = "dbc9131ebb300e715d5ebd815dc3ef9aa77ebf56"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index e3c580f..513fa42 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -12,4 +12,4 @@ DEPENDS += "qtdeclarative"
 
 FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
 
-SRCREV = "ac152bfcd37f94453e9705b57ca6520ad30bade0"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7a5ca23..0147535 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,8 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRC_URI += " \
-    file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
-"
-
-SRCREV = "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 565ca84..dc132e3 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b16873afea798d08799d7a0b255b8d200337f35b"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 16c2095..fb953ee 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 4139db1..e38fc5a 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9a70ee2389d3302f6a4262325f8a76e4d867b478"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6c300e5..d5723e4 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index e0b23b4..03d07f0 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
+SRCREV = "v5.6.1-1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 93b147d..f932d43 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index ca47da8..4597ff5 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a1cee86..162a489 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 79c6b23..d3e94c4 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "64a106da72796377bbff5cce0ecc5a379b105498"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 427cd95..5729024 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,7 +119,7 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "643aa579fc94933eefa8eb20af6729e2140cf480"
+SRCREV_qtwebengine = "v5.6.1-1"
 SRCREV_chromium = "8252b18aa3efa52138e91f9756945afb142a1c8c"
 SRCREV = "${SRCREV_qtwebengine}"
 
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 66d9d74..43b13d7 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "ba9306ec5a1271275d79b2f48ceb227f79352f33"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d8beb50..1a45465 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f27489d66cc6d8263130451c26c7e4ae40acc6b4"
+SRCREV = "v5.6.1-1"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index d78df14..f2397db 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
+SRCREV = "v5.6.1-1"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.0


