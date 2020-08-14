Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.11685.1597378962506937212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ROyQ5B2k;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id h21so6116277qtp.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TB6xu6XnOL6BDFkUzgyFwvZrNiT9V5CfdzvGCgmeZzQ=;
        b=ROyQ5B2khwypdOj0PjNe3cy+ICcMayLuJ+F3d1aZJKdSMKX/erON59DR2CJwZqyywy
         XYUFl19Y9B7XrW7A5zijEXk2Wz1EQ8uONG2oHT3JUqwEzO5UqxJ+H8MWtm5Jh3Z7PyVB
         ChB3oRnoQKfLg+0pafEl3XKDl16j0/RVkjCvyQQHabbyrFMuxwKk35thlzkpQPjMyUWh
         24ho1HdkZRqCldT9bEIsfz8ssaAxmoLkbJ3GjxSBkfR12llc4jPxbAO5qmwL0oEE2SA7
         YgNuZAMx31t0FLSzhafrE5zNFmg8vprEmhRaco8EoEOWzHtiJrSlwtNtJ83yfxD/mkCA
         qA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TB6xu6XnOL6BDFkUzgyFwvZrNiT9V5CfdzvGCgmeZzQ=;
        b=cbJcReMNRqPZAIIN/xdNGxDINKbFVGNbBxC8QayqSKrVqtKnBLNpNvYFY46slks5ww
         xO0EhR/WNG9LjPaIZZswfxxH6HtAnqOcLE5STdKl9yLTJqExRRgaeyNV2CEUO2FuAeSl
         CoOnmuQt6AR8afsszA0NiPayrvxOwqIcglSyPbYQE+npR00rd2s81SzxTz6lHJPxxM+5
         EXrMb/UkrzKlbHUnhOd1LyIDHpf7d9IUeBQliFCgjHhtPzw0FAGaGoWrYxuY54L7P8rS
         Nxs+hmmDxeZqbfLswrFZ7jZpL00L2da2jD7AxC1sbuMwp6CRs5kHqDei0MdTpJ/G2DtP
         jYfw==
X-Gm-Message-State: AOAM530uAAbFFtMVfyFQAlfiS3AwT+bm8JwPxgTzVfh1iztRghBlBgWX
	o5DVtVTeQDlzR6Z/avyHSS/fqrpWeOxnDA/ykVDfGtR3
X-Google-Smtp-Source: ABdhPJzeHhT+B805/+fAYIvx01PDlRGFM8wV0iS2jV+E1XBd57E6fc3XrwfzJuHGDJ8n9/HtDgXHGVOG8ZlhFe58nak=
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr523717qta.146.1597378961550;
 Thu, 13 Aug 2020 21:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200812075055.3512737-1-raj.khem@gmail.com> <e2199f620db08e5bd16d79b01f3c3df805676313.camel@intel.com>
In-Reply-To: <e2199f620db08e5bd16d79b01f3c3df805676313.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 Aug 2020 21:22:15 -0700
Message-ID: <CAMKF1soNLXv0HEsAxonpJZzSSgMTCQu1h1_rP9BrQTgR0W76gg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 9:12 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> On Wed, 2020-08-12 at 00:50 -0700, Khem Raj wrote:
> > License-Update: Update copyrights [1]
> >
> > Install CL/cl_icd.h as its needed by opencl-icd-loader
> >
> > Do not provide libOpenCL.so these are alrwady provided by OpenCL 1.2
> > Installable Client Driver
>
> Aren't both of these different implementations of libOpenCL? Project
> depending on ocl-icd shouldn't need to depend on opencl-icd-loader I
> think.

yes they are different, for meta-oe khronos implementation is default.
>
> Thanks,
>
> Anuj
>
> >
> > [1]
> > https://github.com/OCL-dev/ocl-icd/commit/3920205736afbb67729e9c73c7b4c6fdb3fcb327#diff-7116ef0705885343c9e1b2171a06be0e
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix library conflicts and license checksums
> >
> >  meta-oe/recipes-core/opencl/ocl-icd_git.bb | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-
> > oe/recipes-core/opencl/ocl-icd_git.bb
> > index d14ec53e3d..a65c7618b8 100644
> > --- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
> > +++ b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
> > @@ -3,12 +3,12 @@ DESCRIPTION = "Open Source alternative to vendor
> > specific OpenCL ICD loaders."
> >
> >  # The LICENSE is BSD 2-Clause "Simplified" License
> >  LICENSE = "BSD-2-Clause"
> > -LIC_FILES_CHKSUM =
> > "file://COPYING;md5=232257bbf7320320725ca9529d3782ab"
> > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
> >
> >  SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
> >
> >  PV = "2.2.12+git${SRCPV}"
> > -SRCREV = "af79aebe4649f30dbd711c1bf6fc661eac6e5f01"
> > +SRCREV = "a9e57b199ff1e8d03fa3e5c53c5544de3dc72fe6"
> >
> >  S = "${WORKDIR}/git"
> >
> > @@ -16,4 +16,10 @@ inherit autotools
> >
> >  DEPENDS = "ruby-native"
> >
> > +
> > +do_install_append() {
> > +    install -Dm 0644 ${S}/khronos-headers/CL/cl_icd.h
> > ${D}${includedir}/CL/cl_icd.h
> > +    rm -rf ${D}${libdir}/libOpenCL.so*
> > +}
> > +
> >  BBCLASSEXTEND = "native"
> >
> 
