Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rlmk1-0003IY-NN
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 20:24:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id d17so948061eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 11:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+yCQb0WXh4RH+BETu9W0CFZThfD7FDpwdveP2772iE8=;
	b=JQ+FS8IGUs09X8nPBEFLTLh64Nfa58UVoaxBQoVNc0qDE5qM1hO7AfyLyZeNWwd1jW
	wcCdxAOBg1lNDjZ44WWqPEo45h02GfgbYloTW4xWaEotrawC61ImjA49OVcJhzvTaOMZ
	aVDHsH3cjqsZ4tMCFawy4pXVnRkFWP4iJheY4=
Received: by 10.213.10.136 with SMTP id p8mr247729ebp.91.1326482235468;
	Fri, 13 Jan 2012 11:17:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm33100127eeh.10.2012.01.13.11.17.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 11:17:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2012 20:16:45 +0100
Message-Id: <b8532360d78656949f4cd6b8a2a2b49a940b42d0.1326481985.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <36d21bdc2795818de1101033a97884849df7477c.1326481985.git.Martin.Jansa@gmail.com>
References: <36d21bdc2795818de1101033a97884849df7477c.1326481985.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326481985.git.Martin.Jansa@gmail.com>
References: <cover.1326481985.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 4/4] linux(-kexecboot)-3.1: move common stuff like SRC_URI and checksums to .inc file
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
X-List-Received-Date: Fri, 13 Jan 2012 19:24:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-3.1.inc          |   19 +++++++++++++++++++
 recipes-kernel/linux/linux-kexecboot_3.1.bb |   21 +--------------------
 recipes-kernel/linux/linux_3.1.bb           |   21 +--------------------
 3 files changed, 21 insertions(+), 40 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.1.inc

diff --git a/recipes-kernel/linux/linux-3.1.inc b/recipes-kernel/linux/linux-3.1.inc
new file mode 100644
index 0000000..a32fea0
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.1.inc
@@ -0,0 +1,19 @@
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
+           file://defconfig \
+           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_collie = " \
+                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+                         file://locomo_kbd_tweak-r2.patch \
+                         "
+
+SRC_URI_append_poodle = " \
+                         file://locomo_kbd_tweak-r2.patch \
+                         "
+
+SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
+SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
+SRC_URI[stablepatch.sha256sum] = "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
index 5da0cc4..f7a54fe 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -1,26 +1,7 @@
 require linux-kexecboot.inc
+require linux-${PV}.inc
 
 PR = "${INC_PR}.4"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
-           file://defconfig \
-           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI_append_poodle = " \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
-SRC_URI[stablepatch.sha256sum] = "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 0c65f7b..5ac65ef 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,25 +1,6 @@
 require linux.inc
+require linux-${PV}.inc
 
 PR = "${INC_PR}.5"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stablepatch \
-           file://defconfig \
-           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI_append_poodle = " \
-                         file://locomo_kbd_tweak-r2.patch \
-                         "
-
-SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
-SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
-SRC_URI[stablepatch.sha256sum] = "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
-- 
1.7.8.3



