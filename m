Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.40.1611265905062829209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o1C4Tc5a;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id g24so4267836edw.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSxB8LRVTZ85dTNICQDe7/bV+KFe5JmulqFpS0Y91BU=;
        b=o1C4Tc5aCyGHypfck+jsL4HTohfBGVR6I1ohKJv9C+FPev0Z98ykrvRFGL/0VTP/ru
         BavG4FN7jz/S80gdaKfky/bSJ6aHKMk+P6fowTqv/riDKO8x+9zpqnWWLrlP8rt74cAV
         6e+AH9xjlWnJSCyWhniL3/NwJASdmRwkLMlY03TTruffA/DLzgCanvOkIlKA/CAHcXfT
         Z3F0oUCQoONyDW/H+pwBQ8/XiH/srSE84p8GW6y2ApzX7nDKTOqarh2vMIA4gQRcxsPg
         j3q5VNJ0gJtQr1I99WRPGu8fWRH4Ycw4tgdxJma7IgfVqmXnrY+Ufur0pcQp19FUJ7FB
         fr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSxB8LRVTZ85dTNICQDe7/bV+KFe5JmulqFpS0Y91BU=;
        b=e5EyjIjKw0fACPdLVx8ZVny9z28LEX2w2Xdo9WT/cVh0J3SOop+102YuChSbDNdWkp
         g3+T7MGj2mADfNcAiD+6sd7SGWiMJQ0KcmGmIMkTjLdghnKqX1Tw360o5sGEXL9EdSsT
         j6pR2vWeFM6Ql8ZSWnSWeOVzW3fvQ/ZkdXJ1t2k0BqUt8iVInppM1J3Mzb9DPlYc+P37
         4540zmVP5BeSeaez4Ebs+DKhFz/dtLhK3k8MCBBTomcpCKL6DU2RHNJURwIAAQsSHXjO
         o7XiM80A+axcjjcjQurMrcXdNABMWZB4Rq7icz8f4/OdHeZmyvEZx2qOj3vy7FVQ0F6d
         nrsw==
X-Gm-Message-State: AOAM532ZOVMjL9p+WFy3uw6TPlCOETS2lR+WsUhCs+OLBrpZhEyb+IFA
	LM5iSft8Z+rVmTCfrsu82DR2YDfe1PI=
X-Google-Smtp-Source: ABdhPJyJZScIO/CQHEyTQQMqNBGzN0OX4lIPmwV4lozl09i+L4VzL+bFh7dVryFFtSkCUr5trlFAig==
X-Received: by 2002:a05:6402:1a56:: with SMTP id bf22mr941989edb.284.1611265902741;
        Thu, 21 Jan 2021 13:51:42 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan (mob-109-119-49-251.net.vodafone.it. [109.119.49.251])
        by smtp.gmail.com with ESMTPSA id v9sm2780925ejd.92.2021.01.21.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 13:51:41 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
