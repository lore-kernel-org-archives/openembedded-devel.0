Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 182F66F485
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 20:15:10 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2014 21:15:07 +0100
Message-Id: <1393618507-29414-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
Subject: [meta-qt5][PATCH 3/3] qtwebkit: add packageconfig for gstreamer, qtlocation and qtsensors
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
X-List-Received-Date: Fri, 28 Feb 2014 20:15:13 -0000

Use gstreamer for 1.x, gstreamer010 for 0.10.x.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtwebkit.inc | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index c35504e..90bd981 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -5,7 +5,29 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
 
-DEPENDS += "qtdeclarative qtlocation qtsensors icu ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
+
+PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
+PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
+PACKAGECONFIG[qtlocation] = ",,qtlocation"
+PACKAGECONFIG[qtsensors] = ",,qtsensors"
+
+do_configure_prepend() {
+    # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtlocation test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtsensors test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer', 'CONFIG+=OE_GSTREAMER_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtlocation', 'CONFIG+=OE_QTLOCATION_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtsensors', 'CONFIG+=OE_QTSENSORS_ENABLED', '', d)}"
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
-- 
1.8.3.2


