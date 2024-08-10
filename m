Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C2FC3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 13:40:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.5971.1723297200877933533
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3+Rqp56;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso2355531a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723297200; x=1723902000; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfxhGl03VEk+hJ7nHUA6h2FcXzE26ZbiR+SvnRdA5f4=;
        b=K3+Rqp56qNgGQS3w1fH8VvMa1wL8hWSwdNc4KfbjT7rkLb0Dyc9EX4ODbGSXrm+Hue
         nCjz17+13ulpvEOuwdtBAcHiXBrY4/bWYTRkfIAKt5uwTzNdnnLEfHlzlyw8Qhdm2XDy
         U04JA4oSrC0mxUT8xXYuhEmyFkGPMQcmsZHdbZwaFreQRQAxG4c6ZNq9UgXAOLShrWcv
         t2GQT+gGwXWeKqn2jwJHsNP/yA998bCOTs4vYWv32eRIU9hmHR9lqECBaRryiXmssRDR
         6NSWROpkYqC8SYtXUUdujcntcOzXHYSPuyayuZCqYOzaqeWHdf8ZWhAeA31dYLRiRxgK
         vLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723297200; x=1723902000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfxhGl03VEk+hJ7nHUA6h2FcXzE26ZbiR+SvnRdA5f4=;
        b=uTFTm+bRzSYhlziA/K2gLu82hF1z7fVNV1KE8rBh2ImJnBmScI6KOZ6r/7jQBjPlIt
         SdRYCrLMlQCRKRC/LS0xLKmlWyitUQIKoCiaEXzIgasqp8Ii9ICylczQ/Gy8coVSQuFS
         anGxkLpzTc7jwkS4eEAjTTk5t6KEk+kFpNRZCb+6hNVXRgXbM0/gL76Mwhm6fD2hF5F7
         ll3luFheULBdUtnKfekrmg2VSH3UUqE0Zuw9n9qX38+Kb62vz2l5/2VhtV3El2ZoLiNb
         H0vsRer+0g/PA/AOhNQs3q2oDGL5yXcqY5Io2uenzL7rxbD0+gedApKLRzwAR3CWZkS8
         GWDQ==
X-Gm-Message-State: AOJu0YzmyVVj3J9eUD8BWxScSieuYg0i1/He6F1SZV8la/jCFzkfxJjI
	ct/A/RqOENBxc8LmM+GzrrjjqQqOPnl4/tez53Pkc6AYIlfdoueTunz7Qm38Uvj8vL9cNLG2OlD
	xQI/miNri/OTHSIydvo/xknYes3Q=
X-Google-Smtp-Source: AGHT+IHPcJ7I1uiw46kF6qgWBAIycA6dAMHcjME1sfTQM6uaDfQZv+1Nl+UAqLZk69VKR/Ya+N8hct6psUOn03QxNVo=
X-Received: by 2002:a17:90a:6785:b0:2cd:5d13:40ba with SMTP id
 98e67ed59e1d1-2d1e7fbc7e4mr5480003a91.14.1723297199875; Sat, 10 Aug 2024
 06:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240809233131.3339913-1-raj.khem@gmail.com>
In-Reply-To: <20240809233131.3339913-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 10 Aug 2024 09:39:48 -0400
Message-ID: <CADkTA4O4tfmW5W7fU5vZ13he-XGKyfkiVwu7U9h7uD582C49hA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] turbostat: Add band-aid to build from 6.10+ kernel
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 13:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111735

On Fri, Aug 9, 2024 at 7:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

I'll add turbostat to my list of packages to test on kernel /
libc-headers upgrades!

Bruce

> ---
>  .../recipes-kernel/turbostat/turbostat_3.4.bb  | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/=
recipes-kernel/turbostat/turbostat_3.4.bb
> index 4770fae50e..cfe3bb9682 100644
> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> @@ -33,7 +33,7 @@ do_populate_lic[depends] =3D "${PN}:do_configure"
>
>
>  EXTRA_OEMAKE =3D '\
> -                CC=3D"${CC}" 'CFLAGS=3D-Wall ${LDFLAGS}' \
> +                CC=3D"${CC}" 'CFLAGS=3D-Wall ${LDFLAGS}'  \
>                 '
>
>  # If we build under STAGING_KERNEL_DIR, source will not be put
> @@ -52,12 +52,21 @@ do_configure:prepend() {
>                 cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
>                 cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
>         fi
> +       if [ -f "${STAGING_KERNEL_DIR}/tools/include/linux/build_bug.h" ]=
; then
> +               cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/build_bug=
.h ${S}
> +       fi
> +       cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler.h ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler_types.h =
${S}
> +       cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler-gcc.h ${=
S}
>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>  }
>
>
>  do_compile() {
>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
> +       sed -i 's#<linux/compiler.h>#"compiler.h"#' build_bug.h
> +       sed -i 's#<linux/compiler_types.h>#"compiler_types.h"#' compiler.=
h
> +       sed -i 's#<linux/compiler-gcc.h>#"compiler-gcc.h"#' compiler_type=
s.h
>         'TMPCHECK=3D'grep "<vdso/const.h>" bits.h'' || true
>         if [ -n $TMPCHECK ]; then
>                 sed -i 's#<vdso/const.h>#"const.h"#' bits.h
> @@ -66,8 +75,15 @@ do_compile() {
>                 sed -i 's#<linux/const.h>#"const.h"#' bits.h
>                 sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's=
#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
>         fi
> +       echo '#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))' >=
> msr-index.h
> +       echo "#define BIT(x) (1 << (x))" > bits.h
> +       echo "#define BIT_ULL(nr) (1ULL << (nr))" >> bits.h
> +       echo "#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (sizeof(l=
ong) * 8 - 1 - (h))))" >> bits.h
> +       echo "#define GENMASK_ULL(h, l) (((~0ULL) << (l)) & (~0ULL >> (si=
zeof(long long) * 8 - 1 - (h))))" >> bits.h
> +
>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
> +       sed -i 's#BUILD_BUG_HEADER#"build_bug.h"#' turbostat.c
>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$=
(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
>         oe_runmake STAGING_KERNEL_DIR=3D${STAGING_KERNEL_DIR}
>  }



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

