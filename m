Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.166.1632415679195142581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 09:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cm3BvD27;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d8so6780525qtd.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=psQ4HEvyYx4LpdkBICIfsJLXiu0/IgwxyU34joZ4BNg=;
        b=cm3BvD275a9zGu28LVH9LNwW2SK1gvjqLBNWE7eiNLzcNHR9oCpdVxTL8qi5PlS2hM
         x3ZZfoS9RxY0zSJXgishTJm0LljKwWL/ruZN0w6PsJ8RYAyAU0W69tTzp/ueXE6MMSJu
         t+CoQ0CcYYlVDAFYJtqOXEXEixuOFjijw4eJteF7JCWccDkvAm1GP3xj6SYQksCxkK5a
         9aoOSqELYE4GXSFfwNs/pBT7ag/rm7h1kbUCvEpT5MUzg4bA5LtSaRkSR6iyFEw7fZbg
         6n0o6cq3LXg3ceUWcgNiJjspt0OaTQYg02N9yCeLWjhCPcXaf6q3YnqcvOvc+GQvNIj0
         f1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=psQ4HEvyYx4LpdkBICIfsJLXiu0/IgwxyU34joZ4BNg=;
        b=wOm5yIF58s2Md3HLy6LnYHXnFEPRlEmj6xDzmIB2T8lTveGybFzKoGoPY2Fg2lnJkv
         E31DCRiHgGYljSiTbhflUG6dPsTrh2Kv7/IqatjRuXXVCHBWRqkaDStUykfSo28Jt1pj
         HyHlIAfTdG0iCsPscegYYcN+HBzrNNIEqGzvqKjjl96wEHB7dTqsabsCz5iCtFBbfRQ4
         hPJfIdxY8MBJG460k4kBH0pVOZa10APLpYJgITdjmuY6Dm3MUkfsSqUYzN0nNOSwE0yr
         2uaE6dVdrh+r0LFXFhcdQ0irYJ8bN85Lh58Yz5rGBKi2/4oe1vguNmaAA8odaBMR3XAe
         M4pA==
X-Gm-Message-State: AOAM532oNURx1Kut9BOwtDM7pdKbFMpofVX6qeAKqtPrQKLRW0jl9rQl
	wBuOrvSYpKl2M2ZS4bOfSHcBYU39xtMmWLeJ7H8=
X-Google-Smtp-Source: ABdhPJwge6yPm36nLOYkPOnETH4HVYfs0amPEZc/tBYuEWZJZuFtT3kb99WfH4as/8hZsvnEZWjv6uIpBkQ5/lQTM00=
X-Received: by 2002:a05:622a:11d5:: with SMTP id n21mr5989348qtk.112.1632415678202;
 Thu, 23 Sep 2021 09:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210923150040.39332-1-twoerner@gmail.com> <941bb5b8-3729-2240-5cf5-2230efefa7b7@gmail.com>
 <20210923161702.GA6213@localhost>
In-Reply-To: <20210923161702.GA6213@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Sep 2021 09:47:32 -0700
Message-ID: <CAMKF1sowSEVZc=4ehXHM_p1HE4AOwRhAP5i6fq3_vSDR8UWX_g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vk-gl-cts: allow the user to specify the target
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 9:17 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Thu 2021-09-23 @ 08:52:14 AM, Khem Raj wrote:
> >
> >
> > On 9/23/21 8:00 AM, Trevor Woerner wrote:
> > > When building opengl-es-cts (for example), allow the user to pick whi=
ch
> > > target to build instead of hard-coding the 'surfaceless' target.
> > >
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > >   .../recipes-graphics/vk-gl-cts/khronos-cts.inc  | 17 ++++++++++++++=
---
> > >   1 file changed, 14 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/met=
a-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > > index f61921473..a9c41f1f7 100644
> > > --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > > +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > > @@ -18,9 +18,9 @@ S =3D "${WORKDIR}/git"
> > >   inherit pkgconfig cmake features_check
> > > -REQUIRED_DISTRO_FEATURES +=3D "opengl"
> > > +ANY_OF_DISTRO_FEATURES +=3D "opengl wayland"
> > > -DEPENDS +=3D "libpng zlib virtual/libgles2 virtual/egl"
> > > +DEPENDS +=3D "libpng zlib virtual/libgles2"
> > >   SRC_URI +=3D "file://0001-Workaround-for-GCC-11-uninit-variable-war=
nings-946.patch;patchdir=3Dexternal/amber/src \
> > >               file://0001-Include-limits-header-for-numeric_limits.pa=
tch;patchdir=3Dexternal/vulkancts \
> > > @@ -36,7 +36,18 @@ SRC_URI:append:toolchain-clang =3D "\
> > >     file://fix-clang-private-operator.patch \
> > >   "
> > > -EXTRA_OECMAKE:append =3D " -DDEQP_TARGET=3Dsurfaceless"
> > > +PACKAGECONFIG ??=3D ""
>
> ^^ the default is to not specify anything, which picks the "Default" targ=
et,
> in which case the cmake scripts in the source try to automatically detect
> what's in your sysroot and make sensible decisions.
>
> So the best option for users is to not specify anything. But I added
> PACKAGECONFIGs in case users want to force an option.
>

Please add this commentary to the recipe as well so users can use it
in right way.

> =E2=80=A6hmm but then the dependencies won't get handled correctly, unles=
s I either:
> 1) try to do the detection myself based on IMAGE_FEATURES etc
> 2) add all dependencies to DEPENDS, although that might confuse the cmake=
 probing
>
> > > +PACKAGECONFIG[surfaceless] =3D "-DDEQP_TARGET=3Dsurfaceless,,"
> > > +PACKAGECONFIG[wayland] =3D "-DDEQP_TARGET=3Dwayland,,wayland"
> > > +PACKAGECONFIG[x11_egl] =3D "-DDEQP_TARGET=3Dx11_egl,,virtual/libx11 =
virtual/egl"
> > > +PACKAGECONFIG[x11_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/libx11"
> > > +PACKAGECONFIG[x11_egl_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/lib=
x11 virtual/egl"
> > > +
> > > +python __anonymous() {
> > > +    packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
> > > +    if len(packageconfig) > 1:
> > > +        bb.fatal("only one PACKAGECONFIG of 'surfaceless wayland x11=
_egl x11_glx x11_egl_glx' can be specified at a time")
> > > +}
> >
> > Looks an improvement, but there is no default now, so what will happen =
by
> > default, and can be make some intelligent defaults based on wayland/x11
> > distro features etc.
> >
> > >   CTSDIR =3D "/usr/lib/${BPN}"
> > >
> > >
> > >
> > >=20
> > >
