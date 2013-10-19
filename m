Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 16E446D126
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 12:15:13 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id 029C83B34180; Sat, 19 Oct 2013 14:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from localhost (p5B31E8A1.dip0.t-ipconnect.de [91.49.232.161])
	by gravedo.de (Postfix) with ESMTPSA id E302A3B3417C;
	Sat, 19 Oct 2013 14:15:09 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2013 14:14:59 +0200
Message-Id: <1382184900-31261-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382184900-31261-1-git-send-email-morphis@gravedo.de>
References: <1382184900-31261-1-git-send-email-morphis@gravedo.de>
Subject: [meta-qt5][PATCH 2/3] maliit-framework-qt5: don't replace directory names for maliit-defines.prf
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
X-List-Received-Date: Sat, 19 Oct 2013 12:15:13 -0000

The values from maliit-defines.prf are only used at runtime and not at compilation time so
we don't have to replace them with the proper staging paths.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 56d1082..35d21ca 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -68,7 +68,6 @@ do_install_append() {
     #Fix absolute paths
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-defines.prf
 
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
-- 
1.8.1.2


