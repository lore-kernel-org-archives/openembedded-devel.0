Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1nB-0002SR-29
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:00:22 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:07 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:07 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j3-0007Ww-FG; Mon, 31 May 2010 11:56:05 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:46 +0200
Message-Id: <1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:08.0054 (UTC)
	FILETIME=[7DD06960:01CB00A7]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 01/12] fso-image.inc: add an even shorter alias, for ls -l
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

'l' is a must have along with 'll'.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/images/fso-image.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
index cc626f3..704d267 100644
--- a/recipes/images/fso-image.inc
+++ b/recipes/images/fso-image.inc
@@ -110,6 +110,7 @@ fso_rootfs_postprocess() {
     echo "alias fso='cd /local/pkg/fso'" >>./etc/profile
     echo "alias ipkg='opkg'" >>./etc/profile
     echo "alias vim=vi" >>./etc/profile
+    echo "alias l='ls -l'" >>./etc/profile
     echo "alias ll='ls -al'" >>./etc/profile
     # nfs
     mkdir -p ./local/pkg
-- 
1.7.1