Date: Thu, 21 Jan 2021 22:51:37 +0100
Message-Id: <20210121215138.1509067-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop kernel 5.10 build fixes patches, now part of upstream codebase

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...-linux-drm-Adjustment-for-Linux-5.10.patch | 321 ------------------
 ...0drv-linux.c-Changes-to-support-the-.patch | 119 -------
 ...justment-for-linux-5.10-TASK_SIZE_MA.patch |  46 ---
 ...s_6.1.16.bb => vboxguestdrivers_6.1.18.bb} |   7 +-
 4 files changed, 2 insertions(+), 491 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.16.bb => vboxguestdrivers_6.1.18.bb} (88%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
deleted file mode 100644
index a444901f8..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
+++ /dev/null
@@ -1,321 +0,0 @@
-From b6c765d693a0833b94cb2e91b32842570c3458d2 Mon Sep 17 00:00:00 2001
-From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
-Date: Tue, 15 Dec 2020 22:29:56 +0000
-Subject: [PATCH] Additions/linux/drm: Adjustment for Linux 5.10.
-
-Upstream-Status: Backport
-
-git-svn-id: http://www.virtualbox.org/svn/vbox@87092 cfe28804-0f27-0410-a406-dd0f0b0b656f
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
----
- src/VBox/Additions/linux/drm/vbox_drv.h | 10 +-
- src/VBox/Additions/linux/drm/vbox_fb.c  |  2 +-
- .../src/VBox/Additions/linux/drm/vbox_mode.c  |  2 +-
- src/VBox/Additions/linux/drm/vbox_ttm.c | 99 +++++++++++++++++--
- 4 files changed, 99 insertions(+), 14 deletions(-)
-
-diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h b/src/VBox/Additions/linux/drm/vbox_drv.h
-index 8c85371749..7937f2f2d2 100644
---- a/src/VBox/Additions/linux/drm/vbox_drv.h
-+++ b/src/VBox/Additions/linux/drm/vbox_drv.h
-@@ -175,6 +175,9 @@
- #include <drm/ttm/ttm_placement.h>
- #include <drm/ttm/ttm_memory.h>
- #include <drm/ttm/ttm_module.h>
-+#if RTLNX_VER_MIN(5,10,0)
-+# include <drm/ttm/ttm_resource.h>
-+#endif
- 
- #include "vboxvideo_guest.h"
- #include "vboxvideo_vbe.h"
-@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int size, int align,
- int vbox_gem_create(struct drm_device *dev,
- 		    u32 size, bool iskernel, struct drm_gem_object **obj);
- 
--int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);
-+#define VBOX_MEM_TYPE_VRAM   0x1
-+#define VBOX_MEM_TYPE_SYSTEM 0x2
-+
-+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);
- int vbox_bo_unpin(struct vbox_bo *bo);
- 
- static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
-@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo *bo)
- 	ttm_bo_unreserve(&bo->bo);
- }
- 
--void vbox_ttm_placement(struct vbox_bo *bo, int domain);
-+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
- int vbox_bo_push_sysram(struct vbox_bo *bo);
- int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
- 
-diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Additions/linux/drm/vbox_fb.c
-index adead98d3d..7182d9da1a 100644
---- a/src/VBox/Additions/linux/drm/vbox_fb.c
-+++ b/src/VBox/Additions/linux/drm/vbox_fb.c
-@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *helper,
- 	if (ret)
- 		return ret;
- 
--	ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
-+	ret = vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
- 	if (ret) {
- 		vbox_bo_unreserve(bo);
- 		return ret;
-diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c b/src/VBox/Additions/linux/drm/vbox_mode.c
-index ce7d135cb6..5557db5ef8 100644
---- a/src/VBox/Additions/linux/drm/vbox_mode.c
-+++ b/src/VBox/Additions/linux/drm/vbox_mode.c
-@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc,
- 	if (ret)
- 		return ret;
- 
--	ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
-+	ret = vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr);
- 	vbox_bo_unreserve(bo);
- 	if (ret)
- 		return ret;
-diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c b/src/VBox/Additions/linux/drm/vbox_ttm.c
-index bf87aabc05..5eac926a42 100644
---- a/src/VBox/Additions/linux/drm/vbox_ttm.c
-+++ b/src/VBox/Additions/linux/drm/vbox_ttm.c
-@@ -41,6 +41,7 @@
- #define PLACEMENT_FLAGS(placement) ((placement).flags)
- #endif
- 
-+
- static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
- {
- 	return container_of(bd, struct vbox_private, ttm.bdev);
-@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct ttm_buffer_object *bo)
- 	return false;
- }
- 
-+#if RTLNX_VER_MAX(5,10,0)
- static int
- vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
- 		      struct ttm_mem_type_manager *man)
-@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
- 
- 	return 0;
- }
-+#endif
- 
- static void
- vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
-@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *pl)
- 	if (!vbox_ttm_bo_is_vbox_bo(bo))
- 		return;
- 
--	vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
-+	vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
- 	*pl = vboxbo->placement;
- }
- 
-@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct ttm_buffer_object *bo,
- 	return 0;
- }
- 
-+#if RTLNX_VER_MAX(5,10,0)
- static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
- 				   struct ttm_mem_reg *mem)
- {
--	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
- 	struct vbox_private *vbox = vbox_bdev(bdev);
-+	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
- 
- 	mem->bus.addr = NULL;
- 	mem->bus.offset = 0;
-@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
- 	}
- 	return 0;
- }
-+#else
-+static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-+				   struct ttm_resource *mem)
-+{
-+	struct vbox_private *vbox = vbox_bdev(bdev);
-+	mem->bus.addr = NULL;
-+	mem->bus.offset = 0;
-+	mem->size = mem->num_pages << PAGE_SHIFT;
-+	mem->start = 0;
-+	mem->bus.is_iomem = false;
-+	switch (mem->mem_type) {
-+	case TTM_PL_SYSTEM:
-+		/* system memory */
-+		return 0;
-+	case TTM_PL_VRAM:
-+		mem->bus.offset = mem->start << PAGE_SHIFT;
-+		mem->start = pci_resource_start(vbox->dev->pdev, 0);
-+		mem->bus.is_iomem = true;
-+		break;
-+	default:
-+		return -EINVAL;
-+	}
-+	return 0;
-+}
-+#endif
- 
-+
-+
-+#if RTLNX_VER_MIN(5,10,0)
-+static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
-+				 struct ttm_resource *mem)
-+{
-+}
-+#else
- static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
- 				 struct ttm_mem_reg *mem)
- {
- }
-+#endif
- 
-+#if RTLNX_VER_MIN(5,10,0)
-+static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt)
-+{
-+	ttm_tt_fini(tt);
-+	kfree(tt);
-+}
-+#else
- static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
- {
- 	ttm_tt_fini(tt);
-@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
- static struct ttm_backend_func vbox_tt_backend_func = {
- 	.destroy = &vbox_ttm_backend_destroy,
- };
-+#endif
- 
- #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
- static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,
-@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct ttm_buffer_object *bo,
- 	if (!tt)
- 		return NULL;
- 
-+#if RTLNX_VER_MAX(5,10,0)
- 	tt->func = &vbox_tt_backend_func;
-+#endif
- #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
- 	if (ttm_tt_init(tt, bdev, size, page_flags, dummy_read_page)) {
- #else
-@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt *ttm)
- 
- static struct ttm_bo_driver vbox_bo_driver = {
- 	.ttm_tt_create = vbox_ttm_tt_create,
-+#if RTLNX_VER_MIN(5,10,0)
-+	.ttm_tt_destroy = vbox_ttm_tt_destroy,
-+#endif
- #if RTLNX_VER_MAX(4,17,0)
- 	.ttm_tt_populate = vbox_ttm_tt_populate,
- 	.ttm_tt_unpopulate = vbox_ttm_tt_unpopulate,
- #endif
-+#if RTLNX_VER_MAX(5,10,0)
- 	.init_mem_type = vbox_bo_init_mem_type,
-+#endif
- #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)
- 	.eviction_valuable = ttm_bo_eviction_valuable,
- #endif
-@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)
- #endif
- 	}
- 
-+#if RTLNX_VER_MIN(5,10,0)
-+	ret = ttm_range_man_init(bdev, TTM_PL_VRAM, false,
-+			     vbox->available_vram_size >> PAGE_SHIFT);
-+#else
- 	ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
- 			     vbox->available_vram_size >> PAGE_SHIFT);
-+#endif
- 	if (ret) {
- 		DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
- 		goto err_device_release;
-@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)
- #endif
- }
- 
--void vbox_ttm_placement(struct vbox_bo *bo, int domain)
-+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)
- {
- 	u32 c = 0;
- #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
-@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int domain)
- 	bo->placement.placement = bo->placements;
- 	bo->placement.busy_placement = bo->placements;
- 
--	if (domain & TTM_PL_FLAG_VRAM)
-+	if (mem_type & VBOX_MEM_TYPE_VRAM) {
-+#if RTLNX_VER_MIN(5,10,0)
-+		bo->placements[c].mem_type = TTM_PL_VRAM;
-+		PLACEMENT_FLAGS(bo->placements[c++]) =
-+		    TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;
-+#else
- 		PLACEMENT_FLAGS(bo->placements[c++]) =
- 		    TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
--	if (domain & TTM_PL_FLAG_SYSTEM)
-+#endif
-+	}
-+	if (mem_type & VBOX_MEM_TYPE_SYSTEM) {
-+#if RTLNX_VER_MIN(5,10,0)
-+		bo->placements[c].mem_type = TTM_PL_SYSTEM;
-+		PLACEMENT_FLAGS(bo->placements[c++]) =
-+		    TTM_PL_MASK_CACHING;
-+#else
- 		PLACEMENT_FLAGS(bo->placements[c++]) =
- 		    TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
--	if (!c)
-+#endif
-+	}
-+	if (!c) {
-+#if RTLNX_VER_MIN(5,10,0)
-+		bo->placements[c].mem_type = TTM_PL_SYSTEM;
-+		PLACEMENT_FLAGS(bo->placements[c++]) =
-+		    TTM_PL_MASK_CACHING;
-+#else
- 		PLACEMENT_FLAGS(bo->placements[c++]) =
- 		    TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
-+#endif
-+	}
- 
- 	bo->placement.num_placement = c;
- 	bo->placement.num_busy_placement = c;
-@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int size, int align,
- 	vboxbo->bo.bdev->dev_mapping = dev->dev_mapping;
- #endif
- 
--	vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM);
-+	vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBOX_MEM_TYPE_SYSTEM);
- 
- 	acc_size = ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
- 				       sizeof(struct vbox_bo));
-@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)
- #endif
- }
- 
--int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
-+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)
- {
- #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) || RTLNX_SUSE_MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
- 	struct ttm_operation_ctx ctx = { false, false };
-@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
- 		return 0;
- 	}
- 
--	vbox_ttm_placement(bo, pl_flag);
-+	vbox_ttm_placement(bo, mem_type);
- 
- 	for (i = 0; i < bo->placement.num_placement; i++)
- 		PLACEMENT_FLAGS(bo->placements[i]) |= TTM_PL_FLAG_NO_EVICT;
-@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)
- 	if (bo->kmap.virtual)
- 		ttm_bo_kunmap(&bo->kmap);
- 
--	vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
-+	vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
- 
- 	for (i = 0; i < bo->placement.num_placement; i++)
- 		PLACEMENT_FLAGS(bo->placements[i]) |= TTM_PL_FLAG_NO_EVICT;
--- 
-2.19.1
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
deleted file mode 100644
index db27cb883..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 2a6e3cf63f58e289802a11faad5fb495e2d04e97 Mon Sep 17 00:00:00 2001
-From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
-Date: Wed, 9 Dec 2020 18:59:04 +0000
-Subject: [PATCH] Runtime/memobj-r0drv-linux.c: Changes to support the upcoming
- 5.10 kernel, bugref:9879
-
-Upstream-Status: Backport
-
-git-svn-id: http://www.virtualbox.org/svn/vbox@87074 cfe28804-0f27-0410-a406-dd0f0b0b656f
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 68 ++++++++++++++++++-
- 1 file changed, 67 insertions(+), 1 deletion(-)
-
---- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
-+++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
-@@ -56,9 +56,19 @@
-  * Whether we use alloc_vm_area (3.2+) for executable memory.
-  * This is a must for 5.8+, but we enable it all the way back to 3.2.x for
-  * better W^R compliance (fExecutable flag). */
--#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
-+#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)
- # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
- #endif
-+/** @def IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
-+ * alloc_vm_area was removed with 5.10 so we have to resort to a different way
-+ * to allocate executable memory.
-+ * It would be possible to remove IPRT_USE_ALLOC_VM_AREA_FOR_EXEC and use
-+ * this path execlusively for 3.2+ but no time to test it really works on every
-+ * supported kernel, so better play safe for now.
-+ */
-+#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
-+# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
-+#endif
- 
- /*
-  * 2.6.29+ kernels don't work with remap_pfn_range() anymore because
-@@ -502,6 +512,46 @@ static void rtR0MemObjLinuxFreePages(PRT
- }
- 
- 
-+#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
-+/**
-+ * User data passed to the apply_to_page_range() callback.
-+ */
-+typedef struct LNXAPPLYPGRANGE
-+{
-+    /** Pointer to the memory object. */
-+    PRTR0MEMOBJLNX pMemLnx;
-+    /** The page protection flags to apply. */
-+    pgprot_t       fPg;
-+} LNXAPPLYPGRANGE;
-+/** Pointer to the user data. */
-+typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;
-+/** Pointer to the const user data. */
-+typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
-+
-+/**
-+ * Callback called in apply_to_page_range().
-+ *
-+ * @returns Linux status code.
-+ * @param   pPte                Pointer to the page table entry for the given address.
-+ * @param   uAddr               The address to apply the new protection to.
-+ * @param   pvUser              The opaque user data.
-+ */
-+#ifdef __i386__
-+static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
-+#else
-+static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uAddr, void *pvUser)
-+#endif
-+{
-+    PCLNXAPPLYPGRANGE pArgs = (PCLNXAPPLYPGRANGE)pvUser;
-+    PRTR0MEMOBJLNX pMemLnx = pArgs->pMemLnx;
-+    size_t idxPg = (uAddr - (unsigned long)pMemLnx->Core.pv) >> PAGE_SHIFT;
-+
-+    set_pte(pPte, mk_pte(pMemLnx->apPages[idxPg], pArgs->fPg));
-+    return 0;
-+}
-+#endif
-+
-+
- /**
-  * Maps the allocation into ring-0.
-  *
-@@ -584,6 +634,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMO
-         else
- # endif
-         {
-+#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
-+            if (fExecutable)
-+                pgprot_val(fPg) |= _PAGE_NX; /* Uses RTR0MemObjProtect to clear NX when memory ready, W^X fashion. */
-+#  endif
-+
- # ifdef VM_MAP
-             pMemLnx->Core.pv = vmap(&pMemLnx->apPages[0], pMemLnx->cPages, VM_MAP, fPg);
- # else
-@@ -1851,6 +1906,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(
-         preempt_enable();
-         return VINF_SUCCESS;
-     }
-+# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
-+    PRTR0MEMOBJLNX pMemLnx = (PRTR0MEMOBJLNX)pMem;
-+    if (   pMemLnx->fExecutable
-+        && pMemLnx->fMappedToRing0)
-+    {
-+        LNXAPPLYPGRANGE Args;
-+        Args.pMemLnx = pMemLnx;
-+        Args.fPg = rtR0MemObjLinuxConvertProt(fProt, true /*fKernel*/);
-+        int rcLnx = apply_to_page_range(current->active_mm, (unsigned long)pMemLnx->Core.pv + offSub, cbSub,
-+                                        rtR0MemObjLinuxApplyPageRange, (void *)&Args);
-+        if (rcLnx)
-+            return VERR_NOT_SUPPORTED;
-+
-+        return VINF_SUCCESS;
-+    }
- # endif
- 
-     NOREF(pMem);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
deleted file mode 100644
index 3cfe2e917..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a276f8bc5e4515f7ea51e2c56e0e634a723ca104 Mon Sep 17 00:00:00 2001
-From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
-Date: Tue, 8 Dec 2020 13:52:53 +0000
-Subject: [PATCH] linser/vboxsf: Adjustment for linux 5.10 - TASK_SIZE_MAX
- replaces USER_DS.seg. bugref:9879
-
-Upstream-Status: Backport
-
-git-svn-id: http://www.virtualbox.org/svn/vbox@87053 cfe28804-0f27-0410-a406-dd0f0b0b656f
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- src/VBox/Additions/linux/sharedfolders/regops.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c b/src/VBox/Additions/linux/sharedfolders/regops.c
-index e1fad3d820..401fd69930 100644
---- a/src/VBox/Additions/linux/sharedfolders/regops.c
-+++ b/src/VBox/Additions/linux/sharedfolders/regops.c
-@@ -147,7 +147,11 @@ static int vbsf_iov_iter_detect_type(struct iovec const *paIov, size_t cSegs)
-     while (cSegs-- > 0) {
-         if (paIov->iov_len > 0) {
-             if (access_ok(VERIFY_READ, paIov->iov_base, paIov->iov_len))
-+#if RTLNX_VER_MIN(5,10,0)
-+                return (uintptr_t)paIov->iov_base >= TASK_SIZE_MAX ? ITER_KVEC : 0;
-+#else
-                 return (uintptr_t)paIov->iov_base >= USER_DS.seg ? ITER_KVEC : 0;
-+#endif
-             AssertMsgFailed(("%p LB %#zx\n", paIov->iov_base, paIov->iov_len));
-             break;
-         }
-@@ -1401,7 +1405,10 @@ static int vbsf_lock_user_pages_failed_check_kernel(uintptr_t uPtrFrom, size_t c
-     /*
-      * Check that this is valid user memory that is actually in the kernel range.
-      */
--#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
-+#if RTLNX_VER_MIN(5,10,0)
-+    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
-+        && uPtrFrom >= TASK_SIZE_MAX)
-+#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
-     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
-         && uPtrFrom >= USER_DS.seg)
- #else
--- 
-2.19.1
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
similarity index 88%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
index ff639c09f..ea6a082f6 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
@@ -13,12 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch \
-    file://0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch \
-    file://0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch \
 "
-SRC_URI[md5sum] = "a12a647f6c114f2cb1571089b36841fe"
-SRC_URI[sha256sum] = "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1"
+SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
+SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
 
 S ?= "${WORKDIR}/vbox_module"
 S_task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1

