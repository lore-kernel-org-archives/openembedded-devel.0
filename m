Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuvyS-0003en-Rb
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 23:56:25 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:53:13 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:52:36 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 23:52:35 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuvul-0001e3-9o; Thu, 25 Mar 2010 23:52:35 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 23:52:33 +0100
Message-Id: <1269557553-6295-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 22:52:35.0954 (UTC)
	FILETIME=[DCB08D20:01CACC6D]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] numptyphysics: update SRC_URI
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
X-List-Received-Date: Thu, 25 Mar 2010 22:56:25 -0000

The old SRC_URI doesn't work anymore, use vcs.maemo.org instead of
garage.maemo.org as stated on https://garage.maemo.org/scm/?group_id=638

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/numptyphysics/numptyphysics_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numptyphysics/numptyphysics_svn.bb
index dec9cf1..66bed53 100644
--- a/recipes/numptyphysics/numptyphysics_svn.bb
+++ b/recipes/numptyphysics/numptyphysics_svn.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "http://numptyphysics.garage.maemo.org/"
 SECTION = "x11/games"
 SRCREV = "109"
 PV = "0.2+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
 SRC_URI = "\
 # Maemo garage is sadly only available with https. Can make you trouble while fetching without accepting the certificate.
-  svn://garage.maemo.org/svn/${PN};module=trunk;proto=https \
+  svn://vcs.maemo.org/svn/${PN};module=trunk;proto=https \
   http://wwwpub.zih.tu-dresden.de/~mkluge/numptyphysics_setup.tgz \
   file://replay_off.patch;patch=1;pnum=0 \
   file://next.png \
-- 
1.7.0.3



