Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.4302.1611217598151902761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 00:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vBq7KYWE;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id c7so926211qke.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 00:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zL16mgVKbcjDDwwP9rXmhiLe9owkr58tTD3VMJbXZkU=;
        b=vBq7KYWEGxfjL8BG/7ap0Rcn89gqLrMANWG+wqI3QfGP0KUubCKkMF6vSgemvvW3GX
         KzBbrEARMdU12/w6DWEzg/hbFoMPWd+q7b1/1woGfkwt3Nq0odFwUAZFA3G5PHylgybH
         AdGx0F9oujbDNeULn6rcye8DneiEb8/UVxzFw84PkDWjotxDNakt7UXPdLSFl05bVoFW
         TobEtvr9/rQmLSW9HlhPoRELM0jjOih8mNQvo+tSjwrBTJjahBhJ5pPny8EBKb6fPfQY
         I7jxcPw2/3cX/DW6fGfQiIHwBzq/StzlE38b+6LJnKNrAm/ZIk5/x/h8a+o+YzEdN2KC
         RkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zL16mgVKbcjDDwwP9rXmhiLe9owkr58tTD3VMJbXZkU=;
        b=esIojDy/9qZ2h+mrQIDpiW4AtE8L99M4q2gu5pZ/Suc2lITQ3sXsjHFW1rA0Gn0d6B
         XDrdQUYTe8GLMR9oEGswZKPRDWMhPaBeyr5HOp8x+WKg4cfX4aN9JooLXpwUzlaSGoLn
         Y0LGHUYIz3/AXGRfjI/2uZK/PjzNtF0bEke1QAKRJHT4mg8QLXSsDNiCCHea04d8eDzI
         Hq3JwHOdcz454Yi2diOpw8ZryOzrvBF7/KW/HX6tqLnLma4shqOpMjULqt5RRR7he188
         B3j6twcM20hY4QFw6ljOim/zM8okh+8nBEwYchhrAcv8OA2DfySagQoJxlRrW3FXDI4e
         px6w==
X-Gm-Message-State: AOAM530XkJsy9MnMJBECoHNQaXs2pGjWyYKxEnkKiUyx4qNpC5w9dvYD
	MyKRQPblwXKp1yjhYxZMYu7Ffff2xoXPhUdoqY0=
X-Google-Smtp-Source: ABdhPJxkBSovveaxrD3W1SJNpuqM3LwFm87EnQ2FZu5+oezcut/zH+WJXsHYKHFwrMdJ/MQOquCacEsesCE4BcNEKJM=
X-Received: by 2002:a37:88c2:: with SMTP id k185mr13315455qkd.474.1611217596915;
 Thu, 21 Jan 2021 00:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20210120130118.1410689-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20210120130118.1410689-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 21 Jan 2021 00:26:10 -0800
Message-ID: <CAMKF1sqEQCJPafJZ5-T64BhOaMzLEJSf44KCgWHiNi+m88or=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on musl/x86

https://errors.yoctoproject.org/Errors/Details/541637/

