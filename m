Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 478 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Jul 2016 12:32:51 UTC
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id AEC9A60111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 12:32:51 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 3DAD0185F; Fri,  1 Jul 2016 14:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id E791A34A;
	Fri,  1 Jul 2016 14:24:51 +0200 (CEST)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:24:49 +0200
Message-Id: <1467375889-16392-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.8.1
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH] qtquick1: fix qtwebkit support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 12:32:51 -0000

40b7a93a3c6cf05136c606824c1cea848b75bcb6 ("qtquick1: allow to disable
qtwebkit support") allowed to disable qtwebkit but actually disabled it in
every cases.

Use the same mechanism as qttools to implement the feature.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---

Hi Martin,

We still have that issue in krogoth, with a NODISTRO build.

 recipes-qt/qt5/qtquick1_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 61b02a1..e9c4aa1 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -17,10 +17,12 @@ DEPENDS += "qtscript qtsvg qtxmlpatterns"
 # qttools
 
 PACKAGECONFIG ??= "webkit"
-PACKAGECONFIG[webkit] = "CONFIG+=enable-webkit,CONFIG-=enable-webkit,qtwebkit"
+PACKAGECONFIG[webkit] = ",,qtwebkit"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'webkit', '', 'CONFIG+=noqtwebkit', d)}"
 
 do_configure_prepend() {
-    sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
+    sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
 SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
-- 
1.9.1


