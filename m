Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1AEC021A3
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 15:50:28 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.98021.1726329022643548458
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 08:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAzx8cVs;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e033e37bc9so581913b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726329022; x=1726933822; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S7b4hEGzf8RjebmLyVzinUTQ8p7MFuxHD92xNWSXYM=;
        b=fAzx8cVspH7Nf0t4GS2miSLCj62fTXlaT+XwZ5JK5JEd0pAi1c6hBeyjMXACzHfrG+
         aDNW1bXdRBveGD0GaRl6fc0mwFqTKFPvFBuYksHFhVYdGrjPCV+H1F5sJtDuCeUIO1ru
         Qk9s5YLNKgMN16OErLyZAj2jSX689OSmhIdG65DDx+AiloVUk8UMk0h5uAXdKu9J1BlU
         BiavVcsqpKhTDHs+rCK9WSdz6jXEW2tcPeeHTVMs6sLgqOlqxRGot1Ojj0LRWmEmzSX9
         iiL+r1lwQg9kFRqFU3L8V0WNr6IexbdiFz8+yF8ojCVyH2v67pFYzFPFEfI3S02ota8Z
         Kw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726329022; x=1726933822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S7b4hEGzf8RjebmLyVzinUTQ8p7MFuxHD92xNWSXYM=;
        b=i05YJy5YVTySc8R8OQI1mDRSPbaBEzsajjx6FCcfJp38T3HojQZwBuRGBZeKG8GYpO
         Qx8seSlm4xkxLauvyz1jMzy9ObU2BzUq66vuGZJuSQ0ISqGq93ZTWm89gHa9PoRccC3O
         8P8Us8k1+LJQbuNeKJ5aBxCKMw4zuch53shQRgDEPhKj4P3fO3q3wMqRnhW/K+sDaX3E
         WrSpn8RlVn+X+mKvZj8WFolURranmrOl0TL3F/0FRCbeoOLFvC9b9MFvT/uKx4mmFO2m
         3aGNUx39iglJC4hi5TbiY9/8I41jE88eYk6rcNROmh0MiLrXHuRMeshTZ4HEAKMc57Yt
         oajg==
X-Gm-Message-State: AOJu0Yy77D4ObDQEWKrgxlmGpURuh1mk/vnpfBWpGSpfn98+aETO4CEm
	8ak2hgXL/seiii1CF9luaflNWbfjyeA7w69U5fmRDc9VycKlS3YKHmUI+Y3CXEnu1HCH5nh34Oc
	PjwhL4pbbHdJMcKDKaV/m8mHkHUkKKA==
X-Google-Smtp-Source: AGHT+IFR8+f5sQEC1Mi/GaBglyXHKRSg2hOqRX/ViIChT7sJD3yTPrmtANdMsHZx6Y9X1xjqRQPMcUmGfKiTfhdhxs8=
X-Received: by 2002:a05:6808:4491:b0:3e0:4414:5f7b with SMTP id
 5614622812f47-3e07a16bd3fmr3979407b6e.30.1726329021755; Sat, 14 Sep 2024
 08:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240914143557.2211085-1-yoann.congal@smile.fr>
In-Reply-To: <20240914143557.2211085-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Sep 2024 08:49:55 -0700
Message-ID: <CAMKF1spKgTPE+GTpym-d9O9+7q9X1QJXOsLoR2KGNH66x-puUw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] non-repro-meta-python: exclude packages
 that failed previously
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 15:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112290

Thanks for updating this list, we have fixed many recipes lately, I
wonder if we need to remove some of them now from these lists as well.

On Sat, Sep 14, 2024 at 7:36=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Those are the non-reproducible packages from:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-python/conf/include/non-repro-meta-python.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-py=
thon/conf/include/non-repro-meta-python.inc
> index 629dc4aa04..64dc69ed55 100755
> --- a/meta-python/conf/include/non-repro-meta-python.inc
> +++ b/meta-python/conf/include/non-repro-meta-python.inc
> @@ -1,6 +1,8 @@
>  # List of known non-reproducible package of the meta-python layer
>  # Please keep this list sorted
>  KNOWN_NON_REPRO_META_PYTHON =3D " \
> +    python3-evdev \
> +    python3-evdev-dbg \
>      python3-evdev-src \
>      python3-frozenlist \
>      python3-frozenlist-dbg \
> @@ -8,6 +10,7 @@ KNOWN_NON_REPRO_META_PYTHON =3D " \
>      python3-pandas \
>      python3-pandas-dbg \
>      python3-pandas-src \
> +    python3-pybind11-json-dev \
>      python3-pycocotools-src \
>      python3-pydantic-core \
>      python3-pynacl \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112286): https://lists.openembedded.org/g/openembedde=
d-devel/message/112286
> Mute This Topic: https://lists.openembedded.org/mt/108449449/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