On Wed, Jan 20, 2021 at 5:01 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Drop kernel 5.10 build fixes patches, now part of upstream codebase
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  ...-linux-drm-Adjustment-for-Linux-5.10.patch | 321 ------------------
>  ...0drv-linux.c-Changes-to-support-the-.patch | 119 -------
>  ...justment-for-linux-5.10-TASK_SIZE_MA.patch |  46 ---
>  ...s_6.1.16.bb =3D> vboxguestdrivers_6.1.18.bb} |   7 +-
>  4 files changed, 2 insertions(+), 491 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdr=
ivers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
>  delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdr=
ivers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
>  delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdr=
ivers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.1=
6.bb =3D> vboxguestdrivers_6.1.18.bb} (88%)
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch b/meta-oe/recipes-s=
upport/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustmen=
t-for-Linux-5.10.patch
> deleted file mode 100644
> index a444901f8..000000000
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Add=
itions-linux-drm-Adjustment-for-Linux-5.10.patch
> +++ /dev/null
> @@ -1,321 +0,0 @@
> -From b6c765d693a0833b94cb2e91b32842570c3458d2 Mon Sep 17 00:00:00 2001
> -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> -Date: Tue, 15 Dec 2020 22:29:56 +0000
> -Subject: [PATCH] Additions/linux/drm: Adjustment for Linux 5.10.
> -
> -Upstream-Status: Backport
> -
> -git-svn-id: http://www.virtualbox.org/svn/vbox@87092 cfe28804-0f27-0410=
-a406-dd0f0b0b656f
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -
> ----
> - src/VBox/Additions/linux/drm/vbox_drv.h | 10 +-
> - src/VBox/Additions/linux/drm/vbox_fb.c  |  2 +-
> - .../src/VBox/Additions/linux/drm/vbox_mode.c  |  2 +-
> - src/VBox/Additions/linux/drm/vbox_ttm.c | 99 +++++++++++++++++--
> - 4 files changed, 99 insertions(+), 14 deletions(-)
> -
> -diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h b/src/VBox/Additio=
ns/linux/drm/vbox_drv.h
> -index 8c85371749..7937f2f2d2 100644
> ---- a/src/VBox/Additions/linux/drm/vbox_drv.h
> -+++ b/src/VBox/Additions/linux/drm/vbox_drv.h
> -@@ -175,6 +175,9 @@
> - #include <drm/ttm/ttm_placement.h>
> - #include <drm/ttm/ttm_memory.h>
> - #include <drm/ttm/ttm_module.h>
> -+#if RTLNX_VER_MIN(5,10,0)
> -+# include <drm/ttm/ttm_resource.h>
> -+#endif
> -
> - #include "vboxvideo_guest.h"
> - #include "vboxvideo_vbe.h"
> -@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int siz=
e, int align,
> - int vbox_gem_create(struct drm_device *dev,
> -                   u32 size, bool iskernel, struct drm_gem_object **obj=
);
> -
> --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);
> -+#define VBOX_MEM_TYPE_VRAM   0x1
> -+#define VBOX_MEM_TYPE_SYSTEM 0x2
> -+
> -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);
> - int vbox_bo_unpin(struct vbox_bo *bo);
> -
> - static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
> -@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo=
 *bo)
> -       ttm_bo_unreserve(&bo->bo);
> - }
> -
> --void vbox_ttm_placement(struct vbox_bo *bo, int domain);
> -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
> - int vbox_bo_push_sysram(struct vbox_bo *bo);
> - int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
> -
> -diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Addition=
s/linux/drm/vbox_fb.c
> -index adead98d3d..7182d9da1a 100644
> ---- a/src/VBox/Additions/linux/drm/vbox_fb.c
> -+++ b/src/VBox/Additions/linux/drm/vbox_fb.c
> -@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *help=
er,
> -       if (ret)
> -               return ret;
> -
> --      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
> -+      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
> -       if (ret) {
> -               vbox_bo_unreserve(bo);
> -               return ret;
> -diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c b/src/VBox/Additi=
ons/linux/drm/vbox_mode.c
> -index ce7d135cb6..5557db5ef8 100644
> ---- a/src/VBox/Additions/linux/drm/vbox_mode.c
> -+++ b/src/VBox/Additions/linux/drm/vbox_mode.c
> -@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc=
,
> -       if (ret)
> -               return ret;
> -
> --      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
> -+      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr);
> -       vbox_bo_unreserve(bo);
> -       if (ret)
> -               return ret;
> -diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c b/src/VBox/Additio=
ns/linux/drm/vbox_ttm.c
> -index bf87aabc05..5eac926a42 100644
> ---- a/src/VBox/Additions/linux/drm/vbox_ttm.c
> -+++ b/src/VBox/Additions/linux/drm/vbox_ttm.c
> -@@ -41,6 +41,7 @@
> - #define PLACEMENT_FLAGS(placement) ((placement).flags)
> - #endif
> -
> -+
> - static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
> - {
> -       return container_of(bd, struct vbox_private, ttm.bdev);
> -@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct ttm_buffe=
r_object *bo)
> -       return false;
> - }
> -
> -+#if RTLNX_VER_MAX(5,10,0)
> - static int
> - vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
> -                     struct ttm_mem_type_manager *man)
> -@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u=
32 type,
> -
> -       return 0;
> - }
> -+#endif
> -
> - static void
> - vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement=
 *pl)
