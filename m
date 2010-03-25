Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nuqmd-00058o-GM
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 18:23:52 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:41 +0100
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 18:20:40 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 18:20:37 +0100
Received: from ao2 by jcn with local (Exim 4.71)
	(envelope-from <ospite@studenti.unina.it>)
	id 1Nuqj2-0006tO-I6; Thu, 25 Mar 2010 18:20:08 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 18:19:55 +0100
Message-Id: <1269537597-26456-4-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-OriginalArrivalTime: 25 Mar 2010 17:20:40.0000 (UTC)
	FILETIME=[7DDB2400:01CACC3F]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.openezx.org
Subject: [PATCH 3/5] ezx: update ezxd version and ezxd.init script
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
X-List-Received-Date: Thu, 25 Mar 2010 17:23:52 -0000

Newer kernels have drivers for BP interaction built as modules, add the
loading sequence in ezxd.init.

Fix also the recipe so that the CC and CROSS variables do not interfere
with the crosscompiler from OE.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 recipes/ezx/ezxd/ezxd.init           |    5 +++++
 recipes/ezx/ezxd_svn.bb              |    4 +++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 2248e78..1b4972a 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -57,7 +57,7 @@ SRCREV_pn-epiphany ?= "7837"
 SRCREV_pn-essential-dialer ?= "194"
 SRCREV_pn-ezx-boot-usb-native ?= "2512"
 SRCREV_pn-ezx-gen-blob ?= "2426"
-SRCREV_pn-ezxd ?= "2074"
+SRCREV_pn-ezxd ?= "2513"
 SRCREV_pn-fbgrab-viewer-native ?= "1943"
 SRCREV_pn-flashrom ?= "3682"
 SRCREV_pn-frameworkd-config-shr ?= "cdf5b5f3d8f37d6d91e1eb8d9cf07d034291df87"
diff --git a/recipes/ezx/ezxd/ezxd.init b/recipes/ezx/ezxd/ezxd.init
index a345952..ba44942 100644
--- a/recipes/ezx/ezxd/ezxd.init
+++ b/recipes/ezx/ezxd/ezxd.init
@@ -37,6 +37,11 @@ start_it_up()
   fi
 
   echo -n "Starting $DESC: "
+  modprobe ohci-hcd
+  sleep 2
+  modprobe moto-usb-ipc
+  modprobe ts27010mux
+
   start-stop-daemon --start --background --quiet --pidfile $PIDFILE \
     --exec $DAEMON -- --system $PARAMS
   # We need to sleep here because opening the mux devices takes some time
diff --git a/recipes/ezx/ezxd_svn.bb b/recipes/ezx/ezxd_svn.bb
index 134980f..19bbd93 100644
--- a/recipes/ezx/ezxd_svn.bb
+++ b/recipes/ezx/ezxd_svn.bb
@@ -22,7 +22,9 @@ CFLAGS_append = " -DDEBUG "
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure() {
-        sed -i -e s:CROSS:CC:g Makefile
+        # Comment out both CC and CROSS definitions
+        sed -i -e 's:^CC.*$:#\0:g' Makefile
+        sed -i -e 's:^CROSS.*$:#\0:g' Makefile
 }
 
 fakeroot do_install() {
-- 
1.7.0.3



