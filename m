Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OPhR1-0000A7-9O
	for openembedded-devel@openembedded.org; Fri, 18 Jun 2010 21:41:04 +0200
Received: from jcn (82.57.106.179) by smtp205.alice.it (8.5.124.08)
	id 4C1A2645001A0C35; Fri, 18 Jun 2010 21:30:27 +0200
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OPhGk-0003JM-01; Fri, 18 Jun 2010 21:30:26 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 21:30:19 +0200
Message-Id: <1276889420-12696-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
References: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 2/3] ezx: rename ezx-boot-usb recipe to moto-boot-usb, use git
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
X-List-Received-Date: Fri, 18 Jun 2010 19:41:04 -0000

boot_usb is now named moto-boot-usb and is hosted on git.openezx.org, move
recipes/ezx/ezx-boot-usb-native_svn.bb to
recipes/ezx/moto-boot-usb-native_git.bb and fix it.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/ezx/ezx-boot-usb-native_svn.bb  |   29 -----------------------------
 recipes/ezx/moto-boot-usb-native_git.bb |   27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 recipes/ezx/ezx-boot-usb-native_svn.bb
 create mode 100644 recipes/ezx/moto-boot-usb-native_git.bb

diff --git a/recipes/ezx/ezx-boot-usb-native_svn.bb b/recipes/ezx/ezx-boot-usb-native_svn.bb
deleted file mode 100644
index 280de30..0000000
--- a/recipes/ezx/ezx-boot-usb-native_svn.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "Boot a Motorola EZX device with a user supplied kernel"
-DEPENDS = "virtual/libusb0-native virtual/kernel"
-SECTION = "devel"
-AUTHOR = "Team OpenEZX <openezx-devel@lists.openezx.org>"
-LICENSE = "GPL"
-SRCREV = "2522"
-PV = "0.3.0+svnr${SRCPV}"
-
-SRC_URI = "svn://svn.openezx.org/trunk/src/host;module=boot_usb;proto=http" 
-S = "${WORKDIR}/boot_usb"
-
-EXTRA_OECONF := '--with-kernel-dir="${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"'
-
-inherit autotools native
-
-do_deploy() {
-        install -d ${DEPLOY_DIR_TOOLS}
-        install -m 0755 src/boot_usb ${DEPLOY_DIR_TOOLS}/ezx-boot-usb-${PV}
-}
-
-do_stage() {
-	:
-}
-
-do_install() {
-	:
-}
-
-addtask deploy before do_build after do_compile
diff --git a/recipes/ezx/moto-boot-usb-native_git.bb b/recipes/ezx/moto-boot-usb-native_git.bb
new file mode 100644
index 0000000..e6fdaa1
--- /dev/null
+++ b/recipes/ezx/moto-boot-usb-native_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Boot a Motorola EZX device with a user supplied kernel"
+DEPENDS = "virtual/libusb0-native virtual/kernel"
+SECTION = "devel"
+AUTHOR = "Team OpenEZX <openezx-devel@lists.openezx.org>"
+LICENSE = "GPL"
+SRCREV = "d7136c6c9fe9d62b8f3defccef5dca47258bef63"
+PV = "0.3.0+gitr${SRCPV}"
+PR = "r0"
+PE = "1"
+
+SRC_URI = "git://git.openezx.org/moto-boot-usb.git;protocol=git;branch=master"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF := '--with-kernel-dir="${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"'
+
+inherit autotools native
+
+do_deploy() {
+        install -d ${DEPLOY_DIR_TOOLS}
+        install -m 0755 src/moto-boot-usb ${DEPLOY_DIR_TOOLS}/moto-boot-usb-${PV}
+}
+
+do_install() {
+  :
+}
+
+addtask deploy before do_build after do_compile
-- 
1.7.1



