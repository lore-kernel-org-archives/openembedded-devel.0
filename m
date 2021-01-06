Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.7941.1609940529913460036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 05:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WLbJMoTp;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ce23so5039905ejb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 05:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m6EZ2cOe27avULLhexagxl9dY8zN9kp29aQITCl5VE0=;
        b=WLbJMoTp30pyLoeR01NhJlWCik5zCZYXx0qOeQfYwQTpiE+hbQbMEGywpBjHoHCGfN
         4XMzTcG5+tHJGrDYQKBInORpkk9PPmmOSaboB4NACcfkaPatbGQV5tiKuiTc5jWCa41g
         fnDq1dIQsVt/Bla5LvEa6J5rH1k9TOl4211NxSavK+8oVX4aTx5HiLV8ZQkJpZMjo9z6
         tmNZU2ejB3DonghhWOdHta0XvXjaEmVsm+tMXtm7l6o+FvE9UxsDZtlK6daSGPsDcjBx
         4n3Wtus0nYBZ1gOBgobmUaEp9EEOCGUjTeEVjqfB+t+jFKDxiwCCU64Ic8cmG/Netxcd
         7eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m6EZ2cOe27avULLhexagxl9dY8zN9kp29aQITCl5VE0=;
        b=eqo0/PyVR/Q3xF3n54bNzGyfVMVhraSkbA7Konf4TMwJdrDfl22QgYrl4Ioa7rXgfJ
         S7jbPrKFLYCH86hGSv13PMxqBAQ6P3vZx/NKqTIBu0tnXuMA8GDkCGvW50qsDJvnvg/4
         1p4Y6l8yFHJk/QRFHWHQb6f+EdKgefCAzYfH1YLhZmcTz9s0P336ai8Tmbln4wlH/yez
         Dk9xjvs+DDrcU/hhG/8sdDOpJc1iGVWphOB57QwcHIvFd4z2cSh9yAdJ2K+NIBGczqng
         GZI06QX+7mLfxmibLvodLngePkSiBxglrUGWbTjBYXPUA/yJNN4mlneftxbu3ps7B8Sg
         r58A==
X-Gm-Message-State: AOAM531Upc1oJjBfy8dtq1AXKL78Z14pollTEZMGDd4riN5BZvcoYyIn
	eiF67HtfUO9yC04cQi5uYLtQgT8+P+qmhpMIUbQ=
X-Google-Smtp-Source: ABdhPJy9k77i9B/kr//sxpCN9O3TkTD7pSGRuIOUXhqAc1tvKQE7QQF7OOwnNOCneHSuju5cw1DYkAU2z/Z8ht4E6+0=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr2710324ejb.298.1609940528144;
 Wed, 06 Jan 2021 05:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20210105040442.3264591-1-raj.khem@gmail.com> <CANPvuR=wmh5XA5NOPeX6Pdy3qqV3TdJ6PLVCcLJ3dtuzLtNszg@mail.gmail.com>
 <f617f9c2-1b33-2319-e58e-5a3649d14beb@gmail.com> <CADkTA4MKFfY7DujPKiu_u86BYSBLZmiYDQdKZ+Ksvq7f2pRO-g@mail.gmail.com>
 <a851888a-83cf-fdd1-7194-0de985474f7e@gmail.com> <CAMKF1sri5aeGjbNJrxz66H_7xXTZoqnufEi2sXcVBzB0sZQemQ@mail.gmail.com>
In-Reply-To: <CAMKF1sri5aeGjbNJrxz66H_7xXTZoqnufEi2sXcVBzB0sZQemQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 6 Jan 2021 08:41:56 -0500
Message-ID: <CADkTA4PrJ7NyyLmjBFH_4EiLQ9ctT+ykYNzd6qikWSyDwjsTkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vboxguestdrivers: Fix build with kernel 5.10
To: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 6, 2021 at 12:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> I have altered your patch a little which makes 32bit builds happy too
>
> http://sprunge.us/jqxsFO
>
> I think this should be ok for us to live with.

Yup. No concerns here.

Bruce

>
> On Tue, Jan 5, 2021 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 1/5/21 9:12 AM, Bruce Ashfield wrote:
> > > On Tue, Jan 5, 2021 at 12:05 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >> On 1/5/21 2:50 AM, Jose Quaresma wrote:
> > >>> Hi,
> > >>>
> > >>> I think there are a typo in python version the patch mention 5.9 i=
nstead
> > >>> of 3.9
> > >>
> > >> thanks I will fix it
> > >
> > > Ha!
> > >
> > > Sorry about the double send of the fix, I checked the list this
> > > morning and somehow managed to miss this!
> >
> > I think your patch looks better organized so I will pick this one.
> >
> > >
> > > Bruce
> > >
> > >>
> > >>>
> > >>> Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu=
 no
