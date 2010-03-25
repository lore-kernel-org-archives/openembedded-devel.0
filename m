Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nuurt-0004ES-58
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 22:45:33 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 22:42:22 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 22:42:22 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 22:42:21 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuuom-0006BX-A3; Thu, 25 Mar 2010 22:42:20 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 22:42:12 +0100
Message-Id: <1269553332-23747-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <20100315101126.1bb65e82.ospite@studenti.unina.it>
References: <20100315101126.1bb65e82.ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 21:42:21.0593 (UTC)
	FILETIME=[0CBC1890:01CACC64]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RESEND, PATCH v2] distros: remove leading dots in DISTRO_VERSIONs
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
X-List-Received-Date: Thu, 25 Mar 2010 21:45:33 -0000

Having a leading dot in DISTRO_VERSION will result in a '-.' string when
building archive names; this may lead to mistakenly think that something is
missing in the archive name.

Example:
minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolchain.tar.bz2
       ^^

Remove the leading dot in DISTRO_VERSIONs to avoid such possible
confusion.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
Acked-by: Khem Raj <raj.khem@gmail.com>
---

There have been no ojections on this one yet.
Can anyone apply it please?
This way my local branch will have one less patch :)

Thank you,
   Antonio Ospite
   http://ao2.it

 conf/distro/minimal.conf        |    2 +-
 conf/distro/oplinux-uclibc.conf |    2 +-
 conf/distro/oplinux.conf        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 8e0ae2e..7aa6c58 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -11,7 +11,7 @@
 # NAME and VERSION
 #############################################################################
 DISTRO_NAME ?= "minimal"
-DISTRO_VERSION = ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION = "dev-snapshot-${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE ?= "debug"
 
diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
index b8617cc..480602b 100644
--- a/conf/distro/oplinux-uclibc.conf
+++ b/conf/distro/oplinux-uclibc.conf
@@ -21,7 +21,7 @@ require conf/distro/include/sane-srcdates.inc
 # Header
 #
 DISTRO_NAME = "OPLinux-uClibC"
-DISTRO_VERSION = ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION = "dev-snapshot-${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE = "debug"
 
diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
index 43e8fad..b64477c 100644
--- a/conf/distro/oplinux.conf
+++ b/conf/distro/oplinux.conf
@@ -25,7 +25,7 @@ require conf/distro/include/sane-srcdates.inc
 # Header
 #
 DISTRO_NAME = "OPLinux"
-DISTRO_VERSION ?= ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION ?= "dev-snapshot-${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE = "debug"
 
-- 
1.7.0.3



