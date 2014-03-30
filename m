Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED436EDF9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 13:17:14 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kq14so7004104pab.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g7sVyiIkwLdnP6C7P947eq7A69/K6L4uvPPcdGVhifw=;
	b=KpKlnnJbiMTp7SMBpjZxTC3PGXTiQbhfOKPN5ogbCdWpQmL6G9ieRLiHfh9cq4KqqL
	HX+Vypjku+hHFJ7sAl8GZ58h9/n7czlcOm/dQ+cAmyY0jWybGsj6f+Yiwn91Hyve3tGu
	OlmHH5pnUsYDa+QpLzpG6dQtJHVvOZiG6LLPTTelcMMnMs2LWePeKXn1emNpctyzaqer
	V7I57EK+gV3UA5euwGKcypfiqDcVmGW9D3Q/ngZ3cbE9sEKhKtOKbgWba4vCXX2hTLrT
	2gBvouB17BzJTaIHnU/cJ2nZ5RVxNelfczk8vIrvVrODZzzWnmjG/+2544ho1cJHz990
	9IVA==
X-Received: by 10.66.253.33 with SMTP id zx1mr19595360pac.28.1396185436048;
	Sun, 30 Mar 2014 06:17:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vg1sm37126612pbc.44.2014.03.30.06.17.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 06:17:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 00:22:52 +1100
Message-Id: <1396185772-20185-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qtwebkit: add packageconfig for qtmultimedia
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
X-List-Received-Date: Sun, 30 Mar 2014 13:17:15 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index 90bd981..a6322cb 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
 
 DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt"
 
-PACKAGECONFIG ??= "gstreamer qtlocation qtsensors"
+PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors"
 PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
 PACKAGECONFIG[qtlocation] = ",,qtlocation"
+PACKAGECONFIG[qtmultimedia] = ",,qtmultimedia"
 PACKAGECONFIG[qtsensors] = ",,qtsensors"
 
 do_configure_prepend() {
@@ -20,6 +21,8 @@ do_configure_prepend() {
     sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable qtlocation test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtmultimedia test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTMULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable qtsensors test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
@@ -27,6 +30,7 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer', 'CONFIG+=OE_GSTREAMER_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtlocation', 'CONFIG+=OE_QTLOCATION_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtmultimedia', 'CONFIG+=OE_QTMULTIMEDIA_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtsensors', 'CONFIG+=OE_QTSENSORS_ENABLED', '', d)}"
 
 # qtwebkit gets terribly big when linking with all debug info, disable by default
-- 
1.9.0


