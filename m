Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OPhQV-000064-9o
	for openembedded-devel@openembedded.org; Fri, 18 Jun 2010 21:40:32 +0200
Received: from jcn (82.57.106.179) by smtp208.alice.it (8.5.124.08)
	id 4C1A27160019C9A3; Fri, 18 Jun 2010 21:30:27 +0200
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OPhGk-0003JO-5E; Fri, 18 Jun 2010 21:30:26 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 21:30:20 +0200
Message-Id: <1276889420-12696-4-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
References: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.104
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 3/3] ezx: rename references to ezx-boot-usb into moto-boot-usb
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
X-List-Received-Date: Fri, 18 Jun 2010 19:40:33 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/include/preferred-om-2008-versions.inc |    2 +-
 conf/machine/include/motorola-ezx-base.inc         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 4ae673c..3020fe9 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -334,7 +334,6 @@ PREFERRED_VERSION_expat ?= "2.0.0"
 PREFERRED_VERSION_expat-native ?= "1.95.7"
 PREFERRED_VERSION_expect ?= "5.44.1"
 PREFERRED_VERSION_ez-ipupdate ?= "3.0.10"
-PREFERRED_VERSION_ezx-boot-usb-native ?= "0.1.0"
 PREFERRED_VERSION_ezx-gpiotool ?= "1877"
 PREFERRED_VERSION_faac ?= "1.24"
 PREFERRED_VERSION_faad2 ?= "2.0"
@@ -1275,6 +1274,7 @@ PREFERRED_VERSION_monotone-4 ?= "0.19"
 PREFERRED_VERSION_monotone-5 ?= "0.25.2"
 PREFERRED_VERSION_monotone-6 ?= "0.34"
 PREFERRED_VERSION_motion ?= "3.2.6"
+PREFERRED_VERSION_moto-boot-usb-native ?= "0.1.0"
 PREFERRED_VERSION_mousepad ?= "0.2.12"
 PREFERRED_VERSION_mp3blaster ?= "3.2.3"
 PREFERRED_VERSION_mpc ?= "0.12.1"
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index bb68ff4..fdd00ac 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -56,7 +56,7 @@ MKUBIFS_ARGS = "-m 1 -e 130944 -c 487"
 UBINIZE_ARGS = "-m 1 -p 128KiB "
 
 
-EXTRA_IMAGEDEPENDS += "ezx-boot-usb-native ezx-gen-blob"
+EXTRA_IMAGEDEPENDS += "moto-boot-usb-native ezx-gen-blob"
 
 IMAGE_INSTALL_append += "\
   kernel-module-ohci-hcd \
-- 
1.7.1



