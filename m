Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.3840.1632457304301217354
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 21:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CATtgoIH;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id a14so5560620qvb.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 21:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jge1mN5IK3AE6yOi/1OSV8yImxVEpbkEBMCAQGBqJfM=;
        b=CATtgoIHV89YkIJqX7ce0vJH6fxhRQLGnxMkSyD+chEiKhmaZcLWz57e9NLx57GSAo
         jzOAg//FwiA0QqvEwQswkwUrMmiTwuNI6eMVeG5k5d/faryV/J1NlVO/Yxy1zjM5KYEx
         0cPKv3HdLI7ktINvMscDGxsP0b+Iy3+1jcwxzijuZEaQWBVOuW9/wBIhPWhy/SRbB/0B
         rDLx5EdtTCdsBrvJLJsopiCGwSGn4iBLUVHhAHA/7ym8NDBCvZElxU0jNV5qsu2+xELJ
         xarhjk2bLqOb+cR2MSw6zxzGz40I/kwFe7piHlmHMtHCyIG8SFGHyhH/DDeRSqHHxa2f
         /CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jge1mN5IK3AE6yOi/1OSV8yImxVEpbkEBMCAQGBqJfM=;
        b=XQN3m1wIPKVqyFMUfnzxQ8BKGbVdc2dU2Lm9PWBlG+diLVbzW0dIAmovoFuDCxySEc
         RqZVC22mt9sL+6CaP2Zy65Zc496TcujBjGWazdXMjHtXCvFH3P2sHaHikDPUiPGVUIvm
         KifzDkaanLubOu3iMkflVnNVbAbhpOV3CLifejNLPDPUbay2EhHnSTZ39HcnUGPvFQ4Q
         SzWd0f4TrAhpeT1985FkCB0vEaQqhYivZFzF0rf4k+c+Attdpjy994wyvtCAKTrqPP+L
         J4GxFjiC2mlr2z/roWLurR+V4DCYHA0zq+cK6zDaR7YCLRBlKbBcZ3Zy4UgVjgHYh1aN
         QXMA==
X-Gm-Message-State: AOAM531e8ukn8mbiei+qbbN9FfVV3APbPshH1YHzVe+OXJFnfym3dT1g
	WHQc4gifoVaW+cnFIL/dZTqm1aBeFp1L0w==
X-Google-Smtp-Source: ABdhPJyXrYALwmsTdgBrRJXzlmr6jwySb0/3fFyRaueJlVitVGqVqHKt0zphEgoV96S6WMj7d/qoqA==
X-Received: by 2002:ad4:496d:: with SMTP id p13mr8010022qvy.46.1632457302881;
        Thu, 23 Sep 2021 21:21:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id a17sm4743685qtn.86.2021.09.23.21.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 21:21:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH] vboxguestdrivers: fix build against 5.14+
Date: Fri, 24 Sep 2021 00:21:41 -0400
Message-Id: <20210924042141.90050-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The bump of the reference / default kernels and libc-headers to 5.14
in oe-core broke the build of the vbox guest drivers.

The upstream SVN already has 5.14 fixes for the issues, so these are
SVN exports of the changes. When a new release is available, we can
drop the changes.

Also in this patch, is a fixup for the source directory for patching.
It was broken in the overrides conversion, and since there weren't
any active patches at the time, we didn't notice that source wasn't
set to a directory where quilt could actually find the files.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../vboxguestdrivers/r89690-5.14-fixes.patch  | 442 ++++++++++++++++++
 .../r90497-regops-5.14-fix.patch              | 118 +++++
 .../vboxguestdrivers_6.1.26.bb                |   4 +-
 3 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
