Received: from smtp3.mundo-r.com ([212.51.32.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1O6out-0003A5-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 19:49:52 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjsGAHq/1ktbdWOb/2dsb2JhbACDF40njQGwApE0gSWCfG0E
X-IronPort-AV: E=Sophos;i="4.52,282,1270418400"; d="scan'208";a="624921361"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp3.mundo-r.com with ESMTP; 27 Apr 2010 19:45:10 +0200
Received: from [192.168.12.135] (helo=localhost)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1O6oqM-0001hS-Gr; Tue, 27 Apr 2010 19:45:10 +0200
From: =?UTF-8?q?V=C3=ADctor=20M=2E=20J=C3=A1quez=20L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 19:45:01 +0200
Message-Id: <1272390301-4631-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.51.32.191
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ti-dofftools: doff converter tool
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
X-List-Received-Date: Tue, 27 Apr 2010 17:49:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>

Add the recipie for the doff converter tool.

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 recipes/ti/ti-dofftools_git.bb |   28 ++++++++++++++++++++++++++++
 recipes/ti/ti-paths.inc        |    2 ++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-dofftools_git.bb

diff --git a/recipes/ti/ti-dofftools_git.bb b/recipes/ti/ti-dofftools_git.bb
new file mode 100644
index 0000000..0450ec9
--- /dev/null
+++ b/recipes/ti/ti-dofftools_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TI DSP/BIOS DOFF tools"
+HOMEPAGE = "http://dev.omapzoom.org/?p=tidspbridge/userspace-dspbridge.git;a=summary"
+SECTION = "devel"
+LICENSE = "TI"
+
+require ti-paths.inc
+require ti-staging.inc
+
+PR = "r1"
+
+SRCREV = "31c7e2c9"
+SRC_URI = "git://dev.omapzoom.org/pub/scm/tidspbridge/userspace-dspbridge.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+do_unpack2() {
+    cd ${S}
+    tar -xvf source/dsp/bdsptools/bridge-tools.tar
+}
+
+do_install() {
+    install -d ${D}${DOFFTOOLS_INSTALL_DIR_RECIPE}/bin
+    for i in DLLcreate DLLdump; do
+        cp -a ${S}/ti/dspbridge/dsp/doffbuild/bin/$i ${D}${DOFFTOOLS_INSTALL_DIR_RECIPE}/bin
+    done;
+}
+
+addtask unpack2 after do_unpack before do_patch
\ No newline at end of file
diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
index d3d1b98..40de3bd 100644
--- a/recipes/ti/ti-paths.inc
+++ b/recipes/ti/ti-paths.inc
@@ -17,6 +17,7 @@ export LPM_INSTALL_DIR_RECIPE        = "${installdir}/ti-local-power-manager-tre
 export DMAI_INSTALL_DIR_RECIPE       = "${installdir}/ti-dmai-tree"
 export CODEC_INSTALL_DIR_RECIPE      = "${installdir}/ti-codecs-tree"
 export DSPLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-dsplib-tree"
+export DOFFTOOLS_INSTALL_DIR_RECIPE  = "${installdir}/ti-dofftools-tree"
 
 # This is where the tools will end up in staging provided PACKAGE_ARCH = ${MACHINE_ARCH} is set
 export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
@@ -35,6 +36,7 @@ export LPM_INSTALL_DIR        = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LPM_INS
 export DMAI_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
 export CODEC_INSTALL_DIR      = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
 export DSPLIB_INSTALL_DIR     = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
+export DOFFTOOLS_INSTALL_DIR  = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DOFFTOOLS_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
-- 
1.6.0.4



