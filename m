Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuqmS-0004sd-02
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:23:41 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:29 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:29 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:26 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqiz-0006tK-5r; Thu, 25 Mar 2010 18:20:05 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:53 +0100
Message-Id: <1269537597-26456-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:29.0478 (UTC)
	FILETIME=[77959C60:01CACC3F]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 1/5] ezx: update openezx-kernel version
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
X-List-Received-Date: Thu, 25 Mar 2010 17:23:41 -0000

This version uses an adapted ts27010mux driver from Motorola Milestone.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 recipes/linux/openezx-kernel_git.bb  |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index da44903..7e08ca0 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -138,7 +138,7 @@ SRCREV_pn-ologicd ?= "4a32af91a9479ebd4d1d39057354ac9904d74cbb"
 SRCREV_pn-om-locations ?= "942e88a1b689ffe3f11a2d982cce389cc965b2ec"
 SRCREV_pn-openbsc ?= "5e68183a201ab92f29cd2467df5209f7b351a66d"
 SRCREV_pn-openbsc-onwaves ?= "0d9ed87d5c7d5b6e21dc3bbb282e215068742566"
-SRCREV_pn-openezx-kernel ?= "43b844d1d38f0343272d3f0f844f80666186c526"
+SRCREV_pn-openezx-kernel ?= "b390bb1ee708277297fdfd38e26d955b17d81c2e"
 SRCREV_pn-openmoko-footer ?= "2354"
 SRCREV_pn-openmoko-terminal2 ?= "4782"
 SRCREV_pn-openmoocow ?= "39648419825cddfea1cb1321e552a12b71fede14"
diff --git a/recipes/linux/openezx-kernel_git.bb b/recipes/linux/openezx-kernel_git.bb
index 64fac44..a986b4a 100644
--- a/recipes/linux/openezx-kernel_git.bb
+++ b/recipes/linux/openezx-kernel_git.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "OpenEZX 2.6 Linux Development Kernel for the Motorola EZX GSM phones"
 AUTHOR = "The OpenEZX Team <openezx-devel@lists.openezx.org>"
 HOMEPAGE = "http://www.openezx.org"
-KV = "2.6.29+2.6.30rc2"
+KV = "2.6.33"
 PV = "${KV}+gitr${SRCREV}"
-PR = "r3"
+PR = "r4"
 
 require linux.inc
 
-- 
1.7.0.3



