Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nlnz3-0004DF-6o
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 19:35:20 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:32:26 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 28 Feb 2010 19:32:25 +0100
Received: from badebec ([82.55.137.238]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 28 Feb 2010 19:32:25 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NlnwF-0001iu-3b; Sun, 28 Feb 2010 19:32:23 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2010 19:32:20 +0100
Message-Id: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 28 Feb 2010 18:32:25.0362 (UTC)
	FILETIME=[5FB97F20:01CAB8A4]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC, PATCH] distros: prettier notation for dev snapshots version strings
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
X-List-Received-Date: Sun, 28 Feb 2010 18:35:20 -0000

Make archives names look a little better. Compare the current:
  minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolchain.tar.bz2
to the proposed:
  minimal-dev.snapshot.20100216-i686-linux-armv5te-linux-gnueabi-toolchain.tar.bz2

The -. string in the current form could suggest that some part was missing
when building the archive name.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/minimal.conf        |    2 +-
 conf/distro/oplinux-uclibc.conf |    2 +-
 conf/distro/oplinux.conf        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 8e0ae2e..29ad9d2 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -11,7 +11,7 @@
 # NAME and VERSION
 #############################################################################
 DISTRO_NAME ?= "minimal"
-DISTRO_VERSION = ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION = "dev.snapshot.${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE ?= "debug"
 
diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
index b8617cc..59c6ede 100644
--- a/conf/distro/oplinux-uclibc.conf
+++ b/conf/distro/oplinux-uclibc.conf
@@ -21,7 +21,7 @@ require conf/distro/include/sane-srcdates.inc
 # Header
 #
 DISTRO_NAME = "OPLinux-uClibC"
-DISTRO_VERSION = ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION = "dev.snapshot.${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE = "debug"
 
diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
index 43e8fad..5b9d7cd 100644
--- a/conf/distro/oplinux.conf
+++ b/conf/distro/oplinux.conf
@@ -25,7 +25,7 @@ require conf/distro/include/sane-srcdates.inc
 # Header
 #
 DISTRO_NAME = "OPLinux"
-DISTRO_VERSION ?= ".dev-snapshot-${SRCDATE}"
+DISTRO_VERSION ?= "dev.snapshot.${SRCDATE}"
 #DISTRO_TYPE = "release"
 DISTRO_TYPE = "debug"
 
-- 
1.7.0



