Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id EBF756CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 23:09:51 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so4244eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 16:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z8lWsMyC8l+YkEtjdC+EmeTnos2yr+Xzoi4pSbxGVm0=;
	b=jZWNu31AVjDYpNCmhdwI5eoQ1LhHqWbYnoUU3uZttiGcUb8VcbEgYJ0BloudxX4zY9
	EdAr381Mz4A+V5GhyIm+t/2CYS3SxousaZS0Vso8LcFJOdDR56y8EASvQnJOkVKIDfDS
	Z1GBVZZP+WzLtNV4VLxSPw+2XCDs3in+kz1yunjq5BYP66UQ7uM4MTDYVCwMeUzxcAHS
	JCgr981QnvoWyxBphswI4TyUHZCJg6l30jWIHgFabm8KF3kfmfc4itympj9IvmiLm41F
	DKfjlskxwsmJ4dcqd5PTBpIOihtblvAMfIWS8msTHOcf7kffFIz3D+5eblXoMB/4T1Tk
	zk/Q==
X-Received: by 10.15.45.8 with SMTP id a8mr6210021eew.1.1381273793464;
	Tue, 08 Oct 2013 16:09:53 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id f49sm81229054eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 16:09:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 01:09:46 +0200
Message-Id: <1381273786-10336-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH v2] linux-yocto-handhelds.inc: split COMPATIBLE_MACHINE filtering
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
X-List-Received-Date: Tue, 08 Oct 2013 23:09:52 -0000

This allows to add new machines to one single kernel variant

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-dev.bbappend                 | 2 ++
 recipes-kernel/linux/linux-yocto-handhelds.inc                | 2 --
 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend | 2 ++
 recipes-kernel/linux/linux-yocto_3.10.bbappend                | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-dev.bbappend b/recipes-kernel/linux/linux-yocto-dev.bbappend
index 5d7e4bd..31b2db3 100644
--- a/recipes-kernel/linux/linux-yocto-dev.bbappend
+++ b/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-dev:${THISDIR}/${PN}:${THISDIR}/files:"
 
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+
 # Override kernel features
 #KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 
diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index 2e0b7a9..119086f 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -1,5 +1,3 @@
-COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
-
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
 KMACHINE_collie = "collie"
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index 2ca53cb..eddffd6 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
 
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1294336"
 KERNEL_IMAGE_MAXSIZE_c7x0 = "1294336"
diff --git a/recipes-kernel/linux/linux-yocto_3.10.bbappend b/recipes-kernel/linux/linux-yocto_3.10.bbappend
index 1f42ecc..537bf37 100644
--- a/recipes-kernel/linux/linux-yocto_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.10.bbappend
@@ -1,5 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.10:${THISDIR}/${PN}:${THISDIR}/files:"
 
+COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
+
 # Override kernel features
 #KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 
@@ -10,5 +12,4 @@ KERNEL_EXTRA_FEATURES_poodle ?= ""
 KERNEL_EXTRA_FEATURES_spitz ?= ""
 KERNEL_EXTRA_FEATURES_tosa ?= ""
 
-
 require linux-yocto-handhelds.inc
-- 
1.8.1.5