> > >>> dia ter=C3=A7a, 5/01/2021 =C3=A0(s) 04:04:
> > >>>
> > >>>      Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@=
gmail.com>>
> > >>>      ---
> > >>>        .../0001-support-python-5.9.patch             | 129 ++++++
> > >>>
> > >>>
> > >>> .../0001-support-python-3.9.patch
> > >>>
> > >>>        .../0002-Backport-5.10-fixes.patch            | 432 +++++++=
+++++++++++
> > >>>        .../vboxguestdrivers_6.1.16.bb
> > >>>      <http://vboxguestdrivers_6.1.16.bb>                |   2 +
> > >>>        3 files changed, 563 insertions(+)
> > >>>        create mode 100644
> > >>>      meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/000=
1-support-python-5.9.patch
> > >>>        create mode 100644
> > >>>      meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/000=
2-Backport-5.10-fixes.patch
> > >>>
> > >>>      diff --git
> > >>>      a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-support-python-5.9.patch
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-support-python-5.9.patch
> > >>>      new file mode 100644
> > >>>      index 0000000000..f1c4194633
> > >>>      --- /dev/null
> > >>>      +++
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
001-support-python-5.9.patch
> > >>>      @@ -0,0 +1,129 @@
> > >>>      +From d4df52c9442d44adfc492e8e1b682ab638f10c0c Mon Sep 17 00:=
00:00 2001
> > >>>      +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.co=
m>>
> > >>>      +Date: Mon, 4 Jan 2021 19:52:10 -0800
> > >>>      +Subject: [PATCH 1/2] support python 5.9
> > >>>
> > >>>
> > >>> Subject: [PATCH 1/2] support python 3.9
> > >>>
> > >>>      +
> > >>>      +Imported from
> > >>>      +
> > >>>      +https://github.com/archlinux/svntogit-community/commit/9276e=
06052e89615fe8bf3a30d04f5803ad2e539
> > >>>      <https://github.com/archlinux/svntogit-community/commit/9276e=
06052e89615fe8bf3a30d04f5803ad2e539>
> > >>>      +
> > >>>      +Signed-off-by: Khem Raj <raj.khem@gmail.com
> > >>>      <mailto:raj.khem@gmail.com>>
> > >>>      +---
> > >>>      + configure                                     |  2 +-
> > >>>      + src/libs/xpcom18a4/python/Makefile.kmk        | 48 ++++++++=
++++++++++-
> > >>>      + src/libs/xpcom18a4/python/gen_python_deps.py  |  2 +-
> > >>>      + .../xpcom18a4/python/src/module/_xpcom.cpp    |  6 ++-
> > >>>      + 4 files changed, 54 insertions(+), 4 deletions(-)
> > >>>      +
> > >>>      +diff --git a/configure b/configure
> > >>>      +index 55390478..50f53434 100755
> > >>>      +--- a/configure
> > >>>      ++++ b/configure
> > >>>      +@@ -2028,7 +2028,7 @@ extern "C" int main(void)
> > >>>      + }
> > >>>      + EOF
> > >>>      +   found=3D
> > >>>      +-  SUPPYTHONLIBS=3D"python2.7 python2.6 python3.1 python3.2 =
python3.3
> > >>>      python3.4 python3.4m python3.5 python3.5m python3.6 python3.6=
m
> > >>>      python3.7 python3.7m python3.8 python3.8m"
> > >>>      ++  SUPPYTHONLIBS=3D"python2.7 python2.6 python3.1 python3.2 =
python3.3
> > >>>      python3.4 python3.4m python3.5 python3.5m python3.6 python3.6=
m
> > >>>      python3.7 python3.7m python3.8 python3.8m python3.9 python3.9=
m"
> > >>>      +   for p in $PYTHONDIR; do
> > >>>      +     for d in $SUPPYTHONLIBS; do
> > >>>      +       for b in lib/x86_64-linux-gnu lib/i386-linux-gnu lib6=
4
> > >>>      lib/64 lib; do
> > >>>      +diff --git a/src/libs/xpcom18a4/python/Makefile.kmk
> > >>>      b/src/libs/xpcom18a4/python/Makefile.kmk
> > >>>      +index f854ea84..afc3d6b3 100644
> > >>>      +--- a/src/libs/xpcom18a4/python/Makefile.kmk
> > >>>      ++++ b/src/libs/xpcom18a4/python/Makefile.kmk
> > >>>      +@@ -26,7 +26,7 @@ endif
> > >>>      +
> > >>>      + #
> > >>>      + # List of supported Python versions, defining a number of
> > >>>      +-#
> > >>>      VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37=
M|38|38M|DEF]_[INC|LIB]
> > >>>      variables
> > >>>      ++#
> > >>>      VBOX_PYTHON[26|27|31|32|32M|33|33M|34|34M|35|35M|36|36M|37|37=
M|38|38M|39|39M|DEF]_[INC|LIB]
> > >>>      variables
> > >>>      + # which get picked up below.
> > >>>      + #
> > >>>      + ifeq ($(KBUILD_TARGET),darwin) # Relatively predictable, do=
n't script.
> > >>>      +@@ -533,6 +533,52 @@ VBoxPython3_8m_x86_LIBS       =3D
> > >>>      $(VBOX_PYTHON38M_LIB_X86)
> > >>>      +  endif
> > >>>      + endif
> > >>>      +
> > >>>      ++ifdef VBOX_PYTHON39_INC
> > >>>      ++#
> > >>>      ++# Python 3.9 version
> > >>>      ++#
> > >>>      ++DLLS +=3D VBoxPython3_9
> > >>>      ++VBoxPython3_9_EXTENDS    =3D VBoxPythonBase
> > >>>      ++VBoxPython3_9_EXTENDS_BY =3D appending
> > >>>      ++VBoxPython3_9_TEMPLATE   =3D XPCOM
> > >>>      ++VBoxPython3_9_INCS       =3D $(VBOX_PYTHON39_INC)
> > >>>      ++VBoxPython3_9_LIBS       =3D $(VBOX_PYTHON39_LIB)
> > >>>      ++
> > >>>      ++ ifdef VBOX_WITH_32_ON_64_MAIN_API
> > >>>      ++  ifdef VBOX_PYTHON39_LIB_X86
> > >>>      ++DLLS +=3D VBoxPython3_9_x86
> > >>>      ++VBoxPython3_9_x86_EXTENDS    =3D VBoxPythonBase_x86
> > >>>      ++VBoxPython3_9_x86_EXTENDS_BY =3D appending
> > >>>      ++VBoxPython3_9_x86_TEMPLATE   =3D XPCOM
> > >>>      ++VBoxPython3_9_x86_INCS       =3D $(VBOX_PYTHON39_INC)
> > >>>      ++VBoxPython3_9_x86_LIBS       =3D $(VBOX_PYTHON39_LIB_X86)
> > >>>      ++  endif
> > >>>      ++ endif
> > >>>      ++endif
> > >>>      ++
> > >>>      ++ifdef VBOX_PYTHON39M_INC
> > >>>      ++#
> > >>>      ++# Python 3.9 version with pymalloc
> > >>>      ++#
> > >>>      ++DLLS +=3D VBoxPython3_9m
> > >>>      ++VBoxPython3_9m_EXTENDS    =3D VBoxPythonBase_m
> > >>>      ++VBoxPython3_9m_EXTENDS_BY =3D appending
> > >>>      ++VBoxPython3_9m_TEMPLATE   =3D XPCOM
> > >>>      ++VBoxPython3_9m_INCS       =3D $(VBOX_PYTHON39M_INC)
> > >>>      ++VBoxPython3_9m_LIBS       =3D $(VBOX_PYTHON39M_LIB)
> > >>>      ++
> > >>>      ++ ifdef VBOX_WITH_32_ON_64_MAIN_API
> > >>>      ++  ifdef VBOX_PYTHON39M_LIB_X86
> > >>>      ++DLLS +=3D VBoxPython3_9m_x86
> > >>>      ++VBoxPython3_9m_x86_EXTENDS    =3D VBoxPythonBase_x86_m
> > >>>      ++VBoxPython3_9m_x86_EXTENDS_BY =3D appending
> > >>>      ++VBoxPython3_9m_x86_TEMPLATE_   =3D XPCOM
> > >>>      ++VBoxPython3_9m_x86_INCS       =3D $(VBOX_PYTHON39M_INC)
> > >>>      ++VBoxPython3_9m_x86_LIBS       =3D $(VBOX_PYTHON39M_LIB_X86)
> > >>>      ++  endif
> > >>>      ++ endif
> > >>>      ++endif
> > >>>      ++
> > >>>      + ifdef VBOX_PYTHONDEF_INC
> > >>>      + #
> > >>>      + # Python without versioning
> > >>>      +diff --git a/src/libs/xpcom18a4/python/gen_python_deps.py
> > >>>      b/src/libs/xpcom18a4/python/gen_python_deps.py
> > >>>      +index 848dddf3..b116313a 100755
> > >>>      +--- a/src/libs/xpcom18a4/python/gen_python_deps.py
> > >>>      ++++ b/src/libs/xpcom18a4/python/gen_python_deps.py
> > >>>      +@@ -16,7 +16,7 @@ from __future__ import print_function
> > >>>      + import os,sys
> > >>>      + from distutils.version import StrictVersion
> > >>>      +
> > >>>      +-versions =3D ["2.6", "2.7", "3.1", "3.2", "3.2m", "3.3", "3=
.3m",
> > >>>      "3.4", "3.4m", "3.5", "3.5m", "3.6", "3.6m", "3.7", "3.7m", "=
3.8",
> > >>>      "3.8m" ]
> > >>>      ++versions =3D ["2.6", "2.7", "3.1", "3.2", "3.2m", "3.3", "3=
.3m",
> > >>>      "3.4", "3.4m", "3.5", "3.5m", "3.6", "3.6m", "3.7", "3.7m", "=
3.8",
> > >>>      "3.8m", "3.9", "3.9m" ]
> > >>>      + prefixes =3D ["/usr", "/usr/local", "/opt", "/opt/local"]
> > >>>      + known =3D {}
> > >>>      +
> > >>>      +diff --git a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> > >>>      b/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> > >>>      +index d35eb607..93ce03fd 100644
> > >>>      +--- a/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> > >>>      ++++ b/src/libs/xpcom18a4/python/src/module/_xpcom.cpp
> > >>>      +@@ -84,7 +84,11 @@ extern PYXPCOM_EXPORT void
> > >>>      PyXPCOM_InterpreterState_Ensure();
> > >>>      + #  define MANGLE_MODULE_INIT(a_Name)    RT_CONCAT(a_Name,
> > >>>      MODULE_NAME_SUFFIX)
> > >>>      + # endif
> > >>>      + # ifdef VBOX_PYXPCOM_VERSIONED
> > >>>      +-#  if   PY_VERSION_HEX >=3D 0x03080000 && PY_VERSION_HEX < =
0x03090000
> > >>>      ++#  if   PY_VERSION_HEX >=3D 0x03090000 && PY_VERSION_HEX < =
0x03100000
> > >>>      ++#   define MODULE_NAME    MANGLE_MODULE_NAME("VBoxPython3_9=
")
> > >>>      ++#   define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPyt=
hon3_9)
> > >>>      ++
> > >>>      ++#  elif   PY_VERSION_HEX >=3D 0x03080000 && PY_VERSION_HEX =
< 0x03090000
> > >>>      + #   define MODULE_NAME    MANGLE_MODULE_NAME("VBoxPython3_8=
")
> > >>>      + #   define initVBoxPython MANGLE_MODULE_INIT(PyInit_VBoxPyt=
hon3_8)
> > >>>      +
> > >>>      +--
> > >>>      +2.30.0
> > >>>      +
> > >>>      diff --git
> > >>>      a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
002-Backport-5.10-fixes.patch
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
002-Backport-5.10-fixes.patch
> > >>>      new file mode 100644
> > >>>      index 0000000000..f277ced902
> > >>>      --- /dev/null
> > >>>      +++
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0=
002-Backport-5.10-fixes.patch
> > >>>      @@ -0,0 +1,432 @@
> > >>>      +From ac018c7fe2215aab028615b2823cc8fba97cf8c2 Mon Sep 17 00:=
00:00 2001
> > >>>      +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.co=
m>>
> > >>>      +Date: Mon, 4 Jan 2021 19:54:52 -0800
> > >>>      +Subject: [PATCH 2/2] Backport 5.10 fixes
> > >>>      +
> > >>>      +Imported from
> > >>>      +https://raw.githubusercontent.com/archlinux/svntogit-communi=
ty/packages/virtualbox/trunk/020-linux-5-10.patch
> > >>>      <https://raw.githubusercontent.com/archlinux/svntogit-communi=
ty/packages/virtualbox/trunk/020-linux-5-10.patch>
> > >>>      +
> > >>>      +Signed-off-by: Khem Raj <raj.khem@gmail.com
> > >>>      <mailto:raj.khem@gmail.com>>
> > >>>      +---
> > >>>      + src/VBox/Additions/linux/drm/vbox_drv.h       | 10 +-
> > >>>      + src/VBox/Additions/linux/drm/vbox_fb.c        |  2 +-
> > >>>      + src/VBox/Additions/linux/drm/vbox_mode.c      |  2 +-
> > >>>      + src/VBox/Additions/linux/drm/vbox_ttm.c       | 99 ++++++++=
+++++++++--
> > >>>      + .../Additions/linux/sharedfolders/regops.c    |  5 +-
> > >>>      + .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 61 ++++++++=
+++-
> > >>>      + 6 files changed, 163 insertions(+), 16 deletions(-)
> > >>>      +
> > >>>      +diff --git a/src/VBox/Additions/linux/drm/vbox_drv.h
> > >>>      b/src/VBox/Additions/linux/drm/vbox_drv.h
> > >>>      +index c680f3b4..d21d023c 100644
> > >>>      +--- a/src/VBox/Additions/linux/drm/vbox_drv.h
> > >>>      ++++ b/src/VBox/Additions/linux/drm/vbox_drv.h
> > >>>      +@@ -175,6 +175,9 @@
> > >>>      + #include <drm/ttm/ttm_placement.h>
> > >>>      + #include <drm/ttm/ttm_memory.h>
> > >>>      + #include <drm/ttm/ttm_module.h>
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++# include <drm/ttm/ttm_resource.h>
> > >>>      ++#endif
> > >>>      +
> > >>>      + #include "vboxvideo_guest.h"
> > >>>      + #include "vboxvideo_vbe.h"
> > >>>      +@@ -444,7 +447,10 @@ int vbox_bo_create(struct drm_device *d=
ev, int
> > >>>      size, int align,
> > >>>      + int vbox_gem_create(struct drm_device *dev,
> > >>>      +                   u32 size, bool iskernel, struct drm_gem_o=
bject
> > >>>      **obj);
> > >>>      +
> > >>>      +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_a=
ddr);
> > >>>      ++#define VBOX_MEM_TYPE_VRAM   0x1
> > >>>      ++#define VBOX_MEM_TYPE_SYSTEM 0x2
> > >>>      ++
> > >>>      ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_=
addr);
> > >>>      + int vbox_bo_unpin(struct vbox_bo *bo);
> > >>>      +
> > >>>      + static inline int vbox_bo_reserve(struct vbox_bo *bo, bool =
no_wait)
> > >>>      +@@ -469,7 +475,7 @@ static inline void vbox_bo_unreserve(str=
uct
> > >>>      vbox_bo *bo)
> > >>>      +       ttm_bo_unreserve(&bo->bo);
> > >>>      + }
> > >>>      +
> > >>>      +-void vbox_ttm_placement(struct vbox_bo *bo, int domain);
> > >>>      ++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type);
> > >>>      + int vbox_bo_push_sysram(struct vbox_bo *bo);
> > >>>      + int vbox_mmap(struct file *filp, struct vm_area_struct *vma=
);
> > >>>      +
> > >>>      +diff --git a/src/VBox/Additions/linux/drm/vbox_fb.c
> > >>>      b/src/VBox/Additions/linux/drm/vbox_fb.c
> > >>>      +index 811d0040..44b1ef52 100644
> > >>>      +--- a/src/VBox/Additions/linux/drm/vbox_fb.c
> > >>>      ++++ b/src/VBox/Additions/linux/drm/vbox_fb.c
> > >>>      +@@ -295,7 +295,7 @@ static int vboxfb_create(struct drm_fb_h=
elper
> > >>>      *helper,
> > >>>      +       if (ret)
> > >>>      +               return ret;
> > >>>      +
> > >>>      +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, NULL);
> > >>>      ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, NULL);
> > >>>      +       if (ret) {
> > >>>      +               vbox_bo_unreserve(bo);
> > >>>      +               return ret;
> > >>>      +diff --git a/src/VBox/Additions/linux/drm/vbox_mode.c
> > >>>      b/src/VBox/Additions/linux/drm/vbox_mode.c
> > >>>      +index 1e2691fd..52fd10fd 100644
> > >>>      +--- a/src/VBox/Additions/linux/drm/vbox_mode.c
> > >>>      ++++ b/src/VBox/Additions/linux/drm/vbox_mode.c
> > >>>      +@@ -227,7 +227,7 @@ static int vbox_crtc_set_base(struct drm=
_crtc
> > >>>      *crtc,
> > >>>      +       if (ret)
> > >>>      +               return ret;
> > >>>      +
> > >>>      +-      ret =3D vbox_bo_pin(bo, TTM_PL_FLAG_VRAM, &gpu_addr);
> > >>>      ++      ret =3D vbox_bo_pin(bo, VBOX_MEM_TYPE_VRAM, &gpu_addr=
);
> > >>>      +       vbox_bo_unreserve(bo);
> > >>>      +       if (ret)
> > >>>      +               return ret;
> > >>>      +diff --git a/src/VBox/Additions/linux/drm/vbox_ttm.c
> > >>>      b/src/VBox/Additions/linux/drm/vbox_ttm.c
> > >>>      +index 4e990843..ee2da4aa 100644
> > >>>      +--- a/src/VBox/Additions/linux/drm/vbox_ttm.c
> > >>>      ++++ b/src/VBox/Additions/linux/drm/vbox_ttm.c
> > >>>      +@@ -41,6 +41,7 @@
> > >>>      + #define PLACEMENT_FLAGS(placement) ((placement).flags)
> > >>>      + #endif
> > >>>      +
> > >>>      ++
> > >>>      + static inline struct vbox_private *vbox_bdev(struct ttm_bo_=
device *bd)
> > >>>      + {
> > >>>      +       return container_of(bd, struct vbox_private, ttm.bdev=
);
> > >>>      +@@ -125,6 +126,7 @@ static bool vbox_ttm_bo_is_vbox_bo(struc=
t
> > >>>      ttm_buffer_object *bo)
> > >>>      +       return false;
> > >>>      + }
> > >>>      +
> > >>>      ++#if RTLNX_VER_MAX(5,10,0)
> > >>>      + static int
> > >>>      + vbox_bo_init_mem_type(struct ttm_bo_device *bdev, u32 type,
> > >>>      +                     struct ttm_mem_type_manager *man)
> > >>>      +@@ -148,6 +150,7 @@ vbox_bo_init_mem_type(struct ttm_bo_devi=
ce
> > >>>      *bdev, u32 type,
> > >>>      +
> > >>>      +       return 0;
> > >>>      + }
> > >>>      ++#endif
> > >>>      +
> > >>>      + static void
> > >>>      + vbox_bo_evict_flags(struct ttm_buffer_object *bo, struct
> > >>>      ttm_placement *pl)
> > >>>      +@@ -157,7 +160,7 @@ vbox_bo_evict_flags(struct ttm_buffer_ob=
ject
> > >>>      *bo, struct ttm_placement *pl)
> > >>>      +       if (!vbox_ttm_bo_is_vbox_bo(bo))
> > >>>      +               return;
> > >>>      +
> > >>>      +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_SYSTEM);
> > >>>      ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_SYSTEM);
> > >>>      +       *pl =3D vboxbo->placement;
> > >>>      + }
> > >>>      +
> > >>>      +@@ -167,11 +170,12 @@ static int vbox_bo_verify_access(struc=
t
> > >>>      ttm_buffer_object *bo,
> > >>>      +       return 0;
> > >>>      + }
> > >>>      +
> > >>>      ++#if RTLNX_VER_MAX(5,10,0)
> > >>>      + static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev,
> > >>>      +                                  struct ttm_mem_reg *mem)
> > >>>      + {
> > >>>      +-      struct ttm_mem_type_manager *man =3D &bdev->man[mem->=
mem_type];
> > >>>      +       struct vbox_private *vbox =3D vbox_bdev(bdev);
> > >>>      ++      struct ttm_mem_type_manager *man =3D &bdev->man[mem->=
mem_type];
> > >>>      +
> > >>>      +       mem->bus.addr =3D NULL;
> > >>>      +       mem->bus.offset =3D 0;
> > >>>      +@@ -194,12 +198,53 @@ static int vbox_ttm_io_mem_reserve(str=
uct
> > >>>      ttm_bo_device *bdev,
> > >>>      +       }
> > >>>      +       return 0;
> > >>>      + }
> > >>>      ++#else
> > >>>      ++static int vbox_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev,
> > >>>      ++                                 struct ttm_resource *mem)
> > >>>      ++{
> > >>>      ++      struct vbox_private *vbox =3D vbox_bdev(bdev);
> > >>>      ++      mem->bus.addr =3D NULL;
> > >>>      ++      mem->bus.offset =3D 0;
> > >>>      ++      mem->size =3D mem->num_pages << PAGE_SHIFT;
> > >>>      ++      mem->start =3D 0;
> > >>>      ++      mem->bus.is_iomem =3D false;
> > >>>      ++      switch (mem->mem_type) {
> > >>>      ++      case TTM_PL_SYSTEM:
> > >>>      ++              /* system memory */
> > >>>      ++              return 0;
> > >>>      ++      case TTM_PL_VRAM:
> > >>>      ++              mem->bus.offset =3D mem->start << PAGE_SHIFT;
> > >>>      ++              mem->start =3D pci_resource_start(vbox->dev->=
pdev, 0);
> > >>>      ++              mem->bus.is_iomem =3D true;
> > >>>      ++              break;
> > >>>      ++      default:
> > >>>      ++              return -EINVAL;
> > >>>      ++      }
> > >>>      ++      return 0;
> > >>>      ++}
> > >>>      ++#endif
> > >>>      +
> > >>>      ++
> > >>>      ++
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev=
,
> > >>>      ++                               struct ttm_resource *mem)
> > >>>      ++{
> > >>>      ++}
> > >>>      ++#else
> > >>>      + static void vbox_ttm_io_mem_free(struct ttm_bo_device *bdev=
,
> > >>>      +                                struct ttm_mem_reg *mem)
> > >>>      + {
> > >>>      + }
> > >>>      ++#endif
> > >>>      +
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++static void vbox_ttm_tt_destroy(struct ttm_bo_device *bdev,=
 struct
> > >>>      ttm_tt *tt)
> > >>>      ++{
> > >>>      ++      ttm_tt_fini(tt);
> > >>>      ++      kfree(tt);
> > >>>      ++}
> > >>>      ++#else
> > >>>      + static void vbox_ttm_backend_destroy(struct ttm_tt *tt)
> > >>>      + {
> > >>>      +       ttm_tt_fini(tt);
> > >>>      +@@ -209,6 +254,7 @@ static void vbox_ttm_backend_destroy(str=
uct
> > >>>      ttm_tt *tt)
> > >>>      + static struct ttm_backend_func vbox_tt_backend_func =3D {
> > >>>      +       .destroy =3D &vbox_ttm_backend_destroy,
> > >>>      + };
> > >>>      ++#endif
> > >>>      +
> > >>>      + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> > >>>      !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> > >>>      + static struct ttm_tt *vbox_ttm_tt_create(struct ttm_bo_devi=
ce *bdev,
> > >>>      +@@ -226,7 +272,9 @@ static struct ttm_tt *vbox_ttm_tt_create=
(struct
> > >>>      ttm_buffer_object *bo,
> > >>>      +       if (!tt)
> > >>>      +               return NULL;
> > >>>      +
> > >>>      ++#if RTLNX_VER_MAX(5,10,0)
> > >>>      +       tt->func =3D &vbox_tt_backend_func;
> > >>>      ++#endif
> > >>>      + #if RTLNX_VER_MAX(4,17,0) && !RTLNX_RHEL_MAJ_PREREQ(7,6) &&
> > >>>      !RTLNX_SUSE_MAJ_PREREQ(15,1) && !RTLNX_SUSE_MAJ_PREREQ(12,5)
> > >>>      +       if (ttm_tt_init(tt, bdev, size, page_flags, dummy_rea=
d_page)) {
> > >>>      + #else
> > >>>      +@@ -261,11 +309,16 @@ static void vbox_ttm_tt_unpopulate(str=
uct
> > >>>      ttm_tt *ttm)
> > >>>      +
> > >>>      + static struct ttm_bo_driver vbox_bo_driver =3D {
> > >>>      +       .ttm_tt_create =3D vbox_ttm_tt_create,
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++      .ttm_tt_destroy =3D vbox_ttm_tt_destroy,
> > >>>      ++#endif
> > >>>      + #if RTLNX_VER_MAX(4,17,0)
> > >>>      +       .ttm_tt_populate =3D vbox_ttm_tt_populate,
> > >>>      +       .ttm_tt_unpopulate =3D vbox_ttm_tt_unpopulate,
> > >>>      + #endif
> > >>>      ++#if RTLNX_VER_MAX(5,10,0)
> > >>>      +       .init_mem_type =3D vbox_bo_init_mem_type,
> > >>>      ++#endif
> > >>>      + #if RTLNX_VER_MIN(4,10,0) || RTLNX_RHEL_MAJ_PREREQ(7,4)
> > >>>      +       .eviction_valuable =3D ttm_bo_eviction_valuable,
> > >>>      + #endif
> > >>>      +@@ -318,8 +371,13 @@ int vbox_mm_init(struct vbox_private *v=
box)
> > >>>      + #endif
> > >>>      +       }
> > >>>      +
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++      ret =3D ttm_range_man_init(bdev, TTM_PL_VRAM, false,
> > >>>      ++                           vbox->available_vram_size >> PAG=
E_SHIFT);
> > >>>      ++#else
> > >>>      +       ret =3D ttm_bo_init_mm(bdev, TTM_PL_VRAM,
> > >>>      +                            vbox->available_vram_size >> PAG=
E_SHIFT);
> > >>>      ++#endif
> > >>>      +       if (ret) {
> > >>>      +               DRM_ERROR("Failed ttm VRAM init: %d\n", ret);
> > >>>      +               goto err_device_release;
> > >>>      +@@ -359,7 +417,7 @@ void vbox_mm_fini(struct vbox_private *v=
box)
> > >>>      + #endif
> > >>>      + }
> > >>>      +
> > >>>      +-void vbox_ttm_placement(struct vbox_bo *bo, int domain)
> > >>>      ++void vbox_ttm_placement(struct vbox_bo *bo, u32 mem_type)
> > >>>      + {
> > >>>      +       u32 c =3D 0;
> > >>>      + #if RTLNX_VER_MAX(3,18,0) && !RTLNX_RHEL_MAJ_PREREQ(7,2)
> > >>>      +@@ -372,15 +430,36 @@ void vbox_ttm_placement(struct vbox_bo=
 *bo,
> > >>>      int domain)
> > >>>      +       bo->placement.placement =3D bo->placements;
> > >>>      +       bo->placement.busy_placement =3D bo->placements;
> > >>>      +
> > >>>      +-      if (domain & TTM_PL_FLAG_VRAM)
> > >>>      ++      if (mem_type & VBOX_MEM_TYPE_VRAM) {
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++              bo->placements[c].mem_type =3D TTM_PL_VRAM;
> > >>>      ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      ++                  TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED;
> > >>>      ++#else
> > >>>      +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      +                   TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
> > >>>      TTM_PL_FLAG_VRAM;
> > >>>      +-      if (domain & TTM_PL_FLAG_SYSTEM)
> > >>>      ++#endif
> > >>>      ++      }
> > >>>      ++      if (mem_type & VBOX_MEM_TYPE_SYSTEM) {
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> > >>>      ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      ++                  TTM_PL_MASK_CACHING;
> > >>>      ++#else
> > >>>      +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      +                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> > >>>      +-      if (!c)
> > >>>      ++#endif
> > >>>      ++      }
> > >>>      ++      if (!c) {
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++              bo->placements[c].mem_type =3D TTM_PL_SYSTEM;
> > >>>      ++              PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      ++                  TTM_PL_MASK_CACHING;
> > >>>      ++#else
> > >>>      +               PLACEMENT_FLAGS(bo->placements[c++]) =3D
> > >>>      +                   TTM_PL_MASK_CACHING | TTM_PL_FLAG_SYSTEM;
> > >>>      ++#endif
> > >>>      ++      }
> > >>>      +
> > >>>      +       bo->placement.num_placement =3D c;
> > >>>      +       bo->placement.num_busy_placement =3D c;
> > >>>      +@@ -414,7 +493,7 @@ int vbox_bo_create(struct drm_device *de=
v, int
> > >>>      size, int align,
> > >>>      +       vboxbo->bo.bdev->dev_mapping =3D dev->dev_mapping;
> > >>>      + #endif
> > >>>      +
> > >>>      +-      vbox_ttm_placement(vboxbo, TTM_PL_FLAG_VRAM |
> > >>>      TTM_PL_FLAG_SYSTEM);
> > >>>      ++      vbox_ttm_placement(vboxbo, VBOX_MEM_TYPE_VRAM |
> > >>>      VBOX_MEM_TYPE_SYSTEM);
> > >>>      +
> > >>>      +       acc_size =3D ttm_bo_dma_acc_size(&vbox->ttm.bdev, siz=
e,
> > >>>      +                                      sizeof(struct vbox_bo)=
);
> > >>>      +@@ -452,7 +531,7 @@ static inline u64 vbox_bo_gpu_offset(str=
uct
> > >>>      vbox_bo *bo)
> > >>>      + #endif
> > >>>      + }
> > >>>      +
> > >>>      +-int vbox_bo_pin(struct vbox_bo *bo, u32 pl_flag, u64 *gpu_a=
ddr)
> > >>>      ++int vbox_bo_pin(struct vbox_bo *bo, u32 mem_type, u64 *gpu_=
addr)
> > >>>      + {
> > >>>      + #if RTLNX_VER_MIN(4,16,0) || RTLNX_RHEL_MAJ_PREREQ(7,6) ||
> > >>>      RTLNX_SUSE_MAJ_PREREQ(15,1) || RTLNX_SUSE_MAJ_PREREQ(12,5)
> > >>>      +       struct ttm_operation_ctx ctx =3D { false, false };
> > >>>      +@@ -467,7 +546,7 @@ int vbox_bo_pin(struct vbox_bo *bo, u32
> > >>>      pl_flag, u64 *gpu_addr)
> > >>>      +               return 0;
> > >>>      +       }
> > >>>      +
> > >>>      +-      vbox_ttm_placement(bo, pl_flag);
> > >>>      ++      vbox_ttm_placement(bo, mem_type);
> > >>>      +
> > >>>      +       for (i =3D 0; i < bo->placement.num_placement; i++)
> > >>>      +               PLACEMENT_FLAGS(bo->placements[i]) |=3D
> > >>>      TTM_PL_FLAG_NO_EVICT;
> > >>>      +@@ -540,7 +619,7 @@ int vbox_bo_push_sysram(struct vbox_bo *=
bo)
> > >>>      +       if (bo->kmap.virtual)
> > >>>      +               ttm_bo_kunmap(&bo->kmap);
> > >>>      +
> > >>>      +-      vbox_ttm_placement(bo, TTM_PL_FLAG_SYSTEM);
> > >>>      ++      vbox_ttm_placement(bo, VBOX_MEM_TYPE_SYSTEM);
> > >>>      +
> > >>>      +       for (i =3D 0; i < bo->placement.num_placement; i++)
> > >>>      +               PLACEMENT_FLAGS(bo->placements[i]) |=3D
> > >>>      TTM_PL_FLAG_NO_EVICT;
> > >>>      +diff --git a/src/VBox/Additions/linux/sharedfolders/regops.c
> > >>>      b/src/VBox/Additions/linux/sharedfolders/regops.c
> > >>>      +index 3ad9c566..ec298a1b 100644
> > >>>      +--- a/src/VBox/Additions/linux/sharedfolders/regops.c
> > >>>      ++++ b/src/VBox/Additions/linux/sharedfolders/regops.c
> > >>>      +@@ -1401,7 +1401,10 @@ static int
> > >>>      vbsf_lock_user_pages_failed_check_kernel(uintptr_t uPtrFrom, =
size_t c
> > >>>      +     /*
> > >>>      +      * Check that this is valid user memory that is actuall=
y in
> > >>>      the kernel range.
> > >>>      +      */
> > >>>      +-#if RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> > >>>      ++#if RTLNX_VER_MIN(5,10,0)
> > >>>      ++    if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT=
)
> > >>>      ++        && uPtrFrom >=3D TASK_SIZE_MAX)
> > >>>      ++#elif RTLNX_VER_MIN(5,0,0) || RTLNX_RHEL_MIN(8,1)
> > >>>      +     if (   access_ok((void *)uPtrFrom, cPages << PAGE_SHIFT=
)
> > >>>      +         && uPtrFrom >=3D USER_DS.seg)
> > >>>      + #else
> > >>>      +diff --git a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux=
.c
> > >>>      b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> > >>>      +index c771c1ba..a34eb149 100644
> > >>>      +--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> > >>>      ++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
> > >>>      +@@ -56,9 +56,12 @@
> > >>>      +  * Whether we use alloc_vm_area (3.2+) for executable memor=
y.
> > >>>      +  * This is a must for 5.8+, but we enable it all the way ba=
ck to
> > >>>      3.2.x for
> > >>>      +  * better W^R compliance (fExecutable flag). */
> > >>>      +-#if RTLNX_VER_MIN(3,2,0) || defined(DOXYGEN_RUNNING)
> > >>>      ++#if RTLNX_VER_RANGE(3,2,0, 5,10,0) || defined(DOXYGEN_RUNNI=
NG)
> > >>>      + # define IPRT_USE_ALLOC_VM_AREA_FOR_EXEC
> > >>>      + #endif
> > >>>      ++#if RTLNX_VER_MIN(5,10,0) || defined(DOXYGEN_RUNNING)
> > >>>      ++# define IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> > >>>      ++#endif
> > >>>      +
> > >>>      + /*
> > >>>      +  * 2.6.29+ kernels don't work with remap_pfn_range() anymor=
e because
> > >>>      +@@ -502,6 +505,42 @@ static void
> > >>>      rtR0MemObjLinuxFreePages(PRTR0MEMOBJLNX pMemLnx)
> > >>>      + }
> > >>>      +
> > >>>      +
> > >>>      ++#ifdef IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC
> > >>>      ++/**
> > >>>      ++ * User data passed to the apply_to_page_range() callback.
> > >>>      ++ */
> > >>>      ++typedef struct LNXAPPLYPGRANGE
> > >>>      ++{
> > >>>      ++    /** Pointer to the memory object. */
> > >>>      ++    PRTR0MEMOBJLNX pMemLnx;
> > >>>      ++    /** The page protection flags to apply. */
> > >>>      ++    pgprot_t       fPg;
> > >>>      ++} LNXAPPLYPGRANGE;
> > >>>      ++/** Pointer to the user data. */
> > >>>      ++typedef LNXAPPLYPGRANGE *PLNXAPPLYPGRANGE;
> > >>>      ++/** Pointer to the const user data. */
> > >>>      ++typedef const LNXAPPLYPGRANGE *PCLNXAPPLYPGRANGE;
> > >>>      ++
> > >>>      ++/**
> > >>>      ++ * Callback called in apply_to_page_range().
> > >>>      ++ *
> > >>>      ++ * @returns Linux status code.
> > >>>      ++ * @param   pPte                Pointer to the page table e=
ntry
> > >>>      for the given address.
> > >>>      ++ * @param   uAddr               The address to apply the ne=
w
> > >>>      protection to.
> > >>>      ++ * @param   pvUser              The opaque user data.
> > >>>      ++ */
> > >>>      ++static DECLCALLBACK(int) rtR0MemObjLinuxApplyPageRange(pte_=
t
> > >>>      *pPte, unsigned long uAddr, void *pvUser)
> > >>>      ++{
> > >>>      ++    PCLNXAPPLYPGRANGE pArgs =3D (PCLNXAPPLYPGRANGE)pvUser;
> > >>>      ++    PRTR0MEMOBJLNX pMemLnx =3D pArgs->pMemLnx;
> > >>>      ++    uint32_t idxPg =3D (uAddr - (unsigned long)pMemLnx->Cor=
e.pv) >>
> > >>>      PAGE_SHIFT;
> > >>>      ++
> > >>>      ++    set_pte(pPte, mk_pte(pMemLnx->apPages[idxPg], pArgs->fP=
g));
> > >>>      ++    return 0;
> > >>>      ++}
> > >>>      ++#endif
> > >>>      ++
> > >>>      ++
> > >>>      + /**
> > >>>      +  * Maps the allocation into ring-0.
> > >>>      +  *
> > >>>      +@@ -584,6 +623,11 @@ static int rtR0MemObjLinuxVMap(PRTR0MEM=
OBJLNX
> > >>>      pMemLnx, bool fExecutable)
> > >>>      +         else
> > >>>      + # endif
> > >>>      +         {
> > >>>      ++#  if defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> > >>>      ++            if (fExecutable)
> > >>>      ++                pgprot_val(fPg) |=3D _PAGE_NX; /* Uses
> > >>>      RTR0MemObjProtect to clear NX when memory ready, W^X fashion.=
 */
> > >>>      ++#  endif
> > >>>      ++
> > >>>      + # ifdef VM_MAP
> > >>>      +             pMemLnx->Core.pv =3D vmap(&pMemLnx->apPages[0],
> > >>>      pMemLnx->cPages, VM_MAP, fPg);
> > >>>      + # else
> > >>>      +@@ -1851,6 +1895,21 @@ DECLHIDDEN(int)
> > >>>      rtR0MemObjNativeProtect(PRTR0MEMOBJINTERNAL pMem, size_t offS=
ub,
> > >>>      +         preempt_enable();
> > >>>      +         return VINF_SUCCESS;
> > >>>      +     }
> > >>>      ++# elif defined(IPRT_USE_APPLY_TO_PAGE_RANGE_FOR_EXEC)
> > >>>      ++    PRTR0MEMOBJLNX pMemLnx =3D (PRTR0MEMOBJLNX)pMem;
> > >>>      ++    if (   pMemLnx->fExecutable
> > >>>      ++        && pMemLnx->fMappedToRing0)
> > >>>      ++    {
> > >>>      ++        LNXAPPLYPGRANGE Args;
> > >>>      ++        Args.pMemLnx =3D pMemLnx;
> > >>>      ++        Args.fPg =3D rtR0MemObjLinuxConvertProt(fProt, true
> > >>>      /*fKernel*/);
> > >>>      ++        int rcLnx =3D apply_to_page_range(current->active_m=
m,
> > >>>      (unsigned long)pMemLnx->Core.pv + offSub, cbSub,
> > >>>      ++
> > >>>      rtR0MemObjLinuxApplyPageRange, (void *)&Args);
> > >>>      ++        if (rcLnx)
> > >>>      ++            return VERR_NOT_SUPPORTED;
> > >>>      ++
> > >>>      ++        return VINF_SUCCESS;
> > >>>      ++    }
> > >>>      + # endif
> > >>>      +
> > >>>      +     NOREF(pMem);
> > >>>      +--
> > >>>      +2.30.0
> > >>>      +
> > >>>      diff --git
> > >>>      a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6=
.1.16.bb <http://vboxguestdrivers_6.1.16.bb>
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6=
.1.16.bb <http://vboxguestdrivers_6.1.16.bb>
> > >>>      index 9282f663b4..fef7ffa954 100644
> > >>>      ---
> > >>>      a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6=
.1.16.bb <http://vboxguestdrivers_6.1.16.bb>
> > >>>      +++
> > >>>      b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6=
.1.16.bb <http://vboxguestdrivers_6.1.16.bb>
> > >>>      @@ -13,6 +13,8 @@ VBOX_NAME =3D "VirtualBox-${PV}"
> > >>>
> > >>>        SRC_URI =3D
> > >>>      "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}=
.tar.bz2 <http://download.virtualbox.org/virtualbox/$%7BPV%7D/$%7BVBOX_NAME=
%7D.tar.bz2>
> > >>>      \
> > >>>            file://Makefile.utils \
> > >>>      +    file://0001-support-python-5.9.patch \
> > >>>
> > >>>
> > >>> file://0001-support-python-3.9.patch
> > >>>
> > >>>      +    file://0002-Backport-5.10-fixes.patch \
> > >>>        "
> > >>>        SRC_URI[md5sum] =3D "a12a647f6c114f2cb1571089b36841fe"
> > >>>        SRC_URI[sha256sum] =3D
> > >>>      "49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2=
f9f1"
> > >>>      --
> > >>>      2.30.0
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>> --
> > >>> best regards,
> > >>> Jos=C3=A9 Quaresma
> > >>
> > >>=20
> > >>
> > >
> > >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
