Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB8xJ-00012j-QB
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 16:57:41 +0200
Received: (qmail 24997 invoked by uid 813007); 1 Jun 2009 14:48:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 14:48:57 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon,  1 Jun 2009 16:49:18 +0200
Message-Id: <1243867762-16540-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 02/13] ep93xx: use Maverick FP
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
X-List-Received-Date: Mon, 01 Jun 2009 14:57:42 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 conf/machine/ep93xx.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/ep93xx.conf b/conf/machine/ep93xx.conf
index 268ed52..11bae2f 100644
--- a/conf/machine/ep93xx.conf
+++ b/conf/machine/ep93xx.conf
@@ -23,7 +23,7 @@ EXTRA_IMAGECMD_jffs2 = "--eraseblock=0x40000 --pad=0x500000 "
 
 #tune for ep93xx cpus
 #can be used for crunch support later on
-#require conf/machine/include/tune-ep9312.inc
+require conf/machine/include/tune-ep9312.inc
 
 
-require conf/machine/include/tune-arm920t.inc
+#require conf/machine/include/tune-arm920t.inc
-- 
1.6.3.1





