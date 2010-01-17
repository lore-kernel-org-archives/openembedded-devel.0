Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1NWbyZ-0008Pm-4e
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 21:44:02 +0100
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 762AD2D754
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:32:47 +0100 (CET)
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 983C44C8107
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:32:43 +0100 (CET)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 9C3674C81E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:32:40 +0100 (CET)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 21:32:24 +0100
Message-Id: <1263760344-26105-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 212.27.42.9
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 20:44:02 -0000

* barebox is "a bootloader that inherits the best of U-Boot and the Linux kernel"
* add recipe for v2009.12.0 (last stable)
* add recipe for git repository

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/barebox/barebox.inc        |   49 ++++++++++++++++++++++++++++++++++++
 recipes/barebox/barebox_2009.12.bb |   15 +++++++++++
 recipes/barebox/barebox_git.bb     |   10 +++++++
 3 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 recipes/barebox/barebox.inc
 create mode 100644 recipes/barebox/barebox_2009.12.bb
 create mode 100644 recipes/barebox/barebox_git.bb

diff --git a/recipes/barebox/barebox.inc b/recipes/barebox/barebox.inc
new file mode 100644
index 0000000..b3def2a
--- /dev/null
+++ b/recipes/barebox/barebox.inc
@@ -0,0 +1,49 @@
+DESCRIPTION = "Barebox - a bootloader that inherits the best of U-Boot and the Linux kernel"
+HOMEPAGE = "http://www.barebox.org/"
+SECTION = "bootloaders"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PROVIDES = "virtual/bootloader"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit kernel-arch
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+
+BAREBOX_MACHINE ?= "${MACHINE}_defconfig"
+BAREBOX_BINARY ?= "barebox.bin"
+BAREBOX_IMAGE ?= "barebox-${MACHINE}-${PV}-${PR}.bin"
+BAREBOX_SYMLINK ?= "barebox-${MACHINE}.bin"
+
+INSANE_SKIP_${PN} = True
+
+do_configure_prepend() {
+	   cp ${WORKDIR}/defconfig ${S}/.config
+	   oe_runmake oldconfig
+}
+
+do_compile () {
+	   unset LDFLAGS
+	   unset CFLAGS
+	   unset CPPFLAGS
+	   oe_runmake all
+}
+
+do_deploy () {
+	  install -d ${DEPLOY_DIR_IMAGE}
+	  install ${S}/${BAREBOX_BINARY} ${DEPLOY_DIR_IMAGE}/${BAREBOX_IMAGE}
+	  package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${BAREBOX_IMAGE}
+
+	  cd ${DEPLOY_DIR_IMAGE}
+	  rm -f ${BAREBOX_SYMLINK}
+	  ln -sf ${BAREBOX_IMAGE} ${BAREBOX_SYMLINK}
+	  package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${BAREBOX_SYMLINK}
+}
+do_deploy[dirs] = "${S}"
+addtask deploy before do_build after do_compile
+
+do_stage() {
+	   install -d ${STAGING_BINDIR_NATIVE}
+	   install -m 755 scripts/mkimage ${STAGING_BINDIR_NATIVE}/
+}
diff --git a/recipes/barebox/barebox_2009.12.bb b/recipes/barebox/barebox_2009.12.bb
new file mode 100644
index 0000000..2977429
--- /dev/null
+++ b/recipes/barebox/barebox_2009.12.bb
@@ -0,0 +1,15 @@
+require barebox.inc
+
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+BAREBOX_REVISION ?= "0"
+
+S = "${WORKDIR}/barebox-${PV}.${BAREBOX_REVISION}"
+
+SRC_URI = "http://barebox.org/download/barebox-${PV}.${BAREBOX_REVISION}.tar.bz2;name=barebox-${PV}.${BAREBOX_REVISION} \
+	   file://defconfig"
+
+SRC_URI[barebox-2009.12.0.md5sum] = "d1aefe17cfd72affec766617b42dfb78"
+SRC_URI[barebox-2009.12.0.sha256sum] = "0ccd59898289652f4bebd8282737a771729d84886195221c781df08f81a837ef"
diff --git a/recipes/barebox/barebox_git.bb b/recipes/barebox/barebox_git.bb
new file mode 100644
index 0000000..8f9e322
--- /dev/null
+++ b/recipes/barebox/barebox_git.bb
@@ -0,0 +1,10 @@
+require barebox.inc
+
+PR = "r0"
+
+FILESPATHPKG =. "barebox-git:"
+
+SRC_URI = "git://git.pengutronix.de/git/barebox.git;protocol=git \
+	   file://defconfig"
+
+S = "${WORKDIR}/git"
-- 
1.6.0.4



