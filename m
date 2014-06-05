Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9812C6FB62
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 22:08:47 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so1866483wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=mjFPQuqeLz12rGmVfHT+CPR4X1kYZ2lxhodDDcKWS8g=;
	b=mclLjaoCPHka455q7P3s7V0yAq0MiI5La+e8vy2g14caCJdKpBXeVImB6JksTsdBfH
	dpcriU2v/3jSeKB+T66gfSsCn6zdGcCD6iuLsqeIgxM08C4OmbAJeN0yr2VJKE37tF8F
	jXfOoAj7rZW8tG0iqsk6QxptH5pGjjPxsC4gtLLPzJyJ9yWCUIGzMW2wAlRmSPEa1VYp
	KVGAZy0Dt/lpUXRojLGX6t2C8drDwYZy6hPCpOHc7VbAT/AnZNjJZ1JRc1H/oYZeR45Z
	z/X3WB+1kMRREAUOxVm/5rU9O1Ivuwjvnj7vi/VfrjMzbqB6yHeC0TaKRWgPMJUjSSjp
	e2Qg==
X-Received: by 10.15.44.134 with SMTP id z6mr258666eev.61.1402006128592;
	Thu, 05 Jun 2014 15:08:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ci54sm17721699eeb.19.2014.06.05.15.08.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jun 2014 15:08:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jun 2014 00:08:51 +0200
Message-Id: <1402006139-27614-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1402006139-27614-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCHv2 02/10] qt5: upgrade from 5.2.1 to 5.3.0
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
X-List-Received-Date: Thu, 05 Jun 2014 22:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc                |  3 +-
 recipes-qt/qt5/nativesdk-qtbase_5.2.1.bb           |  5 --
 recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb           |  5 ++
 recipes-qt/qt5/nativesdk-qttools.inc               |  6 +++
 recipes-qt/qt5/nativesdk-qttools_5.2.1.bb          |  5 --
 recipes-qt/qt5/nativesdk-qttools_5.3.0.bb          |  5 ++
 recipes-qt/qt5/{qt5-5.2.1.inc => qt5-5.3.0.inc}    |  4 +-
 recipes-qt/qt5/qtbase-native.inc                   |  2 +
 ...base-native_5.2.1.bb => qtbase-native_5.3.0.bb} |  4 +-
 recipes-qt/qt5/qtbase.inc                          |  5 +-
 .../0005-qt_module-Fix-pkgconfig-replacement.patch | 12 ++---
 ...mintegration-Undefine-CursorShape-from-X..patch | 30 +++++++++++
 recipes-qt/qt5/qtbase/0010-Always-build-uic.patch  | 19 +++----
 .../0013-QOpenGLPaintDevice-sub-area-support.patch | 44 ++++++++--------
 .../0015-Fix-linuxfb-argument-mmsize-parsing.patch | 42 ---------------
 .../qt5/qtbase/0015-Fix-missing-plugin_types.patch | 30 +++++++++++
 ...lfs-Print-the-chosen-config-in-debug-mode.patch | 56 ++++++++++++++++++++
 .../qtbase/0016-eglfs-Fix-quad-coordinates.patch   | 39 --------------
 recipes-qt/qt5/qtbase_5.2.1.bb                     |  7 ---
 recipes-qt/qt5/qtbase_5.3.0.bb                     |  5 ++
 recipes-qt/qt5/qtconnectivity.inc                  |  6 +++
 recipes-qt/qt5/qtconnectivity_5.2.1.bb             |  5 --
 recipes-qt/qt5/qtconnectivity_5.3.0.bb             |  5 ++
 recipes-qt/qt5/qtdeclarative.inc                   |  7 +++
 ...x-improper-antialiasing-property-behavior.patch | 60 ++++++++++++++++++++++
 ...g-calculation-of-viewPort-for-transitions.patch | 41 ---------------
 recipes-qt/qt5/qtdeclarative_5.2.1.bb              |  9 ----
 recipes-qt/qt5/qtdeclarative_5.3.0.bb              |  5 ++
 recipes-qt/qt5/qtgraphicaleffects.inc              |  6 +++
 recipes-qt/qt5/qtgraphicaleffects_5.2.1.bb         |  5 --
 recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb         |  5 ++
 recipes-qt/qt5/qtimageformats.inc                  |  6 +++
 recipes-qt/qt5/qtimageformats_5.2.1.bb             |  5 --
 recipes-qt/qt5/qtimageformats_5.3.0.bb             |  5 ++
 recipes-qt/qt5/qtlocation.inc                      |  6 +++
 recipes-qt/qt5/qtlocation_5.2.1.bb                 |  5 --
 recipes-qt/qt5/qtlocation_5.3.0.bb                 |  5 ++
 recipes-qt/qt5/qtmultimedia.inc                    |  6 +++
 recipes-qt/qt5/qtmultimedia_5.2.1.bb               |  5 --
 recipes-qt/qt5/qtmultimedia_5.3.0.bb               |  5 ++
 recipes-qt/qt5/qtquick1.inc                        |  6 +++
 recipes-qt/qt5/qtquick1_5.2.1.bb                   |  5 --
 recipes-qt/qt5/qtquick1_5.3.0.bb                   |  5 ++
 recipes-qt/qt5/qtquickcontrols.inc                 |  6 +++
 recipes-qt/qt5/qtquickcontrols_5.2.1.bb            |  6 ---
 recipes-qt/qt5/qtquickcontrols_5.3.0.bb            |  5 ++
 recipes-qt/qt5/qtscript.inc                        |  6 +++
 recipes-qt/qt5/qtscript_5.2.1.bb                   |  5 --
 recipes-qt/qt5/qtscript_5.3.0.bb                   |  5 ++
 recipes-qt/qt5/qtsensors.inc                       |  6 +++
 recipes-qt/qt5/qtsensors_5.2.1.bb                  |  5 --
 recipes-qt/qt5/qtsensors_5.3.0.bb                  |  5 ++
 recipes-qt/qt5/qtserialport_5.2.1.bb               |  5 --
 recipes-qt/qt5/qtserialport_5.3.0.bb               |  5 ++
 recipes-qt/qt5/qtsvg.inc                           |  6 +++
 recipes-qt/qt5/qtsvg_5.2.1.bb                      |  6 ---
 recipes-qt/qt5/qtsvg_5.3.0.bb                      |  5 ++
 recipes-qt/qt5/qttools-native.inc                  |  6 +++
 recipes-qt/qt5/qttools-native_5.2.1.bb             |  5 --
 recipes-qt/qt5/qttools-native_5.3.0.bb             |  5 ++
 recipes-qt/qt5/qttools.inc                         |  6 +++
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 39 ++++++++++----
 recipes-qt/qt5/qttools_5.2.1.bb                    |  5 --
 recipes-qt/qt5/qttools_5.3.0.bb                    |  5 ++
 recipes-qt/qt5/qtwayland-native.inc                |  6 +++
 recipes-qt/qt5/qtwayland.inc                       |  6 +++
 recipes-qt/qt5/qtwebkit-examples_5.2.1.bb          |  5 --
 recipes-qt/qt5/qtwebkit-examples_5.3.0.bb          |  5 ++
 recipes-qt/qt5/qtwebkit_5.2.1.bb                   |  5 --
 recipes-qt/qt5/qtwebkit_5.3.0.bb                   |  5 ++
 recipes-qt/qt5/qtx11extras.inc                     |  6 +++
 recipes-qt/qt5/qtx11extras_5.2.1.bb                |  5 --
 recipes-qt/qt5/qtx11extras_5.3.0.bb                |  5 ++
 recipes-qt/qt5/qtxmlpatterns.inc                   |  6 +++
 recipes-qt/qt5/qtxmlpatterns_5.2.1.bb              |  5 --
 recipes-qt/qt5/qtxmlpatterns_5.3.0.bb              |  5 ++
 76 files changed, 462 insertions(+), 295 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.2.1.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_5.2.1.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
 rename recipes-qt/qt5/{qt5-5.2.1.inc => qt5-5.3.0.inc} (86%)
 rename recipes-qt/qt5/{qtbase-native_5.2.1.bb => qtbase-native_5.3.0.bb} (63%)
 create mode 100644 recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 delete mode 100644 recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
 create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch
 create mode 100644 recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
 delete mode 100644 recipes-qt/qt5/qtbase_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtbase_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtconnectivity_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtconnectivity_5.3.0.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtdeclarative_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtlocation_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtlocation_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtquick1_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtquick1_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtscript_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtsensors_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtserialport_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtserialport_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtsvg_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qttools-native_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qttools_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qttools_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtwebkit_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtwebkit_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtx11extras_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtx11extras_5.3.0.bb
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns_5.2.1.bb
 create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.0.bb

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 884b1a6..62e841c 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -23,6 +23,8 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
+    file://0015-Fix-missing-plugin_types.patch \
+    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
 "
 
 # common with -native
