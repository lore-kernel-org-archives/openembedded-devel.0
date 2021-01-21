Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.60.1611266011913350004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eOxnI4d4;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id e15so1953573vsa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 13:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vg8SrStP2RhVBZLi6mmPrteJVyWonO2YYLguCyK4FUA=;
        b=eOxnI4d4q6xN6c9C5kSDEd4D5BIcmKfadixswjdQ6dGLf/jQcRV4k1/klY5/iqL4IE
         RNW47pJBtuLFUm61v7kzCaENlt+MK30p2vJZStuAYcGVcWYu47QnXXHBf7haTTJzo/Ss
         AmzqhdM08dYOUzqWxfid6+k1KEEcvBJHSZ15h5vI+BYPgAQ1ajTg/cP1VJMk0OwdzMtN
         BgYo39XT+8QANvs3UZO2h3ziRm77vcmlLrGnPwahjWywwwARtq681g4BmSRE4BvpzkT0
         FnrBqc2p2q0EeGfbcHzi8CkVeMilJCy4s315Z9ZE0tv0RT6cfs8AEMP5u+GTrfY93ry3
         2YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vg8SrStP2RhVBZLi6mmPrteJVyWonO2YYLguCyK4FUA=;
        b=BU7rc43AarzG+oNb4u0L1efJIQK2KfhWrh4hXbDsEiQpF6VOfzgHAox2DyIyyNz4jh
         nxkW1q2VwCO84ubky13iBo3os77y1Nsdqb8sFAUwWB0PS6tCVcDmuFo7+imsmHBR3F88
         CbLcOZnoFVfSLAgFmji2rex8kAncOA26fHLWP3k7+5ZsStQywAfpbRRGo+UuXAs0JEja
         cQrLi1lkvXAJllsuYFBEeek+BypQhBZT3+Fq+uhmzORjkgtrNEywQwxCHBPGtkUuznyY
         srb2RgtSZm8dqbeVsJC70hCF5y30g8gpxmZedYNhtSS8KVvo59s4aOxA/cBLLGmxLUhj
         SyHg==
X-Gm-Message-State: AOAM5304zCy3ZMogSpEI6gGTHjDdCZzTNtXXI4BYmjdDTEgDJFvO/C8l
	FvA9cBQ6/oDESYbL/l+5l2e7q7NMd5hGN2whxTU=
X-Google-Smtp-Source: ABdhPJyuUu5N8S+3NY79GxPZK7cx6q9vUS+FvlaXgYDYywhKFwK4mwB+k5CmnZApswgNd0uzI/Kg5tPr3Y9zEMHXmys=
X-Received: by 2002:a67:eac8:: with SMTP id s8mr1168746vso.24.1611266010909;
 Thu, 21 Jan 2021 13:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20210120130118.1410689-1-costamagnagianfranco@yahoo.it> <CAMKF1sqEQCJPafJZ5-T64BhOaMzLEJSf44KCgWHiNi+m88or=g@mail.gmail.com>
In-Reply-To: <CAMKF1sqEQCJPafJZ5-T64BhOaMzLEJSf44KCgWHiNi+m88or=g@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Thu, 21 Jan 2021 22:53:19 +0100
Message-ID: <CAATN8PX=HJmusVE+U+5RMbsvikC1rbumAsMksXj6C0ZjciQp0Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="00000000000038107b05b9701ac9"

--00000000000038107b05b9701ac9
Content-Type: text/plain; charset="UTF-8"

Hello, I resubmitted with a little patch that fixes part (but not all) the
musl failures.

Just to be clear, this seems to be not a regression, the current master
with 6.1.16 has the very same failures on i386.

The current proposed patchset is not making the situation worse, and
upstream is having a look at the issue.

Gianfranco

Il giorno gio 21 gen 2021 alle ore 09:26 Khem Raj <raj.khem@gmail.com> ha
scritto:

