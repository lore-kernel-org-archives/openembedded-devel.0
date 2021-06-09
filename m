Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.2466.1623278084946169572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 15:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WeyWFEsv;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id t17so4376878pga.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kkFI1f6q6KQ4vl8gB91GlAi9jRuehED/mzj07A+Ta9U=;
        b=WeyWFEsvN5QTa9hN1oN/f39Do7zNZvyXtxrQ+dc0GoKntVCN9wRfE3c9eONsOhxCjf
         q5leXDOLekV14o8j2ZHPLPl4wFxiszQvv2Cizpe9vd/fKuJwvrEexqlofXuuz80NrCEd
         GzKxsSBbdwqYglsJvXSr+lPqznI0eLxiZD9cZ3eoEgDFfmumUuZiTUr80VTGUazEl2fv
         j0EsahAcmuo76eVKoE0aPJ0mmHh3EnBhlhLKXMOCFeZJQW0fuV1x33wa2AvDuwZ8R82w
         hBCGaa3SV3yctjxsVWWkzouIY49MAg+i3H7lkNNqgArpug8zgD3trZB51LVTzBxpIyfo
         ndoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkFI1f6q6KQ4vl8gB91GlAi9jRuehED/mzj07A+Ta9U=;
        b=PJmHioHVZMZwOip7tByQ78v6Uaz7XiZhnwM3B29P26dWkLNO4RQhZEi4mjzsvjQl3W
         znBUNr1QuPQ/B1cY4pNS1UxKWV9H9o4vflKWssEqR4ZlUKs/HjnKUEiydc91lOZFDHXI
         QrlY8/MFU1me4y22wuWWOU3MfhIln15QQYkHH9exAJW+O/32mvnAdso1X5yhfWpNC/ra
         /53kaFgIxGf9MNqZhBep8XdP2vlx5RxH3XcQ043I+1KTXTGwzPhNsJmOj5FjpJiYnscC
         1W0EeNKnA/R5FocujwrLL/JEeWgyDg2GF5+a0piQO1As7CWac6mcfmAdpjBlnv0JpUet
         AINA==
X-Gm-Message-State: AOAM5336f6Naz/+XZjYvxyqmNFLl0H26ZDxe8J0CdFN0eiwHGaGOzyMX
	lZZr7WeR1tqUOtTZt/V4HP4a/Stz3POQOtcDMdQ=
X-Google-Smtp-Source: ABdhPJxq09MSjwnippcfvJ74PGxAwkk/a2QcnAtAMe/NtvditHEcmPEqlHgWzcvl2KF5bwgiciB46Wpqg/qVgpiKE9o=
X-Received: by 2002:aa7:8888:0:b029:2ec:763f:4bcc with SMTP id
 z8-20020aa788880000b02902ec763f4bccmr1833714pfe.35.1623278084474; Wed, 09 Jun
 2021 15:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-17-schnitzeltony@gmail.com> <CAMKF1sq89Sg8RQTU6nY-gP-7pmi=_pCPt5VCfQRZ=Dz4O=1Fjg@mail.gmail.com>
In-Reply-To: <CAMKF1sq89Sg8RQTU6nY-gP-7pmi=_pCPt5VCfQRZ=Dz4O=1Fjg@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 10 Jun 2021 00:34:33 +0200
Message-ID: <CALbNGRRRfBE0msHyE9GUiewQhmH7VY-qm4ZanXebhsCqKm0eRw@mail.gmail.com>
Subject: Re: [oe] [PATCH 17/20] Revert "gimp: Disable svg icons on arm"
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 16, 2021 at 2:11 AM Khem Raj <raj.khem@gmail.com> wrote:
> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> > index 237d08a09..e729d9deb 100644
> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> > @@ -54,7 +54,7 @@ EXTRA_OECONF = "--disable-python \
> >  EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
> >  EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
> >  EXTRA_OECONF_append_libc-musl_x86 = " --disable-vector-icons"
> > -EXTRA_OECONF_append_arm = " --disable-vector-icons"
> > +EXTRA_OECONF_append_toolchain-clang_arm = " --disable-vector-icons"
>
> thanks. I will verify it on gcc/musl and clang/musl scenarios and
> perhaps its really the musl piece which is problematic
> issue is qemu segfaults :(, qemu is also upgraded in master-next so
> maybe even musl will start to work.
>
> >
Hi Khem,

This starts getting interesting: Currently I see build failures on
gimp. This time not on svg conversion but for png. Something like

| mkdir -p `dirname 16/gimp-dashboard.png` && GEGL_USE_OPENCL=no
GEGL_SWAP=ram /home/superandy/tmp/oe-core-musl/work/cortexa72-mortsgna-linux-musl/gimp/2.10.24-r0/recipe-sysroot-native/usr/bin/gegl
../../../gimp-2.10.24/icons/Symbolic/16/gimp-dashboard.png -o
16/gimp-dashboard.png -- cast-format input-format="R'G'B'A float"
output-format="RGBA float" brightness-contrast contrast=1.5
cast-format input-format="RGBA float" output-format="R'G'B'A float"
| Fontconfig error: Cannot load default config file
| make[3]: *** [Makefile:2409: 16/gimp-dashboard.png] Segmentation
fault (core dumped)

This looks very similar to what you reported when all these
'--disable-vector-icons' started to come in.

Looked into and am convinced that this is not a architectural/musl
problem (btw - it is native gegl that crashes) but a race. GIMP-build
intended 2 steps:

1. create png/svg in ${B}/icons
2. let gegl convert these icons to *.c / *.xml

I think step 1 is not completed before step2 starts because on each
run segfault happens at different icon.

Long talk: Am working on this...

Cheers

Andreas
