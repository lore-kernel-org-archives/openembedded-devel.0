Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1RYoWx-00013y-0J
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 01:41:39 +0100
Received: from jcn (79.2.146.244) by smtp206.alice.it (8.6.023.02)
	id 4ECA607902D7C5AB; Fri, 9 Dec 2011 01:29:43 +0100
Received: from ao2 by jcn with local (Exim 4.77)
	(envelope-from <ospite@studenti.unina.it>)
	id 1RYoLO-0000oW-LS; Fri, 09 Dec 2011 01:29:42 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 01:29:30 +0100
Message-Id: <1323390570-3088-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323390570-3088-1-git-send-email-ospite@studenti.unina.it>
References: <1323390570-3088-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [meta-handheld][PATCH 2/2] motorola-ezx-base.inc: enable "iwmmxt" as extra arch only when needed
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
X-List-Received-Date: Fri, 09 Dec 2011 00:41:39 -0000

Use PACKAGE_EXTRA_ARCHS_tune-xscale so we don't need to remove the
generic PACKAGE_EXTRA_ARCHS line in case we enable tune-iwmmxt.inc

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/machine/include/motorola-ezx-base.inc |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 3e22eec..5b0dbee 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -7,6 +7,7 @@ MACHINE_CLASS = "motorola-ezx"
 
 # Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
 require conf/machine/include/tune-xscale.inc
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 
 # Uncomment this to use iwmmxt optimizations. Remove the above xscale stuff first
 #require conf/machine/include/tune-iwmmxt.inc
@@ -27,9 +28,6 @@ MACHINE_DISPLAY_PPI = "180"
 MACHINE_FEATURES = "alsa apm bluetooth kernel26 keyboard phone screen touchscreen usbgadget usbhost vfat"
 MACHINE_FEATURES += " iwmmxt"
 
-# Comment this out if you change to tune-iwmmxt.inc above
-PACKAGE_EXTRA_ARCHS += "iwmmxt"
-
 #
 # Software/packages selection
 #
-- 
1.7.7.3



