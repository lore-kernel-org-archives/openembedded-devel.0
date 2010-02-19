Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NiQFv-0001aX-AD
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 11:38:46 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Feb 2010 11:34:59 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Feb 2010 11:34:58 +0100
Received: from badebec ([82.60.124.222]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 19 Feb 2010 11:34:58 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NiQCF-0003NG-KZ; Fri, 19 Feb 2010 11:34:55 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2010 11:34:49 +0100
Message-Id: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 19 Feb 2010 10:34:58.0490 (UTC)
	FILETIME=[2F23F9A0:01CAB14F]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Fri, 19 Feb 2010 10:38:46 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more logical to
put it just before the target system info.

Regards,
   Antonio

 recipes/meta/meta-toolchain.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 3169425..574ecac 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -17,7 +17,7 @@ TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
 TOOLCHAIN_TARGET_EXCLUDE ?= ""
 FEED_ARCH ?= "${TARGET_ARCH}"
 SDK_SUFFIX = "toolchain"
-TOOLCHAIN_OUTPUTNAME ?= "${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
+TOOLCHAIN_OUTPUTNAME ?= "${DISTRO}-${DISTRO_VERSION}-${SDK_SYS}-${FEED_ARCH}-${TARGET_OS}-${SDK_SUFFIX}"
 
 RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 
-- 
1.6.6.2



