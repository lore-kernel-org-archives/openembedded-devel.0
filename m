Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NgNnQ-0006OF-3x
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 20:36:55 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Feb 2010 20:33:12 +0100
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Feb 2010 20:33:12 +0100
Received: from badebec ([87.3.148.156]) by FBCMCL01B04.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 13 Feb 2010 20:33:12 +0100
Received: by badebec with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1NgNjo-00047o-Ru; Sat, 13 Feb 2010 20:33:08 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2010 20:32:37 +0100
Message-Id: <1266089557-15538-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.6.6.2
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 13 Feb 2010 19:33:12.0404 (UTC)
	FILETIME=[6155B140:01CAACE3]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.
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
X-List-Received-Date: Sat, 13 Feb 2010 19:36:55 -0000

Prevent a failure in do_populate_sdk when there are no empty
directories:
  /bin/rmdir: missing operand
  Try `/bin/rmdir --help' for more information.

See also http://tinderbox.openembedded.net/packages/478437/

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/meta/meta-toolchain.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index a8c27ec..3169425 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -67,7 +67,7 @@ do_populate_sdk() {
 	rm -Rf ${SDK_OUTPUT}/usr/lib
 
 	# Clean up empty directories from excluded packages
-	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -0 /bin/rmdir
+	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
 
 	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}
 	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/${sysconfdir}/
-- 
1.6.6.2



