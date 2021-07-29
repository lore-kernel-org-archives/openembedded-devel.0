Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.9875.1627567456400113259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 07:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DmuBuD0R;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so4124386wmd.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NDAYLnELUNX8PwXcdHhVmHE3Xz0pOinTaXckzVleiY=;
        b=DmuBuD0RW/1vfK9agICeQmJDl1qUb5iof2iBbJY2VKUuoMpxSe/+WAoMRovjrD926e
         dFYw9Pwz36MGlWe9DFl9vhHi9I2MWhLRYvKkEFs9RRW1rRdkzEC0/bK+hRza8LzxpzCf
         F3liL+zN3Ci44JDRCeh2xDXIJqu10czfJIzlXWy/XFF+mRKeXpnYCApmsfEd7tHZSGxF
         H0iQQAtd6Fw8cafWTAmwzI0WA0lwPB0G5PZb3eCHEFIBzwHUodPtdVUUr+rl8r/yDQY7
         yUO3qDIa7mBA+0PH7+29SMs2QfqkDGT/6krsc9lr7WJW0b6+UXpBR6ejFxz9DxQDuLjz
         7qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NDAYLnELUNX8PwXcdHhVmHE3Xz0pOinTaXckzVleiY=;
        b=gvmk+AXRrYMZCYhnAIzZXi8q2hWJzPZYlTJZdV4qJ4MCCPNivNlQv+iYTtc8G7uAUH
         QZCqderZybwT10+Tpe6Th8YkSu8sUcfJUglHx9WNh8au0r86sXVAC+BU/wety9B5nSb+
         jSRUYjzErXdTw4vuOgGu+k9XzVUvTHkcCtFhLlPlrVb7dtuQdP2DOm1CRa5gWmaL1k5z
         53VJ8b1Oh+BBzwpOxOne0hJu3cSMRIKIMpVWyvklhtWKGizdccmgUFjqav2TUmHc578j
         znbL/uFpdm2dUs1Pb8DB740bZaCK+2uZRgfBi1dhyNUlqMqIQBnOQHEi0lrJKCk3sXco
         iFGA==
X-Gm-Message-State: AOAM530OCy79HJq1H7IvfvKGABKfg+DPE7B7iGpPDLPAp0yVDe7CdX7b
	XWzcfxGcwQdPLy8GqJ6dxbOVcTq8Tm4=
X-Google-Smtp-Source: ABdhPJzxXwvu7Z/+Iku4i76AUSjmecWa57CUl4QnWN7TvijFdC71DRZeGdhpzdnTUGPbQvakO1Taow==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id o13mr5019703wmq.132.1627567454173;
        Thu, 29 Jul 2021 07:04:14 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.81.208])
        by smtp.gmail.com with ESMTPSA id l9sm3213838wro.92.2021.07.29.07.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:04:13 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.22 -> 6.1.24
