Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmaIj-0001qT-0N
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 01:19:53 +0100
Received: from mizar.localdomain (87.5.74.30) by smtp206.alice.it (8.6.023.02)
	id 4ECA607907BDFA17; Mon, 16 Jan 2012 01:12:18 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2012 01:12:09 +0100
Message-Id: <1326672731-7001-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
References: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 1/3] kexecboot_git: move to 8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7
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
X-List-Received-Date: Mon, 16 Jan 2012 00:19:53 -0000

* take advantage of last commits allowing to boot with empty /dev
* (the directory must be present, though)
* minor fixes
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb |    4 ++--
 recipes-bsp/kexecboot/kexecboot.inc          |    3 ++-
 recipes-bsp/kexecboot/kexecboot_git.bb       |    4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index 22ef7de..0d6d00f 100644
--- a/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,9 +1,9 @@
 RDEPENDS_${PN} = "kexec-klibc"
 PV = "0.5.9"
-PR = "r7+gitr${SRCREV}"
+PR = "r8+gitr${SRCREV}"
 
 SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "14e6d1a3641a749e4408fda1eadffe4f396b0279"
+SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
 S = "${WORKDIR}/git"
 
 # the binary is statically linked against klibc
diff --git a/recipes-bsp/kexecboot/kexecboot.inc b/recipes-bsp/kexecboot/kexecboot.inc
index b76abcc..3a7fd9f 100644
--- a/recipes-bsp/kexecboot/kexecboot.inc
+++ b/recipes-bsp/kexecboot/kexecboot.inc
@@ -50,11 +50,12 @@ do_install () {
         install -m 0755 kexecboot ${D}${bindir}/
         install -d ${D}/proc
         install -d ${D}/mnt
+        install -d ${D}/dev
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt"
+FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev"
 
 pkg_postinst_${PN} () {
         ln -sf ${bindir}/kexecboot $D/init
diff --git a/recipes-bsp/kexecboot/kexecboot_git.bb b/recipes-bsp/kexecboot/kexecboot_git.bb
index 264d8e2..1341461 100644
--- a/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,9 +1,9 @@
 RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
-PR = "r7+gitr${SRCREV}"
+PR = "r8+gitr${SRCREV}"
 
 SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "14e6d1a3641a749e4408fda1eadffe4f396b0279"
+SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
 S = "${WORKDIR}/git"
 
 require kexecboot.inc
-- 
1.7.3.4



