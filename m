Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB38C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 09:50:29 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.6180.1634896227812976094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CahtwNfM;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id o12so2444622uap.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0X9kTQSecJ1A2eWUIOJzSTOK+Dja8BPlQFvjTzOyu4=;
        b=CahtwNfMdIPLdhJUUUbA4LxADwHZP+tpDhXCbuQLOqVpqyj5/qKx+gsIXMt39dMg+w
         AJwqpi/Z1mxd+gOrzA6Ap3On1RNBkuaash/kSYfV/TBMbuBkMUQ9z+3pYhME3fIwnM0C
         KgHiAPNPbYmz621UxXY1KS6PvvFUmsXrf/LGRjcZvyFSrmMJVgULqw1T7TNPovdfgF7H
         HJzh0K1IX6WOieKy1WHDI7zpZf/pEVLbNF85/MoxBufZw/AQUahXOk+LYlWDHws7JG4F
         5eQW0uwMjyLyVTbGFUKcBNcy5hIJ6DBka4bME/SOlw0enUauGQnc7CUDydfT+utfdeJL
         F19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0X9kTQSecJ1A2eWUIOJzSTOK+Dja8BPlQFvjTzOyu4=;
        b=iC1CnnG4ckY8x8SMs1tBLBR0jtryVJUt2Tp99GrPCESlS4sz1048dCmw8mdcn2IPuz
         fYVevPmMeLU2iBkZY5zu7U0Q6QceHdttEvoa2/qykkdtzWRFlM/XasCCizf4vT0tWaWg
         3IsinTHyuWWPAFt/KNQrb7+MnJrh/a0wBrWkWWKMxY1jlkPvTt/JN26jOFHNqmp1gCF5
         0Rgkf54SNDsGuWQRk2vBtN+DuOq8YnLGQKTXuCTdD06KgvdKyLKzRDddNTMXaCEnrnlc
         dG2UBEykttSSTMCzneQUXQn0t2i9hwumgPrvqYAFFL90oaL4WP5cZGGq0H9bljY7A9Z3
         kxNA==
X-Gm-Message-State: AOAM531OWx9y5ay3+hINdCKrcWjGTXeV0/R6TJkWyBFFMVNMkVAi93i6
	FaMpnhZ3X+TkQSTEU1+y2Io9Yh9VQ4L73cTPrhw=
X-Google-Smtp-Source: 
 ABdhPJxRUzMxbWLZYKEhKC10nmGaUjsyTpSE6A9hL8GrF3e2xkLNUeCXwu3aizu56ZuPfBaKbi+EUjvjtsEWKdCouyg=
X-Received: by 2002:ab0:4751:: with SMTP id i17mr13034716uac.86.1634896226812;
 Fri, 22 Oct 2021 02:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211020105613.164741-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sqHH5H=9-EASUhEaKo16hVtZw6oJUS13ubBbspZuA7+zA@mail.gmail.com>
 <CAATN8PUwKTDzAirXADiJ7nWH+_XezESckk2b3ocCLfFV2Ak+=g@mail.gmail.com>
 <CAMKF1srsq=3AKQo0d9emkYV0wc9=qLoR-cv8gRx_Qmuox1O0Bw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srsq=3AKQo0d9emkYV0wc9=qLoR-cv8gRx_Qmuox1O0Bw@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Fri, 22 Oct 2021 11:50:15 +0200
Message-ID: 
 <CAATN8PXVLJwK1Hqe5wBjefRG4Qh6h=aXkQKqyK=F9DttaUccQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.26 -> 6.1.28
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000d806d905ceedf082"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 09:50:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93531

--000000000000d806d905ceedf082
Content-Type: text/plain; charset="UTF-8"

Hello,
FYI I traced down the upstream change that introduced this regression:
https://www.virtualbox.org/changeset?reponame=vbox&new=91232%40trunk%2Finclude%2Fiprt%2Fstdarg.h&old=82968%40trunk%2Finclude%2Fiprt%2Fstdarg.h

--- a/vboxsf/include/iprt/stdarg.h
+++ b/vboxsf/include/iprt/stdarg.h
@@ -43,13 +43,6 @@
 #  if __GNUC__ >= 4 /* System headers refers to __builtin_stdarg_start. */
 #   define __builtin_stdarg_start __builtin_va_start
 #  endif
-# elif defined(RT_OS_LINUX) && defined(IN_RING0)
-#  include "linux/version.h"
-#  if RTLNX_VER_MIN(5,15,0)
-#   include <linux/stdarg.h>
-#  else
-#   include <stdarg.h>
-#  endif
 # else
 #  include <stdarg.h>
 # endif

I did grep into the kernel source code and that files is already included
in lots of places and drivers.

I honestly think that file should be ship into STAGING_KERNEL_DIR instead
of STAGING_KERNEL_BUILDDIR
because other binaries will need it probably in the future.
But this change needs to be done in poky, not meta-openembedded.