@@ -67,7 +69,6 @@ FILES_${PN}-tools = " \
 DEBIAN_NOAUTONAME_${PN}-tools = "1"
 
 QT_CONFIG_FLAGS += " \
-    -reduce-relocations \
     -shared \
     -silent \
     -no-pch \
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.2.1.bb b/recipes-qt/qt5/nativesdk-qtbase_5.2.1.bb
deleted file mode 100644
index c106d22..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "fa005301a2000b92b61b63edc042567b"
-SRC_URI[sha256sum] = "acdfd1aa2548ebea1d922e8e24e5c59f5fc3b2beae7c8003ba47d773bfcc94c0"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
new file mode 100644
index 0000000..95d3af7
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
+SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
index c67f9cd..6b8ba54 100644
--- a/recipes-qt/qt5/nativesdk-qttools.inc
+++ b/recipes-qt/qt5/nativesdk-qttools.inc
@@ -9,6 +9,12 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
 
 SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
 
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 FILES_${PN}-dbg = " \
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.2.1.bb b/recipes-qt/qt5/nativesdk-qttools_5.2.1.bb
deleted file mode 100644
index d186a21..0000000
--- a/recipes-qt/qt5/nativesdk-qttools_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "f56b2e6c537f6853d9bf10380c39418b"
-SRC_URI[sha256sum] = "ff2f850f63798441aaaa0b18c741460acdd62c74d6a9e6a76521956e4bcb27d5"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
new file mode 100644
index 0000000..d3956a7
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
+SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/qt5-5.2.1.inc b/recipes-qt/qt5/qt5-5.3.0.inc
similarity index 86%
rename from recipes-qt/qt5/qt5-5.2.1.inc
rename to recipes-qt/qt5/qt5-5.3.0.inc
index 50e8a7a..21c1a22 100644
--- a/recipes-qt/qt5/qt5-5.2.1.inc
+++ b/recipes-qt/qt5/qt5-5.3.0.inc
@@ -4,7 +4,7 @@
 QT_VERSION ?= "${PV}"
 
 # it's different for RC versions
-QT_VERSION_DIR ?= "5.2"
+QT_VERSION_DIR ?= "5.3"
 
 SRC_URI += " \
     http://download.qt-project.org/official_releases/qt/${QT_VERSION_DIR}/${QT_VERSION}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
@@ -13,7 +13,7 @@ SRC_URI += " \
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=2abca611d56c23eb99943bde21c80a0d \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
index 860bc29..dc04987 100644
--- a/recipes-qt/qt5/qtbase-native.inc
+++ b/recipes-qt/qt5/qtbase-native.inc
@@ -19,6 +19,8 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
+    file://0015-Fix-missing-plugin_types.patch \
+    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
 "
 
 # specific for native version
diff --git a/recipes-qt/qt5/qtbase-native_5.2.1.bb b/recipes-qt/qt5/qtbase-native_5.3.0.bb
similarity index 63%
rename from recipes-qt/qt5/qtbase-native_5.2.1.bb
rename to recipes-qt/qt5/qtbase-native_5.3.0.bb
index 54adc48..8468b4f 100644
--- a/recipes-qt/qt5/qtbase-native_5.2.1.bb
+++ b/recipes-qt/qt5/qtbase-native_5.3.0.bb
@@ -7,5 +7,5 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRC_URI[md5sum] = "fa005301a2000b92b61b63edc042567b"
-SRC_URI[sha256sum] = "acdfd1aa2548ebea1d922e8e24e5c59f5fc3b2beae7c8003ba47d773bfcc94c0"
+SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
+SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 3768871..726576c 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -11,6 +11,8 @@ SRC_URI += "\
     file://0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch \
     file://0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch \
     file://0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch \
+    file://0015-Fix-missing-plugin_types.patch \
+    file://0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
 "
 
 SRC_URI += "\
@@ -18,7 +20,7 @@ SRC_URI += "\
     file://0011-Allow-building-a-separate-qmake-for-the-target.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0016-eglfs-Fix-quad-coordinates.patch \
