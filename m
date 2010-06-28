Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OTHPY-0003QS-J5
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 18:42:22 +0200
Received: from p5b032e9a.dip.t-dialin.net ([91.3.46.154] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OTHKy-00030v-EQ by authid <stefan@sostec.de> with cram_md5;
	Mon, 28 Jun 2010 18:37:40 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OTHKw-0001xH-Uc; Mon, 28 Jun 2010 18:37:34 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jun 2010 18:37:33 +0200
Message-Id: <1277743053-7488-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE] libecj-bootstrap_3.4.bb: Fix SRC_URI for new location
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
X-List-Received-Date: Mon, 28 Jun 2010 16:42:22 -0000

From: Stefan Schmidt <stefan@buglabs.net>


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---

This reminds me that the checksum per file patch for stable from Vitus needs
some acks make such changes easier.

 conf/checksums.ini                  |    4 ++++
 recipes/ecj/libecj-bootstrap_3.4.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ed06efc..909ade7 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5562,6 +5562,10 @@ sha256=dfe24798ca067c75c84f01bf4ee3734fde3e32e4f270f7222025218d3baffbbb
 md5=4c9fe7b0c4e760e13fa887b85f8db295
 sha256=b5725fa7f8b1f7dc28776e60591e9ef0c171629fe567ef49ab9be28516ff2cd6
 
+[http://archive.eclipse.org/eclipse/downloads/drops/R-3.4-200806172000/ecjsrc-3.4.zip]
+md5=f7b84d912e61dfdd77b7173065845250
+sha256=a6ce5f0682462e85e5e47229e5b16555f74c60188fa0bb17536beb1138c537b4
+
 [http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.4-200806172000/ecjsrc-3.4.zip]
 md5=f7b84d912e61dfdd77b7173065845250
 sha256=a6ce5f0682462e85e5e47229e5b16555f74c60188fa0bb17536beb1138c537b4
diff --git a/recipes/ecj/libecj-bootstrap_3.4.bb b/recipes/ecj/libecj-bootstrap_3.4.bb
index 381f424..57b0ab8 100644
--- a/recipes/ecj/libecj-bootstrap_3.4.bb
+++ b/recipes/ecj/libecj-bootstrap_3.4.bb
@@ -3,6 +3,6 @@ require libecj-bootstrap.inc
 PR = "r1"
 
 SRC_URI = "\
-	http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/drops/R-3.4-200806172000/ecjsrc-3.4.zip \
+	http://archive.eclipse.org/eclipse/downloads/drops/R-3.4-200806172000/ecjsrc-3.4.zip \
   "
 
-- 
1.7.1



