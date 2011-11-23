Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RTLTL-0004Pw-5r
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 23:39:19 +0100
Received: from mizar.localdomain (87.0.250.59) by smtp207.alice.it (8.6.023.02)
	id 4ECA610C0055A8A5; Wed, 23 Nov 2011 23:27:38 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Nov 2011 23:27:35 +0100
Message-Id: <1322087255-25821-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] linux(kexecboot): update from 3.1.1 to 3.1.2
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
X-List-Received-Date: Wed, 23 Nov 2011 22:39:19 -0000

* apply latest patchset
* fix missing sha256sum in linux-kexecboot_3.1.bb

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bb |    9 +++++----
 recipes-kernel/linux/linux_3.1.bb           |   10 +++++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
index 44c76d6..d04be36 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -1,12 +1,12 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.0/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.0/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -22,4 +22,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "8eb92cc70e7f8d1d18a349ba8c029d7d"
+SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
+SRC_URI[stablepatch.sha256sum] = "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index aa1a408..b4e578f 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,11 +1,11 @@
 require linux.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940|hx4700)"
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.0/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.0/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -31,5 +31,5 @@ SRC_URI_append_hx4700 = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "8eb92cc70e7f8d1d18a349ba8c029d7d"
-SRC_URI[stablepatch.sha256sum] = "192b3716fa29bafcf8871676d530cf008b4bcc9ae98f1fde812de2a1047ee4c3"
+SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
+SRC_URI[stablepatch.sha256sum] = "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
-- 
1.7.3.4



