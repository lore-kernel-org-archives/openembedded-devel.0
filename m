Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.17211.1627601825431724411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KkI1Jay4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id z3so7508733plg.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZWczH5udRBwbZ0c1IpFYWI6dI1GicSCbJUKWUSjkapE=;
        b=KkI1Jay4IHaEM3dqAYai6opPTNPJIU9CsNm1CwhG+vZno2/OteyxdkOZ6LHWXABPX9
         7gR1oQuDyPaznJYQ9fpAIcnop2hf9adll3D2RPrLsJPYqhLYDQTEpkrZBFPFLRQhslY2
         ssoBTCbgFF65fv7r2DbgKPx0rM6iMSrwHrKoKE9/0BSiAiAvrMOaPlEoitcCNI4LRRnA
         76Q2u0B5JpId3PrBEl+td5xyu/nVh56cWNEOx9FxeOgdVKSIoGzHfEDZcri+8J0iFdnw
         JPUNx/4oQuy6QhZUAtEx0N5qJ1/sWV+LrBfDqOjDxa8c96x53csqhh8Gi6xxd1tc7oG7
         xAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZWczH5udRBwbZ0c1IpFYWI6dI1GicSCbJUKWUSjkapE=;
        b=hNKNnKY8obLCnzkNQCRW4XdK9XbvBjZygIPIAGAE3V1wE4qOkq7fuP57X+0HYJcP6P
         ezUImtwyXmwkXFIaw/kh3VEV60hd9XrKWpP8NUtUTeNqVcjfvW0OoLgokfc/n0V5GfTH
         edJOJu1rLWuHrvYeiB4Nkz9szFLddu13/OmjuRCjQ29p/0Jy/P2CbsXTkg3rAzVPv5OE
         Gp6I/WJljWkP5lUcMCBumEnXNNkifkAaaOZmSxTQrT9VxoaKa9IaN3kRP3dLcMYKv4Tq
         qCV0Ng5cjHgN586EDAbGyCqATn1MUGQESNFoqLs2puBLHzS3lXF6MLoLYDE5k2sxjwPi
         IrMw==
X-Gm-Message-State: AOAM533KtVjF3ipatVKx2mmaLTB0LU7tFENpPPhP2/iZEqm668M8c7Nv
	W0p/4zNdL7klPuvD30VoiYC7vUJYEmjHEA==
X-Google-Smtp-Source: ABdhPJytAhXKM/IHhOh0Qk5r1WrzMbPipnDDOwP+KICViSFrp+9GO4GBL3/g0z36olN7VQIVemQ9Pg==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr17897153pjb.192.1627601824833;
        Thu, 29 Jul 2021 16:37:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:04 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/15] vboxguestdrivers: add a fix for build failure with kernel 5.13
Date: Thu, 29 Jul 2021 16:36:46 -0700
Message-Id: <2e15d7eb66624c1755e8670f8c5448e3a9be0a21.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

Its already upstream and also used in Debian and Ubuntu

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d0f2d7c954b9f3befd9470d97de581fe5b1fb2a8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../40-linux-5.13-support.patch               | 276 ++++++++++++++++++
 .../vboxguestdrivers_6.1.22.bb                |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
