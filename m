Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.2415.1609899578660149838
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 18:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ah9hg5oT;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id z11so1372674qkj.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Jan 2021 18:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ygpLfU09vIan6WbhkgSif5PdTTTxA3RoyHhPSjQ7RlI=;
        b=ah9hg5oT5Dnj1Vdo6Q/wNDhlaH998PzCtSUNoD3i2POGLhMsrui0zIHatZdEXwgBXI
         drvT9vNOmX00nCUW61du63cyf/XJT2yfVoX7TC7tA52JtX7Nl5imtEQ7rZxdl/0vymig
         I49VZpySX7M2ruKcJs99Lz490ltjVZS+++pDkKe+qA2fWTVAvnHcWKSD0KxV8G9LGxDy
         3f8ZsQQXc58nfyrV03zmQKBPwRGUyinUrOtpQataqw13bTywpLxyiEg+7HT7PvNd6y9e
         lhkMRzhEpdm7Sr/Hmk0FCLxxr2Sne5ATBMTZZdjueFf4qnUGbkyRpB4PHVEGf5eQsrqZ
         OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ygpLfU09vIan6WbhkgSif5PdTTTxA3RoyHhPSjQ7RlI=;
        b=Odana27V6Rf4nFc8y0w1IXfFcm6kyDDFlquV6ebeBB43dRXcJywJRN750ZZ8CpYTu6
         FtmmFoOfY5z3+umty/1gFLhk6mx8S2O6XDLMDFk8wJth2H5s/hBywMv54usZwlJ4YkXP
         xDX0dCs7aQdNJ3T7tqu8yei5TASOCfBMZcyHz5lSQIAeYbeoP2uoxJMmNad0UDCQF1zL
         j5wL9pphJ7CsPntl7QQ9XOco/NXehvh1wOM5K5CIplWDDiO30TCw5VMl0CxRFLW+llHf
         5xgVYt9E6WgtqohoGUvM91JZae89wZWo36bXlAqJPfcConIpxWAJ0kI1XArTvP/71rA/
         PAcQ==
X-Gm-Message-State: AOAM5322QDtr3hD7u6tDATAFUwiqrt16BiJj0rsZcpxtFLWpYJgN4F2s
	mNmSB7bCFTbX759ro8VLt7stvkMb9C4j2NxhPLA=
X-Google-Smtp-Source: ABdhPJzOAivbIn7oqqLF8Vu1l7s3nLBcM9maenSly6gJG4G2AYg68i5dS6FiX/E0fbpAI71HnOWgC9N6AXNsktWxdW8=
X-Received: by 2002:a05:620a:1139:: with SMTP id p25mr2467976qkk.9.1609899577482;
 Tue, 05 Jan 2021 18:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20210105152149.10920-1-bruce.ashfield@gmail.com>
In-Reply-To: <20210105152149.10920-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 5 Jan 2021 18:19:11 -0800
Message-ID: <CAMKF1srTW4H6kO2-A3F5KrwJ67xyYQ0AR79KNfwtPVYT9maMDw@mail.gmail.com>
Subject: Re: [PATCH] vboxguestdrivers: fix build against kernel v5.10+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it works on x86_64 but fails on x86 see

https://errors.yoctoproject.org/Errors/Details/540534/

I wonder if we should just blacklist it on 32bit x86

