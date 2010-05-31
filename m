Received: from smtp-out12.alice.it ([85.37.17.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nA-0002SQ-T7
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:22 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out12.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:08 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:08 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j3-0007X0-Tc; Mon, 31 May 2010 11:56:05 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:48 +0200
Message-Id: <1275299757-28908-4-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:07.0530 (UTC)
	FILETIME=[7D8074A0:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.107
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 03/12] device_table-ezx.txt: add needed device nodes
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
X-List-Received-Date: Mon, 31 May 2010 10:00:23 -0000

* With all the mux nodes we can start playing again with gps on A780
* More fb nodes are needed for pxa fb overlay access
* Audio devices are needed too in the case of static /dev

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 files/device_table-ezx.txt |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/files/device_table-ezx.txt b/files/device_table-ezx.txt
index 7246bc8..4984de9 100644
--- a/files/device_table-ezx.txt
+++ b/files/device_table-ezx.txt
@@ -8,7 +8,17 @@
 #    b	Block special device file
 #    p	Fifo (named pipe)
 
-/dev/mux	c	660	0	5	234	0	0	1	9
+/dev/mux	c	660	0	5	234	0	0	1	17
 /dev/ttyIPC0	c	660	0	5	251	0	-	-	-
 /dev/input/uinput	c	660 	0	0	10	223	-	-	-
 /dev/video0	c	660	0	44	81	0	-	-	-
+/dev/fb		c	600	0	0	29	0	0	1	4
+# audio
+/dev/dsp        c       660     0       29      14      3       -       -       - 
+/dev/snd/controlC0      c       660     0       29      116      0       -       -       - 
+/dev/snd/pcmC0D0p       c       660     0       29      116      16       -       -       - 
+/dev/snd/pcmC0D1c       c       660     0       29      116      25       -       -       - 
+/dev/snd/pcmC0D1p       c       660     0       29      116      17       -       -       - 
+/dev/snd/pcmC0D2c       c       660     0       29      116      26       -       -       - 
+/dev/snd/pcmC0D2p       c       660     0       29      116      18       -       -       - 
+/dev/snd/timer          c       660     0       29      116      33       -       -       - 
-- 
1.7.1



