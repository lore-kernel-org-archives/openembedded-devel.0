Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.2638.1623278864831833886
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 15:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/LOYUh1;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id l3so6683844qvl.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nudxOH4iY92f+navSjwGiBtH2qFgwkxut5sbjtkrWQU=;
        b=u/LOYUh1TsXNP7nOFKlyw8xPlTZYxet4Jzx050VXSJbRrTAn+J0zwMPIanlpju1Uju
         xkgtNwdnueqY/OZLLuo5fvI4eKRUD5vypNswiOx7SJheiBz0fAKsIy3t0JI/DXW8cq8R
         cyFQT3wum43nBdaFvWkj6KUsbcMFQIiaKbfPsc82VEMDHirimp1cj1YtIcpDJcAcICRd
         UfDX7lszIL3sIq6JpnmyFBjXyfjs1WSad6dBfE+m2VbUwu3zEabZGcFjl0BjN4VPFT91
         OEGyECAxggr+pJmKWoATXS5o2BFKt8OavK2PalB+Tp+RRkbLwRJPAekU/nC+C7z+Oiyu
         jI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nudxOH4iY92f+navSjwGiBtH2qFgwkxut5sbjtkrWQU=;
        b=jbaEdRdpJVf4gHhsPI4SbTNYzyTxAHuigUX2ebP5ABTecFgoevS8/SPlwXlYPhtt9i
         NwyORNNi1OC+UxCECQQipOKJ8G+2LXSD2YN3vZdeEFGe/Cwj9/4gPmwrAZGN1iKbWmik
         Ukan6njenw+aSZYQbQdiG83DAlfDTZePJu1xS0A3cT97QdzUbmEuwMbKTR3imGvMH+xG
         vWYlLEF3G4iCvWlUA5JOP1Bkzq0ku+ou+biiEZSWJ4JoRWT10Y4/BkQq2EKRR0FBF8g7
         tQp0URBa2zc8hUn3CoAMYcO1EU1hxt1hCWwV2zBPObsv0kdsfQJbCtBloS754Eok+yvT
         hdHQ==
X-Gm-Message-State: AOAM533POdPJbNcPlm0vSFg2f38G6Nq/sZDD4C5m+n9yaWwzG3lxmqmN
	eADx0FAx4mjSCO6c5Z5SMatE6k4r/qECfjMnZvc=
X-Google-Smtp-Source: ABdhPJxGgLTq8xfwivqsxahksVNuyWBXmc4I+H7cIOTkpraRl1E2oOZ/CPYBA5KJyLb3M7BXA8FSB078FMsIO5QeQSY=
X-Received: by 2002:a05:6214:1869:: with SMTP id eh9mr2371991qvb.16.1623278863865;
 Wed, 09 Jun 2021 15:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-17-schnitzeltony@gmail.com> <CAMKF1sq89Sg8RQTU6nY-gP-7pmi=_pCPt5VCfQRZ=Dz4O=1Fjg@mail.gmail.com>
 <CALbNGRRRfBE0msHyE9GUiewQhmH7VY-qm4ZanXebhsCqKm0eRw@mail.gmail.com>
In-Reply-To: <CALbNGRRRfBE0msHyE9GUiewQhmH7VY-qm4ZanXebhsCqKm0eRw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 9 Jun 2021 15:47:17 -0700
Message-ID: <CAMKF1sqMFzEz1jic3J_2DYuLGqwzA3i5LiQmaUz3xDgBakz=NA@mail.gmail.com>
Subject: Re: [oe] [PATCH 17/20] Revert "gimp: Disable svg icons on arm"
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2021 at 3:34 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Sun, May 16, 2021 at 2:11 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb b/meta-gnom=
e/recipes-gimp/gimp/gimp_2.10.24.bb
> > > index 237d08a09..e729d9deb 100644
> > > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> > > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
> > > @@ -54,7 +54,7 @@ EXTRA_OECONF =3D "--disable-python \
> > >  EXTRA_OECONF_append_mipsarch =3D " --disable-vector-icons"
> > >  EXTRA_OECONF_append_libc-musl_riscv32 =3D " --disable-vector-icons"
> > >  EXTRA_OECONF_append_libc-musl_x86 =3D " --disable-vector-icons"
> > > -EXTRA_OECONF_append_arm =3D " --disable-vector-icons"
> > > +EXTRA_OECONF_append_toolchain-clang_arm =3D " --disable-vector-icons=
"
> >
> > thanks. I will verify it on gcc/musl and clang/musl scenarios and
> > perhaps its really the musl piece which is problematic
> > issue is qemu segfaults :(, qemu is also upgraded in master-next so
> > maybe even musl will start to work.
> >
> > >
> Hi Khem,
>
> This starts getting interesting: Currently I see build failures on
> gimp. This time not on svg conversion but for png. Something like
>
> | mkdir -p `dirname 16/gimp-dashboard.png` && GEGL_USE_OPENCL=3Dno
> GEGL_SWAP=3Dram /home/superandy/tmp/oe-core-musl/work/cortexa72-mortsgna-=
linux-musl/gimp/2.10.24-r0/recipe-sysroot-native/usr/bin/gegl
> ../../../gimp-2.10.24/icons/Symbolic/16/gimp-dashboard.png -o
> 16/gimp-dashboard.png -- cast-format input-format=3D"R'G'B'A float"
> output-format=3D"RGBA float" brightness-contrast contrast=3D1.5
> cast-format input-format=3D"RGBA float" output-format=3D"R'G'B'A float"
> | Fontconfig error: Cannot load default config file
> | make[3]: *** [Makefile:2409: 16/gimp-dashboard.png] Segmentation
> fault (core dumped)
>
> This looks very similar to what you reported when all these
> '--disable-vector-icons' started to come in.
>
> Looked into and am convinced that this is not a architectural/musl
> problem (btw - it is native gegl that crashes) but a race. GIMP-build
> intended 2 steps:
>
> 1. create png/svg in ${B}/icons
> 2. let gegl convert these icons to *.c / *.xml
>
> I think step 1 is not completed before step2 starts because on each
> run segfault happens at different icon.
>
> Long talk: Am working on this...
>

thats cool Andreas let me know how can I help.

> Cheers
>
> Andreas
