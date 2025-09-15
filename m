Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EF9CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 16:04:22 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.38037.1757952259514311697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 09:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLs9sYZm;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d60501806so32362777b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757952258; x=1758557058; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U55/0RfzhGEq6o6cGB1KXWzA6Zb05tuOFMCvFPF8iE=;
        b=fLs9sYZmP6a7uTN/NazveS/ZI/2AlfaytzBuPlKtrfCHjc0XUAsOfAc/I+V3IChRo0
         gDSII8YfiGOK+eV1tEcaru9Dq14NheKIPYzwjpFMLHuuEk3O1tAZeOc1xkT1gDHh41zT
         bPlS/0QIu5Y3wV+TxeJ2duBSNKfiWejm08IxV4eqUnDePxQyA8sHknxZCpvLv+lhDBKu
         a1XR47fEBopBUTqizWENTBX1tYo9fFWFBDpLr2aHjl60/U26+Xt5Hqtwn+noIvJ9CShL
         b2UmiYDZM/8Sut1zo4oHDjkJdjNg/4vUJqXJQleH5pQzVoD4WVr77szjJJyXrksd+OaH
         5Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757952259; x=1758557059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5U55/0RfzhGEq6o6cGB1KXWzA6Zb05tuOFMCvFPF8iE=;
        b=NiOsN+Zj6h8TZE941peiZzNovql5PquIuvVhgTUvOVWGseGMQdjdgaFWF+9GChcrmi
         6UHJKZ2paVsLKbjDOCwEu2QPXkXcZSWdBw5fD3Akg25qSrqziLRVc2+avZcEm3eXurDt
         wrYpxnf4V2datNYSYjWN0igJxjDh54vz/DGvBG7FDE4I8xc5jYG5I+Es0iR3rBn0WeBg
         cnKL3+/fUJBX5bXAjHSP6YQ8HUCrq3IwublnAbkN1S+MB1KEVjV6Xfoe3LB+XzhLpE1g
         AXc+/F2FfXCjIbmhARh28dxUP/saio2bz0watCY0EajlgcVcar8iHdeq6iTYo43UJUbF
         aOUg==
X-Gm-Message-State: AOJu0YyAocax1UXm6gh3cX3MlcQqgkLE91Z/VJLNLBorGxafwOats8jg
	H86gcAkA0kQPvLp9lyca4C30lbjqgApmTBmVcVgb6Dama7Nuzis0UPNla48riSJ9uJGLKrYabV3
	3a14gC4uCbQMAEG8yCZx+o84bdgMd71cxoKTYhQc=
X-Gm-Gg: ASbGncuzxA17e/6wizrw9U2A7vBoYmAGj0nbnKk5XBnclvjnKIUvHA/vDZvwAZlbc8U
	FJDH7AKO1i6X/NQwLwSBYguzHKNYwBZ5FpEoqeYSPIQhEjxA/0wOaTPnsYL2/4nAWaohiiJwqrE
	LYLGDEswl0O7C3exRnlNfLCNBPvNc8EcEzByWfGQnkHKb2rduFG97itdM5sVdvI3ZrHcu37L27t
	cfUwpCVUl41jfztX4guD69EQxH3Hbu/i22hNTaVfs7XJacO2E+4GoGNaFmdFgCF9yK73CsT8gBm
	iJrBirBtrfnO+poBKs9w2rI/jksgDzYNibL3K3mKlzG6lukNhee6HM1tOA==
X-Google-Smtp-Source: AGHT+IH4Eq3CdJQjUSXNZythoOZkoCfEwbd8zUke1T+CVyfSIrx1/4h6nfNTYa0usJ0/1btodirGEzPFvLsAx/5xDeo=
X-Received: by 2002:a05:690c:c81:b0:723:88f6:c332 with SMTP id
 00721157ae682-73063385087mr111151707b3.18.1757952256774; Mon, 15 Sep 2025
 09:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250913172226.3215251-1-skandigraun@gmail.com>
In-Reply-To: <20250913172226.3215251-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2025 09:03:50 -0700
X-Gm-Features: Ac12FXxoRUibHAT53pPMJjFPP0f1ASnzxA9Iy0Jz6eZHUeYq3-PT5nlRyYyiG4A
Message-ID: <CAMKF1srStOszN6yzPCZ+gPs4eabtq2XMuS+js1eVDngyBK3QNA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: upgrade 0.4.0 -> 0.5.2
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 16:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119410

It ends up with build failures where its trying to fetch a sub module
during configure, we either need to do it during fetch or disable use
of it.

https://errors.yoctoproject.org/Errors/Details/882653/

