Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCK-0003ay-Sn
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id B1BD8EA04B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:13 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 4F9E7604C9; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:21 +0200
Message-Id: <9d0da1b350746c687374357ce9e4fb3a7729f8ac.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 03/14] libecj-bootstrap_3.6.1: Update SRC_URI to archive.eclipse.org
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 17:50:36 -0000

This updates SRC_URI to archive.eclipse.org since mirrors.ibiblio.org
seems to be down.
This commit is the result of rebasing my patch f5ea9a from master.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
Acked-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj-bootstrap_3.6.1.bb
index 66e3fc1..b3e4c26 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
@@ -3,7 +3,7 @@ require libecj-bootstrap.inc
 PR = "r0"
 
 SRC_URI = " \
-	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
+	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
 
           "
 
-- 
1.7.10



