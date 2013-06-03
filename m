Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 446246A607
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:38:04 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so415702eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=M+44cxZw2aMezaJM3g4Sk3+4maUOh5Dl5bKbOtXjQA8=;
	b=rtbvvcncAfV6cLAgU7NZREWrY7W0qXJrw3tcvz4TU1jb7rssH9bMyNO+TCXoiWwl/n
	El8XLbawlhl1b1Fhq3+W4qpImnOLPQB4hXeVH0mFviUQ4ITpfCWsPO2ZD1//dr/oAyIM
	vO+AVZmV/fuApjCsXHPDWpsFdZcbXwb8Iol8jHaxV8up2DEn0m0pcDXpSS0u4S8FjR6Y
	XMB7wwDC7GyjZWbt3oO31KQvC45C54hxVq7VOgC+HVZ5vJJlLvgAak4SuT/0p/xOBi69
	tDx6vw1Wr2GwiLuw6wC1S8qW3V0FWGLBeg2Hj7yJ+7rwDIpFKiv0I5nRAXbOve1mDA11
	dw6w==
X-Received: by 10.15.101.1 with SMTP id bo1mr24544523eeb.128.1370299083955;
	Mon, 03 Jun 2013 15:38:03 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id y10sm87492112eev.3.2013.06.03.15.38.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 15:38:03 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jun 2013 00:37:57 +0200
Message-Id: <1370299077-14945-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto(-tiny-kexecboot): put common settings in an .inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 22:38:04 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-handhelds.inc     | 45 ++++++++++++++++++
 .../linux/linux-yocto-tiny-kexecboot_3.8.bbappend  | 46 +------------------
 recipes-kernel/linux/linux-yocto_3.8.bbappend      | 53 +---------------------
 3 files changed, 47 insertions(+), 97 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-handhelds.inc

diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
new file mode 100644
index 0000000..2e0b7a9
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -0,0 +1,45 @@
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+
+KMACHINE_akita = "akita"
+KMACHINE_c7x0 = "c7x0"
+KMACHINE_collie = "collie"
+KMACHINE_poodle = "poodle"
+KMACHINE_spitz = "spitz"
+KMACHINE_tosa = "tosa"
+
+SRC_URI_append_akita = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_c7x0 = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_collie = " \
+           file://feature-top.scc \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_poodle = " \
+           file://feature-top.scc \
+           file://qvga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_spitz = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+SRC_URI_append_tosa = " \
+           file://feature-top.scc \
+           file://vga/logo_linux_clut224.ppm.bz2 \
+           "
+
+do_configure_prepend() {
+
+    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
+        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
+    fi
+}
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
index 1f7d07e..ec83a60 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bbappend
@@ -1,14 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
-
-KMACHINE_akita = "akita"
-KMACHINE_c7x0 = "c7x0"
-KMACHINE_collie = "collie"
-KMACHINE_poodle = "poodle"
-KMACHINE_spitz = "spitz"
-KMACHINE_tosa = "tosa"
-
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
 KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
@@ -17,39 +8,4 @@ KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
 KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
 KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
 
-SRC_URI_append_akita = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_c7x0 = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_poodle = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_spitz = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_tosa = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-do_configure_prepend() {
-
-    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
-        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
-    fi
-}
+include linux-yocto-handhelds.inc
diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index 1637c0b..c74d8c1 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -1,54 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
 
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
-
-DEFAULT_PREFERENCE_akita = "1"
-DEFAULT_PREFERENCE_c7x0 = "1"
-DEFAULT_PREFERENCE_collie = "1"
-DEFAULT_PREFERENCE_poodle = "1"
-DEFAULT_PREFERENCE_spitz = "1"
-DEFAULT_PREFERENCE_tosa = "1"
-
-KMACHINE_akita = "akita"
-KMACHINE_c7x0 = "c7x0"
-KMACHINE_collie = "collie"
-KMACHINE_poodle = "poodle"
-KMACHINE_spitz = "spitz"
-KMACHINE_tosa = "tosa"
-
-SRC_URI_append_akita = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_c7x0 = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_collie = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_poodle = " \
-           file://feature-top.scc \
-           file://qvga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_spitz = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-SRC_URI_append_tosa = " \
-           file://feature-top.scc \
-           file://vga/logo_linux_clut224.ppm.bz2 \
-           "
-
-do_configure_prepend() {
-
-    if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
-        install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm ${WORKDIR}/linux/drivers/video/logo/logo_linux_clut224.ppm
-    fi
-}
+include linux-yocto-handhelds.inc
-- 
1.8.1.5


