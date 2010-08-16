Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1Ol4rN-0005GQ-M5
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 20:56:38 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 673FB275D865; Mon, 16 Aug 2010 20:56:20 +0200 (CEST)
Received: from localhost (p5489A50E.dip.t-dialin.net [84.137.165.14])
	by gravedo.de (Postfix) with ESMTPSA id 7C823275D863;
	Mon, 16 Aug 2010 20:56:18 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 20:56:16 +0200
Message-Id: <1281984976-4996-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: bump git revision for palmpre machine
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
X-List-Received-Date: Mon, 16 Aug 2010 18:56:38 -0000

The current git revision for palmpre machine fails to compile. I updated it to the latest
revision available as u-boot is currently not usable on the palmpre machine at all.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/u-boot/u-boot_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 19386fc..5a46961 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -10,7 +10,7 @@ SRCREV_spitz = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_c7x0 = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_afeb9260 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
 SRCREV_afeb9260-180 = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
-SRCREV_palmpre = "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
+SRCREV_palmpre = "668a6b45915d10d75357f5b93f569bbf49ea2b06"
 SRCREV_cm-t35 = "3c014f1586d5bfe30dca7549396915c83f31cd30"
 SRCREV_mpc8641-hpcn = "f20393c5e787b3776c179d20f82a86bda124d651"
 SRCREV_p2020ds = "f20393c5e787b3776c179d20f82a86bda124d651"
-- 
1.7.0.4



