Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sgl40-0005yu-Ir
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 01:08:52 +0200
Received: from mizar.localdomain (79.21.254.221) by smtp208.alice.it
	(8.6.023.02) id 4F056E8512F6CDDB; Tue, 19 Jun 2012 00:58:12 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 00:58:05 +0200
Message-Id: <1340060286-28769-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
References: <1340060286-28769-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 3/4] kexecboot: upgrade and move to git tag 0daa77
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
X-List-Received-Date: Mon, 18 Jun 2012 23:08:52 -0000

* new git repository on github
* new LABEL separator
* text-ui fallback
* install /sys for upcoming ubifs detection
* menu-bug fix
* minor fixes

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |    6 +++---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc |    3 ++-
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index 0d6d00f..da479c8 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,9 +1,9 @@
 RDEPENDS_${PN} = "kexec-klibc"
 PV = "0.5.9"
-PR = "r8+gitr${SRCREV}"
+PR = "r9+gitr${SRCREV}"
 
-SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
+SRCREV = "0daa774eac019602cd89048961e95985ea50dadf"
 S = "${WORKDIR}/git"
 
 # the binary is statically linked against klibc
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
index a205904..2a53f96 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
@@ -43,11 +43,12 @@ do_install () {
         install -d ${D}/proc
         install -d ${D}/mnt
         install -d ${D}/dev
+        install -d ${D}/sys
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev"
+FILES_${PN} += " ${bindir}/kexecboot /init /proc /mnt /dev /sys"
 
 pkg_postinst_${PN} () {
         ln -sf ${bindir}/kexecboot $D/init
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 1341461..b33b640 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -2,8 +2,8 @@ RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
 PR = "r8+gitr${SRCREV}"
 
-SRC_URI = "git://git.linuxtogo.org/home/groups/kexecboot/kexecboot.git;protocol=git "
-SRCREV = "8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
+SRCREV = "0daa774eac019602cd89048961e95985ea50dadf"
 S = "${WORKDIR}/git"
 
 require kexecboot.inc
-- 
1.7.3.4