new file mode 100644
index 000000000..951bd5013
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
@@ -0,0 +1,442 @@
+Subject: Fix build errors with linux 5.14
+
+Upstream-Status: backport
+
+svn-id: r89690
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+Index: a/src/VBox/Additions/linux/drm/vbox_drv.h
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_drv.h	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_drv.h	(revision 90498)
+@@ -227,6 +227,15 @@
+ 				sizeof(HGSMIHOSTFLAGS))
+ #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE
+ 
++/** Field @pdev of struct drm_device was removed in 5.14. This macro
++ * transparently handles this change. Input argument is a pointer
++ * to struct drm_device. */
++#if RTLNX_VER_MIN(5,14,0)
++# define VBOX_DRM_TO_PCI_DEV(_dev) to_pci_dev(_dev->dev)
++#else
++# define VBOX_DRM_TO_PCI_DEV(_dev) _dev->pdev
++#endif
++
+ /** How frequently we refresh if the guest is not providing dirty rectangles. */
+ #define VBOX_REFRESH_PERIOD (HZ / 2)
+ 
+Index: a/src/VBox/Additions/linux/drm/vbox_main.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_main.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_main.c	(revision 90498)
+@@ -290,7 +290,7 @@
+ 	/* Take a command buffer for each screen from the end of usable VRAM. */
+ 	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
+ 
+-	vbox->vbva_buffers = pci_iomap_range(vbox->dev->pdev, 0,
++	vbox->vbva_buffers = pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0,
+ 					     vbox->available_vram_size,
+ 					     vbox->num_crtcs *
+ 					     VBVA_MIN_BUFFER_SIZE);
+@@ -311,7 +311,7 @@
+ 	return 0;
+ 
+ err_pci_iounmap:
+-	pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
++	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->vbva_buffers);
+ 	return ret;
+ }
+ 
+@@ -318,7 +318,7 @@
+ static void vbox_accel_fini(struct vbox_private *vbox)
+ {
+ 	vbox_disable_accel(vbox);
+-	pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
++	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->vbva_buffers);
+ }
+ 
+ /** Do we support the 4.3 plus mode hint reporting interface? */
+@@ -393,7 +393,7 @@
+ 
+ 	/* Map guest-heap at end of vram */
+ 	vbox->guest_heap =
+-	    pci_iomap_range(vbox->dev->pdev, 0, GUEST_HEAP_OFFSET(vbox),
++	    pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0, GUEST_HEAP_OFFSET(vbox),
+ 			    GUEST_HEAP_SIZE);
+ 	if (!vbox->guest_heap)
+ 		return -ENOMEM;
+@@ -442,7 +442,7 @@
+ err_destroy_guest_pool:
+ 	gen_pool_destroy(vbox->guest_pool);
+ err_unmap_guest_heap:
+-	pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
++	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
+ 	return ret;
+ }
+ 
+@@ -452,7 +452,7 @@
+ 	cancel_delayed_work(&vbox->refresh_work);
+ 	vbox_accel_fini(vbox);
+ 	gen_pool_destroy(vbox->guest_pool);
+-	pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
++	pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
+ }
+ 
+ #if RTLNX_VER_MIN(4,19,0) || RTLNX_RHEL_MIN(8,3)
+@@ -567,12 +567,16 @@
+ 
+ 	size = roundup(size, PAGE_SIZE);
+ 	if (size == 0)
++	{
++		DRM_ERROR("bad size\n");
+ 		return -EINVAL;
++	}
+ 
+ 	ret = vbox_bo_create(dev, size, 0, 0, &vboxbo);
+ 	if (ret) {
+ 		if (ret != -ERESTARTSYS)
+ 			DRM_ERROR("failed to allocate GEM object\n");
++		DRM_ERROR("failed to allocate GEM (%d)\n", ret);
+ 		return ret;
+ 	}
+ 
+@@ -628,6 +632,21 @@
+ {
+ 	struct vbox_bo *vbox_bo = gem_to_vbox_bo(obj);
+ 
++#if RTLNX_VER_MIN(5,14,0)
++	/* Starting from kernel 5.14, there is a warning appears in dmesg
++	 * on attempt to desroy pinned buffer object. Make sure it is unpinned. */
++	while (vbox_bo->bo.pin_count)
++	{
++		int ret;
++		ret = vbox_bo_unpin(vbox_bo);
++		if (ret)
++		{
++			DRM_ERROR("unable to unpin buffer object\n");
++			break;
++		}
++	}
++#endif
++
+ 	ttm_bo_put(&vbox_bo->bo);
+ }
+ 
+@@ -648,7 +667,7 @@
+ 		      u32 handle, u64 *offset)
+ {
+ 	struct drm_gem_object *obj;
+-	int ret;
++	int ret = 0;
+ 	struct vbox_bo *bo;
+ 
+ 	mutex_lock(&dev->struct_mutex);
+@@ -665,8 +684,15 @@
+ 	bo = gem_to_vbox_bo(obj);
+ 	*offset = vbox_bo_mmap_offset(bo);
+ 
++#if RTLNX_VER_MIN(5,14,0)
++	ret = drm_vma_node_allow(&bo->bo.base.vma_node, file);
++	if (ret)
++	{
++		DRM_ERROR("unable to grant previladges to user");
++	}
++#endif
++
+ 	drm_gem_object_put(obj);
+-	ret = 0;
+ 
+ out_unlock:
+ 	mutex_unlock(&dev->struct_mutex);
+Index: a/src/VBox/Additions/linux/drm/vbox_mode.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_mode.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_mode.c	(revision 90498)
+@@ -245,6 +245,10 @@
+ 			vbox_bo_unpin(bo);
+ 			vbox_bo_unreserve(bo);
+ 		}
++		else
++		{
++			DRM_ERROR("unable to lock buffer object: error %d\n", ret);
++		}
+ 	}
+ 
+ 	if (&vbox->fbdev->afb == vbox_fb)
+@@ -856,7 +860,9 @@
+ 	vbox->cursor_data_size = data_size;
+ 	dst = vbox->cursor_data;
+ 
+-#if RTLNX_VER_MIN(5,12,0)
++#if RTLNX_VER_MIN(5,14,0)
++	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages, &uobj_map);
++#elif RTLNX_VER_MIN(5,12,0)
+ 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages, &uobj_map);
+ #else
+ 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &uobj_map);
+Index: a/src/VBox/Additions/linux/drm/vbox_ttm.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_ttm.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_ttm.c	(revision 90498)
+@@ -41,6 +41,10 @@
+ # include <drm/ttm/ttm_page_alloc.h>
+ #endif
+ 
++#if RTLNX_VER_MIN(5,14,0)
++# include <drm/ttm/ttm_range_manager.h>
++#endif
++
+ #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
+ #define PLACEMENT_FLAGS(placement) (placement)
+ #else
+@@ -174,11 +178,13 @@
+ 	*pl = vboxbo->placement;
+ }
+ 
++#if RTLNX_VER_MAX(5,14,0)
+ static int vbox_bo_verify_access(struct ttm_buffer_object *bo,
+ 				 struct file *filp)
+ {
+ 	return 0;
+ }
++#endif
+ 
+ #if RTLNX_VER_MAX(5,10,0)
+ static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
+@@ -234,10 +240,10 @@
+ 		mem->bus.caching = ttm_write_combined;
+ # endif
+ # if RTLNX_VER_MIN(5,10,0)
+-		mem->bus.offset = (mem->start << PAGE_SHIFT) + pci_resource_start(vbox->dev->pdev, 0);
++		mem->bus.offset = (mem->start << PAGE_SHIFT) + pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
+ # else
+ 		mem->bus.offset = mem->start << PAGE_SHIFT;
+-		mem->start = pci_resource_start(vbox->dev->pdev, 0);
++		mem->start = pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
+ # endif
+ 		mem->bus.is_iomem = true;
+ 		break;
+@@ -373,7 +379,9 @@
+ 	.eviction_valuable = ttm_bo_eviction_valuable,
+ #endif
+ 	.evict_flags = vbox_bo_evict_flags,
++#if RTLNX_VER_MAX(5,14,0)
+ 	.verify_access = vbox_bo_verify_access,
++#endif
+ 	.io_mem_reserve = &vbox_ttm_io_mem_reserve,
+ 	.io_mem_free = &vbox_ttm_io_mem_free,
+ #if RTLNX_VER_MIN(4,12,0) || RTLNX_RHEL_MAJ_PREREQ(7,5)
+@@ -451,12 +459,12 @@
+ 	}
+ 
+ #ifdef DRM_MTRR_WC
+-	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
+-				     pci_resource_len(dev->pdev, 0),
++	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
++				     pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0),
+ 				     DRM_MTRR_WC);
+ #else
+-	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
+-					 pci_resource_len(dev->pdev, 0));
++	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
++					 pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0));
+ #endif
+ 	return 0;
+ 
+@@ -477,8 +485,8 @@
+ {
+ #ifdef DRM_MTRR_WC
+ 	drm_mtrr_del(vbox->fb_mtrr,
+-		     pci_resource_start(vbox->dev->pdev, 0),
+-		     pci_resource_len(vbox->dev->pdev, 0), DRM_MTRR_WC);
++		     pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0),
++		     pci_resource_len(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0), DRM_MTRR_WC);
+ #else
+ 	arch_phys_wc_del(vbox->fb_mtrr);
+ #endif
+@@ -560,6 +568,9 @@
+ static const struct drm_gem_object_funcs vbox_drm_gem_object_funcs = {
+ 	.free   = vbox_gem_free_object,
+ 	.print_info = drm_gem_ttm_print_info,
++# if RTLNX_VER_MIN(5,14,0)
++	.mmap = drm_gem_ttm_mmap,
++# endif
+ };
+ #endif
+ 
+@@ -598,6 +609,17 @@
+ 				       sizeof(struct vbox_bo));
+ #endif
+ 
++#if RTLNX_VER_MIN(5,14,0)
++	/* Initialization of the following was removed from DRM stack
++	 * in 5.14, so we need to do it manually. */
++	vboxbo->bo.base.funcs = &vbox_drm_gem_object_funcs;
++	kref_init(&vboxbo->bo.base.refcount);
++	vboxbo->bo.base.size = size;
++	vboxbo->bo.base.dev = dev;
++	dma_resv_init(&vboxbo->bo.base._resv);
++	drm_vma_node_reset(&vboxbo->bo.base.vma_node);
++#endif
++
+ 	ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
+ 			  ttm_bo_type_device, &vboxbo->placement,
+ #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
+@@ -613,7 +635,11 @@
+ 			  NULL, vbox_bo_ttm_destroy);
+ #endif
+ 	if (ret)
+-		goto err_free_vboxbo;
++	{
++		/* In case of failure, ttm_bo_init() supposed to call
++		 * vbox_bo_ttm_destroy() which in turn will free @vboxbo. */
++		goto err_exit;
++	}
+ 
+ 	*pvboxbo = vboxbo;
+ 
+@@ -621,12 +647,15 @@
+ 
+ err_free_vboxbo:
+ 	kfree(vboxbo);
++err_exit:
+ 	return ret;
+ }
+ 
+ static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)
+ {
+-#if RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_SUSE_MAJ_PREREQ(15,3)
++#if RTLNX_VER_MIN(5,14,0)
++	return bo->bo.resource->start << PAGE_SHIFT;
++#elif RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_SUSE_MAJ_PREREQ(15,3)
+ 	return bo->bo.mem.start << PAGE_SHIFT;
+ #else
+ 	return bo->bo.offset;
+@@ -685,7 +714,7 @@
+ 	struct ttm_operation_ctx ctx = { false, false };
+ # endif
+ #endif
+-	int ret;
++	int ret = 0;
+ #if RTLNX_VER_MAX(5,11,0)
+ 	int i;
+ #endif
+@@ -765,6 +794,7 @@
+ {
+ 	struct drm_file *file_priv;
+ 	struct vbox_private *vbox;
++	int ret = -EINVAL;
+ 
+ 	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET))
+ 		return -EINVAL;
+@@ -772,5 +802,12 @@
+ 	file_priv = filp->private_data;
+ 	vbox = file_priv->minor->dev->dev_private;
+ 
+-	return ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
++#if RTLNX_VER_MIN(5,14,0)
++	if (drm_dev_is_unplugged(file_priv->minor->dev))
++		return -ENODEV;
++	ret = drm_gem_mmap(filp, vma);
++#else
++	ret = ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
++#endif
++	return ret;
+ }
+Index: a/src/VBox/Additions/linux/drm/vbox_fb.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_fb.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_fb.c	(revision 90498)
+@@ -301,7 +301,9 @@
+ 		return ret;
+ 	}
+ 
+-#if RTLNX_VER_MIN(5,12,0)
++#if RTLNX_VER_MIN(5,14,0)
++	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages, &bo->kmap);
++#elif RTLNX_VER_MIN(5,12,0)
+ 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages, &bo->kmap);
+ #else
+ 	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
+@@ -337,8 +339,8 @@
+ 	 * This seems to be done for safety checking that the framebuffer
+ 	 * is not registered twice by different drivers.
+ 	 */
+-	info->apertures->ranges[0].base = pci_resource_start(dev->pdev, 0);
+-	info->apertures->ranges[0].size = pci_resource_len(dev->pdev, 0);
++	info->apertures->ranges[0].base = pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0);
++	info->apertures->ranges[0].size = pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0);
+ 
+ #if RTLNX_VER_MIN(5,2,0) || RTLNX_RHEL_MAJ_PREREQ(8,2)
+         /*
+Index: a/src/VBox/Additions/linux/drm/vbox_drv.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_drv.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_drv.c	(revision 90498)
+@@ -43,6 +43,10 @@
+ # include <drm/drm_probe_helper.h>
+ #endif
+ 
++#if RTLNX_VER_MIN(5,14,0)
++# include <drm/drm_aperture.h>
++#endif
++
+ #include "version-generated.h"
+ #include "revision-generated.h"
+ 
+@@ -65,12 +69,23 @@
+ 	struct drm_device *dev = NULL;
+ 	int ret = 0;
+ 
++# if RTLNX_VER_MIN(5,14,0)
++	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, "vboxvideofb");
++	if (ret)
++	{
++		printk("unable to remove conflicting framebuffer devices\n");
++		return ret;
++	}
++# endif /* 5.14 */
++
+ 	dev = drm_dev_alloc(&driver, &pdev->dev);
+ 	if (IS_ERR(dev)) {
+ 		ret = PTR_ERR(dev);
+ 		goto err_drv_alloc;
+ 	}
++#if RTLNX_VER_MAX(5,14,0)
+ 	dev->pdev = pdev;
++#endif
+ 	pci_set_drvdata(pdev, dev);
+ 
+ 	ret = vbox_driver_load(dev);
+@@ -125,7 +140,7 @@
+ 
+ 	drm_kms_helper_poll_disable(dev);
+ 
+-	pci_save_state(dev->pdev);
++	pci_save_state(VBOX_DRM_TO_PCI_DEV(dev));
+ 
+ 	drm_fb_helper_set_suspend_unlocked(&vbox->fbdev->helper, true);
+ 
+@@ -147,7 +162,7 @@
+ {
+ 	int ret;
+ 
+-	if (pci_enable_device(dev->pdev))
++	if (pci_enable_device(VBOX_DRM_TO_PCI_DEV(dev)))
+ 		return -EIO;
+ 
+ 	ret = vbox_drm_thaw(dev);
+Index: a/src/VBox/Additions/linux/drm/vbox_irq.c
+===================================================================
+--- a/src/VBox/Additions/linux/drm/vbox_irq.c	(revision 89690)
++++ a/src/VBox/Additions/linux/drm/vbox_irq.c	(revision 90498)
+@@ -206,7 +206,7 @@
+ 	INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
+ 	vbox_update_mode_hints(vbox);
+ #if RTLNX_VER_MIN(3,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,1)
+-	return drm_irq_install(vbox->dev, vbox->dev->pdev->irq);
++	return drm_irq_install(vbox->dev, VBOX_DRM_TO_PCI_DEV(vbox->dev)->irq);
+ #else
+ 	return drm_irq_install(vbox->dev);
+ #endif
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
new file mode 100644
index 000000000..0d960fa4f
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
@@ -0,0 +1,118 @@
+Subject: Fix regops build errors with linux 5.14
+
+Upstream-Status: backport
+
+svn-id: r90497
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+Index: a/src/VBox/Additions/linux/sharedfolders/regops.c
+===================================================================
+--- a/src/VBox/Additions/linux/sharedfolders/regops.c	(revision 88716)
++++ a/src/VBox/Additions/linux/sharedfolders/regops.c	(revision 90497)
+@@ -2126,7 +2126,11 @@
+     int    rc       = 0;
+ 
+     Assert(iov_iter_count(iter) + pStash->cb > 0);
++# if RTLNX_VER_MIN(5,14,0)
++    if (!(iter->iter_type & ITER_KVEC)) {
++#else
+     if (!(iter->type & ITER_KVEC)) {
++#endif
+         /*
+          * Do we have a stashed page?
+          */
+@@ -2372,7 +2376,9 @@
+ static size_t vbsf_iter_max_span_of_pages(struct iov_iter *iter)
+ {
+     size_t cPages;
+-# if RTLNX_VER_MIN(3,16,0)
++#if RTLNX_VER_MIN(5,14,0)
++    if (iter_is_iovec(iter) || (iter->iter_type & ITER_KVEC)) {
++#elif RTLNX_VER_MIN(3,16,0)
+     if (iter_is_iovec(iter) || (iter->type & ITER_KVEC)) {
+ #endif
+         const struct iovec *pCurIov    = iter->iov;
+@@ -2436,7 +2442,11 @@
+     } else {
+         /* Won't bother with accurate counts for the next two types, just make
+            some rough estimates (does pipes have segments?): */
++#  if RTLNX_VER_MIN(5,14,0)
++        size_t cSegs = iter->iter_type & ITER_BVEC ? RT_MAX(1, iter->nr_segs) : 1;
++#  else
+         size_t cSegs = iter->type & ITER_BVEC ? RT_MAX(1, iter->nr_segs) : 1;
++#endif
+         cPages = (iov_iter_count(iter) + (PAGE_SIZE * 2 - 2) * cSegs) >> PAGE_SHIFT;
+     }
+ # endif
+@@ -2588,8 +2598,14 @@
+     struct vbsf_reg_info   *sf_r       = kio->ki_filp->private_data;
+     struct vbsf_super_info *pSuperInfo = VBSF_GET_SUPER_INFO(inode->i_sb);
+ 
++#if RTLNX_VER_MIN(5,14,0)
+     SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
++               inode, kio->ki_filp, cbToRead, kio->ki_pos, iter->iter_type));
++#else
++    SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
+                inode, kio->ki_filp, cbToRead, kio->ki_pos, iter->type));
++#endif
++
+     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
+ 
+     /*
+@@ -2823,9 +2839,13 @@
+     bool const              fAppend    = RT_BOOL(kio->ki_filp->f_flags & O_APPEND);
+ # endif
+ 
+-
++#if RTLNX_VER_MIN(5,14,0)
+     SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
++               inode, kio->ki_filp, cbToWrite, offFile, iter->iter_type));
++#else
++    SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx off=%#llx type=%#x\n",
+                inode, kio->ki_filp, cbToWrite, offFile, iter->type));
++#endif
+     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
+ 
+     /*
+@@ -3737,7 +3757,27 @@
+ }
+ #endif /* KERNEL_VERSION >= 2.6.24 */
+ 
++#if RTLNX_VER_MIN(5,14,0)
++static int vbsf_write_end(struct file *file, struct address_space *mapping,
++                loff_t pos, unsigned int len, unsigned int copied,
++                struct page *page, void *fsdata)
++{
++    static uint64_t volatile s_cCalls = 0;
++    if (s_cCalls++ < 16)
++    {
++        printk("vboxsf: Unexpected call to vbsf_write_end(pos=%#llx len=%#x)! Please report.\n",
++               (unsigned long long)pos, len);
++        RTLogBackdoorPrintf("vboxsf: Unexpected call to vbsf_write_end(pos=%#llx len=%#x)!  Please report.\n",
++                            (unsigned long long)pos, len);
++# ifdef WARN_ON
++        WARN_ON(1);
++# endif
++    }
+ 
++    return -ENOTSUPP;
++}
++#endif
++
+ #if RTLNX_VER_MIN(2,4,10)
+ 
+ # ifdef VBOX_UEK
+@@ -3791,8 +3831,11 @@
+ #if RTLNX_VER_MIN(2,5,12)
+     .set_page_dirty = __set_page_dirty_buffers,
+ #endif
+-#if RTLNX_VER_MIN(2,6,24)
++#if RTLNX_VER_MIN(5,14,0)
+     .write_begin    = vbsf_write_begin,
++    .write_end      = vbsf_write_end,
++#elif RTLNX_VER_MIN(2,6,24)
++    .write_begin    = vbsf_write_begin,
+     .write_end      = simple_write_end,
+ #elif RTLNX_VER_MIN(2,5,45)
+     .prepare_write  = simple_prepare_write,
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
index 689782b7f..84651ae64 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.26.bb
@@ -13,13 +13,15 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://r89690-5.14-fixes.patch \
+    file://r90497-regops-5.14-fix.patch \
 "
 
 SRC_URI[md5sum] = "fce04bbef244b4df1a50e53d132d3e6f"
 SRC_URI[sha256sum] = "0212602eea878d6c9fd7f4a3e0182da3e4505f31d25f5539fb8f7b1fbe366195"
 
 S ?= "${WORKDIR}/vbox_module"
-S_task-patch = "${WORKDIR}/${VBOX_NAME}"
+S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH:x86-64="amd64"
-- 
2.25.1

