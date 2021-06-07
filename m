Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.33379.1623056121546401594
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=q5LnfSpl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.43, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f43.google.com with SMTP id b11so19393393edy.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hQGniLaUMjInekej4J61PF3B4ufkpM3E+1PxyKQAdSc=;
        b=q5LnfSplYB6jmS0lFBXy4xYbZoRU3hQoNAKBIvQ59nnt4Xua/kc8sd2OBMQZKvTjOw
         U2Tgrq2HzXIVFTTpUk2sVj0X2ifaAdj5YYlKYrAkLZzG4Ml0u3Vuoa39P4SUn36fRa55
         u89UZjVFqyJOIp5gtpoy7cVJ+/4S1GGA7RvPuQ1zNzNck2itLqELwukkKmwRbwxo7Npj
         Hgt5ZCN+qcPSy5ueLIEzJUNLzzMNuo5Iq9yeh1Nck5DKQwzjQNelFZZgha0oACNK0JXe
         YFTf/ijmVswM0j8FoR8mUjDAZN5I6/zwy3GNdUCrYQwyfAFL+kCD0MF0btjS1JR8+ukw
         Vnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hQGniLaUMjInekej4J61PF3B4ufkpM3E+1PxyKQAdSc=;
        b=UQgEkFc+bf/npYteqEbUFdOIpBY2GL5SXqmZnMhCW7OYR9IktpNb2OtJNmM1llJH2Q
         80Qwc27IayWyyFmzVda55+Y8+FQ8fpyk5/qdkOj13IXOqPFEQHku37irUCcxdv/Zi9vO
         KXQaDRIB6C2RMpdjNahtw/MHin54iwd9j1zrzE2Oost2RbjqU1dzWPc0xSOhMdcq+EUw
         z0vu8jyFNbGzPrNtETQ5XyTR+xm0eLmCfsw1fLRKr2HzoXKA/FrcPdRMBq28TWRo5U6m
         rq06XorZoCxD8hdqhblhX/y83IFwkYNic7Lg0fmx/QIi9XUNfmCyVOfmLw4UqIuBvjze
         hA0g==
X-Gm-Message-State: AOAM530R3xHVSNzdRdlSRLfk2lSQIYbJjBw05QFTc1d9jI4PE950X5Id
	yqDGjqKD3np8ZoCCLwgU13BAlU+sJvDRgc/eqTn7tg==
X-Google-Smtp-Source: ABdhPJxIgw94rkMmAYH87b/nUDCzuw3Yr5P3sclNPzGTuh3KPNCVX2cko7ertirG1gniCOpru5D5bpJKLqmHGH8ATqU=
X-Received: by 2002:a50:cd58:: with SMTP id d24mr18661494edj.119.1623056119861;
 Mon, 07 Jun 2021 01:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
 <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
In-Reply-To: <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 7 Jun 2021 10:55:09 +0200
Message-ID: <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 6, 2021 at 12:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > libgpiod test-suites work with the gpio-mockup kernel module. When using
> > linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
> > if this feature is present in KERNEL_FEATURE and warn if not.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > index 874453fbd..febf625a6 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
> >  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
> >
> >  do_install_ptest() {
> > +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
> > +       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
> > +        bbwarn "libgpiod test-suites need the gpio-mockup
> > +module and will not work without it. Consider adding
> > +'features/gpio/mockup.scc' to KERNEL_FEATURES"
> > +    fi
> > +
>
> perhaps turn this into a bbnote something like what libbpf is doing see
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master
>

I really think that a warning is in order here. The ptests won't work
without this module. At the same time we can't really skip the package
altogether because the build may be using a different kernel recipe
with its own defconfig - this is why we first check if we're using
linux-yocto.

Bart
