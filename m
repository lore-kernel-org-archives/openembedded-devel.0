Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2404B6EA13
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Mar 2014 03:51:14 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so2414832pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 19:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LvP5JbYNXJdOrle56rOg2f+jSBD0Bdm6yiQTMinee1w=;
	b=QA/SA7kGLF3xPCUGtwtRYCKsrxF3xHuT0clnqhmlh/X6ATodDIYPYMk7ncqyWTOmrC
	+c+wpqPVr7EyyMklWeW+Lkawf+8xJ9m79zH2w8LA+4nE5uQq/W2kR0SNveArh1W7vNVG
	OfwAC/pbLf0FKQo+MLx0LoIns4zImw8thOgcucSrlCb8SA7lgTXnNGZnmLvEU/j7sDU+
	H9I27QrsfjNKnPjCLPDDErMhU+ZO4P3CGTA6w6rU6B85jrFUY2B+elscCuvFy1IPA6uH
	qyifZJJb3eg3CKhG3GoobhzBZv/C9ozkkbWI9eCGk1dQ8MypvNxUP6kRx0RrvsAcb4gg
	w8qA==
X-Received: by 10.66.252.135 with SMTP id zs7mr12327687pac.13.1393732275915;
	Sat, 01 Mar 2014 19:51:15 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	dk1sm21315795pbc.46.2014.03.01.19.51.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 19:51:15 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Mar 2014 14:56:00 +1100
Message-Id: <1393732560-14368-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393732560-14368-1-git-send-email-net147@gmail.com>
References: <1393732560-14368-1-git-send-email-net147@gmail.com>
Subject: [meta-qt5][PATCH v3 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Sun, 02 Mar 2014 03:51:16 -0000

This adds the necessary target packages for development with all of the
Qt 5 modules.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../packagegroup-qt5-toolchain-target.bb           | 69 +++++++++++++++++-----
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 997df18..ac66f37 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -11,30 +11,71 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
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
     ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
+    qtxmlpatterns-dev \
+    qtxmlpatterns-mkspecs \
 "
-- 
1.9.0


