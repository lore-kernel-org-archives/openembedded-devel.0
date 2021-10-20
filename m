Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65607C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 10:56:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6360.1634727379436253770
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 03:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e1pGO2P5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so9186017wmz.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R8eoSEHGj0Y2EB5ZWXHAiljsy9gCtSUypnYNkKmMXlo=;
        b=e1pGO2P5nh7ZujPY51fMSvjNbYYHt0IYyUhTl9BAruOSkH6fH/SUz8ni6hvOqwV0DK
         xLLdYXzprRoaty0iSYoCl80QAVtkqm7XndeF+Kkv4Ht/muT0cifNo6NNA8Olmic6sTOw
         HHV/IVbrmuPa6BqusWZq6DXbNdI02XxZU3hGhGZjhdefUJmdMWHnt73jkHnUDC3zVW6B
         R7PDgKQxLmHFcWMBn4WmVFWxCP8Q7oXhh6ERJKn198MwtNeOT+a6jpaxb2DEaQVqkvSP
         psMx+V4/lTZqmP6TIJ2k3Pbl97V5R8lzPebQnhMtycUSElOwtVK7kRdbIOZ8+Buwse1u
         NWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R8eoSEHGj0Y2EB5ZWXHAiljsy9gCtSUypnYNkKmMXlo=;
        b=7wf9WT4drFU8EMzA0EdQCAAalVoDoMP0ovd5CZM2vYCX5W2XS0xDPvhrYfficlnQjZ
         jQG/RMpWhSCSp9WJzIGVtHQoSYMyCRpYIsNH1t3+gcHqyyRbkgvmS6Qoe4LkFfE30WiX
         6EmDNHdw0hJgTf+ORq5UA9g5bSLGyiMM8WHQDTEXRX6VfJu0dL/5y3VUCJTcd9jy8wtO
         aZV/+atIHKmFpY9+F4mOWHFKqV3CY4djDb/A9FnRow74KJG1kUncf8MPMWKwrtAag48J
         Mm+rBOp/MlXBOfwh7Cthn/q2aL+Pzn1VIVUHuPlc4u+W5ouyLxCP8v7xtVYfojjLYlaR
         1RWQ==
X-Gm-Message-State: AOAM530nuRfN0AZoN8XcPVnBjbdapDweGxB2UvjrhALohaHvKWmDgs3w
	JR6syCa3K+TNnLFvU5JC9Cak4sCreplHFQ==
X-Google-Smtp-Source: 
 ABdhPJxpv5w5Xzl8cJ/TZqBWS9nAx4z+2TKeUowrMJHdnt9+oyFtBaJrrpEKD++4+SRysiSpQppqNg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr12935068wmc.86.1634727377104;
        Wed, 20 Oct 2021 03:56:17 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([2.198.151.62])
        by smtp.gmail.com with ESMTPSA id
 o6sm2263180wri.49.2021.10.20.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 03:56:16 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.26 -> 6.1.28
Date: Wed, 20 Oct 2021 12:56:13 +0200
Message-Id: <20211020105613.164741-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 10:56:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93478

