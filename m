Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.4490.1586501415805162256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 23:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJlz1HMy;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id u2so857439iop.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0b/8myabYHvTcCxJ4b4snLioQWdAxY1fffpBYNWZeZI=;
        b=KJlz1HMyVnsEaQkTfUuoOVFbva18DWmkH9xh+thiigpzRG2NH3fquMgQupkGEza4+F
         sbLSdrTMRIrowxO1zxxXMXIZ6n96J7ygxrYT7V65BORPL/zZVH/vljxi+My1xxmVxuGg
         7WhslUPCaF6fpIf82FwxTvQOUoUSe6lQ10tbuW4pPBPK7GuZBnXf+bdOHOk4AaB36oJp
         Q4DwZjAnxA/K0qyzrbjChNDTj2YgwX6+JeScSngI+aY5HoGlEuU3Ql+sGk7sIvtRQqgg
         s+GXfl7VCfq2ey84YHmOto3Uk19oVJwO8jTzEItqrp2XFfG6UiVgDxM0poe0SIctaKDL
         ozNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0b/8myabYHvTcCxJ4b4snLioQWdAxY1fffpBYNWZeZI=;
        b=FdhhMVIjoYd02m7+IWCczdRPAHZXWbkDoCU11Qol+fKjnPzwFD364uSM6pYVtUCHJl
         EUZrPfjekdLgYCfI6acfJu5RZ6FAZF93alQoi8jIurV/DYWg3fD2BMdbueA40foIfU9I
         7fb5AKd5GdCFCEgNM0AKI5XPxA1PXo3MNkOrQPJjvNVm3DTD5gGTHpTdxz+zcgkYG7lo
         N27SMo3CsjQv5qp7Pg7F+J0aUQrDptPWCXp/BdN44xiUBdNrabKlaFbRlD56IDDccbyV
         KvkGUo/tPaPct2g+3A9ETZd1qYhCG+gRRDwDw6rNOm4RSZLP1FI/9Xp7fL1dt2kgcZ6X
         NmmA==
X-Gm-Message-State: AGi0PuY6roDfxsAJXpiz9aT4vHKDd5KosYeFkXCoChUex/pAQ5phZaWR
	NtplskfWQH03MNGmRTSO46E5vpYx5wvc4kFedY0=
X-Google-Smtp-Source: APiQypKZN518bVDEjxl7vUU3d1OeuZLvp4tpSGambmOgjIKsNb4ZaYdr339RADVgSjCwJ4URnj2RNnr7aXNMGshY37I=
X-Received: by 2002:a5d:8742:: with SMTP id k2mr2982207iol.120.1586501415256;
 Thu, 09 Apr 2020 23:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200410011113.1300661-1-raj.khem@gmail.com>
In-Reply-To: <20200410011113.1300661-1-raj.khem@gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Fri, 10 Apr 2020 08:50:04 +0200
Message-ID: <CALbNGRRoooGE7vzTb-Gq9GgN+i=--3BWmDyV6dDw0EBkqT=LxA@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] gimp: Disable vector icons generation on mips/armv7a
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 3:11 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Fixes errors like
>
> make[3]: *** [Makefile:2395: 24/document-print.svg] Segmentation fault (c=
ore dumped)
> make[3]: *** [Makefile:2395: 24/gimp-center.svg] Segmentation fault (core=
 dumped)
> make[3]: *** [Makefile:2395: 24/media-optical.svg] Segmentation fault (co=
re dumped)
> make[3]: *** [Makefile:2395: 24/gimp-channel-gray.svg] Segmentation fault=
 (core dumped)
> make[3]: *** [Makefile:2395: 24/gimp-channel-blue.svg] Segmentation fault=
 (core dumped)
> make[3]: *** [Makefile:2395: 24/gtk-select-color.svg] Segmentation fault =
(core dumped)
> make[3]: *** [Makefile:2395: 24/gimp-channel-alpha.svg] Segmentation faul=
t (core dumped)
> make[3]: *** [Makefile:2395: 24/media-floppy.svg] Segmentation fault (cor=
e dumped)
> make[3]: *** [Makefile:2395: 24/gimp-business-card.svg] Segmentation faul=
t (core dumped)
> make[3]: *** [Makefile:2395: 24/gimp-channel.svg] Segmentation fault (cor=
e dumped)
> make[3]: *** [Makefile:2395: 24/dialog-information.svg] Segmentation faul=
t (core dumped)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.18.bb
> index 838bd374a1..5a58f48ec3 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
> @@ -45,6 +45,9 @@ EXTRA_OECONF =3D "--disable-python \
>                  --without-webkit \
>                  --without-wmf"
>
> +EXTRA_OECONF_append_libc-musl_mipsarch =3D " --disable-vector-icons"
> +EXTRA_OECONF_append_libc-musl_armv7a =3D " --disable-vector-icons"
Maybe you should mention musl in commit message?

Andreas
