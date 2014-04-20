Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3CC65CFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:36:40 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id rr13so2884348pbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Bg3Mt0rBtxRCeabdRaBHZJSZabF0XFK/1Y9i5tp8LV8=;
	b=uV2O0p/ukYwVDUBltSs89NSqe0QVO8FROMaX03zDVoGQPF+8FfCWep69eRTtWIbuuV
	AmEmbybcEMzTlCJsg/Cg2+d9SyQY5bOVYIflySUVJmWcqG6Ab8ItmJ2JM8Pn7ceGRJL0
	W6Th3CRuiv4yomODYyHdsDN9voZnp/L3qH93seEL0DJacFkOgALHzOJTurm6keHZSVj9
	TDKe6IkWVa2TeM8ICZOiSm7Np+YmURVdQap7PawoT1jixJLeMESjXPxLVUBC8DJkxLP+
	TOCkGQ/ewEIwyI8gCp0S78SnbE+sm1UkpX81ZBQailDVGRD7FKpGjejIdOk7qrdqhlVg
	ztSw==
X-Received: by 10.69.25.69 with SMTP id io5mr33293483pbd.22.1398001001575;
	Sun, 20 Apr 2014 06:36:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ha2sm71883756pbb.8.2014.04.20.06.36.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 06:36:39 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Apr 2014 23:43:18 +1000
Message-Id: <1398001398-24221-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtlocation: add packageconfig for geoclue and gypsy
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
X-List-Received-Date: Sun, 20 Apr 2014 13:36:44 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtlocation.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
index 70a4375..5d3dcc5 100644
--- a/recipes-qt/qt5/qtlocation.inc
+++ b/recipes-qt/qt5/qtlocation.inc
@@ -2,3 +2,19 @@ require qt5.inc
 
 DEPENDS += "qtbase qt3d"
 # qtsystems qtmultimedia
+
+PACKAGECONFIG ??= ""
+# older geoclue 0.x is needed
+PACKAGECONFIG[geoclue] = "OE_GEOCLUE_ENABLED,,geoclue"
+PACKAGECONFIG[gypsy] = "OE_GYPSY_ENABLED,,gypsy"
+
+do_configure_prepend() {
+    # disable geoclue tests if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(geoclue)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    sed -i -e 's/^\(qtCompileTest(geoclue-satellite)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    # disable gypsy test if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qtlocation.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
-- 
1.9.1


