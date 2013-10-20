Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED746B0E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 16:49:02 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id BDB483B3416D; Sun, 20 Oct 2013 18:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from localhost (dslb-092-077-026-174.pools.arcor-ip.net
	[92.77.26.174]) by gravedo.de (Postfix) with ESMTPSA id 2D7B63B34164;
	Sun, 20 Oct 2013 18:48:57 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Oct 2013 18:48:55 +0200
Message-Id: <1382287735-14508-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCH] maliit-framework-qt5: package only ${libdir}/qt5/mkspecs within ${PN}-dev
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
X-List-Received-Date: Sun, 20 Oct 2013 16:49:03 -0000

When we're building maliit with it's input context plugin enable it gets installed into
${libdir}/qt5/plugins/platforminputcontexts which couldn't be added to ${PN} cause it's
already in ${PN}-dev and the only part which should go into ${PN}-dev is
${libdir}/qt5/mksepcs and nothing else from ${libdir}/qt5.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 35d21ca..2d83603 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -43,7 +43,7 @@ FILES_${PN}-dbg += "\
 FILES_${PN}-dev += "\
     ${includedir}/maliit \
     ${libdir}/pkgconfig \
-    ${libdir}/qt5 \
+    ${libdir}/qt5/mkspecs \
 "
 
 EXTRA_QMAKEVARS_PRE = "\
-- 
1.8.1.2


