Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 558 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Mar 2016 09:01:46 UTC
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id DA65373FA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 09:01:46 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 9E55025B; Thu,  3 Mar 2016 09:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 6453C1D7;
	Thu,  3 Mar 2016 09:52:17 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Mar 2016 09:52:09 +0100
Message-Id: <1456995129-777-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.7.0
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [meta-qt5][master][jethro][PATCH] qtquick1: fix qtwebkit support
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
X-List-Received-Date: Thu, 03 Mar 2016 09:01:47 -0000

40b7a93a3c6cf05136c606824c1cea848b75bcb6 ("qtquick1: allow to disable
qtwebkit support") allowed to disable qtwebkit but actually disabled it in
every cases.

Use the same mechanism as qttools to implement the feature.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 recipes-qt/qt5/qtquick1_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e0a264d4fa2d..cb5e395b9d67 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -16,11 +16,13 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtscript qtsvg qtxmlpatterns"
 # qttools
 
-PACKAGECONFIG ??= "webkit"
-PACKAGECONFIG[webkit] = "CONFIG+=enable-webkit,CONFIG-=enable-webkit,qtwebkit"
+PACKAGECONFIG ??= "qtwebkit"
+PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
 do_configure_prepend() {
-    sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
+    sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
 SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
-- 
2.7.0


