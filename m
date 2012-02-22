Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0Kng-0002C3-NN
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 23:36:40 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A66505CA8666; Wed, 22 Feb 2012 23:28:20 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 23:28:08 +0100
Message-Id: <1329949688-15070-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] linux_3.2: update from 3.2.1 to 3.2.7
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
X-List-Received-Date: Wed, 22 Feb 2012 22:36:40 -0000

* apply latest patchset
* bump INC_PR
---
 recipes-kernel/linux/linux-3.2.inc |    6 +++---
 recipes-kernel/linux/linux_3.2.bb  |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.2.inc b/recipes-kernel/linux/linux-3.2.inc
index 8dd30d9..3a37200 100644
--- a/recipes-kernel/linux/linux-3.2.inc
+++ b/recipes-kernel/linux/linux-3.2.inc
@@ -3,12 +3,12 @@ DEFAULT_PREFERENCE = "-1"
 COMPATIBLE_MACHINE = "(spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
 
 SRC_URI[kernel.md5sum] = "7ceb61f87c097fc17509844b71268935"
 SRC_URI[kernel.sha256sum] = "c881fc2b53cf0da7ca4538aa44623a7de043a41f76fd5d0f51a31f6ed699d463"
-SRC_URI[stablepatch.md5sum] = "31fc34340f11118873463a1d59d47b7f"
-SRC_URI[stablepatch.sha256sum] = "e9a26dc5faa309ae5172e3c65081fa98b60befab160fb14d9a75816bbde15626"
+SRC_URI[stablepatch.md5sum] = "899624bffed6a19578613b672cc9483f"
+SRC_URI[stablepatch.sha256sum] = "779c548f4418f0baa782252d15a54fadf3c88d79fc547ee5801d31798020e701"
diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index 28564b6..6c15a88 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,4 +1,4 @@
 require linux.inc
 require linux-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
-- 
1.7.3.4