On Tue, Jan 5, 2021 at 7:21 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> We need to adjust the vboxguest drivers to build against kernels
> 5.10+.
>
> These are backports from the virtual box SVN repository and can be
> dropped in future uprevs.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...-linux-drm-Adjustment-for-Linux-5.10.patch | 321 ++++++++++++++++++
>  ...0drv-linux.c-Changes-to-support-the-.patch | 120 +++++++
>  ...justment-for-linux-5.10-TASK_SIZE_MA.patch |  46 +++
>  .../vboxguestdrivers_6.1.16.bb                |   3 +
>  4 files changed, 490 insertions(+)
>  create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdri=
vers/0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch
>  create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdri=
vers/0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
>  create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdri=
vers/0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
>
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/00=
01-Additions-linux-drm-Adjustment-for-Linux-5.10.patch b/meta-oe/recipes-su=
pport/vboxguestdrivers/vboxguestdrivers/0001-Additions-linux-drm-Adjustment=
-for-Linux-5.10.patch
> new file mode 100644
> index 000000000..a444901f8
> --- /dev/null
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Addi=
tions-linux-drm-Adjustment-for-Linux-5.10.patch
> @@ -0,0 +1,321 @@
> +From b6c765d693a0833b94cb2e91b32842570c3458d2 Mon Sep 17 00:00:00 2001
> +From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> +Date: Tue, 15 Dec 2020 22:29:56 +0000
> +Subject: [PATCH] Additions/linux/drm: Adjustment for Linux 5.10.
> +
> +Upstream-Status: Backport
> +
> +git-svn-id: http://www.virtualbox.org/svn/vbox@87092 cfe28804-0f27-0410-=
a406-dd0f0b0b656f
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
> +---
> + src/VBox/Additions/linux/drm/vbox_drv.h | 10 +-
> + src/VBox/Additions/linux/drm/vbox_fb.c  |  2 +-
> + .../src/VBox/Additions/linux/drm/vbox_mode.c  |  2 +-
> + src/VBox/Additions/linux/drm/vbox_ttm.c | 99 +++++++++++++++++--
> + 4 files changed, 99 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h b/src/VBox/Addition=
s/linux/drm/vbox_drv.h
> +index 8c85371749..7937f2f2d2 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_drv.h
> ++++ b/src/VBox/Additions/linux/drm/vbox_drv.h
> +@@ -175,6 +175,9 @@
> + #include <drm/ttm/ttm_placement.h>
> + #include <drm/ttm/ttm_memory.h>
> + #include <drm/ttm/ttm_module.h>
> ++#if RTLNX_VER_MIN(5,10,0)
> ++# include <drm/ttm/ttm_resource.h>
> ++#endif
> +
> + #include "vboxvideo_guest.h"
> + #include "vboxvideo_vbe.h"
> +@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int size=
, int align,
> + int vbox_gem_create(struct drm_device *dev,
> +                   u32 size, bool iskernel, struct drm_gem_object **obj)=
;
> +
> +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);
> ++#define VBOX_MEM_TYPE_VRAM   0x1
> ++#define VBOX_MEM_TYPE_SYSTEM 0x2
> ++
> ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);
> + int vbox_bo_unpin(struct vbox_bo *bo);
> +
> + static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
> +@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo =
*bo)
> +       ttm_bo_unreserve(&bo->bo);
> + }
> +
> +-void vbox_ttm_placement(struct vbox_bo *bo, int domain);
> ++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
> + int vbox_bo_push_sysram(struct vbox_bo *bo);
> + int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
> +
> +diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Additions=
/linux/drm/vbox_fb.c
> +index adead98d3d..7182d9da1a 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_fb.c
> ++++ b/src/VBox/Additions/linux/drm/vbox_fb.c
> +@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *helpe=
r,
> +       if (ret)
> +               return ret;
> +
> +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
> ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
> +       if (ret) {
> +               vbox_bo_unreserve(bo);
> +               return ret;
> +diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c b/src/VBox/Additio=
ns/linux/drm/vbox_mode.c
> +index ce7d135cb6..5557db5ef8 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_mode.c
> ++++ b/src/VBox/Additions/linux/drm/vbox_mode.c
> +@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc,
> +       if (ret)
> +               return ret;
> +
> +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
> ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr);
> +       vbox_bo_unreserve(bo);
> +       if (ret)
> +               return ret;
> +diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c b/src/VBox/Addition=
s/linux/drm/vbox_ttm.c
> +index bf87aabc05..5eac926a42 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_ttm.c
> ++++ b/src/VBox/Additions/linux/drm/vbox_ttm.c
> +@@ -41,6 +41,7 @@
> + #define PLACEMENT_FLAGS(placement) ((placement).flags)
> + #endif
> +
> ++
> + static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)
> + {
> +       return container_of(bd, struct vbox_private, ttm.bdev);
> +@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct ttm_buffer=
_object *bo)
> +       return false;
> + }
> +
> ++#if RTLNX_VER_MAX(5,10,0)
> + static int
> + vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
> +                     struct ttm_mem_type_manager *man)
> +@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u3=
2 type,
> +
> +       return 0;
> + }
> ++#endif
> +
> + static void
> + vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement =
*pl)
> +@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo, st=
ruct ttm_placement *pl)
> +       if (!vbox_ttm_bo_is_vbox_bo(bo))
> +               return;
> +
> +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
> ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
> +       *pl =3D vboxbo->placement;
> + }
> +
> +@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct ttm_buffer=
_object *bo,
> +       return 0;
> + }
> +
> ++#if RTLNX_VER_MAX(5,10,0)
> + static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> +                                  struct ttm_mem_reg *mem)
> + {
> +-      struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> +       struct vbox_private *vbox =3D vbox_bdev(bdev);
> ++      struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> +
> +       mem->bus.addr =3D NULL;
> +       mem->bus.offset =3D 0;
> +@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct ttm_bo_d=
evice *bdev,
> +       }
> +       return 0;
> + }
> ++#else
> ++static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> ++                                 struct ttm_resource *mem)
> ++{
> ++      struct vbox_private *vbox =3D vbox_bdev(bdev);
> ++      mem->bus.addr =3D NULL;
> ++      mem->bus.offset =3D 0;
> ++      mem->size =3D mem->num_pages << PAGE_SHIFT;
> ++      mem->start =3D 0;
> ++      mem->bus.is_iomem =3D false;
> ++      switch (mem->mem_type) {
> ++      case TTM_PL_SYSTEM:
> ++              /* system memory */
> ++              return 0;
> ++      case TTM_PL_VRAM:
> ++              mem->bus.offset =3D mem->start << PAGE_SHIFT;
> ++              mem->start =3D pci_resource_start(vbox->dev->pdev, 0);
> ++              mem->bus.is_iomem =3D true;
> ++              break;
> ++      default:
> ++              return -EINVAL;
> ++      }
> ++      return 0;
> ++}
> ++#endif
> +
> ++
> ++
> ++#if RTLNX_VER_MIN(5,10,0)
> ++static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> ++                               struct ttm_resource *mem)
> ++{
> ++}
> ++#else
> + static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,
> +                                struct ttm_mem_reg *mem)
> + {
> + }
> ++#endif
> +
> ++#if RTLNX_VER_MIN(5,10,0)
> ++static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_=
tt *tt)
> ++{
> ++      ttm_tt_fini(tt);
> ++      kfree(tt);
> ++}
> ++#else
> + static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
> + {
> +       ttm_tt_fini(tt);
> +@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt *=
tt)
> + static struct ttm_backend_func vbox_tt_backend_func =3D {
> +       .destroy =3D &vbox_ttm_backend_destroy,
> + };
> ++#endif
> +
> + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE=
_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> + static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,
> +@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct ttm_=
buffer_object *bo,
> +       if (!tt)
> +               return NULL;
> +
> ++#if RTLNX_VER_MAX(5,10,0)
> +       tt->func =3D &vbox_tt_backend_func;
> ++#endif
> + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) && !RTLNX_SUSE=
_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> +       if (ttm_tt_init(tt, bdev, size, page_flags, dummy_read_page)) {
> + #else
> +@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt *=
ttm)
> +
> + static struct ttm_bo_driver vbox_bo_driver =3D {
> +       .ttm_tt_create =3D vbox_ttm_tt_create,
> ++#if RTLNX_VER_MIN(5,10,0)
> ++      .ttm_tt_destroy =3D vbox_ttm_tt_destroy,
> ++#endif
> + #if RTLNX_VER_MAX(4,17,0)
> +       .ttm_tt_populate =3D vbox_ttm_tt_populate,
> +       .ttm_tt_unpopulate =3D vbox_ttm_tt_unpopulate,
> + #endif
> ++#if RTLNX_VER_MAX(5,10,0)
> +       .init_mem_type =3D vbox_bo_init_mem_type,
> ++#endif
> + #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)
> +       .eviction_valuable =3D ttm_bo_eviction_valuable,
> + #endif
> +@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)
> + #endif
> +       }
> +
> ++#if RTLNX_VER_MIN(5,10,0)
> ++      ret =3D ttm_range_man_init(bdev, TTM_PL_VRAM, false,
> ++                           vbox->available_vram_size >> PAGE_SHIFT);
> ++#else
> +       ret =3D ttm_bo_init_mm(bdev, TTM_PL_VRAM,
> +                            vbox->available_vram_size >> PAGE_SHIFT);
> ++#endif
> +       if (ret) {
> +               DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
> +               goto err_device_release;
> +@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)
> + #endif
> + }
> +
> +-void vbox_ttm_placement(struct vbox_bo *bo, int domain)
> ++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)
> + {
> +       u32 c =3D 0;
> + #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
> +@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int do=
main)
> +       bo->placement.placement =3D bo->placements;
> +       bo->placement.busy_placement =3D bo->placements;
> +
> +-      if (domain & TTM_PL_FLAG_VRAM)
> ++      if (mem_type & VBOX_MEM_TYPE_VRAM) {
> ++#if RTLNX_VER_MIN(5,10,0)
> ++              bo->placements[c].mem_type =3D TTM_PL_VRAM;
> ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> ++                  TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;
> ++#else
> +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> +                   TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_V=
RAM;
> +-      if (domain & TTM_PL_FLAG_SYSTEM)
> ++#endif
> ++      }
> ++      if (mem_type & VBOX_MEM_TYPE_SYSTEM) {
> ++#if RTLNX_VER_MIN(5,10,0)
> ++              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> ++                  TTM_PL_MASK_CACHING;
> ++#else
> +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> +                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> +-      if (!c)
> ++#endif
> ++      }
> ++      if (!c) {
> ++#if RTLNX_VER_MIN(5,10,0)
> ++              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> ++                  TTM_PL_MASK_CACHING;
> ++#else
> +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> +                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> ++#endif
> ++      }
> +
> +       bo->placement.num_placement =3D c;
> +       bo->placement.num_busy_placement =3D c;
> +@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int size,=
 int align,
