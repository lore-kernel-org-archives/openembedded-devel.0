Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.3580.1609843871564713168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 02:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bmcg3xMl;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w1so40587791ejf.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Jan 2021 02:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ic6fvvjcFOJIASAr5XD8k8aJWfSLVvyNrNn4QFGbK0=;
        b=Bmcg3xMlxmImcqAMGFt1PC4EVbDztAHRGJzYFJCNUeteGkl49hv0MYVidEj1CdozLF
         2U2KP7kVbJWmzfErK9X7QBFitMMD2k/6HJ8BTIPCc28gfrF+979biCbfVGw8poCqvI1P
         cHRvVmMOyIdcwNaftZUsclj75lbo5KDrqgwhqRXC2p5v29RshtGg7G3xuHvd2wdcrhG0
         SbcKB5ARnzitOagnrAw2dN0Kz0HoWhmsU8LiILl36aW/Dls2USFLW5op3VId4umhoviv
         j8JytKE31Lt8ZtY7+dhNGRos8gWZ3ZuLy5+hgjLvFg7MPinVeMPOhF7Blhprv6+U/F3B
         QF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ic6fvvjcFOJIASAr5XD8k8aJWfSLVvyNrNn4QFGbK0=;
        b=j9t5FHsybXx7NbArF+VC/wrgemW59PIdEVRaXwA/Vm5OS+XLLmRaO0Zkyw2P1qZgJF
         yaLahQcLsYgYKhvitSRgOZgTgNt0rKpUmURTuJ2AUGEK/rsT9TnVDjiUEozmTeovgQHv
         NhfidcGu4/8zVrZB2+av85K9FYcYwSe313aMnkuQ0/aDTr9sFn9lwVnh0/85xt1iSbkZ
         sMcftZ4y9GahhJwlSw/PW5wUP/6xqwQuuFTG08VKTkpf1+pn2czH8Dxt9c5uSHag04xy
         VocJTQYBa1Geoaq7XJE63ZyAfjkbOEQBE6gwE+fZdOHDPLqUxfdct6j4ycBwSIbyibBq
         jmvA==
X-Gm-Message-State: AOAM531+ppwC/iAZ6Fw5RQpuojlytAWC7jXvwjfVr5TKJcXRdQt6N3p6
	yUtRH1RfsztI9g8EqmKInoDCe9YCftMe3XPujKo=
X-Google-Smtp-Source: ABdhPJwWS7Ve7Q/W/6QQnf/ukoiWc/X1JobEs4adhAy6PtpMivfnZj28qKIOOOcu6aEhTcP9wq7faq2cMUapT2u5QHA=
X-Received: by 2002:a17:907:444f:: with SMTP id on23mr71891851ejb.300.1609843869901;
 Tue, 05 Jan 2021 02:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20210105040442.3264591-1-raj.khem@gmail.com>
In-Reply-To: <20210105040442.3264591-1-raj.khem@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 5 Jan 2021 10:50:58 +0000
Message-ID: <CANPvuR=wmh5XA5NOPeX6Pdy3qqV3TdJ6PLVCcLJ3dtuzLtNszg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Fix build with kernel 5.10
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000002672405b824fcf8"

--00000000000002672405b824fcf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I think there are a typo in python version the patch mention 5.9 instead o=
f
3.9

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 5/01/2021 =C3=A0=
(s) 04:04:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-support-python-5.9.patch             | 129 ++++++
>

.../0001-support-python-3.9.patch


>  .../0002-Backport-5.10-fixes.patch            | 432 ++++++++++++++++++
>  .../vboxguestdrivers_6.1.16.bb                |   2 +
>  3 files changed, 563 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-support-p=
ython-5.9.patch
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-Backport-=
5.10-fixes.patch
>
> diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-support=
-python-5.9.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-support=
-python-5.9.patch
> new file mode 100644
> index 0000000000..f1c4194633
> --- /dev/null
> +++
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-support=
-python-5.9.patch
> @@ -0,0 +1,129 @@
> +From d4df52c9442d44adfc492e8e1b682ab638f10c0c Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 4 Jan 2021 19:52:10 -0800
> +Subject: [PATCH 1/2] support python 5.9
>

Subject: [PATCH 1/2] support python 3.9


