Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.316.1585242442636832607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ruciZEYU;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id e14so6047941qts.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YbFS/cKXxte7u1q1mbEZHANpnpYiUn7HcdIXZcn3LvM=;
        b=ruciZEYUBrNaUtBsoZ4dpybHOTs3UJ2jSbkN5It/taK7lLq4WCPYeDNlzba2z68w0O
         Tpws5ZlUVewSHDB6SQxMxbFS0wEeORSM2FXME4W0erD9PsuPvsHRgtZQOp8Y6wrRnulq
         zZFwspBNFvogbUfYmHMiUKz4mTPLJJ08D42ORbFYQeoOaQRVPLRs/9qGsAFCKoivcp8W
         MYIGcStFQvmsXKtkMwI98JZ4y4zSicrBQ8RHeOW0PQyy4JzRm4jD6ZqD4bTtOlXYw+9F
         Tj67i7KIt+eQd+i9qO2JssROi4jtbaB0rC851a9penSeSMfUgpSAno6Jk+kY/hjnLnj+
         wMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YbFS/cKXxte7u1q1mbEZHANpnpYiUn7HcdIXZcn3LvM=;
        b=RZ7aHKrDPZ9yg9ta2UeVeZ98Nb8ncI1mcjC5POzlY7qkoXGeYNgQozNw1dTL3LWRqJ
         MC/sAowF09mqbTXnu+xW70HPL9OeF4pLnNExzlfWmHyyA0vFDQhiO96X/dM5Y/MPfeSd
         XL4gHDF7+xjTQEEJdtI8AKfnr73cXG+j72aA78B156fPQy0IFq6ijhKGdLGxQaVMBC7u
         EO9UqEWCaHt3Wt/SG8homEwx2Ufw/o70fv76OMieSNKRJyh6MGAd1liECv+mF665EVy4
         qU0LoaVuYcjAy1tLiWqBfgjjXNx+YKKKmeLyFs/h3gIt2FOggw+QuGne2RXg2iJK4QTA
         2VCQ==
X-Gm-Message-State: ANhLgQ2QSiSExjAKAoniQAQDMetGn5Jfa5go48KBMvVsLEtOySnbH7Yz
	2s427DSIEQ6QEHFIFAdTJCMoXrh27vTJ02VF7HaNQ9hp5TE=
X-Google-Smtp-Source: ADFU+vv62a420B9H+6+ymA2Q/FpIK0DPdtQ3U9PzDG8RRRdqn8amwR4GZ08AyDK0GBDolnCr0MzhkhHLJSSZpmL9vjs=
X-Received: by 2002:ac8:f4a:: with SMTP id l10mr9552443qtk.146.1585242441463;
 Thu, 26 Mar 2020 10:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <1585133822-167040-1-git-send-email-zhe.he@windriver.com>
 <CAMKF1sqdcGRxKfubhncfxwHRKdcUTRprLsaX9ofhA8m6Bw3HJA@mail.gmail.com>
 <42e3898f-d34a-402a-9934-cf5587e8bce9@windriver.com> <CAMKF1srrO=Yf_GwRia86RBOyejxKHWwBuph1K6DPbO_YJL1AOQ@mail.gmail.com>
 <455aaf4d-1727-3634-3388-8fdb4a41479d@windriver.com>
In-Reply-To: <455aaf4d-1727-3634-3388-8fdb4a41479d@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 10:06:53 -0700
Message-ID: <CAMKF1spbyNWMhnSbdsmHFKEpUk3ysQWP477S0bBaZpF6H1etUA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] turbostat: Fix build failure for missing kernel internal heaers and clean up
To: He Zhe <zhe.he@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 1:39 AM He Zhe <zhe.he@windriver.com> wrote:
>
>
>
> On 3/26/20 3:38 PM, Khem Raj wrote:
> > On Wed, Mar 25, 2020 at 10:11 PM He Zhe <zhe.he@windriver.com> wrote:
> >>
> >>
> >> On 3/25/20 11:30 PM, Khem Raj wrote:
> >>> Fails build on qemux86
> >>>
> >>> https://errors.yoctoproject.org/Errors/Details/398664/
> >> Hi Raj,
> >>
> >> I cannot reproduce this failurewith poky(master branch) + meta-openembedded(master branch).
> >>
> >> Looking at the reported error,
> >> 'TOPDIR/build/tmp/work-shared/qemux86/kernel-source/arch/x86/include/asm/msr-index.h': No such file or directory
> >> the TOPDIR, part of STAGING_KERNEL_DIR, is not evaluated, strange.
> >>
> >> Where can I find the exact reproduction steps? Thanks.
> >>
> > its listed here http://errors.yoctoproject.org/Errors/Details/398850/
> >
> > Use master-next branch of poky and MACHINE=qemux86-64
>
> I've tried with the following config,
> git://git.yoctoproject.org/poky on master-next
> git://git.openembedded.org/meta-openembedded on master-next
> MACHINE=qemux86-64
>
> But I still cannot reproduce it. Anything that might still be missing here?
>
> And it seems it's not turbostat's recipe who makes "TOPDIR" not evaluated.
>

TOPDIR in those logs is a replacement to hide the build paths by error
server. Don't get confused by it.
can you try this

bitbake turbostat && rm -rf build/tmp && bitbake -ccleansstate
turbostat && bitbake turbostat

>
> Zhe
>
> >
> >> Zhe
> >>
> >>> On Wed, Mar 25, 2020 at 3:57 AM He Zhe <zhe.he@windriver.com> wrote:
> >>>> From: He Zhe <zhe.he@windriver.com>
> >>>>
> >>>> To fix the following build failures
> >>>> turbostat.c:(.text+0xc28a): undefined reference to `UL'
> >>>> turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)
> >>>>
> >>>> - Add dependency on libcap for kernel v5.6-rc7 and later versions
> >>>> - Copy internal linux/const.h used by previously added internal linux/bits.h
> >>>> - Tweak linux/const.h to allow it to refer to uapi const.h, as
> >>>>   linux-libc-headers purposely removes _UAPI from the locker macros of the
> >>>>   headers
> >>>> - Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
> >>>>   provided enough and necessary headers
> >>>>
> >>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >>>> ---
> >>>>  meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 8 +++++---
> >>>>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >>>> index 5f6588d..d2694b8 100644
> >>>> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >>>> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> >>>> @@ -21,7 +21,7 @@ SRC_URI += "\
> >>>>              "
> >>>>
> >>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>> -DEPENDS = "virtual/kernel"
> >>>> +DEPENDS = "virtual/kernel libcap"
> >>>>
> >>>>  # This looks in S, so we better make sure there's
> >>>>  # something in the directory.
> >>>> @@ -30,8 +30,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
> >>>>
> >>>>
> >>>>  EXTRA_OEMAKE = '\
> >>>> -                CC="${CC}" \
> >>>> -               'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
> >>>> +                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
> >>>>                 '
> >>>>
> >>>>  # If we build under STAGING_KERNEL_DIR, source will not be put
> >>>> @@ -43,12 +42,15 @@ do_configure_prepend() {
> >>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
> >>>>         cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
> >>>>         cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
> >>>> +       cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
> >>>>         cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
> >>>>         cp -r ${WORKDIR}/COPYING ${S}
> >>>>  }
> >>>>
> >>>>  do_compile() {
> >>>>         sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
> >>>> +       sed -i 's#<linux/const.h>#"const.h"#' bits.h
> >>>> +       sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
> >>>>         sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
> >>>>         sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
> >>>>         sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
> >>>> --
> >>>> 2.7.4
> >>>>
> >>>> 
>
