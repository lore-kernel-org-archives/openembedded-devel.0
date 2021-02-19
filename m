Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.11115.1613752470923879704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 08:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ave31S+X;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id h8so6054706qkk.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 08:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UdV1kzVR8rNVwuFRrz1vLXL3QRWK6jP/s1CrVHEHQ2s=;
        b=ave31S+X5LA6uce8FItb3ow+XBW+pDhxoJcaIFWLe7jwtFUVtt/be0x+Zhkk/haYYz
         Fw6DyagRF/S+cR+1wKRhm0v05sbPjYG/f6Yhie9WozY7RmbZKxNVEVNePEWxpPSGkON8
         DCx7TalfjGgKGzsaIxgD67VQjnvtKjTnkhUClGGejE8Yp4d6Qoli2OgZjXdrNXk+j08M
         lmNZbe55iqTtZ57v2GVhTQHlu/EkOmzHxvhXFrbMpnSoXFtMBNqijZuf98w30OxR8ZA4
         CtlqocT/PF2pCZYiqZX/rs8im4CxOVvmG17F1E2JND9xF3zUDfpoYJWFHX3jux4gUEC/
         ZLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UdV1kzVR8rNVwuFRrz1vLXL3QRWK6jP/s1CrVHEHQ2s=;
        b=X/1CpOKmW3HgT/nhmSHrVgPRgV4QXs9Bvjdrm0B7xpM7cxCPPq164rTZm3cMo9wVUx
         plKpifo+g5WXWJoWggS8SV1R30EHknaIXwn2z+ipe4tXY3ewKOsDmTL4EK+/ORqyDU/r
         7y4ViJqe00EJGtA8MwyOrkFmrqlq+k4e5vsXEkExyM8LvY9jcYNSVYJkNrTlXYwYQ5Hr
         otDt5VuK3tzg6BImCzm8uOxAtkf+0aKIQv2b5tEUldMCKQrPzatPG3fILQKlMTeHqx32
         ZHdWMfPg3E4PpfBQqTHHYa2NGErn+b8r22y5XCSjPAQ+rmiRtzkxr1tPVE2f3QKRmp8c
         cOaA==
X-Gm-Message-State: AOAM530BKcmqwZX4/lC8dvIZLl9HWPod3L6d1vsYS/oLPocPGZKBcfWt
	Z+FFxkAohnKQPrYs/bALoahpjseYGKLQrpnQ2R4yFnLqX+4=
X-Google-Smtp-Source: ABdhPJyek+KN1N9QkvOyzcjGNsob64AduqMSfUoT3vidTF7gnleR7uKOmLyvj/P4MdqAFTazatMOxELA6RoqYPlNniY=
X-Received: by 2002:a37:e13:: with SMTP id 19mr10115139qko.119.1613752469848;
 Fri, 19 Feb 2021 08:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20210219085229.25707-1-yocto@bsorensen.net>
In-Reply-To: <20210219085229.25707-1-yocto@bsorensen.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 19 Feb 2021 08:34:02 -0800
Message-ID: <CAMKF1srC8Nej+pDK2nqepYBkqazBs4aFrSW+F8du2UXUy7D6eQ@mail.gmail.com>
Subject: Re: [oe] "[meta-oe][PATCH] libgpiod: packageqa problem => static python lib to ${PN}-python-staticdev
To: =?UTF-8?Q?Christian_B=2E_S=C3=B8rensen?= <yocto@bsorensen.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, chbs@prevas.dk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 12:52 AM Christian B. S=C3=B8rensen
<yocto@bsorensen.net> wrote:
>
> Problem:
> QA Issue: non -staticdev package contains static .a library
>
> Reason:
> Both /usr/lib/python3.8/site-packages/gpiod.a and
> /usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.
>
> Signed-off-by: Christian Br=C3=A4uner S=C3=B8rensen <yocto@bsorensen.net=
>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-o=
e/recipes-support/libgpiod/libgpiod_1.4.5.bb
> index aec50e7e6..ab9639fc2 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
> @@ -27,7 +27,8 @@ PACKAGES =3D+ "${PN}-tools libgpiodcxx"
>  FILES_${PN}-tools =3D "${bindir}/*"
>  FILES_libgpiodcxx =3D "${libdir}/libgpiodcxx.so.*"
>
> -PACKAGES =3D+ "${PN}-python"
> -FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
> +PACKAGES =3D+ "${PN}-python ${PN}-python-staticdev"

why not put .a  file in ${PN}-staticdev

> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*.so"
> +FILES_${PN}-python-staticdev =3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
>  RRECOMMENDS_PYTHON =3D "${@bb.utils.contains('PACKAGECONFIG', 'python3'=
, '${PN}-python', '',d)}"
>  RRECOMMENDS_${PN}-python +=3D "${RRECOMMENDS_PYTHON}"
> --
> 2.25.1
>
>
>=20
>
