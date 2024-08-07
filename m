Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2956FC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 17:40:11 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.39643.1723052402278422613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 10:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGV93aSq;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db35ec5688so97435b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723052401; x=1723657201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNQo6RNNc12/tV7FDDg6U6r9mtUYveXhukh+k2YLTZU=;
        b=YGV93aSqPRQPE23kti+3+TwIe7/Y1RQsqUMxknJ9mCpN/8kmTesKPavtGydDDPPFji
         tNORRWAtFtvdlJKNUigLwCXp0U42PzSXb+TdHmDfh2BK9IQgEk2Hm4z4fVJvofwSFOen
         QDmM/E+tY+Embm0AEz10L7jH/o/t1tBmB07fhJql30GhACdwExBGTBP12PlJrf6AP5xV
         CtSI2LsdUCVlxfro6IX7yXpV4ComeHQP8hXFZvW0fcJvRa4sjOTsJhv1ZiS1xjxzxkQE
         PkROBayr1iFUpsfeY3OLuDLgCHmK3q+guhYmHoP7tNjxG6D5fr48FIIQ76tm9Rmu5nJn
         rhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723052401; x=1723657201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNQo6RNNc12/tV7FDDg6U6r9mtUYveXhukh+k2YLTZU=;
        b=vlYBTFo+X2UrpSeNCHiap8YukpesCc+wSGDoBEPcr2J2kW+0etzifH5REyCdhak7S6
         kMFnXvEsKsFtghx3F3OhaeldpfhXN0K4dw0UdoqUR7hsTOTcK8uL/vPocWvoHnbWbu86
         gGqGdjRqdviKz97D9gHj8u37BQWU9FIb2oFnQpl1oX4ytegwDuHPii7Xmvg0bySZfhgR
         no1GECppjAiAqba1n0BrlmNnk784Pc5KPfz2j59v5v/auC36X7Aes4KP6M2T+E09G2Ae
         aK13YImIf37HGgPc2xZD/Z0k1GBA2Ey/SpvokNxyExurxt4uxZiRksMMmbRFbKM0fR92
         8U7g==
X-Gm-Message-State: AOJu0YwUTg/jhhoWnV3MBrXURj5Iylp3UiCAy1WsCpURp0RnGTLiBkgK
	86vZ0g84Ozuld/fh5/pcgsTM+wygtUli06vUKJGDd+H9Z0jSMHg/UGFQZeMUB/svJ7VDD0BwMW+
	HhUXrIl0c3vuy+oWrXADcADCbZtA=
X-Google-Smtp-Source: AGHT+IEpyg6h+3oeBNe6tzR2o6oMAgaIDruEYPcBJ08yJXvmXvOdUvPQDHPdpvomwDqz45kAUGfiRBmy9QayNKlXTbQ=
X-Received: by 2002:a05:6808:1384:b0:3d9:3b17:f752 with SMTP id
 5614622812f47-3db5581636emr25873731b6e.26.1723052401476; Wed, 07 Aug 2024
 10:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240807131419.150841-1-alperyasinak1@gmail.com>
In-Reply-To: <20240807131419.150841-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Aug 2024 10:39:35 -0700
Message-ID: <CAMKF1spi8-TBQ-R98yZcxJcgHXB+-wGP3pcT_SLHBDyfs3emWQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCHv2] python3-qrcode: switch to PEP-517
 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111636

Thanks for all the patches for fixing this PEP-517 build issues. It
would be good if you sent them as a single series instead of
individual patches, this would help us maintainers who use tools to
get patches from
mailing list using b4 etc.

On Wed, Aug 7, 2024 at 6:14=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> The project has a proper pyproject.toml which declares the setuptools.bui=
ld.meta PEP-517 backend.
>
> Fix:
>
> WARNING: python3-qrcode-7.4.2-r0 do_check_backend: QA Issue: inherits set=
uptools3 but has pyproject.toml with setuptools.build_meta, use the correct=
 class [pep517-backend]
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  Misspelled subject in v1.
>
>  meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb =
b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> index 204f4ecee..49cf62860 100644
> --- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
> @@ -3,10 +3,9 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4b802d2a65df4626623c79757f486=
af9"
>
> -PYPI_PACKAGE =3D "qrcode"
>  SRC_URI[sha256sum] =3D "9dd969454827e127dbd93696b20747239e6d540e082937c9=
0f14ac95b30f5845"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  RDEPENDS:${PN} =3D " \
>      python3-six \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111634): https://lists.openembedded.org/g/openembedde=
d-devel/message/111634
> Mute This Topic: https://lists.openembedded.org/mt/107768607/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

