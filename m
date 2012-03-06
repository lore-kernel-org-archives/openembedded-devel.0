Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S52gL-0001ua-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 23:16:33 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp209.alice.it
	(8.6.023.02) id 4EF08A63087F1901; Tue, 6 Mar 2012 23:07:57 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 23:07:45 +0100
Message-Id: <1331071665-4487-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] linux_kexecboot_3.2: upgrade from 3.2.8 to 3.2.9
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
X-List-Received-Date: Tue, 06 Mar 2012 22:16:33 -0000

* apply latest patchset
* bump PR
* catch up and sync with linux-yocto (wip)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
index 29b465e..5492183 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
@@ -1,13 +1,13 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 S = "${WORKDIR}/linux-${PV}"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "202cb750babdda078d6cc2816ab353b1"
-SRC_URI[stablepatch.sha256sum] = "1853d2bd4222e554fb4c2c5d818b953be9e3c658636b58a0a5b3860d23312cda"
+SRC_URI[stablepatch.md5sum] = "4610f3e62a5446422d1e81a90ab3cd06"
+SRC_URI[stablepatch.sha256sum] = "7836685dee161a4ffaf887b8e2f8dd3cb7712e690d0942fefb1db09bb6ad3871"
-- 
1.7.3.4



