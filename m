Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87367C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 19:18:33 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.921.1682623103341355911
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 12:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M7p39T9y;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-42e3647a43bso2462786137.3
        for <Openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682623102; x=1685215102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKfcB09DOf/AKQSNQwPZ+MY6ls8pAPp7QuAvvjaqAg4=;
        b=M7p39T9y9sBWnH9vVWvRyrI+4Zg0jOQpm3YTCOQBiA6Wx4D9ZpfRnvLuRuZo+c7bD6
         EmxqUU//a4hZMKPPIZc1fdcVZZIHBQ48OrjwSx5X/t5Fdr79VbmL4028FViJH2kdjChm
         OKsW4qPyXeiF4t9Bak/u0oG90HNl0+JN884apq4oO3+wt00dv5ju8dH+tTr5ZXnhUcrQ
         VMnFRGh+82N7RSdMGMx8XNJsPqRA1p5UhjZ6I0PSyZPZKelc7Pa8Lm76RYWJJKwnYJfE
         K1yFbDS7ERzEA/APWQ8cjYB9QQAUc9m/81Qn8dQYj1cLvfw7yi6RmW+kBMUS5qRKrA4Y
         I9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682623102; x=1685215102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKfcB09DOf/AKQSNQwPZ+MY6ls8pAPp7QuAvvjaqAg4=;
        b=lXFdN++0EjAfn1NA1m6od3eJUIWLP5+4A8cxan5ej9/9OBsHl4CTfDZBrAUY3oRYrR
         tk1mB3r7uLYmKcDQ50a9FHJjDU5S5ESPUa17Lk+DO+eA2dG+3jCGTNjuTm7n0pqvuALN
         Xr52Csa/ReBRv9l03hwzMiSF1XwNURza4gDxlPfpwKRIvpVpKptCq5wRhpK4pq/JqXnH
         PA8fgjNYts5QkbHDAw6+2XaQ5JSlrnMmfGd5NKKf3kMOvfaY0GSFaXRYnnObAZeP5N3Z
         1EmOip4n9/SBVWjpBGgMGmnxrlTn5K5zi4wgsvTA6k23N9MJ33kvmUGeLMHyCFBPqqqZ
         bN5w==
X-Gm-Message-State: AC+VfDyycywXfoCc2O9cHNsRCUhYGTDQOZTRWk07oqMGd5mwP1PRWyoI
	E7N4qxizvyugqnrYrFzu9qsOHRGQ4+6Yec1dRW4=
X-Google-Smtp-Source: ACHHUZ5sWNO7nUzJo9ME0wRoGbo8WSChDq6zSx4YrJoHEbBSBNNXZsRWsCQ+HdYeHJlYcH+hUzvb88hqPrstuVx5J/k=
X-Received: by 2002:a67:f503:0:b0:42e:6689:d762 with SMTP id
 u3-20020a67f503000000b0042e6689d762mr1734399vsn.8.1682623102179; Thu, 27 Apr
 2023 12:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
 <5edc6746-3944-f358-1a49-06e67ff616ad@ti.com> <CAMKF1sr6mJH+-qU+R7oX0rbDtpOJ15zcxPEzre4_j9SHYVv-mw@mail.gmail.com>
 <88499b7b-dd39-54fc-2dde-21b5b3fef7d5@ti.com>
In-Reply-To: <88499b7b-dd39-54fc-2dde-21b5b3fef7d5@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 12:17:55 -0700
Message-ID: <CAMKF1so1RbiuE7gB9Hia+yZWG_UBu6c1SXs7TRPGyRoZPCyHCQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-oe][kirkstone][PATCHv2] glfw:
 add packageconfig and wayland dependencies
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, akuster808@gmail.com, detheridge@ti.com, reatmon@ti.com, 
	denis@denix.org, Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 19:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102221

On Thu, Apr 27, 2023 at 12:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On 4/27/23 12:35, Khem Raj wrote:
> > On Thu, Apr 27, 2023 at 10:34=E2=80=AFAM Randolph Sapp <rs@ti.com> wrot=
e:
> >>
> >> On 4/27/23 11:53, Khem Raj wrote:
> >>> On Thu, Apr 27, 2023 at 9:47=E2=80=AFAM <rs@ti.com> wrote:
> >>>>
> >>>> From: Randolph Sapp <rs@ti.com>
> >>>>
> >>>> GLFW has the ability to use a wayland backend. This patch adds a con=
fig
> >>>> for it, but does not enable it by default because it has a dependenc=
y on
> >>>> extra-cmake-modules which is provided (most commonly) by meta-qt5-ex=
tra.
> >>>>
> >>>> Signed-off-by: Randolph Sapp <rs@ti.com>
> >>>> ---
> >>>>    meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
> >>>>    1 file changed, 12 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes=
-core/glfw/glfw_3.3.bb
> >>>> index b31bba6b6b..5b0d61241e 100644
> >>>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >>>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >>>> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGL=
FW_BUILD_DOCS=3DOFF"
> >>>>
> >>>>    CFLAGS +=3D "-fPIC"
> >>>>
> >>>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcur=
sor"
> >>>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >>>> +DEPENDS =3D "libpng libglu zlib"
> >>>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> >>>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> >>>> +
> >>>> +# upstream considers x11 and wayland backends mutually exclusive an=
d will
> >>>> +# prioritize wayland if it is enabled, but wayland has dependencies=
 that cannot
> >>>> +# be satisfied by this layer so it is disabled by default
> >>>> +
> >>>> +PACKAGECONFIG ??=3D "x11"
> >>>> +
> >>>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland waylan=
d-native wayland-protocols extra-cmake-modules libxkbcommon"
> >>>
> >>> I wonder if extra-cmake-modules recipe is common enough to live in me=
ta-oe
> >>
> >> I'd be happy to offer up a recipe loosely based on what we've got in
> >> meta-arago if you think it's worth it, but it seems to be mostly KDE
> >> specific excluding this weird instance and a handful of desktop
> >> applications that aren't packaged by oe-core or meta-oe.
> >
> > We dont want KDE stuff, but the fact that enabling wayland support
> > needs it is less than ideal.
> >
>
> Given that this may be required for other components and exists to
> extend cmake should I make a push to integrate this into oe-core
> alongside cmake or do you think it's still enough of an optional package
> that it should be in one of the meta-openembedded layers?

Since this enabled wayland, I am interested to see if we can have it
in common (non-kde) place.
or make changes to glfw to not need it to enable wayland support.

>
> >>
> >>>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> >>>>
> >>>>    COMPATIBLE_HOST:libc-musl =3D "null"
> >>>> --
> >>>> 2.40.0
> >>>>
> >>
>

