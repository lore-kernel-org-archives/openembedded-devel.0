Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2YQe-0003Ti-Ha
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 02:34:04 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD05100E99; Wed, 29 Feb 2012 02:25:36 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 02:25:23 +0100
Message-Id: <1330478725-31090-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] linux-kexecboot_3.2: update from 3.2.7 to 3.2.8
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
X-List-Received-Date: Wed, 29 Feb 2012 01:34:04 -0000

* apply latest stable patchset to match linux-yocto_3.2
* (work in progress about using linux-yocto-tiny as base for kexecboot)
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
index a900776..29b465e 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
@@ -1,13 +1,13 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 S = "${WORKDIR}/linux-${PV}"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;apply=yes;name=stablepatch \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "899624bffed6a19578613b672cc9483f"
-SRC_URI[stablepatch.sha256sum] = "779c548f4418f0baa782252d15a54fadf3c88d79fc547ee5801d31798020e701"
+SRC_URI[stablepatch.md5sum] = "202cb750babdda078d6cc2816ab353b1"
+SRC_URI[stablepatch.sha256sum] = "1853d2bd4222e554fb4c2c5d818b953be9e3c658636b58a0a5b3860d23312cda"
-- 
1.7.3.4



