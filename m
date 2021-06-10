Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3420.1623283377668393352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 17:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n/tlqI3s;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id k5so2574455pjj.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IV33CiJn4TsyPYchKagbzAB9hBP174AR4FxcFfXruwI=;
        b=n/tlqI3sG9wEvqyN+yZWEeyxDrnFf2e8RuYYG9Oaz5FLFpR8kMd92LfpjfAZLc0pYo
         MuYkABjL0f2WjyYj6NITQuoSK/ViGtWPTV6OlLXQRMJWNCbI7bIRo0ZdEnkftwMWEm9D
         T/kkxZmipXImYIbR8JWYhkPsp3ueasNY8OyHMTx1JpTdECnNanlnsu7qwSBfJQw4oznK
         Zb573kchUesoIPH7eptcdL7Nd4DdYUvch6naEwxcgyBGbLMpgzVmdwC9vNF/AbiYcPQg
         V72Q5NJV4gVbki7ltuZoNqSuyCaME6UtB8p4Ro8ABGw5Sw8YUtAUh8s6r00p72V5QqLd
         sKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IV33CiJn4TsyPYchKagbzAB9hBP174AR4FxcFfXruwI=;
        b=JqZZSHfeUIOWxwCVYi9gskRpvJuvaLJbOk0CiyyMTMyn6U8bEuayGz+RImvVG56IzN
         DlVvvqdbmViuKBlxNOxgCtWUlpMOXUr7PHfw5WmXu3s8CXCuxaRPhAGv31vAeHlhqrQ4
         2XhQTGEaWCWQ2j+TxkMzHrC3tUgFzNhBIodm6NetQHYHLUCbplId9MBYiDj67G6DkwB4
         WAgbQSk3k1/Uv0MU834vCPblBlM3We/r/nSRvqQF+Ijl0QmQDqg8DUoendDG/Ew7Z+BI
         qCK27uIdK00Ha+rBPDNPDhHVHA/rh92R/zARPNpSznQP/uakwNuxB5KRKEcaDkzP3EH6
         vM8Q==
X-Gm-Message-State: AOAM5311ueOOilCnOm0bbxdF+xuB3lVXP+vmA68AmkEHaAQbsgJuLtCx
	YQCDNBtrH2GQz5cdBaVmOoRodVJZzXkC7WRLmjw=
X-Google-Smtp-Source: ABdhPJzSedXHUyxODbS1FXbyiDWqsLkIA/pUqhIKRu+Gqeipmy3LygmI4YU7l9Pe4xtUnbRFjheZo4Uhburtd5R5mJs=
X-Received: by 2002:a17:90a:4b0d:: with SMTP id g13mr261872pjh.77.1623283377186;
 Wed, 09 Jun 2021 17:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-17-schnitzeltony@gmail.com> <CAMKF1sq89Sg8RQTU6nY-gP-7pmi=_pCPt5VCfQRZ=Dz4O=1Fjg@mail.gmail.com>
 <CALbNGRRRfBE0msHyE9GUiewQhmH7VY-qm4ZanXebhsCqKm0eRw@mail.gmail.com>
In-Reply-To: <CALbNGRRRfBE0msHyE9GUiewQhmH7VY-qm4ZanXebhsCqKm0eRw@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 10 Jun 2021 02:02:45 +0200
Message-ID: <CALbNGRQ5aux16KUTDZ9Fxih=FcOkUR1jW+wyvRayC6S8nyw0OA@mail.gmail.com>
Subject: Re: [oe] [PATCH 17/20] Revert "gimp: Disable svg icons on arm"
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 12:34 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
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
> problem
* Changed state from convinced to sure: repeating 'bitbake gimp' few
times without any changes finally turns build green
* Tested: Common workaround 'PARALLEL_MAKE =3D ""' does not help this
time. We need a proper fix - sigh
 To be continued... time for zzz...

Andreas