+    file://0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -126,7 +128,6 @@ PACKAGECONFIG[nis] = "-nis,-no-nis"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
 
 QT_CONFIG_FLAGS += " \
-    -reduce-relocations \
     -shared \
     -silent \
     -no-pch \
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
index b8768c8..e1135ce 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
@@ -1,4 +1,4 @@
-From 7999eeb3f2ab1150aa301ec26ae9bf0788d09c9e Mon Sep 17 00:00:00 2001
+From 4d690dbc278063648434b0f02bdb1b6f4623b285 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 05/14] qt_module: Fix pkgconfig replacement
@@ -47,10 +47,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 13 insertions(+), 7 deletions(-)
 
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 11509ee..be9b929 100644
+index 2134077..a88b8cc 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -135,30 +135,36 @@ load(qt_installs)
+@@ -170,30 +170,36 @@ load(qt_installs)
      rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
  else: \
      rplbase = $$MODULE_BASE_OUTDIR
@@ -75,7 +75,7 @@ index 11509ee..be9b929 100644
 +lafile_replace.CONFIG = path
 +QMAKE_PRL_INSTALL_REPLACE += lib_replace lafile_replace
  
- unix|win32-g++* {
+ unix|mingw {
     CONFIG += create_pc
     QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
 -   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
@@ -93,7 +93,7 @@ index 11509ee..be9b929 100644
 +   QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace lafile_replace
  }
  
- unix|win32-g++* {
+ unix|mingw {
 -- 
-1.8.5.3
+1.9.3
 
diff --git a/recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
new file mode 100644
index 0000000..2f4d80c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -0,0 +1,30 @@
+From 959b2fb8d8eb5e755e3d9d3d3031b996f96fb23b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 19 Mar 2014 18:32:28 +0100
+Subject: [PATCH 8/8] qeglplatformintegration: Undefine CursorShape from X.h
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+index f665455..9eb783c 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
++++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+@@ -46,6 +46,12 @@
+ #include <qpa/qplatformnativeinterface.h>
+ #include <EGL/egl.h>
+ 
++// Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
++// /usr/include/X11/X.h:#define CursorShape           0       /* largest size that can be displayed */
++#ifdef CursorShape
++#undef CursorShape
++#endif
++
+ QT_BEGIN_NAMESPACE
+ 
+ class QEGLPlatformScreen;
+-- 
+2.0.0
+
diff --git a/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
index 5681b58..c55bc54 100644
--- a/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 8a10c6d053fe438aec007e4a73b60ac59716ccd4 Mon Sep 17 00:00:00 2001
+From 745055eb0f56ec4d48ea2ce57bcf3d0011afcec0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 10/12] Always build uic
@@ -10,14 +10,14 @@ Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
 Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/src.pro | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/src.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index b7887a6..8801544 100644
+index 6a805a6..90623a6 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -145,7 +145,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -158,7 +158,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -26,13 +26,6 @@ index b7887a6..8801544 100644
  
  nacl: SUBDIRS -= src_network src_testlib
  
-@@ -156,4 +156,4 @@ TR_EXCLUDE = \
-     src_tools_bootstrap_dbus src_tools_qdbusxml2cpp src_tools_qdbuscpp2xml
- 
- sub-tools.depends = $$TOOLS
--QMAKE_EXTRA_TARGETS = sub-tools
-\ No newline at end of file
-+QMAKE_EXTRA_TARGETS = sub-tools
 -- 
-1.8.5.3
+1.9.3
 
diff --git a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
index c6ec67c..54039de 100644
--- a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 2fad0a6fa3c06577995ac44ed0a2a12eaef819c2 Mon Sep 17 00:00:00 2001
+From 3c7bfc66e6c84fe06b16dfa0b76ee71701e8d5b5 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 13/14] QOpenGLPaintDevice sub-area support
@@ -14,13 +14,13 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  src/gui/opengl/qopenglpaintdevice.cpp       | 12 ++++++++++++
  src/gui/opengl/qopenglpaintdevice.h         |  2 ++
- src/gui/opengl/qopenglpaintengine.cpp       | 10 +++++++---
+ src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
  src/gui/opengl/qopenglpaintengine_p.h       |  1 +
  src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
- 5 files changed, 23 insertions(+), 4 deletions(-)
+ 5 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index fa392d1..5df1762 100644
+index 6750458..034630a 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
 @@ -111,6 +111,7 @@ class QOpenGLPaintDevicePrivate
@@ -76,7 +76,7 @@ index c05571c..01eb1bc 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 0513551..f6aeb15 100644
+index 81a0d82..ce57261 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
 @@ -1985,7 +1985,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
@@ -90,24 +90,24 @@ index 0513551..f6aeb15 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2073,7 +2076,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2070,7 +2073,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
--        glViewport(0, 0, d->width, d->height);
-+        glViewport(d->x, d->y, d->width, d->height);
+-        d->funcs.glViewport(0, 0, d->width, d->height);
++        d->funcs.glViewport(d->x, d->y, d->width, d->height);
          d->needsSync = false;
          d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2116,6 +2119,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2113,6 +2116,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
-         glDisable(GL_SCISSOR_TEST);
+         funcs.glDisable(GL_SCISSOR_TEST);
      } else {
 +        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
-         glEnable(GL_SCISSOR_TEST);
+         funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2124,14 +2128,14 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2121,12 +2125,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -120,12 +120,10 @@ index 0513551..f6aeb15 100644
      }
 +    bottom += y;
      const int height = rect.height();
--
-     glScissor(left, bottom, width, height);
- }
  
+     funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index d51f0e5..0d4b38d 100644
+index 4f0e2e5..f211de1 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
 @@ -264,6 +264,7 @@ public:
