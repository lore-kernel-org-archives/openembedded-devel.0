Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.603.1630084303954179071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 10:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kOOubeXa;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id 2so1319146qtw.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hASFHvIUZlb+ofQO544oWGc1W+0rugoC0cHoZ/bT0KI=;
        b=kOOubeXaHJ3y8icMUUGZQPBYuqRtrVOImMyd1cH8On9bE1GQwo1p75QL9B4xdS6HHB
         QTg/3AtKUZ6h4cGdvdEVVRtxQxt4Tz2xDqqG08x7HWUUNvWYUP999EgYYfmXvYJiZfR1
         m2LaJ+6vni3TvK69pSE4DcJWBL4Vofmwo+94JyXWWyWkAtYtbKOSQFFUD+2yJwGECgiJ
         dj3615eYRAOToitc2V8cAWQsucYzs636z0tDacFUUxjhB/oyyioGFA8fZiGcia/9pZt6
         QvzKqptz66x+sVGVjACNP2qpylx5jIkWsBiNxaFOoShtLHrC+rj8zvl638ajf3nuwCyj
         uPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hASFHvIUZlb+ofQO544oWGc1W+0rugoC0cHoZ/bT0KI=;
        b=lVZlRTp1+BSx0tdXhu2lloOk0TxDbY1dCOQ5+ncIZ02hiJm8mLXwjK5FmExLwc78T/
         D9jYEzcmCALEwCQzBjfDXUXBPe5ehW8PB7w0uxs+sUMTmrcWtQ4Ptz/IqOYZ55tzEYGs
         QEcsWz32mvwopzaEteoRzwhmH37zVKSZN34taNdhzDia9MM1RPZ0d9tUdcYNHk0jSO8P
         wch4fjrocxgXU2JuW0U3p/1Nf9umwzNVgUTJKjbIuCrOup5Jl4/0cqW6ORh5EF0lAAvn
         MmKtjIDP1VK0ULGnCrTOX/rBRLbawQ9B7ldVEYAgPPeRXYI7XvPlI4pdauAmPBdpWJwr
         8tZA==
X-Gm-Message-State: AOAM533CRMVrar5CLP8vXgeu4UElggxQLcvHdCLVkVToKHLMxwrMa9jk
	IddMkvJmV1mOZIOmZyEglnWz+lDvnNOCVJ8Zcc7STh82z+k=
X-Google-Smtp-Source: ABdhPJw4F3iggHi+ZbIuD84dsXZvPRJcjDq1h3aEl8CdMPR/2wi/2GJ5AHE1qUwueplXHtXAVuPsvB1tqx5vBxIGLHA=
X-Received: by 2002:ac8:1112:: with SMTP id c18mr8975673qtj.289.1630084302867;
 Fri, 27 Aug 2021 10:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210827084346.2770947-1-zboszor@pr.hu> <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
 <32da7686-4098-2025-bbf4-43aab27c9f4c@pr.hu>
In-Reply-To: <32da7686-4098-2025-bbf4-43aab27c9f4c@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Aug 2021 10:11:16 -0700
Message-ID: <CAMKF1sqPuFD9FiDKOZLKGxZ_adC2D0=ps48crffTtx0oG01jBg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] metacity: Use autotools-brokensep
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 10:04 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@pr.hu> wrote:
>
> 2021. 08. 27. 18:49 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >
> >
> > On 8/27/21 1:43 AM, Zoltan Boszormenyi via lists.openembedded.org wrote=
:
> >> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>
> >> The split build directory causes a make error because
> >> build/src/core is not created during the build but generated
> >> sources are moved to it which fails.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >> b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >> index a5c704740..969fe13dd 100644
> >> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >> @@ -21,6 +21,8 @@ DEPENDS =3D " \
> >>   # depends on startup-notification which depends on virtual/libx11
> >>   REQUIRED_DISTRO_FEATURES =3D "x11"
> >> +GNOMEBASEBUILDCLASS =3D "autotools-brokensep"
> >> +
> >
> > this does not fail on jenkins so I wonder what are the conditions to re=
produce it.
>
> Fedora 33 build host, master branches of oe-core and meta-oe.
> I also use meta-clang and meta-intel.
>
> The commit message says it all. metacity-3.40.0/src/core exists
> because it was there in the tarball, but build/src/core does
> not get created automatically for some reason here.

the builders are ubuntu 18.04 and I wonder if there is some race
condition here in creating these dirs
Does it happen all the time?

>
> I can carry this assignment or the equivalent B =3D "${S}" in my local bb=
append.
>

I think if we can understand the underlying problem we can fix it in
code itself.

> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
> >
> >>   inherit gnomebase gsettings gettext upstream-version-is-even feature=
s_check
> >>   SRC_URI[archive.sha256sum] =3D
> >> "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
> >>
> >>
> >>
> >>
> >>
> >
> >
> >=20
> >
>
