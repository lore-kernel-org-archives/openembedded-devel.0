Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA6CC65DBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 22:38:52 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so747457eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 15:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+CzAlmaiu1SVUZXjLsTxmB3pWyn+Zgw3hCrP9q9bXk8=;
	b=prZAoJDxtoFDr4nEowF6G/ON28lcu3NGP/2w2CWSR1BQ2ma/6qP4geOC4JizQyhAXW
	kUHg/uEujwYszHEGvBckmhYICYAdObI5up5EODoZtA4DYAxDIgWBAQV1VW/0lqMxGfVE
	1EocGX9e10tdykOo6HDNkvgwXWbwFO3RyzahsjwgXgMv91e0mAIsAz8DKLcVcRX02K7t
	QrGhZOI0YKFAjktsRWLOod65fZit/3TjAJJNRoXqb2cyBkDn+73hyWi/FMNR+DOFL5BN
	Oyxfsd5YFj2Cz6KXhvYfvUeM4YoMgqVAd4uxXK28KKsy1HgqELJxSic1FYZrQlrQD+QH
	/D+Q==
X-Received: by 10.14.98.69 with SMTP id u45mr346186eef.81.1398811132860;
	Tue, 29 Apr 2014 15:38:52 -0700 (PDT)
Received: from mizar.208.67.220.220 ([87.13.50.57])
	by mx.google.com with ESMTPSA id u46sm62706797eel.1.2014.04.29.15.38.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Apr 2014 15:38:52 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 00:38:43 +0200
Message-Id: <1398811123-18572-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1398811123-18572-1-git-send-email-andrea.adami@gmail.com>
References: <1398811123-18572-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto*: explicitly declare KCONFIG_MODE
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
X-List-Received-Date: Tue, 29 Apr 2014 22:38:53 -0000

The default for fragment-based recipes is '--alldefconfig'
but using defconfig it is necessary to specify it.
(An hidden bug in the kernel tools has masked that until now...)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-dev.bbappend              |  4 ++++
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend         | 14 ++++++++++----
 recipes-kernel/linux/linux-yocto_3.10.bbappend             | 11 +++++++++++
 recipes-kernel/linux/linux-yocto_3.14.bbappend             |  9 +++++++++
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-dev.bbappend b/recipes-kernel/linux/linux-yocto-dev.bbappend
index a3571c8..4594c6d 100644
--- a/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -8,6 +8,10 @@ COMPATIBLE_MACHINE .= "|h1940"
 KERNEL_EXTRA_FEATURES_h1940 ?= ""
 KMACHINE_h1940 = "h1940"
 
+# Note: Providing "defconfig" we bypass the linux-yocto processing
+# re-expand the defconfig produced by "make_savedefconfig"
+KCONFIG_MODE_h1940 = "--alldefconfig"
+
 SRC_URI_append_h1940 = " \
            file://defconfig \
            file://0001-s3c24xx-DMA-don-t-use-autoreload-feature.patch \
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index 69179f3..a6a7741 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -1,8 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/linux-yocto-3.10:${THISDIR}/files:"
 
-# re-expand the defconfig produced by 'make savedefconfig'
-KCONFIG_MODE = "--alldefconfig"
-
 COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
 
 # Zaurus machines need kernel size-check.
@@ -10,8 +7,8 @@ KERNEL_IMAGE_MAXSIZE_akita = "1294336"
 KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
 KERNEL_IMAGE_MAXSIZE_collie = "1048576"
 KERNEL_IMAGE_MAXSIZE_poodle = "1294336"
-KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
 KERNEL_IMAGE_MAXSIZE_spitz = "1294336"
+KERNEL_IMAGE_MAXSIZE_tosa = "1294336"
 
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
@@ -20,6 +17,15 @@ KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
 
+# Note: Providing "defconfig" we bypass the linux-yocto processing
+# re-expand the defconfig produced by "make_savedefconfig"
+KCONFIG_MODE_akita = "--alldefconfig"
+KCONFIG_MODE_c7x0 = "--alldefconfig"
+KCONFIG_MODE_collie = "--alldefconfig"
+KCONFIG_MODE_poodle = "--alldefconfig"
+KCONFIG_MODE_spitz = "--alldefconfig"
+KCONFIG_MODE_tosa = "--alldefconfig"
+
 SRC_URI_append_akita = " \
            file://defconfig \
            file://patches/patches-pxa/sharpsl_param.patch \
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index c7f43ad..d4ad6b3 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -23,6 +23,17 @@ KMACHINE_poodle = "poodle"
 KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
 
+# Note: Providing "defconfig" we bypass the linux-yocto processing
+# re-expand the defconfig produced by "make_savedefconfig"
+KCONFIG_MODE_akita = "--alldefconfig"
+KCONFIG_MODE_c7x0 = "--alldefconfig"
+KCONFIG_MODE_collie = "--alldefconfig"
+KCONFIG_MODE_h3600 = "--alldefconfig"
+KCONFIG_MODE_hx4700 = "--alldefconfig"
+KCONFIG_MODE_poodle = "--alldefconfig"
+KCONFIG_MODE_spitz = "--alldefconfig"
+KCONFIG_MODE_tosa = "--alldefconfig"
+
 SRC_URI_append_akita = " \
            file://feature-top.scc \
            file://vga/logo_linux_clut224.ppm.bz2 \
diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 95d0a0e..335fe27 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -22,6 +22,15 @@ KMACHINE_spitz = "spitz"
 KMACHINE_tosa = "tosa"
 
 # Note: Providing "defconfig" we bypass the linux-yocto processing
+# re-expand the defconfig produced by "make_savedefconfig"
+KCONFIG_MODE_akita = "--alldefconfig"
+KCONFIG_MODE_c7x0 = "--alldefconfig"
+KCONFIG_MODE_collie = "--alldefconfig"
+KCONFIG_MODE_h3600 = "--alldefconfig"
+KCONFIG_MODE_hx4700 = "--alldefconfig"
+KCONFIG_MODE_poodle = "--alldefconfig"
+KCONFIG_MODE_spitz = "--alldefconfig"
+KCONFIG_MODE_tosa = "--alldefconfig"
 
 SRC_URI_append_akita = " \
            file://defconfig \
-- 
1.9.1


