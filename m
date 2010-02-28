Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NloNM-0007R7-W4
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 20:00:29 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:57:35 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:57:34 +0100
Received: from badebec ([82.55.137.238]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 28 Feb 2010 19:57:34 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NloKa-0001pX-3p; Sun, 28 Feb 2010 19:57:32 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2010 19:57:28 +0100
Message-Id: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 28 Feb 2010 18:57:34.0545 (UTC)
	FILETIME=[E3448C10:01CAB8A7]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Sun, 28 Feb 2010 19:00:29 -0000

Pulseaudio versions newer than 0.9.15 don't build on ezx machines (and
presumably on any armv5te), stick to this version until the problem is
handled upstream and a patch is available.

Cfr: http://bugs.openembedded.org/show_bug.cgi?id=5404

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/machine/include/motorola-ezx-base.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 75c0f42..4d17211 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -2,6 +2,7 @@ TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
+PREFERRED_VERSION_pulseaudio = "0.9.15"
 
 #cat /proc/mtd
 #dev:    size   erasesize  name
-- 
1.7.0



