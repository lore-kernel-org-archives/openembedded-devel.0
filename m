Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NxKKO-00083G-D7
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:20:57 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Apr 2010 15:16:37 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Apr 2010 15:16:36 +0200
Received: from jcn ([87.1.14.30]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 1 Apr 2010 15:16:34 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NxKG9-0005W0-EV; Thu, 01 Apr 2010 15:16:33 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Apr 2010 15:16:23 +0200
Message-Id: <1270127783-21172-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <20100330122319.f0e46761.ospite@studenti.unina.it>
References: <20100330122319.f0e46761.ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 01 Apr 2010 13:16:34.0975 (UTC)
	FILETIME=[8DA1EAF0:01CAD19D]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [PATCH] frameworkd-config-shr: fix a nasty typo
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
X-List-Received-Date: Thu, 01 Apr 2010 13:20:57 -0000

A misplaced '-' instead of '_' made bitbake conditional appending fail,
resulting in fso-abyss being added unconditionally to runtime
dependencies.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
The problem was in frameworkd-config, which was provided also by
frameworkd-config-shr, so here we are.

This one seems to be the correct fix for:
http://bugs.openembedded.org/show_bug.cgi?id=5385

Please check also the English in the commit message, you never know :)

Thanks,
   Antonio Ospite
   http://ao2.it

frameworkd-config-shr:

 recipes/shr/frameworkd-config-shr_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/shr/frameworkd-config-shr_git.bb b/recipes/shr/frameworkd-config-shr_git.bb
index 3be7ceb..35c00de 100644
--- a/recipes/shr/frameworkd-config-shr_git.bb
+++ b/recipes/shr/frameworkd-config-shr_git.bb
@@ -66,7 +66,7 @@ PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
 # - recommend MUXer on platforms that require one
 RDEPENDS_${PN}_append_om-gta01 = " fso-abyss"
 RDEPENDS_${PN}_append_om-gta02 = " fso-abyss"
-RDEPENDS_${PN}_append-om-3d7k  = " fso-abyss"
+RDEPENDS_${PN}_append_om-3d7k  = " fso-abyss"
 # - add wmiconfig for wireless configuration
 RDEPENDS_${PN}_append_om-gta02 = " wmiconfig"
 
-- 
1.7.0.3