Date: Thu, 29 Jul 2021 16:04:09 +0200
Message-Id: <20210729140409.1423786-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch to fix build failure with kernel 5.13, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../40-linux-5.13-support.patch               | 276 ------------------
 ...s_6.1.22.bb => vboxguestdrivers_6.1.26.bb} |   6 +-
 2 files changed, 3 insertions(+), 279 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.22.bb => vboxguestdrivers_6.1.26.bb} (94%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
deleted file mode 100644
index e95e24049..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
+++ /dev/null
@@ -1,276 +0,0 @@
-Subject: Fix build errors with linux 5.13
-Origin: upstream, https://www.virtualbox.org/browser/vbox/trunk
-Bug: https://bugs.launchpad.net/bugs/1929193
-
-diff -urpN virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_drv.h virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_drv.h
---- virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_drv.h	2021-04-28 16:24:47.000000000 +0000
-+++ virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_drv.h	2021-06-23 10:08:44.431714404 +0000
-@@ -46,20 +41,20 @@
-  * Evaluates to true if the linux kernel version is equal or higher to the
-  * one specfied. */
- #define RTLNX_VER_MIN(a_Major, a_Minor, a_Patch) \
--    (LINUX_VERSION_CODE >= KERNEL_VERSION(a_Major, a_Minor, a_Patch))
-+	(LINUX_VERSION_CODE >= KERNEL_VERSION(a_Major, a_Minor, a_Patch))
- 
- /** @def RTLNX_VER_MAX
-  * Evaluates to true if the linux kernel version is less to the one specfied
-  * (exclusive). */
- #define RTLNX_VER_MAX(a_Major, a_Minor, a_Patch) \
--    (LINUX_VERSION_CODE < KERNEL_VERSION(a_Major, a_Minor, a_Patch))
-+	(LINUX_VERSION_CODE < KERNEL_VERSION(a_Major, a_Minor, a_Patch))
- 
- /** @def RTLNX_VER_RANGE
-  * Evaluates to true if the linux kernel version is equal or higher to the given
-  * minimum version and less (but not equal) to the maximum version (exclusive). */
- #define RTLNX_VER_RANGE(a_MajorMin, a_MinorMin, a_PatchMin,  a_MajorMax, a_MinorMax, a_PatchMax) \
--    (   LINUX_VERSION_CODE >= KERNEL_VERSION(a_MajorMin, a_MinorMin, a_PatchMin) \
--     && LINUX_VERSION_CODE <  KERNEL_VERSION(a_MajorMax, a_MinorMax, a_PatchMax) )
-+	(   LINUX_VERSION_CODE >= KERNEL_VERSION(a_MajorMin, a_MinorMin, a_PatchMin) \
-+	 && LINUX_VERSION_CODE <  KERNEL_VERSION(a_MajorMax, a_MinorMax, a_PatchMax) )
- 
- 
- /** @def RTLNX_RHEL_MIN
-@@ -70,7 +65,7 @@
-  */
- #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
- # define RTLNX_RHEL_MIN(a_iMajor, a_iMinor) \
--     ((RHEL_MAJOR) > (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) >= (a_iMinor)))
-+	 ((RHEL_MAJOR) > (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) >= (a_iMinor)))
- #else
- # define RTLNX_RHEL_MIN(a_iMajor, a_iMinor) (0)
- #endif
-@@ -83,7 +78,7 @@
-  */
- #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
- # define RTLNX_RHEL_MAX(a_iMajor, a_iMinor) \
--     ((RHEL_MAJOR) < (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) < (a_iMinor)))
-+	 ((RHEL_MAJOR) < (a_iMajor) || ((RHEL_MAJOR) == (a_iMajor) && (RHEL_MINOR) < (a_iMinor)))
- #else
- # define RTLNX_RHEL_MAX(a_iMajor, a_iMinor) (0)
- #endif
-@@ -95,7 +90,7 @@
-  */
- #if defined(RHEL_MAJOR) && defined(RHEL_MINOR)
- # define RTLNX_RHEL_RANGE(a_iMajorMin, a_iMinorMin,  a_iMajorMax, a_iMinorMax) \
--     (RTLNX_RHEL_MIN(a_iMajorMin, a_iMinorMin) && RTLNX_RHEL_MAX(a_iMajorMax, a_iMinorMax))
-+	 (RTLNX_RHEL_MIN(a_iMajorMin, a_iMinorMin) && RTLNX_RHEL_MAX(a_iMajorMax, a_iMinorMax))
- #else
- # define RTLNX_RHEL_RANGE(a_iMajorMin, a_iMinorMin,  a_iMajorMax, a_iMinorMax)  (0)
- #endif
-@@ -173,7 +168,9 @@
- #include <drm/ttm/ttm_bo_api.h>
- #include <drm/ttm/ttm_bo_driver.h>
- #include <drm/ttm/ttm_placement.h>
-+#if RTLNX_VER_MAX(5,13,0)
- #include <drm/ttm/ttm_memory.h>
-+#endif
- #if RTLNX_VER_MAX(5,12,0)
- # include <drm/ttm/ttm_module.h>
- #endif
-@@ -222,7 +219,7 @@ static inline void drm_gem_object_put(st
- 				 VBVA_ADAPTER_INFORMATION_SIZE)
- #define GUEST_HEAP_SIZE   VBVA_ADAPTER_INFORMATION_SIZE
- #define GUEST_HEAP_USABLE_SIZE (VBVA_ADAPTER_INFORMATION_SIZE - \
--				sizeof(HGSMIHOSTFLAGS))
-+				sizeof(struct hgsmi_host_flags))
- #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE
- 
- /** How frequently we refresh if the guest is not providing dirty rectangles. */
-@@ -232,7 +229,7 @@ static inline void drm_gem_object_put(st
- static inline void *devm_kcalloc(struct device *dev, size_t n, size_t size,
- 				 gfp_t flags)
- {
--    return devm_kzalloc(dev, n * size, flags);
-+	return devm_kzalloc(dev, n * size, flags);
- }
- #endif
- 
-@@ -244,7 +241,7 @@ struct vbox_private {
- 	u8 __iomem *guest_heap;
- 	u8 __iomem *vbva_buffers;
- 	struct gen_pool *guest_pool;
--	struct VBVABUFFERCONTEXT *vbva_info;
-+	struct vbva_buf_context *vbva_info;
- 	bool any_pitch;
- 	u32 num_crtcs;
- 	/** Amount of available VRAM, including space used for buffers. */
-@@ -252,7 +249,7 @@ struct vbox_private {
- 	/** Amount of available VRAM, not including space used for buffers. */
- 	u32 available_vram_size;
- 	/** Array of structures for receiving mode hints. */
--	VBVAMODEHINT *last_mode_hints;
-+	struct vbva_modehint *last_mode_hints;
- 
- 	struct vbox_fbdev *fbdev;
- 
-@@ -263,7 +260,11 @@ struct vbox_private {
- 		struct drm_global_reference mem_global_ref;
- 		struct ttm_bo_global_ref bo_global_ref;
- #endif
-+#if RTLNX_VER_MIN(5,13,0) 
-+		struct ttm_device bdev; 
-+#else
- 		struct ttm_bo_device bdev;
-+#endif
- 		bool mm_initialised;
- 	} ttm;
- 
-diff -urpN virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_ttm.c virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_ttm.c
---- virtualbox-6.1.22-dfsg.orig/src/VBox/Additions/linux/drm/vbox_ttm.c	2021-04-28 16:24:47.000000000 +0000
-+++ virtualbox-6.1.22-dfsg/src/VBox/Additions/linux/drm/vbox_ttm.c	2021-06-23 10:08:07.164057918 +0000
-@@ -48,7 +43,11 @@
- #endif
- 
- 
-+#if RTLNX_VER_MIN(5,13,0)
-+static inline struct vbox_private *vbox_bdev(struct ttm_device *bd)
-+#else
- static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
-+#endif
- {
- 	return container_of(bd, struct vbox_private, ttm.bdev);
- }
-@@ -188,7 +187,7 @@ static int vbox_ttm_io_mem_reserve(struc
- 	mem->bus.size = mem->num_pages << PAGE_SHIFT;
- 	mem->bus.base = 0;
- 	mem->bus.is_iomem = false;
--	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
-+	 if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
- 		return -EINVAL;
- 	switch (mem->mem_type) {
- 	case TTM_PL_SYSTEM:
-@@ -205,8 +204,13 @@ static int vbox_ttm_io_mem_reserve(struc
- 	return 0;
- }
- #else
-+# if RTLNX_VER_MAX(5,13,0)
- static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
- 				   struct ttm_resource *mem)
-+# else /* > 5.13.0 */
-+static int vbox_ttm_io_mem_reserve(struct ttm_device *bdev,
-+				   struct ttm_resource *mem)
-+# endif /* > 5.13.0 */
- {
- 	struct vbox_private *vbox = vbox_bdev(bdev);
- 	mem->bus.addr = NULL;
-@@ -241,7 +245,12 @@ static int vbox_ttm_io_mem_reserve(struc
- 
- 
- 
--#if RTLNX_VER_MIN(5,10,0)
-+#if RTLNX_VER_MIN(5,13,0)
-+static void vbox_ttm_io_mem_free(struct ttm_device *bdev,
-+				 struct ttm_resource *mem)
-+{
-+}
-+#elif RTLNX_VER_MIN(5,10,0)
- static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
- 				 struct ttm_resource *mem)
- {
-@@ -253,7 +262,13 @@ static void vbox_ttm_io_mem_free(struct
- }
- #endif
- 
--#if RTLNX_VER_MIN(5,10,0)
-+#if RTLNX_VER_MIN(5,13,0)
-+static void vbox_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt)
-+{
-+	ttm_tt_fini(tt);
-+	kfree(tt);
-+}
-+#elif RTLNX_VER_MIN(5,10,0)
- static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt)
- {
- 	ttm_tt_fini(tt);
-@@ -333,7 +348,11 @@ static int vbox_bo_move(struct ttm_buffe
- }
- #endif
- 
-+#if RTLNX_VER_MIN(5,13,0)
-+static struct ttm_device_funcs vbox_bo_driver = {
-+#else /* < 5.13.0 */
- static struct ttm_bo_driver vbox_bo_driver = {
-+#endif /* < 5.13.0 */
- 	.ttm_tt_create = vbox_ttm_tt_create,
- #if RTLNX_VER_MIN(5,10,0)
- 	.ttm_tt_destroy = vbox_ttm_tt_destroy,
-@@ -370,14 +389,22 @@ int vbox_mm_init(struct vbox_private *vb
- {
- 	int ret;
- 	struct drm_device *dev = vbox->dev;
-+#if RTLNX_VER_MIN(5,13,0)
-+	struct ttm_device *bdev = &vbox->ttm.bdev;
-+#else
- 	struct ttm_bo_device *bdev = &vbox->ttm.bdev;
-+#endif
- 
- #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
- 	ret = vbox_ttm_global_init(vbox);
- 	if (ret)
- 		return ret;
- #endif
-+#if RTLNX_VER_MIN(5,13,0)
-+	ret = ttm_device_init(&vbox->ttm.bdev,
-+#else
- 	ret = ttm_bo_device_init(&vbox->ttm.bdev,
-+#endif
- #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
- 				 vbox->ttm.bo_global_ref.ref.object,
- #endif
-@@ -429,7 +456,11 @@ int vbox_mm_init(struct vbox_private *vb
- 	return 0;
- 
- err_device_release:
-+#if RTLNX_VER_MIN(5,13,0)
-+	ttm_device_fini(&vbox->ttm.bdev);
-+#else
- 	ttm_bo_device_release(&vbox->ttm.bdev);
-+#endif
- #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
- err_ttm_global_release:
- 	vbox_ttm_global_release(vbox);
-@@ -446,7 +477,11 @@ void vbox_mm_fini(struct vbox_private *v
- #else
- 	arch_phys_wc_del(vbox->fb_mtrr);
- #endif
-+#if RTLNX_VER_MIN(5,13,0)
-+        ttm_device_fini(&vbox->ttm.bdev);
-+#else
- 	ttm_bo_device_release(&vbox->ttm.bdev);
-+#endif
- #if RTLNX_VER_MAX(5,0,0) && !RTLNX_RHEL_MAJ_PREREQ(7,7) && !RTLNX_RHEL_MAJ_PREREQ(8,1)
- 	vbox_ttm_global_release(vbox);
- #endif
-@@ -528,7 +563,9 @@ int vbox_bo_create(struct drm_device *de
- {
- 	struct vbox_private *vbox = dev->dev_private;
- 	struct vbox_bo *vboxbo;
-+#if RTLNX_VER_MAX(5,13,0)
- 	size_t acc_size;
-+#endif
- 	int ret;
- 
- 	vboxbo = kzalloc(sizeof(*vboxbo), GFP_KERNEL);
-@@ -551,16 +588,20 @@ int vbox_bo_create(struct drm_device *de
- 
- 	vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBOX_MEM_TYPE_SYSTEM);
- 
-+#if RTLNX_VER_MAX(5,13,0)
- 	acc_size = ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
- 				       sizeof(struct vbox_bo));
-+#endif
- 
- 	ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
- 			  ttm_bo_type_device, &vboxbo->placement,
- #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
- 			  align >> PAGE_SHIFT, false, NULL, acc_size,
--#else
-+#elif RTLNX_VER_MAX(5,13,0) /* < 5.13.0 */
- 			  align >> PAGE_SHIFT, false, acc_size,
--#endif
-+#else /* > 5.13.0 */
-+			  align >> PAGE_SHIFT, false,
-+#endif /* > 5.13.0 */
- #if RTLNX_VER_MIN(3,18,0) || RTLNX_RHEL_MAJ_PREREQ(7,2)
- 			  NULL, NULL, vbox_bo_ttm_destroy);
- #else
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
similarity index 94%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
index 19b8f8f46..1b2fb4403 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
@@ -13,11 +13,11 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://40-linux-5.13-support.patch \
     file://add__divmoddi4.patch \
 "
-SRC_URI[md5sum] = "abb1a20021e5915fe38c666e8c11cf80"
-SRC_URI[sha256sum] = "99816d2a15205d49362a31e8ffeb8262d2fa0678c751dfd0a7c43b2faca8be49"
+
+SRC_URI[md5sum] = "fce04bbef244b4df1a50e53d132d3e6f"
+SRC_URI[sha256sum] = "0212602eea878d6c9fd7f4a3e0182da3e4505f31d25f5539fb8f7b1fbe366195"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

