Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.32390.1585208312077249367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 00:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJzlAfMd;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id o10so5428782qki.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ToKFGZrpUw+EtMc/i93mqxhuWy09TcZHNXGjKpgxF8c=;
        b=gJzlAfMd2cb54PoSdejrrODm6x4xW5+FUXnsInDuJR7DELSDt9X4nwpP0TTKtJpT3m
         YVr7B8UoYL1o2C5wlxMENCAGThPr5U8+TjmLJxJ0bGOTMDEOhmR2KPQ/J/uu6csqk+t/
         wnEQ/g6Hl3O19x1VfnBirlhLSb5i95YE6zQNahw3dglEzJJ4PXU8ah+3llZpuxM1YqZ6
         sVTGoRfc+H0KGm/Wt7xHGZdUSl0WzY8GoqWNT0ANBOwSYm8o19tHQqgjkykmIna0jp57
         0CSuXg2wk/Fg43RVART27rcmaW0ItJA7QE/lC94A++bRq9GuBPvLpHNDHVnBHA0vOcWJ
         ax+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ToKFGZrpUw+EtMc/i93mqxhuWy09TcZHNXGjKpgxF8c=;
        b=m1nDaOhunETyYHCCD9pH8hmV8be3eedcd+acjBsfuncnHZXmmPSwXGuadmRPa6EvAy
         EtRlMxqLp/DErhOx/uyQ17v90wdtQZ1RxkoQ1eIFhhivOqhbDuks5XPJIzLJ6D0Xoni6
         gwzofPHhv7GPZXI1tt7ypSTrJtOB/l2kJalr8fhaty2do+mr1HS2NbsEaXuoUWYEcExo
         eGp1HyHGVJt1yUF9D6aj2hsNu/N0uaxNd1blqe80ojC84Lekv4l9Sc7s7r1djWtbsZ41
         yxhj/E2ynt9r66BCyvhWYnkFlINVPMQshN2Oi4I7l4AtMvGjp9KWAbMruRcxnTmlvzAz
         HU1w==
X-Gm-Message-State: ANhLgQ0hgYn/JzWGQA1sfoCtx2HYUoskcbZQN98qq0Q01VmajGKn+SBe
	IuhIaAlJjCNzRrdtJSGxN8FBJ+6QSWbIAazSuLA=
X-Google-Smtp-Source: ADFU+vvmEpLBdp3EDBDlLeVS543gEOyqhP3wOajA9IAWhuS/vcaxJ4Vu/DlXKuXF8Ggc5XveN0lxVBr3lIo5QtOh1AM=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr6764849qkf.165.1585208310958;
 Thu, 26 Mar 2020 00:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
 <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com> <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com>
In-Reply-To: <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 00:38:04 -0700
Message-ID: <CAMKF1srrO=Yf_GwRia86RBOyejxKHWwBuph1K6DPbO_YJL1AOQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: He Zhe <zhe.he@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 10:11 PM He Zhe <zhe.he@windriver.com> wrote:
>
>
>
> On 3/25/20 11:30 PM, Khem Raj wrote:
> > Fails build on qemux86
> >
> > https://errors.yoctoproject.org/Errors/Details/398664/
>
> Hi Raj,
>
> I cannot reproduce this failurewith poky(master branch) + meta-openembedded(master branch).
>
> Looking at the reported error,
> 'TOPDIR/build/tmp/work-shared/qemux86/kernel-source/arch/x86/include/asm/msr-index.h': No such file or directory
> the TOPDIR, part of STAGING_KERNEL_DIR, is not evaluated, strange.
>
> Where can I find the exact reproduction steps? Thanks.
>

its listed here http://errors.yoctoproject.org/Errors/Details/398850/

Use master-next branch of poky and MACHINE=qemux86-64

> Zhe
>
> >
> > On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
> >> From: He Zhe <zhe.he@windriver.com>
> >>
> >> To fix the following build failures
> >> turbostat.c:(.text+0xc28a): undefined reference to `UL'
> >> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
> >>
> >> - Add dependency on libcap for kernel v5.6-rc7 and later versions
> >> - Copy internal linux/const.h used by previously added internal linux/bits.h
> >> - Tweak linux/const.h to allow it to refer to uapi const.h, as
> >>   linux-libc-headers purposely removes _UAPI from the locker macros of the
> >>   headers
> >> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
> >>   provided enough and necessary headers
> >>
> >> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >> ---
> >>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >> index 5f6588d..d2694b8 100644
> >> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >> @@ -21,7 +21,7 @@ SRC_URI += "\
> >>              "
> >>
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> -DEPENDS = "virtual/kernel"
> >> +DEPENDS = "virtual/kernel libcap"
> >>
> >>  # This looks in S, so we better make sure there's
> >>  # something in the directory.
> >> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
> >>
> >>
> >>  EXTRA_OEMAKE = '\
> >> -                CC="${CC}" \
> >> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
> >> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
> >>                 '
> >>
> >>  # If we build under STAGING_KERNEL_DIR, source will not be put
> >> @@ -43,12 +42,15 @@ do_configure_prepend() {
> >>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
> >>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
> >>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
> >> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
> >>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
> >>         cp -r ${WORKDIR}/COPYING ${S}
> >>  }
> >>
> >>  do_compile() {
> >>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
> >> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
> >> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
> >>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
> >>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
> >>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
> >> --
> >> 2.7.4
> >>
> >> 
>
