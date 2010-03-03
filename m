Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NmoU9-0004Rg-C4
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:19:34 +0100
Received: from FBCMMO05.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Mar 2010 14:16:41 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Mar 2010 14:16:42 +0100
Received: from badebec ([87.1.93.150]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 3 Mar 2010 14:16:40 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NmoRK-0003Xs-F6; Wed, 03 Mar 2010 14:16:38 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 14:16:35 +0100
Message-Id: <1267622195-13602-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 03 Mar 2010 13:16:40.0948 (UTC)
	FILETIME=[C3369340:01CABAD3]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sanity.bbclass: Fix a typo in required_utilities.
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
X-List-Received-Date: Wed, 03 Mar 2010 13:19:34 -0000

A missing space in required_utilities makes OE ask to install md5sumsqemu.
Prepend the needed whitespace when appending to required_utilities.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index a78e8ed..ad5389e 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -95,7 +95,7 @@ def check_sanity(e):
 				missing = missing + "gcc-3.x (needed for qemu-native),"
 
 		if "qemu-native" in assume_provided:
-			required_utilities += "qemu"
+			required_utilities += " qemu"
 
 		try:
 			if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-- 
1.7.0



