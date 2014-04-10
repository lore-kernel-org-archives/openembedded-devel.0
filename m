Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0565865E9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 22:15:47 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Apr 2014 00:15:44 +0200
Message-Id: <1397168144-28336-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][PATCH v2] qtwebkit: fix packageconfig
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
X-List-Received-Date: Thu, 10 Apr 2014 22:15:49 -0000

Arguments passed to the qmake command-line were ignored by prf
files, which get evaluated first. QtWebKit offers QMAKE_CACHE_EVAL,
which can be used to inject a qmake snippet before anything else
gets parsed.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: rebased on master-next

 recipes-qt/qt5/qtwebkit.inc | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index a6322cb..8054e93 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -8,13 +8,14 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
 DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors"
-PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
-PACKAGECONFIG[qtlocation] = ",,qtlocation"
-PACKAGECONFIG[qtmultimedia] = ",,qtmultimedia"
-PACKAGECONFIG[qtsensors] = ",,qtsensors"
+PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
+PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
+PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
+PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
 
 do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
     # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
@@ -27,12 +28,6 @@ do_configure_prepend() {
     sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
 
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer', 'CONFIG+=OE_GSTREAMER_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtlocation', 'CONFIG+=OE_QTLOCATION_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtmultimedia', 'CONFIG+=OE_QTMULTIMEDIA_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtsensors', 'CONFIG+=OE_QTSENSORS_ENABLED', '', d)}"
-
 # qtwebkit gets terribly big when linking with all debug info, disable by default
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
 EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
-- 
1.8.3.2


