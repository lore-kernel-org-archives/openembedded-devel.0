Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SUQOJ-0003r4-Rq
	for openembedded-devel@openembedded.org; Wed, 16 May 2012 00:38:51 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 25047EA040;
	Wed, 16 May 2012 00:41:03 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 9119964387; Wed, 16 May 2012 00:28:51 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 May 2012 00:27:54 +0200
Message-Id: <1337120874-17531-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
References: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
Subject: [PATCH 1/1] libecj-bootstrap: Update SRC_URI to archive.eclipse.org
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
X-List-Received-Date: Tue, 15 May 2012 22:38:52 -0000

This updates SRC_URI to archive.eclipse.org since mirrors.ibiblio.org
seems to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj-bootstrap_3.6.1.bb
index d5da24e..996ab33 100644
--- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
+++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
@@ -3,7 +3,7 @@ require libecj-bootstrap.inc
 PR = "${INC_PR}.0"
 
 SRC_URI = " \
-	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
+	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
 
           "
 
-- 
1.7.9.5



