Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9Sw-00053y-2I
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:06 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=v0fcfKHML/zgXjqj8iBuwAoP9dYRNUQaSiujc+HSZpk=;
	b=t4BooBfFYzqUhpJMgV5VKsPUHuj794CYAcPJsBrRiidY5cxmPxM2Dc+L6ZTHgfXMAX
	dJ7ZzbqtBjgbaFDnxyZATakTUThBJyUOKdpcl3kawaggUELMC8vcsqwHr0Kw6fqF+D4f
	gsfSRduFkT4PSwVDjfof8srBdiZcxHS9DU1wQ=
Received: by 10.223.58.73 with SMTP id f9mr465659fah.149.1314891671050;
	Thu, 01 Sep 2011 08:41:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z12sm124030fah.30.2011.09.01.08.41.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:12 +0200
Message-Id: <05234220630db10decc4ef71435ff19ec4156750.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 05/10] linux(-kexecboot): move shared definitions to linux-${PV}.inc
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-2.6.39.inc          |   20 ++++++++++++++++++++
 recipes-kernel/linux/linux-kexecboot.inc       |    5 +++++
 recipes-kernel/linux/linux-kexecboot_2.6.39.bb |   24 +-----------------------
 recipes-kernel/linux/linux_2.6.39.bb           |   22 +---------------------
 4 files changed, 27 insertions(+), 44 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-2.6.39.inc

diff --git a/recipes-kernel/linux/linux-2.6.39.inc b/recipes-kernel/linux/linux-2.6.39.inc
new file mode 100644
index 0000000..3693aac
--- /dev/null
+++ b/recipes-kernel/linux/linux-2.6.39.inc
@@ -0,0 +1,20 @@
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_akita = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"
+DEFAULT_PREFERENCE_collie = "1"
+DEFAULT_PREFERENCE_poodle = "1"
+DEFAULT_PREFERENCE_spitz = "1"
+DEFAULT_PREFERENCE_tosa = "1"
+DEFAULT_PREFERENCE_h1940 = "1"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
+           file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+           file://locomo_kbd_tweak-r2.patch \
+           file://defconfig "
+
+SRC_URI[kernel.md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
+SRC_URI[kernel.sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
+SRC_URI[stablepatch.md5sum] = "ff5eb7323c054a128d2922bde3297ed5"
+SRC_URI[stablepatch.sha256sum] = "132ba590e92d5c9a1bb0dc0885795a095d48e7db2552f1c9e3c26ce946a70a40"
diff --git a/recipes-kernel/linux/linux-kexecboot.inc b/recipes-kernel/linux/linux-kexecboot.inc
index d4525b2..fb9760a 100644
--- a/recipes-kernel/linux/linux-kexecboot.inc
+++ b/recipes-kernel/linux/linux-kexecboot.inc
@@ -7,6 +7,11 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+# FILESEXTRAPATHS cannot be used, because it puts extra paths before FILESPATH and we need it at the end
+# only as fallback for patches available only in linux-PV dir and ie defconfigs needs to go from linux-kexecboot-PV
+FILESPATH_append = ":${FILE_DIRNAME}/linux-${PV}"
+
+
 DEPENDS += "xz-native"
 
 # Kernel bootlogo is distro-specific (default is OE logo).
diff --git a/recipes-kernel/linux/linux-kexecboot_2.6.39.bb b/recipes-kernel/linux/linux-kexecboot_2.6.39.bb
index dae6a22..1fcbfee 100644
--- a/recipes-kernel/linux/linux-kexecboot_2.6.39.bb
+++ b/recipes-kernel/linux/linux-kexecboot_2.6.39.bb
@@ -1,27 +1,5 @@
 require linux-kexecboot.inc
+require linux-${PV}.inc
 
 PR = "${INC_PR}.4"
-
 S = "${WORKDIR}/linux-${PV}"
-
-# Mark archs/machines that this kernel supports
-DEFAULT_PREFERENCE = "-1"
-
-DEFAULT_PREFERENCE_akita = "1"
-DEFAULT_PREFERENCE_c7x0 = "1"
-DEFAULT_PREFERENCE_collie = "1"
-DEFAULT_PREFERENCE_poodle = "1"
-DEFAULT_PREFERENCE_spitz = "1"
-DEFAULT_PREFERENCE_tosa = "1"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-            ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
-            file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-            file://locomo_kbd_tweak-r2.patch \
-            file://defconfig \
-            "
-
-SRC_URI[kernel.md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
-SRC_URI[kernel.sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
-SRC_URI[stablepatch.md5sum] = "ff5eb7323c054a128d2922bde3297ed5"
-SRC_URI[stablepatch.sha256sum] = "132ba590e92d5c9a1bb0dc0885795a095d48e7db2552f1c9e3c26ce946a70a40"
diff --git a/recipes-kernel/linux/linux_2.6.39.bb b/recipes-kernel/linux/linux_2.6.39.bb
index c74598c..2e5c6e2 100644
--- a/recipes-kernel/linux/linux_2.6.39.bb
+++ b/recipes-kernel/linux/linux_2.6.39.bb
@@ -1,20 +1,5 @@
 require linux.inc
-
-# Mark archs/machines that this kernel supports
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_akita = "1"
-DEFAULT_PREFERENCE_c7x0 = "1"
-DEFAULT_PREFERENCE_collie = "1"
-DEFAULT_PREFERENCE_poodle = "1"
-DEFAULT_PREFERENCE_spitz = "1"
-DEFAULT_PREFERENCE_tosa = "1"
-DEFAULT_PREFERENCE_h1940 = "1"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
-           file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-           file://locomo_kbd_tweak-r2.patch \
-           file://defconfig "
+require linux-${PV}.inc
 
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_c7x0 = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
@@ -22,8 +7,3 @@ SRC_URI_append_collie = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_poodle = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_tosa = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 SRC_URI_append_spitz = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
-
-SRC_URI[kernel.md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
-SRC_URI[kernel.sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
-SRC_URI[stablepatch.md5sum] = "ff5eb7323c054a128d2922bde3297ed5"
-SRC_URI[stablepatch.sha256sum] = "132ba590e92d5c9a1bb0dc0885795a095d48e7db2552f1c9e3c26ce946a70a40"
-- 
1.7.6.1