For now I'm submitting you a patch that does this:
+    # hack to include in the source directory the utsrelease.h file,
making the build succeed.
+    # this might be removed in future releases if the kernel starts
shipping this generated file into KERNEL_DIR and not KERNEL_BUILDDIR
+    ln -snf ${STAGING_KERNEL_BUILDDIR}/include/* ${S}/vboxsf/include

fixing the build.
(please let me know if you can forward the request to poky/kernel devs)

Gianfranco

Il giorno gio 21 ott 2021 alle ore 00:28 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Wed, Oct 20, 2021 at 2:26 PM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Hello,
> > any idea is welcome, I can't yet figure out why this file is not in
> recipes-sysroot or whatever.
> > Do you have any help? Of course copy-pasting the "generated" directory
> from the kernel build artifacts works,
> > but I think there should a better way than patching the kernel recipe...
> >
>
> this file should be in kernel-build-artifacts, so I wonder why this is
> not available. Bruce any ideas ?
>
> > Gianfranco
> >
> > Il giorno mer 20 ott 2021 alle ore 21:32 Khem Raj <raj.khem@gmail.com>
> ha scritto:
> >>
> >> seeing this failure on qemux86
> >>
> >> https://errors.yoctoproject.org/Errors/Details/613563/
> >>
> >> On Wed, Oct 20, 2021 at 3:56 AM Gianfranco
> >> <costamagna.gianfranco@gmail.com> wrote:
> >> >
> >> > drop two upstream cherry-pick patches:
> >> > r89690-5.14-fixes.patch
> >> > r90497-regops-5.14-fix.patch
> >> >
> >> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> >> > ---
> >> >  .../vboxguestdrivers/r89690-5.14-fixes.patch  | 442
> ------------------
> >> >  .../r90497-regops-5.14-fix.patch              | 118 -----
> >> >  ...s_6.1.26.bb => vboxguestdrivers_6.1.28.bb} |   6 +-
> >> >  3 files changed, 2 insertions(+), 564 deletions(-)
> >> >  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
> >> >  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
> >> >  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_6.1.26.bb => vboxguestdrivers_6.1.28.bb} (92%)
> >> >
> >> > diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
> >> > deleted file mode 100644
> >> > index 951bd5013..000000000
> >> > ---
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r89690-5.14-fixes.patch
> >> > +++ /dev/null
> >> > @@ -1,442 +0,0 @@
> >> > -Subject: Fix build errors with linux 5.14
> >> > -
> >> > -Upstream-Status: backport
> >> > -
> >> > -svn-id: r89690
> >> > -
> >> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > -
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_drv.h
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_drv.h  (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_drv.h  (revision 90498)
> >> > -@@ -227,6 +227,15 @@
> >> > -                               sizeof(HGSMIHOSTFLAGS))
> >> > - #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE
> >> > -
> >> > -+/** Field @pdev of struct drm_device was removed in 5.14. This macro
> >> > -+ * transparently handles this change. Input argument is a pointer
> >> > -+ * to struct drm_device. */
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+# define VBOX_DRM_TO_PCI_DEV(_dev) to_pci_dev(_dev->dev)
> >> > -+#else
> >> > -+# define VBOX_DRM_TO_PCI_DEV(_dev) _dev->pdev
> >> > -+#endif
> >> > -+
> >> > - /** How frequently we refresh if the guest is not providing dirty
> rectangles. */
> >> > - #define VBOX_REFRESH_PERIOD (HZ / 2)
> >> > -
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_main.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_main.c (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_main.c (revision 90498)
> >> > -@@ -290,7 +290,7 @@
> >> > -       /* Take a command buffer for each screen from the end of
> usable VRAM. */
> >> > -       vbox->available_vram_size -= vbox->num_crtcs *
> VBVA_MIN_BUFFER_SIZE;
> >> > -
> >> > --      vbox->vbva_buffers = pci_iomap_range(vbox->dev->pdev, 0,
> >> > -+      vbox->vbva_buffers =
> pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0,
> >> > -
> vbox->available_vram_size,
> >> > -                                            vbox->num_crtcs *
> >> > -                                            VBVA_MIN_BUFFER_SIZE);
> >> > -@@ -311,7 +311,7 @@
> >> > -       return 0;
> >> > -
> >> > - err_pci_iounmap:
> >> > --      pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
> >> > -+      pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev),
> vbox->vbva_buffers);
> >> > -       return ret;
> >> > - }
> >> > -
> >> > -@@ -318,7 +318,7 @@
> >> > - static void vbox_accel_fini(struct vbox_private *vbox)
> >> > - {
> >> > -       vbox_disable_accel(vbox);
> >> > --      pci_iounmap(vbox->dev->pdev, vbox->vbva_buffers);
> >> > -+      pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev),
> vbox->vbva_buffers);
> >> > - }
> >> > -
> >> > - /** Do we support the 4.3 plus mode hint reporting interface? */
> >> > -@@ -393,7 +393,7 @@
> >> > -
> >> > -       /* Map guest-heap at end of vram */
> >> > -       vbox->guest_heap =
> >> > --          pci_iomap_range(vbox->dev->pdev, 0,
> GUEST_HEAP_OFFSET(vbox),
> >> > -+          pci_iomap_range(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0,
> GUEST_HEAP_OFFSET(vbox),
> >> > -                           GUEST_HEAP_SIZE);
> >> > -       if (!vbox->guest_heap)
> >> > -               return -ENOMEM;
> >> > -@@ -442,7 +442,7 @@
> >> > - err_destroy_guest_pool:
> >> > -       gen_pool_destroy(vbox->guest_pool);
> >> > - err_unmap_guest_heap:
> >> > --      pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
> >> > -+      pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
> >> > -       return ret;
> >> > - }
> >> > -
> >> > -@@ -452,7 +452,7 @@
> >> > -       cancel_delayed_work(&vbox->refresh_work);
> >> > -       vbox_accel_fini(vbox);
> >> > -       gen_pool_destroy(vbox->guest_pool);
> >> > --      pci_iounmap(vbox->dev->pdev, vbox->guest_heap);
> >> > -+      pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox->dev), vbox->guest_heap);
> >> > - }
> >> > -
> >> > - #if RTLNX_VER_MIN(4,19,0) || RTLNX_RHEL_MIN(8,3)
> >> > -@@ -567,12 +567,16 @@
> >> > -
> >> > -       size = roundup(size, PAGE_SIZE);
> >> > -       if (size == 0)
> >> > -+      {
> >> > -+              DRM_ERROR("bad size\n");
> >> > -               return -EINVAL;
> >> > -+      }
> >> > -
> >> > -       ret = vbox_bo_create(dev, size, 0, 0, &vboxbo);
> >> > -       if (ret) {
> >> > -               if (ret != -ERESTARTSYS)
> >> > -                       DRM_ERROR("failed to allocate GEM object\n");
> >> > -+              DRM_ERROR("failed to allocate GEM (%d)\n", ret);
> >> > -               return ret;
> >> > -       }
> >> > -
> >> > -@@ -628,6 +632,21 @@
> >> > - {
> >> > -       struct vbox_bo *vbox_bo = gem_to_vbox_bo(obj);
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      /* Starting from kernel 5.14, there is a warning appears in
> dmesg
> >> > -+       * on attempt to desroy pinned buffer object. Make sure it is
> unpinned. */
> >> > -+      while (vbox_bo->bo.pin_count)
> >> > -+      {
> >> > -+              int ret;
> >> > -+              ret = vbox_bo_unpin(vbox_bo);
> >> > -+              if (ret)
> >> > -+              {
> >> > -+                      DRM_ERROR("unable to unpin buffer object\n");
> >> > -+                      break;
> >> > -+              }
> >> > -+      }
> >> > -+#endif
> >> > -+
> >> > -       ttm_bo_put(&vbox_bo->bo);
> >> > - }
> >> > -
> >> > -@@ -648,7 +667,7 @@
> >> > -                     u32 handle, u64 *offset)
> >> > - {
> >> > -       struct drm_gem_object *obj;
> >> > --      int ret;
> >> > -+      int ret = 0;
> >> > -       struct vbox_bo *bo;
> >> > -
> >> > -       mutex_lock(&dev->struct_mutex);
> >> > -@@ -665,8 +684,15 @@
> >> > -       bo = gem_to_vbox_bo(obj);
> >> > -       *offset = vbox_bo_mmap_offset(bo);
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      ret = drm_vma_node_allow(&bo->bo.base.vma_node, file);
> >> > -+      if (ret)
> >> > -+      {
> >> > -+              DRM_ERROR("unable to grant previladges to user");
> >> > -+      }
> >> > -+#endif
> >> > -+
> >> > -       drm_gem_object_put(obj);
> >> > --      ret = 0;
> >> > -
> >> > - out_unlock:
> >> > -       mutex_unlock(&dev->struct_mutex);
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_mode.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_mode.c (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_mode.c (revision 90498)
> >> > -@@ -245,6 +245,10 @@
> >> > -                       vbox_bo_unpin(bo);
> >> > -                       vbox_bo_unreserve(bo);
> >> > -               }
> >> > -+              else
> >> > -+              {
> >> > -+                      DRM_ERROR("unable to lock buffer object:
> error %d\n", ret);
> >> > -+              }
> >> > -       }
> >> > -
> >> > -       if (&vbox->fbdev->afb == vbox_fb)
> >> > -@@ -856,7 +860,9 @@
> >> > -       vbox->cursor_data_size = data_size;
> >> > -       dst = vbox->cursor_data;
> >> > -
> >> > --#if RTLNX_VER_MIN(5,12,0)
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages,
> &uobj_map);
> >> > -+#elif RTLNX_VER_MIN(5,12,0)
> >> > -       ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages,
> &uobj_map);
> >> > - #else
> >> > -       ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &uobj_map);
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_ttm.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_ttm.c  (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_ttm.c  (revision 90498)
> >> > -@@ -41,6 +41,10 @@
> >> > - # include <drm/ttm/ttm_page_alloc.h>
> >> > - #endif
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+# include <drm/ttm/ttm_range_manager.h>
> >> > -+#endif
> >> > -+
> >> > - #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
> >> > - #define PLACEMENT_FLAGS(placement) (placement)
> >> > - #else
> >> > -@@ -174,11 +178,13 @@
> >> > -       *pl = vboxbo->placement;
> >> > - }
> >> > -
> >> > -+#if RTLNX_VER_MAX(5,14,0)
> >> > - static int vbox_bo_verify_access(struct ttm_buffer_object *bo,
> >> > -                                struct file *filp)
> >> > - {
> >> > -       return 0;
> >> > - }
> >> > -+#endif
> >> > -
> >> > - #if RTLNX_VER_MAX(5,10,0)
> >> > - static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> >> > -@@ -234,10 +240,10 @@
> >> > -               mem->bus.caching = ttm_write_combined;
> >> > - # endif
> >> > - # if RTLNX_VER_MIN(5,10,0)
> >> > --              mem->bus.offset = (mem->start << PAGE_SHIFT) +
> pci_resource_start(vbox->dev->pdev, 0);
> >> > -+              mem->bus.offset = (mem->start << PAGE_SHIFT) +
> pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
> >> > - # else
> >> > -               mem->bus.offset = mem->start << PAGE_SHIFT;
> >> > --              mem->start = pci_resource_start(vbox->dev->pdev, 0);
> >> > -+              mem->start =
> pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0);
> >> > - # endif
> >> > -               mem->bus.is_iomem = true;
> >> > -               break;
> >> > -@@ -373,7 +379,9 @@
> >> > -       .eviction_valuable = ttm_bo_eviction_valuable,
> >> > - #endif
> >> > -       .evict_flags = vbox_bo_evict_flags,
> >> > -+#if RTLNX_VER_MAX(5,14,0)
> >> > -       .verify_access = vbox_bo_verify_access,
> >> > -+#endif
> >> > -       .io_mem_reserve = &vbox_ttm_io_mem_reserve,
> >> > -       .io_mem_free = &vbox_ttm_io_mem_free,
> >> > - #if RTLNX_VER_MIN(4,12,0) || RTLNX_RHEL_MAJ_PREREQ(7,5)
> >> > -@@ -451,12 +459,12 @@
> >> > -       }
> >> > -
> >> > - #ifdef DRM_MTRR_WC
> >> > --      vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
> >> > --                                   pci_resource_len(dev->pdev, 0),
> >> > -+      vbox->fb_mtrr =
> drm_mtrr_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
> >> > -+
>  pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0),
> >> > -                                    DRM_MTRR_WC);
> >> > - #else
> >> > --      vbox->fb_mtrr =
> arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
> >> > --                                       pci_resource_len(dev->pdev,
> 0));
> >> > -+      vbox->fb_mtrr =
> arch_phys_wc_add(pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),
> >> > -+
>  pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0));
> >> > - #endif
> >> > -       return 0;
> >> > -
> >> > -@@ -477,8 +485,8 @@
> >> > - {
> >> > - #ifdef DRM_MTRR_WC
> >> > -       drm_mtrr_del(vbox->fb_mtrr,
> >> > --                   pci_resource_start(vbox->dev->pdev, 0),
> >> > --                   pci_resource_len(vbox->dev->pdev, 0),
> DRM_MTRR_WC);
> >> > -+
>  pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox->dev), 0),
> >> > -+                   pci_resource_len(VBOX_DRM_TO_PCI_DEV(vbox->dev),
> 0), DRM_MTRR_WC);
> >> > - #else
> >> > -       arch_phys_wc_del(vbox->fb_mtrr);
> >> > - #endif
> >> > -@@ -560,6 +568,9 @@
> >> > - static const struct drm_gem_object_funcs vbox_drm_gem_object_funcs
> = {
> >> > -       .free   = vbox_gem_free_object,
> >> > -       .print_info = drm_gem_ttm_print_info,
> >> > -+# if RTLNX_VER_MIN(5,14,0)
> >> > -+      .mmap = drm_gem_ttm_mmap,
> >> > -+# endif
> >> > - };
> >> > - #endif
> >> > -
> >> > -@@ -598,6 +609,17 @@
> >> > -                                      sizeof(struct vbox_bo));
> >> > - #endif
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      /* Initialization of the following was removed from DRM stack
> >> > -+       * in 5.14, so we need to do it manually. */
> >> > -+      vboxbo->bo.base.funcs = &vbox_drm_gem_object_funcs;
> >> > -+      kref_init(&vboxbo->bo.base.refcount);
> >> > -+      vboxbo->bo.base.size = size;
> >> > -+      vboxbo->bo.base.dev = dev;
> >> > -+      dma_resv_init(&vboxbo->bo.base._resv);
> >> > -+      drm_vma_node_reset(&vboxbo->bo.base.vma_node);
> >> > -+#endif
> >> > -+
> >> > -       ret = ttm_bo_init(&vbox->ttm.bdev, &vboxbo->bo, size,
> >> > -                         ttm_bo_type_device, &vboxbo->placement,
> >> > - #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> >> > -@@ -613,7 +635,11 @@
> >> > -                         NULL, vbox_bo_ttm_destroy);
> >> > - #endif
> >> > -       if (ret)
> >> > --              goto err_free_vboxbo;
> >> > -+      {
> >> > -+              /* In case of failure, ttm_bo_init() supposed to call
> >> > -+               * vbox_bo_ttm_destroy() which in turn will free
> @vboxbo. */
> >> > -+              goto err_exit;
> >> > -+      }
> >> > -
> >> > -       *pvboxbo = vboxbo;
> >> > -
> >> > -@@ -621,12 +647,15 @@
> >> > -
> >> > - err_free_vboxbo:
> >> > -       kfree(vboxbo);
> >> > -+err_exit:
> >> > -       return ret;
> >> > - }
> >> > -
> >> > - static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)
> >> > - {
> >> > --#if RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) ||
> RTLNX_SUSE_MAJ_PREREQ(15,3)
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      return bo->bo.resource->start << PAGE_SHIFT;
> >> > -+#elif RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) ||
> RTLNX_SUSE_MAJ_PREREQ(15,3)
> >> > -       return bo->bo.mem.start << PAGE_SHIFT;
> >> > - #else
> >> > -       return bo->bo.offset;
> >> > -@@ -685,7 +714,7 @@
> >> > -       struct ttm_operation_ctx ctx = { false, false };
> >> > - # endif
> >> > - #endif
> >> > --      int ret;
> >> > -+      int ret = 0;
> >> > - #if RTLNX_VER_MAX(5,11,0)
> >> > -       int i;
> >> > - #endif
> >> > -@@ -765,6 +794,7 @@
> >> > - {
> >> > -       struct drm_file *file_priv;
> >> > -       struct vbox_private *vbox;
> >> > -+      int ret = -EINVAL;
> >> > -
> >> > -       if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET))
> >> > -               return -EINVAL;
> >> > -@@ -772,5 +802,12 @@
> >> > -       file_priv = filp->private_data;
> >> > -       vbox = file_priv->minor->dev->dev_private;
> >> > -
> >> > --      return ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      if (drm_dev_is_unplugged(file_priv->minor->dev))
> >> > -+              return -ENODEV;
> >> > -+      ret = drm_gem_mmap(filp, vma);
> >> > -+#else
> >> > -+      ret = ttm_bo_mmap(filp, vma, &vbox->ttm.bdev);
> >> > -+#endif
> >> > -+      return ret;
> >> > - }
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_fb.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_fb.c   (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_fb.c   (revision 90498)
> >> > -@@ -301,7 +301,9 @@
> >> > -               return ret;
> >> > -       }
> >> > -
> >> > --#if RTLNX_VER_MIN(5,12,0)
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+      ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.resource->num_pages,
> &bo->kmap);
> >> > -+#elif RTLNX_VER_MIN(5,12,0)
> >> > -       ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.mem.num_pages,
> &bo->kmap);
> >> > - #else
> >> > -       ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages, &bo->kmap);
> >> > -@@ -337,8 +339,8 @@
> >> > -        * This seems to be done for safety checking that the
> framebuffer
> >> > -        * is not registered twice by different drivers.
> >> > -        */
> >> > --      info->apertures->ranges[0].base =
> pci_resource_start(dev->pdev, 0);
> >> > --      info->apertures->ranges[0].size = pci_resource_len(dev->pdev,
> 0);
> >> > -+      info->apertures->ranges[0].base =
> pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0);
> >> > -+      info->apertures->ranges[0].size =
> pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0);
> >> > -
> >> > - #if RTLNX_VER_MIN(5,2,0) || RTLNX_RHEL_MAJ_PREREQ(8,2)
> >> > -         /*
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_drv.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_drv.c  (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_drv.c  (revision 90498)
> >> > -@@ -43,6 +43,10 @@
> >> > - # include <drm/drm_probe_helper.h>
> >> > - #endif
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+# include <drm/drm_aperture.h>
> >> > -+#endif
> >> > -+
> >> > - #include "version-generated.h"
> >> > - #include "revision-generated.h"
> >> > -
> >> > -@@ -65,12 +69,23 @@
> >> > -       struct drm_device *dev = NULL;
> >> > -       int ret = 0;
> >> > -
> >> > -+# if RTLNX_VER_MIN(5,14,0)
> >> > -+      ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> "vboxvideofb");
> >> > -+      if (ret)
> >> > -+      {
> >> > -+              printk("unable to remove conflicting framebuffer
> devices\n");
> >> > -+              return ret;
> >> > -+      }
> >> > -+# endif /* 5.14 */
> >> > -+
> >> > -       dev = drm_dev_alloc(&driver, &pdev->dev);
> >> > -       if (IS_ERR(dev)) {
> >> > -               ret = PTR_ERR(dev);
> >> > -               goto err_drv_alloc;
> >> > -       }
> >> > -+#if RTLNX_VER_MAX(5,14,0)
> >> > -       dev->pdev = pdev;
> >> > -+#endif
> >> > -       pci_set_drvdata(pdev, dev);
> >> > -
> >> > -       ret = vbox_driver_load(dev);
> >> > -@@ -125,7 +140,7 @@
> >> > -
> >> > -       drm_kms_helper_poll_disable(dev);
> >> > -
> >> > --      pci_save_state(dev->pdev);
> >> > -+      pci_save_state(VBOX_DRM_TO_PCI_DEV(dev));
> >> > -
> >> > -       drm_fb_helper_set_suspend_unlocked(&vbox->fbdev->helper,
> true);
> >> > -
> >> > -@@ -147,7 +162,7 @@
> >> > - {
> >> > -       int ret;
> >> > -
> >> > --      if (pci_enable_device(dev->pdev))
> >> > -+      if (pci_enable_device(VBOX_DRM_TO_PCI_DEV(dev)))
> >> > -               return -EIO;
> >> > -
> >> > -       ret = vbox_drm_thaw(dev);
> >> > -Index: a/src/VBox/Additions/linux/drm/vbox_irq.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/drm/vbox_irq.c  (revision 89690)
> >> > -+++ a/src/VBox/Additions/linux/drm/vbox_irq.c  (revision 90498)
> >> > -@@ -206,7 +206,7 @@
> >> > -       INIT_WORK(&vbox->hotplug_work, vbox_hotplug_worker);
> >> > -       vbox_update_mode_hints(vbox);
> >> > - #if RTLNX_VER_MIN(3,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,1)
> >> > --      return drm_irq_install(vbox->dev, vbox->dev->pdev->irq);
> >> > -+      return drm_irq_install(vbox->dev,
> VBOX_DRM_TO_PCI_DEV(vbox->dev)->irq);
> >> > - #else
> >> > -       return drm_irq_install(vbox->dev);
> >> > - #endif
> >> > diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
> >> > deleted file mode 100644
> >> > index 0d960fa4f..000000000
> >> > ---
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/r90497-regops-5.14-fix.patch
> >> > +++ /dev/null
> >> > @@ -1,118 +0,0 @@
> >> > -Subject: Fix regops build errors with linux 5.14
> >> > -
> >> > -Upstream-Status: backport
> >> > -
> >> > -svn-id: r90497
> >> > -
> >> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > -
> >> > -Index: a/src/VBox/Additions/linux/sharedfolders/regops.c
> >> > -===================================================================
> >> > ---- a/src/VBox/Additions/linux/sharedfolders/regops.c  (revision
> 88716)
> >> > -+++ a/src/VBox/Additions/linux/sharedfolders/regops.c  (revision
> 90497)
> >> > -@@ -2126,7 +2126,11 @@
> >> > -     int    rc       = 0;
> >> > -
> >> > -     Assert(iov_iter_count(iter) + pStash->cb > 0);
> >> > -+# if RTLNX_VER_MIN(5,14,0)
> >> > -+    if (!(iter->iter_type & ITER_KVEC)) {
> >> > -+#else
> >> > -     if (!(iter->type & ITER_KVEC)) {
> >> > -+#endif
> >> > -         /*
> >> > -          * Do we have a stashed page?
> >> > -          */
> >> > -@@ -2372,7 +2376,9 @@
> >> > - static size_t vbsf_iter_max_span_of_pages(struct iov_iter *iter)
> >> > - {
> >> > -     size_t cPages;
> >> > --# if RTLNX_VER_MIN(3,16,0)
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+    if (iter_is_iovec(iter) || (iter->iter_type & ITER_KVEC)) {
> >> > -+#elif RTLNX_VER_MIN(3,16,0)
> >> > -     if (iter_is_iovec(iter) || (iter->type & ITER_KVEC)) {
> >> > - #endif
> >> > -         const struct iovec *pCurIov    = iter->iov;
> >> > -@@ -2436,7 +2442,11 @@
> >> > -     } else {
> >> > -         /* Won't bother with accurate counts for the next two
> types, just make
> >> > -            some rough estimates (does pipes have segments?): */
> >> > -+#  if RTLNX_VER_MIN(5,14,0)
> >> > -+        size_t cSegs = iter->iter_type & ITER_BVEC ? RT_MAX(1,
> iter->nr_segs) : 1;
> >> > -+#  else
> >> > -         size_t cSegs = iter->type & ITER_BVEC ? RT_MAX(1,
> iter->nr_segs) : 1;
> >> > -+#endif
> >> > -         cPages = (iov_iter_count(iter) + (PAGE_SIZE * 2 - 2) *
> cSegs) >> PAGE_SHIFT;
> >> > -     }
> >> > - # endif
> >> > -@@ -2588,8 +2598,14 @@
> >> > -     struct vbsf_reg_info   *sf_r       = kio->ki_filp->private_data;
> >> > -     struct vbsf_super_info *pSuperInfo =
> VBSF_GET_SUPER_INFO(inode->i_sb);
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -     SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx
> off=%#llx type=%#x\n",
> >> > -+               inode, kio->ki_filp, cbToRead, kio->ki_pos,
> iter->iter_type));
> >> > -+#else
> >> > -+    SFLOGFLOW(("vbsf_reg_read_iter: inode=%p file=%p size=%#zx
> off=%#llx type=%#x\n",
> >> > -                inode, kio->ki_filp, cbToRead, kio->ki_pos,
> iter->type));
> >> > -+#endif
> >> > -+
> >> > -     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
> >> > -
> >> > -     /*
> >> > -@@ -2823,9 +2839,13 @@
> >> > -     bool const              fAppend    =
> RT_BOOL(kio->ki_filp->f_flags & O_APPEND);
> >> > - # endif
> >> > -
> >> > --
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -     SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx
> off=%#llx type=%#x\n",
> >> > -+               inode, kio->ki_filp, cbToWrite, offFile,
> iter->iter_type));
> >> > -+#else
> >> > -+    SFLOGFLOW(("vbsf_reg_write_iter: inode=%p file=%p size=%#zx
> off=%#llx type=%#x\n",
> >> > -                inode, kio->ki_filp, cbToWrite, offFile,
> iter->type));
> >> > -+#endif
> >> > -     AssertReturn(S_ISREG(inode->i_mode), -EINVAL);
> >> > -
> >> > -     /*
> >> > -@@ -3737,7 +3757,27 @@
> >> > - }
> >> > - #endif /* KERNEL_VERSION >= 2.6.24 */
> >> > -
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -+static int vbsf_write_end(struct file *file, struct address_space
> *mapping,
> >> > -+                loff_t pos, unsigned int len, unsigned int copied,
> >> > -+                struct page *page, void *fsdata)
> >> > -+{
> >> > -+    static uint64_t volatile s_cCalls = 0;
> >> > -+    if (s_cCalls++ < 16)
> >> > -+    {
> >> > -+        printk("vboxsf: Unexpected call to vbsf_write_end(pos=%#llx
> len=%#x)! Please report.\n",
> >> > -+               (unsigned long long)pos, len);
> >> > -+        RTLogBackdoorPrintf("vboxsf: Unexpected call to
> vbsf_write_end(pos=%#llx len=%#x)!  Please report.\n",
> >> > -+                            (unsigned long long)pos, len);
> >> > -+# ifdef WARN_ON
> >> > -+        WARN_ON(1);
> >> > -+# endif
> >> > -+    }
> >> > -
> >> > -+    return -ENOTSUPP;
> >> > -+}
> >> > -+#endif
> >> > -+
> >> > - #if RTLNX_VER_MIN(2,4,10)
> >> > -
> >> > - # ifdef VBOX_UEK
> >> > -@@ -3791,8 +3831,11 @@
> >> > - #if RTLNX_VER_MIN(2,5,12)
> >> > -     .set_page_dirty = __set_page_dirty_buffers,
> >> > - #endif
> >> > --#if RTLNX_VER_MIN(2,6,24)
> >> > -+#if RTLNX_VER_MIN(5,14,0)
> >> > -     .write_begin    = vbsf_write_begin,
> >> > -+    .write_end      = vbsf_write_end,
> >> > -+#elif RTLNX_VER_MIN(2,6,24)
> >> > -+    .write_begin    = vbsf_write_begin,
> >> > -     .write_end      = simple_write_end,
> >> > - #elif RTLNX_VER_MIN(2,5,45)
> >> > -     .prepare_write  = simple_prepare_write,
> >> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.28.bb
> >> > similarity index 92%
> >> > rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.26.bb
> >> > rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.28.bb
> >> > index 84651ae64..c7e73b222 100644
> >> > --- a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.26.bb
> >> > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.28.bb
> >> > @@ -13,12 +13,10 @@ VBOX_NAME = "VirtualBox-${PV}"
> >> >
> >> >  SRC_URI = "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
> >> >      file://Makefile.utils \
> >> > -    file://r89690-5.14-fixes.patch \
> >> > -    file://r90497-regops-5.14-fix.patch \
> >> >  "
> >> >
> >> > -SRC_URI[md5sum] = "fce04bbef244b4df1a50e53d132d3e6f"
> >> > -SRC_URI[sha256sum] =
> "0212602eea878d6c9fd7f4a3e0182da3e4505f31d25f5539fb8f7b1fbe366195"
> >> > +SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
> >> > +SRC_URI[sha256sum] =
> "8d34993d8e9c0cf35e7bd44dd26c8c757f17a3b7d5a64052f945d00fd798ebfe"
> >> >
> >> >  S ?= "${WORKDIR}/vbox_module"
> >> >  S:task-patch = "${WORKDIR}/${VBOX_NAME}"
> >> > --
> >> > 2.25.1
> >> >
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#93478):
> https://lists.openembedded.org/g/openembedded-devel/message/93478
> >> > Mute This Topic: https://lists.openembedded.org/mt/86462001/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >
>

--000000000000d806d905ceedf082
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>FYI I traced down the upstream chang=
e that introduced this regression:</div><div><a href=3D"https://www.virtual=
box.org/changeset?reponame=3Dvbox&amp;new=3D91232%40trunk%2Finclude%2Fiprt%=
2Fstdarg.h&amp;old=3D82968%40trunk%2Finclude%2Fiprt%2Fstdarg.h">https://www=
.virtualbox.org/changeset?reponame=3Dvbox&amp;new=3D91232%40trunk%2Finclude=
%2Fiprt%2Fstdarg.h&amp;old=3D82968%40trunk%2Finclude%2Fiprt%2Fstdarg.h</a><=
/div><div><br></div><div>--- a/vboxsf/include/iprt/stdarg.h<br>+++ b/vboxsf=
/include/iprt/stdarg.h<br>@@ -43,13 +43,6 @@<br>=C2=A0# =C2=A0if __GNUC__ &=
gt;=3D 4 /* System headers refers to __builtin_stdarg_start. */<br>=C2=A0# =
=C2=A0 define __builtin_stdarg_start __builtin_va_start<br>=C2=A0# =C2=A0en=
dif<br>-# elif defined(RT_OS_LINUX) &amp;&amp; defined(IN_RING0)<br>-# =C2=
=A0include &quot;linux/version.h&quot;<br>-# =C2=A0if RTLNX_VER_MIN(5,15,0)=
<br>-# =C2=A0 include &lt;linux/stdarg.h&gt;<br>-# =C2=A0else<br>-# =C2=A0 =
include &lt;stdarg.h&gt;<br>-# =C2=A0endif<br>=C2=A0# else<br>=C2=A0# =C2=
=A0include &lt;stdarg.h&gt;<br>=C2=A0# endif</div><div><br></div><div>I did=
 grep into the kernel source code and that files is already included in lot=
s of places and drivers.</div><div><br></div><div>I honestly think that fil=
e should be ship into STAGING_KERNEL_DIR instead of STAGING_KERNEL_BUILDDIR=
</div><div>because other binaries will need it probably in the future.</div=
><div>But this change needs to be done in poky, not meta-openembedded.</div=
><div><br></div><div>For now I&#39;m submitting you a patch that does this:=
</div><div>+ =C2=A0 =C2=A0# hack to include in the source directory the uts=
release.h file, making the build succeed.<br>+ =C2=A0 =C2=A0# this might be=
 removed in future releases if the kernel starts shipping this generated fi=
le into KERNEL_DIR and not KERNEL_BUILDDIR<br>+ =C2=A0 =C2=A0ln -snf ${STAG=
ING_KERNEL_BUILDDIR}/include/* ${S}/vboxsf/include</div><div><br></div><div=
>fixing the build.</div><div>(please let me know if you can forward the req=
uest to poky/kernel devs)<br></div><div><br></div><div>Gianfranco<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Il giorno gio 21 ott 2021 alle ore 00:28 Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritto:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, Oct 20, 2021 at 2:26 PM Gia=
nfranco Costamagna<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">co=
stamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt; any idea is welcome, I can&#39;t yet figure out why this file is not i=
n recipes-sysroot or whatever.<br>
&gt; Do you have any help? Of course copy-pasting the &quot;generated&quot;=
 directory from the kernel build artifacts works,<br>
&gt; but I think there should a better way than patching the kernel recipe.=
..<br>
&gt;<br>
<br>
this file should be in kernel-build-artifacts, so I wonder why this is<br>
not available. Bruce any ideas ?<br>
<br>
&gt; Gianfranco<br>
&gt;<br>
&gt; Il giorno mer 20 ott 2021 alle ore 21:32 Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; ha scrit=
to:<br>
&gt;&gt;<br>
&gt;&gt; seeing this failure on qemux86<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/613563/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/613563/</a><br>
&gt;&gt;<br>
&gt;&gt; On Wed, Oct 20, 2021 at 3:56 AM Gianfranco<br>
&gt;&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_=
blank">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; drop two upstream cherry-pick patches:<br>
&gt;&gt; &gt; r89690-5.14-fixes.patch<br>
&gt;&gt; &gt; r90497-regops-5.14-fix.patch<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:co=
stamagnagianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.i=
t</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:lo=
cutusofborg@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<=
br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../vboxguestdrivers/r89690-5.14-fixes.patch=C2=A0 | 44=
2 ------------------<br>
&gt;&gt; &gt;=C2=A0 .../r90497-regops-5.14-fix.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 118 -----<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://s_6.1.26.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">s_6.1.26.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_=
6.1.28.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.28.bb<=
/a>} |=C2=A0 =C2=A06 +-<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 2 insertions(+), 564 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/vboxguestdri=
vers/vboxguestdrivers/r89690-5.14-fixes.patch<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/vboxguestdri=
vers/vboxguestdrivers/r90497-regops-5.14-fix.patch<br>
&gt;&gt; &gt;=C2=A0 rename meta-oe/recipes-support/vboxguestdrivers/{<a hre=
f=3D"http://vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"_blank=
">vboxguestdrivers_6.1.26.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers=
_6.1.28.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.28.bb=
</a>} (92%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxgue=
stdrivers/r89690-5.14-fixes.patch b/meta-oe/recipes-support/vboxguestdriver=
s/vboxguestdrivers/r89690-5.14-fixes.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 951bd5013..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrive=
rs/r89690-5.14-fixes.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,442 +0,0 @@<br>
&gt;&gt; &gt; -Subject: Fix build errors with linux 5.14<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: backport<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -svn-id: r89690<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_drv.h<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_drv.h=C2=A0 (revisio=
n 89690)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_drv.h=C2=A0 (revisio=
n 90498)<br>
&gt;&gt; &gt; -@@ -227,6 +227,15 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(HGSMIHOSTFLAGS))=
<br>
&gt;&gt; &gt; - #define HOST_FLAGS_OFFSET GUEST_HEAP_USABLE_SIZE<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+/** Field @pdev of struct drm_device was removed in 5.14. T=
his macro<br>
&gt;&gt; &gt; -+ * transparently handles this change. Input argument is a p=
ointer<br>
&gt;&gt; &gt; -+ * to struct drm_device. */<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+# define VBOX_DRM_TO_PCI_DEV(_dev) to_pci_dev(_dev-&gt;dev)=
<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+# define VBOX_DRM_TO_PCI_DEV(_dev) _dev-&gt;pdev<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - /** How frequently we refresh if the guest is not providing=
 dirty rectangles. */<br>
&gt;&gt; &gt; - #define VBOX_REFRESH_PERIOD (HZ / 2)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_main.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_main.c (revision 896=
90)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_main.c (revision 904=
98)<br>
&gt;&gt; &gt; -@@ -290,7 +290,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Take a command buffer for each=
 screen from the end of usable VRAM. */<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox-&gt;available_vram_size -=3D=
 vbox-&gt;num_crtcs * VBVA_MIN_BUFFER_SIZE;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 vbox-&gt;vbva_buffers =3D pci_iomap_ra=
nge(vbox-&gt;dev-&gt;pdev, 0,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vbox-&gt;vbva_buffers =3D pci_iomap_ra=
nge(VBOX_DRM_TO_PCI_DEV(vbox-&gt;dev), 0,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vbox-&gt;available_vram_size,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 vbox-&gt;num_crtcs *<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VBVA_MIN_BUFFER_SIZE);<br>
&gt;&gt; &gt; -@@ -311,7 +311,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - err_pci_iounmap:<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 pci_iounmap(vbox-&gt;dev-&gt;pdev, vbo=
x-&gt;vbva_buffers);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox-&=
gt;dev), vbox-&gt;vbva_buffers);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -318,7 +318,7 @@<br>
&gt;&gt; &gt; - static void vbox_accel_fini(struct vbox_private *vbox)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_disable_accel(vbox);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 pci_iounmap(vbox-&gt;dev-&gt;pdev, vbo=
x-&gt;vbva_buffers);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox-&=
gt;dev), vbox-&gt;vbva_buffers);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - /** Do we support the 4.3 plus mode hint reporting interfac=
e? */<br>
&gt;&gt; &gt; -@@ -393,7 +393,7 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Map guest-heap at end of vram =
*/<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox-&gt;guest_heap =3D<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_iomap_range(vbox-&gt=
;dev-&gt;pdev, 0, GUEST_HEAP_OFFSET(vbox),<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_iomap_range(VBOX_DRM=
_TO_PCI_DEV(vbox-&gt;dev), 0, GUEST_HEAP_OFFSET(vbox),<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUEST_HEAP_SIZE);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vbox-&gt;guest_heap)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n -ENOMEM;<br>
&gt;&gt; &gt; -@@ -442,7 +442,7 @@<br>
&gt;&gt; &gt; - err_destroy_guest_pool:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_pool_destroy(vbox-&gt;guest_p=
ool);<br>
&gt;&gt; &gt; - err_unmap_guest_heap:<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 pci_iounmap(vbox-&gt;dev-&gt;pdev, vbo=
x-&gt;guest_heap);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox-&=
gt;dev), vbox-&gt;guest_heap);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -452,7 +452,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cancel_delayed_work(&amp;vbox-&gt=
;refresh_work);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_accel_fini(vbox);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_pool_destroy(vbox-&gt;guest_p=
ool);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 pci_iounmap(vbox-&gt;dev-&gt;pdev, vbo=
x-&gt;guest_heap);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 pci_iounmap(VBOX_DRM_TO_PCI_DEV(vbox-&=
gt;dev), vbox-&gt;guest_heap);<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(4,19,0) || RTLNX_RHEL_MIN(8,3)<br>
&gt;&gt; &gt; -@@ -567,12 +567,16 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D roundup(size, PAGE_SIZE)=
;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(=
&quot;bad size\n&quot;);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n -EINVAL;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vbox_bo_create(dev, size,=
 0, 0, &amp;vboxbo);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r=
