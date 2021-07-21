Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.1975.1626888111938349744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzB0KNsK;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d15so2356113qte.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Iyk5aAK2MK7L4Och7EYz7YO9UU5HBzb/KQMdoO8DMZg=;
        b=IzB0KNsKrOGmkPdUWtmaI1m5D2ynQf1kD+5Bg9sLVJYYSbD4P6J1sAhKFNflG8FXZG
         QtNUvm7FUJvzdYtkcLkeVpJfj1TYmbrmpXKPthiFLGdmAfSZdqaFi9jPyjrJvmKLhGz1
         I56Nb4qPV/OkQ82SnA4mBnerLHuuD1QieohqamEvPZh7snUVDgLzVzSuyvlDIJWbpFHF
         K7upUiOvc5Wk+P2CA8o1UjB1P9wKMehHL+Cqx7PcnYZMrbDJOsXpVeeSZPPX34stGSfb
         nucQJJKl8kWC5mKYGmfnOW3jyGLrveENyJz0e+DsIn8oumEFUJJS2L8u5k6JxtXGbXll
         GwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Iyk5aAK2MK7L4Och7EYz7YO9UU5HBzb/KQMdoO8DMZg=;
        b=T4RHqrKUiFBwtPFJKRal9PTtUIzxIrWHN52GZSnrwtZGgEDU2rhJQiV7Nfr8L2+koW
         dGQeBU2vT1zL8fC1+ENTVMBj0vO9H3fiJrfg67tyFs1icqb1jc3qmTXGvs086MS9XQ73
         Or9NnzbvhuLtLTPSQIGqTRzEoa5jyPLgpwfTShuyRQPcgyj9o3x6FavtY2vAPX40etN5
         bqeEYHeTJW5uMiSDKJe5bAyoo2zthSrAwM/nOalvY/qdrzVmB7iLQZZ0lMwFH8sJ9CFW
         j9WyKHeTWVe0Vq+4s4E9eW+QJ5eLzbscNuzrtY9Lio3KeA+v/8P+m+MhLKCqo2rm+rHt
         8uTQ==
X-Gm-Message-State: AOAM531rHMALCWqpNMurG0jwIyCOfLN1XJBamo69uiakrzVDNkmrRdxJ
	uNZdgLe5vLTLhH85fC5yvM1CuIclcLNGC8MwZHU=
X-Google-Smtp-Source: ABdhPJzdzhaoDWKT4IMwvqkYiPYIF7fWZq4LM2c3jem2yhUizYh6nvjpSqps58SYTbEY2YA/4A+YZhbpdqIyiXGhMQo=
X-Received: by 2002:ac8:41cd:: with SMTP id o13mr22181212qtm.289.1626888111144;
 Wed, 21 Jul 2021 10:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210720061405.2255027-1-schnitzeltony@gmail.com> <20210720061405.2255027-2-schnitzeltony@gmail.com>
In-Reply-To: <20210720061405.2255027-2-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Jul 2021 10:21:25 -0700
Message-ID: <CAMKF1src_sGprN3FES8kHFE=0BL5JrP9+xO1Y+cAM8bois2=+Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] jack: upgrade 1.19.18 -> 1.19.19
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:14 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Changes:
>
> * Add jack_position_t::tick_double, and flags around it
> * Add zalsa "-w" argument to wait for soundcard to be available
> * Bump internal protocol version to 9 (due to struct alignment)
> * Fix alignment of fields for atomic accesses
> * Fix build for platforms needing __STDC_FORMAT_MACROS
> * Fix compilation of documentation
>

this fails to build with clang e.g see
https://errors.yoctoproject.org/Errors/Details/593001/
which is not a problem for this patch to go in but I thought you might
find it interesting

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../jack/{jack_1.19.18.bb =3D> jack_1.19.19.bb}                   | 2 +=
-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-multimedia/jack/{jack_1.19.18.bb =3D> jack_1.19.=
19.bb} (97%)
>
> diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb b/meta-oe/r=
ecipes-multimedia/jack/jack_1.19.19.bb
> similarity index 97%
> rename from meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
> rename to meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
> index 038e9ce11..934e994e5 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
> @@ -17,7 +17,7 @@ DEPENDS =3D "libsamplerate0 libsndfile1 readline"
>  SRC_URI =3D "git://github.com/jackaudio/jack2.git \
>             file://0001-example-clients-Use-c-compiler-for-jack_simdtest=
s.patch \
>            "
> -SRCREV =3D "5041ab0fe7fb719efa5122386d355397289a91f0"
> +SRCREV =3D "3e6ca6b734b69e2f5dfb85935068e15006fb5acf"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.31.1
>
>
>=20
>
