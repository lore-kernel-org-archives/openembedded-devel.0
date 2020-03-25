Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.14199.1585150230298643594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 08:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MPlvQHw0;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id q188so2945758qke.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f51V51X97fB46k3ZkgIQzFfble4vdZiHO7ziDfBZWpw=;
        b=MPlvQHw07mnbjZfBQvSjkAEryk2ltVfeC6xpR/dyCb9kzJDHC4aanjCFUfrHM213ck
         Tudp+CS4xyKrQH4H+eFLjaKylD/RZC+QPWZdTEBqe7RG2FEumVqdm25qJaHYPoz51VDb
         yXdVEVyUU+YC9ev9uld6SxDCu0uhy4IbDTDZAswdT594GBu08+LTW1hGwuDfamv+JvFR
         9axmDhbIsjdcfsLdqk8FGz8zOl/nPNCl8wacyxHXQbX7X8mAIGvwzmQdnjWPTfrGtCZy
         cGipCzLiKJ2ThRiebXbCHwrMGKFUOAM68QA3LBJ6jPgg4JhsdlpSGW5Lt+9Mt2ZUtLBx
         +1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f51V51X97fB46k3ZkgIQzFfble4vdZiHO7ziDfBZWpw=;
        b=kyXMctxB7EwSMFoOvVWObNja4aNRDXWp3xmYYFojD5qG75PlzdVfBfDhTiVX6XgkfS
         AMUnH+4IwyqV9mUBCrZz0i6O6zRFUYbVdVNcrgU35G2vzA5p7XwQHl8rUJvkXjn/7eH3
         0cmTwILkr/SfmQMmOr1xBGeWti4eWI7RLO3dMle7fC6XmRfRZ06P88SobxxehNi88gjZ
         Jevipm1Dpc6TZV2lK2sQ5TDcSY6R2DzHZVruX6Q8gav2T3PqRoaQ8bt+toOcyuqT1Zjn
         +fyVVKnTbMueGBT3deCRCatbTCUSPeEU/heK7tB3qtLrS0H63irfcSuwYu+FHap98qGe
         G5Yg==
X-Gm-Message-State: ANhLgQ0A5Xia4AAOJAMEDCgZzYxkMCtNOgQTAYxxrni2vHw1eyE++90H
	VBHoPJ9wSQCnYFPCoRTKvEI5S7l+dfktLFkD/eo=
X-Google-Smtp-Source: ADFU+vs/pOpLs7uJZEpTaautgFHqSY7B2K1unzJ5LrrK2EoZRkt0OQGB4dHUeWWROus0JpUrk5OmnzjsjRoYnhGRA+k=
X-Received: by 2002:a37:bd81:: with SMTP id n123mr3416648qkf.431.1585150229172;
 Wed, 25 Mar 2020 08:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 25 Mar 2020 08:30:01 -0700
Message-ID: <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: He Zhe <zhe.he@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails build on qemux86

https://errors.yoctoproject.org/Errors/Details/398664/

On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> To fix the following build failures
> turbostat.c:(.text+0xc28a): undefined reference to `UL'
> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
>
> - Add dependency on libcap for kernel v5.6-rc7 and later versions
> - Copy internal linux/const.h used by previously added internal linux/bits.h
> - Tweak linux/const.h to allow it to refer to uapi const.h, as
>   linux-libc-headers purposely removes _UAPI from the locker macros of the
>   headers
> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
>   provided enough and necessary headers
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> index 5f6588d..d2694b8 100644
> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> @@ -21,7 +21,7 @@ SRC_URI += "\
>              "
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -DEPENDS = "virtual/kernel"
> +DEPENDS = "virtual/kernel libcap"
>
>  # This looks in S, so we better make sure there's
>  # something in the directory.
> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
>
>
>  EXTRA_OEMAKE = '\
> -                CC="${CC}" \
> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
>                 '
>
>  # If we build under STAGING_KERNEL_DIR, source will not be put
> @@ -43,12 +42,15 @@ do_configure_prepend() {
>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
>         cp -r ${WORKDIR}/COPYING ${S}
>  }
>
>  do_compile() {
>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
> --
> 2.7.4
>
> 
