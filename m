Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A0AC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 04:07:37 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.13759.1742530053290428494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 21:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J4vxQKCR;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f6eaa017d0so1204171b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 21:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742530052; x=1743134852; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um7dYCuaDdcr69nQ10CYeThY8F8Vwe85cPv6bNRBvXM=;
        b=J4vxQKCRIQ1ueclCnZb38uNSmq+h1qBnJ3CFqHxAtPwSW8U9fp6+/KGUkro8yXygP0
         X3M2ngm96KilTUi/O3eui3kgSwlXzPrMpmehg+YYZVO/Yx6DAp3JwFs3c4xlVRADqtL1
         5q54Xh3u4GVxghxt82t+U1OWpclSNp7d573RJn/xgf1zJAUCezxlkO70f2CTW6JKxfXZ
         Huvum1OGs3gLGx2oQSHtSnUaxT2KxF0U/AN2ank1yUFwUgPmRjZHK24bcZG0XWb4YKTS
         kM0zL7zdT2T0pxIZTOWxKPf5XmGU2k0WtC0yJMdlPHFtSbMzzU2cPSteewgKf+tFGplm
         br4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742530052; x=1743134852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um7dYCuaDdcr69nQ10CYeThY8F8Vwe85cPv6bNRBvXM=;
        b=BGSACXWlYUJ8E6469ZAJWw1L/DAx53YsRaGHNc5XWy3RDhKcJ0iGoi5XgDVrac8fLu
         GGXo3JSkFAWeeIBLq9+AlZhn/Oe5FxHxT4ga+MCycRRCliwssLFMwQRCGwQ4T8u/l9HT
         6IfU81QopKeOlFlyrSCMeX+UZRKUW072rB407LtYJXl+hJbGvsDt/ofKDZKJ656wH4fd
         3Vi+/5WpN6sBiwMDW7XUP7e9YlGz8O4t0yPSv1c6yOWi6Q0hPrykFfV0SqP6SQWNL++n
         39S7lGy+EKVlFDMHJrr3LxKKWBvWPXLZVv0gdd1ZNmsVuqTVYk+6vDWC/hh0TgE+8StA
         /Lhg==
X-Gm-Message-State: AOJu0Yxqs4GUOxpdrR8JD6XjPOryfAA2NBNbg+e1JyL1XQoTNexIRtGg
	pi5uiIuzg9MueSQlJI0C1DfifUQ2AwYr7bSvjB2XAMK4t/qDY/BEgrrnEmZM+E901m+rdvtO5aT
	ZRS0uZCLCHD26gtKgr5QSFeaTqVs=
X-Gm-Gg: ASbGnct/5CFyKt/bss89Fmam2UvdZLKS3XRLooVtVs32LgGc8hT4F1gIB8tnAPwwqru
	SnF35UZbpvqlUF7tDxASTTfKkUYGdP/+vvZCmWsxHBF5cWZqfu5EB/FQsrZfmyGhpesO7GEgrS5
	5VIwJGDiK181NVdzmubEy1FeM9
X-Google-Smtp-Source: AGHT+IFLjeP5+gu5GbeIbw0mocHYanD81LLcAiINqeetpwFZCCOP0VX830EfJ4kQIFllN0k8LbyVEc6+fmMzYRsUo4I=
X-Received: by 2002:a05:6808:6507:b0:3f9:d5a2:8999 with SMTP id
 5614622812f47-3febf70a54fmr1132539b6e.3.1742530052389; Thu, 20 Mar 2025
 21:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1742528342-27448-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 21:07:06 -0700
X-Gm-Features: AQ5f1JqhPeSRyotsRiOBrR3JQA5oasoSCeD4EWzp2j4Tv3y_QQ1QA21zrcpMpf4
Message-ID: <CAMKF1sp2zZUw4L1o50zJneRQAnrrdmTOGNsw+r5zcGr1gQpvig@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 1/4] flashrom: upgrade 1.4.0 -> 1.5.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 04:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116161