> fails on musl/x86
>
> https://errors.yoctoproject.org/Errors/Details/541637/
>
> On Wed, Jan 20, 2021 at 5:01 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Drop kernel 5.10 build fixes patches, now part of upstream codebase
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  ...-linux-drm-Adjustment-for-Linux-5.10.patch | 321 ------------------
> >  ...0drv-linux.c-Changes-to-support-the-.patch | 119 -------
> >  ...justment-for-linux-5.10-TASK_SIZE_MA.patch |  46 ---
> >  ...s_6.1.16.bb => vboxguestdrivers_6.1.18.bb} |   7 +-
> >  4 files changed, 2 insertions(+), 491 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
> >  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> >  delete mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> >  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_6.1.16.bb => vboxguestdrivers_6.1.18.bb} (88%)
> >
> > diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
> > deleted file mode 100644
> > index a444901f8..000000000
> > ---
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
> > +++ /dev/null
> > @@ -1,321 +0,0 @@
> > -From b6c765d693a0833b94cb2e91b32842570c3458d2 Mon Sep 17 00:00:00 2001
> > -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> > -Date: Tue, 15 Dec 2020 22:29:56 +0000
> > -Subject: [PATCH] Additions/linux/drm: Adjustment for Linux 5.10.
> > -
> > -Upstream-Status: Backport
> > -
> > -git-svn-id: http://www.virtualbox.org/svn/vbox@87092
> cfe28804-0f27-0410-a406-dd0f0b0b656f
> > -
> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > -
> > ----
> > - src/VBox/Additions/linux/drm/vbox_drv.h | 10 +-
> > - src/VBox/Additions/linux/drm/vbox_fb.c  |  2 +-
> > - .../src/VBox/Additions/linux/drm/vbox_mode.c  |  2 +-
> > - src/VBox/Additions/linux/drm/vbox_ttm.c | 99 +++++++++++++++++--
> > - 4 files changed, 99 insertions(+), 14 deletions(-)
> > -
> > -diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h
> b/src/VBox/Additions/linux/drm/vbox_drv.h
> > -index 8c85371749..7937f2f2d2 100644
> > ---- a/src/VBox/Additions/linux/drm/vbox_drv.h
> > -+++ b/src/VBox/Additions/linux/drm/vbox_drv.h
> > -@@ -175,6 +175,9 @@
> > - #include <drm/ttm/ttm_placement.h>
> > - #include <drm/ttm/ttm_memory.h>
> > - #include <drm/ttm/ttm_module.h>
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+# include <drm/ttm/ttm_resource.h>
> > -+#endif
> > -
> > - #include "vboxvideo_guest.h"
> > - #include "vboxvideo_vbe.h"
> > -@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int
> size, int align,
> > - int vbox_gem_create(struct drm_device *dev,
> > -                   u32 size, bool iskernel, struct drm_gem_object
> **obj);
> > -
> > --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);
> > -+#define VBOX_MEM_TYPE_VRAM   0x1
> > -+#define VBOX_MEM_TYPE_SYSTEM 0x2
> > -+
> > -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);
> > - int vbox_bo_unpin(struct vbox_bo *bo);
> > -
> > - static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
> > -@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo
> *bo)
> > -       ttm_bo_unreserve(&bo->bo);
> > - }
> > -
> > --void vbox_ttm_placement(struct vbox_bo *bo, int domain);
> > -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
> > - int vbox_bo_push_sysram(struct vbox_bo *bo);
> > - int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
> > -
> > -diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c
> b/src/VBox/Additions/linux/drm/vbox_fb.c
> > -index adead98d3d..7182d9da1a 100644
> > ---- a/src/VBox/Additions/linux/drm/vbox_fb.c
> > -+++ b/src/VBox/Additions/linux/drm/vbox_fb.c
> > -@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper
> *helper,
> > -       if (ret)
> > -               return ret;
> > -
> > --      ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
> > -+      ret = vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
> > -       if (ret) {
> > -               vbox_bo_unreserve(bo);
> > -               return ret;
> > -diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c
> b/src/VBox/Additions/linux/drm/vbox_mode.c
> > -index ce7d135cb6..5557db5ef8 100644
> > ---- a/src/VBox/Additions/linux/drm/vbox_mode.c
> > -+++ b/src/VBox/Additions/linux/drm/vbox_mode.c
> > -@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc,
> > -       if (ret)
> > -               return ret;
> > -
> > --      ret = vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
> > -+      ret = vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr);
> > -       vbox_bo_unreserve(bo);
> > -       if (ret)
> > -               return ret;
> > -diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c
> b/src/VBox/Additions/linux/drm/vbox_ttm.c
> > -index bf87aabc05..5eac926a42 100644
> > ---- a/src/VBox/Additions/linux/drm/vbox_ttm.c
> > -+++ b/src/VBox/Additions/linux/drm/vbox_ttm.c
> > -@@ -41,6 +41,7 @@
> > - #define PLACEMENT_FLAGS(placement) ((placement).flags)
> > - #endif
> > -
> > -+
> > - static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
> > - {
> > -       return container_of(bd, struct vbox_private, ttm.bdev);
> > -@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct
> ttm_buffer_object *bo)
> > -       return false;
> > - }
> > -
> > -+#if RTLNX_VER_MAX(5,10,0)
> > - static int
> > - vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
> > -                     struct ttm_mem_type_manager *man)
> > -@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev,
> u32 type,
> > -
> > -       return 0;
> > - }
> > -+#endif
> > -
> > - static void
> > - vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement
> *pl)
> > -@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo,
> struct ttm_placement *pl)
> > -       if (!vbox_ttm_bo_is_vbox_bo(bo))
> > -               return;
> > -
> > --      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
> > -+      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
> > -       *pl = vboxbo->placement;
> > - }
> > -
> > -@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct
> ttm_buffer_object *bo,
> > -       return 0;
> > - }
> > -
> > -+#if RTLNX_VER_MAX(5,10,0)
> > - static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> > -                                  struct ttm_mem_reg *mem)
> > - {
> > --      struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
> > -       struct vbox_private *vbox = vbox_bdev(bdev);
> > -+      struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
> > -
> > -       mem->bus.addr = NULL;
> > -       mem->bus.offset = 0;
> > -@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct
> ttm_bo_device *bdev,
> > -       }
> > -       return 0;
> > - }
> > -+#else
> > -+static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> > -+                                 struct ttm_resource *mem)
> > -+{
> > -+      struct vbox_private *vbox = vbox_bdev(bdev);
> > -+      mem->bus.addr = NULL;
> > -+      mem->bus.offset = 0;
> > -+      mem->size = mem->num_pages << PAGE_SHIFT;
> > -+      mem->start = 0;
> > -+      mem->bus.is_iomem = false;
> > -+      switch (mem->mem_type) {
> > -+      case TTM_PL_SYSTEM:
> > -+              /* system memory */
> > -+              return 0;
> > -+      case TTM_PL_VRAM:
> > -+              mem->bus.offset = mem->start << PAGE_SHIFT;
> > -+              mem->start = pci_resource_start(vbox->dev->pdev, 0);
> > -+              mem->bus.is_iomem = true;
> > -+              break;
> > -+      default:
> > -+              return -EINVAL;
> > -+      }
> > -+      return 0;
> > -+}
> > -+#endif
> > -
> > -+
> > -+
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> > -+                               struct ttm_resource *mem)
> > -+{
> > -+}
> > -+#else
> > - static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> > -                                struct ttm_mem_reg *mem)
> > - {
> > - }
> > -+#endif
> > -
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct
> ttm_tt *tt)
> > -+{
> > -+      ttm_tt_fini(tt);
> > -+      kfree(tt);
> > -+}
> > -+#else
> > - static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
> > - {
> > -       ttm_tt_fini(tt);
> > -@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt
> *tt)
> > - static struct ttm_backend_func vbox_tt_backend_func = {
> > -       .destroy = &vbox_ttm_backend_destroy,
> > - };
> > -+#endif
> > -
> > - #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> > - static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,
> > -@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct
> ttm_buffer_object *bo,
> > -       if (!tt)
> > -               return NULL;
> > -
> > -+#if RTLNX_VER_MAX(5,10,0)
> > -       tt->func = &vbox_tt_backend_func;
> > -+#endif
> > - #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> > -       if (ttm_tt_init(tt, bdev, size, page_flags, dummy_read_page)) {
> > - #else
> > -@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt
> *ttm)
> > -
> > - static struct ttm_bo_driver vbox_bo_driver = {
> > -       .ttm_tt_create = vbox_ttm_tt_create,
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+      .ttm_tt_destroy = vbox_ttm_tt_destroy,
> > -+#endif
> > - #if RTLNX_VER_MAX(4,17,0)
> > -       .ttm_tt_populate = vbox_ttm_tt_populate,
> > -       .ttm_tt_unpopulate = vbox_ttm_tt_unpopulate,
> > - #endif
> > -+#if RTLNX_VER_MAX(5,10,0)
> > -       .init_mem_type = vbox_bo_init_mem_type,
> > -+#endif
> > - #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)
> > -       .eviction_valuable = ttm_bo_eviction_valuable,
> > - #endif
> > -@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)
> > - #endif
> > -       }
> > -
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+      ret = ttm_range_man_init(bdev, TTM_PL_VRAM, false,
> > -+                           vbox->available_vram_size >> PAGE_SHIFT);
> > -+#else
> > -       ret = ttm_bo_init_mm(bdev, TTM_PL_VRAM,
> > -                            vbox->available_vram_size >> PAGE_SHIFT);
> > -+#endif
> > -       if (ret) {
> > -               DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
> > -               goto err_device_release;
> > -@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)
> > - #endif
> > - }
> > -
> > --void vbox_ttm_placement(struct vbox_bo *bo, int domain)
> > -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)
> > - {
> > -       u32 c = 0;
> > - #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
> > -@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int
> domain)
> > -       bo->placement.placement = bo->placements;
> > -       bo->placement.busy_placement = bo->placements;
> > -
> > --      if (domain & TTM_PL_FLAG_VRAM)
> > -+      if (mem_type & VBOX_MEM_TYPE_VRAM) {
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+              bo->placements[c].mem_type = TTM_PL_VRAM;
> > -+              PLACEMENT_FLAGS(bo->placements[c++]) =
> > -+                  TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;
> > -+#else
> > -               PLACEMENT_FLAGS(bo->placements[c++]) =
> > -                   TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
> TTM_PL_FLAG_VRAM;
> > --      if (domain & TTM_PL_FLAG_SYSTEM)
> > -+#endif
> > -+      }
> > -+      if (mem_type & VBOX_MEM_TYPE_SYSTEM) {
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+              bo->placements[c].mem_type = TTM_PL_SYSTEM;
> > -+              PLACEMENT_FLAGS(bo->placements[c++]) =
> > -+                  TTM_PL_MASK_CACHING;
> > -+#else
> > -               PLACEMENT_FLAGS(bo->placements[c++]) =
> > -                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> > --      if (!c)
> > -+#endif
> > -+      }
> > -+      if (!c) {
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+              bo->placements[c].mem_type = TTM_PL_SYSTEM;
> > -+              PLACEMENT_FLAGS(bo->placements[c++]) =
> > -+                  TTM_PL_MASK_CACHING;
> > -+#else
> > -               PLACEMENT_FLAGS(bo->placements[c++]) =
> > -                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> > -+#endif
> > -+      }
> > -
> > -       bo->placement.num_placement = c;
> > -       bo->placement.num_busy_placement = c;
> > -@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int
> size, int align,
> > -       vboxbo->bo.bdev->dev_mapping = dev->dev_mapping;
> > - #endif
> > -
> > --      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM |
> TTM_PL_FLAG_SYSTEM);
> > -+      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM |
> VBOX_MEM_TYPE_SYSTEM);
> > -
> > -       acc_size = ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
> > -                                      sizeof(struct vbox_bo));
> > -@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo
> *bo)
> > - #endif
> > - }
> > -
> > --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
> > -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)
> > - {
> > - #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) ||
> RTLNX_SUSE_MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
> > -       struct ttm_operation_ctx ctx = { false, false };
> > -@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag,
> u64 *gpu_addr)
> > -               return 0;
> > -       }
> > -
> > --      vbox_ttm_placement(bo, pl_flag);
> > -+      vbox_ttm_placement(bo, mem_type);
> > -
> > -       for (i = 0; i < bo->placement.num_placement; i++)
> > -               PLACEMENT_FLAGS(bo->placements[i]) |=
> TTM_PL_FLAG_NO_EVICT;
> > -@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)
> > -       if (bo->kmap.virtual)
> > -               ttm_bo_kunmap(&bo->kmap);
> > -
> > --      vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
> > -+      vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
> > -
> > -       for (i = 0; i < bo->placement.num_placement; i++)
> > -               PLACEMENT_FLAGS(bo->placements[i]) |=
> TTM_PL_FLAG_NO_EVICT;
> > ---
> > -2.19.1
> > -
> > diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> > deleted file mode 100644
> > index db27cb883..000000000
> > ---
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> > +++ /dev/null
> > @@ -1,119 +0,0 @@
> > -From 2a6e3cf63f58e289802a11faad5fb495e2d04e97 Mon Sep 17 00:00:00 2001
> > -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> > -Date: Wed, 9 Dec 2020 18:59:04 +0000
> > -Subject: [PATCH] Runtime/memobj-r0drv-linux.c: Changes to support the
> upcoming
> > - 5.10 kernel, bugref:9879
> > -
> > -Upstream-Status: Backport
> > -
> > -git-svn-id: http://www.virtualbox.org/svn/vbox@87074
> cfe28804-0f27-0410-a406-dd0f0b0b656f
> > -
> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ----
> > - .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 68 ++++++++++++++++++-
> > - 1 file changed, 67 insertions(+), 1 deletion(-)
> > -
> > ---- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> > -+++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> > -@@ -56,9 +56,19 @@
> > -  * Whether we use alloc_vm_area (3.2+) for executable memory.
> > -  * This is a must for 5.8+, but we enable it all the way back to 3.2.x
> for
> > -  * better W^R compliance (fExecutable flag). */
> > --#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
> > -+#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)
> > - # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
> > - #endif
> > -+/** @def IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> > -+ * alloc_vm_area was removed with 5.10 so we have to resort to a
> different way
> > -+ * to allocate executable memory.
> > -+ * It would be possible to remove IPRT_USE_ALLOC_VM_AREA_FOR_EXEC and
> use
> > -+ * this path execlusively for 3.2+ but no time to test it really works
> on every
> > -+ * supported kernel, so better play safe for now.
> > -+ */
> > -+#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
> > -+# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> > -+#endif
> > -
> > - /*
> > -  * 2.6.29+ kernels don't work with remap_pfn_range() anymore because
> > -@@ -502,6 +512,46 @@ static void rtR0MemObjLinuxFreePages(PRT
> > - }
> > -
> > -
> > -+#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> > -+/**
> > -+ * User data passed to the apply_to_page_range() callback.
> > -+ */
> > -+typedef struct LNXAPPLYPGRANGE
> > -+{
> > -+    /** Pointer to the memory object. */
> > -+    PRTR0MEMOBJLNX pMemLnx;
> > -+    /** The page protection flags to apply. */
> > -+    pgprot_t       fPg;
> > -+} LNXAPPLYPGRANGE;
> > -+/** Pointer to the user data. */
> > -+typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;
> > -+/** Pointer to the const user data. */
> > -+typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
> > -+
> > -+/**
> > -+ * Callback called in apply_to_page_range().
> > -+ *
> > -+ * @returns Linux status code.
> > -+ * @param   pPte                Pointer to the page table entry for
> the given address.
> > -+ * @param   uAddr               The address to apply the new
> protection to.
> > -+ * @param   pvUser              The opaque user data.
> > -+ */
> > -+#ifdef __i386__
> > -+static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long
> uAddr, void *pvUser)
> > -+#else
> > -+static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte,
> unsigned long uAddr, void *pvUser)
> > -+#endif
> > -+{
> > -+    PCLNXAPPLYPGRANGE pArgs = (PCLNXAPPLYPGRANGE)pvUser;
> > -+    PRTR0MEMOBJLNX pMemLnx = pArgs->pMemLnx;
> > -+    size_t idxPg = (uAddr - (unsigned long)pMemLnx->Core.pv) >>
> PAGE_SHIFT;
> > -+
> > -+    set_pte(pPte, mk_pte(pMemLnx->apPages[idxPg], pArgs->fPg));
> > -+    return 0;
> > -+}
> > -+#endif
> > -+
> > -+
> > - /**
> > -  * Maps the allocation into ring-0.
> > -  *
> > -@@ -584,6 +634,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMO
> > -         else
> > - # endif
> > -         {
> > -+#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> > -+            if (fExecutable)
> > -+                pgprot_val(fPg) |= _PAGE_NX; /* Uses RTR0MemObjProtect
> to clear NX when memory ready, W^X fashion. */
> > -+#  endif
> > -+
> > - # ifdef VM_MAP
> > -             pMemLnx->Core.pv = vmap(&pMemLnx->apPages[0],
> pMemLnx->cPages, VM_MAP, fPg);
> > - # else
> > -@@ -1851,6 +1906,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(
> > -         preempt_enable();
> > -         return VINF_SUCCESS;
> > -     }
> > -+# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> > -+    PRTR0MEMOBJLNX pMemLnx = (PRTR0MEMOBJLNX)pMem;
> > -+    if (   pMemLnx->fExecutable
> > -+        && pMemLnx->fMappedToRing0)
> > -+    {
> > -+        LNXAPPLYPGRANGE Args;
> > -+        Args.pMemLnx = pMemLnx;
> > -+        Args.fPg = rtR0MemObjLinuxConvertProt(fProt, true /*fKernel*/);
> > -+        int rcLnx = apply_to_page_range(current->active_mm, (unsigned
> long)pMemLnx->Core.pv + offSub, cbSub,
> > -+                                        rtR0MemObjLinuxApplyPageRange,
> (void *)&Args);
> > -+        if (rcLnx)
> > -+            return VERR_NOT_SUPPORTED;
> > -+
> > -+        return VINF_SUCCESS;
> > -+    }
> > - # endif
> > -
> > -     NOREF(pMem);
> > diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> > deleted file mode 100644
> > index 3cfe2e917..000000000
> > ---
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From a276f8bc5e4515f7ea51e2c56e0e634a723ca104 Mon Sep 17 00:00:00 2001
> > -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> > -Date: Tue, 8 Dec 2020 13:52:53 +0000
> > -Subject: [PATCH] linser/vboxsf: Adjustment for linux 5.10 -
> TASK_SIZE_MAX
> > - replaces USER_DS.seg. bugref:9879
> > -
> > -Upstream-Status: Backport
> > -
> > -git-svn-id: http://www.virtualbox.org/svn/vbox@87053
> cfe28804-0f27-0410-a406-dd0f0b0b656f
> > -
> > -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ----
> > - src/VBox/Additions/linux/sharedfolders/regops.c | 9 ++++++++-
> > - 1 file changed, 8 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c
> b/src/VBox/Additions/linux/sharedfolders/regops.c
> > -index e1fad3d820..401fd69930 100644
> > ---- a/src/VBox/Additions/linux/sharedfolders/regops.c
> > -+++ b/src/VBox/Additions/linux/sharedfolders/regops.c
> > -@@ -147,7 +147,11 @@ static int vbsf_iov_iter_detect_type(struct iovec
> const *paIov, size_t cSegs)
> > -     while (cSegs-- > 0) {
> > -         if (paIov->iov_len > 0) {
> > -             if (access_ok(VERIFY_READ, paIov->iov_base,
> paIov->iov_len))
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+                return (uintptr_t)paIov->iov_base >= TASK_SIZE_MAX ?
> ITER_KVEC : 0;
> > -+#else
> > -                 return (uintptr_t)paIov->iov_base >= USER_DS.seg ?
> ITER_KVEC : 0;
> > -+#endif
> > -             AssertMsgFailed(("%p LB %#zx\n", paIov->iov_base,
> paIov->iov_len));
> > -             break;
> > -         }
> > -@@ -1401,7 +1405,10 @@ static int
> vbsf_lock_user_pages_failed_check_kernel(uintptr_t uPtrFrom, size_t c
> > -     /*
> > -      * Check that this is valid user memory that is actually in the
> kernel range.
> > -      */
> > --#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> > -+#if RTLNX_VER_MIN(5,10,0)
> > -+    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> > -+        && uPtrFrom >= TASK_SIZE_MAX)
> > -+#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> > -     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> > -         && uPtrFrom >= USER_DS.seg)
> > - #else
> > ---
> > -2.19.1
> > -
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.16.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.18.bb
> > similarity index 88%
> > rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.16.bb
> > rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.18.bb
> > index ff639c09f..ea6a082f6 100644
> > --- a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.16.bb
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.18.bb
> > @@ -13,12 +13,9 @@ VBOX_NAME = "VirtualBox-${PV}"
> >
> >  SRC_URI = "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
> >      file://Makefile.utils \
> > -    file://0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch \
> > -
> file://0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch \
> > -
> file://0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch \
> >  "
> > -SRC_URI[md5sum] = "a12a647f6c114f2cb1571089b36841fe"
> > -SRC_URI[sha256sum] =
> "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1"
> > +SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
> > +SRC_URI[sha256sum] =
> "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
> >
> >  S ?= "${WORKDIR}/vbox_module"
> >  S_task-patch = "${WORKDIR}/${VBOX_NAME}"
> > --
> > 2.25.1
> >
> >
> > 
> >
>

--00000000000038107b05b9701ac9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, I resubmitted with a little patch that fixes p=
art (but not all) the musl failures.</div><div><br></div><div>Just to be cl=
ear, this seems to be not a regression, the current master with 6.1.16 has =
the very same failures on i386.</div><div><br></div><div>The current propos=
ed patchset is not making the situation worse, and upstream is having a loo=
k at the issue.</div><div><br></div><div>Gianfranco<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio =
21 gen 2021 alle ore 09:26 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">fails on musl/x86<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/541637/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/541637/</a><br>
<br>
On Wed, Jan 20, 2021 at 5:01 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">c=
ostamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop kernel 5.10 build fixes patches, now part of upstream codebase<b=
r>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt=
;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-linux-drm-Adjustment-for-Linux-5.10.patch | 321 -----------=
-------<br>
&gt;=C2=A0 ...0drv-linux.c-Changes-to-support-the-.patch | 119 -------<br>
&gt;=C2=A0 ...justment-for-linux-5.10-TASK_SIZE_MA.patch |=C2=A0 46 ---<br=
>
&gt;=C2=A0 ...<a href=3D"http://s_6.1.16.bb" rel=3D"noreferrer" target=3D"=
_blank">s_6.1.16.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_6.1.18.b=
b" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.18.bb</a>} |=
=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 4 files changed, 2 insertions(+), 491 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vbo=
xguestdrivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vbo=
xguestdrivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.pat=
ch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vbo=
xguestdrivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.pat=
ch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"htt=
p://vboxguestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxgu=
estdrivers_6.1.16.bb</a> =3D&gt; <a href=3D"http://vboxguestdrivers_6.1.18.=
bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.1.18.bb</a>} (8=
8%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriver=
s/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch b/meta-oe/recipe=
s-support/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjust=
ment-for-Linux-5.10.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a444901f8..000000000<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-=
Additions-linux-drm-Adjustment-for-Linux-5.10.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,321 +0,0 @@<br>
&gt; -From b6c765d693a0833b94cb2e91b32842570c3458d2 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: vboxsync &lt;vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f&gt;=
<br>
&gt; -Date: Tue, 15 Dec 2020 22:29:56 +0000<br>
&gt; -Subject: [PATCH] Additions/linux/drm: Adjustment for Linux 5.10.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -git-svn-id: <a href=3D"http://www.virtualbox.org/svn/vbox@87092" rel=
=
=3D"noreferrer" target=3D"_blank">http://www.virtualbox.org/svn/vbox@87092=
</a> cfe28804-0f27-0410-a406-dd0f0b0b656f<br>
&gt; -<br>
&gt; -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/VBox/Additions/linux/drm/vbox_drv.h | 10 +-<br>
&gt; - src/VBox/Additions/linux/drm/vbox_fb.c=C2=A0 |=C2=A0 2 +-<br>
&gt; - .../src/VBox/Additions/linux/drm/vbox_mode.c=C2=A0 |=C2=A0 2 +-<br>
&gt; - src/VBox/Additions/linux/drm/vbox_ttm.c | 99 +++++++++++++++++--<br=
>
&gt; - 4 files changed, 99 insertions(+), 14 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h b/src/VBox/Addi=
tions/linux/drm/vbox_drv.h<br>
&gt; -index 8c85371749..7937f2f2d2 100644<br>
&gt; ---- a/src/VBox/Additions/linux/drm/vbox_drv.h<br>
&gt; -+++ b/src/VBox/Additions/linux/drm/vbox_drv.h<br>
&gt; -@@ -175,6 +175,9 @@<br>
&gt; - #include &lt;drm/ttm/ttm_placement.h&gt;<br>
&gt; - #include &lt;drm/ttm/ttm_memory.h&gt;<br>
&gt; - #include &lt;drm/ttm/ttm_module.h&gt;<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+# include &lt;drm/ttm/ttm_resource.h&gt;<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - #include &quot;vboxvideo_guest.h&quot;<br>
&gt; - #include &quot;vboxvideo_vbe.h&quot;<br>
&gt; -@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int =
size, int align,<br>
&gt; - int vbox_gem_create(struct drm_device *dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0u32 size, bool iskernel, struct drm_gem_object **obj);<br>
&gt; -<br>
&gt; --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);<br=
>
&gt; -+#define VBOX_MEM_TYPE_VRAM=C2=A0 =C2=A00x1<br>
&gt; -+#define VBOX_MEM_TYPE_SYSTEM 0x2<br>
&gt; -+<br>
&gt; -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);<b=
r>
&gt; - int vbox_bo_unpin(struct vbox_bo *bo);<br>
&gt; -<br>
&gt; - static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)=
<br>
&gt; -@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox=
_bo *bo)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_unreserve(&amp;bo-&gt;bo);<br>
&gt; - }<br>
&gt; -<br>
&gt; --void vbox_ttm_placement(struct vbox_bo *bo, int domain);<br>
&gt; -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);<br>
&gt; - int vbox_bo_push_sysram(struct vbox_bo *bo);<br>
&gt; - int vbox_mmap(struct file *filp, struct vm_area_struct *vma);<br>
&gt; -<br>
&gt; -diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Addit=
ions/linux/drm/vbox_fb.c<br>
&gt; -index adead98d3d..7182d9da1a 100644<br>
&gt; ---- a/src/VBox/Additions/linux/drm/vbox_fb.c<br>
&gt; -+++ b/src/VBox/Additions/linux/drm/vbox_fb.c<br>
&gt; -@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *h=
elper,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<b=
r>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL=
);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NU=
LL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unres=
erve(bo);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<b=
r>
&gt; -diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c b/src/VBox/Add=
itions/linux/drm/vbox_mode.c<br>
&gt; -index ce7d135cb6..5557db5ef8 100644<br>
&gt; ---- a/src/VBox/Additions/linux/drm/vbox_mode.c<br>
&gt; -+++ b/src/VBox/Additions/linux/drm/vbox_mode.c<br>
&gt; -@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *c=
rtc,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<b=
r>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &amp=
;gpu_addr);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &a=
mp;gpu_addr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unreserve(bo);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<b=
r>
&gt; -diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c b/src/VBox/Addi=
tions/linux/drm/vbox_ttm.c<br>
&gt; -index bf87aabc05..5eac926a42 100644<br>
&gt; ---- a/src/VBox/Additions/linux/drm/vbox_ttm.c<br>
&gt; -+++ b/src/VBox/Additions/linux/drm/vbox_ttm.c<br>
&gt; -@@ -41,6 +41,7 @@<br>
&gt; - #define PLACEMENT_FLAGS(placement) ((placement).flags)<br>
&gt; - #endif<br>
&gt; -<br>
&gt; -+<br>
&gt; - static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *=
bd)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(bd, struct vbox_priva=
te, ttm.bdev);<br>
&gt; -@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct ttm_bu=
ffer_object *bo)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; - }<br>
&gt; -<br>
&gt; -+#if RTLNX_VER_MAX(5,10,0)<br>
&gt; - static int<br>
&gt; - vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct ttm_mem_type_manager *man)<br>
&gt; -@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev=
, u32 type,<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; - }<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - static void<br>
&gt; - vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placem=
ent *pl)<br>
&gt; -@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo=
, struct ttm_placement *pl)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vbox_ttm_bo_is_vbox_bo(bo))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM)=
;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTE=
M);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*pl =3D vboxbo-&gt;placement;<br>
&gt; - }<br>
&gt; -<br>
&gt; -@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct ttm_bu=
ffer_object *bo,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; - }<br>
&gt; -<br>
&gt; -+#if RTLNX_VER_MAX(5,10,0)<br>
&gt; - static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_mem_reg *m=
em)<br>
&gt; - {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 struct ttm_mem_type_manager *man =3D &amp;bdev=
-&gt;man[mem-&gt;mem_type];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vbox_private *vbox =3D vbox_bdev(b=
dev);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 struct ttm_mem_type_manager *man =3D &amp;bdev=
-&gt;man[mem-&gt;mem_type];<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&gt;bus.addr =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&gt;bus.offset =3D 0;<br>
&gt; -@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct ttm_=
bo_device *bdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; - }<br>
&gt; -+#else<br>
&gt; -+static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_resource *m=
em)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 struct vbox_private *vbox =3D vbox_bdev(bdev);=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.addr =3D NULL;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.offset =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mem-&gt;size =3D mem-&gt;num_pages &lt;&lt; PA=
GE_SHIFT;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mem-&gt;start =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.is_iomem =3D false;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 switch (mem-&gt;mem_type) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 case TTM_PL_SYSTEM:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* system memory *=
/<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 case TTM_PL_VRAM:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.offset=
 =3D mem-&gt;start &lt;&lt; PAGE_SHIFT;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;start =3D =
