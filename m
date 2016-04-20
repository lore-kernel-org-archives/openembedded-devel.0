Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8272C6FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:58:05 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id e201so42138657wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=On6uIzNdTBidv5LcdJS3DLuS6yUt6AH1fdL9QQ13tcs=;
	b=Xx+dIK8UYy+xzzfH2jMjQaI4S1dnjTIhadHiMPdzXaN6aj88dBMqfda6BAkH2fDGLv
	16SODEHQ0ZNiZ8KEuc5LwVRoD70CdYDz/MidBakfzerM+DWoKMCTuvBJyhGpXBX49BsT
	BN5E/H7V4GZJKm8RBsrAMs3qhrHY4yS7y9BtCvUDPthkKxJq3fswGjT1fqNq7UW0ycbL
	hHC6bMK/mILmENkuGo+holWM+Oe3TW/yak8mKeXNO+g99+juwpL17yRGg0SDMZovH1Sj
	IKCOp/lsSjR2gTBXMIsZCJfN08xfyuPuTP0PDYQdK2bjD62batqUKdMGLIVUejF8n/n3
	070Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=On6uIzNdTBidv5LcdJS3DLuS6yUt6AH1fdL9QQ13tcs=;
	b=CnIsh7MPtcw+ZlJd1mifsBigmlvSUKSO38uUiXUoDwWRLZ0PU/5oGPdMKwmx96RGpA
	5G/P/6mtoyl0lLESyZhrjaDhJ8YwEGaEA1MSjF+njwZV+/j2uwwtsS8Po25QulFwRc03
	VAqwZARw6JGViyzzxTNzyCTz8YOW3oD1n3pasULC0N3t/fIr5lsbR85dw6wFCA5vnK3c
	7niFq00LTR0Edkx8hHea+vP5ngqizgoK6ytjEPOnYK+tQ8ZNs8UeBRoVojTywiAShtfJ
	Hg6pHrCOKFK16a42WhnxLio7nA34asJ6RwA3mBkp9nMETExeuOpF699SzHETMDbojFFx
	n4gQ==
X-Gm-Message-State: AOPr4FXEqHgmNbZprkAU17O4H2InMH+0KdeMRwWXemSnICAHfGujB6ieIVpBhBWz2obftw==
X-Received: by 10.28.195.7 with SMTP id t7mr27787289wmf.35.1461142686148;
	Wed, 20 Apr 2016 01:58:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u192sm8485991wmd.11.2016.04.20.01.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 01:58:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 11:00:03 +0200
Message-Id: <1461142803-3882-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] qt5: set SRCREVs,PVs to 5.6.0
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
X-List-Received-Date: Wed, 20 Apr 2016 08:58:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

* qtquick1: LICENSE.LGPLv3: I checked git repository.
  To be honest: I have no idea what caused checksum change.
  JaMa: it was modified in this change:
  OE @ ~/projects/qt-project/qtquick1 $ git log --oneline 87f2415adf34da08e6cd58f5da6f6a7d0d9cf141..dcc5e5c01c28b227f0e5e5e4976a9d26e8a45295 -- LICENSE.LGPLv3
  cd50897 Add the GPLv3 license text
  diff --git a/LICENSE.LGPLv3 b/LICENSE.LGPLv3
  index 8fbb743..4d67bac 100644
  --- a/LICENSE.LGPLv3
  +++ b/LICENSE.LGPLv3
  @@ -5,6 +5,8 @@

    You may use, distribute and copy the Qt GUI Toolkit under the terms of
    GNU Lesser General Public License version 3, which is displayed below.
  + This license makes reference to the version 3 of the GNU General
  + Public License, which you can find in the LICENSE.GPLv3 file.

* in some cases this is actually older SRCREV than what was
  used before (because normally the recipes use latest revision
  in stable - e.g. 5.6 branches, not the actuall tags). I'll
  upgrade to latest 5.6 revisions in follow-up commit (together
  with refreshing the .patch files and github.com/meta-qt5/qt*
  repositories to apply cleanly)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt3d_git.bb               | 2 +-
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
 recipes-qt/qt5/qtquick1_git.bb           | 4 ++--
 recipes-qt/qt5/qtquickcontrols_git.bb    | 2 +-
 recipes-qt/qt5/qtscript_git.bb           | 2 +-
 recipes-qt/qt5/qtsensors_git.bb          | 2 +-
 recipes-qt/qt5/qtserialport_git.bb       | 2 +-
 recipes-qt/qt5/qtsvg_git.bb              | 2 +-
 recipes-qt/qt5/qtsystems_git.bb          | 2 +-
 recipes-qt/qt5/qttools_git.bb            | 2 +-
 recipes-qt/qt5/qttranslations_git.bb     | 2 +-
 recipes-qt/qt5/qtwayland-native_git.bb   | 2 +-
 recipes-qt/qt5/qtwayland_git.bb          | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb       | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb        | 4 ++--
 recipes-qt/qt5/qtwebkit-examples_git.bb  | 2 +-
 recipes-qt/qt5/qtwebkit_git.bb           | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb       | 2 +-
 recipes-qt/qt5/qtx11extras_git.bb        | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb      | 2 +-
 30 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index af8fe4d..a96b06c 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "9b9f34701f47824e8201453d148152fb0855f98a"
