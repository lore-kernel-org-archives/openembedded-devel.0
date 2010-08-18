Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Olraq-0000uk-SN
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 00:58:49 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OlraR-0002qj-3P from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 15:58:23 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 18 Aug 2010 15:58:22 -0700
Received: from localhost.localdomain ([172.30.80.170]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 18 Aug 2010 16:58:21 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 15:58:16 -0700
Message-Id: <1282172296-11638-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 18 Aug 2010 22:58:21.0582 (UTC)
	FILETIME=[DB02B2E0:01CB3F28]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base-files: Prefer ext4 > ext3 > ext2
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
X-List-Received-Date: Wed, 18 Aug 2010 22:58:49 -0000

Have /etc/filesystems try and mount ext4 then ext3 then ext2

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/base-files/base-files/filesystems |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/base-files/base-files/filesystems b/recipes/base-files/base-files/filesystems
index 653593a..10726c6 100644
--- a/recipes/base-files/base-files/filesystems
+++ b/recipes/base-files/base-files/filesystems
@@ -1,6 +1,7 @@
 minix
 fat
 vfat
-ext2
+ext4
 ext3
+ext2
 *
-- 
1.6.3.3



