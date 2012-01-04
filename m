Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RiZ3b-0000mb-Vi
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 23:11:40 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp208.alice.it
	(8.6.023.02) id 4ECA61BE059BE612; Wed, 4 Jan 2012 22:58:40 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed,  4 Jan 2012 22:58:36 +0100
Message-Id: <1325714316-25757-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] linux(-kexecboot): upgrade from 3.1.6 to 3.1.7
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
X-List-Received-Date: Wed, 04 Jan 2012 22:11:40 -0000

* apply latest stable patchset 2012-01-03

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bb |    8 ++++----
 recipes-kernel/linux/linux_3.1.bb           |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
index de5d096..5da0cc4 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -1,12 +1,12 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.6.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -22,5 +22,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "b815dda0a05f7774a0ed0b705b8cfd4c"
-SRC_URI[stablepatch.sha256sum] = "33684faae341f1c48269caf17338c5dca35757d291761df580f2eed10bf8b47c"
+SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
+SRC_URI[stablepatch.sha256sum] = "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index b4271e4..0c65f7b 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,11 +1,11 @@
 require linux.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.6.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "b815dda0a05f7774a0ed0b705b8cfd4c"
-SRC_URI[stablepatch.sha256sum] = "33684faae341f1c48269caf17338c5dca35757d291761df580f2eed10bf8b47c"
+SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
+SRC_URI[stablepatch.sha256sum] = "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
-- 
1.7.3.4



