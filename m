Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OvbcJ-0000AC-OY
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 21:56:46 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A5C75275D105; Tue, 14 Sep 2010 21:55:44 +0200 (CEST)
Received: from localhost (p5489DCDA.dip.t-dialin.net [84.137.220.218])
	by gravedo.de (Postfix) with ESMTPSA id 9B2F6275D04A;
	Tue, 14 Sep 2010 21:55:43 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Sep 2010 21:55:39 +0200
Message-Id: <1284494140-30606-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fsogsmd: set PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
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
X-List-Received-Date: Tue, 14 Sep 2010 19:56:47 -0000

Set PACKAGE_ARCH for palmpre as we add some palmpre specific stuff for the palmpre machine
and no other machine needs this actually.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/freesmartphone/fsogsmd_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/freesmartphone/fsogsmd_git.bb b/recipes/freesmartphone/fsogsmd_git.bb
index d377d7a..f6e046b 100644
--- a/recipes/freesmartphone/fsogsmd_git.bb
+++ b/recipes/freesmartphone/fsogsmd_git.bb
@@ -12,6 +12,7 @@ EXTRA_OECONF_append = "\
 "
 
 # On the palmpre we need the msmcomm daemon to talk to the modem
+PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
 DEPENDS_append_palmpre = " msmcommd-specs"
 RDEPENDS_append_palmpre = " msmcommd"
 EXTRA_OECONF_append_palmpre = " --enable-modem-qualcomm-palm"
-- 
1.7.1



