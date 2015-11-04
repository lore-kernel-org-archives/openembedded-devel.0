Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 33B65766EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 17:30:42 +0000 (UTC)
Received: by wmff134 with SMTP id f134so116307997wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 09:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2i0hBj9gtCi/FEt2CgPdOR/OH/OJSaqgFVFrYam3Vxo=;
	b=a0eTatobZLVzFWerlF7XEwS4OMFQiA9BdkdBZbncRe4jeP0tOrZn7kE3zHP0YMWbyr
	QM5ytxDwLuxQFu80rCf+LsbLjfCzuMegf13/k7qXNaH2MSJs9epnd7eKG/6Zr4TxszcM
	A47abBARBwn3IIfmNnwTvYv8ICP8iUL92c0IzWNh6dwMLt2U//PVpZ8FF0/ZDw9RPCLn
	IfQfTRM/IDzahjgPBCShGBbXKMGOGr2rseRx9JvbBTmZHySmgeVfDQTny5x5x05ZGuDE
	/VhkH6iNnNqkTWzKaVEzhy87g7bz4xAJzHz9bjq+5Vo09LCCu0qFr/cjBojf/WVY/TP+
	vaOQ==
X-Received: by 10.28.212.8 with SMTP id l8mr5078719wmg.32.1446658242669;
	Wed, 04 Nov 2015 09:30:42 -0800 (PST)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	l78sm29767529wmb.5.2015.11.04.09.30.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 09:30:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 18:30:09 +0100
Message-Id: <1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/2] qtbase: align target qmake paths
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
X-List-Received-Date: Wed, 04 Nov 2015 17:30:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With this we can setup qt-creator to build/debug on target again.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...configure-paths-for-target-qmake-properly.patch | 46 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch

diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
new file mode 100644
index 0000000..a20164b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properly.patch
@@ -0,0 +1,46 @@
+From ecf12f418eb3a186af0276420576bac9e7974e71 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 4 Nov 2015 10:36:26 +0100
+Subject: [PATCH] configure paths for target qmake properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 6f338f3..82e3ae3 100755
+--- a/configure
++++ b/configure
+@@ -3842,12 +3842,12 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+ 
+ QT_CONFIGURE_STR_OFFSETS=
+ QT_CONFIGURE_STRS=
+-addConfStr "$CFG_SYSROOT"
++addConfStr ""
+ addConfStr "$QT_REL_HOST_BINS"
+ addConfStr "$QT_REL_HOST_LIBS"
+ addConfStr "$QT_REL_HOST_DATA"
+ addConfStr "$shortxspec"
+-addConfStr "$shortspec"
++addConfStr "$shortxspec"
+ 
+ #-------------------------------------------------------------------------------
+ # generate qconfig.cpp
+@@ -3866,7 +3866,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+ static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
+ #ifdef QT_BUILD_QMAKE
+ static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+-static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
++static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_EXT_PREFIX";
+ #endif
+ 
+ static const short qt_configure_str_offsets[] = {
+-- 
+2.1.0
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 0ba8ac8..3ef5923 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
     file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
+    file://0011-configure-paths-for-target-qmake-properly.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
2.1.0