> +
> +Imported from
> +
> +
> https://github.com/archlinux/svntogit-community/commit/9276e06052e89615f=
e8bf3a30d04f5803ad2e539
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure                                     |  2 +-
> + src/libs/xpcom18a4/python/Makefile.kmk        | 48 ++++++++++++++++++-
> + src/libs/xpcom18a4/python/gen_python_deps.py  |  2 +-
> + .../xpcom18a4/python/src/module/_xpcom.cpp    |  6 ++-
> + 4 files changed, 54 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 55390478..50f53434 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2028,7 +2028,7 @@ extern "C" int main(void)
> + }
> + EOF
> +   found=3D
> +-  SUPPYTHONLIBS=3D"python2.7 python2.6 python3.1 python3.2 python3.3
> python3.4 python3.4m python3.5 python3.5m python3.6 python3.6m python3.7
> python3.7m python3.8 python3.8m"
> ++  SUPPYTHONLIBS=3D"python2.7 python2.6 python3.1 python3.2 python3.3
> python3.4 python3.4m python3.5 python3.5m python3.6 python3.6m python3.7
> python3.7m python3.8 python3.8m python3.9 python3.9m"
> +   for p in $PYTHONDIR; do
> +     for d in $SUPPYTHONLIBS; do
> +       for b in lib/x86_64-linux-gnu lib/i386-linux-gnu lib64 lib/64 li=
b;
> do
> +diff --git a/src/libs/xpcom18a4/python/Makefile.kmk
> b/src/libs/xpcom18a4/python/Makefile.kmk
> +index f854ea84..afc3d6b3 100644
> +--- a/src/libs/xpcom18a4/python/Makefile.kmk
> ++++ b/src/libs/xpcom18a4/python/Makefile.kmk
> +@@ -26,7 +26,7 @@ endif
> +
> + #
> + # List of supported Python versions, defining a number of
> +-#
> VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37M|38|38M|DE=
F]_[INC|LIB]
> variables
> ++#
> VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37M|38|38M|39=
|39M|DEF]_[INC|LIB]
> variables
> + # which get picked up below.
> + #
> + ifeq ($(KBUILD_TARGET),darwin) # Relatively predictable, don't script.
> +@@ -533,6 +533,52 @@ VBoxPython3_8m_x86_LIBS       =3D
> $(VBOX_PYTHON38M_LIB_X86)
> +  endif
> + endif
> +
> ++ifdef VBOX_PYTHON39_INC
> ++#
> ++# Python 3.9 version
> ++#
> ++DLLS +=3D VBoxPython3_9
> ++VBoxPython3_9_EXTENDS    =3D VBoxPythonBase
> ++VBoxPython3_9_EXTENDS_BY =3D appending
> ++VBoxPython3_9_TEMPLATE   =3D XPCOM
> ++VBoxPython3_9_INCS       =3D $(VBOX_PYTHON39_INC)
> ++VBoxPython3_9_LIBS       =3D $(VBOX_PYTHON39_LIB)
> ++
> ++ ifdef VBOX_WITH_32_ON_64_MAIN_API
> ++  ifdef VBOX_PYTHON39_LIB_X86
> ++DLLS +=3D VBoxPython3_9_x86
> ++VBoxPython3_9_x86_EXTENDS    =3D VBoxPythonBase_x86
> ++VBoxPython3_9_x86_EXTENDS_BY =3D appending
> ++VBoxPython3_9_x86_TEMPLATE   =3D XPCOM
> ++VBoxPython3_9_x86_INCS       =3D $(VBOX_PYTHON39_INC)
> ++VBoxPython3_9_x86_LIBS       =3D $(VBOX_PYTHON39_LIB_X86)
> ++  endif
> ++ endif
> ++endif
> ++
> ++ifdef VBOX_PYTHON39M_INC
> ++#
> ++# Python 3.9 version with pymalloc
> ++#
> ++DLLS +=3D VBoxPython3_9m
> ++VBoxPython3_9m_EXTENDS    =3D VBoxPythonBase_m
> ++VBoxPython3_9m_EXTENDS_BY =3D appending
> ++VBoxPython3_9m_TEMPLATE   =3D XPCOM
> ++VBoxPython3_9m_INCS       =3D $(VBOX_PYTHON39M_INC)
> ++VBoxPython3_9m_LIBS       =3D $(VBOX_PYTHON39M_LIB)
> ++
> ++ ifdef VBOX_WITH_32_ON_64_MAIN_API
> ++  ifdef VBOX_PYTHON39M_LIB_X86
> ++DLLS +=3D VBoxPython3_9m_x86
> ++VBoxPython3_9m_x86_EXTENDS    =3D VBoxPythonBase_x86_m
> ++VBoxPython3_9m_x86_EXTENDS_BY =3D appending
> ++VBoxPython3_9m_x86_TEMPLATE_   =3D XPCOM
> ++VBoxPython3_9m_x86_INCS       =3D $(VBOX_PYTHON39M_INC)
> ++VBoxPython3_9m_x86_LIBS       =3D $(VBOX_PYTHON39M_LIB_X86)
> ++  endif
> ++ endif
> ++endif
> ++
> + ifdef VBOX_PYTHONDEF_INC
> + #
> + # Python without versioning
> +diff --git a/src/libs/xpcom18a4/python/gen_python_deps.py
> b/src/libs/xpcom18a4/python/gen_python_deps.py
> +index 848dddf3..b116313a 100755
> +--- a/src/libs/xpcom18a4/python/gen_python_deps.py
> ++++ b/src/libs/xpcom18a4/python/gen_python_deps.py
> +@@ -16,7 +16,7 @@ from __future__ import print_function
> + import os,sys
> + from distutils.version import StrictVersion
> +
> +-versions =3D ["2.6", "2.7", "3.1", "3.2", "3.2m", "3.3", "3.3m", "3.4"=
,
> "3.4m", "3.5", "3.5m", "3.6", "3.6m", "3.7", "3.7m", "3.8", "3.8m" ]
> ++versions =3D ["2.6", "2.7", "3.1", "3.2", "3.2m", "3.3", "3.3m", "3.4"=
,
> "3.4m", "3.5", "3.5m", "3.6", "3.6m", "3.7", "3.7m", "3.8", "3.8m", "3.9=
",
> "3.9m" ]
> + prefixes =3D ["/usr", "/usr/local", "/opt", "/opt/local"]
> + known =3D {}
> +
> +diff --git a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> b/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> +index d35eb607..93ce03fd 100644
> +--- a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> ++++ b/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> +@@ -84,7 +84,11 @@ extern PYXPCOM_EXPORT void
> PyXPCOM_InterpreterState_Ensure();
> + #  define MANGLE_MODULE_INIT(a_Name)    RT_CONCAT(a_Name,
> MODULE_NAME_SUFFIX)
> + # endif
> + # ifdef VBOX_PYXPCOM_VERSIONED
> +-#  if   PY_VERSION_HEX >=3D 0x03080000 && PY_VERSION_HEX < 0x03090000
> ++#  if   PY_VERSION_HEX >=3D 0x03090000 && PY_VERSION_HEX < 0x03100000
> ++#   define MODULE_NAME    MANGLE_MODULE_NAME("VBoxPython3_9")
> ++#   define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPython3_9)
> ++
> ++#  elif   PY_VERSION_HEX >=3D 0x03080000 && PY_VERSION_HEX < 0x0309000=
0
> + #   define MODULE_NAME    MANGLE_MODULE_NAME("VBoxPython3_8")
> + #   define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPython3_8)
> +
> +--
> +2.30.0
> +
> diff --git
> a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-Backpor=
t-5.10-fixes.patch
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-Backpor=
t-5.10-fixes.patch
> new file mode 100644
> index 0000000000..f277ced902
> --- /dev/null
> +++
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-Backpor=
t-5.10-fixes.patch
> @@ -0,0 +1,432 @@
> +From ac018c7fe2215aab028615b2823cc8fba97cf8c2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 4 Jan 2021 19:54:52 -0800
> +Subject: [PATCH 2/2] Backport 5.10 fixes
> +
> +Imported from
> +
> https://raw.githubusercontent.com/archlinux/svntogit-community/packages/=
virtualbox/trunk/020-linux-5-10.patch
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/VBox/Additions/linux/drm/vbox_drv.h       | 10 +-
> + src/VBox/Additions/linux/drm/vbox_fb.c        |  2 +-
> + src/VBox/Additions/linux/drm/vbox_mode.c      |  2 +-
> + src/VBox/Additions/linux/drm/vbox_ttm.c       | 99 +++++++++++++++++--
> + .../Additions/linux/sharedfolders/regops.c    |  5 +-
> + .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 61 +++++++++++-
> + 6 files changed, 163 insertions(+), 16 deletions(-)
> +
> +diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h
> b/src/VBox/Additions/linux/drm/vbox_drv.h
> +index c680f3b4..d21d023c 100644
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
> +@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int siz=
e,
> int align,
> + int vbox_gem_create(struct drm_device *dev,
> +                   u32 size, bool iskernel, struct drm_gem_object **obj=
);
> +
> +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);
> ++#define VBOX_MEM_TYPE_VRAM   0x1
> ++#define VBOX_MEM_TYPE_SYSTEM 0x2
> ++
> ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);
> + int vbox_bo_unpin(struct vbox_bo *bo);
> +
> + static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)
> +@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo
> *bo)
> +       ttm_bo_unreserve(&bo->bo);
> + }
> +
> +-void vbox_ttm_placement(struct vbox_bo *bo, int domain);
> ++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
> + int vbox_bo_push_sysram(struct vbox_bo *bo);
> + int vbox_mmap(struct file *filp, struct vm_area_struct *vma);
> +
> +diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c
> b/src/VBox/Additions/linux/drm/vbox_fb.c
> +index 811d0040..44b1ef52 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_fb.c
> ++++ b/src/VBox/Additions/linux/drm/vbox_fb.c
> +@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *help=
er,
> +       if (ret)
> +               return ret;
> +
> +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
> ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
> +       if (ret) {
> +               vbox_bo_unreserve(bo);
> +               return ret;
> +diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c
> b/src/VBox/Additions/linux/drm/vbox_mode.c
> +index 1e2691fd..52fd10fd 100644
> +--- a/src/VBox/Additions/linux/drm/vbox_mode.c
> ++++ b/src/VBox/Additions/linux/drm/vbox_mode.c
> +@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc=
,
> +       if (ret)
> +               return ret;
> +
> +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
> ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr);
> +       vbox_bo_unreserve(bo);
> +       if (ret)
> +               return ret;
> +diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c
> b/src/VBox/Additions/linux/drm/vbox_ttm.c
> +index 4e990843..ee2da4aa 100644
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
> +@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct
> ttm_buffer_object *bo)
> +       return false;
> + }
> +
> ++#if RTLNX_VER_MAX(5,10,0)
> + static int
> + vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
> +                     struct ttm_mem_type_manager *man)
> +@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u=
32
> type,
> +
> +       return 0;
> + }
> ++#endif
> +
> + static void
> + vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement
> *pl)
> +@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo,
> struct ttm_placement *pl)
> +       if (!vbox_ttm_bo_is_vbox_bo(bo))
> +               return;
> +
> +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
> ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
> +       *pl =3D vboxbo->placement;
> + }
> +
> +@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct
> ttm_buffer_object *bo,
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
> +@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct
> ttm_bo_device *bdev,
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
> ++static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct
> ttm_tt *tt)
> ++{
> ++      ttm_tt_fini(tt);
> ++      kfree(tt);
> ++}
> ++#else
> + static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
> + {
> +       ttm_tt_fini(tt);
> +@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt
> *tt)
> + static struct ttm_backend_func vbox_tt_backend_func =3D {
> +       .destroy =3D &vbox_ttm_backend_destroy,
> + };
> ++#endif
> +
> + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> + static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,
> +@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct
> ttm_buffer_object *bo,
> +       if (!tt)
> +               return NULL;
> +
> ++#if RTLNX_VER_MAX(5,10,0)
> +       tt->func =3D &vbox_tt_backend_func;
> ++#endif
> + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> +       if (ttm_tt_init(tt, bdev, size, page_flags, dummy_read_page)) {
> + #else
> +@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt
> *ttm)
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
> +@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int
> domain)
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
> +                   TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
> TTM_PL_FLAG_VRAM;
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
> +@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int size=
,
> int align,
> +       vboxbo->bo.bdev->dev_mapping =3D dev->dev_mapping;
> + #endif
> +
> +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_PL_FLAG_SYSTEM=
);
> ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM |
> VBOX_MEM_TYPE_SYSTEM);
> +
> +       acc_size =3D ttm_bo_dma_acc_size(&vbox->ttm.bdev, size,
> +                                      sizeof(struct vbox_bo));
> +@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo
> *bo)
> + #endif
> + }
> +
> +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)
> ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)
> + {
> + #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) ||
> RTLNX_SUSE_MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
> +       struct ttm_operation_ctx ctx =3D { false, false };
> +@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u6=
4
> *gpu_addr)
> +               return 0;
> +       }
> +
> +-      vbox_ttm_placement(bo, pl_flag);
> ++      vbox_ttm_placement(bo, mem_type);
> +
> +       for (i =3D 0; i < bo->placement.num_placement; i++)
> +               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_E=
VICT;
> +@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)
> +       if (bo->kmap.virtual)
> +               ttm_bo_kunmap(&bo->kmap);
> +
> +-      vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
> ++      vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
> +
> +       for (i =3D 0; i < bo->placement.num_placement; i++)
> +               PLACEMENT_FLAGS(bo->placements[i]) |=3D TTM_PL_FLAG_NO_E=
VICT;
> +diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c
> b/src/VBox/Additions/linux/sharedfolders/regops.c
> +index 3ad9c566..ec298a1b 100644
> +--- a/src/VBox/Additions/linux/sharedfolders/regops.c
> ++++ b/src/VBox/Additions/linux/sharedfolders/regops.c
> +@@ -1401,7 +1401,10 @@ static int
> vbsf_lock_user_pages_failed_check_kernel(uintptr_t uPtrFrom, size_t c
> +     /*
> +      * Check that this is valid user memory that is actually in the
> kernel range.
> +      */
> +-#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> ++#if RTLNX_VER_MIN(5,10,0)
> ++    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> ++        && uPtrFrom >=3D TASK_SIZE_MAX)
> ++#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> +     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT)
> +         && uPtrFrom >=3D USER_DS.seg)
> + #else
> +diff --git a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> +index c771c1ba..a34eb149 100644
> +--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> ++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> +@@ -56,9 +56,12 @@
> +  * Whether we use alloc_vm_area (3.2+) for executable memory.
> +  * This is a must for 5.8+, but we enable it all the way back to 3.2.x
> for
> +  * better W^R compliance (fExecutable flag). */
> +-#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
> ++#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)
> + # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
> + #endif
> ++#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
> ++# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> ++#endif
> +
> + /*
> +  * 2.6.29+ kernels don't work with remap_pfn_range() anymore because
> +@@ -502,6 +505,42 @@ static void rtR0MemObjLinuxFreePages(PRTR0MEMOBJLN=
X
> pMemLnx)
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
> ++ * @param   pPte                Pointer to the page table entry for th=
e
> given address.
> ++ * @param   uAddr               The address to apply the new protectio=
n
> to.
> ++ * @param   pvUser              The opaque user data.
> ++ */
> ++static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte,
> unsigned long uAddr, void *pvUser)
> ++{
> ++    PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser;
> ++    PRTR0MEMOBJLNX pMemLnx =3D pArgs->pMemLnx;
> ++    uint32_t idxPg =3D (uAddr - (unsigned long)pMemLnx->Core.pv) >>
> PAGE_SHIFT;
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
> +@@ -584,6 +623,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMOBJLNX
> pMemLnx, bool fExecutable)
> +         else
> + # endif
> +         {
> ++#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> ++            if (fExecutable)
> ++                pgprot_val(fPg) |=3D _PAGE_NX; /* Uses RTR0MemObjProte=
ct
> to clear NX when memory ready, W^X fashion. */
> ++#  endif
> ++
> + # ifdef VM_MAP
> +             pMemLnx->Core.pv =3D vmap(&pMemLnx->apPages[0],
> pMemLnx->cPages, VM_MAP, fPg);
> + # else
> +@@ -1851,6 +1895,21 @@ DECLHIDDEN(int)
> rtR0MemObjNativeProtect(PRTR0MEMOBJINTERNAL pMem, size_t offSub,
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
> ++        Args.fPg =3D rtR0MemObjLinuxConvertProt(fProt, true /*fKernel*=
/);
> ++        int rcLnx =3D apply_to_page_range(current->active_mm, (unsigne=
d
> long)pMemLnx->Core.pv + offSub, cbSub,
> ++                                        rtR0MemObjLinuxApplyPageRange,
> (void *)&Args);
> ++        if (rcLnx)
> ++            return VERR_NOT_SUPPORTED;
> ++
> ++        return VINF_SUCCESS;
> ++    }
> + # endif
> +
> +     NOREF(pMem);
> +--
> +2.30.0
> +
> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.16.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_6.1.16.bb
> index 9282f663b4..fef7ffa954 100644
> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.b=
b
> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.16.b=
b
> @@ -13,6 +13,8 @@ VBOX_NAME =3D "VirtualBox-${PV}"
>
>  SRC_URI =3D "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>      file://Makefile.utils \
> +    file://0001-support-python-5.9.patch \
>

file://0001-support-python-3.9.patch


> +    file://0002-Backport-5.10-fixes.patch \
>  "
>  SRC_URI[md5sum] =3D "a12a647f6c114f2cb1571089b36841fe"
>  SRC_URI[sha256sum] =3D
> "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1"
> --
> 2.30.0
>
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--00000000000002672405b824fcf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I think there are a typo=
 in python version the patch mention 5.9 instead of 3.9</div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 5/01/2021 =C3=A0(s) 04:04:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-support-python-5.9.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 129 ++++++<br></blockquote><div><br></div><div>.../0001-sup=
port-python-3.9.patch<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0.../0002-Backport-5.10-fixes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 432 ++++++++++++++++++<br>
=C2=A0.../<a href=3D"http://vboxguestdrivers_6.1.16.bb" rel=3D"noreferrer"=
 target=3D"_blank">vboxguestdrivers_6.1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 563 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxgues=
tdrivers/0001-support-python-5.9.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxgues=
tdrivers/0002-Backport-5.10-fixes.patch<br>
<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/000=
1-support-python-5.9.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxg=
uestdrivers/0001-support-python-5.9.patch<br>
new file mode 100644<br>
index 0000000000..f1c4194633<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-suppo=
rt-python-5.9.patch<br>
@@ -0,0 +1,129 @@<br>
+From d4df52c9442d44adfc492e8e1b682ab638f10c0c Mon Sep 17 00:00:00 2001<br=
>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
+Date: Mon, 4 Jan 2021 19:52:10 -0800<br>
+Subject: [PATCH 1/2] support python 5.9<br>
</blockquote><div><br></div>Subject: [PATCH 1/2] support python 3.9<br><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+Imported from<br>
+<br>
+<a href=3D"https://github.com/archlinux/svntogit-community/commit/9276e06=
052e89615fe8bf3a30d04f5803ad2e539" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/archlinux/svntogit-community/commit/9276e06052e89615fe8bf3a=
30d04f5803ad2e539</a><br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
+ src/libs/xpcom18a4/python/Makefile.kmk=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 48 +=
+++++++++++++++++-<br>
+ src/libs/xpcom18a4/python/gen_python_deps.py=C2=A0 |=C2=A0 2 +-<br>
+ .../xpcom18a4/python/src/module/_xpcom.cpp=C2=A0 =C2=A0 |=C2=A0 6 ++-<br=
>
+ 4 files changed, 54 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/configure b/configure<br>
+index 55390478..50f53434 100755<br>
+--- a/configure<br>
++++ b/configure<br>
+@@ -2028,7 +2028,7 @@ extern &quot;C&quot; int main(void)<br>
+ }<br>
+ EOF<br>
+=C2=A0 =C2=A0found=3D<br>
+-=C2=A0 SUPPYTHONLIBS=3D&quot;python2.7 python2.6 python3.1 python3.2 pyt=
hon3.3 python3.4 python3.4m python3.5 python3.5m python3.6 python3.6m pytho=
n3.7 python3.7m python3.8 python3.8m&quot;<br>
++=C2=A0 SUPPYTHONLIBS=3D&quot;python2.7 python2.6 python3.1 python3.2 pyt=
hon3.3 python3.4 python3.4m python3.5 python3.5m python3.6 python3.6m pytho=
n3.7 python3.7m python3.8 python3.8m python3.9 python3.9m&quot;<br>
+=C2=A0 =C2=A0for p in $PYTHONDIR; do<br>
+=C2=A0 =C2=A0 =C2=A0for d in $SUPPYTHONLIBS; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for b in lib/x86_64-linux-gnu lib/i386-linux-g=
nu lib64 lib/64 lib; do<br>
+diff --git a/src/libs/xpcom18a4/python/Makefile.kmk b/src/libs/xpcom18a4/=
python/Makefile.kmk<br>
+index f854ea84..afc3d6b3 100644<br>
+--- a/src/libs/xpcom18a4/python/Makefile.kmk<br>
++++ b/src/libs/xpcom18a4/python/Makefile.kmk<br>
+@@ -26,7 +26,7 @@ endif<br>
+ <br>
+ #<br>
+ # List of supported Python versions, defining a number of<br>
+-# VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37M|38|38M|=
DEF]_[INC|LIB] variables<br>
++# VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37M|38|38M|=
39|39M|DEF]_[INC|LIB] variables<br>
+ # which get picked up below.<br>
+ #<br>
+ ifeq ($(KBUILD_TARGET),darwin) # Relatively predictable, don&#39;t scrip=
t.<br>
+@@ -533,6 +533,52 @@ VBoxPython3_8m_x86_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D $(VBOX_PYTHON38M_LIB_X86)<br>
+=C2=A0 endif<br>
+ endif<br>
+ <br>
++ifdef VBOX_PYTHON39_INC<br>
++#<br>
++# Python 3.9 version<br>
++#<br>
++DLLS +=3D VBoxPython3_9<br>
++VBoxPython3_9_EXTENDS=C2=A0 =C2=A0 =3D VBoxPythonBase<br>
++VBoxPython3_9_EXTENDS_BY =3D appending<br>
++VBoxPython3_9_TEMPLATE=C2=A0 =C2=A0=3D XPCOM<br>
++VBoxPython3_9_INCS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39_INC)<br=
>
++VBoxPython3_9_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39_LIB)<br=
>
++<br>
++ ifdef VBOX_WITH_32_ON_64_MAIN_API<br>
++=C2=A0 ifdef VBOX_PYTHON39_LIB_X86<br>
++DLLS +=3D VBoxPython3_9_x86<br>
++VBoxPython3_9_x86_EXTENDS=C2=A0 =C2=A0 =3D VBoxPythonBase_x86<br>
++VBoxPython3_9_x86_EXTENDS_BY =3D appending<br>
++VBoxPython3_9_x86_TEMPLATE=C2=A0 =C2=A0=3D XPCOM<br>
++VBoxPython3_9_x86_INCS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39_INC=
)<br>
++VBoxPython3_9_x86_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39_LIB=
_X86)<br>
++=C2=A0 endif<br>
++ endif<br>
++endif<br>
++<br>
++ifdef VBOX_PYTHON39M_INC<br>
++#<br>
++# Python 3.9 version with pymalloc<br>
++#<br>
++DLLS +=3D VBoxPython3_9m<br>
++VBoxPython3_9m_EXTENDS=C2=A0 =C2=A0 =3D VBoxPythonBase_m<br>
++VBoxPython3_9m_EXTENDS_BY =3D appending<br>
++VBoxPython3_9m_TEMPLATE=C2=A0 =C2=A0=3D XPCOM<br>
++VBoxPython3_9m_INCS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39M_INC)<=
br>
++VBoxPython3_9m_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39M_LIB)<=
br>
++<br>
++ ifdef VBOX_WITH_32_ON_64_MAIN_API<br>
++=C2=A0 ifdef VBOX_PYTHON39M_LIB_X86<br>
++DLLS +=3D VBoxPython3_9m_x86<br>
++VBoxPython3_9m_x86_EXTENDS=C2=A0 =C2=A0 =3D VBoxPythonBase_x86_m<br>
++VBoxPython3_9m_x86_EXTENDS_BY =3D appending<br>
++VBoxPython3_9m_x86_TEMPLATE_=C2=A0 =C2=A0=3D XPCOM<br>
++VBoxPython3_9m_x86_INCS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39M_I=
NC)<br>
++VBoxPython3_9m_x86_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(VBOX_PYTHON39M_L=
IB_X86)<br>
++=C2=A0 endif<br>
++ endif<br>
++endif<br>
++<br>
+ ifdef VBOX_PYTHONDEF_INC<br>
+ #<br>
+ # Python without versioning<br>
+diff --git a/src/libs/xpcom18a4/python/gen_python_deps.py b/src/libs/xpco=
m18a4/python/gen_python_deps.py<br>
+index 848dddf3..b116313a 100755<br>
+--- a/src/libs/xpcom18a4/python/gen_python_deps.py<br>
++++ b/src/libs/xpcom18a4/python/gen_python_deps.py<br>
+@@ -16,7 +16,7 @@ from __future__ import print_function<br>
+ import os,sys<br>
+ from distutils.version import StrictVersion<br>
+ <br>
+-versions =3D [&quot;2.6&quot;, &quot;2.7&quot;, &quot;3.1&quot;, &quot;3=
.2&quot;, &quot;3.2m&quot;, &quot;3.3&quot;, &quot;3.3m&quot;, &quot;3.4&qu=
ot;, &quot;3.4m&quot;, &quot;3.5&quot;, &quot;3.5m&quot;, &quot;3.6&quot;, =
&quot;3.6m&quot;, &quot;3.7&quot;, &quot;3.7m&quot;, &quot;3.8&quot;, &quot=
;3.8m&quot; ]<br>
++versions =3D [&quot;2.6&quot;, &quot;2.7&quot;, &quot;3.1&quot;, &quot;3=
.2&quot;, &quot;3.2m&quot;, &quot;3.3&quot;, &quot;3.3m&quot;, &quot;3.4&qu=
ot;, &quot;3.4m&quot;, &quot;3.5&quot;, &quot;3.5m&quot;, &quot;3.6&quot;, =
&quot;3.6m&quot;, &quot;3.7&quot;, &quot;3.7m&quot;, &quot;3.8&quot;, &quot=
;3.8m&quot;, &quot;3.9&quot;, &quot;3.9m&quot; ]<br>
+ prefixes =3D [&quot;/usr&quot;, &quot;/usr/local&quot;, &quot;/opt&quot;=
, &quot;/opt/local&quot;]<br>
+ known =3D {}<br>
+ <br>
+diff --git a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp b/src/libs/x=
pcom18a4/python/src/module/_xpcom.cpp<br>
+index d35eb607..93ce03fd 100644<br>
+--- a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp<br>
++++ b/src/libs/xpcom18a4/python/src/module/_xpcom.cpp<br>
+@@ -84,7 +84,11 @@ extern PYXPCOM_EXPORT void PyXPCOM_InterpreterState_En=
sure();<br>
+ #=C2=A0 define MANGLE_MODULE_INIT(a_Name)=C2=A0 =C2=A0 RT_CONCAT(a_Name,=
 MODULE_NAME_SUFFIX)<br>
+ # endif<br>
+ # ifdef VBOX_PYXPCOM_VERSIONED<br>
+-#=C2=A0 if=C2=A0 =C2=A0PY_VERSION_HEX &gt;=3D 0x03080000 &amp;&amp; PY_V=
ERSION_HEX &lt; 0x03090000<br>
++#=C2=A0 if=C2=A0 =C2=A0PY_VERSION_HEX &gt;=3D 0x03090000 &amp;&amp; PY_V=
ERSION_HEX &lt; 0x03100000<br>
++#=C2=A0 =C2=A0define MODULE_NAME=C2=A0 =C2=A0 MANGLE_MODULE_NAME(&quot;V=
BoxPython3_9&quot;)<br>
++#=C2=A0 =C2=A0define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPython=
3_9)<br>
++<br>
++#=C2=A0 elif=C2=A0 =C2=A0PY_VERSION_HEX &gt;=3D 0x03080000 &amp;&amp; PY=
_VERSION_HEX &lt; 0x03090000<br>
+ #=C2=A0 =C2=A0define MODULE_NAME=C2=A0 =C2=A0 MANGLE_MODULE_NAME(&quot;V=
BoxPython3_8&quot;)<br>
+ #=C2=A0 =C2=A0define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPython=
3_8)<br>
+ <br>
+-- <br>
+2.30.0<br>
+<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/000=
2-Backport-5.10-fixes.patch b/meta-oe/recipes-support/vboxguestdrivers/vbox=
guestdrivers/0002-Backport-5.10-fixes.patch<br>
new file mode 100644<br>
index 0000000000..f277ced902<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-Backp=
ort-5.10-fixes.patch<br>
@@ -0,0 +1,432 @@<br>
+From ac018c7fe2215aab028615b2823cc8fba97cf8c2 Mon Sep 17 00:00:00 2001<br=
>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
+Date: Mon, 4 Jan 2021 19:54:52 -0800<br>
+Subject: [PATCH 2/2] Backport 5.10 fixes<br>
+<br>
+Imported from<br>
+<a href=3D"https://raw.githubusercontent.com/archlinux/svntogit-community=
/packages/virtualbox/trunk/020-linux-5-10.patch" rel=3D"noreferrer" target=
=3D"_blank">https://raw.githubusercontent.com/archlinux/svntogit-community=
/packages/virtualbox/trunk/020-linux-5-10.patch</a><br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ src/VBox/Additions/linux/drm/vbox_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +=
-<br>
+ src/VBox/Additions/linux/drm/vbox_fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
+ src/VBox/Additions/linux/drm/vbox_mode.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +=
-<br>
+ src/VBox/Additions/linux/drm/vbox_ttm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 99 +=
++++++++++++++++--<br>
+ .../Additions/linux/sharedfolders/regops.c=C2=A0 =C2=A0 |=C2=A0 5 +-<br>
+ .../Runtime/r0drv/linux/memobj-r0drv-linux.c=C2=A0 | 61 +++++++++++-<br>
+ 6 files changed, 163 insertions(+), 16 deletions(-)<br>
+<br>
+diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h b/src/VBox/Additions=
/linux/drm/vbox_drv.h<br>
+index c680f3b4..d21d023c 100644<br>
+--- a/src/VBox/Additions/linux/drm/vbox_drv.h<br>
++++ b/src/VBox/Additions/linux/drm/vbox_drv.h<br>
+@@ -175,6 +175,9 @@<br>
+ #include &lt;drm/ttm/ttm_placement.h&gt;<br>
+ #include &lt;drm/ttm/ttm_memory.h&gt;<br>
+ #include &lt;drm/ttm/ttm_module.h&gt;<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++# include &lt;drm/ttm/ttm_resource.h&gt;<br>
++#endif<br>
+ <br>
+ #include &quot;vboxvideo_guest.h&quot;<br>
+ #include &quot;vboxvideo_vbe.h&quot;<br>
+@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *dev, int size,=
 int align,<br>
+ int vbox_gem_create(struct drm_device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 =
size, bool iskernel, struct drm_gem_object **obj);<br>
+ <br>
+-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr);<br>
++#define VBOX_MEM_TYPE_VRAM=C2=A0 =C2=A00x1<br>
++#define VBOX_MEM_TYPE_SYSTEM 0x2<br>
++<br>
++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr);<br>
+ int vbox_bo_unpin(struct vbox_bo *bo);<br>
+ <br>
+ static inline int vbox_bo_reserve(struct vbox_bo *bo, bool no_wait)<br>
+@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(struct vbox_bo *=
bo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_unreserve(&amp;bo-&gt;bo);<br>
+ }<br>
+ <br>
+-void vbox_ttm_placement(struct vbox_bo *bo, int domain);<br>
++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);<br>
+ int vbox_bo_push_sysram(struct vbox_bo *bo);<br>
+ int vbox_mmap(struct file *filp, struct vm_area_struct *vma);<br>
+ <br>
+diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c b/src/VBox/Additions/=
linux/drm/vbox_fb.c<br>
+index 811d0040..44b1ef52 100644<br>
+--- a/src/VBox/Additions/linux/drm/vbox_fb.c<br>
++++ b/src/VBox/Additions/linux/drm/vbox_fb.c<br>
+@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_helper *helper=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);<br=
>
++=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unreserve(=
bo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c b/src/VBox/Addition=
s/linux/drm/vbox_mode.c<br>
+index 1e2691fd..52fd10fd 100644<br>
+--- a/src/VBox/Additions/linux/drm/vbox_mode.c<br>
++++ b/src/VBox/Additions/linux/drm/vbox_mode.c<br>
+@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm_crtc *crtc,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &amp;gpu_=
addr);<br>
++=C2=A0 =C2=A0 =C2=A0 ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &amp;gp=
u_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox_bo_unreserve(bo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c b/src/VBox/Additions=
/linux/drm/vbox_ttm.c<br>
+index 4e990843..ee2da4aa 100644<br>
+--- a/src/VBox/Additions/linux/drm/vbox_ttm.c<br>
++++ b/src/VBox/Additions/linux/drm/vbox_ttm.c<br>
+@@ -41,6 +41,7 @@<br>
+ #define PLACEMENT_FLAGS(placement) ((placement).flags)<br>
+ #endif<br>
+ <br>
++<br>
+ static inline struct vbox_private *vbox_bdev(struct ttm_bo_device *bd)<b=
r>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(bd, struct vbox_private, t=
tm.bdev);<br>
+@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struct ttm_buffer_=
object *bo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+ }<br>
+ <br>
++#if RTLNX_VER_MAX(5,10,0)<br>
+ static int<br>
+ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0struct ttm_mem_type_manager *man)<br>
+@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32=
 type,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
++#endif<br>
+ <br>
+ static void<br>
+ vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct ttm_placement *=
pl)<br>
+@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_object *bo, str=
uct ttm_placement *pl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vbox_ttm_bo_is_vbox_bo(bo))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);<br>
++=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*pl =3D vboxbo-&gt;placement;<br>
+ }<br>
+ <br>
+@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struct ttm_buffer_=
object *bo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
++#if RTLNX_VER_MAX(5,10,0)<br>
+ static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_mem_reg *mem)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 struct ttm_mem_type_manager *man =3D &amp;bdev-&gt;=
man[mem-&gt;mem_type];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vbox_private *vbox =3D vbox_bdev(bdev);=
<br>
++=C2=A0 =C2=A0 =C2=A0 struct ttm_mem_type_manager *man =3D &amp;bdev-&gt;=
man[mem-&gt;mem_type];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&gt;bus.addr =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mem-&gt;bus.offset =3D 0;<br>
+@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(struct ttm_bo_de=
vice *bdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
++#else<br>
++static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bdev,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_resource *mem)<=
br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct vbox_private *vbox =3D vbox_bdev(bdev);<br>
++=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.addr =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.offset =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 mem-&gt;size =3D mem-&gt;num_pages &lt;&lt; PAGE_SH=
IFT;<br>
++=C2=A0 =C2=A0 =C2=A0 mem-&gt;start =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.is_iomem =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 switch (mem-&gt;mem_type) {<br>
++=C2=A0 =C2=A0 =C2=A0 case TTM_PL_SYSTEM:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* system memory */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 case TTM_PL_VRAM:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.offset =3D =
mem-&gt;start &lt;&lt; PAGE_SHIFT;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;start =3D pci_r=
esource_start(vbox-&gt;dev-&gt;pdev, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;bus.is_iomem =
=3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++#endif<br>
+ <br>
++<br>
++<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_resource *mem)<br>
++{<br>
++}<br>
++#else<br>
+ static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_mem_reg *mem)<br>
+ {<br>
+ }<br>
++#endif<br>
+ <br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_t=
t *tt)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 ttm_tt_fini(tt);<br>
++=C2=A0 =C2=A0 =C2=A0 kfree(tt);<br>
++}<br>
++#else<br>
+ static void vbox_ttm_backend_destroy(struct ttm_tt *tt)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_tt_fini(tt);<br>
+@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(struct ttm_tt *t=
t)<br>
+ static struct ttm_backend_func vbox_tt_backend_func =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy =3D &amp;vbox_ttm_backend_destroy,<br=
>
+ };<br>
++#endif<br>
+ <br>
+ #if RTLNX_VER_MAX(4,17,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,6) &amp;&a=
mp; !RTLNX_SUSE_MAJ_PREREQ(15,1) &amp;&amp; !RTLNX_SUSE_MAJ_PREREQ(12,5)<br=
>
+ static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_device *bdev,<br>
+@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create(struct ttm_b=
uffer_object *bo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+ <br>
++#if RTLNX_VER_MAX(5,10,0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tt-&gt;func =3D &amp;vbox_tt_backend_func;<br>
++#endif<br>
+ #if RTLNX_VER_MAX(4,17,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,6) &amp;&a=
mp; !RTLNX_SUSE_MAJ_PREREQ(15,1) &amp;&amp; !RTLNX_SUSE_MAJ_PREREQ(12,5)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttm_tt_init(tt, bdev, size, page_flags, du=
mmy_read_page)) {<br>
+ #else<br>
+@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(struct ttm_tt *t=
tm)<br>
+ <br>
+ static struct ttm_bo_driver vbox_bo_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_create =3D vbox_ttm_tt_create,<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 =C2=A0 .ttm_tt_destroy =3D vbox_ttm_tt_destroy,<br>
++#endif<br>
+ #if RTLNX_VER_MAX(4,17,0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_populate =3D vbox_ttm_tt_populate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.ttm_tt_unpopulate =3D vbox_ttm_tt_unpopulate,=
<br>
+ #endif<br>
++#if RTLNX_VER_MAX(5,10,0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.init_mem_type =3D vbox_bo_init_mem_type,<br>
++#endif<br>
+ #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.eviction_valuable =3D ttm_bo_eviction_valuabl=
e,<br>
+ #endif<br>
+@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *vbox)<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 =C2=A0 ret =3D ttm_range_man_init(bdev, TTM_PL_VRAM, false=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vbox-&gt;available_vram_size &gt;&gt; PAGE_SHIF=
T);<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_init_mm(bdev, TTM_PL_VRAM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 vbox-&gt;available_vram_size &gt;&gt; PAGE_SHIFT)=
;<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Fa=
iled ttm VRAM init: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_device_re=
lease;<br>
+@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *vbox)<br>
+ #endif<br>
+ }<br>
+ <br>
+-void vbox_ttm_placement(struct vbox_bo *bo, int domain)<br>
++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 c =3D 0;<br>
+ #if RTLNX_VER_MAX(3,18,0) &amp;&amp; !RTLNX_RHEL_MAJ_PREREQ(7,2)<br>
+@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo *bo, int dom=
ain)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.placement =3D bo-&gt;placemen=
ts;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.busy_placement =3D bo-&gt;pla=
cements;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (domain &amp; TTM_PL_FLAG_VRAM)<br>
++=C2=A0 =C2=A0 =C2=A0 if (mem_type &amp; VBOX_MEM_TYPE_VRAM) {<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[c].me=
m_type =3D TTM_PL_VRAM;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo-&gt;=
placements[c++]) =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_PL_FL=
AG_WC | TTM_PL_FLAG_UNCACHED;<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTM_=
PL_FLAG_WC | TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (domain &amp; TTM_PL_FLAG_SYSTEM)<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (mem_type &amp; VBOX_MEM_TYPE_SYSTEM) {<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[c].me=
m_type =3D TTM_PL_SYSTEM;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo-&gt;=
placements[c++]) =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_PL_MA=
SK_CACHING;<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTM_=
PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (!c)<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (!c) {<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;placements[c].me=
m_type =3D TTM_PL_SYSTEM;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLACEMENT_FLAGS(bo-&gt;=
placements[c++]) =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TTM_PL_MA=
SK_CACHING;<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLAGS(bo=
-&gt;placements[c++]) =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TTM_=
PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.num_placement =3D c;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;placement.num_busy_placement =3D c;<br>
+@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *dev, int size, =
int align,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vboxbo-&gt;bo.bdev-&gt;dev_mapping =3D dev-&gt=
;dev_mapping;<br>
+ #endif<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM | TTM_P=
L_FLAG_SYSTEM);<br>
++=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM | VBO=
X_MEM_TYPE_SYSTEM);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0acc_size =3D ttm_bo_dma_acc_size(&amp;vbox-&gt=
;ttm.bdev, size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct =
vbox_bo));<br>
+@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(struct vbox_bo *=
bo)<br>
+ #endif<br>
+ }<br>
+ <br>
+-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_addr)<br>
++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_addr)<br>
+ {<br>
+ #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) || RTLNX_SUSE_MA=
J_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx ctx =3D { false, fals=
e };<br>
+@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 =
*gpu_addr)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, pl_flag);<br>
++=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, mem_type);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; bo-&gt;placement.num_plac=
ement; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLAGS(bo=
-&gt;placements[i]) |=3D TTM_PL_FLAG_NO_EVICT;<br>
+@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *bo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;kmap.virtual)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttm_bo_kunmap(&amp=
;bo-&gt;kmap);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);<br>
++=C2=A0 =C2=A0 =C2=A0 vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; bo-&gt;placement.num_plac=
ement; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLACEMENT_FLAGS(bo=
-&gt;placements[i]) |=3D TTM_PL_FLAG_NO_EVICT;<br>
+diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c b/src/VBox/A=
dditions/linux/sharedfolders/regops.c<br>
+index 3ad9c566..ec298a1b 100644<br>
+--- a/src/VBox/Additions/linux/sharedfolders/regops.c<br>
++++ b/src/VBox/Additions/linux/sharedfolders/regops.c<br>
+@@ -1401,7 +1401,10 @@ static int vbsf_lock_user_pages_failed_check_kerne=
l(uintptr_t uPtrFrom, size_t c<br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 * Check that this is valid user memory that is actua=
lly in the kernel range.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)<br>
++#if RTLNX_VER_MIN(5,10,0)<br>
++=C2=A0 =C2=A0 if (=C2=A0 =C2=A0access_ok((void *)uPtrFrom, cPages &lt;&l=
t; PAGE_SHIFT)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; uPtrFrom &gt;=3D TASK_SIZE_MAX)<b=
r>
++#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)<br>
+=C2=A0 =C2=A0 =C2=A0if (=C2=A0 =C2=A0access_ok((void *)uPtrFrom, cPages &=
lt;&lt; PAGE_SHIFT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; uPtrFrom &gt;=3D USER_DS.seg=
)<br>
+ #else<br>
+diff --git a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c b/src/VBox=
/Runtime/r0drv/linux/memobj-r0drv-linux.c<br>
+index c771c1ba..a34eb149 100644<br>
+--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c<br>
++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c<br>
+@@ -56,9 +56,12 @@<br>
+=C2=A0 * Whether we use alloc_vm_area (3.2+) for executable memory.<br>
+=C2=A0 * This is a must for 5.8+, but we enable it all the way back to 3.=
2.x for<br>
+=C2=A0 * better W^R compliance (fExecutable flag). */<br>
+-#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)<br>
++#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNING)<br>
+ # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC<br>
+ #endif<br>
++#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)<br>
++# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC<br>
++#endif<br>
+ <br>
+ /*<br>
+=C2=A0 * 2.6.29+ kernels don&#39;t work with remap_pfn_range() anymore be=
cause<br>
+@@ -502,6 +505,42 @@ static void rtR0MemObjLinuxFreePages(PRTR0MEMOBJLNX =
pMemLnx)<br>
+ }<br>
+ <br>
+ <br>
++#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC<br>
++/**<br>
++ * User data passed to the apply_to_page_range() callback.<br>
++ */<br>
++typedef struct LNXAPPLYPGRANGE<br>
++{<br>
++=C2=A0 =C2=A0 /** Pointer to the memory object. */<br>
++=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx;<br>
++=C2=A0 =C2=A0 /** The page protection flags to apply. */<br>
++=C2=A0 =C2=A0 pgprot_t=C2=A0 =C2=A0 =C2=A0 =C2=A0fPg;<br>
++} LNXAPPLYPGRANGE;<br>
++/** Pointer to the user data. */<br>
++typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;<br>
++/** Pointer to the const user data. */<br>
++typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;<br>
++<br>
++/**<br>
++ * Callback called in apply_to_page_range().<br>
++ *<br>
++ * @returns Linux status code.<br>
++ * @param=C2=A0 =C2=A0pPte=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Pointer to the page table entry for the given address.<br>
++ * @param=C2=A0 =C2=A0uAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0The address to apply the new protection to.<br>
++ * @param=C2=A0 =C2=A0pvUser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 The opaque user data.<br>
++ */<br>
++static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_t *pPte, unsi=
gned long uAddr, void *pvUser)<br>
++{<br>
++=C2=A0 =C2=A0 PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser;<br>
++=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx =3D pArgs-&gt;pMemLnx;<br>
++=C2=A0 =C2=A0 uint32_t idxPg =3D (uAddr - (unsigned long)pMemLnx-&gt;Cor=
e.pv) &gt;&gt; PAGE_SHIFT;<br>
++<br>
++=C2=A0 =C2=A0 set_pte(pPte, mk_pte(pMemLnx-&gt;apPages[idxPg], pArgs-&gt=
;fPg));<br>
++=C2=A0 =C2=A0 return 0;<br>
++}<br>
++#endif<br>
++<br>
++<br>
+ /**<br>
+=C2=A0 * Maps the allocation into ring-0.<br>
+=C2=A0 *<br>
+@@ -584,6 +623,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEMOBJLNX pMemLn=
x, bool fExecutable)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+ # endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++#=C2=A0 if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fExecutable)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgprot_val(fPg) =
|=3D _PAGE_NX; /* Uses RTR0MemObjProtect to clear NX when memory ready, W^X=
 fashion. */<br>