> -@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo, s=
truct ttm_placement *pl)
> -       if (!vbox_ttm_bo_is_vbox_bo(bo))
> -               return;
> -
> --      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
> -+      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
> -       *pl =3D vboxbo->placement;
> - }
> -
> -@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct ttm_buffe=
r_object *bo,
> -       return 0;
> - }
> -
> -+#if RTLNX_VER_MAX(5,10,0)
> - static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> -                                  struct ttm_mem_reg *mem)
> - {
> --      struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -       struct vbox_private *vbox =3D vbox_bdev(bdev);
> -+      struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -
> -       mem->bus.addr =3D NULL;
> -       mem->bus.offset =3D 0;
> -@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct ttm_bo_=
device *bdev,
> -       }
> -       return 0;
> - }
> -+#else
> -+static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> -+                                 struct ttm_resource *mem)
> -+{
> -+      struct vbox_private *vbox =3D vbox_bdev(bdev);
> -+      mem->bus.addr =3D NULL;
> -+      mem->bus.offset =3D 0;
> -+      mem->size =3D mem->num_pages << PAGE_SHIFT;
> -+      mem->start =3D 0;
> -+      mem->bus.is_iomem =3D false;
> -+      switch (mem->mem_type) {
> -+      case TTM_PL_SYSTEM:
> -+              /* system memory */
> -+              return 0;
> -+      case TTM_PL_VRAM:
> -+              mem->bus.offset =3D mem->start << PAGE_SHIFT;
> -+              mem->start =3D pci_resource_start(vbox->dev->pdev, 0);
> -+              mem->bus.is_iomem =3D true;
> -+              break;
> -+      default:
> -+              return -EINVAL;
> -+      }
> -+      return 0;
> -+}
> -+#endif
> -
> -+
> -+
> -+#if RTLNX_VER_MIN(5,10,0)
> -+static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> -+                               struct ttm_resource *mem)
> -+{
> -+}
> -+#else
> - static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> -                                struct ttm_mem_reg *mem)
> - {
> - }
> -+#endif
> -
> -+#if RTLNX_VER_MIN(5,10,0)
> -+static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm=
_tt *tt)
> -+{
> -+      ttm_tt_fini(tt);
> -+      kfree(tt);
> -+}
> -+#else
> - static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
> - {
> -       ttm_tt_fini(tt);
> -@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt =
*tt)
> - static struct ttm_backend_func vbox_tt_backend_func =3D {
> -       .destroy =3D &vbox_ttm_backend_destroy,
> - };
> -+#endif
> -
> - #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUS=
E_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> - static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,
> -@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct ttm=
_buffer_object *bo,
> -       if (!tt)
> -               return NULL;
> -
> -+#if RTLNX_VER_MAX(5,10,0)
> -       tt->func =3D &vbox_tt_backend_func;
> -+#endif
> - #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUS=
E_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> -       if (ttm_tt_init(tt, bdev, size, page_flags, dummy_read_page)) {
> - #else
> -@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt =
*ttm)
> -
> - static struct ttm_bo_driver vbox_bo_driver =3D {
> -       .ttm_tt_create =3D vbox_ttm_tt_create,
> -+#if RTLNX_VER_MIN(5,10,0)
> -+      .ttm_tt_destroy =3D vbox_ttm_tt_destroy,
> -+#endif
> - #if RTLNX_VER_MAX(4,17,0)
> -       .ttm_tt_populate =3D vbox_ttm_tt_populate,
> -       .ttm_tt_unpopulate =3D vbox_ttm_tt_unpopulate,
> - #endif
> -+#if RTLNX_VER_MAX(5,10,0)
> -       .init_mem_type =3D vbox_bo_init_mem_type,
> -+#endif
> - #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)
> -       .eviction_valuable =3D ttm_bo_eviction_valuable,
> - #endif
> -@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)
> - #endif
> -       }
> -
> -+#if RTLNX_VER_MIN(5,10,0)
> -+      ret =3D ttm_range_man_init(bdev, TTM_PL_VRAM, false,
> -+                           vbox->available_vram_size >> PAGE_SHIFT);
> -+#else
> -       ret =3D ttm_bo_init_mm(bdev, TTM_PL_VRAM,
> -                            vbox->available_vram_size >> PAGE_SHIFT);
> -+#endif
> -       if (ret) {
> -               DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
> -               goto err_device_release;
> -@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)
> - #endif
> - }
> -
> --void vbox_ttm_placement(struct vbox_bo *bo, int domain)
> -+void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)
> - {
> -       u32 c =3D 0;
> - #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
> -@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int d=
omain)
> -       bo->placement.placement =3D bo->placements;
> -       bo->placement.busy_placement =3D bo->placements;
> -
> --      if (domain & TTM_PL_FLAG_VRAM)
> -+      if (mem_type & VBOX_MEM_TYPE_VRAM) {
> -+#if RTLNX_VER_MIN(5,10,0)
> -+              bo->placements[c].mem_type =3D TTM_PL_VRAM;
> -+              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -+                  TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;
> -+#else
> -               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -                   TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_=
VRAM;
> --      if (domain & TTM_PL_FLAG_SYSTEM)
> -+#endif
> -+      }
> -+      if (mem_type & VBOX_MEM_TYPE_SYSTEM) {
> -+#if RTLNX_VER_MIN(5,10,0)
> -+              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> -+              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -+                  TTM_PL_MASK_CACHING;
> -+#else
> -               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> --      if (!c)
> -+#endif
> -+      }
> -+      if (!c) {
> -+#if RTLNX_VER_MIN(5,10,0)
> -+              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> -+              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -+                  TTM_PL_MASK_CACHING;
> -+#else
> -               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> -                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> -+#endif
> -+      }
> -
> -       bo->placement.num_placement =3D c;
> -       bo->placement.num_busy_placement =3D c;
> -@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int size=
, int align,
> -       vboxbo->bo.bdev->dev_mapping =3D dev->dev_mapping;
> - #endif
> -
> --      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM=
);
> -+      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBOX_MEM_TYPE_SY=
STEM);
> -
> -       acc_size =3D ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
> -                                      sizeof(struct vbox_bo));
> -@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo=
 *bo)