pci_resource_start(vbox-&gt;dev-&gt;pdev, 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.is_iom=
em =3D true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; -+}<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; -+<br>
&gt; -+<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_resource *mem)<br>
&gt; -+{<br>
&gt; -+}<br>
&gt; -+#else<br>
&gt; - static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_mem_reg *mem)<br>
&gt; - {<br>
&gt; - }<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct =
ttm_tt *tt)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ttm_tt_fini(tt);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 kfree(tt);<br>
&gt; -+}<br>
&gt; -+#else<br>
&gt; - static void vbox_ttm_backend_destroy(struct ttm_tt *tt)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_tt_fini(tt);<br>
&gt; -@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_=
tt *tt)<br>
&gt; - static struct ttm_backend_func vbox_tt_backend_func =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy =3D &amp;vbox_ttm_backend_destro=
y,<br>
&gt; - };<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - #if RTLNX_VER_MAX(4,17,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,6) &a=
mp;&amp; !RTLNX_SUSE_MAJ_PREREQ(15,1) &amp;&amp; !RTLNX_SUSE_MAJ_PREREQ(12,=
5)<br>
&gt; - static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev=
,<br>
&gt; -@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct =
ttm_buffer_object *bo,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tt)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<=
br>
&gt; -<br>
&gt; -+#if RTLNX_VER_MAX(5,10,0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0tt-&gt;func =3D &amp;vbox_tt_backend_func=
;<br>
&gt; -+#endif<br>
&gt; - #if RTLNX_VER_MAX(4,17,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,6) &a=
mp;&amp; !RTLNX_SUSE_MAJ_PREREQ(15,1) &amp;&amp; !RTLNX_SUSE_MAJ_PREREQ(12,=
5)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttm_tt_init(tt, bdev, size, page_flag=
s, dummy_read_page)) {<br>
&gt; - #else<br>
&gt; -@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_=
tt *ttm)<br>
&gt; -<br>
&gt; - static struct ttm_bo_driver vbox_bo_driver =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_create =3D vbox_ttm_tt_create,<br=
>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 .ttm_tt_destroy =3D vbox_ttm_tt_destroy,<br>
&gt; -+#endif<br>
&gt; - #if RTLNX_VER_MAX(4,17,0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_populate =3D vbox_ttm_tt_populate=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_unpopulate =3D vbox_ttm_tt_unpopu=
late,<br>
&gt; - #endif<br>
&gt; -+#if RTLNX_VER_MAX(5,10,0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_mem_type =3D vbox_bo_init_mem_type,=
<br>
&gt; -+#endif<br>
&gt; - #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.eviction_valuable =3D ttm_bo_eviction_va=
luable,<br>
&gt; - #endif<br>
&gt; -@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D ttm_range_man_init(bdev, TTM_PL_VRAM, =
false,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbox-&gt;available_vram_size &gt;&gt; PAGE_=
SHIFT);<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_init_mm(bdev, TTM_PL_VRAM,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vbox-&gt;available_vram_size &gt;&gt; PAGE=
_SHIFT);<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&qu=
ot;Failed ttm VRAM init: %d\n&quot;, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_devi=
ce_release;<br>
&gt; -@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)<br>
&gt; - #endif<br>
&gt; - }<br>
&gt; -<br>
&gt; --void vbox_ttm_placement(struct vbox_bo *bo, int domain)<br>
&gt; -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 c =3D 0;<br>
&gt; - #if RTLNX_VER_MAX(3,18,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,2)<br=
>
&gt; -@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, in=
t domain)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.placement =3D bo-&gt;pla=
cements;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.busy_placement =3D bo-&g=
t;placements;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (domain &amp; TTM_PL_FLAG_VRAM)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (mem_type &amp; VBOX_MEM_TYPE_VRAM) {<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[=
c].mem_type =3D TTM_PL_VRAM;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_=
PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLA=
GS(bo-&gt;placements[c++]) =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (domain &amp; TTM_PL_FLAG_SYSTEM)<br>
&gt; -+#endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (mem_type &amp; VBOX_MEM_TYPE_SYSTEM) {<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[=
c].mem_type =3D TTM_PL_SYSTEM;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_=
PL_MASK_CACHING;<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLA=
GS(bo-&gt;placements[c++]) =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if (!c)<br>
&gt; -+#endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (!c) {<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[=
c].mem_type =3D TTM_PL_SYSTEM;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_=
PL_MASK_CACHING;<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLA=
GS(bo-&gt;placements[c++]) =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;<br>
&gt; -+#endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.num_placement =3D c;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.num_busy_placement =3D c=
;<br>
&gt; -@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int s=
ize, int align,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0vboxbo-&gt;bo.bdev-&gt;dev_mapping =3D de=
v-&gt;dev_mapping;<br>
&gt; - #endif<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | =
TTM_PL_FLAG_SYSTEM);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM =
| VBOX_MEM_TYPE_SYSTEM);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0acc_size =3D ttm_bo_dma_acc_size(&amp;vbo=
x-&gt;ttm.bdev, size,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(=
struct vbox_bo));<br>
&gt; -@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox=
_bo *bo)<br>
&gt; - #endif<br>
&gt; - }<br>
&gt; -<br>
&gt; --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)<br>
&gt; -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)<br=
>
&gt; - {<br>
&gt; - #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) || RTLNX_SU=
SE_MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx ctx =3D { false,=
 false };<br>
&gt; -@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag,=
 u64 *gpu_addr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, pl_flag);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, mem_type);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; bo-&gt;placement.num=
