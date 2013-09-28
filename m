Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 0B02E6B6C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:25:27 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ2x4-00011w-GJ by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:25:28 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ2x4-0000dG-8v; Sat, 28 Sep 2013 23:25:26 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 23:25:19 +0100
Message-Id: <1380407119-2352-6-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 6/6] maliit-plugins-qt5: Set MALIIT_PLUGINS_DATA_DIR to avoid path leakage from host
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
X-List-Received-Date: Sat, 28 Sep 2013 22:25:27 -0000

If not overriden here MALIIT_PLUGINS_DATA_DIR would point to some host
paths resulting in e.g. qml files not being found.
---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index 6b019ef..fa3d1fd 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -24,6 +24,7 @@ PV = "0.99.0+git${SRCPV}"
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
+    MALIIT_PLUGINS_DATA_DIR=${datadir} \
     LIBDIR=${libdir} \
     CONFIG+=nodoc \
 "
-- 
1.8.4.rc3


