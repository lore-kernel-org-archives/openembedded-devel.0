Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 09B0E612D1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 12:12:00 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 6CB563B3417D; Sat, 19 Oct 2013 14:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from localhost (p5B31E8A1.dip0.t-ipconnect.de [91.49.232.161])
	by gravedo.de (Postfix) with ESMTPSA id 3FFF63B3417C;
	Sat, 19 Oct 2013 14:11:57 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2013 14:11:48 +0200
Message-Id: <1382184710-30716-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCH 1/3] maliit-frameworks-qt5: provide ${datadir} also by EXTRA_QMAKEVARS_PRE
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
X-List-Received-Date: Sat, 19 Oct 2013 12:12:01 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index ccd0c4c..56d1082 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -49,6 +49,7 @@ FILES_${PN}-dev += "\
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     LIBDIR=${libdir} \
+    DATADIR=${datadir} \
     QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
     MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
     SCHEMADIR=${sysconfdir}/gconf/schemas \
-- 
1.8.1.2


