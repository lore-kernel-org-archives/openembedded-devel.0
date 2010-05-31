Received: from smtp-out19.alice.it ([85.33.2.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ1oL-0002XH-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 12:01:48 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out19.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:08 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 11:56:08 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 11:56:07 +0200
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OJ1j4-0007X2-0j; Mon, 31 May 2010 11:56:06 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:55:49 +0200
Message-Id: <1275299757-28908-5-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 31 May 2010 09:56:08.0174 (UTC)
	FILETIME=[7DE2B8E0:01CB00A7]
X-SA-Exim-Connect-IP: 85.33.2.19
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 04/12] xserver-kdrive-common/Xserver: fix EZX settings
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
X-List-Received-Date: Mon, 31 May 2010 10:01:48 -0000

Support all EZX machines, and set up the mouse as a tslib device.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 .../xserver-kdrive-common/Xserver                  |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index e2566bb..347b005 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -144,11 +144,12 @@ case `module_id` in
                      PPM="-root-ppm /usr/share/pixmaps/xsplash-qvga-square.ppm"
                 fi
                 ARGS="$ARGS -dpi 181 -screen 320x320 -mouse tslib -hide-cursor ${PPM}" ;;
-        "Motorola Ezx Platform")
+        "Motorola Ezx Platform" | \
+        "Motorola EZX"*)
                 if [ -f "/usr/share/pixmaps/xsplash-qvga.ppm" ]; then
                      PPM="-root-ppm /usr/share/pixmaps/xsplash-qvga.ppm ${PPM}"
                 fi
-                ARGS="$ARGS -dpi 170 -screen ${SCREEN_SIZE}" ;;
+                ARGS="$ARGS -dpi 170 -mouse tslib -hide-cursor -screen ${SCREEN_SIZE} ${PPM}" ;;
 	"Glofiish M800")
                 if [ -f "/usr/share/pixmaps/xsplash-vga.ppm" ]; then
                      PPM="-root-ppm /usr/share/pixmaps/xsplash-vga.ppm"
-- 
1.7.1