> +       vboxbo->bo.bdev->dev_mapping =3D dev->dev_mapping;
> + #endif
> +
> +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM)=
;
> ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBOX_MEM_TYPE_SYS=
TEM);
> +
> +       acc_size =3D ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
> +                                      sizeof(struct vbox_bo));
> +@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo =
*bo)
> + #endif
> + }
> +
> +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
> ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)
> + {
> + #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) || RTLNX_SUSE_M=
AJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
> +       struct ttm_operation_ctx ctx =3D { false, false };
> +@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64=
 *gpu_addr)
> +               return 0;
> +       }
> +
> +-      vbox_ttm_placement(bo, pl_flag);
> ++      vbox_ttm_placement(bo, mem_type);
> +
> +       for (i =3D 0; i < bo->placement.num_placement; i++)
> +               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_EV=
ICT;
> +@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)
> +       if (bo->kmap.virtual)
> +               ttm_bo_kunmap(&bo->kmap);
> +
> +-      vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
> ++      vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
> +
> +       for (i =3D 0; i < bo->placement.num_placement; i++)
> +               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_EV=
ICT;
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/00=
01-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.patch b/meta-oe/rec=
ipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runtime-memobj-r0drv-li=
nux.c-Changes-to-support-the-.patch
> new file mode 100644
> index 000000000..039d447da
> --- /dev/null
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-Runt=
ime-memobj-r0drv-linux.c-Changes-to-support-the-.patch
> @@ -0,0 +1,120 @@
> +From 2a6e3cf63f58e289802a11faad5fb495e2d04e97 Mon Sep 17 00:00:00 2001
> +From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> +Date: Wed, 9 Dec 2020 18:59:04 +0000
> +Subject: [PATCH] Runtime/memobj-r0drv-linux.c: Changes to support the up=
coming
> + 5.10 kernel, bugref:9879
> +
> +Upstream-Status: Backport
> +
> +git-svn-id: http://www.virtualbox.org/svn/vbox@87074 cfe28804-0f27-0410-=
a406-dd0f0b0b656f
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 68 ++++++++++++++++++-
> + 1 file changed, 67 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c b/src/VBo=
x/Runtime/r0drv/linux/memobj-r0drv-linux.c
> +index 13f5f4236d..66c3bb364b 100644
> +--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> ++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> +@@ -56,9 +56,19 @@
> +  * Whether we use alloc_vm_area (3.2+) for executable memory.
> +  * This is a must for 5.8+, but we enable it all the way back to 3.2.x =
for
> +  * better W^R compliance (fExecutable flag). */
> +-#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
> ++#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)
> + # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
> + #endif
> ++/** @def IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> ++ * alloc_vm_area was removed with 5.10 so we have to resort to a differ=
ent way
> ++ * to allocate executable memory.
> ++ * It would be possible to remove IPRT_USE_ALLOC_VM_AREA_FOR_EXEC and u=
se
> ++ * this path execlusively for 3.2+ but no time to test it really works =
on every
> ++ * supported kernel, so better play safe for now.
> ++ */
> ++#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
> ++# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> ++#endif
> +
> + /*
> +  * 2.6.29+ kernels don't work with remap_pfn_range() anymore because
> +@@ -502,6 +512,42 @@ static void rtR0MemObjLinuxFreePages(PRTR0MEMOBJLNX=
 pMemLnx)
> + }
> +
> +
> ++#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> ++/**
> ++ * User data passed to the apply_to_page_range() callback.
> ++ */
> ++typedef struct LNXAPPLYPGRANGE
> ++{
> ++    /** Pointer to the memory object. */
> ++    PRTR0MEMOBJLNX pMemLnx;
> ++    /** The page protection flags to apply. */
> ++    pgprot_t       fPg;
> ++} LNXAPPLYPGRANGE;
> ++/** Pointer to the user data. */
> ++typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;
> ++/** Pointer to the const user data. */
> ++typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
> ++
> ++/**
> ++ * Callback called in apply_to_page_range().
> ++ *
> ++ * @returns Linux status code.
> ++ * @param   pPte                Pointer to the page table entry for the=
 given address.
> ++ * @param   uAddr               The address to apply the new protection=
 to.
> ++ * @param   pvUser              The opaque user data.
> ++ */
> ++static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, uns=
igned long uAddr, void *pvUser)
> ++{
> ++    PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser;
> ++    PRTR0MEMOBJLNX pMemLnx =3D pArgs->pMemLnx;
> ++    size_t idxPg =3D (uAddr - (unsigned long)pMemLnx->Core.pv) >> PAGE_=
SHIFT;
> ++
> ++    set_pte(pPte, mk_pte(pMemLnx->apPages[idxPg], pArgs->fPg));
> ++    return 0;
> ++}
> ++#endif
> ++
> ++
> + /**
> +  * Maps the allocation into ring-0.
> +  *
> +@@ -584,6 +630,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMOBJLNX pMemL=
nx, bool fExecutable)
> +         else
> + # endif
> +         {
> ++#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> ++            if (fExecutable)
> ++                pgprot_val(fPg) |=3D _PAGE_NX; /* Uses RTR0MemObjProtec=
t to clear NX when memory ready, W^X fashion. */
> ++#  endif
> ++
> + # ifdef VM_MAP
> +             pMemLnx->Core.pv =3D vmap(&pMemLnx->apPages[0], pMemLnx->cP=
ages, VM_MAP, fPg);
> + # else
> +@@ -1851,6 +1902,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(PRTR0MEMO=
BJINTERNAL pMem, size_t offSub,
> +         preempt_enable();
> +         return VINF_SUCCESS;
> +     }
> ++# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> ++    PRTR0MEMOBJLNX pMemLnx =3D (PRTR0MEMOBJLNX)pMem;
> ++    if (   pMemLnx->fExecutable
> ++        && pMemLnx->fMappedToRing0)
> ++    {
> ++        LNXAPPLYPGRANGE Args;
> ++        Args.pMemLnx =3D pMemLnx;
> ++        Args.fPg =3D rtR0MemObjLinuxConvertProt(fProt, true /*fKernel*/=
);
> ++        int rcLnx =3D apply_to_page_range(current->active_mm, (unsigned=
 long)pMemLnx->Core.pv + offSub, cbSub,
> ++                                        rtR0MemObjLinuxApplyPageRange, =
(void *)&Args);
> ++        if (rcLnx)
> ++            return VERR_NOT_SUPPORTED;
> ++
> ++        return VINF_SUCCESS;
> ++    }
> + # endif
> +
> +     NOREF(pMem);
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/00=
01-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch b/meta-oe/rec=
ipes-support/vboxguestdrivers/vboxguestdrivers/0001-linser-vboxsf-Adjustmen=
t-for-linux-5.10-TASK_SIZE_MA.patch
> new file mode 100644
> index 000000000..3cfe2e917
> --- /dev/null
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-lins=
er-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.patch
> @@ -0,0 +1,46 @@
> +From a276f8bc5e4515f7ea51e2c56e0e634a723ca104 Mon Sep 17 00:00:00 2001
> +From: vboxsync <vboxsync@cfe28804-0f27-0410-a406-dd0f0b0b656f>
> +Date: Tue, 8 Dec 2020 13:52:53 +0000
> +Subject: [PATCH] linser/vboxsf: Adjustment for linux 5.10 - TASK_SIZE_MA=
X
> + replaces USER_DS.seg. bugref:9879
> +
> +Upstream-Status: Backport
> +
> +git-svn-id: http://www.virtualbox.org/svn/vbox@87053 cfe28804-0f27-0410-=
a406-dd0f0b0b656f
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + src/VBox/Additions/linux/sharedfolders/regops.c | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c b/src/VBox/=
Additions/linux/sharedfolders/regops.c
> +index e1fad3d820..401fd69930 100644
> +--- a/src/VBox/Additions/linux/sharedfolders/regops.c
> ++++ b/src/VBox/Additions/linux/sharedfolders/regops.c
> +@@ -147,7 +147,11 @@ static int vbsf_iov_iter_detect_type(struct iovec c=
onst *paIov, size_t cSegs)
> +     while (cSegs-- > 0) {
> +         if (paIov->iov_len > 0) {
> +             if (access_ok(VERIFY_READ, paIov->iov_base, paIov->iov_len)=
)
> ++#if RTLNX_VER_MIN(5,10,0)
> ++                return (uintptr_t)paIov->iov_base >=3D TASK_SIZE_MAX ? =
ITER_KVEC : 0;
> ++#else
> +                 return (uintptr_t)paIov->iov_base >=3D USER_DS.seg ? IT=
ER_KVEC : 0;
> ++#endif
> +             AssertMsgFailed(("%p LB %#zx\n", paIov->iov_base, paIov->io=
v_len));
> +             break;
> +         }
> +@@ -1401,7 +1405,10 @@ static int vbsf_lock_user_pages_failed_check_kern=
el(uintptr_t uPtrFrom, size_t c
> +     /*
> +      * Check that this is valid user memory that is actually in the ker=
nel range.
> +      */
> +-#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> ++#if RTLNX_VER_MIN(5,10,0)
> ++    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> ++        && uPtrFrom >=3D TASK_SIZE_MAX)
> ++#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> +     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> +         && uPtrFrom >=3D USER_DS.seg)
> + #else
> +--
> +2.19.1
> +
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.=
1.16.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.=
bb
> index 9282f663b..ff639c09f 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.bb
> @@ -13,6 +13,9 @@ VBOX_NAME =3D "VirtualBox-${PV}"
>
>  SRC_URI =3D "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME=
}.tar.bz2 \
>      file://Makefile.utils \
> +    file://0001-Additions-linux-drm-Adjustment-for-Linux-5.10.patch \
> +    file://0001-Runtime-memobj-r0drv-linux.c-Changes-to-support-the-.pat=
ch \
> +    file://0001-linser-vboxsf-Adjustment-for-linux-5.10-TASK_SIZE_MA.pat=
ch \
>  "
>  SRC_URI[md5sum] =3D "a12a647f6c114f2cb1571089b36841fe"
>  SRC_URI[sha256sum] =3D "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea=
44c1521a5fc2f9f1"
> --
> 2.19.1
>
