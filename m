Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8AD6D040
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 12:15:17 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 3B9523B34180; Sat, 19 Oct 2013 14:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=ham version=3.3.1
Received: from localhost (p5B31E8A1.dip0.t-ipconnect.de [91.49.232.161])
	by gravedo.de (Postfix) with ESMTPSA id CAC073B34186;
	Sat, 19 Oct 2013 14:15:11 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2013 14:15:00 +0200
Message-Id: <1382184900-31261-4-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382184900-31261-1-git-send-email-morphis@gravedo.de>
References: <1382184900-31261-1-git-send-email-morphis@gravedo.de>
Subject: [meta-qt5][PATCH 3/3] maliit-plugins-qt5: add dependency on libqt5svg-plugins
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
X-List-Received-Date: Sat, 19 Oct 2013 12:15:17 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index fa3d1fd..273b3e4 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -13,8 +13,7 @@ OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
 
 DEPENDS = "maliit-framework-qt5"
 
-# FIXME: Do we need something like this with qt5?
-#RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
+RDEPENDS_${PN} += "qtsvg-plugins"
 
 SRC_URI = "git://github.com/maliit/plugins.git;branch=master"
 
-- 
1.8.1.2


