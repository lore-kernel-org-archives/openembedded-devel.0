Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3556CE72
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 12:40:47 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id EEB2794022B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:40:45 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 14:40:55 +0200
Message-Id: <1381236055-734-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] cinematicexperience: fix typo
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
X-List-Received-Date: Tue, 08 Oct 2013 12:40:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 3fa6f06..9ee5532 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -32,7 +32,7 @@ do_install() {
     echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
     echo "export QML_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
     echo "export QML2_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
-    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bindir}/Qt5_CinematicExperience
+    echo "${datadir}/${P}/Qt5_CinematicExperience \$* " >> ${D}${bindir}/Qt5_CinematicExperience
     chmod +x ${D}${bindir}/Qt5_CinematicExperience
 }
 
-- 
1.8.4.rc3


