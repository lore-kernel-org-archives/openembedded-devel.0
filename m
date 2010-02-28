Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NlnWe-0003LS-Ru
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 19:06:01 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:03:08 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:03:07 +0100
Received: from badebec ([82.55.137.238]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 28 Feb 2010 19:03:07 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NlnTs-0001Xz-OU; Sun, 28 Feb 2010 19:03:04 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2010 19:02:52 +0100
Message-Id: <1267380172-5921-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <20100222153618.42909a77.ospite@studenti.unina.it>
References: <20100222153618.42909a77.ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 28 Feb 2010 18:03:07.0222 (UTC)
	FILETIME=[47CA9F60:01CAB8A0]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] meta-toolchain: Show build arch in archive name
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
X-List-Received-Date: Sun, 28 Feb 2010 18:06:01 -0000

Show build arch in toolchain archive name so to easily recognize
toolchains for the same targets but meant to be used on different build
systems.

Examples:
 minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolchain.tar.bz2
 minimal-.dev-snapshot-20100216-x86_64-linux-armv5te-linux-gnueabi-toolchain.tar.bz2

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find it more
logical to put it just before the target system info.

 recipes/meta/meta-toolchain.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index 066ffe9..688995c 100644
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
1.7.0