+SRCREV = "7a208d76ed96bb506899becfe680df06f95451c7"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f6149fb..8a6d93e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.99+5.6.0-rc+git${SRCPV}"
+PV = "5.6.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 9f3b015..78621b6 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 98f6378..473d1df 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4990f34..205593f 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "b351fb164af327828c9bdbc414ffd8e47e387e8c"
+SRCREV = "5a17c4ca0552c9f4e6b5646f0cee2b21a55c3d18"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 17bd169..7a442c3 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dec32076b9153febc575a0418af702f8cb400258"
+SRCREV = "8b550f0a7508ed413cded71a20485e61010b0aa3"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 9274d00..3f8c3da 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "0fab5761d5428aa708edd66e40fc3c449adc4b11"
+SRCREV = "dc558b69f083c89aa8c02952e5f167405939a61a"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 5590abd..23b9417 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "60a135102aaa37d0d817883e4d6aed456372709d"
+SRCREV = "2a19257a5eef7a25a05d5cf7ea69ecc4184226f3"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index c35cc80..7d9636c 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "24f3fd69a2e953619c48b4a632262ce8419fee40"
+SRCREV = "4b8e9a348ca379b203c26ff14dd236267dd60646"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index b49940b..0a97f12 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "58f19cf8d51e06f1781f3142e6d872e5feb0690e"
+SRCREV = "0bd46d5861fa7b48c87cd3a734d00671df929869"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 5072903..2ee747f 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "03163a3c9129b7f982b690e750056506c3d06b41"
+SRCREV = "ca4bce553d03a64fa119650990083267ea9c8d31"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index ce42302..61c767e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "3b6de26fe585c586d055ac86c5911cc6df0e3887"
+SRCREV = "9985224a89b830dc182b428f491b6187d6f0e1ba"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e0a264d..32b9aba 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,7 +7,7 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
+SRCREV = "dcc5e5c01c28b227f0e5e5e4976a9d26e8a45295"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 6f0379e..a770fbe 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "93d06fb27d7eae9290db33b6684916a225939f0b"
+SRCREV = "85c2d2cce4c7d49bc425ccd0be2bbd9841b7e79b"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 32f6ebf..eea6911 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "a5e814fd8809dd6a8a3c3efd4b911b36e3325a2a"
+SRCREV = "a70f6a1b9599931fccd13b15a1700e61137f7e72"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 4fbd15b..6f2f1a3 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "fbaca62cd0a7309f04bf82101c8e20dbbf423192"
+SRCREV = "7197e7f4b385315cb241043495cbfad58deb911a"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index f32a8e1..0d1133d 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "02e4a66a8bd9ce4d2f7f8c89cd1bddf4b6385b5f"
+SRCREV = "03d492e49e74eefa1c83e37e833d862f4b9f1e45"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index d2699f7..83abbe6 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a9ac71a443260de66f720f0184646847b03fcb46"
+SRCREV = "38777ea7451d55e9c3d32d88d46063016013f60c"
 
 SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 656895e..8cbe0e0 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -33,4 +33,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
-SRCREV = "cc2077700bd5503d1fcf53aef83cbb76975e745a"
+SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8991633..afa4f79 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "05206b44cf25ca6a895cc9a8716f2b7f2f14191f"
+SRCREV = "9904992dc4eb9a5958fcfbac238374ff38498143"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 7908a3e..cc84755 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "ce85e4ee4ee22e5dea3b44707a27dab44319708e"
+SRCREV = "41d212290c3822b8eef151785d89ac5f5b246bde"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b164a67..a094419 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 78d8a3e..a5e3abe 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bebe9beff3e9874498474cec32634cf281ddc453"
+SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index eb4475b..7d923d8 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3fa1c9d2cf5e00e7431d042e7955a6dd75e6e2b1"
+SRCREV = "92d903d92b430222cd3f89eab08d61d947e5abea"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index c045174..ec9aa3c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,8 +119,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "3f02c25de46f5ff296b8189af3435ce5800b39a7"
-SRCREV_chromium = "779a2388fc123a7f3a178ce2ced921ee4a307e2c"
+SRCREV_qtwebengine = "5c4ae298b0a3d75c4c5ea8aef0595914ab25607f"
+SRCREV_chromium = "cbe3845eff59c2d1726ed3dc0f934f7f483a1271"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 63d02fa..a0d4e9f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
+SRCREV = "7988aecdbcb07f3a214c2c804a39db3fc5617844"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 4e61cca..62a7650 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -72,4 +72,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "d2ff5a085572b1ee24dcb42ae107063f3142d14e"
+SRCREV = "be8e169ba38c84562194906047d0da04bf3ae91a"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index fbce6be..cac3884 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "2d8c94cf11097b61689757f8a0162bb7dd9d7d0b"
+SRCREV = "88946bbe209cb6148b4a3284077bb9a06c7bc1ef"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 0ae8e4a..ac33fb2 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5df9fa8f3a7209c067a5d5068776b9aa52273d3b"
+SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c424562..2f24933 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "a8d103a05bc195dd045779f3aebdf67bd0140df1"
+SRCREV = "de2dadb8af67f9d425c3a8d2353a7d5b07588915"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.8.1


