Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuvUd-0002oZ-5M
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 23:25:38 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:22:24 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 23:21:21 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 23:21:20 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NuvQW-0002CR-IJ; Thu, 25 Mar 2010 23:21:20 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 23:21:18 +0100
Message-Id: <1269555678-8427-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 22:21:20.0272 (UTC)
	FILETIME=[7EB23100:01CACC69]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [PATCH] task-fso-compliance: depend on fso-abyss
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
X-List-Received-Date: Thu, 25 Mar 2010 22:25:39 -0000

fso-console-image fails in do_rootfs with this message:
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies \
     for task-fso-compliance:
|  *    fso-abyss *

See also http://bugs.openembedded.org/show_bug.cgi?id=5385

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/tasks/task-fso-compliance.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-fso-compliance.bb b/recipes/tasks/task-fso-compliance.bb
index e1776a8..50230f0 100644
--- a/recipes/tasks/task-fso-compliance.bb
+++ b/recipes/tasks/task-fso-compliance.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The freesmartphone.org framework -- install this task to make you
 SECTION = "fso/base"
 LICENSE = "MIT"
 PV = "1.0"
-PR = "r8"
+PR = "r9"
 
 inherit task
 
@@ -12,6 +12,7 @@ RDEPENDS_${PN} = "\
 #  fso-apmd \
   fso-gpsd \
 #  fso-monitord \
+  fso-abyss \
   connman \
   connman-scripts \
 #  connman-plugin-bluetooth \
-- 
1.7.0.3



