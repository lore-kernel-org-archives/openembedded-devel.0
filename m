Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OPhQL-00005a-Ap
	for openembedded-devel@openembedded.org; Fri, 18 Jun 2010 21:40:22 +0200
Received: from jcn (82.57.106.179) by smtp207.alice.it (8.5.124.08)
	id 4C1A26CF0019F509; Fri, 18 Jun 2010 21:30:27 +0200
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1OPhGj-0003JK-S2; Fri, 18 Jun 2010 21:30:25 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 21:30:18 +0200
Message-Id: <1276889420-12696-2-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
References: <1276889420-12696-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.103
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: [PATCH 1/3] ezx: replace ezx-gen-blob_svn.bb with ezx-gen-blob_git.bb
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
X-List-Received-Date: Fri, 18 Jun 2010 19:40:23 -0000

gen-blob is now at git.openezx.org, replace the old svn recipe with one
which fetches the code from the git repository.

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 recipes/ezx/ezx-gen-blob_git.bb |   41 +++++++++++++++++++++++++++++++++++++++
 recipes/ezx/ezx-gen-blob_svn.bb |   41 ---------------------------------------
 2 files changed, 41 insertions(+), 41 deletions(-)
 create mode 100644 recipes/ezx/ezx-gen-blob_git.bb
 delete mode 100644 recipes/ezx/ezx-gen-blob_svn.bb

diff --git a/recipes/ezx/ezx-gen-blob_git.bb b/recipes/ezx/ezx-gen-blob_git.bb
new file mode 100644
index 0000000..5ebcad1
--- /dev/null
+++ b/recipes/ezx/ezx-gen-blob_git.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Generic Blob [Bootloader] for the Motorola EZX platform"
+SECTION = "bootloaders"
+AUTHOR = "OpenEZX Team"
+HOMEPAGE = "http://people.openezx.org/wyrm/gen-blob"
+LICENSE = "GPL"
+PROVIDES = "virtual/bootloader"
+DEPENDS = "virtual/kernel"
+SRCREV = "48d1cf4dbc8228b982ff40c36922769f70347da1"
+PV = "1.0.0+gitr${SRCPV}"
+PR = "r0"
+PE = "1"
+
+SRC_URI = "\
+  git://git.openezx.org/gen-blob.git;protocol=git;branch=master \
+  file://remove-bogus-sed.patch \
+"
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --with-board=lubbock \
+  --with-cpu=pxa262 \
+  --with-linux-prefix=${STAGING_KERNEL_DIR} \
+  --enable-usb \
+"
+
+do_configure() {
+	gnu-configize
+	oe_runconf
+}
+
+do_deploy() {
+	install -d ${DEPLOY_DIR_IMAGE}
+	install -m 0644 src/blob/blob-a780  ${DEPLOY_DIR_IMAGE}/gen-blob-for-1stgen.${SRCDATE}
+	install -m 0644 src/blob/blob-a1200 ${DEPLOY_DIR_IMAGE}/gen-blob-for-2ndgen.${SRCDATE}
+}
+
+addtask deploy before do_build after do_compile
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes/ezx/ezx-gen-blob_svn.bb b/recipes/ezx/ezx-gen-blob_svn.bb
deleted file mode 100644
index 39cec89..0000000
--- a/recipes/ezx/ezx-gen-blob_svn.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Generic Blob [Bootloader] for the Motorola EZX platform"
-SECTION = "bootloaders"
-AUTHOR = "OpenEZX Team"
-HOMEPAGE = "http://people.openezx.org/wyrm/gen-blob"
-LICENSE = "GPL"
-PROVIDES = "virtual/bootloader"
-DEPENDS = "virtual/kernel"
-SRCREV = "2519"
-PV = "1.0.0+svnr${SRCPV}"
-PE = "1"
-PR = "r2"
-
-SRC_URI = "\
-  svn://svn.openezx.org/trunk/src/blob/;module=gen-blob;proto=http \
-  file://remove-bogus-sed.patch \
-"
-S = "${WORKDIR}/gen-blob"
-
-inherit autotools
-
-EXTRA_OECONF = "\
-  --with-board=lubbock \
-  --with-cpu=pxa262 \
-  --with-linux-prefix=${STAGING_KERNEL_DIR} \
-  --enable-usb \
-"
-
-do_configure() {
-	gnu-configize
-	oe_runconf
-}
-
-do_deploy() {
-	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 0644 src/blob/blob-a780  ${DEPLOY_DIR_IMAGE}/gen-blob-for-1stgen.${SRCDATE}
-	install -m 0644 src/blob/blob-a1200 ${DEPLOY_DIR_IMAGE}/gen-blob-for-2ndgen.${SRCDATE}
-}
-
-addtask deploy before do_build after do_compile
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.1



