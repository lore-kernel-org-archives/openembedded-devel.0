Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1MomNN-00069b-Ok
	for openembedded-devel@openembedded.org; Sat, 19 Sep 2009 00:56:28 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 00:55:51 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 00:55:51 +0200
Received: from badebec ([87.1.92.135]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Sat, 19 Sep 2009 00:55:50 +0200
Received: by badebec with local (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>)
	id 1MomMc-0005Yb-Ur; Sat, 19 Sep 2009 00:55:38 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@openembedded.org
Date: Sat, 19 Sep 2009 00:54:53 +0200
Message-Id: <1253314493-21330-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.6.4.3
In-Reply-To: <200909182050.32308.mickey@vanille-media.de>
References: <200909182050.32308.mickey@vanille-media.de>
X-OriginalArrivalTime: 18 Sep 2009 22:55:50.0466 (UTC)
	FILETIME=[2AF7BA20:01CA38B3]
X-SA-Exim-Connect-IP: 85.37.17.113
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: mickey@vanille-media.de
Subject: [PATCH] Fix files/device_table-ezx.txt
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
X-List-Received-Date: Fri, 18 Sep 2009 22:56:28 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---

Hi Mickey, some misc fixes for our device table.

We won't need mux0 anymore, plus, I forgot to put the minor number in ttyIPC
and video dev nodes.

I waited to send this one because the mux entry could have been diffrent if
the makedevs patch would have not been accepted.

Ciao ciao,
   Antonio

 files/device_table-ezx.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/files/device_table-ezx.txt b/files/device_table-ezx.txt
index f477a67..857a188 100644
--- a/files/device_table-ezx.txt
+++ b/files/device_table-ezx.txt
@@ -8,7 +8,7 @@
 #    b	Block special device file
 #    p	Fifo (named pipe)
 
-/dev/mux	c	660	0	5	250	0	1	1	8
-/dev/ttyIPC	c	660	0	5	251	0	-	-	-
+/dev/mux	c	660	0	5	250	1	1	1	8
+/dev/ttyIPC0	c	660	0	5	251	0	-	-	-
 /dev/input/uinput	c	660 	0	0	10	223	-	-	-
-/dev/video	c	660	0	44	81	0	-	-	-
+/dev/video0	c	660	0	44	81	0	-	-	-
-- 
1.6.4.3



