Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OiqrZ-00037f-FR
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 17:35:38 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 8D25380C4FF; Tue, 10 Aug 2010 17:35:28 +0200 (CEST)
Received: from localhost (unknown [82.113.106.4])
	by gravedo.de (Postfix) with ESMTPSA id 90CAC80C527;
	Tue, 10 Aug 2010 17:35:26 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Aug 2010 17:35:14 +0200
Message-Id: <1281454514-3614-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1281454514-3614-1-git-send-email-morphis@gravedo.de>
References: <1281454514-3614-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] linux-palmpre: bump git revision
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
X-List-Received-Date: Tue, 10 Aug 2010 15:35:38 -0000

The new version fixes a compile problem with software using the kernel typedefs u8 and __u8

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/linux/linux-palmpre_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-palmpre_git.bb b/recipes/linux/linux-palmpre_git.bb
index 4deaaf2..59e8d6c 100644
--- a/recipes/linux/linux-palmpre_git.bb
+++ b/recipes/linux/linux-palmpre_git.bb
@@ -11,7 +11,7 @@ file://defconfig \
 
 S = "${WORKDIR}/git/"
 
-SRCREV = "d2f6283b8ca5b59e7f181ed391adf0e23e346c6d"
+SRCREV = "96eba42952e860f652e66a72569319dfd35756dc"
 KV = "2.6.24"
 PR="r1"
 PV = "${KV}+gitr${SRCPV}"
-- 
1.7.0.4



