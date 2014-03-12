Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id D5FC86F735
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 22:47:57 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so188463pad.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CoGTI94y/Cr+z4odKcvfmiycM9XrrG/BPtcO3vt+riM=;
	b=XL3UTHQKVoJ6Xmjn1scoJhl53/E2gbzprxXCJY4vprkWrmtR0FDamarlQEdbBjp40K
	cQIZv8Wr8/AAXNcjSQ4ppBPDVOlP7/d6t+2R0WGx/3W1yk1+BSjJXQGUERmxCgdfYy25
	EWV3cAyWPIpcQRvM5Kr/ngZ/y/rOrH1aNCIPkMz8FftjQG2r/4IE2pMMwxkQUx6fl+RC
	M0idhUtZagEpELZrpW5tLbXDR7Eo3kqLO2ll/fEvsw50ovhBasYVD+fvkYyst+xv32ug
	gAowTeUdTbUFLPBDVyHd3VWbVqlzr3ATwUTXl60S4KHNMIb7nn3WHFxJ91Bkq6jTwQxs
	wksw==
X-Received: by 10.68.200.74 with SMTP id jq10mr6851135pbc.169.1394664478618;
	Wed, 12 Mar 2014 15:47:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id qw8sm584337pbb.27.2014.03.12.15.47.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Mar 2014 15:47:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2014 09:52:40 +1100
Message-Id: <1394664760-8615-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394664760-8615-1-git-send-email-net147@gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Wed, 12 Mar 2014 22:47:57 -0000

This adds the necessary target packages for development with all of the
Qt 5 modules.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 80 ++++++++++++++++++----
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 997df18..3fcc38f 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -9,32 +9,82 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 # Requires meta-ruby to work
 USE_RUBY = " \
-    qtwebkit-mkspecs \
+    qtquick1-dev \
+    qtquick1-mkspecs \
+    qtquick1-plugins \
+    qtquick1-qmlplugins \
+    qttools-dev \
+    qttools-mkspecs \
+    qttools-plugins \
+    qttools-staticdev \
+    qttools-tools \
     qtwebkit-dev \
+    qtwebkit-mkspecs \
+    qtwebkit-qmlplugins \
+"
+
+# Requires Wayland to work
+USE_WAYLAND = " \
+    qtwayland-dev \
+    qtwayland-mkspecs \
+    qtwayland-plugins \
+    qtwayland-tools \
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
+    qtmultimedia-dev \
+    qtmultimedia-mkspecs \
+    qtmultimedia-plugins \
+    qtmultimedia-qmlplugins \
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
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtxmlpatterns-dev \
+    qtxmlpatterns-mkspecs \
 "
-- 
1.9.0


