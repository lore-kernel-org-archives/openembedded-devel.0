Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuqmT-0004uI-6A
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:23:42 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:30 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:30 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:27 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqj0-0006tM-P1; Thu, 25 Mar 2010 18:20:06 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:54 +0100
Message-Id: <1269537597-26456-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:30.0158 (UTC)
	FILETIME=[77FD5EE0:01CACC3F]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 2/5] ezx: update ezx-boot-usb-native version
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
X-List-Received-Date: Thu, 25 Mar 2010 17:23:42 -0000

Fix also ezx-boot-usb-native_svn.bb as the code now resides in a 'src'
subdirectory.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/include/sane-srcrevs.inc   |    2 +-
 recipes/ezx/ezx-boot-usb-native_svn.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 7e08ca0..2248e78 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -55,7 +55,7 @@ SRCREV_pn-elf2flt ?= "1786"
 SRCREV_pn-epdfview ?= "346"
 SRCREV_pn-epiphany ?= "7837"
 SRCREV_pn-essential-dialer ?= "194"
-SRCREV_pn-ezx-boot-usb-native ?= "2371"
+SRCREV_pn-ezx-boot-usb-native ?= "2512"
 SRCREV_pn-ezx-gen-blob ?= "2426"
 SRCREV_pn-ezxd ?= "2074"
 SRCREV_pn-fbgrab-viewer-native ?= "1943"
diff --git a/recipes/ezx/ezx-boot-usb-native_svn.bb b/recipes/ezx/ezx-boot-usb-native_svn.bb
index 1298cac..237d06b 100644
--- a/recipes/ezx/ezx-boot-usb-native_svn.bb
+++ b/recipes/ezx/ezx-boot-usb-native_svn.bb
@@ -14,7 +14,7 @@ inherit autotools native
 
 do_deploy() {
         install -d ${DEPLOY_DIR_TOOLS}
-        install -m 0755 boot_usb ${DEPLOY_DIR_TOOLS}/ezx-boot-usb-${PV}
+        install -m 0755 src/boot_usb ${DEPLOY_DIR_TOOLS}/ezx-boot-usb-${PV}
 }
 
 do_stage() {
-- 
1.7.0.3



