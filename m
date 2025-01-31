Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F4AC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 18:03:13 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.25792.1738346590236678204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 10:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WEMInQDB;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f314ff6ffdso1302220b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 10:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738346589; x=1738951389; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QRhs7XkxKfBtzVDY1/Pn3fL2uR3pe+Pb+5cqnuXWzA=;
        b=WEMInQDBtvrIEFqq8nLcp7c2QDRj0Lcok4OrMW4iStNW7iMzVUMSvKooJU3h8UnoGf
         E1z5HCLlkkvSKDSQutWMNwQThk3XNzKlNc6JlPDcsm7oXG6fXiYc0UYXD7GjwMk2BKv+
         KR/HMCFFFXs4K0sg7ioJzSq9zmm1ZI3ajBCvOmwa05sSj0K5UtbqFS89VxQi7w6oHqmu
         bQ84gkNII8sWJTWE7vFDVqsF8CkNwB+mRITf6WfGDH58makwp4gCLMr2//deH4BulDmw
         kinaugyI8Ft76IW6+bHNkC96m0zhPia8eKK5Nelp0To2fMVDhzCtCGlcr5CEArvHEGzo
         kTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738346589; x=1738951389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QRhs7XkxKfBtzVDY1/Pn3fL2uR3pe+Pb+5cqnuXWzA=;
        b=fPhzbhCx4vHxZQZXJm7zEfqiXkrwh1C629dCLe1GLvHmEfue7+7h+ca3eDpuFxY9J7
         Hri1S7WtHceuRi0b3F7JPm8HQCHgHwgu7XMVd6HfdvWSyieYNFHjs/JpnykpOpL/ImFE
         iPMqMmc46dsdqjaZNDn5tOCIKzKbzkIwici24g4dqF6IIT8rDeFxpgG3/h5p8vzE/pz0
         d7mxuzv9hLSbEOTmYVnqPT73kFM5XnMq9XuFZ5apTzfiagnad87dod/rwq4GgqyVXxUH
         pRzBgjy3B0Vvz98asGObj3X54ZiQB7zC3e/tf2ex9YpGd/2sEwicF2HXsEjtPcDcktav
         4ZEw==
X-Gm-Message-State: AOJu0Ywik2BmE3MfwbzTnIQhjAHKfVe6Ex0VO5QAJYTcZvUtbKy+9PMY
	wugWrHPH6bKD7oDfJ4T4ZPS1ZnbX7s1Fkudzzn3M+s5Agfdc62cybAWa+bFZ2hZEkzXU5Hbj5UW
	uebqRwLtTb7S6OBbE5tLjp87HXCI=
X-Gm-Gg: ASbGnctaGsbYL6rAk4n5qSPeryx+yf9rVRahBr3fcHyQCW7gdv91bDcFMPI8YR9Fvk+
	ZzQmhtHZwQJsrgZCgOYd3/LCRnOwuTqqDDjhPff8ssdlOt5aNZGvsl2jUNG8YFmmiiFKN5M0=
X-Google-Smtp-Source: AGHT+IGj9qhXNAcq1IggVPVJNFWH6VAU/Or4BFxhdT0wAHxnLvaf7qHMKxiYbbE+05wwmcG8xvcqWwrx2QoGtSDQkJ0=
X-Received: by 2002:a05:6870:1c7:b0:27c:a414:b907 with SMTP id
 586e51a60fabf-2b32f2f8587mr8458850fac.33.1738346589313; Fri, 31 Jan 2025
 10:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20250131070656.1000591-1-quic_ptak@quicinc.com>
In-Reply-To: <20250131070656.1000591-1-quic_ptak@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Jan 2025 10:02:43 -0800
X-Gm-Features: AWEUYZld_p8_vnx1aSESZwaP5Ev84BGPhMNLeBxWG5VAI0Kd6_ioq713iJ6Lr8E
Message-ID: <CAMKF1sqXPdtVmmpWg7kVZUdCcOhfq=qEL-cuM6REmKUm2X2+QA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: upgrade 4.10.0 -> 4.11.0
To: quic_ptak@quicinc.com
Cc: openembedded-devel@lists.openembedded.org, quic_sssanjee@quicinc.com, 
	quic_vkaruchu@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 18:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115208

On Thu, Jan 30, 2025 at 11:07=E2=80=AFPM Pulkit Singh Tak (Temp) (QUIC) via
lists.openembedded.org <quic_ptak=3Dquicinc.com@lists.openembedded.org>
wrote:
>
> Disable FASTCV HAL implementation
>

We need a better commit message with reasoning behind disabling it.
Secondly, converting it
to a packageconfig option would be preferred. We can decide to enable
or disable it by default.

> Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> ---
>  .../opencv/{opencv_4.10.0.bb =3D> opencv_4.11.0.bb}            | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/opencv/{opencv_4.10.0.bb =3D> opencv_4.11=
.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> index 5e54ab636f..90f5faf28a 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
>  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>
> -SRCREV_opencv =3D "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
> -SRCREV_contrib =3D "1aab1f34815a58a5a63aee6d510fe234129754a2"
> +SRCREV_opencv =3D "31b0eeea0b44b370fd0712312df4214d4ae1b158"
> +SRCREV_contrib =3D "0e5254ebf54d2aed6e7eaf6660bf3b797cf50a02"
>  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
> @@ -70,6 +70,7 @@ EXTRA_OECMAKE =3D "-DOPENCV_EXTRA_MODULES_PATH=3D${S}/c=
ontrib/modules \
>      -DENABLE_PRECOMPILED_HEADERS=3DOFF \
>      -DCMAKE_SKIP_RPATH=3DON \
>      -DWITH_IPP=3DOFF \
> +    -DWITH_FASTCV=3DOFF \
>      -DOPENCV_GENERATE_PKGCONFIG=3DON \
>      -DOPENCV_DOWNLOAD_PATH=3D${OPENCV_DLDIR} \
>      -DOPENCV_ALLOW_DOWNLOADS=3DOFF \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115189): https://lists.openembedded.org/g/openembedde=
d-devel/message/115189
> Mute This Topic: https://lists.openembedded.org/mt/110912097/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

