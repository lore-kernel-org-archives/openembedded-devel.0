Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0KgL-0001tc-NM
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 23:29:05 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6306FCB51A; Wed, 22 Feb 2012 23:20:45 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 23:17:56 +0100
Message-Id: <1329949076-5012-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] linux-kexecboot_3.2: move from 3.2.1 to 3.2.7
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
X-List-Received-Date: Wed, 22 Feb 2012 22:29:05 -0000

* apply latest stable patchset
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
index 3207429..a900776 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
@@ -1,13 +1,13 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 S = "${WORKDIR}/linux-${PV}"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "31fc34340f11118873463a1d59d47b7f"
-SRC_URI[stablepatch.sha256sum] = "e9a26dc5faa309ae5172e3c65081fa98b60befab160fb14d9a75816bbde15626"
+SRC_URI[stablepatch.md5sum] = "899624bffed6a19578613b672cc9483f"
+SRC_URI[stablepatch.sha256sum] = "779c548f4418f0baa782252d15a54fadf3c88d79fc547ee5801d31798020e701"
-- 
1.7.3.4