@@ -137,18 +135,18 @@ index d51f0e5..0d4b38d 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 3b62d1d..a5d1f7e 100644
+index ac88d9d..6c77f10 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -273,7 +273,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-     funcs.glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
+@@ -315,7 +315,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
--        glViewport(0, 0, pex->width, pex->height);
-+        glViewport(pex->x, pex->y, pex->width, pex->height);
+-        funcs->glViewport(0, 0, pex->width, pex->height);
++        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
          pex->updateClipScissorTest();
      } else {
-         m_blitProgram->disableAttributeArray(int(QT_VERTEX_COORDS_ATTR));
+         if (m_vao.isCreated()) {
 -- 
-1.8.5.3
+1.9.3
 
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
deleted file mode 100644
index a31301e..0000000
--- a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 99979159a404df09495c8ddd6a052837f66b8739 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
-Date: Fri, 7 Feb 2014 13:12:37 +0100
-Subject: [PATCH] Fix linuxfb argument 'mmsize' parsing
-
-Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
-
-Upstream-Status: Backport
-
-Task-number: QTBUG-29133
-Change-Id: Idc4950270818e496d5d94a97a172b7c780f069b1
-Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-index 735a43d..33a9523 100644
---- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-+++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
-@@ -333,6 +333,8 @@ bool QLinuxFbScreen::initialize()
-     foreach (const QString &arg, mArgs) {
-         if (arg == QLatin1String("nographicsmodeswitch"))
-             doSwitchToGraphicsMode = false;
-+        else if (mmSizeRx.indexIn(arg) != -1)
-+            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
-         else if (sizeRx.indexIn(arg) != -1)
-             userGeometry.setSize(QSize(sizeRx.cap(1).toInt(), sizeRx.cap(2).toInt()));
-         else if (offsetRx.indexIn(arg) != -1)
-@@ -341,8 +343,6 @@ bool QLinuxFbScreen::initialize()
-             ttyDevice = ttyRx.cap(1);
-         else if (fbRx.indexIn(arg) != -1)
-             fbDevice = fbRx.cap(1);
--        else if (mmSizeRx.indexIn(arg) != -1)
--            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
-     }
- 
-     if (fbDevice.isEmpty()) {
--- 
-1.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch b/recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch
new file mode 100644
index 0000000..612cbdd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-Fix-missing-plugin_types.patch
@@ -0,0 +1,30 @@
+From f0e01b788e86f24352ba14ad17c3f337f934467d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 21 Apr 2014 15:09:23 +0200
+Subject: [PATCH] Fix missing plugin_types
+
+* bearer/generic was failing with:
+  Project ERROR: No module claims plugin type 'bearer'
+
+Change-Id: I90848856a8b0a4df52e599983cf7dde0bc0e6623
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mkspecs/features/qt_module_pris.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt_module_pris.prf b/mkspecs/features/qt_module_pris.prf
+index f31bc38..415e780 100644
+--- a/mkspecs/features/qt_module_pris.prf
++++ b/mkspecs/features/qt_module_pris.prf
+@@ -177,7 +177,7 @@ MODULE_FWD_PRI = $$mod_work_pfx/qt_lib_$${MODULE_ID}.pri
+         include($$mod_work_pfx/qt_lib_$${pri}.pri)
+     for(mod, mods_to_load) {
+         for(var, $$list(VERSION MAJOR_VERSION MINOR_VERSION PATCH_VERSION \
+-                        name depends module_config CONFIG DEFINES sources \
++                        name depends module_config plugin_types CONFIG DEFINES sources \
+                         includes bins libs libexecs plugins imports qml \
+                         rpath_link \
+                 )):defined(QT.$${mod}.$$var, var):cache(QT.$${mod}.$$var, transient)
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
new file mode 100644
index 0000000..65ebbd1
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0016-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -0,0 +1,56 @@
+From 91b185d1f4843d22d42461c0aee4cd0f5393bbc8 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 21 Apr 2014 19:22:04 +0200
+Subject: [PATCH] Revert "eglfs: Print the chosen config in debug mode"
+
+This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
+---
+ src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
+ src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
+ 2 files changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+index e6624fb..3870f6c 100644
+--- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
++++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+@@ -437,9 +437,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+     for (index = 0; attrs[index].attr != -1; ++index) {
+         EGLint value;
+         if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
+-            qDebug("\t%s: %d", attrs[index].name, (int)value);
++            qWarning("\t%s: %d\n", attrs[index].name, (int)value);
+         }
+     }
++
++    qWarning("\n");
+ }
+ 
+ #ifdef Q_OS_LINUX
+diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+index eec6463..4a7c69b 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+@@ -44,7 +44,6 @@
+ #include "qeglpbuffer_p.h"
+ #include <qpa/qplatformwindow.h>
+ #include <QOpenGLContext>
+-#include <QDebug>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -192,12 +191,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
+         return;
+     }
+ 
+-    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
+-    if (printConfig) {
+-        qDebug() << "Created context for format" << format << "with config:";
+-        q_printEglConfig(m_eglDisplay, m_eglConfig);
+-    }
+-
+ #ifndef QT_NO_OPENGL
+     // Make the context current to ensure the GL version query works. This needs a surface too.
+     const EGLint pbufferAttributes[] = {
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
deleted file mode 100644
index 92785e4..0000000
--- a/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 84756d94c73885803ad8044099ab47c0c49b5076 Mon Sep 17 00:00:00 2001
-From: Laszlo Agocs <laszlo.agocs@digia.com>
-Date: Thu, 23 Jan 2014 11:45:22 +0100
-Subject: [PATCH] eglfs: Fix quad coordinates
-
-Prevent artifacts on raster windows by properly mapping
-the coordinates to [-1,1].
-
-Upstream-Status: Backport
-
-Task-number: QTBUG-36370
-Change-Id: I95d0d03952f597ef4ce6a950c6533a3af2df964a
-Reviewed-by: Andy Nichols <andy.nichols@digia.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/plugins/platforms/eglfs/qeglfscompositor.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/qeglfscompositor.cpp b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
-index 845bb5b..1efc4f7 100644
---- a/src/plugins/platforms/eglfs/qeglfscompositor.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
-@@ -153,10 +153,11 @@ void QEglFSCompositor::render(QEglFSWindow *window, uint texture, bool raster)
-     QPoint tl = r.topLeft();
-     QPoint br = r.bottomRight();
- 
-+    // Map to [-1,1]
-     GLfloat x1 = (tl.x() / sr.width()) * 2 - 1;
--    GLfloat x2 = (br.x() / sr.width()) * 2 - 1;
-     GLfloat y1 = ((sr.height() - tl.y()) / sr.height()) * 2 - 1;
--    GLfloat y2 = ((sr.height() - br.y()) / sr.height()) * 2 - 1;
-+    GLfloat x2 = ((br.x() + 1) / sr.width()) * 2 - 1;
-+    GLfloat y2 = ((sr.height() - (br.y() + 1)) / sr.height()) * 2 - 1;
- 
-     if (!raster)
-         qSwap(y1, y2);
--- 
-1.7.1
-
diff --git a/recipes-qt/qt5/qtbase_5.2.1.bb b/recipes-qt/qt5/qtbase_5.2.1.bb
deleted file mode 100644
index 4257367..0000000
--- a/recipes-qt/qt5/qtbase_5.2.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI += "file://0015-Fix-linuxfb-argument-mmsize-parsing.patch"
-
-SRC_URI[md5sum] = "fa005301a2000b92b61b63edc042567b"
-SRC_URI[sha256sum] = "acdfd1aa2548ebea1d922e8e24e5c59f5fc3b2beae7c8003ba47d773bfcc94c0"
diff --git a/recipes-qt/qt5/qtbase_5.3.0.bb b/recipes-qt/qt5/qtbase_5.3.0.bb
new file mode 100644
index 0000000..95d3af7
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4bc43a72e1b3d804171e5b52640e8d96"
+SRC_URI[sha256sum] = "07320bc8bbb718c420e22486942985c79fb2e2743981a19954aa09cc8a7147ab"
diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
index c0a5147..a5fbb0c 100644
--- a/recipes-qt/qt5/qtconnectivity.inc
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -11,3 +11,9 @@ do_configure_prepend() {
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity_5.2.1.bb b/recipes-qt/qt5/qtconnectivity_5.2.1.bb
deleted file mode 100644
index 6fd0c7b..0000000
--- a/recipes-qt/qt5/qtconnectivity_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "cb2ef624b28b6ba61d6a467b8b3c314a"
-SRC_URI[sha256sum] = "ec31e1c3cd5aea4d7dff946802a7fde2599bb8a1931d4bb49cb0854371cf1223"
diff --git a/recipes-qt/qt5/qtconnectivity_5.3.0.bb b/recipes-qt/qt5/qtconnectivity_5.3.0.bb
new file mode 100644
index 0000000..2fb3f09
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "46e4e8df94b4da4415aa5f5076b8bc45"
+SRC_URI[sha256sum] = "d83555be4fc805afe9ef307cf8633d9c0cebc678042e384b24e0aa61d7bc1d02"
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index 4a186fd..bdb1de9 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -2,8 +2,15 @@ require qt5.inc
 
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
+    file://0002-Fix-improper-antialiasing-property-behavior.patch \
 "
 
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
 DEPENDS += "qtbase"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch b/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
new file mode 100644
index 0000000..821149f
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0002-Fix-improper-antialiasing-property-behavior.patch
@@ -0,0 +1,60 @@
+From 009ad875f89d7d7bc4447e18c2fbbd485a75e0b5 Mon Sep 17 00:00:00 2001
+From: Oleg Shparber <trollixx@gmail.com>
+Date: Mon, 19 May 2014 00:53:39 -0700
+Subject: [PATCH] Fix improper antialiasing property behavior
+
+For components antialiased by default the property was returned
+as false if default true value was set to true again.
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-39047
+Change-Id: I16960a12b6d38a0d9e487fc6612610c39c4949d4
+Reviewed-by: Gunnar Sletta <gunnar.sletta@jollamobile.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/quick/items/qquickitem.cpp                 | 8 +++++---
+ tests/auto/quick/qquicktext/tst_qquicktext.cpp | 7 +++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/quick/items/qquickitem.cpp b/src/quick/items/qquickitem.cpp
+index 3f0dae8..ef2eac4 100644
+--- a/src/quick/items/qquickitem.cpp
++++ b/src/quick/items/qquickitem.cpp
+@@ -5691,10 +5691,12 @@ void QQuickItem::setAntialiasing(bool aa)
+ {
+     Q_D(QQuickItem);
+ 
+-    bool changed = (aa != antialiasing());
+-    d->antialiasingValid = true;
++    if (!d->antialiasingValid) {
++        d->antialiasingValid = true;
++        d->antialiasing = d->implicitAntialiasing;
++    }
+ 
+-    if (!changed)
++    if (aa == d->antialiasing)
+         return;
+ 
+     d->antialiasing = aa;
+diff --git a/tests/auto/quick/qquicktext/tst_qquicktext.cpp b/tests/auto/quick/qquicktext/tst_qquicktext.cpp
+index 0b69981..d36c55d 100644
+--- a/tests/auto/quick/qquicktext/tst_qquicktext.cpp
++++ b/tests/auto/quick/qquicktext/tst_qquicktext.cpp
+@@ -1334,6 +1334,13 @@ void tst_qquicktext::antialiasing()
+     text->resetAntialiasing();
+     QCOMPARE(text->antialiasing(), true);
+     QCOMPARE(spy.count(), 2);
++
++    // QTBUG-39047
++    component.setData("import QtQuick 2.0\n Text { antialiasing: true }", QUrl());
++    object.reset(component.create());
++    text = qobject_cast<QQuickText *>(object.data());
++    QVERIFY(text);
++    QCOMPARE(text->antialiasing(), true);
+ }
+ 
+ void tst_qquicktext::weight()
+-- 
+1.9.3
+
diff --git a/recipes-qt/qt5/qtdeclarative/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch b/recipes-qt/qt5/qtdeclarative/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
deleted file mode 100644
index 5643634..0000000
--- a/recipes-qt/qt5/qtdeclarative/0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a13535b21b8406d65c8f139306d8324bda05443b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Florian=20H=C3=A4nel?= <florian.haenel@basyskom.com>
-Date: Wed, 5 Jun 2013 19:23:32 +0200
-Subject: [PATCH 2/2] Fix wrong calculation of viewPort for transitions
-
-Viewport is calculated wrong for horizontal layout in a second instance
-
-Task-number: QTBUG-29944
-Task-Number: QTBUG-31546
-
-Upstream-Status: Pending
-
-Looks like backport of https://codereview.qt-project.org/49226 but this
-one was applied in previous patch, this change looks the same but is
-in different part of qquickitemview.cpp and ISN'T applied yet in dev
-branch.
-
-Signed-off-by: Florian Haenel <florian.haenel@lge.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Change-Id: I136ae4484278d14f796613505e3f38c65ec51ebe
----
- src/quick/items/qquickitemview.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/quick/items/qquickitemview.cpp b/src/quick/items/qquickitemview.cpp
-index d7b9847..a54d282 100644
---- a/src/quick/items/qquickitemview.cpp
-+++ b/src/quick/items/qquickitemview.cpp
-@@ -1835,7 +1835,7 @@ void QQuickItemViewPrivate::layout()
- 
-         prepareVisibleItemTransitions();
- 
--        QRectF viewBounds(0, position(), q->width(), q->height());
-+        QRectF viewBounds(q->contentX(),  q->contentY(), q->width(), q->height());
-         for (QList<FxViewItem*>::Iterator it = releasePendingTransition.begin();
-              it != releasePendingTransition.end(); ) {
-             FxViewItem *item = *it;
--- 
-1.8.5.3
-
diff --git a/recipes-qt/qt5/qtdeclarative_5.2.1.bb b/recipes-qt/qt5/qtdeclarative_5.2.1.bb
deleted file mode 100644
index eaa90ba..0000000
--- a/recipes-qt/qt5/qtdeclarative_5.2.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI += " \
-    file://0003-Fix-wrong-calculation-of-viewPort-for-transitions.patch \
-"
-
-SRC_URI[md5sum] = "a23fba03a4b48f36fe8b51d326d08acc"
-SRC_URI[sha256sum] = "7e32b8d6e1d64ca4bdfa92d15f9b4217a1b24239ef40e8826eeccbe918866690"
diff --git a/recipes-qt/qt5/qtdeclarative_5.3.0.bb b/recipes-qt/qt5/qtdeclarative_5.3.0.bb
new file mode 100644
index 0000000..6725b57
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9e29d2b481c771ce5c798a3319835673"
+SRC_URI[sha256sum] = "fab07eb4f4b2091e1d88b27b84ac49d7e8daaa1eb72fd62e602ee9ac3ed7f42f"
diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
index 2ced3c2..8610c34 100644
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ b/recipes-qt/qt5/qtgraphicaleffects.inc
@@ -3,3 +3,9 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.2.1.bb b/recipes-qt/qt5/qtgraphicaleffects_5.2.1.bb
deleted file mode 100644
index 4d5673b..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "8dde8593750e33a79f49c5a2f03caf0c"
-SRC_URI[sha256sum] = "5abb17ee60d68cf49c4f8f0b69c3f1e4d0a2f7b32cda8d6901d9c35447cc3482"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
new file mode 100644
index 0000000..f63e05a
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "a4170d057978794c2c3c477e841a0e08"
+SRC_URI[sha256sum] = "3f95fb603fb3c7fbb54587b3dfe423491e058fd61af2d7371b1f12881cff20c1"
diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index f90e58a..b5edf1b 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -2,3 +2,9 @@ require qt5.inc
 
 DEPENDS += "qtbase tiff"
 ALLOW_EMPTY_${PN} = "1"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_5.2.1.bb b/recipes-qt/qt5/qtimageformats_5.2.1.bb
deleted file mode 100644
index 2d24ce7..0000000
--- a/recipes-qt/qt5/qtimageformats_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "9b88aa6f3888c7c7f5253c147ae4bf8f"
-SRC_URI[sha256sum] = "a6a0454769566fec1757fb09b1f33c9fc70d4016acbb04ebc6e493ddedfef124"
diff --git a/recipes-qt/qt5/qtimageformats_5.3.0.bb b/recipes-qt/qt5/qtimageformats_5.3.0.bb
new file mode 100644
index 0000000..509d815
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "90c751ffe23c005eb411d1f081bf116d"
+SRC_URI[sha256sum] = "f3b895847d27eaa98979ad146e6c0f46f38e23471a87ef496b8b777c578db2dc"
diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index 41f2d19..a35b0fa 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -18,3 +18,9 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_5.2.1.bb b/recipes-qt/qt5/qtlocation_5.2.1.bb
deleted file mode 100644
index f920e2c..0000000
--- a/recipes-qt/qt5/qtlocation_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "4de8ca8ac1a3e5db20a903286fb78840"
-SRC_URI[sha256sum] = "9543fcdcab5cf02be60e395e8145e1ec87d03a3d1f129a0dde92102283a9b536"
diff --git a/recipes-qt/qt5/qtlocation_5.3.0.bb b/recipes-qt/qt5/qtlocation_5.3.0.bb
new file mode 100644
index 0000000..4af556f
--- /dev/null
+++ b/recipes-qt/qt5/qtlocation_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "bfc7678bfe7d78f12fb20a54ac54e610"
+SRC_URI[sha256sum] = "ca34224a8aa5e6f81c04cbeb05ecc440b82cf27ac24f7c2b1d297a3497110414"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 3b7e568..119d61a 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -15,3 +15,9 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_5.2.1.bb b/recipes-qt/qt5/qtmultimedia_5.2.1.bb
deleted file mode 100644
index fc823a6..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "26dc22c59fbbad9fdf0699d5f887166a"
-SRC_URI[sha256sum] = "62688cb7d8daa4d7050353fe39536c5edd97228a10185b9662a29b8c8cff1fa2"
diff --git a/recipes-qt/qt5/qtmultimedia_5.3.0.bb b/recipes-qt/qt5/qtmultimedia_5.3.0.bb
new file mode 100644
index 0000000..4d72587
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "921f4596ca39b78851663369db0bbcee"
+SRC_URI[sha256sum] = "9f30b9f0f758c44db4743d2de409cfa0aef297bc6b81c929b1875dfb638d517b"
diff --git a/recipes-qt/qt5/qtquick1.inc b/recipes-qt/qt5/qtquick1.inc
index a9ec211..0c690b2 100644
--- a/recipes-qt/qt5/qtquick1.inc
+++ b/recipes-qt/qt5/qtquick1.inc
@@ -2,3 +2,9 @@ require qt5.inc
 
 DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
 # qttools
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_5.2.1.bb b/recipes-qt/qt5/qtquick1_5.2.1.bb
deleted file mode 100644
index 7563bc6..0000000
--- a/recipes-qt/qt5/qtquick1_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6abbf131adffdf3cba63704d5d35f921"
-SRC_URI[sha256sum] = "8b2bb3250b9e09a4c568069bc4c7cfeddbdcda50b24f0bfecc7f85df3120ff65"
diff --git a/recipes-qt/qt5/qtquick1_5.3.0.bb b/recipes-qt/qt5/qtquick1_5.3.0.bb
new file mode 100644
index 0000000..bf6e8df
--- /dev/null
+++ b/recipes-qt/qt5/qtquick1_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "cd6ffd4a29f7050f71670e7afec09e5d"
+SRC_URI[sha256sum] = "74b03938df58e7825b0e46efb8266ac8d53741fff1c467b5b1fbfe2f3b840b68"
diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
index 2ced3c2..8610c34 100644
--- a/recipes-qt/qt5/qtquickcontrols.inc
+++ b/recipes-qt/qt5/qtquickcontrols.inc
@@ -3,3 +3,9 @@ require qt5.inc
 DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.2.1.bb b/recipes-qt/qt5/qtquickcontrols_5.2.1.bb
deleted file mode 100644
index 2c09e44..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.2.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "027bc7d05fe740b21284dc909c9f11ac"
-SRC_URI[sha256sum] = "eb03a69402576984d588923e994c3cb672d8479ac9b68ed90da15d0c2fd82aac"
-
diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.0.bb b/recipes-qt/qt5/qtquickcontrols_5.3.0.bb
new file mode 100644
index 0000000..365d511
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "808b5a28f152f1af19dad30a10e5dbf1"
+SRC_URI[sha256sum] = "b8df0d64b69e765971fd6c71d8f0c4f7aabec73343a98225a4655a0b8b82df1c"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
index bbb05a6..73f5898 100644
--- a/recipes-qt/qt5/qtscript.inc
+++ b/recipes-qt/qt5/qtscript.inc
@@ -1,3 +1,9 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_5.2.1.bb b/recipes-qt/qt5/qtscript_5.2.1.bb
deleted file mode 100644
index 4617c09..0000000
--- a/recipes-qt/qt5/qtscript_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "b8af09bb297d4c62e64df5418fe99dc9"
-SRC_URI[sha256sum] = "6621350d5eff65cb6f9853247246f30a2d4cdb465c14923ff7ccbd8c3a9cdefa"
diff --git a/recipes-qt/qt5/qtscript_5.3.0.bb b/recipes-qt/qt5/qtscript_5.3.0.bb
new file mode 100644
index 0000000..6065e6b
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4f755c8810946246adcfbaa74fafae62"
+SRC_URI[sha256sum] = "a86067103ffb4c307619aeaef68fbe25e7219ffd34b369e445cdd4deb4108390"
diff --git a/recipes-qt/qt5/qtsensors.inc b/recipes-qt/qt5/qtsensors.inc
index b2147f1..550398e 100644
--- a/recipes-qt/qt5/qtsensors.inc
+++ b/recipes-qt/qt5/qtsensors.inc
@@ -1,3 +1,9 @@
 require qt5.inc
 
 DEPENDS += "qtbase qtdeclarative"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_5.2.1.bb b/recipes-qt/qt5/qtsensors_5.2.1.bb
deleted file mode 100644
index 1f340d0..0000000
--- a/recipes-qt/qt5/qtsensors_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "045f98acba9fba0358a6a50356be0841"
-SRC_URI[sha256sum] = "09403e7e088f30da828e452559a6904d7c43420d423a429d6529285f99b1e407"
diff --git a/recipes-qt/qt5/qtsensors_5.3.0.bb b/recipes-qt/qt5/qtsensors_5.3.0.bb
new file mode 100644
index 0000000..03df1fc
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "3f8c7e7ed87785d8c1fbab4fec6f458d"
+SRC_URI[sha256sum] = "dde4d55635e616406adaf8e100dc468ccdd296c6589eff1208f0dce0ffc597c1"
diff --git a/recipes-qt/qt5/qtserialport_5.2.1.bb b/recipes-qt/qt5/qtserialport_5.2.1.bb
deleted file mode 100644
index 806e7ee..0000000
--- a/recipes-qt/qt5/qtserialport_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "2993ad7e92a0b6b41e3cb0e0e345d251"
-SRC_URI[sha256sum] = "f5754e4ba61843b7dfdf946a91b7d857a5cb470608b840f92452e72f24c67347"
diff --git a/recipes-qt/qt5/qtserialport_5.3.0.bb b/recipes-qt/qt5/qtserialport_5.3.0.bb
new file mode 100644
index 0000000..0df68e4
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "393a352f82f1f0000157834751a29578"
+SRC_URI[sha256sum] = "772d230019c52452dc661e864debf1fd520460bddce8d8abda70a4dcc00e8d5f"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
index bbb05a6..73f5898 100644
--- a/recipes-qt/qt5/qtsvg.inc
+++ b/recipes-qt/qt5/qtsvg.inc
@@ -1,3 +1,9 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsvg_5.2.1.bb b/recipes-qt/qt5/qtsvg_5.2.1.bb
deleted file mode 100644
index d12bd83..0000000
--- a/recipes-qt/qt5/qtsvg_5.2.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "3f5487fe2bd5024f18f63a8d0eb4294d"
-SRC_URI[sha256sum] = "788f69557ff6d28073d6ef2b3300b42b987fba1d122f7884ba0269023cab44ef"
-
diff --git a/recipes-qt/qt5/qtsvg_5.3.0.bb b/recipes-qt/qt5/qtsvg_5.3.0.bb
new file mode 100644
index 0000000..77b591b
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "a35e2df8ff2d6b99e4b33443165359f4"
+SRC_URI[sha256sum] = "8006ca1cb13844772ac2926e662ab7a0eb16cb26157954cd415e0f6d641b4ed0"
diff --git a/recipes-qt/qt5/qttools-native.inc b/recipes-qt/qt5/qttools-native.inc
index 03b88cd..28fa3f8 100644
--- a/recipes-qt/qt5/qttools-native.inc
+++ b/recipes-qt/qt5/qttools-native.inc
@@ -13,3 +13,9 @@ do_configure() {
 do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-native_5.2.1.bb b/recipes-qt/qt5/qttools-native_5.2.1.bb
deleted file mode 100644
index d186a21..0000000
--- a/recipes-qt/qt5/qttools-native_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "f56b2e6c537f6853d9bf10380c39418b"
-SRC_URI[sha256sum] = "ff2f850f63798441aaaa0b18c741460acdd62c74d6a9e6a76521956e4bcb27d5"
diff --git a/recipes-qt/qt5/qttools-native_5.3.0.bb b/recipes-qt/qt5/qttools-native_5.3.0.bb
new file mode 100644
index 0000000..d3956a7
--- /dev/null
+++ b/recipes-qt/qt5/qttools-native_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
+SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
index 0192f22..d4d8017 100644
--- a/recipes-qt/qt5/qttools.inc
+++ b/recipes-qt/qt5/qttools.inc
@@ -6,4 +6,10 @@ SRC_URI += " \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
 "
 
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+
 FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 49f296d..0479bec 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From a5150c9701d5b2e6c77e521544034ea732d2266b Mon Sep 17 00:00:00 2001
+From 5eb3dd427bca8bbc13b7554e8e21993b2fc708e7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/2] Allow to build only lrelease + lupdate + lconvert
@@ -14,9 +14,9 @@ Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
  examples/examples.pro     |  4 ++--
  src/designer/src/src.pro  | 16 +++++++++-------
  src/linguist/linguist.pro |  2 +-
- src/src.pro               | 10 ++++++----
- tests/auto/auto.pro       | 22 ++++++++++++----------
- 5 files changed, 30 insertions(+), 24 deletions(-)
+ src/src.pro               | 14 ++++++++------
+ tests/auto/auto.pro       | 24 +++++++++++++-----------
+ 5 files changed, 33 insertions(+), 27 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
 index 4955969..8e86419 100644
@@ -61,7 +61,7 @@ index e02ca8e..49527c5 100644
      components \
      designer \
 diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
-index 2979a23..663bdd5 100644
+index 3a70580..a977878 100644
 --- a/src/linguist/linguist.pro
 +++ b/src/linguist/linguist.pro
 @@ -3,7 +3,7 @@ SUBDIRS  = \
@@ -74,7 +74,7 @@ index 2979a23..663bdd5 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index 866a199..ec08874 100644
+index a07a3bb..4c6b463 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -82,7 +82,7 @@ index 866a199..ec08874 100644
          message("Some graphics-related tools are unavailable without PNG support")
      } else {
 -        SUBDIRS = assistant \
-+        !linguistonly { 
++        !linguistonly {
 +            SUBDIRS = assistant \
                    pixeltool \
 -                  qtestlib \
@@ -93,6 +93,15 @@ index 866a199..ec08874 100644
  #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
  
          linguist.depends = designer
+@@ -15,7 +17,7 @@ qtHaveModule(widgets) {
+ }
+ 
+ SUBDIRS += linguist
+-if(!android|android_app):!ios: SUBDIRS += qtpaths
++!linguistonly:if(!android|android_app):!ios: SUBDIRS += qtpaths
+ 
+ mac {
+     SUBDIRS += macdeployqt
 @@ -25,7 +27,7 @@ android {
      SUBDIRS += androiddeployqt
  }
@@ -101,12 +110,18 @@ index 866a199..ec08874 100644
 +!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
  
  win32|winrt:SUBDIRS += windeployqt
+ winrt:SUBDIRS += winrtrunner qtd3dservice
+@@ -36,4 +38,4 @@ qtNomakeTools( \
+     macdeployqt \
+ )
  
+-!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index eaf440b..1778ad1 100644
+index c3acfe3..f2f88f7 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
-@@ -1,14 +1,16 @@
+@@ -1,15 +1,17 @@
  TEMPLATE=subdirs
 -SUBDIRS=\
 -    linguist \
@@ -117,7 +132,8 @@ index eaf440b..1778ad1 100644
 -    qhelpindexmodel \
 -    qhelpprojectdata \
 -    cmake \
--    installed_cmake
+-    installed_cmake \
+-    qtdiag
 +!linguistonly {
 +    SUBDIRS=\
 +        linguist \
@@ -129,10 +145,11 @@ index eaf440b..1778ad1 100644
 +        qhelpprojectdata \
 +        cmake \
 +        installed_cmake
++        qtdiag
 +}
  
  installed_cmake.depends = cmake
  
 -- 
-1.8.5.3
+1.9.3
 
diff --git a/recipes-qt/qt5/qttools_5.2.1.bb b/recipes-qt/qt5/qttools_5.2.1.bb
deleted file mode 100644
index d186a21..0000000
--- a/recipes-qt/qt5/qttools_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "f56b2e6c537f6853d9bf10380c39418b"
-SRC_URI[sha256sum] = "ff2f850f63798441aaaa0b18c741460acdd62c74d6a9e6a76521956e4bcb27d5"
diff --git a/recipes-qt/qt5/qttools_5.3.0.bb b/recipes-qt/qt5/qttools_5.3.0.bb
new file mode 100644
index 0000000..d3956a7
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "628a91ddfe34efc6622fdba8c6348855"
+SRC_URI[sha256sum] = "f64d2ca5dc59ab8980987649bcef4597a7c0194e802e64d93448cac892fd8250"
diff --git a/recipes-qt/qt5/qtwayland-native.inc b/recipes-qt/qt5/qtwayland-native.inc
index 78416e8..bddcc22 100644
--- a/recipes-qt/qt5/qtwayland-native.inc
+++ b/recipes-qt/qt5/qtwayland-native.inc
@@ -15,3 +15,9 @@ do_configure() {
 do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index abeb15f..bb52f0d 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -22,3 +22,9 @@ FILES_${PN}-plugins += " \
 FILES_${PN}-plugins-dbg += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
 "
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb b/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb
deleted file mode 100644
index c16f91c..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "ddad7d00ebd201a750242bd67b20ecf3"
-SRC_URI[sha256sum] = "d5ecff99b4d35bc5f184503cabc394a554be48c368aba140f95019501645a7f5"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
new file mode 100644
index 0000000..d1400fd
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4ab24c0bf04f21207a48f261ce0d7943"
+SRC_URI[sha256sum] = "7e491050000c9608bf36f78bb3db5938b92e0dce89d686d903c85dc8fdadef38"
diff --git a/recipes-qt/qt5/qtwebkit_5.2.1.bb b/recipes-qt/qt5/qtwebkit_5.2.1.bb
deleted file mode 100644
index ef166f2..0000000
--- a/recipes-qt/qt5/qtwebkit_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "a20d99a1c2afbd6a7c6f54e615f1bd63"
-SRC_URI[sha256sum] = "ac089723489ee9146020bd8fc715358249d8cea7f2a2e92a692e2a5595a46b5c"
diff --git a/recipes-qt/qt5/qtwebkit_5.3.0.bb b/recipes-qt/qt5/qtwebkit_5.3.0.bb
new file mode 100644
index 0000000..6e4b001
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "cc9197eaef9e7950e907635f9bde1e98"
+SRC_URI[sha256sum] = "ceb1aeeede1febddbc10c5c23e6bcb18a90a5eb4d162d6f0b5075ff4ff3ba335"
diff --git a/recipes-qt/qt5/qtx11extras.inc b/recipes-qt/qt5/qtx11extras.inc
index bbb05a6..73f5898 100644
--- a/recipes-qt/qt5/qtx11extras.inc
+++ b/recipes-qt/qt5/qtx11extras.inc
@@ -1,3 +1,9 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtx11extras_5.2.1.bb b/recipes-qt/qt5/qtx11extras_5.2.1.bb
deleted file mode 100644
index b619a4d..0000000
--- a/recipes-qt/qt5/qtx11extras_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "ad94a2f14afc3f2dfe9743027860c28a"
-SRC_URI[sha256sum] = "4f62647772d37d27921a77caf6e02c51fb207c5a1d604b0b3047a92d0163d4b9"
diff --git a/recipes-qt/qt5/qtx11extras_5.3.0.bb b/recipes-qt/qt5/qtx11extras_5.3.0.bb
new file mode 100644
index 0000000..61b5814
--- /dev/null
+++ b/recipes-qt/qt5/qtx11extras_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "83fc516c7f6ab82599b3f6e46744cb85"
+SRC_URI[sha256sum] = "92d1c051294d92a250a405c120673721865b37d8f5db4eaac4b3f7fe46707719"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
index bbb05a6..73f5898 100644
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ b/recipes-qt/qt5/qtxmlpatterns.inc
@@ -1,3 +1,9 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.2.1.bb b/recipes-qt/qt5/qtxmlpatterns_5.2.1.bb
deleted file mode 100644
index ab5570c..0000000
--- a/recipes-qt/qt5/qtxmlpatterns_5.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "d01c6b837db4a6dee69a3f0352b37e18"
-SRC_URI[sha256sum] = "bed7b5edd8efc3d5b45c60b5ed949aec6a4daadb5f3bd9029467e90c4ef566d2"
diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb
new file mode 100644
index 0000000..754350f
--- /dev/null
+++ b/recipes-qt/qt5/qtxmlpatterns_5.3.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "68c6e1311ecf8727368961739243d3b2"
+SRC_URI[sha256sum] = "ac66c182f28a3909dc939a111d2bf701056f6c68cecde54074c9c34637cdc988"
-- 
2.0.0


