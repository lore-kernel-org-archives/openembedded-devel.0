Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N0ZmN-00081z-4y
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 13:55:02 +0200
Received: (qmail 16509 invoked by uid 813007); 21 Oct 2009 11:53:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 21 Oct 2009 11:53:59 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Oct 2009 13:55:47 +0200
Message-Id: <1256126147-22589-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255966150-1854-9-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-9-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux 2.6.26: do not apply 2.6.26.5 for topas910
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
X-List-Received-Date: Wed, 21 Oct 2009 11:55:02 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/linux/linux_2.6.26.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.26.bb b/recipes/linux/linux_2.6.26.bb
index e1bb68c..775d2d8 100644
--- a/recipes/linux/linux_2.6.26.bb
+++ b/recipes/linux/linux_2.6.26.bb
@@ -37,8 +37,7 @@ SRC_URI_append_mpc8313e-rdb = "\
 	file://mpc8313e-rdb-eth-fixed.patch;patch=1 \
 	"
 
-SRC_URI_append_topas910 = " ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-2.6.26.5.bz2;patch=1 \
-                            http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1"
+SRC_URI_append_topas910 = "http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1"
 
 # see http://bugzilla.kernel.org/show_bug.cgi?id=11143
 do_stage_append() {
-- 
1.6.5





