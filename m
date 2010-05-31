Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nF-0002SR-SH
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:27 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:10 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:10 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:09 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j5-0007XK-9y; Mon, 31 May 2010 11:56:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:55 +0200
Message-Id: <1275299757-28908-11-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:10.0178 (UTC)
	FILETIME=[7F148220:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 10/12] ezx-gen-blob: bump SRCREV
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
X-List-Received-Date: Mon, 31 May 2010 10:00:27 -0000

The new version can now be compiled with OE with no problems, previously
the size of the binary produced with the toolchain from OE was too big
to be flashed.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/ezx/ezx-gen-blob_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ezx/ezx-gen-blob_svn.bb b/recipes/ezx/ezx-gen-blob_svn.bb
index 9b56c24..39cec89 100644
--- a/recipes/ezx/ezx-gen-blob_svn.bb
+++ b/recipes/ezx/ezx-gen-blob_svn.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "http://people.openezx.org/wyrm/gen-blob"
 LICENSE = "GPL"
 PROVIDES = "virtual/bootloader"
 DEPENDS = "virtual/kernel"
-SRCREV = "2517"
+SRCREV = "2519"
 PV = "1.0.0+svnr${SRCPV}"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "\
   svn://svn.openezx.org/trunk/src/blob/;module=gen-blob;proto=http \
-- 
1.7.1