On Sat, Sep 13, 2025 at 10:22=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Dropped 0001-media_device-Add-bool-return-type-to-unlock.patch, because
> the issue has been solved by upstream.
>
> Dropped 0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch,
> because it is included in this release.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...evice-Add-bool-return-type-to-unlock.patch | 59 -------------------
>  ...ssing-stdint.h-include-to-dma_buf_al.patch | 38 ------------
>  ...{libcamera_0.4.0.bb =3D> libcamera_0.5.2.bb} |  6 +-
>  3 files changed, 2 insertions(+), 101 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-media_device-Add-bool-return-type-to-unlock.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.4.0.bb =
=3D> libcamera_0.5.2.bb} (90%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
media_device-Add-bool-return-type-to-unlock.patch b/meta-multimedia/recipes=
-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-u=
nlock.patch
> deleted file mode 100644
> index 12f034effd..0000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_d=
evice-Add-bool-return-type-to-unlock.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 6914c4fd3d53c0c6ea304123bf57429bb64ec16f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 31 Jan 2024 21:01:27 -0800
> -Subject: [PATCH 1/2] media_device: Add bool return type to unlock()
> -
> -unlock uses lockf which is marked with __attribute__
> -((warn_unused_result)) and compilers warn about it and some treat
> --Wunused-result as error with -Werror turned on, It would be good to
> -check if lockf failed or succeeded, however, that piece is not changed
> -with this, this fixes build with clang++ 18
> -
> -    ../git/src/libcamera/media_device.cpp:167:2: error: ignoring return =
value of function declared with 'warn_unused_result' attribute [-Werror,-Wu=
nused-result]
> -      167 |         lockf(fd_.get(), F_ULOCK, 0);
> -          |         ^~~~~ ~~~~~~~~~~~~~~~~~~~~~
> -    1 error generated.
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2024-February/040380.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - include/libcamera/internal/media_device.h | 2 +-
> - src/libcamera/media_device.cpp            | 6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/include/libcamera/internal/media_device.h b/include/libcame=
ra/internal/media_device.h
> -index eb8cfde4..b09dfd16 100644
> ---- a/include/libcamera/internal/media_device.h
> -+++ b/include/libcamera/internal/media_device.h
> -@@ -33,7 +33,7 @@ public:
> -       bool busy() const { return acquired_; }
> -
> -       bool lock();
> --      void unlock();
> -+      bool unlock();
> -
> -       int populate();
> -       bool isValid() const { return valid_; }
> -diff --git a/src/libcamera/media_device.cpp b/src/libcamera/media_device=
.cpp
> -index 2949816b..eaa2fdb0 100644
> ---- a/src/libcamera/media_device.cpp
> -+++ b/src/libcamera/media_device.cpp
> -@@ -159,12 +159,12 @@ bool MediaDevice::lock()
> -  *
> -  * \sa lock()
> -  */
> --void MediaDevice::unlock()
> -+bool MediaDevice::unlock()
> - {
> -       if (!fd_.isValid())
> --              return;
> -+              return false;
> -
> --      lockf(fd_.get(), F_ULOCK, 0);
> -+      return lockf(fd_.get(), F_ULOCK, 0) =3D=3D 0;
> - }
> -
> - /**
> ---
> -2.43.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-=
libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch b/meta-multimedi=
a/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.=
h-include-to-dma_buf_al.patch
> deleted file mode 100644
> index 18ba353de2..0000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcame=
ra-Add-missing-stdint.h-include-to-dma_buf_al.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 91de550243121056984e5b9b693b486860655d31 Mon Sep 17 00:00:00 2001
> -From: Sergei Trofimovich <slyich@gmail.com>
> -Date: Sat, 28 Dec 2024 19:11:19 +0000
> -Subject: [PATCH] libcamera: Add missing <stdint.h> include to
> - dma_buf_allocator.h
> -
> -Without the change the build fails on upcoming `gcc-15` as:
> -
> -    In file included from ../src/libcamera/dma_buf_allocator.cpp:9:
> -    ../include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uin=
t64_t' has not been declared
> -       66 |         void sync(uint64_t step);
> -          |                   ^~~~~~~~
> -
> -Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
> -Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> -Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -
> -Upstream-Status: Backport [https://git.libcamera.org/libcamera/libcamera=
.git/commit/?id=3D91de550243121056984e5b9b693b486860655d31]
> ----
> - include/libcamera/internal/dma_buf_allocator.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/libcamera/internal/dma_buf_allocator.h b/include/li=
bcamera/internal/dma_buf_allocator.h
> -index d26f8a74..13600915 100644
> ---- a/include/libcamera/internal/dma_buf_allocator.h
> -+++ b/include/libcamera/internal/dma_buf_allocator.h
> -@@ -8,6 +8,7 @@
> - #pragma once
> -
> - #include <memory>
> -+#include <stdint.h>
> - #include <string>
> - #include <vector>
> -
> ---
> -2.34.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
> similarity index 90%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
> index c7fe631a43..d1b4af2d90 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
> @@ -9,12 +9,10 @@ LIC_FILES_CHKSUM =3D "\
>  "
>
>  SRC_URI =3D " \
> -        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
> -        file://0001-media_device-Add-bool-return-type-to-unlock.patch \
> -        file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al=
.patch \
> +        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV} \
>  "
>
> -SRCREV =3D "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
> +SRCREV =3D "096c50ca881f72d858aca19757a5e73b4775a7cc"
>
>  PE =3D "1"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119388): https://lists.openembedded.org/g/openembedde=
d-devel/message/119388
> Mute This Topic: https://lists.openembedded.org/mt/115226223/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

