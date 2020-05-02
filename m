Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.702.1588397181299939142
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 22:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OqSelfnI;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id g26so5794745qtv.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 22:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=kPWukKvXyW7KTbylIl9P5rqPxILZ56io3VNsskv1djM=;
        b=OqSelfnIzVj5DLfHnfiTA8c4gpfTDwvy5xMrueMUx9s5JIeC/fNziTcmNNQUmUoHeu
         3V1lTLUmFKitR4DLru1Ax8ccl80vAT1sa30dzBTNfh3mTB3r5w2XltDKxp2zeiFBosWQ
         GSOjFiOlyqiu/q5oYcDI7/0kn9uGIuOSEUp5pEiK1BgzomYGyGye2arU+sxewhX5BSpl
         DFqvoFHlBck5rCuKhof4LY4SHnZ+gefacoZNDIa2PtiuUatd0/PxJSJXHwN2NNzW3eJt
         IcTWG5DLOwMpTINzwDhMoGvMTb9IDwawZV0DcftzoPDNt/ONZXFHbCvEE35eIRhRWcAd
         Znaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=kPWukKvXyW7KTbylIl9P5rqPxILZ56io3VNsskv1djM=;
        b=Kk/pI4JqjSlojh4aLRelwYbc6aT2j44SimsI9ZHnRK+0g5EdPvK0wE6JKAWiF1e2bv
         5Q2NWzIcGB96rSc+yIMBDikOOwQg++dTbZw53rSsx6e4XxX66Uv17oo/9vvVvbG0/lVY
         wXyP6pI4MZjge7enrw14gSGdvp06kU7tGuXtF7bwRKdnSyPQEoTSe76HDt2ylN48RKQA
         n5PfZMZeUfnrAlt/wjFQE5HxAoqRg4Y+hM0nZat+pcT6b7boxlFbXi1+CxN49wmaEDSG
         FO/MriWr17X5EppbbA4kNGC72QgpHG6bgGD5F9MInuN0tHSdLCTjbZAFK/TV12OyqHwV
         kkJg==
X-Gm-Message-State: AGi0PuYjdul22qrW6XcJ02S7P900tkVvrCXUIP1jt8Ziwpw0JlKYQv1s
	zTtLHYtJjNYz2XAhxcJrDoz17hMT/GD/1zbXiWpD1caY53c=
X-Google-Smtp-Source: APiQypI6ZPXKoI+pHfHLcdmCMOCnwYkG5byFxLd21Kmg+33EroPpxUveEWPD0uivuBmtYZDeJzj52d4vMqgVAQWudjo=
X-Received: by 2002:ac8:66cf:: with SMTP id m15mr7279713qtp.146.1588397180103;
 Fri, 01 May 2020 22:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200501113534.16030-1-schnitzeltony@gmail.com> <20200501113534.16030-10-schnitzeltony@gmail.com>
In-Reply-To: <20200501113534.16030-10-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 1 May 2020 22:25:54 -0700
Message-ID: <CAMKF1so0ve_FuQJafWSxtJ8Mz7M0vZkZNhd7oK76SEN4Xu_mew@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/10] qpdf: upgrade 9.1.0 -> 10.0.1
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on mips

https://errors.yoctoproject.org/Errors/Details/409858/

I think you need to perhaps link with -latomic on mips

On Fri, May 1, 2020 at 4:36 AM Andreas M?ller <schnitzeltony@gmail.com> wr=
ote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-printing/qpdf/{qpdf_9.1.0.bb =3D> qpdf_10.0.1.bb}   | 4 ++-=
-
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb =3D> qpdf_10.0.1.bb=
} (85%)
>
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_10.0.1.bb
> similarity index 85%
> rename from meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
> rename to meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
> index 44a5fea84..f04e437d3 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
> @@ -7,8 +7,8 @@ DEPENDS =3D "libpcre zlib libjpeg-turbo"
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
>
>  LIC_FILES_CHKSUM =3D "file://Artistic-2.0;md5=3D7806296b9fae874361e6fb1=
0072b7ee3"
> -SRC_URI[md5sum] =3D "090d03ab179c281233f8240ade179d54"
> -SRC_URI[sha256sum] =3D "3abbbb7907f2e750336b9c97e67b6e806aca91ab537402e=
c080656d63940ed79"
> +SRC_URI[md5sum] =3D "eb7fb7c6cd5d3036bf4f7a5e3f44d995"
> +SRC_URI[sha256sum] =3D "5d2277c738188b7f4e3f01a6db7f2937ed6df54671f1fba=
834cd3d7ff865827b"
>
>  inherit autotools-brokensep gettext
>
> --
> 2.21.1
>
>=20
