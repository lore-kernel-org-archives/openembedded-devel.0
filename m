Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC1B6EFC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 20:25:54 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2014 21:25:51 +0100
Message-Id: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][PATCH] qtwebkit: accept gstreamer 0.10 as an option
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
X-List-Received-Date: Wed, 26 Feb 2014 20:26:01 -0000

There's no configuration knob, though. QtWebKit will prefer
gstreamer 1.0 if available.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtwebkit.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index aea9dad..5e96f39 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
 
-DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
+DEPENDS += "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sqlite3 glib-2.0 libxslt"
+
+PACKAGECONFIG ??= "gstreamer10"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
+PACKAGECONFIG[gstreamer10] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
 QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
-- 
1.8.3.2