drop two upstream cherry-pick patches:
r89690-5.14-fixes.patch
r90497-regops-5.14-fix.patch

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/r89690-5.14-fixes.patch  | 442 ------------------
 .../r90497-regops-5.14-fix.patch              | 118 -----
 ...s_6.1.26.bb => vboxguestdrivers_6.1.28.bb} |   6 +-
 3 files changed, 2 insertions(+), 564 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.26.bb => vboxguestdrivers_6.1.28.bb} (92%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
deleted file mode 100644
index 951bd5013..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
+++ /dev/null
@@ -1,442 +0,0 @@
-Subject: Fix build errors with linux 5.14
-
-Upstream-Status: backport
-
-svn-id: r89690
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-Index: a/src/VBox/Additions/linux/drm/vbox_drv.h
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_drv.h	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_drv.h	(revision 90498)
-@@ -227,6 +227,15 @@
- 				sizeof(HGSMIHOSTFLAGS))
- #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE
- 
-+/** Field @pdev of struct drm_device was removed in 5.14. This macro
-+ * transparently handles this change. Input argument is a pointer
-+ * to struct drm_device. */
-+#if RTLNX_VER_MIN(5,14,0)
-+# define VBOX_DRM_TO_PCI_DEV(_dev) to_pci_dev(_dev->dev)
-+#else
-+# define VBOX_DRM_TO_PCI_DEV(_dev) _dev->pdev
-+#endif
-+
- /** How frequently we refresh if the guest is not providing dirty rectangles. */
- #define VBOX_REFRESH_PERIOD (HZ / 2)
- 
-Index: a/src/VBox/Additions/linux/drm/vbox_main.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_main.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_main.c	(revision 90498)
-@@ -290,7 +290,7 @@
- 	/* Take a command buffer for each screen from the end of usable VRAM. */
- 	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
- 
--	vbox->vbva_buffers = pci_iomap_range(vbox->dev->pdev, 0,
-+	vbox->vbva_buffers = pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0,
- 					     vbox->available_vram_size,
- 					     vbox->num_crtcs *
- 					     VBVA_MIN_BUFFER_SIZE);
-@@ -311,7 +311,7 @@
- 	return 0;
- 
- err_pci_iounmap:
--	pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
-+	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->vbva_buffers);
- 	return ret;
- }
- 
-@@ -318,7 +318,7 @@
- static void vbox_accel_fini(struct vbox_private *vbox)
- {
- 	vbox_disable_accel(vbox);
--	pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
-+	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->vbva_buffers);
- }
- 
- /** Do we support the 4.3 plus mode hint reporting interface? */
-@@ -393,7 +393,7 @@
- 
- 	/* Map guest-heap at end of vram */
- 	vbox->guest_heap =
--	    pci_iomap_range(vbox->dev->pdev, 0, GUEST_HEAP_OFFSET(vbox),
-+	    pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0, GUEST_HEAP_OFFSET(vbox),
- 			    GUEST_HEAP_SIZE);
- 	if (!vbox->guest_heap)
- 		return -ENOMEM;
-@@ -442,7 +442,7 @@
- err_destroy_guest_pool:
- 	gen_pool_destroy(vbox->guest_pool);
- err_unmap_guest_heap:
--	pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
-+	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
- 	return ret;
- }
- 
-@@ -452,7 +452,7 @@
- 	cancel_delayed_work(&vbox->refresh_work);
- 	vbox_accel_fini(vbox);
- 	gen_pool_destroy(vbox->guest_pool);
--	pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
-+	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
- }
- 
- #if RTLNX_VER_MIN(4,19,0) || RTLNX_RHEL_MIN(8,3)
-@@ -567,12 +567,16 @@
- 
- 	size = roundup(size, PAGE_SIZE);
- 	if (size == 0)
-+	{
-+		DRM_ERROR("bad size\n");
- 		return -EINVAL;
-+	}
- 
- 	ret = vbox_bo_create(dev, size, 0, 0, &vboxbo);
- 	if (ret) {
- 		if (ret != -ERESTARTSYS)
- 			DRM_ERROR("failed to allocate GEM object\n");
-+		DRM_ERROR("failed to allocate GEM (%d)\n", ret);
- 		return ret;
- 	}
- 
-@@ -628,6 +632,21 @@
- {
- 	struct vbox_bo *vbox_bo = gem_to_vbox_bo(obj);
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+	/* Starting from kernel 5.14, there is a warning appears in dmesg
-+	 * on attempt to desroy pinned buffer object. Make sure it is unpinned. */
-+	while (vbox_bo->bo.pin_count)
-+	{
-+		int ret;
-+		ret = vbox_bo_unpin(vbox_bo);
-+		if (ret)
-+		{
-+			DRM_ERROR("unable to unpin buffer object\n");
-+			break;
-+		}
-+	}
-+#endif
-+
- 	ttm_bo_put(&vbox_bo->bo);
- }
- 
-@@ -648,7 +667,7 @@
- 		      u32 handle, u64 *offset)
- {
- 	struct drm_gem_object *obj;
--	int ret;
-+	int ret = 0;
- 	struct vbox_bo *bo;
- 
- 	mutex_lock(&dev->struct_mutex);
-@@ -665,8 +684,15 @@
- 	bo = gem_to_vbox_bo(obj);
- 	*offset = vbox_bo_mmap_offset(bo);
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+	ret = drm_vma_node_allow(&bo->bo.base.vma_node, file);
-+	if (ret)
-+	{
-+		DRM_ERROR("unable to grant previladges to user");
-+	}
-+#endif
-+
- 	drm_gem_object_put(obj);
--	ret = 0;
- 
- out_unlock:
- 	mutex_unlock(&dev->struct_mutex);
-Index: a/src/VBox/Additions/linux/drm/vbox_mode.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_mode.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_mode.c	(revision 90498)
-@@ -245,6 +245,10 @@
- 			vbox_bo_unpin(bo);
- 			vbox_bo_unreserve(bo);
- 		}
-+		else
-+		{
-+			DRM_ERROR("unable to lock buffer object: error %d\n", ret);
-+		}
- 	}
- 
- 	if (&vbox->fbdev->afb == vbox_fb)
-@@ -856,7 +860,9 @@
- 	vbox->cursor_data_size = data_size;
- 	dst = vbox->cursor_data;
- 
--#if RTLNX_VER_MIN(5,12,0)
-+#if RTLNX_VER_MIN(5,14,0)
-+	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages, &uobj_map);
-+#elif RTLNX_VER_MIN(5,12,0)
- 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages, &uobj_map);
- #else
- 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &uobj_map);
-Index: a/src/VBox/Additions/linux/drm/vbox_ttm.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_ttm.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_ttm.c	(revision 90498)
-@@ -41,6 +41,10 @@
- # include <drm/ttm/ttm_page_alloc.h>
- #endif
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+# include <drm/ttm/ttm_range_manager.h>
-+#endif
-+
- #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
- #define PLACEMENT_FLAGS(placement) (placement)
- #else
-@@ -174,11 +178,13 @@
- 	*pl = vboxbo->placement;
- }
- 
-+#if RTLNX_VER_MAX(5,14,0)
- static int vbox_bo_verify_access(struct ttm_buffer_object *bo,
- 				 struct file *filp)
- {
- 	return 0;
- }
-+#endif
- 
- #if RTLNX_VER_MAX(5,10,0)
- static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
-@@ -234,10 +240,10 @@
- 		mem->bus.caching = ttm_write_combined;
- # endif
- # if RTLNX_VER_MIN(5,10,0)
--		mem->bus.offset = (mem->start << PAGE_SHIFT) + pci_resource_start(vbox->dev->pdev, 0);
-+		mem->bus.offset = (mem->start << PAGE_SHIFT) + pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
- # else
- 		mem->bus.offset = mem->start << PAGE_SHIFT;
--		mem->start = pci_resource_start(vbox->dev->pdev, 0);
-+		mem->start = pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
- # endif
- 		mem->bus.is_iomem = true;
- 		break;
-@@ -373,7 +379,9 @@
- 	.eviction_valuable = ttm_bo_eviction_valuable,
- #endif
- 	.evict_flags = vbox_bo_evict_flags,
-+#if RTLNX_VER_MAX(5,14,0)
- 	.verify_access = vbox_bo_verify_access,
-+#endif
- 	.io_mem_reserve = &vbox_ttm_io_mem_reserve,
- 	.io_mem_free = &vbox_ttm_io_mem_free,
- #if RTLNX_VER_MIN(4,12,0) || RTLNX_RHEL_MAJ_PREREQ(7,5)
-@@ -451,12 +459,12 @@
- 	}
- 
- #ifdef DRM_MTRR_WC
--	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
--				     pci_resource_len(dev->pdev, 0),
-+	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
-+				     pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0),
- 				     DRM_MTRR_WC);
- #else
--	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
--					 pci_resource_len(dev->pdev, 0));
-+	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
-+					 pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0));
- #endif
- 	return 0;
- 
-@@ -477,8 +485,8 @@
- {
- #ifdef DRM_MTRR_WC
- 	drm_mtrr_del(vbox->fb_mtrr,
--		     pci_resource_start(vbox->dev->pdev, 0),
--		     pci_resource_len(vbox->dev->pdev, 0), DRM_MTRR_WC);
-+		     pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0),
-+		     pci_resource_len(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0), DRM_MTRR_WC);
- #else
- 	arch_phys_wc_del(vbox->fb_mtrr);
- #endif
-@@ -560,6 +568,9 @@
- static const struct drm_gem_object_funcs vbox_drm_gem_object_funcs = {
- 	.free   = vbox_gem_free_object,
- 	.print_info = drm_gem_ttm_print_info,
-+# if RTLNX_VER_MIN(5,14,0)
-+	.mmap = drm_gem_ttm_mmap,
-+# endif
- };
- #endif
- 
-@@ -598,6 +609,17 @@
- 				       sizeof(struct vbox_bo));
- #endif
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+	/* Initialization of the following was removed from DRM stack
-+	 * in 5.14, so we need to do it manually. */
-+	vboxbo->bo.base.funcs = &vbox_drm_gem_object_funcs;
-+	kref_init(&vboxbo->bo.base.refcount);
-+	vboxbo->bo.base.size = size;
-+	vboxbo->bo.base.dev = dev;
-+	dma_resv_init(&vboxbo->bo.base._resv);
-+	drm_vma_node_reset(&vboxbo->bo.base.vma_node);
-+#endif
-+
- 	ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
- 			  ttm_bo_type_device, &vboxbo->placement,
- #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
-@@ -613,7 +635,11 @@
- 			  NULL, vbox_bo_ttm_destroy);
- #endif
- 	if (ret)
--		goto err_free_vboxbo;
-+	{
-+		/* In case of failure, ttm_bo_init() supposed to call
-+		 * vbox_bo_ttm_destroy() which in turn will free @vboxbo. */
-+		goto err_exit;
-+	}
- 
- 	*pvboxbo = vboxbo;
- 
-@@ -621,12 +647,15 @@
- 
- err_free_vboxbo:
- 	kfree(vboxbo);
-+err_exit:
- 	return ret;
- }
- 
- static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)
- {
--#if RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_SUSE_MAJ_PREREQ(15,3)
-+#if RTLNX_VER_MIN(5,14,0)
-+	return bo->bo.resource->start << PAGE_SHIFT;
-+#elif RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_SUSE_MAJ_PREREQ(15,3)
- 	return bo->bo.mem.start << PAGE_SHIFT;
- #else
- 	return bo->bo.offset;
-@@ -685,7 +714,7 @@
- 	struct ttm_operation_ctx ctx = { false, false };
- # endif
- #endif
--	int ret;
-+	int ret = 0;
- #if RTLNX_VER_MAX(5,11,0)
- 	int i;
- #endif
-@@ -765,6 +794,7 @@
- {
- 	struct drm_file *file_priv;
- 	struct vbox_private *vbox;
-+	int ret = -EINVAL;
- 
- 	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET))
- 		return -EINVAL;
-@@ -772,5 +802,12 @@
- 	file_priv = filp->private_data;
- 	vbox = file_priv->minor->dev->dev_private;
- 
--	return ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
-+#if RTLNX_VER_MIN(5,14,0)
-+	if (drm_dev_is_unplugged(file_priv->minor->dev))
-+		return -ENODEV;
-+	ret = drm_gem_mmap(filp, vma);
-+#else
-+	ret = ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
-+#endif
-+	return ret;
- }
-Index: a/src/VBox/Additions/linux/drm/vbox_fb.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_fb.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_fb.c	(revision 90498)
-@@ -301,7 +301,9 @@
- 		return ret;
- 	}
- 
--#if RTLNX_VER_MIN(5,12,0)
-+#if RTLNX_VER_MIN(5,14,0)
-+	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages, &bo->kmap);
-+#elif RTLNX_VER_MIN(5,12,0)
- 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages, &bo->kmap);
- #else
- 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
-@@ -337,8 +339,8 @@
- 	 * This seems to be done for safety checking that the framebuffer
- 	 * is not registered twice by different drivers.
- 	 */
--	info->apertures->ranges[0].base = pci_resource_start(dev->pdev, 0);
--	info->apertures->ranges[0].size = pci_resource_len(dev->pdev, 0);
-+	info->apertures->ranges[0].base = pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0);
-+	info->apertures->ranges[0].size = pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0);
- 
- #if RTLNX_VER_MIN(5,2,0) || RTLNX_RHEL_MAJ_PREREQ(8,2)
-         /*
-Index: a/src/VBox/Additions/linux/drm/vbox_drv.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_drv.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_drv.c	(revision 90498)
-@@ -43,6 +43,10 @@
- # include <drm/drm_probe_helper.h>
- #endif
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+# include <drm/drm_aperture.h>
-+#endif
-+
- #include "version-generated.h"
- #include "revision-generated.h"
- 
-@@ -65,12 +69,23 @@
- 	struct drm_device *dev = NULL;
- 	int ret = 0;
- 
-+# if RTLNX_VER_MIN(5,14,0)
-+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "vboxvideofb");
-+	if (ret)
-+	{
-+		printk("unable to remove conflicting framebuffer devices\n");
-+		return ret;
-+	}
-+# endif /* 5.14 */
-+
- 	dev = drm_dev_alloc(&driver, &pdev->dev);
- 	if (IS_ERR(dev)) {
- 		ret = PTR_ERR(dev);
- 		goto err_drv_alloc;
- 	}
-+#if RTLNX_VER_MAX(5,14,0)
- 	dev->pdev = pdev;
-+#endif
- 	pci_set_drvdata(pdev, dev);
- 
- 	ret = vbox_driver_load(dev);
-@@ -125,7 +140,7 @@
- 
- 	drm_kms_helper_poll_disable(dev);
- 
--	pci_save_state(dev->pdev);
-+	pci_save_state(VBOX_DRM_TO_PCI_DEV(dev));
- 
- 	drm_fb_helper_set_suspend_unlocked(&vbox->fbdev->helper, true);
- 
-@@ -147,7 +162,7 @@
- {
- 	int ret;
- 
--	if (pci_enable_device(dev->pdev))
-+	if (pci_enable_device(VBOX_DRM_TO_PCI_DEV(dev)))
- 		return -EIO;
- 
- 	ret = vbox_drm_thaw(dev);
-Index: a/src/VBox/Additions/linux/drm/vbox_irq.c
-===================================================================
---- a/src/VBox/Additions/linux/drm/vbox_irq.c	(revision 89690)
-+++ a/src/VBox/Additions/linux/drm/vbox_irq.c	(revision 90498)
-@@ -206,7 +206,7 @@
- 	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
- 	vbox_update_mode_hints(vbox);
- #if RTLNX_VER_MIN(3,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,1)
--	return drm_irq_install(vbox->dev, vbox->dev->pdev->irq);
-+	return drm_irq_install(vbox->dev, VBOX_DRM_TO_PCI_DEV(vbox->dev)->irq);
- #else
- 	return drm_irq_install(vbox->dev);
- #endif
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
deleted file mode 100644
index 0d960fa4f..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-Subject: Fix regops build errors with linux 5.14
-
-Upstream-Status: backport
-
-svn-id: r90497
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-Index: a/src/VBox/Additions/linux/sharedfolders/regops.c
-===================================================================
---- a/src/VBox/Additions/linux/sharedfolders/regops.c	(revision 88716)
-+++ a/src/VBox/Additions/linux/sharedfolders/regops.c	(revision 90497)
-@@ -2126,7 +2126,11 @@
-     int    rc       = 0;
- 
-     Assert(iov_iter_count(iter) + pStash->cb > 0);
-+# if RTLNX_VER_MIN(5,14,0)
-+    if (!(iter->iter_type & ITER_KVEC)) {
-+#else
-     if (!(iter->type & ITER_KVEC)) {
-+#endif
-         /*
-          * Do we have a stashed page?
-          */
-@@ -2372,7 +2376,9 @@
- static size_t vbsf_iter_max_span_of_pages(struct iov_iter *iter)
- {
-     size_t cPages;
--# if RTLNX_VER_MIN(3,16,0)
-+#if RTLNX_VER_MIN(5,14,0)
-+    if (iter_is_iovec(iter) || (iter->iter_type & ITER_KVEC)) {
-+#elif RTLNX_VER_MIN(3,16,0)
-     if (iter_is_iovec(iter) || (iter->type & ITER_KVEC)) {
- #endif
-         const struct iovec *pCurIov    = iter->iov;
-@@ -2436,7 +2442,11 @@
-     } else {
-         /* Won't bother with accurate counts for the next two types, just make
-            some rough estimates (does pipes have segments?): */
-+#  if RTLNX_VER_MIN(5,14,0)
-+        size_t cSegs = iter->iter_type & ITER_BVEC ? RT_MAX(1, iter->nr_segs) : 1;
-+#  else
-         size_t cSegs = iter->type & ITER_BVEC ? RT_MAX(1, iter->nr_segs) : 1;
-+#endif
-         cPages = (iov_iter_count(iter) + (PAGE_SIZE * 2 - 2) * cSegs) >> PAGE_SHIFT;
-     }
- # endif
-@@ -2588,8 +2598,14 @@
-     struct vbsf_reg_info   *sf_r       = kio->ki_filp->private_data;
-     struct vbsf_super_info *pSuperInfo = VBSF_GET_SUPER_INFO(inode->i_sb);
- 
-+#if RTLNX_VER_MIN(5,14,0)
-     SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
-+               inode, kio->ki_filp, cbToRead, kio->ki_pos, iter->iter_type));
-+#else
-+    SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
-                inode, kio->ki_filp, cbToRead, kio->ki_pos, iter->type));
-+#endif
-+
-     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
- 
-     /*
-@@ -2823,9 +2839,13 @@
-     bool const              fAppend    = RT_BOOL(kio->ki_filp->f_flags & O_APPEND);
- # endif
- 
--
-+#if RTLNX_VER_MIN(5,14,0)
-     SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
-+               inode, kio->ki_filp, cbToWrite, offFile, iter->iter_type));
-+#else
-+    SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
-                inode, kio->ki_filp, cbToWrite, offFile, iter->type));
-+#endif
-     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
- 
-     /*
-@@ -3737,7 +3757,27 @@
- }
- #endif /* KERNEL_VERSION >= 2.6.24 */
- 
-+#if RTLNX_VER_MIN(5,14,0)
-+static int vbsf_write_end(struct file *file, struct address_space *mapping,
-+                loff_t pos, unsigned int len, unsigned int copied,
-+                struct page *page, void *fsdata)
-+{
-+    static uint64_t volatile s_cCalls = 0;
-+    if (s_cCalls++ < 16)
-+    {
-+        printk("vboxsf: Unexpected call to vbsf_write_end(pos=%#llx len=%#x)! Please report.\n",
-+               (unsigned long long)pos, len);
-+        RTLogBackdoorPrintf("vboxsf: Unexpected call to vbsf_write_end(pos=%#llx len=%#x)!  Please report.\n",
-+                            (unsigned long long)pos, len);
-+# ifdef WARN_ON
-+        WARN_ON(1);
-+# endif
-+    }
- 
-+    return -ENOTSUPP;
-+}
-+#endif
-+
- #if RTLNX_VER_MIN(2,4,10)
- 
- # ifdef VBOX_UEK
-@@ -3791,8 +3831,11 @@
- #if RTLNX_VER_MIN(2,5,12)
-     .set_page_dirty = __set_page_dirty_buffers,
- #endif
--#if RTLNX_VER_MIN(2,6,24)
-+#if RTLNX_VER_MIN(5,14,0)
-     .write_begin    = vbsf_write_begin,
-+    .write_end      = vbsf_write_end,
-+#elif RTLNX_VER_MIN(2,6,24)
-+    .write_begin    = vbsf_write_begin,
-     .write_end      = simple_write_end,
- #elif RTLNX_VER_MIN(2,5,45)
-     .prepare_write  = simple_prepare_write,
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
similarity index 92%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
index 84651ae64..c7e73b222 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
@@ -13,12 +13,10 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://r89690-5.14-fixes.patch \
-    file://r90497-regops-5.14-fix.patch \
 "
 
-SRC_URI[md5sum] = "fce04bbef244b4df1a50e53d132d3e6f"
-SRC_URI[sha256sum] = "0212602eea878d6c9fd7f4a3e0182da3e4505f31d25f5539fb8f7b1fbe366195"
+SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
+SRC_URI[sha256sum] = "8d34993d8e9c0cf35e7bd44dd26c8c757f17a3b7d5a64052f945d00fd798ebfe"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