new file mode 100644
index 0000000000..e95e240492
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
@@ -0,0 +1,276 @@
+Subject: Fix build errors with linux 5.13
+Origin: upstream, https://www.virtualbox.org/browser/vbox/trunk
+Bug: https://bugs.launchpad.net/bugs/1929193
+
+diff -urpN virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_drv.h virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_drv.h
+--- virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_drv.h	2021-04-28 16:24:47.000000000 +0000
++++ virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_drv.h	2021-06-23 10:08:44.431714404 +0000
+@@ -46,20 +41,20 @@
+  * Evaluates to true if the linux kernel version is equal or higher to the
+  * one specfied. */
+ #define RTLNX_VER_MIN(a_Major, a_Minor, a_Patch) \
+-    (LINUX_VERSION_CODE >= KERNEL_VERSION(a_Major, a_Minor, a_Patch))
++	(LINUX_VERSION_CODE >= KERNEL_VERSION(a_Major, a_Minor, a_Patch))
+ 
+ /** @def RTLNX_VER_MAX
+  * Evaluates to true if the linux kernel version is less to the one specfied
+  * (exclusive). */
+ #define RTLNX_VER_MAX(a_Major, a_Minor, a_Patch) \
+-    (LINUX_VERSION_CODE < KERNEL_VERSION(a_Major, a_Minor, a_Patch))
++	(LINUX_VERSION_CODE < KERNEL_VERSION(a_Major, a_Minor, a_Patch))
+ 
+ /** @def RTLNX_VER_RANGE
+  * Evaluates to true if the linux kernel version is equal or higher to the given
+  * minimum version and less (but not equal) to the maximum version (exclusive). */
+ #define RTLNX_VER_RANGE(a_MajorMin, a_MinorMin, a_PatchMin,  a_MajorMax, a_MinorMax, a_PatchMax) \
+-    (   LINUX_VERSION_CODE >= KERNEL_VERSION(a_MajorMin, a_MinorMin, a_PatchMin) \
+-     && LINUX_VERSION_CODE <  KERNEL_VERSION(a_MajorMax, a_MinorMax, a_PatchMax) )
++	(   LINUX_VERSION_CODE >= KERNEL_VERSION(a_MajorMin, a_MinorMin, a_PatchMin) \
++	 && LINUX_VERSION_CODE <  KERNEL_VERSION(a_MajorMax, a_MinorMax, a_PatchMax) )
+ 
+ 
+ /** @def RTLNX_RHEL_MIN
+@@ -70,7 +65,7 @@
+  */
+ #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
+ # define RTLNX_RHEL_MIN(a_iMajor, a_iMinor) \
+-     ((RHEL_MAJOR) > (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) >= (a_iMinor)))
++	 ((RHEL_MAJOR) > (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) >= (a_iMinor)))
+ #else
+ # define RTLNX_RHEL_MIN(a_iMajor, a_iMinor) (0)
+ #endif
+@@ -83,7 +78,7 @@
+  */
+ #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
+ # define RTLNX_RHEL_MAX(a_iMajor, a_iMinor) \
+-     ((RHEL_MAJOR) < (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) < (a_iMinor)))
++	 ((RHEL_MAJOR) < (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) < (a_iMinor)))
+ #else
+ # define RTLNX_RHEL_MAX(a_iMajor, a_iMinor) (0)
+ #endif
+@@ -95,7 +90,7 @@
+  */
+ #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
+ # define RTLNX_RHEL_RANGE(a_iMajorMin, a_iMinorMin,  a_iMajorMax, a_iMinorMax) \
+-     (RTLNX_RHEL_MIN(a_iMajorMin, a_iMinorMin) && RTLNX_RHEL_MAX(a_iMajorMax, a_iMinorMax))
++	 (RTLNX_RHEL_MIN(a_iMajorMin, a_iMinorMin) && RTLNX_RHEL_MAX(a_iMajorMax, a_iMinorMax))
+ #else
+ # define RTLNX_RHEL_RANGE(a_iMajorMin, a_iMinorMin,  a_iMajorMax, a_iMinorMax)  (0)
+ #endif
+@@ -173,7 +168,9 @@
+ #include <drm/ttm/ttm_bo_api.h>
+ #include <drm/ttm/ttm_bo_driver.h>
+ #include <drm/ttm/ttm_placement.h>
++#if RTLNX_VER_MAX(5,13,0)
+ #include <drm/ttm/ttm_memory.h>
++#endif
+ #if RTLNX_VER_MAX(5,12,0)
+ # include <drm/ttm/ttm_module.h>
+ #endif
+@@ -222,7 +219,7 @@ static inline void drm_gem_object_put(st
+ 				 VBVA_ADAPTER_INFORMATION_SIZE)
+ #define GUEST_HEAP_SIZE   VBVA_ADAPTER_INFORMATION_SIZE
+ #define GUEST_HEAP_USABLE_SIZE (VBVA_ADAPTER_INFORMATION_SIZE - \
+-				sizeof(HGSMIHOSTFLAGS))
++				sizeof(struct hgsmi_host_flags))
+ #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE
+ 
+ /** How frequently we refresh if the guest is not providing dirty rectangles. */
+@@ -232,7 +229,7 @@ static inline void drm_gem_object_put(st
+ static inline void *devm_kcalloc(struct device *dev, size_t n, size_t size,
+ 				 gfp_t flags)
+ {
+-    return devm_kzalloc(dev, n * size, flags);
++	return devm_kzalloc(dev, n * size, flags);
+ }
+ #endif
+ 
+@@ -244,7 +241,7 @@ struct vbox_private {
+ 	u8 __iomem *guest_heap;
+ 	u8 __iomem *vbva_buffers;
+ 	struct gen_pool *guest_pool;
+-	struct VBVABUFFERCONTEXT *vbva_info;
++	struct vbva_buf_context *vbva_info;
+ 	bool any_pitch;
+ 	u32 num_crtcs;
+ 	/** Amount of available VRAM, including space used for buffers. */
+@@ -252,7 +249,7 @@ struct vbox_private {
+ 	/** Amount of available VRAM, not including space used for buffers. */
+ 	u32 available_vram_size;
+ 	/** Array of structures for receiving mode hints. */
+-	VBVAMODEHINT *last_mode_hints;
++	struct vbva_modehint *last_mode_hints;
+ 
+ 	struct vbox_fbdev *fbdev;
+ 
+@@ -263,7 +260,11 @@ struct vbox_private {
+ 		struct drm_global_reference mem_global_ref;
+ 		struct ttm_bo_global_ref bo_global_ref;
+ #endif
++#if RTLNX_VER_MIN(5,13,0) 
++		struct ttm_device bdev; 
++#else
+ 		struct ttm_bo_device bdev;
++#endif
+ 		bool mm_initialised;
+ 	} ttm;
+ 
+diff -urpN virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_ttm.c virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_ttm.c
+--- virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_ttm.c	2021-04-28 16:24:47.000000000 +0000
++++ virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_ttm.c	2021-06-23 10:08:07.164057918 +0000
+@@ -48,7 +43,11 @@
+ #endif
+ 
+ 
++#if RTLNX_VER_MIN(5,13,0)
++static inline struct vbox_private *vbox_bdev(struct ttm_device *bd)
++#else
+ static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
++#endif
+ {
+ 	return container_of(bd, struct vbox_private, ttm.bdev);
+ }
+@@ -188,7 +187,7 @@ static int vbox_ttm_io_mem_reserve(struc
+ 	mem->bus.size = mem->num_pages << PAGE_SHIFT;
+ 	mem->bus.base = 0;
+ 	mem->bus.is_iomem = false;
+-	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
++	 if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
+ 		return -EINVAL;
+ 	switch (mem->mem_type) {
+ 	case TTM_PL_SYSTEM:
+@@ -205,8 +204,13 @@ static int vbox_ttm_io_mem_reserve(struc
+ 	return 0;
+ }
+ #else
++# if RTLNX_VER_MAX(5,13,0)
+ static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
+ 				   struct ttm_resource *mem)
++# else /* > 5.13.0 */
++static int vbox_ttm_io_mem_reserve(struct ttm_device *bdev,
++				   struct ttm_resource *mem)
++# endif /* > 5.13.0 */
+ {
+ 	struct vbox_private *vbox = vbox_bdev(bdev);
+ 	mem->bus.addr = NULL;
+@@ -241,7 +245,12 @@ static int vbox_ttm_io_mem_reserve(struc
+ 
+ 
+ 
+-#if RTLNX_VER_MIN(5,10,0)
++#if RTLNX_VER_MIN(5,13,0)
++static void vbox_ttm_io_mem_free(struct ttm_device *bdev,
++				 struct ttm_resource *mem)
++{
++}
++#elif RTLNX_VER_MIN(5,10,0)
+ static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
+ 				 struct ttm_resource *mem)
+ {
+@@ -253,7 +262,13 @@ static void vbox_ttm_io_mem_free(struct
+ }
+ #endif
+ 
+-#if RTLNX_VER_MIN(5,10,0)
++#if RTLNX_VER_MIN(5,13,0)
++static void vbox_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
++{
++	ttm_tt_fini(tt);
++	kfree(tt);
++}
++#elif RTLNX_VER_MIN(5,10,0)
+ static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt)
+ {
+ 	ttm_tt_fini(tt);
+@@ -333,7 +348,11 @@ static int vbox_bo_move(struct ttm_buffe
+ }
+ #endif
+ 
++#if RTLNX_VER_MIN(5,13,0)
++static struct ttm_device_funcs vbox_bo_driver = {
++#else /* < 5.13.0 */
+ static struct ttm_bo_driver vbox_bo_driver = {
++#endif /* < 5.13.0 */
+ 	.ttm_tt_create = vbox_ttm_tt_create,
+ #if RTLNX_VER_MIN(5,10,0)
+ 	.ttm_tt_destroy = vbox_ttm_tt_destroy,
+@@ -370,14 +389,22 @@ int vbox_mm_init(struct vbox_private *vb
+ {
+ 	int ret;
+ 	struct drm_device *dev = vbox->dev;
++#if RTLNX_VER_MIN(5,13,0)
++	struct ttm_device *bdev = &vbox->ttm.bdev;
++#else
+ 	struct ttm_bo_device *bdev = &vbox->ttm.bdev;
++#endif
+ 
+ #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
+ 	ret = vbox_ttm_global_init(vbox);
+ 	if (ret)
+ 		return ret;
+ #endif
++#if RTLNX_VER_MIN(5,13,0)
++	ret = ttm_device_init(&vbox->ttm.bdev,
++#else
+ 	ret = ttm_bo_device_init(&vbox->ttm.bdev,
++#endif
+ #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
+ 				 vbox->ttm.bo_global_ref.ref.object,
+ #endif
+@@ -429,7 +456,11 @@ int vbox_mm_init(struct vbox_private *vb
+ 	return 0;
+ 
+ err_device_release:
++#if RTLNX_VER_MIN(5,13,0)
++	ttm_device_fini(&vbox->ttm.bdev);
++#else
+ 	ttm_bo_device_release(&vbox->ttm.bdev);
++#endif
+ #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
+ err_ttm_global_release:
+ 	vbox_ttm_global_release(vbox);
+@@ -446,7 +477,11 @@ void vbox_mm_fini(struct vbox_private *v
+ #else
+ 	arch_phys_wc_del(vbox->fb_mtrr);
+ #endif
++#if RTLNX_VER_MIN(5,13,0)
++        ttm_device_fini(&vbox->ttm.bdev);
++#else
+ 	ttm_bo_device_release(&vbox->ttm.bdev);
++#endif
+ #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
+ 	vbox_ttm_global_release(vbox);
+ #endif
+@@ -528,7 +563,9 @@ int vbox_bo_create(struct drm_device *de
+ {
+ 	struct vbox_private *vbox = dev->dev_private;
+ 	struct vbox_bo *vboxbo;
++#if RTLNX_VER_MAX(5,13,0)
+ 	size_t acc_size;
++#endif
+ 	int ret;
+ 
+ 	vboxbo = kzalloc(sizeof(*vboxbo), GFP_KERNEL);
+@@ -551,16 +588,20 @@ int vbox_bo_create(struct drm_device *de
+ 
+ 	vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBOX_MEM_TYPE_SYSTEM);
+ 
++#if RTLNX_VER_MAX(5,13,0)
+ 	acc_size = ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
+ 				       sizeof(struct vbox_bo));
++#endif
+ 
+ 	ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
+ 			  ttm_bo_type_device, &vboxbo->placement,
+ #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
+ 			  align >> PAGE_SHIFT, false, NULL, acc_size,
+-#else
++#elif RTLNX_VER_MAX(5,13,0) /* < 5.13.0 */
+ 			  align >> PAGE_SHIFT, false, acc_size,
+-#endif
++#else /* > 5.13.0 */
++			  align >> PAGE_SHIFT, false,
++#endif /* > 5.13.0 */
+ #if RTLNX_VER_MIN(3,18,0) || RTLNX_RHEL_MAJ_PREREQ(7,2)
+ 			  NULL, NULL, vbox_bo_ttm_destroy);
+ #else
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
index a074d0a558..19b8f8f46e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
@@ -13,6 +13,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://40-linux-5.13-support.patch \
     file://add__divmoddi4.patch \
 "
 SRC_URI[md5sum] = "abb1a20021e5915fe38c666e8c11cf80"
-- 
2.25.1