> - #endif
> - }
> -
> --int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
> -+int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)
> - {
> - #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) || RTLNX_SUSE_=
MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
> -       struct ttm_operation_ctx ctx =3D { false, false };
> -@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u6=
4 *gpu_addr)
> -               return 0;
> -       }
> -
> --      vbox_ttm_placement(bo, pl_flag);
> -+      vbox_ttm_placement(bo, mem_type);
> -
> -       for (i =3D 0; i < bo->placement.num_placement; i++)
> -               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_E=
VICT;
> -@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)
> -       if (bo->kmap.virtual)
> -               ttm_bo_kunmap(&bo->kmap);
> -
> --      vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
> -+      vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
> -
> -       for (i =3D 0; i < bo->placement.num_placement; i++)
> -               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_E=
VICT;
> ---
> -2.19.1
> -
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch b/meta-oe/re=
cipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-l=
inux.c-Changes-to-support-the-.patch
> deleted file mode 100644
> index db27cb883..000000000
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Run=
time-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -From 2a6e3cf63f58e289802a11faad5fb495e2d04e97 Mon Sep 17 00:00:00 2001
> -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> -Date: Wed, 9 Dec 2020 18:59:04 +0000
> -Subject: [PATCH] Runtime/memobj-r0drv-linux.c: Changes to support the u=
pcoming
> - 5.10 kernel, bugref:9879
> -
> -Upstream-Status: Backport
> -
> -git-svn-id: http://www.virtualbox.org/svn/vbox@87074 cfe28804-0f27-0410=
-a406-dd0f0b0b656f
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 68 ++++++++++++++++++-
> - 1 file changed, 67 insertions(+), 1 deletion(-)
> -
> ---- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> -+++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> -@@ -56,9 +56,19 @@
> -  * Whether we use alloc_vm_area (3.2+) for executable memory.
> -  * This is a must for 5.8+, but we enable it all the way back to 3.2.x=
 for
