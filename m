Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O0Jzk-0001Of-FY
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 21:36:01 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:32:35 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:32:35 +0200
Received: from jcn ([82.57.79.100]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 9 Apr 2010 21:32:34 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1O0JwQ-0008UR-3h; Fri, 09 Apr 2010 21:32:34 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 21:32:32 +0200
Message-Id: <1270841552-32607-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.4
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 09 Apr 2010 19:32:35.0007 (UTC)
	FILETIME=[67C39CF0:01CAD81B]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] paroli: depend just on edbus, not on edbus-ehal
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
X-List-Received-Date: Fri, 09 Apr 2010 19:36:01 -0000

edbus-ehal is not available anywhere in current metadata, just depend on
edbus to make images which include paroli build.

See also http://tinderbox.openembedded.org/packages/544404/

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
This fixes an issue when building fso-zhone-image:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for paroli:
 * 	edbus-ehal * 

I was not sure if dropping the dependency entirely was safe so I went for a
less invasive change, it works but please check.

Thanks,
   Antonio Ospite
   http://ao2.it

 recipes/openmoko-projects/paroli_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openmoko-projects/paroli_git.bb b/recipes/openmoko-projects/paroli_git.bb
index 8b071f7..9dc232f 100644
--- a/recipes/openmoko-projects/paroli_git.bb
+++ b/recipes/openmoko-projects/paroli_git.bb
@@ -24,7 +24,7 @@ RDEPENDS = "\
   task-fso-compliance \
   elementary \
   elementary-themes \
-  edbus-ehal \
+  edbus \
 "
 
 E_CONFIG_DIR="/usr/share/enlightenment/data"
-- 
1.7.0.4



