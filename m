Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.738.1602689676197865956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 08:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uJeN0gs0;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id f21so3038520qko.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W8ttypHwFBrTeL4ZAw6Oy96nI8dj6L9j3HanCElnzm8=;
        b=uJeN0gs0PxcOpTogVpclAjJaXV/WxlpnprLeCc8IXieMJCX+QFelldzmlp2XUbPSzA
         VZI8loDoxtlQ1a5QS6i0tpeH1/hfH/ZL+sJG+ICmT9lJTI1l4Klt0nkLhV4vI8pq4E0y
         RNxSBVRa6TVLslDpaAua29ZiO0iQ9wyobzmip8fBcsGgTT28ae4ZRn//cq/oir85lESk
         n5hDcansMI1ovGHZmB3kBfGIyHsYDniX5d3pBxmyCDvDLWq8q7OJQK5ZgZNMWG+FCYmi
         TwXn2JE3yHpcqlRNT4j6VnqdLfJS8TeY6hBsEM1Usane3cGWTrqNTkKQLEhPD4yx+z/g
         s9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W8ttypHwFBrTeL4ZAw6Oy96nI8dj6L9j3HanCElnzm8=;
        b=AodsFoL4YMRM8HJzebCezh651b0DL/Z4kxUomDK4XanUy2f8aI/pe2yV615oJj4sXR
         C6MXjDdJirSyCYYFedL4SaW31Hy3/DvhJ+Rb6A0CdCBEeb7eO0pVLVgTFZjYZF9E6csD
         LeONmEg8gjkfIRkJEzQZA2EyMv3HBDUgwrQHxzAucwt256IngYO7RJPN/v+3jvKHbwqE
         dvQKSZFErxxJLoGSNdT5Ubw9fkG+DGlzvXZzyWu+9O+4lnwQqHUMGf1rYxYLmD2BXUd5
         ZIn+c7f/VCmH9wnLpowYsHqNt7d036u2ETTfBLPJsn7JOPebz2DjQ30gveq4Id90QpoG
         7cPg==
X-Gm-Message-State: AOAM531DKWbh5yf6ncF7At5WzRC14A4IYspCNCYBIml2izdRBoDlN4u+
	WlM+E4CgTZDLV6BFw7tWC9v0of9LMCVB2qHx/s0=
X-Google-Smtp-Source: ABdhPJw35aEuQp3CpLq5BGjvV3IRKMN8TwyduvBeA3Rw+HYf9ErPQArl5s/u4W4P1dlTyHlqUYS0kSk9UCpocBqP0do=
X-Received: by 2002:a37:4015:: with SMTP id n21mr5623305qka.212.1602689675226;
 Wed, 14 Oct 2020 08:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
 <20201014010617.1086948-3-schnitzeltony@gmail.com> <CAMKF1sr5XQrxteG2Qg3dmgZ=EuVeRixnT-yp6thHFYreohL4SA@mail.gmail.com>
 <CALbNGRQ_KfvVcWYO-VXO40PEb-vsd4PKSUktWXyAeLTAtCQm7Q@mail.gmail.com>
In-Reply-To: <CALbNGRQ_KfvVcWYO-VXO40PEb-vsd4PKSUktWXyAeLTAtCQm7Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 08:34:08 -0700
Message-ID: <CAMKF1srYD5muqHRfJWTfzN45WKGNoVYQE_XWJaquxarf3Czu0g@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/8] wxwidgets: add opengl PACKAGECONFIG / enable it if opengl is in DISTRO_FEATURES
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 1:52 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Oct 14, 2020 at 7:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > -PACKAGECONFIG ?=3D "gtk"
> > > +PACKAGECONFIG ?=3D "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'openg=
l', d)}"
> >
> > libglu also needs X11, so checking for opengl won't be enough
> It's not that simple:
>
> * wxwidgets has three PACKAGECONFIGs for the backend: no_gui/gtk/qt
> and users should (there is a note in the recipe) select exactly one of
> them.
> * For qt and gtk x11 is added to REQUIRED_DISTRO_FEATURES
> * PACKAGECONFIG no_gui (the only non x11) is marked as conflicting with o=
pengl
>
> =3D> To select opengl successfully, x11 must be in DISTRO_FEATURES. Hope
> that's good enough

right thanks for explaining it here.

>
> Andreas