_placement; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLA=
GS(bo-&gt;placements[i]) |=3D TTM_PL_FLAG_NO_EVICT;<br>
&gt; -@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;kmap.virtual)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_kunmap=
(&amp;bo-&gt;kmap);<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; bo-&gt;placement.num=
_placement; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLA=
GS(bo-&gt;placements[i]) |=3D TTM_PL_FLAG_NO_EVICT;<br>
&gt; ---<br>
&gt; -2.19.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriver=
s/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch b/meta-oe=
/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0dr=
v-linux.c-Changes-to-support-the-.patch<br>
&gt; deleted file mode 100644<br>
&gt; index db27cb883..000000000<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-=
Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,119 +0,0 @@<br>
&gt; -From 2a6e3cf63f58e289802a11faad5fb495e2d04e97 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: vboxsync &lt;vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f&gt;=
<br>
&gt; -Date: Wed, 9 Dec 2020 18:59:04 +0000<br>
&gt; -Subject: [PATCH] Runtime/memobj-r0drv-linux.c: Changes to support th=
e upcoming<br>
&gt; - 5.10 kernel, bugref:9879<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -git-svn-id: <a href=3D"http://www.virtualbox.org/svn/vbox@87074" rel=
=
=3D"noreferrer" target=3D"_blank">http://www.virtualbox.org/svn/vbox@87074=
</a> cfe28804-0f27-0410-a406-dd0f0b0b656f<br>
&gt; -<br>
&gt; -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - .../Runtime/r0drv/linux/memobj-r0drv-linux.c=C2=A0 | 68 +++++++++++=
+++++++-<br>
&gt; - 1 file changed, 67 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; ---- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c<br>
&gt; -+++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c<br>
&gt; -@@ -56,9 +56,19 @@<br>
&gt; -=C2=A0 * Whether we use alloc_vm_area (3.2+) for executable memory.<=
br>
&gt; -=C2=A0 * This is a must for 5.8+, but we enable it all the way back =
to 3.2.x for<br>
&gt; -=C2=A0 * better W^R compliance (fExecutable flag). */<br>
&gt; --#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)<br>
&gt; -+#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)<br>
&gt; - # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC<br>
&gt; - #endif<br>
&gt; -+/** @def IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC<br>
&gt; -+ * alloc_vm_area was removed with 5.10 so we have to resort to a di=
fferent way<br>
&gt; -+ * to allocate executable memory.<br>
&gt; -+ * It would be possible to remove IPRT_USE_ALLOC_VM_AREA_FOR_EXEC a=
nd use<br>
&gt; -+ * this path execlusively for 3.2+ but no time to test it really wo=
rks on every<br>
&gt; -+ * supported kernel, so better play safe for now.<br>
&gt; -+ */<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)<br>
&gt; -+# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC<br>
&gt; -+#endif<br>
&gt; -<br>
&gt; - /*<br>
&gt; -=C2=A0 * 2.6.29+ kernels don&#39;t work with remap_pfn_range() anymo=
re because<br>
&gt; -@@ -502,6 +512,46 @@ static void rtR0MemObjLinuxFreePages(PRT<br>
&gt; - }<br>
&gt; -<br>
&gt; -<br>
&gt; -+#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC<br>
&gt; -+/**<br>
&gt; -+ * User data passed to the apply_to_page_range() callback.<br>
&gt; -+ */<br>
&gt; -+typedef struct LNXAPPLYPGRANGE<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 /** Pointer to the memory object. */<br>
&gt; -+=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx;<br>
&gt; -+=C2=A0 =C2=A0 /** The page protection flags to apply. */<br>
&gt; -+=C2=A0 =C2=A0 pgprot_t=C2=A0 =C2=A0 =C2=A0 =C2=A0fPg;<br>
&gt; -+} LNXAPPLYPGRANGE;<br>
&gt; -+/** Pointer to the user data. */<br>
&gt; -+typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;<br>
&gt; -+/** Pointer to the const user data. */<br>
&gt; -+typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;<br>
&gt; -+<br>
&gt; -+/**<br>
&gt; -+ * Callback called in apply_to_page_range().<br>
&gt; -+ *<br>
&gt; -+ * @returns Linux status code.<br>
&gt; -+ * @param=C2=A0 =C2=A0pPte=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Pointer to the page table entry for the given address.<br>
&gt; -+ * @param=C2=A0 =C2=A0uAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0The address to apply the new protection to.<br>
&gt; -+ * @param=C2=A0 =C2=A0pvUser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 The opaque user data.<br>
&gt; -+ */<br>
&gt; -+#ifdef __i386__<br>
&gt; -+static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long=
 uAddr, void *pvUser)<br>
