Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9866360722
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 11:40:27 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id f93so36264068lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GNn/6BSAUPuAsFmgFpPu89p7uiPemYgK2cQ25HUt3n0=;
	b=Co6chqU+w1My4JsENBPISvsHLjys8kkRDfX472CR4vCUOqYsR8h+NfLUiZX65gK178
	Qc3jAmG6GoSScjJtlQtSDYzR0/YB5Ny1Nx3WU/F4jdp20QeP+mU6sjfBch5yZETAC2ES
	HVDJ1EHByutZGBzjJvyhC1yV+clYTHyOK59lBWj/UnMnIfGTGFNfF2/W9HXwXsMcRfIA
	Yhc0dPR+SzEmnntkltYNqIC3jj9MSin/lkZvIDOpioPOoRE7D82NvlX7vxURPtyFvBnK
	+tAaawTAJGEjyFYIXxOvZNhMmu9uoKOWDhLdAVCQpzSujl8jJTrFe/zXTslDL8iB1ZKi
	RX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GNn/6BSAUPuAsFmgFpPu89p7uiPemYgK2cQ25HUt3n0=;
	b=Q5ao237fhTUKNlzpCFt57ff5Cug8Nx1W5yQto2mTgEG74HqbI0AQyl8JEnFTR+UpCR
	llUgzoIIwZgorr8+jUw2QE+LmflY18+uGQ95tI1alArpgjCzhuWNnlpBhTQ4PMjYsucr
	UIvLTwzK7SAKnrpwhz1BoBFZl+YitwvlcZG0GLHDpAN4Wgkbea9mnX/66QERLLtKhwSh
	PwkEpaTZwfEO+DYZt2ZWu+qtKyB+1dMs8z9vWDNnyt3ooRiOj1IBvULsxtagGSno2vQH
	+CLd1xdD/8rrDPPB7DYVuVzGfediiO1XUMIereKxzZ8zg1axwkqfDEV7rKRmxWrWXKUu
	PYmg==
X-Gm-Message-State: ALyK8tJShFZoGkDgARmMnq2kw7r9N5/JtNDImJEj6cWN4dyiM1+tITuMUXUftjornpMh1wYK
X-Received: by 10.46.0.97 with SMTP id 94mr20837435lja.60.1469014826982;
	Wed, 20 Jul 2016 04:40:26 -0700 (PDT)
Received: from XPS13.IHU.local ([212.247.53.108])
	by smtp.gmail.com with ESMTPSA id b71sm519781lfb.42.2016.07.20.04.40.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 04:40:25 -0700 (PDT)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 13:40:19 +0200
Message-Id: <1469014819-17231-1-git-send-email-gordan.markus@pelagicore.com>
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
X-List-Received-Date: Wed, 20 Jul 2016 11:40:33 -0000

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
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 2 +-
 27 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4e55141..0ea96bb 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -257,4 +257,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "540978288ea0f6ed0b166bb9207f427a4c825ab6"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8a6d93e..77d6241 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.0+git${SRCPV}"
+PV = "5.6.1-1+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 73900af..4f02912 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "540978288ea0f6ed0b166bb9207f427a4c825ab6"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index b85c563..4a5ae44 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "540978288ea0f6ed0b166bb9207f427a4c825ab6"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 5b12d1a..2347c92 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "791ddce7d41b126ba4744a6701597f49dbf99f3b"
+SRCREV = "72312730a7507f77898df0876b9437c43587e1d1"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 03990d8..be7b6d0 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dedff12a896d51c469d2af82664b86a10f8fa7fe"
+SRCREV = "7393531856058a8a0fe440d3a64728248958ac81"
\ No newline at end of file
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 72b3d7b..2665c5a 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
+SRCREV = "9b1231ca3d21ade574a8a7cf3f0805a8b520bcd5"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 04f5a79..018eea5 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
+SRCREV = "d23fb94863da83b71223f9022eb75ea618fef690"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 606b873..015818a 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
+SRCREV = "d01a936b6454834e8ead7acc5838ee5c66541a55"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 573b330..9d30d0c 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
+SRCREV = "cbf2d7e7696a4a08360c2004dfcbb8be7c1d2edb"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 8a41551..231d990 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
+SRCREV = "2bdeea286037e5ea0d8ba0d2ad59bdf1eaae1054"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 328fdd7..193a30a 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
+SRCREV = "711efc552d65f22b262e049c5a046198377519dc"
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
index e3c580f..6afb20b 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -12,4 +12,4 @@ DEPENDS += "qtdeclarative"
 
 FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
 
-SRCREV = "ac152bfcd37f94453e9705b57ca6520ad30bade0"
+SRCREV = "6ea6881ec8847dc99e05534769d6fe6198f56ead"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7a5ca23..c99d8e6 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,8 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRC_URI += " \
-    file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
-"
-
-SRCREV = "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
+SRCREV = "fcc9c0206433c5c940a0872447899743d1a9996a"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 565ca84..5d821d0 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b16873afea798d08799d7a0b255b8d200337f35b"
+SRCREV = "fc9407affb74bbfa9d396fef32f319b6baa8471f"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 16c2095..852677f 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
+SRCREV = "b08c3e69e3e82014b0f16b1ff94e5edd31d5c2c6"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 4139db1..f6fd2ca 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9a70ee2389d3302f6a4262325f8a76e4d867b478"
+SRCREV = "c1355ae41ee46437e9d6583dc4ea452a82b6b53b"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6c300e5..abd52f7 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
+SRCREV = "0e69a7c86f1908bc282362ec59f0ccf97d35d63a"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index e0b23b4..2ba713b 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
+SRCREV = "2d838dd06ebacc58c620614719067f6dac5e7418"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 93b147d..fcef5e1 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
+SRCREV = "efa6513bbf2515fbe6ab7b365e9597a8900ae279"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index ca47da8..c550404 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "920387296abcead6fea2d801fb2f57c185657c47"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a1cee86..5fe4d50 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "920387296abcead6fea2d801fb2f57c185657c47"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 79c6b23..d949f15 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "64a106da72796377bbff5cce0ecc5a379b105498"
+SRCREV = "b06c69533baeb2f80897f72ed787b51e122ffafc"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 427cd95..db0ad8f 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,7 +119,7 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "643aa579fc94933eefa8eb20af6729e2140cf480"
+SRCREV_qtwebengine = "69351428413edb7a76ce2ca11634b1797e45e296"
 SRCREV_chromium = "8252b18aa3efa52138e91f9756945afb142a1c8c"
 SRCREV = "${SRCREV_qtwebengine}"
 
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 66d9d74..6f0db26 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "ba9306ec5a1271275d79b2f48ceb227f79352f33"
+SRCREV = "0637eb3f40440f90eb531561e26f3854463bdbb3"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index d78df14..67bc252 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
+SRCREV = "23b764d34705d0f858e428e02c910637368b2694"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.5.0


