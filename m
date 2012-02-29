Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2YQg-0003Ti-Ch
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 02:34:06 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD05100ED0; Wed, 29 Feb 2012 02:25:40 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 02:25:25 +0100
Message-Id: <1330478725-31090-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1330478725-31090-1-git-send-email-andrea.adami@gmail.com>
References: <1330478725-31090-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux_3.2: update from 3.2.7 to 3.2.8
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
X-List-Received-Date: Wed, 29 Feb 2012 01:34:06 -0000

* apply latest stable patchset to match linux-yocto_3.2
* (work in progress to use linux-yocto as default kernel)
* bump INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.2.inc |    6 +++---
 recipes-kernel/linux/linux_3.2.bb  |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.2.inc b/recipes-kernel/linux/linux-3.2.inc
index 3a37200..03302a7 100644
--- a/recipes-kernel/linux/linux-3.2.inc
+++ b/recipes-kernel/linux/linux-3.2.inc
@@ -3,12 +3,12 @@ DEFAULT_PREFERENCE = "-1"
 COMPATIBLE_MACHINE = "(spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "899624bffed6a19578613b672cc9483f"
-SRC_URI[stablepatch.sha256sum] = "779c548f4418f0baa782252d15a54fadf3c88d79fc547ee5801d31798020e701"
+SRC_URI[stablepatch.md5sum] = "202cb750babdda078d6cc2816ab353b1"
+SRC_URI[stablepatch.sha256sum] = "1853d2bd4222e554fb4c2c5d818b953be9e3c658636b58a0a5b3860d23312cda"
diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index 6c15a88..8a7ab22 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,4 +1,4 @@
 require linux.inc
 require linux-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.3.4



