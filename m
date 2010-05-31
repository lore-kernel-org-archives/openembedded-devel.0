Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nD-0002SR-8H
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:25 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:08 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:07 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j3-0007Wy-Os; Mon, 31 May 2010 11:56:05 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:47 +0200
Message-Id: <1275299757-28908-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:07.0553 (UTC)
	FILETIME=[7D83F710:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 02/12] device_table-minimal.txt: fix input device nodes path
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
X-List-Received-Date: Mon, 31 May 2010 10:00:25 -0000

Input event device nodes are usually under /dev/input.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 files/device_table-minimal.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/files/device_table-minimal.txt b/files/device_table-minimal.txt
index a474377..b3a6820 100644
--- a/files/device_table-minimal.txt
+++ b/files/device_table-minimal.txt
@@ -30,7 +30,7 @@
 /dev/urandom	c	644	0	0	1	9	-	-	-
 /dev/ptmx	c	644	0	0	5	2	-	-	-
 
-/dev/event 	c	660	0	0	13	64	0	1	8
+/dev/input/event 	c	660	0	0	13	64	0	1	8
 
 /dev/mmcblk0	b	660	0	6	179	0	-	-	-
 /dev/mmcblk0p	b	660	0	6	179	1	1	1	7
-- 
1.7.1



