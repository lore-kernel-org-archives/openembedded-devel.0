Return-Path: <net147@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 27C4F60D9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 02:55:20 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id um1so2370866pbc.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 18:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OIuAgsqGlkNW3Rv0QpbWl03EZ+k6ZfCgFDw+UXOO13Q=;
	b=KqnYeZxnVMGnPAy39ur7eIDFseDUutSgxbNugdhANEjD6NwhWBEPJ6XJtd5cG67i8o
	L3KNb+KmcNNpvl5k4+eVrj7WJ9CuTZxJAnc50/un73tQSBrZvY1YfnWbKz93rDPBTplA
	V5ri8yJnIwVHNq6QdrtjJWcgdvP8aQ7rLILChG+3vO+RBgrMYpdqEezpFsM0qJhIIAOE
	Qas9UMj2BN9/cabKDw2YWpa5pYTzdF3bs206JkkPjEHkYPFpktJgeItLcVWA6r+IVurz
	w3F6Z2quz7v4epjcUcaBJY3C6SYFcofxLoQo8NFupX8dzd/HhRuoUoWCmodW7Q4GC0rY
	2w/A==
X-Received: by 10.68.242.33 with SMTP id wn1mr106853pbc.154.1393728922242;
	Sat, 01 Mar 2014 18:55:22 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ac5sm21010521pbc.37.2014.03.01.18.55.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 18:55:21 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 13:59:48 +1100
Message-Id: <1393729188-12904-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393729188-12904-1-git-send-email-net147@gmail.com>
References: <1393729188-12904-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH v2 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 02:55:21 -0000

This adds the necessary target packages for development with all of the
Qt 5 modules.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 60 +++++++++++++++++-----
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 997df18..13cac33 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -11,30 +11,62 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 USE_RUBY = " \
     qtwebkit-mkspecs \
     qtwebkit-dev \
+    qtwebkit-qmlplugins \
+"
+
+# Requires X11 to work
+USE_X11 = " \
+    qtx11extras-dev \
+    qtx11extras-mkspecs \
 "
 
 RDEPENDS_${PN} += " \
     packagegroup-core-standalone-sdk-target \
     libsqlite3-dev \
-    qtbase-mkspecs \
-    qtscript-mkspecs \
-    qtxmlpatterns-mkspecs \
-    qtdeclarative-mkspecs \
-    qtsensors-mkspecs \
+    qt3d-dev \
     qt3d-mkspecs \
-    qtlocation-mkspecs \
-    qtsvg-mkspecs \
+    qt3d-qmlplugins \
     qtbase-dev \
+    qtbase-fonts \
+    qtbase-mkspecs \
+    qtbase-plugins \
+    qtbase-staticdev \
+    qtconnectivity-dev \
+    qtconnectivity-mkspecs \
+    qtconnectivity-qmlplugins \
     qtdeclarative-dev \
-    qtscript-dev \
-    qt3d-dev \
+    qtdeclarative-mkspecs \
+    qtdeclarative-plugins \
+    qtdeclarative-qmlplugins \
+    qtdeclarative-staticdev \
+    qtgraphicaleffects-qmlplugins \
+    qtimageformats-dev \
+    qtimageformats-plugins \
     qtlocation-dev \
+    qtlocation-mkspecs \
+    qtlocation-plugins \
+    qtlocation-qmlplugins \
+    qtquick1-dev \
+    qtquick1-mkspecs \
+    qtquick1-plugins \
+    qtquick1-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtscript-dev \
+    qtscript-mkspecs \
     qtsensors-dev \
+    qtsensors-mkspecs \
+    qtsensors-plugins \
+    qtsensors-qmlplugins \
+    qtserialport-dev \
+    qtserialport-mkspecs \
     qtsvg-dev \
-    qtxmlpatterns-dev \
-    qtdeclarative-dev \
-    qtdeclarative-plugins \
-    qtdeclarative-qmlplugins \
-    qtgraphicaleffects-dev \
+    qtsvg-mkspecs \
+    qtsvg-plugins \
+    qtsystems-dev \
+    qtsystems-mkspecs \
+    qtsystems-qmlplugins \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtxmlpatterns-dev \
+    qtxmlpatterns-mkspecs \
 "
-- 
1.9.0