et !=3D -ERESTARTSYS)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;failed to allocate GEM object\n&quo=
t;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(=
&quot;failed to allocate GEM (%d)\n&quot;, ret);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n ret;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -628,6 +632,21 @@<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vbox_bo *vbox_bo =3D gem_t=
o_vbox_bo(obj);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 /* Starting from kernel 5.14, there is=
 a warning appears in dmesg<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* on attempt to desroy pinned bu=
ffer object. Make sure it is unpinned. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 while (vbox_bo-&gt;bo.pin_count)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D vb=
ox_bo_unpin(vbox_bo);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;unable to unpin buffer object\n&quot;);<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_put(&amp;vbox_bo-&gt;bo);<=
br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -648,7 +667,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0u32 handle, u64 *offset)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vbox_bo *bo;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;dev-&gt;struct_mu=
tex);<br>
&gt;&gt; &gt; -@@ -665,8 +684,15 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bo =3D gem_to_vbox_bo(obj);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*offset =3D vbox_bo_mmap_offset(b=
o);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D drm_vma_node_allow(&amp;bo-&gt=
;bo.base.vma_node, file);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(=
&quot;unable to grant previladges to user&quot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put(obj);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - out_unlock:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;dev-&gt;struct_=
mutex);<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_mode.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_mode.c (revision 896=
90)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_mode.c (revision 904=
98)<br>
&gt;&gt; &gt; -@@ -245,6 +245,10 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unpin(bo);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unreserve(bo);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;unable to lock buffer object: error %d\n&=
quot;, ret);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (&amp;vbox-&gt;fbdev-&gt;afb =
=3D=3D vbox_fb)<br>
&gt;&gt; &gt; -@@ -856,7 +860,9 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox-&gt;cursor_data_size =3D dat=
a_size;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dst =3D vbox-&gt;cursor_data;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#if RTLNX_VER_MIN(5,12,0)<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D ttm_bo_kmap(&amp;bo-&gt;bo, 0,=
 bo-&gt;bo.resource-&gt;num_pages, &amp;uobj_map);<br>
&gt;&gt; &gt; -+#elif RTLNX_VER_MIN(5,12,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_kmap(&amp;bo-&gt;b=
o, 0, bo-&gt;bo.mem.num_pages, &amp;uobj_map);<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_kmap(&amp;bo-&gt;b=
o, 0, bo-&gt;bo.num_pages, &amp;uobj_map);<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_ttm.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_ttm.c=C2=A0 (revisio=
n 89690)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_ttm.c=C2=A0 (revisio=
n 90498)<br>
&gt;&gt; &gt; -@@ -41,6 +41,10 @@<br>
&gt;&gt; &gt; - # include &lt;drm/ttm/ttm_page_alloc.h&gt;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+# include &lt;drm/ttm/ttm_range_manager.h&gt;<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - #if RTLNX_VER_MAX(3,18,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ=
(7,2)<br>
&gt;&gt; &gt; - #define PLACEMENT_FLAGS(placement) (placement)<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -@@ -174,11 +178,13 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*pl =3D vboxbo-&gt;placement;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MAX(5,14,0)<br>
&gt;&gt; &gt; - static int vbox_bo_verify_access(struct ttm_buffer_object *=
bo,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct file *filp)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #if RTLNX_VER_MAX(5,10,0)<br>
&gt;&gt; &gt; - static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev,<br>
&gt;&gt; &gt; -@@ -234,10 +240,10 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&=
gt;bus.caching =3D ttm_write_combined;<br>
&gt;&gt; &gt; - # endif<br>
&gt;&gt; &gt; - # if RTLNX_VER_MIN(5,10,0)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bu=
s.offset =3D (mem-&gt;start &lt;&lt; PAGE_SHIFT) + pci_resource_start(vbox-=
&gt;dev-&gt;pdev, 0);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bu=
s.offset =3D (mem-&gt;start &lt;&lt; PAGE_SHIFT) + pci_resource_start(VBOX_=
DRM_TO_PCI_DEV(vbox-&gt;dev), 0);<br>
&gt;&gt; &gt; - # else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&=
gt;bus.offset =3D mem-&gt;start &lt;&lt; PAGE_SHIFT;<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;st=
art =3D pci_resource_start(vbox-&gt;dev-&gt;pdev, 0);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;st=
art =3D pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox-&gt;dev), 0);<br>
&gt;&gt; &gt; - # endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&=
gt;bus.is_iomem =3D true;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break=
;<br>
&gt;&gt; &gt; -@@ -373,7 +379,9 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.eviction_valuable =3D ttm_bo_evi=
ction_valuable,<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.evict_flags =3D vbox_bo_evict_fl=
ags,<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MAX(5,14,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.verify_access =3D vbox_bo_verify=
_access,<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.io_mem_reserve =3D &amp;vbox_ttm=
_io_mem_reserve,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.io_mem_free =3D &amp;vbox_ttm_io=
_mem_free,<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(4,12,0) || RTLNX_RHEL_MAJ_PREREQ(7,5)<br>
&gt;&gt; &gt; -@@ -451,12 +459,12 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #ifdef DRM_MTRR_WC<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 vbox-&gt;fb_mtrr =3D drm_mtrr_add(pci_=
resource_start(dev-&gt;pdev, 0),<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_resou=
rce_len(dev-&gt;pdev, 0),<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vbox-&gt;fb_mtrr =3D drm_mtrr_add(pci_=
resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_resou=
rce_len(VBOX_DRM_TO_PCI_DEV(dev), 0),<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MTRR=
_WC);<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 vbox-&gt;fb_mtrr =3D arch_phys_wc_add(=
pci_resource_start(dev-&gt;pdev, 0),<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pci_resource_len(dev-&gt;pdev, 0));<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vbox-&gt;fb_mtrr =3D arch_phys_wc_add(=
pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0),<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0));<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -477,8 +485,8 @@<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; - #ifdef DRM_MTRR_WC<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mtrr_del(vbox-&gt;fb_mtrr,<br=
>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pci_resource_start(vbox-&gt;dev-&gt;pdev, 0),<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pci_resource_len(vbox-&gt;dev-&gt;pdev, 0), DRM_MTRR_WC);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pci_resource_start(VBOX_DRM_TO_PCI_DEV(vbox-&gt;dev), 0),<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pci_resource_len(VBOX_DRM_TO_PCI_DEV(vbox-&gt;dev), 0), DRM_MTRR_=
WC);<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0arch_phys_wc_del(vbox-&gt;fb_mtrr=
);<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -@@ -560,6 +568,9 @@<br>
&gt;&gt; &gt; - static const struct drm_gem_object_funcs vbox_drm_gem_objec=
t_funcs =3D {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.free=C2=A0 =C2=A0=3D vbox_gem_fr=
ee_object,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.print_info =3D drm_gem_ttm_print=
_info,<br>
&gt;&gt; &gt; -+# if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 .mmap =3D drm_gem_ttm_mmap,<br>
&gt;&gt; &gt; -+# endif<br>
&gt;&gt; &gt; - };<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -598,6 +609,17 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
izeof(struct vbox_bo));<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 /* Initialization of the following was=
 removed from DRM stack<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0* in 5.14, so we need to do it m=
anually. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vboxbo-&gt;bo.base.funcs =3D &amp;vbox=
_drm_gem_object_funcs;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 kref_init(&amp;vboxbo-&gt;bo.base.refc=
ount);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vboxbo-&gt;bo.base.size =3D size;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 vboxbo-&gt;<a href=3D"http://bo.base.d=
ev" rel=3D"noreferrer" target=3D"_blank">bo.base.dev</a> =3D dev;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 dma_resv_init(&amp;vboxbo-&gt;bo.base.=
_resv);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 drm_vma_node_reset(&amp;vboxbo-&gt;bo.=
base.vma_node);<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_init(&amp;vbox-&gt=
;ttm.bdev, &amp;vboxbo-&gt;bo, size,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_type_device, &amp;vboxbo-&gt;placemen=
t,<br>
&gt;&gt; &gt; - #if RTLNX_VER_MAX(4,17,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ=
(7,6) &amp;&amp; !RTLNX_SUSE_MAJ_PREREQ(15,1) &amp;&amp; !RTLNX_SUSE_MAJ_PR=
EREQ(12,5)<br>
&gt;&gt; &gt; -@@ -613,7 +635,11 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, vbox_bo_ttm_destroy);<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_f=
ree_vboxbo;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* In case=
 of failure, ttm_bo_init() supposed to call<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* vb=
ox_bo_ttm_destroy() which in turn will free @vboxbo. */<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_e=
xit;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*pvboxbo =3D vboxbo;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -621,12 +647,15 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - err_free_vboxbo:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(vboxbo);<br>
&gt;&gt; &gt; -+err_exit:<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - static inline u64 vbox_bo_gpu_offset(struct vbox_bo *bo)<br=
>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; --#if RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_SU=
SE_MAJ_PREREQ(15,3)<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return bo-&gt;bo.resource-&gt;start &l=
t;&lt; PAGE_SHIFT;<br>
&gt;&gt; &gt; -+#elif RTLNX_VER_MIN(5,9,0) || RTLNX_RHEL_MIN(8,4) || RTLNX_=
SUSE_MAJ_PREREQ(15,3)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return bo-&gt;bo.mem.start &lt;&l=
t; PAGE_SHIFT;<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return bo-&gt;bo.offset;<br>
&gt;&gt; &gt; -@@ -685,7 +714,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx ctx =3D =
{ false, false };<br>
&gt;&gt; &gt; - # endif<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt;&gt; &gt; - #if RTLNX_VER_MAX(5,11,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -@@ -765,6 +794,7 @@<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *file_priv;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vbox_private *vbox;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 int ret =3D -EINVAL;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(vma-&gt;vm_pgoff &lt=
; DRM_FILE_PAGE_OFFSET))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n -EINVAL;<br>
&gt;&gt; &gt; -@@ -772,5 +802,12 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0file_priv =3D filp-&gt;private_da=
ta;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox =3D file_priv-&gt;minor-&gt;=
dev-&gt;dev_private;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 return ttm_bo_mmap(filp, vma, &amp;vbo=
x-&gt;ttm.bdev);<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (drm_dev_is_unplugged(file_priv-&gt=
;minor-&gt;dev))<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EN=
ODEV;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D drm_gem_mmap(filp, vma);<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D ttm_bo_mmap(filp, vma, &amp;vb=
ox-&gt;ttm.bdev);<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_fb.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_fb.c=C2=A0 =C2=A0(re=
vision 89690)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_fb.c=C2=A0 =C2=A0(re=
vision 90498)<br>
&gt;&gt; &gt; -@@ -301,7 +301,9 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n ret;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --#if RTLNX_VER_MIN(5,12,0)<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D ttm_bo_kmap(&amp;bo-&gt;bo, 0,=
 bo-&gt;bo.resource-&gt;num_pages, &amp;bo-&gt;kmap);<br>
