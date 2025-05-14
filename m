Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7B3C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 21:49:34 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.113821.1747259373759560055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 14:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rl2OGRFl;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6066c02cd92so170222eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747259373; x=1747864173; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu7deR1f5Si7y4HFk0WJyIF9pm4S7wCw1+wE3fNWRgU=;
        b=Rl2OGRFlQK3chb7K7TTxoCew4hcgUk19yvSJsLMPnnKeBr60XzgryERf3x3Lm3fNa0
         2dhGhEVxOPhm1NAdCgFfkb3DFYdqmcTlNjwnbJ+X03bs3Bq1Q5D2mh4VrUzghmvbPf1w
         Czh7wFFuIVpFxzsbrP1Tyr12y+Y2dgmZM3Zce5lS3Y+RsuLie5iToTF3YKMkbdjgMbH4
         0+H5RjBAUil/qCs8jwCd1AARc1S9BQlOMYKG50jwaCMe82NMcrHCeo5+MpZhYtPKPJGT
         k6/Vem8S0hmh4rMPBDf//UrTfLrj7L/ZUIUux9xp2qTjKIsQathrOMjqKFx+zC4EnZdw
         O1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747259373; x=1747864173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu7deR1f5Si7y4HFk0WJyIF9pm4S7wCw1+wE3fNWRgU=;
        b=cCruLibAsHcV9RRezXuBRfI6iBOPb4vtMkb3I4ANAaiIMzfNRaPuDfDb/SiWX4CVP3
         zw7yoHPNyNWVyWoiPGhEMOvsUZn9fml2MuQJ3BT/VXa5k7/gtEEKNA9hjdIKEYPWwJnd
         rLq81KFbCcVXgtIgbnjhYo8KOKyJPcTxz5cWdsnuPGhrnPdV9bLbr8Adr6D8+pAOWJjA
         4fuDLiDJhGPLdxi2jBwqC8LwI4OwyforjwrGlLORrfXD3oPyGNut300VcrBw1cror6Op
         TQrDkoKkh4ioLDXLJojqotzPNy7erV0QKLlxNkfA1ZeQlJnzZPSPNaj1DAVecTeJgB0w
         j4GQ==
X-Gm-Message-State: AOJu0Yx2be/jxhW4D0EpPOLRDk53EibvCT+LmCdisvgglpCTvYk0JZV0
	j2f1NW2++vQVdOx7cmZrpJBFw5SCVyLgASpErzx5mCuD2sgWUvFQjmcjWYsMDTj6v4wierqXyW7
	pyyLswisvxPsuhDCvku2xUvld9Ao=
X-Gm-Gg: ASbGnctFdEfYJ8kD9lojLva3MreCCcyHXdc2Q/0GqUvW50tD/WcOMbzaD6GHjUAhKrW
	m2NKURp4B9tsJfyecPksfFYr+gfuK3C1zG8WEOxck8LKYgaDDA+/u/gQtFKnDcy1g/CQa23uLvs
	rDVbKCXO5XJqIL+/NWlcVEe7wMgRtkxQBnqd9F3fOR7x2GE6FLnfuM19Shs596drUNpiOpRNCW
X-Google-Smtp-Source: AGHT+IFIs9eMUFxNEKcQLiVGc6LE2SFpjPkZno4pFWBBQFa9jNoh1Cgz4Xznq2AvXyPkDeEoCanGYp0WKLApFYRCFY8=
X-Received: by 2002:a05:6820:8c8:b0:606:42b7:2b02 with SMTP id
 006d021491bc7-609df23e5f5mr2753233eaf.3.1747259372995; Wed, 14 May 2025
 14:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250514212249.74664-1-dmukhin@ford.com>
In-Reply-To: <20250514212249.74664-1-dmukhin@ford.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 May 2025 14:49:07 -0700
X-Gm-Features: AX0GCFtj1H6ndNaOY3tzi4cCxI5zjG91kKOJU1h7j77OyxPRLZKFJ0EO647SexI
Message-ID: <CAMKF1sohNMruhcU=HUP=iPbZwoGgDbcRbDUewSNcVxE_NB_=VQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] dediprog-flasher: enable native builds
To: dmkhn@proton.me
Cc: openembedded-devel@lists.openembedded.org, Denis Mukhin <dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 21:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117418

On Wed, May 14, 2025 at 2:23=E2=80=AFPM <dmkhn@proton.me> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Update dediprog-flasher recipe to support native class variants.
>
> Normally, the recipe comes with a USB udev rule. Do not package USB udev =
rule
> into nativesdk artifacts because this will pollute the host environment, =
which
> is not desired.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  .../dediprog-flasher_1.14.20.bb               | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> index 83a88ab75f..3d55b34a8d 100644
> --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -12,18 +12,32 @@ SRC_URI =3D " \
>      file://0002-Makefile-add-conditional-stripping.patch \
>      "
>
> -EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> +EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
>
>  PV =3D "1.0+${SRCPV}"
>
>  S =3D "${WORKDIR}/git"
>
> -do_install () {
> -    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
> +do_install() {
> +    oe_runmake install
> +}
> +
> +do_install:append:class-nativesdk() {
> +    # QA override: omit packaging dediprog's udev rule under /etc/udev.
> +    # The file redides outside the nativesdk ${prefix} and must not poll=
ute the
                          ^^^
Typo

> +    # host environment.
> +    rm -rf ${D}/etc
>  }
>
>  FILES:${PN} +=3D " \
> +    ${bindir} \
>      ${datadir}/DediProg \
>  "
>
> +FILES:${PN}:append:class-target =3D " \

I think we can do away with using target override here.

> +    ${sysconfdir}/udev \
> +"
> +
>  inherit pkgconfig
> +
> +BBCLASSEXTEND +=3D " native nativesdk"
> --
> 2.34.1
>
>

