Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RkmZr-0001jY-BP
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 02:02:07 +0100
Received: from mizar.localdomain (87.9.229.96) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6301FC1C1B; Wed, 11 Jan 2012 01:54:38 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jan 2012 01:54:28 +0100
Message-Id: <1326243269-21197-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 1/2] various kernels: remove apply=yes from SRC_URI
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
X-List-Received-Date: Wed, 11 Jan 2012 01:02:07 -0000

* not necessary anymore, obsolete in oe-core

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bb        |    2 +-
 .../linux/linux-palm-omap1_2.6.22-omap1.bb         |    2 +-
 recipes-kernel/linux/linux_3.1.bb                  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
index 5da0cc4..9e2fb69 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -6,7 +6,7 @@ S = "${WORKDIR}/linux-${PV}"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
diff --git a/recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb b/recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb
index f59779e..52c6aec 100644
--- a/recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb
+++ b/recipes-kernel/linux/linux-palm-omap1_2.6.22-omap1.bb
@@ -9,7 +9,7 @@ inherit kernel
 DEPENDS = ""
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-2.6.22.tar.bz2;name=kernel \
-           http://www.muru.com/linux/omap/patches/patch-2.6.22-omap1.bz2;apply=yes;name=patch \
+           http://www.muru.com/linux/omap/patches/patch-2.6.22-omap1.bz2;name=patch \
 	   file://defconfig"
 
 S = "${WORKDIR}/linux-2.6.22"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 0c65f7b..baa0b34 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -5,7 +5,7 @@ PR = "${INC_PR}.5"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
-- 
1.7.3.4