> -  * better W^R compliance (fExecutable flag). */
> --#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
> -+#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)
> - # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
> - #endif
> -+/** @def IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> -+ * alloc_vm_area was removed with 5.10 so we have to resort to a diffe=
rent way
> -+ * to allocate executable memory.
> -+ * It would be possible to remove IPRT_USE_ALLOC_VM_AREA_FOR_EXEC and =
use
> -+ * this path execlusively for 3.2+ but no time to test it really works=
 on every
> -+ * supported kernel, so better play safe for now.
> -+ */
> -+#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
> -+# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> -+#endif
> -
> - /*
> -  * 2.6.29+ kernels don't work with remap_pfn_range() anymore because
> -@@ -502,6 +512,46 @@ static void rtR0MemObjLinuxFreePages(PRT
> - }
> -
> -
> -+#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> -+/**
> -+ * User data passed to the apply_to_page_range() callback.
> -+ */
> -+typedef struct LNXAPPLYPGRANGE
> -+{
> -+    /** Pointer to the memory object. */
> -+    PRTR0MEMOBJLNX pMemLnx;
> -+    /** The page protection flags to apply. */
> -+    pgprot_t       fPg;
> -+} LNXAPPLYPGRANGE;
> -+/** Pointer to the user data. */
> -+typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;
> -+/** Pointer to the const user data. */
> -+typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
> -+
> -+/**
> -+ * Callback called in apply_to_page_range().
> -+ *
> -+ * @returns Linux status code.
> -+ * @param   pPte                Pointer to the page table entry for th=
e given address.
> -+ * @param   uAddr               The address to apply the new protectio=
n to.
> -+ * @param   pvUser              The opaque user data.
> -+ */
> -+#ifdef __i386__
> -+static int rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsigned long uA=
ddr, void *pvUser)
> -+#else
> -+static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, un=
signed long uAddr, void *pvUser)
> -+#endif
> -+{
> -+    PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser;
> -+    PRTR0MEMOBJLNX pMemLnx =3D pArgs->pMemLnx;
> -+    size_t idxPg =3D (uAddr - (unsigned long)pMemLnx->Core.pv) >> PAGE=
_SHIFT;
> -+
> -+    set_pte(pPte, mk_pte(pMemLnx->apPages[idxPg], pArgs->fPg));
> -+    return 0;
> -+}
> -+#endif
> -+
> -+
> - /**
> -  * Maps the allocation into ring-0.
> -  *
> -@@ -584,6 +634,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMO
> -         else
> - # endif
> -         {
> -+#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> -+            if (fExecutable)
> -+                pgprot_val(fPg) |=3D _PAGE_NX; /* Uses RTR0MemObjProte=
ct to clear NX when memory ready, W^X fashion. */
> -+#  endif
> -+
> - # ifdef VM_MAP
> -             pMemLnx->Core.pv =3D vmap(&pMemLnx->apPages[0], pMemLnx->c=
Pages, VM_MAP, fPg);
> - # else
> -@@ -1851,6 +1906,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(
> -         preempt_enable();
> -         return VINF_SUCCESS;
> -     }
> -+# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> -+    PRTR0MEMOBJLNX pMemLnx =3D (PRTR0MEMOBJLNX)pMem;
> -+    if (   pMemLnx->fExecutable
> -+        && pMemLnx->fMappedToRing0)
> -+    {
> -+        LNXAPPLYPGRANGE Args;
> -+        Args.pMemLnx =3D pMemLnx;
> -+        Args.fPg =3D rtR0MemObjLinuxConvertProt(fProt, true /*fKernel*=
/);
> -+        int rcLnx =3D apply_to_page_range(current->active_mm, (unsigne=
d long)pMemLnx->Core.pv + offSub, cbSub,
> -+                                        rtR0MemObjLinuxApplyPageRange,=
 (void *)&Args);
> -+        if (rcLnx)
> -+            return VERR_NOT_SUPPORTED;
> -+
> -+        return VINF_SUCCESS;
> -+    }
> - # endif
> -
> -     NOREF(pMem);
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch b/meta-oe/re=
cipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustme=
nt-for-linux-5.10-TASK_SIZE_MA.patch
> deleted file mode 100644
> index 3cfe2e917..000000000
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-lin=
ser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From a276f8bc5e4515f7ea51e2c56e0e634a723ca104 Mon Sep 17 00:00:00 2001
> -From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> -Date: Tue, 8 Dec 2020 13:52:53 +0000
> -Subject: [PATCH] linser/vboxsf: Adjustment for linux 5.10 - TASK_SIZE_M=
AX
> - replaces USER_DS.seg. bugref:9879
> -
> -Upstream-Status: Backport
> -
> -git-svn-id: http://www.virtualbox.org/svn/vbox@87053 cfe28804-0f27-0410=
-a406-dd0f0b0b656f
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ----
> - src/VBox/Additions/linux/sharedfolders/regops.c | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c b/src/VBox=
/Additions/linux/sharedfolders/regops.c
> -index e1fad3d820..401fd69930 100644
> ---- a/src/VBox/Additions/linux/sharedfolders/regops.c
> -+++ b/src/VBox/Additions/linux/sharedfolders/regops.c
> -@@ -147,7 +147,11 @@ static int vbsf_iov_iter_detect_type(struct iovec =
const *paIov, size_t cSegs)
> -     while (cSegs-- > 0) {
> -         if (paIov->iov_len > 0) {
> -             if (access_ok(VERIFY_READ, paIov->iov_base, paIov->iov_len=
))
> -+#if RTLNX_VER_MIN(5,10,0)
> -+                return (uintptr_t)paIov->iov_base >=3D TASK_SIZE_MAX ?=
 ITER_KVEC : 0;
> -+#else
> -                 return (uintptr_t)paIov->iov_base >=3D USER_DS.seg ? I=
TER_KVEC : 0;
> -+#endif
> -             AssertMsgFailed(("%p LB %#zx\n", paIov->iov_base, paIov->i=
ov_len));
> -             break;
> -         }
> -@@ -1401,7 +1405,10 @@ static int vbsf_lock_user_pages_failed_check_ker=
nel(uintptr_t uPtrFrom, size_t c
> -     /*
> -      * Check that this is valid user memory that is actually in the ke=
rnel range.
> -      */
> --#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> -+#if RTLNX_VER_MIN(5,10,0)
> -+    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> -+        && uPtrFrom >=3D TASK_SIZE_MAX)
> -+#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> -     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> -         && uPtrFrom >=3D USER_DS.seg)
> - #else
> ---
> -2.19.1
> -
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6=
.1.16.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18=
.bb
> similarity index 88%
> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.=
1.16.bb
> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.=
18.bb
> index ff639c09f..ea6a082f6 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.b=
b
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.b=
b
> @@ -13,12 +13,9 @@ VBOX_NAME =3D "VirtualBox-${PV}"
>
>  SRC_URI =3D "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAM=
E}.tar.bz2 \
>      file://Makefile.utils \
> -    file://0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch \
> -    file://0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.pa=
tch \
> -    file://0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.pa=
tch \
>  "
> -SRC_URI[md5sum] =3D "a12a647f6c114f2cb1571089b36841fe"
> -SRC_URI[sha256sum] =3D "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79ae=
a44c1521a5fc2f9f1"
> +SRC_URI[md5sum] =3D "c61001386eb3822ab8f06d688a82e84b"
> +SRC_URI[sha256sum] =3D "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16=
288d8b9487f427d40"
>
>  S ?=3D "${WORKDIR}/vbox_module"
>  S_task-patch =3D "${WORKDIR}/${VBOX_NAME}"
> --
> 2.25.1
>
>
>=20
>
