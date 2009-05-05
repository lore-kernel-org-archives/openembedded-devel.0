Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M1HzZ-0007ak-9Q
	for openembedded-devel@openembedded.org; Tue, 05 May 2009 12:35:20 +0200
Received: (qmail 12441 invoked by uid 813007); 5 May 2009 10:29:24 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 May 2009 10:29:24 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2009 12:28:55 +0200
Message-Id: <1241519336-28278-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1241519336-28278-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1241519336-28278-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 1/1] u-boot-bug: Added U-Boot for BUG (from BUG Labs SVN)
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
X-List-Received-Date: Tue, 05 May 2009 10:35:28 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 conf/distro/include/sane-srcrevs.inc |    1 +
 recipes/u-boot/u-boot-bug_svn.bb     |   37 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-bug_svn.bb

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 64781eb..d924070 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -239,6 +239,7 @@ SRCREV_pn-table ?= "2191"
 SRCREV_pn-tichy ?= "ab68d849502009cf3214df48ffa8075a10cc2177"
 SRCREV_pn-tmut ?= "60"
 SRCREV_pn-toscoterm ?= "f02add76f365a2fecd2dbefc230ceaab20244f96"
+SRCREV_pn-u-boot-bug ?= "8674"
 SRCREV_pn-u-boot-openmoko ?= "650149a53dbdd48bf6dfef90930c8ab182adb512"
 SRCREV_pn-u-boot-openmoko-devel ?= "ba029a1426bfca169572bf80d50a8b190a6b0e19"
 SRCREV_pn-uclibc ?= "25712"
diff --git a/recipes/u-boot/u-boot-bug_svn.bb b/recipes/u-boot/u-boot-bug_svn.bb
new file mode 100644
index 0000000..c1930f4
--- /dev/null
+++ b/recipes/u-boot/u-boot-bug_svn.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "U-boot bootloader w/ BUG support"
+LICENSE = "GPL"
+SECTION = "bootloader"
+PRIORITY = "optional"
+PV = "1.3.2+svnr${SRCREV}"
+SRCREV = "${AUTOREV}"
+PR = "r6"
+
+SRC_URI = "\
+  svn://svn.buglabs.net/bug/branches/R1.4/qa;module=u-boot;proto=svn \
+"
+S = "${WORKDIR}/u-boot"
+
+COMPATIBLE_MACHINE = "bug"
+PACKAGE_ARCH = "${MACHINE}"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
+TARGET_LDFLAGS = ""
+
+do_compile () {
+    oe_runmake mx31_bug2_config
+    oe_runmake clean
+    oe_runmake all
+}
+
+do_deploy () {
+    install -d ${DEPLOY_DIR_IMAGE}
+    install -m 0644 ${S}/u-boot.bin ${DEPLOY_DIR_IMAGE}/u-boot-${PV}-${PR}.bin
+    ln -sf ${DEPLOY_DIR_IMAGE}/u-boot-${PV}-${PR}.bin ${DEPLOY_DIR_IMAGE}/uboot-latest.bin
+}
+
+do_stage() {
+    install -m 0755 tools/mkimage ${STAGING_BINDIR_NATIVE}/mkimage
+}
+
+do_deploy[dirs] = "${S}"
+addtask deploy before do_package after do_install
-- 
1.6.3.rc0





