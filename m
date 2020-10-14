Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5210.1602654657510392475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 22:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZzXpJp8u;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id s14so240440qkg.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5WRWenxoHcQCKhpH9Ob8FvdHWZHOFQJpf5W8298x/jY=;
        b=ZzXpJp8u2NUGbpmcfg1O93wyJdin+o0Xf3Bu5waDb5aNTasMQT6Asu2R/4Hcbj9UqC
         CVm5DyeNtXqivIega8ktN8NcrQAAVSaONHBeGWAUv039empygJrxt96NRZal3b14Nt1q
         Jt83qGM8iE4o5ML1VCYBSuQhzavDEVAu58+QbVa6EBa7IID5KYdgkS7SA4bn7vrVYECS
         pXaxVTZPbHWd8Rl7bwLKy+7WfNmOIp9wWvvU0tGx4LaxCsiiT2JGAPHN1bCZxXEziwT8
         9xxw+kWzjmKK0qaEj8j8MCuMWtXymezIFVKeAfaifVI/Z6jW5ahk2BRlTnRJZkAnbPLd
         WThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5WRWenxoHcQCKhpH9Ob8FvdHWZHOFQJpf5W8298x/jY=;
        b=uLP1ms6mDz2SFiWwX/6zpxFB3p4HU5bk8iAStJ11nSC6kphfqcSaZWdizGAA6U5QSM
         OEIB+BCYF1VGHHsFakU0w3GWdVNHzwkmwm9tkHfeSB6/crz1wqNi9lsa7Ge+8dlfSAwH
         j+uFeGJusVcXddQl4U7+TmZHjLJJkk7sdtiDr48wJMXUFxjf1w76JXoGPGWfrWrE72og
         PBtYV2H1X9NOWWJukF73UOXu7YFNrU13HZTTBuvE5d2THilXskkeYs03G2cI5R9dkRHN
         KHyPFCOJDPgUJA2I5EbQLK6LWWeJcyQ6HCMb3Mgjuu4E1GmFFwXsRd3qop2sbT0e0b04
         uSmQ==
X-Gm-Message-State: AOAM533aw+kxQWwM9fgUoToMPmla0HaguxN7UWjDV/AmIfGsnGEpXIme
	WkRj1OVsEB7Ra+hhqGJjdquyTODzNb5rrBSYNOo=
X-Google-Smtp-Source: ABdhPJxy1+BKckmiw3j+87KFAV+s/ajR+Ts7vDew59niYPy44sUNBjFFhJq+9T2GpJ09bxsYRA/BTAEGmeg6VVQinsE=
X-Received: by 2002:a37:4015:: with SMTP id n21mr3585042qka.212.1602654656514;
 Tue, 13 Oct 2020 22:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com> <20201014010617.1086948-3-schnitzeltony@gmail.com>
In-Reply-To: <20201014010617.1086948-3-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 22:50:30 -0700
Message-ID: <CAMKF1sr5XQrxteG2Qg3dmgZ=EuVeRixnT-yp6thHFYreohL4SA@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/8] wxwidgets: add opengl PACKAGECONFIG / enable it if opengl is in DISTRO_FEATURES
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 6:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-=
oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> index 1d3c972da..95a6e8527 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
> @@ -39,10 +39,10 @@ EXTRA_OECMAKE_append_libc-musl =3D " \
>      -DHAVE_LOCALE_T=3DOFF \
>  "
>
> -PACKAGECONFIG ?=3D "gtk"
> +PACKAGECONFIG ?=3D "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl',=
 d)}"

libglu also needs X11, so checking for opengl won't be enough

>
>  # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk=
' / 'qt'
> -PACKAGECONFIG[no_gui] =3D "-DwxUSE_GUI=3DOFF,,,,,qt gtk"
> +PACKAGECONFIG[no_gui] =3D "-DwxUSE_GUI=3DOFF,,,,,qt gtk opengl"
>  PACKAGECONFIG[gtk] =3D "-DwxBUILD_TOOLKIT=3Dgtk3 -DwxUSE_GUI=3DON,,gtk+=
3,,,no_gui qt"
>  PACKAGECONFIG[qt] =3D "-DwxBUILD_TOOLKIT=3Dqt  -DwxUSE_GUI=3DON,,qtbase=
,,,no_gui gtk"
>  python () {
> @@ -63,6 +63,7 @@ PACKAGECONFIG[gstreamer] =3D "-DwxUSE_MEDIACTRL=3DON,-=
DwxUSE_MEDIACTRL=3DOFF,gstreamer
>  PACKAGECONFIG[libsecret] =3D "-DwxUSE_SECRETSTORE=3DON,-DwxUSE_SECRETST=
ORE=3DOFF,libsecret,,,no_gui"
>  PACKAGECONFIG[lzma] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_LIBLZMA=3DOFF,xz"
>  PACKAGECONFIG[mspack] =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DO=
FF,libmspack"
> +PACKAGECONFIG[opengl] =3D ",,libglu"
>  PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,=
libsdl2"
>  PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_=
WEBKIT=3DOFF,webkitgtk,,,no_gui"
>
> --
> 2.26.2
>
>
>=20
>