&gt;&gt; &gt; -+#elif RTLNX_VER_MIN(5,12,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_kmap(&amp;bo-&gt;b=
o, 0, bo-&gt;bo.mem.num_pages, &amp;bo-&gt;kmap);<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_kmap(&amp;bo-&gt;b=
o, 0, bo-&gt;bo.num_pages, &amp;bo-&gt;kmap);<br>
&gt;&gt; &gt; -@@ -337,8 +339,8 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This seems to be done for safe=
ty checking that the framebuffer<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 * is not registered twice by dif=
ferent drivers.<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 info-&gt;apertures-&gt;ranges[0].base =
=3D pci_resource_start(dev-&gt;pdev, 0);<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 info-&gt;apertures-&gt;ranges[0].size =
=3D pci_resource_len(dev-&gt;pdev, 0);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 info-&gt;apertures-&gt;ranges[0].base =
=3D pci_resource_start(VBOX_DRM_TO_PCI_DEV(dev), 0);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 info-&gt;apertures-&gt;ranges[0].size =
=3D pci_resource_len(VBOX_DRM_TO_PCI_DEV(dev), 0);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(5,2,0) || RTLNX_RHEL_MAJ_PREREQ(8,2)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_drv.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_drv.c=C2=A0 (revisio=
n 89690)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_drv.c=C2=A0 (revisio=
n 90498)<br>
&gt;&gt; &gt; -@@ -43,6 +43,10 @@<br>
&gt;&gt; &gt; - # include &lt;drm/drm_probe_helper.h&gt;<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+# include &lt;drm/drm_aperture.h&gt;<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - #include &quot;version-generated.h&quot;<br>
&gt;&gt; &gt; - #include &quot;revision-generated.h&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -65,12 +69,23 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D NULL;<=
br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+# if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D drm_aperture_remove_conflictin=
g_pci_framebuffers(pdev, &quot;vboxvideofb&quot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&qu=
ot;unable to remove conflicting framebuffer devices\n&quot;);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret=
;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -+# endif /* 5.14 */<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D drm_dev_alloc(&amp;driver=
, &amp;pdev-&gt;dev);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dev)) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D PTR_ERR(dev);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
err_drv_alloc;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MAX(5,14,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;pdev =3D pdev;<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_set_drvdata(pdev, dev);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vbox_driver_load(dev);<br=
>
&gt;&gt; &gt; -@@ -125,7 +140,7 @@<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_disable(dev);=
<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 pci_save_state(dev-&gt;pdev);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 pci_save_state(VBOX_DRM_TO_PCI_DEV(dev=
));<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fb_helper_set_suspend_unlocke=
d(&amp;vbox-&gt;fbdev-&gt;helper, true);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -@@ -147,7 +162,7 @@<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 if (pci_enable_device(dev-&gt;pdev))<b=
r>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (pci_enable_device(VBOX_DRM_TO_PCI_=
DEV(dev)))<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n -EIO;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D vbox_drm_thaw(dev);<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/drm/vbox_irq.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/drm/vbox_irq.c=C2=A0 (revisio=
n 89690)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/drm/vbox_irq.c=C2=A0 (revisio=
n 90498)<br>
&gt;&gt; &gt; -@@ -206,7 +206,7 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_WORK(&amp;vbox-&gt;hotplug_w=
ork, vbox_hotplug_worker);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_update_mode_hints(vbox);<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(3,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,1)<br>
&gt;&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 return drm_irq_install(vbox-&gt;dev, v=
box-&gt;dev-&gt;pdev-&gt;irq);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 return drm_irq_install(vbox-&gt;dev, V=
BOX_DRM_TO_PCI_DEV(vbox-&gt;dev)-&gt;irq);<br>
&gt;&gt; &gt; - #else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_irq_install(vbox-&gt;d=
ev);<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxgue=
stdrivers/r90497-regops-5.14-fix.patch b/meta-oe/recipes-support/vboxguestd=
rivers/vboxguestdrivers/r90497-regops-5.14-fix.patch<br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index 0d960fa4f..000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrive=
rs/r90497-regops-5.14-fix.patch<br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,118 +0,0 @@<br>
&gt;&gt; &gt; -Subject: Fix regops build errors with linux 5.14<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Upstream-Status: backport<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -svn-id: r90497<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -Index: a/src/VBox/Additions/linux/sharedfolders/regops.c<br>
&gt;&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; ---- a/src/VBox/Additions/linux/sharedfolders/regops.c=C2=A0 =
(revision 88716)<br>
&gt;&gt; &gt; -+++ a/src/VBox/Additions/linux/sharedfolders/regops.c=C2=A0 =
(revision 90497)<br>
&gt;&gt; &gt; -@@ -2126,7 +2126,11 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 rc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 0;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0Assert(iov_iter_count(iter) + pStash-&gt=
;cb &gt; 0);<br>
&gt;&gt; &gt; -+# if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (!(iter-&gt;iter_type &amp; ITER_KVEC)) {<=
br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!(iter-&gt;type &amp; ITER_KVEC)) {<=
br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Do we have a stashed pa=
ge?<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; &gt; -@@ -2372,7 +2376,9 @@<br>
&gt;&gt; &gt; - static size_t vbsf_iter_max_span_of_pages(struct iov_iter *=
iter)<br>
&gt;&gt; &gt; - {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0size_t cPages;<br>
&gt;&gt; &gt; --# if RTLNX_VER_MIN(3,16,0)<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (iter_is_iovec(iter) || (iter-&gt;iter_typ=
e &amp; ITER_KVEC)) {<br>
&gt;&gt; &gt; -+#elif RTLNX_VER_MIN(3,16,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (iter_is_iovec(iter) || (iter-&gt;typ=
e &amp; ITER_KVEC)) {<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *pCurIo=
v=C2=A0 =C2=A0 =3D iter-&gt;iov;<br>
&gt;&gt; &gt; -@@ -2436,7 +2442,11 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Won&#39;t bother with a=
ccurate counts for the next two types, just make<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 some rough estimat=
es (does pipes have segments?): */<br>
&gt;&gt; &gt; -+#=C2=A0 if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t cSegs =3D iter-&gt;iter_=
type &amp; ITER_BVEC ? RT_MAX(1, iter-&gt;nr_segs) : 1;<br>
&gt;&gt; &gt; -+#=C2=A0 else<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t cSegs =3D iter-&gt;=
type &amp; ITER_BVEC ? RT_MAX(1, iter-&gt;nr_segs) : 1;<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cPages =3D (iov_iter_count=
(iter) + (PAGE_SIZE * 2 - 2) * cSegs) &gt;&gt; PAGE_SHIFT;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - # endif<br>
&gt;&gt; &gt; -@@ -2588,8 +2598,14 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct vbsf_reg_info=C2=A0 =C2=A0*sf_r=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D kio-&gt;ki_filp-&gt;private_data;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct vbsf_super_info *pSuperInfo =3D V=
BSF_GET_SUPER_INFO(inode-&gt;i_sb);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SFLOGFLOW((&quot;vbsf_reg_read_iter: ino=
de=3D%p file=3D%p size=3D%#zx off=3D%#llx type=3D%#x\n&quot;,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inod=
e, kio-&gt;ki_filp, cbToRead, kio-&gt;ki_pos, iter-&gt;iter_type));<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 SFLOGFLOW((&quot;vbsf_reg_read_iter: inode=3D=
%p file=3D%p size=3D%#zx off=3D%#llx type=3D%#x\n&quot;,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inod=
e, kio-&gt;ki_filp, cbToRead, kio-&gt;ki_pos, iter-&gt;type));<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0AssertReturn(S_ISREG(inode-&gt;i_mode), =
-EINVAL);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt; -@@ -2823,9 +2839,13 @@<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0bool const=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 fAppend=C2=A0 =C2=A0 =3D RT_BOOL(kio-&gt;ki_filp-&gt;f=
_flags &amp; O_APPEND);<br>
&gt;&gt; &gt; - # endif<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0SFLOGFLOW((&quot;vbsf_reg_write_iter: in=
ode=3D%p file=3D%p size=3D%#zx off=3D%#llx type=3D%#x\n&quot;,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inod=
e, kio-&gt;ki_filp, cbToWrite, offFile, iter-&gt;iter_type));<br>
&gt;&gt; &gt; -+#else<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 SFLOGFLOW((&quot;vbsf_reg_write_iter: inode=
=3D%p file=3D%p size=3D%#zx off=3D%#llx type=3D%#x\n&quot;,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inod=
e, kio-&gt;ki_filp, cbToWrite, offFile, iter-&gt;type));<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0AssertReturn(S_ISREG(inode-&gt;i_mode), =
-EINVAL);<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; &gt; -@@ -3737,7 +3757,27 @@<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; - #endif /* KERNEL_VERSION &gt;=3D 2.6.24 */<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -+static int vbsf_write_end(struct file *file, struct address=
_space *mapping,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lof=
f_t pos, unsigned int len, unsigned int copied,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
uct page *page, void *fsdata)<br>
&gt;&gt; &gt; -+{<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 static uint64_t volatile s_cCalls =3D 0;<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 if (s_cCalls++ &lt; 16)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 {<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;vboxsf: Unexpected=
 call to vbsf_write_end(pos=3D%#llx len=3D%#x)! Please report.\n&quot;,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uns=
igned long long)pos, len);<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RTLogBackdoorPrintf(&quot;vboxs=
f: Unexpected call to vbsf_write_end(pos=3D%#llx len=3D%#x)!=C2=A0 Please r=
eport.\n&quot;,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned long long)pos, len);<br>
&gt;&gt; &gt; -+# ifdef WARN_ON<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN_ON(1);<br>
&gt;&gt; &gt; -+# endif<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 return -ENOTSUPP;<br>
&gt;&gt; &gt; -+}<br>
&gt;&gt; &gt; -+#endif<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(2,4,10)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - # ifdef VBOX_UEK<br>
&gt;&gt; &gt; -@@ -3791,8 +3831,11 @@<br>
&gt;&gt; &gt; - #if RTLNX_VER_MIN(2,5,12)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0.set_page_dirty =3D __set_page_dirty_buf=
fers,<br>
&gt;&gt; &gt; - #endif<br>
&gt;&gt; &gt; --#if RTLNX_VER_MIN(2,6,24)<br>
&gt;&gt; &gt; -+#if RTLNX_VER_MIN(5,14,0)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0.write_begin=C2=A0 =C2=A0 =3D vbsf_write=
_begin,<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 .write_end=C2=A0 =C2=A0 =C2=A0 =3D vbsf_write=
_end,<br>
&gt;&gt; &gt; -+#elif RTLNX_VER_MIN(2,6,24)<br>
&gt;&gt; &gt; -+=C2=A0 =C2=A0 .write_begin=C2=A0 =C2=A0 =3D vbsf_write_begi=
n,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0.write_end=C2=A0 =C2=A0 =C2=A0 =3D simpl=
e_write_end,<br>
&gt;&gt; &gt; - #elif RTLNX_VER_MIN(2,5,45)<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0.prepare_write=C2=A0 =3D simple_prepare_=
write,<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=
=3D"http://vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"_blank"=
>vboxguestdrivers_6.1.26.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/=
<a href=3D"http://vboxguestdrivers_6.1.28.bb" rel=3D"noreferrer" target=3D"=
_blank">vboxguestdrivers_6.1.28.bb</a><br>
&gt;&gt; &gt; similarity index 92%<br>
&gt;&gt; &gt; rename from meta-oe/recipes-support/vboxguestdrivers/<a href=
=3D"http://vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"_blank"=
>vboxguestdrivers_6.1.26.bb</a><br>
&gt;&gt; &gt; rename to meta-oe/recipes-support/vboxguestdrivers/<a href=3D=
"http://vboxguestdrivers_6.1.28.bb" rel=3D"noreferrer" target=3D"_blank">vb=
oxguestdrivers_6.1.28.bb</a><br>
&gt;&gt; &gt; index 84651ae64..c7e73b222 100644<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"htt=
p://vboxguestdrivers_6.1.26.bb" rel=3D"noreferrer" target=3D"_blank">vboxgu=
estdrivers_6.1.26.bb</a><br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"htt=
p://vboxguestdrivers_6.1.28.bb" rel=3D"noreferrer" target=3D"_blank">vboxgu=
estdrivers_6.1.28.bb</a><br>
&gt;&gt; &gt; @@ -13,12 +13,10 @@ VBOX_NAME =3D &quot;VirtualBox-${PV}&quot=
;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://download.virtualbox=
.org/virtualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer" targ=
et=3D"_blank">http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.=
tar.bz2</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://Makefile.utils \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://r89690-5.14-fixes.patch \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://r90497-regops-5.14-fix.patch \<br>
&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -SRC_URI[md5sum] =3D &quot;fce04bbef244b4df1a50e53d132d3e6f&q=
uot;<br>
&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;0212602eea878d6c9fd7f4a3e0182da=
3e4505f31d25f5539fb8f7b1fbe366195&quot;<br>
&gt;&gt; &gt; +SRC_URI[md5sum] =3D &quot;c6efae8dc115b90c6124e13126794c4f&q=
uot;<br>
&gt;&gt; &gt; +SRC_URI[sha256sum] =3D &quot;8d34993d8e9c0cf35e7bd44dd26c8c7=
57f17a3b7d5a64052f945d00fd798ebfe&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 S ?=3D &quot;${WORKDIR}/vbox_module&quot;<br>
&gt;&gt; &gt;=C2=A0 S:task-patch =3D &quot;${WORKDIR}/${VBOX_NAME}&quot;<br=
>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#93478): <a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/93478" rel=3D"noreferrer" target=3D"_=
blank">https://lists.openembedded.org/g/openembedded-devel/message/93478</a=
><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/86462001/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/86462001/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.opene=
mbedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000d806d905ceedf082--

