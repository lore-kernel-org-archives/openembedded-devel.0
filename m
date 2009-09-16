Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Mnzpe-0003hn-RZ
	for openembedded-devel@openembedded.org; Wed, 16 Sep 2009 21:06:26 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Sep 2009 21:05:51 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Sep 2009 21:05:04 +0200
Received: from badebec ([79.2.138.92]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 16 Sep 2009 21:05:03 +0200
Received: by badebec with local (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>)
	id 1MnzoE-0007Dv-QW; Wed, 16 Sep 2009 21:04:54 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@openembedded.org
Date: Wed, 16 Sep 2009 21:04:35 +0200
Message-Id: <1253127875-27443-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 16 Sep 2009 19:05:03.0922 (UTC)
	FILETIME=[98F54920:01CA3700]
X-SA-Exim-Connect-IP: 85.33.2.25
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix makedevs interpretation of device table
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
X-List-Received-Date: Wed, 16 Sep 2009 19:06:26 -0000

Currently makedevs is interpreting the 'count' field in device table as "count
from minor number 0", fix it so it becomes "count from the 'start' minor
number".

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/makedevs/makedevs-1.0.0/makedevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/makedevs/makedevs-1.0.0/makedevs.c b/recipes/makedevs/makedevs-1.0.0/makedevs.c
index c7ad722..80f21f0 100644
--- a/recipes/makedevs/makedevs-1.0.0/makedevs.c
+++ b/recipes/makedevs/makedevs-1.0.0/makedevs.c
@@ -221,7 +221,7 @@ static int interpret_table_entry(char *line)
 			dev_t rdev;
 			char buf[80];
 
-			for (i = start; i < count; i++) {
+			for (i = start; i < start+count; i++) {
 				sprintf(buf, "%s%d", name, i);
 				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
 				 * major/minor representation...  */
-- 
1.6.3.3



