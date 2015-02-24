Return-Path: <net147@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 41E7C736F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:22:21 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so33040203pdb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 04:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IM/lXVpFR3KikvtaT/sY75lFi9EqIhOsUHnbqRreHNI=;
	b=0ykivSYHJLp6CMlKpW2h4/OPXehrbOPeVD3gbSQfGTFYpZcyTNZ3I1Bx03EvnTTuP9
	Zk+gU/6lE28JZ/HadPsBgUjUAVzY6Ku/rHbLAs/9xf9fCLieFowu1OFOH3zZYEKZxoGD
	hy7uhAVL8KsBE8Ws0eu4fnhKyjMfegcawsGw2+cEAh0TPuz2DMi5DzjvN/OlAaTIpF3y
	/c034EFA2tzsJSNt5xDUK+qqauXEM3UZgtcChXAj3xR3grSUZvXJ2cpsf6QtUzEjpGSP
	3kHeiSG58TtMBiZjTepKWJmP5LDShrkVK8ai1aHZ5dpKXEMFD94fubPUWFeouxNFz6b6
	gQrA==
X-Received: by 10.70.56.34 with SMTP id x2mr28250773pdp.127.1424780543330;
	Tue, 24 Feb 2015 04:22:23 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	om9sm38049819pbb.34.2015.02.24.04.22.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Feb 2015 04:22:22 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2015 23:20:51 +1100
Message-Id: <1424780451-16629-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.2.2
Subject: [meta-qt5][PATCH] qtwebkit.inc: add PACKAGECONFIG for qtwebchannel
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
X-List-Received-Date: Tue, 24 Feb 2015 12:22:27 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtwebkit.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
index bdc676b..963c899 100644
--- a/recipes-qt/qt5/qtwebkit.inc
+++ b/recipes-qt/qt5/qtwebkit.inc
@@ -8,12 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
 
 DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
 
-PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors"
+PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
 PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
 PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
 PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
 PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
+PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
 PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
 
 do_configure_prepend() {
@@ -28,6 +29,9 @@ do_configure_prepend() {
     sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTMULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
     # disable qtsensors test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtwebchannel test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/Target.pri
+    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/WebKit2.pri
     # disable libwebp test if it isn't enabled by PACKAGECONFIG
     sed -e 's/\s\(config_libwebp: \)/ OE_LIBWEBP_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
 }
-- 
2.2.2