&gt; -+#else<br>
&gt; -+static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte,=
 unsigned long uAddr, void *pvUser)<br>
&gt; -+#endif<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser=
;<br>
&gt; -+=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx =3D pArgs-&gt;pMemLnx;<br>
&gt; -+=C2=A0 =C2=A0 size_t idxPg =3D (uAddr - (unsigned long)pMemLnx-&gt;=
Core.pv) &gt;&gt; PAGE_SHIFT;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 set_pte(pPte, mk_pte(pMemLnx-&gt;apPages[idxPg], pArg=
s-&gt;fPg));<br>
&gt; -+=C2=A0 =C2=A0 return 0;<br>
&gt; -+}<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; -+<br>
&gt; - /**<br>
&gt; -=C2=A0 * Maps the allocation into ring-0.<br>
&gt; -=C2=A0 *<br>
&gt; -@@ -584,6 +634,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMO<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; - # endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -+#=C2=A0 if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fExecutable)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgprot_val(=
fPg) |=3D _PAGE_NX; /* Uses RTR0MemObjProtect to clear NX when memory ready=
, W^X fashion. */<br>
&gt; -+#=C2=A0 endif<br>
&gt; -+<br>
&gt; - # ifdef VM_MAP<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pMemLnx-&gt;Core.pv =
=
=3D vmap(&amp;pMemLnx-&gt;apPages[0], pMemLnx-&gt;cPages, VM_MAP, fPg);<br=
>
&gt; - # else<br>
&gt; -@@ -1851,6 +1906,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_enable();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return VINF_SUCCESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)<br>
&gt; -+=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx =3D (PRTR0MEMOBJLNX)pMem;<br>
&gt; -+=C2=A0 =C2=A0 if (=C2=A0 =C2=A0pMemLnx-&gt;fExecutable<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pMemLnx-&gt;fMappedToRing0)<=
br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 LNXAPPLYPGRANGE Args;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.pMemLnx =3D pMemLnx;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.fPg =3D rtR0MemObjLinuxConvertProt=
(fProt, true /*fKernel*/);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rcLnx =3D apply_to_page_range(curre=
nt-&gt;active_mm, (unsigned long)pMemLnx-&gt;Core.pv + offSub, cbSub,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
rtR0MemObjLinuxApplyPageRange, (void *)&amp;Args);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rcLnx)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return VERR_NOT_SUPPORTED=
;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VINF_SUCCESS;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; - # endif<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0NOREF(pMem);<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriver=
s/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch b/meta-oe=
/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjus=
tment-for-linux-5.10-TASK_SIZE_MA.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3cfe2e917..000000000<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-=
linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,46 +0,0 @@<br>
&gt; -From a276f8bc5e4515f7ea51e2c56e0e634a723ca104 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: vboxsync &lt;vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f&gt;=
<br>
&gt; -Date: Tue, 8 Dec 2020 13:52:53 +0000<br>
&gt; -Subject: [PATCH] linser/vboxsf: Adjustment for linux 5.10 - TASK_SIZ=
E_MAX<br>
&gt; - replaces USER_DS.seg. bugref:9879<br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; -<br>
&gt; -git-svn-id: <a href=3D"http://www.virtualbox.org/svn/vbox@87053" rel=
=
=3D"noreferrer" target=3D"_blank">http://www.virtualbox.org/svn/vbox@87053=
</a> cfe28804-0f27-0410-a406-dd0f0b0b656f<br>
&gt; -<br>
&gt; -Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@g=
mail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/VBox/Additions/linux/sharedfolders/regops.c | 9 ++++++++-<br>
&gt; - 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c b/src/V=
Box/Additions/linux/sharedfolders/regops.c<br>
&gt; -index e1fad3d820..401fd69930 100644<br>
&gt; ---- a/src/VBox/Additions/linux/sharedfolders/regops.c<br>
&gt; -+++ b/src/VBox/Additions/linux/sharedfolders/regops.c<br>
&gt; -@@ -147,7 +147,11 @@ static int vbsf_iov_iter_detect_type(struct iov=
ec const *paIov, size_t cSegs)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0while (cSegs-- &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (paIov-&gt;iov_len &gt; 0) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (access_ok(VERIFY=
_READ, paIov-&gt;iov_base, paIov-&gt;iov_len))<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (uin=
tptr_t)paIov-&gt;iov_base &gt;=3D TASK_SIZE_MAX ? ITER_KVEC : 0;<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 (uintptr_t)paIov-&gt;iov_base &gt;=3D USER_DS.seg ? ITER_KVEC : 0;<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AssertMsgFailed((&qu=
ot;%p LB %#zx\n&quot;, paIov-&gt;iov_base, paIov-&gt;iov_len));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -1401,7 +1405,10 @@ static int vbsf_lock_user_pages_failed_check_=
kernel(uintptr_t uPtrFrom, size_t c<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * Check that this is valid user memory that is =
actually in the kernel range.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; --#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)<br>
&gt; -+#if RTLNX_VER_MIN(5,10,0)<br>
&gt; -+=C2=A0 =C2=A0 if (=C2=A0 =C2=A0access_ok((void *)uPtrFrom, cPages &=
lt;&lt; PAGE_SHIFT)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; uPtrFrom &gt;=3D TASK_SIZE_M=
AX)<br>
&gt; -+#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (=C2=A0 =C2=A0access_ok((void *)uPtrFrom, cPa=
ges &lt;&lt; PAGE_SHIFT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; uPtrFrom &gt;=3D USER_D=
S.seg)<br>
&gt; - #else<br>
&gt; ---<br>
&gt; -2.19.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http=
://vboxguestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxgue=
stdrivers_6.1.16.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a href=
=3D"http://vboxguestdrivers_6.1.18.bb" rel=3D"noreferrer" target=3D"_blank=
">vboxguestdrivers_6.1.18.bb</a><br>
&gt; similarity index 88%<br>
&gt; rename from meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http:=
//vboxguestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxgues=
tdrivers_6.1.16.bb</a><br>
&gt; rename to meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://=
vboxguestdrivers_6.1.18.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestd=
rivers_6.1.18.bb</a><br>
&gt; index ff639c09f..ea6a082f6 100644<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbox=
guestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrive=
rs_6.1.16.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vbox=
guestdrivers_6.1.18.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrive=
rs_6.1.18.bb</a><br>
&gt; @@ -13,12 +13,9 @@ VBOX_NAME =3D &quot;VirtualBox-${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://download.virtualbox.org/vir=
tualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://Makefile.utils \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Additions-linux-drm-Adjustment-for-Linux-5=
.10.patch \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Runtime-memobj-r0drv-linux.c-Changes-to-su=
pport-the-.patch \<br>
&gt; -=C2=A0 =C2=A0 file://0001-linser-vboxsf-Adjustment-for-linux-5.10-TA=
SK_SIZE_MA.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;a12a647f6c114f2cb1571089b36841fe&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;49c1990da16d8a3d5bda8cdb961ec8195a901e6=
7e4c79aea44c1521a5fc2f9f1&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;c61001386eb3822ab8f06d688a82e84b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;108d42b9b391b7a332a33df1662cf7b0e9d9a80=
f3079d16288d8b9487f427d40&quot;<br>
&gt;<br>
&gt;=C2=A0 S ?=3D &quot;${WORKDIR}/vbox_module&quot;<br>
&gt;=C2=A0 S_task-patch =3D &quot;${WORKDIR}/${VBOX_NAME}&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--00000000000038107b05b9701ac9--
