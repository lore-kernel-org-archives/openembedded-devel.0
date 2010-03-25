Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nuqn4-0005dQ-K1
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:24:18 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:21:09 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:34 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:31 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqj5-0006tS-Eq; Thu, 25 Mar 2010 18:20:11 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:57 +0100
Message-Id: <1269537597-26456-6-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:34.0349 (UTC)
	FILETIME=[7A7CDDD0:01CACC3F]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 5/5] ezx: update device_table-ezx.txt
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
X-List-Received-Date: Thu, 25 Mar 2010 17:24:19 -0000

Update mux nodes to be used with the ts27010mux driver.
Fix names for ttyIPC0 and video0 nodes.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 files/device_table-ezx.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/files/device_table-ezx.txt b/files/device_table-ezx.txt
index f477a67..7246bc8 100644
--- a/files/device_table-ezx.txt
+++ b/files/device_table-ezx.txt
@@ -8,7 +8,7 @@
 #    b	Block special device file
 #    p	Fifo (named pipe)
 
-/dev/mux	c	660	0	5	250	0	1	1	8
-/dev/ttyIPC	c	660	0	5	251	0	-	-	-
+/dev/mux	c	660	0	5	234	0	0	1	9
+/dev/ttyIPC0	c	660	0	5	251	0	-	-	-
 /dev/input/uinput	c	660 	0	0	10	223	-	-	-
-/dev/video	c	660	0	44	81	0	-	-	-
+/dev/video0	c	660	0	44	81	0	-	-	-
-- 
1.7.0.3