++#=C2=A0 endif<br>
++<br>
+ # ifdef VM_MAP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pMemLnx-&gt;Core.pv =3D v=
map(&amp;pMemLnx-&gt;apPages[0], pMemLnx-&gt;cPages, VM_MAP, fPg);<br>
+ # else<br>
+@@ -1851,6 +1895,21 @@ DECLHIDDEN(int) rtR0MemObjNativeProtect(PRTR0MEMOB=
JINTERNAL pMem, size_t offSub,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preempt_enable();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return VINF_SUCCESS;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)<br>
++=C2=A0 =C2=A0 PRTR0MEMOBJLNX pMemLnx =3D (PRTR0MEMOBJLNX)pMem;<br>
++=C2=A0 =C2=A0 if (=C2=A0 =C2=A0pMemLnx-&gt;fExecutable<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pMemLnx-&gt;fMappedToRing0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LNXAPPLYPGRANGE Args;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.pMemLnx =3D pMemLnx;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.fPg =3D rtR0MemObjLinuxConvertProt(fPro=
t, true /*fKernel*/);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rcLnx =3D apply_to_page_range(current-&g=
t;active_mm, (unsigned long)pMemLnx-&gt;Core.pv + offSub, cbSub,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtR0=
MemObjLinuxApplyPageRange, (void *)&amp;Args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rcLnx)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return VERR_NOT_SUPPORTED;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VINF_SUCCESS;<br>
++=C2=A0 =C2=A0 }<br>
+ # endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0NOREF(pMem);<br>
+-- <br>
+2.30.0<br>
+<br>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vb=
oxguestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdri=
vers_6.1.16.bb</a> b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"ht=
tp://vboxguestdrivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxg=
uestdrivers_6.1.16.bb</a><br>
index 9282f663b4..fef7ffa954 100644<br>
--- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguest=
drivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.=
1.16.bb</a><br>
+++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxguest=
drivers_6.1.16.bb" rel=3D"noreferrer" target=3D"_blank">vboxguestdrivers_6.=
1.16.bb</a><br>
@@ -13,6 +13,8 @@ VBOX_NAME =3D &quot;VirtualBox-${PV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://download.virtualbox.org/virtualb=
ox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank"=
>http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2</a> \=
<br>
=C2=A0 =C2=A0 =C2=A0file://Makefile.utils \<br>
+=C2=A0 =C2=A0 file://0001-support-python-5.9.patch \<br></blockquote><div=
><br></div><div>file://0001-support-python-3.9.patch<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 file://0002-Backport-5.10-fixes.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;a12a647f6c114f2cb1571089b36841fe&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;49c1990da16d8a3d5bda8cdb961ec8195a901e6=
7e4c79aea44c1521a5fc2f9f1&quot;<br>
-- <br>
2.30.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div></div>

--00000000000002672405b824fcf8--
