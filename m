Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 45F3E6E85E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 04:18:01 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so2441975pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 20:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=reIjrGFwIGrU1zmL+ZfawexL4hYXZPIjey8SdDAvGr4=;
	b=COFvgO8dUJRHbQaF6ZbNbs7Bp+BkJxYPHSh6hE89eN9k7WOrD8Lon+uGGmw/AbM0fH
	kbR7iHgTawLqR+jrsc32bac/X1qyVeLWbJeiimSkRHEUIu1SHX9aXMUBCIDFCrZyIEH6
	2hGa/3rw50KM/4aNPw09kI4M+fXOXzkMoT9BSTcHxi1lcqF76XxJaI0j5FCDbzGwjJQB
	F/u8xxN9CQXCiCe/yEjgHA+BHVHxiqcZOwlOuuxOccaJJouXbMvjQcAL6kXNPZO5uwSv
	nFXPjO6KzTT5ZX6PKvYwdZZwd0JDsaFZDdi2D+5fqrLlbETuXv+0QuVcT5mXX49caIaX
	YDDg==
X-Received: by 10.66.65.204 with SMTP id z12mr12286952pas.60.1393733883352;
	Sat, 01 Mar 2014 20:18:03 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id f5sm52223205pat.11.2014.03.01.20.18.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 20:18:02 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 15:22:45 +1100
Message-Id: <1393734165-15082-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393734165-15082-1-git-send-email-net147@gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH v4 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 04:18:03 -0000

This adds the necessary target packages for development with all of the
Qt 5 modules.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 80 ++++++++++++++++++----
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 997df18..25983dc 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -9,32 +9,82 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 # Requires meta-ruby to work
 USE_RUBY = " \
-    qtwebkit-mkspecs \
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
+    qttools-dev \
+    qttools-mkspecs \
+    qttools-plugins \
+    qttools-staticdev \
+    qttools-tools \
+    ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtxmlpatterns-dev \
+    qtxmlpatterns-mkspecs \
 "
-- 
1.9.0


