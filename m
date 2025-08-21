Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1B2CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 18:17:55 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.3593.1755800265075448263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 11:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNHKrWdo;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e93498d435cso1336417276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755800264; x=1756405064; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTiTHpopHvhcVMCXeqChMDqqWW4iOFqC/pbuehTCUKA=;
        b=HNHKrWdojUwIvcmvYYwQUA4ghC0TCKbyqvDCeBPgN4HZJTbRVySVchyJCXrsSipTES
         Ki+wiArE0OTl7/99p2QRTjQtRbD56TrGbaE2xz+aA9vGFyzBT0JHySjzZ5XAxQs3f8+3
         pgG/UlH1ZY30bIbEwoDUPDO6ITTkESc1PsuH/cANzSjJ2jEOVFIq4YgX6qtDw5Z2aPFf
         afkXgFNR30r0XGfauHdCdlQinnl8mT5pAYHUcI1HEv+ZG24SfhGzI2QCky33gjU8IEXN
         kzxujlJ9JGHqsDxipUzKFCm2510CK9uSFOu5ISZqBJJdrnOimIx7curA2d4Z1vNmY2W7
         QMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755800264; x=1756405064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTiTHpopHvhcVMCXeqChMDqqWW4iOFqC/pbuehTCUKA=;
        b=NnImyUSUWepeUVG90jgs5I2fi7d8U78pmEkbBtMCxWvKcf8MpBuMKsSGTPYlKJuDTo
         YHXe+DX4Hk1G7Oly0XkKTq3MrinKRyRRL3pqLQ2GoknE0hTEieCwoqFb1opU8KYOIVKG
         KHAiRXapL+wPMzFNJMN3IdaG0MBSwkkgsMLPBc0ffGaE2LjPfR43tU7q7QznIU+V8fmk
         KdIm7yLzRJ7o1joiBoveNr7Gj2Iz3ymZSMKrzoS5+kHMTAx+wDKcpH/E82q1feA5HMqh
         WUuJCodP7V3HgkOJ/MApSws2zGdtIOGh6WHqi91W01jqS6RFSuJo2J+8hqySf5r5y5AH
         YT6A==
X-Gm-Message-State: AOJu0YwCvOV8nOQgmNCbcZNqbmgVmrNyEtoVg/s7l5zK14SVqFPCfwFe
	HZHqpB+uoayOeYe8DykdjmNmtc2c+BOJdep3wO86viFKYGhjQKfC/kn78wGiSPG9IOjT18Dbjg2
	cVMyVsSpzpaiEuFK3POg9zzUCM7VxXWAvXVFa
X-Gm-Gg: ASbGncv8/BlDF6hxJMG58cU9Hqe+wImxDc4azs1kDnylDyMtLBZU1OZoxn0WByzr3Vn
	wr5iduuKbWLawL0rec9Cdu9frW/nAUeS2sdIb5sM2v0g+jBs8uBf+nHE577EWfBd8lrKh+7DKYc
	BskcE0lLqx6aV5wXJfYYk4qfZbklJP/1a6jhmKvwBx31rSWflcWDX2USBke1EQXOuQB6fHzrkhi
	QyYmulCl9qhSd4YNnT0ngH0jxPQyGqN/BFc
X-Google-Smtp-Source: AGHT+IH84WXfS3T5S8+0geuReB7mOpA4ZHdsMIxOrek0MDMg2y+uGwMx1k/BroiDoWFAfgFiFyoFLZZyZRo+/GyxfeM=
X-Received: by 2002:a05:6902:1285:b0:e8f:e526:fda9 with SMTP id
 3f1490d57ef6-e951c23d0femr631295276.22.1755800264119; Thu, 21 Aug 2025
 11:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821085954.2056-1-wangmy@fujitsu.com> <20250821085954.2056-8-wangmy@fujitsu.com>
In-Reply-To: <20250821085954.2056-8-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Aug 2025 11:17:17 -0700
X-Gm-Features: Ac12FXyt5wegsJoc9MGlz-IgyMHLe5LjIxXYXQizC1zqI-rYe-pL1FXNjbpBfuM
Message-ID: <CAMKF1sp1HHMVUJGKi_QXnUHm+sxyCSbbb0NzoohmDDchfSJv9w@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 08/21] python3-pyais: upgrade 2.12.0 -> 2.13.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 18:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119078

On Thu, Aug 21, 2025 at 2:00=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  added a TCP server capable of handling multiple concurrent client connec=
tions
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pyais_2.12.0.bb =3D> python3-pyais_2.13.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyais_2.12.0.bb =3D>=
 python3-pyais_2.13.0.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb =
b/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
> index b31ca80096..321b37162a 100644
> --- a/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79d9e278b76e3e=
5b3358cd70b328173c"
>  SRC_URI =3D "git://github.com/M0r13n/pyais;protocol=3Dhttps;branch=3Dmas=
ter"
>
>  PV .=3D "+git"

Do we still need it ?

> -SRCREV =3D "4ec68378f76c49825b5662a052e6834d7b44b96c"
> +SRCREV =3D "2c50d58c4776a4ca7560bf9d70587a9acf523d1c"
>
>
>  inherit python_setuptools_build_meta ptest-python-pytest
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119058): https://lists.openembedded.org/g/openembedde=
d-devel/message/119058
> Mute This Topic: https://lists.openembedded.org/mt/114814438/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

