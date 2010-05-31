Received: from smtp-out19.alice.it ([85.33.2.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1oa-0002XH-9H
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:01:49 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out19.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:10 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:09 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j4-0007X4-5F; Mon, 31 May 2010 11:56:06 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:50 +0200
Message-Id: <1275299757-28908-6-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:08.0499 (UTC)
	FILETIME=[7E145030:01CB00A7]
X-SA-Exim-Connect-IP: 85.33.2.19
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 05/12] tslib: Add config file for a780 machine
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
X-List-Received-Date: Mon, 31 May 2010 10:01:49 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tslib/tslib/a780/tslib.sh |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100755 recipes/tslib/tslib/a780/tslib.sh

diff --git a/recipes/tslib/tslib/a780/tslib.sh b/recipes/tslib/tslib/a780/tslib.sh
new file mode 100755
index 0000000..dd905fb
--- /dev/null
+++ b/recipes/tslib/tslib/a780/tslib.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+TSLIB_TSDEVICE=/dev/input/event2
+
+export TSLIB_TSDEVICE
-- 
1.7.1