Can you rebase this patch on top of master-next and resend ?

On Thu, Mar 20, 2025 at 8:39=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
> since it's not available in 1.5.1
>
> 0001-linux_mtd-fix-build-with-clang-19.patch
> removed since it's included in 1.5.1
>
> 0002-meson-Add-options-pciutils-ftdi-usb.patch
> refreshed for 1.5.1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...SCV-as-non-memory-mapped-I-O-archite.patch | 30 --------------
>  ...01-linux_mtd-fix-build-with-clang-19.patch | 39 -------------------
>  ...-meson-Add-options-pciutils-ftdi-usb.patch | 13 ++++---
>  .../{flashrom_1.4.0.bb =3D> flashrom_1.5.1.bb}  |  4 +-
>  4 files changed, 8 insertions(+), 78 deletions(-)
>  delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-M=
ark-RISCV-as-non-memory-mapped-I-O-archite.patch
>  delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-=
fix-build-with-clang-19.patch
>  rename meta-oe/recipes-bsp/flashrom/{flashrom_1.4.0.bb =3D> flashrom_1.5=
.1.bb} (75%)
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RIS=
CV-as-non-memory-mapped-I-O-archite.patch b/meta-oe/recipes-bsp/flashrom/fl=
ashrom/0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch
> deleted file mode 100644
> index 58f1aa4d43..0000000000
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-flashrom-Mark-RISCV-as-n=
on-memory-mapped-I-O-archite.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From bf5a30ef30818973eb2cfac792b80c642df8a721 Mon Sep 17 00:00:00 2001
> -From: Patrick Rudolph <patrick.rudolph@9elements.com>
> -Date: Mon, 14 Oct 2024 11:01:37 +0200
> -Subject: [oe] [meta-oe] [PATCH 1/2] flashrom: Mark RISCV as non memory-m=
apped I/O
> - architecture
> -
> -Upstream-Status: Inactive-Upstream
> -
> -Change-Id: I46d7ede7af61e7fca631e1d465100e65c6ddeee9
> -Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 97f56b83..08e4c595 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -372,7 +372,7 @@ endif
> - # Additionally disable all drivers needing raw access (memory, PCI, por=
t I/O)
> - # on architectures with unknown raw access properties.
> - # Right now those architectures are alpha hppa m68k sh s390
> --ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k))
> -+ifneq ($(ARCH), $(filter $(ARCH), x86 mips ppc arm sparc arc e2k riscv)=
)
> - $(call mark_unsupported,$(DEPENDS_ON_RAW_MEM_ACCESS))
> - endif
> -
> ---
> -2.46.2
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-bui=
ld-with-clang-19.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_m=
td-fix-build-with-clang-19.patch
> deleted file mode 100644
> index 46bd0bba44..0000000000
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with=
-clang-19.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 615fae91dafdb89f0f8418129918dbb7ff879cf6 Mon Sep 17 00:00:00 2001
> -From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> -Date: Thu, 24 Oct 2024 17:51:29 +0200
> -Subject: [PATCH] linux_mtd: fix build with clang >=3D 19
> -
> -Starting with version 19, clang issues a warning when using `strlen()`
> -for initializing a static array's size. This causes the build to fail as
> -the project also sets `-Werror`.
> -
> -This is fixed by using `sizeof()` instead, which is guaranteed to be
> -evaluated at compilation time and therefore not triggering the
> -problematic warning.
> -
> -Upstream-Status: Backport [https://github.com/flashrom/flashrom/commit/3=
4b1a6aa57e910c0b5a518e8a0cab6841c7efaee]
> -
> -Change-Id: If470a65702e9ae08e4303123a0014e53a1fee56e
> -Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> -Reviewed-on: https://review.coreboot.org/c/flashrom/+/84856
> -Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
> -Reviewed-by: Maximilian Brune <maximilian.brune@9elements.com>
> -Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - linux_mtd.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/linux_mtd.c b/linux_mtd.c
> -index eea0cf2..0cb2330 100644
> ---- a/linux_mtd.c
> -+++ b/linux_mtd.c
> -@@ -49,7 +49,7 @@ static int read_sysfs_string(const char *sysfs_path, c=
onst char *filename, char
> -       int i;
> -       size_t bytes_read;
> -       FILE *fp;
> --      char path[strlen(LINUX_MTD_SYSFS_ROOT) + 32];
> -+      char path[sizeof(LINUX_MTD_SYSFS_ROOT) + 31];
> -
> -       snprintf(path, sizeof(path), "%s/%s", sysfs_path, filename);
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options=
-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson=
-Add-options-pciutils-ftdi-usb.patch
> index bc43f17e9a..8dfed855b4 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciuti=
ls-ftdi-usb.patch
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciuti=
ls-ftdi-usb.patch
> @@ -16,10 +16,10 @@ Signed-off-by: Patrick Rudolph <patrick.rudolph@9elem=
ents.com>
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index ae56b26c..21093a7f 100644
> +index 6c8d3d3..61b794d 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -151,9 +151,9 @@ systems_serial     =3D [ 'linux', 'openbsd', 'freebs=
d', 'dragonfly', 'netbsd', 'da
> +@@ -150,9 +150,9 @@ systems_serial     =3D [ 'linux', 'openbsd', 'freebs=
d', 'dragonfly', 'netbsd', 'da
>
>   cpus_port_io =3D [ 'x86', 'x86_64' ]
>
> @@ -33,16 +33,17 @@ index ae56b26c..21093a7f 100644
>   group_serial =3D get_option('programmer').contains('group_serial')
>   group_jlink  =3D get_option('programmer').contains('group_jlink')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 8a04114d..ae722509 100644
> +index 87456a9..570b152 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -25,3 +25,6 @@ option('ni845x_search_path', type : 'string', value : =
'C:\Program Files (x86)\Na
> - option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100=
000,
> +@@ -24,4 +24,7 @@ option('ni845x_search_path', type : 'string', value : =
'C:\Program Files (x86)\Na
> + option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100=
,
>          description : 'Minimum time in microseconds to suspend execution=
 for (rather than polling) when a delay is required.'
>                      + ' Larger values may perform better on machines wit=
h low timer resolution, at the cost of increased power.')
>  +option('pciutils', type : 'boolean', value : false, description : 'Sele=
ct programmer group pci')
>  +option('usb', type : 'boolean', value : false, description : 'Select pr=
ogrammer group usb')
>  +option('ftdi', type : 'boolean', value : false, description : 'Select p=
rogrammer group ftdi')
> + option('rpmc', type : 'feature', value : 'auto', description : 'Support=
 for Replay Protected Monotonic Counter (RPMC) commands as specified by JES=
D260')
>  --
> -2.46.2
> +2.43.0
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb b/meta-oe/rec=
ipes-bsp/flashrom/flashrom_1.5.1.bb
> similarity index 75%
> rename from meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
> rename to meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> index 6c5d05f2d0..9a8e81bae3 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> @@ -4,12 +4,10 @@ HOMEPAGE =3D "http://flashrom.org"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>  SRC_URI =3D "https://download.flashrom.org/releases/flashrom-v${PV}.tar.=
xz \
> -           file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-arch=
ite.patch \
>             file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
> -           file://0001-linux_mtd-fix-build-with-clang-19.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "eb0eb3e61a57fd1926c66f08664cf04a96f92cee23b600cf=
563087c2178d70d8"
> +SRC_URI[sha256sum] =3D "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef7=
32e47b6e485b6293"
>
>  S =3D "${WORKDIR}/flashrom-v${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116157): https://lists.openembedded.org/g/openembedde=
d-devel/message/116157
> Mute This Topic: https://lists.openembedded.org/mt/111822476/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

