Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD4CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:42:40 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.29238.1702575758651060231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BKk3YQyp;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1fb9a22b4a7so5002217fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575758; x=1703180558; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rksvYqr/OFx99YwtFwRxf8QMzmIej918EMx4wvcAgOE=;
        b=BKk3YQyp95ycStto6NZqM1PB/p1JX4FEzjiDH8N1EvH7+DkiTjaOnyu8S4EHA3pcqB
         D8ixNMGYn0oTdCMkdXH+SJ4akAAfOgmK5EN9lyVCr71bFTaPO+KICpcCw9ct64IK85TS
         wovxZwN+QC9iAjab8DWrrjX1EcEK69EpWIEbZp71RfX13dkENBxodfHwgCXrFklr/nrb
         ITi5mna3Lyv9FKrLeF1hKdYtQcWXmJWRUkd5eWlZmFx5/bN14YHlb+jQ/angZBzKYm3i
         jpv2QdjmzjSfriqzc/NxnN3SjqbW3CqNPGgKzxLEHzqJCGDa6BOWHnQHwgGbI6EFF4QT
         FM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575758; x=1703180558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rksvYqr/OFx99YwtFwRxf8QMzmIej918EMx4wvcAgOE=;
        b=SX0XOLYdw5rcawAwucU/zS7Hu8mczgLIRKxdnlug4ycQeOpThANQ2/0J4JHPQcUmUo
         pScOND7iBOBcCT1g7LO0yQLIvCkAkutbuYL0y9trSAyrnUYRtoi4+VaAHZ/iTXPwKMdl
         yBFxF33DXxFCtZi1PJX/4RlAGPy/4NHzOjwVvv8DM30Jcw029EXlwjXkJFxmmev/U74Y
         lSKU6QEuJSJAsp9eXXFd4L+e/sP8hwMbHDKbvFlC/PiXCMcXqOfVJONklckGwDiy19CJ
         vRkEh5Byf94ggsZwfx8nvdZzd1idWLhifRncBQJkYsKPC2lLhxGKGFHovB5vH6ygWsI/
         YMVg==
X-Gm-Message-State: AOJu0Yx+8v9QeeQYFNXcfQelmyJXusVnpPLnddTnHh1PxSM4RtOnKbJR
	oK67tZGCTdyfggi1jAxpUJHl2v/cCekbRAh8/wY=
X-Google-Smtp-Source: AGHT+IFwI/OQhwRxSf5gtIQmiEl+JuvybBk2XUiCcydVPjwYbJgssSMT6U07x2Whw3s1qDibMAQY04Pgmu5lsuv5q94=
X-Received: by 2002:a05:6870:41d5:b0:203:2db2:73c0 with SMTP id
 z21-20020a05687041d500b002032db273c0mr2926373oac.48.1702575756378; Thu, 14
 Dec 2023 09:42:36 -0800 (PST)
MIME-Version: 1.0
References: <1702544387-28194-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544387-28194-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:42:10 -0800
Message-ID: <CAMKF1srxOxUgADaC+R954HujBnN2_gydtjESNETrKVb+bUm1nw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.22 -> 0.23
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107458

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121400=
2735.1137483-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 1:00=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Add _get_conversion_factor to registry with cache.
> - Homogenize input and ouput of internal regitry functions to
>   facility typing, subclassing and wrapping.
> - Generated downstream_status page to track the state of downstream proje=
cts.
> - Improve typing annotation.
> - Updated to flexparser 0.2.
> - Faster wraps
> - Add codspeed github action.
> - Move benchmarks to pytest-benchmarks.
> - Support pytest on python 3.12 wrt Fraction formatting change
> - Fixed Transformation type protocol.
> - Documented to_preferred and created added an autoautoconvert_to_preferr=
ed
>   registry option.
> - Enable Pint to parse uncertainty numbers.
> - Optimize matplotlib unit conversion for Quantity arrays
> - Add numpy.linalg.norm implementation.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pint_0.22.bb =3D> python3-pint_0.23.bb}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pint_0.22.bb =3D> py=
thon3-pint_0.23.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.22.bb b/m=
eta-python/recipes-devtools/python/python3-pint_0.23.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-pint_0.22.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.23.bb
> index 0eed33f79..82709ea08 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.22.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
> @@ -10,7 +10,7 @@ PYPI_PACKAGE :=3D "Pint"
>
>  inherit pypi ptest python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D "2d139f6abbcf3016cad7d3cec05707fe908ac4f99cf59aed=
fd6ee667b7a64433"
> +SRC_URI[sha256sum] =3D "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20=
e9072409346ec9b4"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107442): https://lists.openembedded.org/g/openembedde=
d-devel/message/107442
> Mute This Topic: https://lists.openembedded.org/mt/103166860/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

