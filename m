Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuB86-000072-KS
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 21:55:17 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Mar 2010 21:52:03 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Mar 2010 21:52:02 +0100
Received: from jcn ([82.60.124.72]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 23 Mar 2010 21:52:01 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NuB4y-0001ov-Lb; Tue, 23 Mar 2010 21:52:00 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 21:51:56 +0100
Message-Id: <1269377516-6969-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 23 Mar 2010 20:52:01.0538 (UTC)
	FILETIME=[AFD0C620:01CACACA]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] base.bbclass: add missing import of metadata_scm
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
X-List-Received-Date: Tue, 23 Mar 2010 20:55:17 -0000

In commit 89b7e433719f43f1c36c76cb8856d559014e99bc metadata_scm.bbclass
functions were factored out from base.bbclass, but the new file was not
included.

This prevented METADATA_SCM, METADATA_REVISION, METADATA_BRANCH to be
set; for instance this caused oestats-client stop working.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 classes/base.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 182ce62..cda9b8f 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -7,6 +7,7 @@ inherit packagedata
 inherit mirrors
 inherit utils
 inherit utility-tasks
+inherit metadata_scm
 
 die() {
 	oefatal "$*"
-- 
1.7.0.3



