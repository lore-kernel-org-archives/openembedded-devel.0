Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB70C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 22:58:07 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.6559.1706914677203449221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 14:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOpEPWmI;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-21942342452so205663fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 14:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706914676; x=1707519476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+9C861Or38wIGNRJBfnNgD9VEtWyWlu1NtzNzxixYk=;
        b=KOpEPWmIeZvG4LfJjbJugcllnXv39I0EPdMH5fFmVxrnV53OuN+MQx+CdNvlhQmcCr
         UcJvGuCQFzJOklSecSg27RbvxHTTjwuUzCBZlQsQUnAZGJEua/P12ywOdDsC7CNjzhSB
         Qfw++uz5pq0yooXKtKNGqNf+itpbQw/D+VD+F3GH54FKQYncO+VLU1OA6yRsY+jDlCT9
         lpd7QZ4er9g5wHj8K17LrODRkBcq5LEYtcSgiNwnKqyODY8SofEYv2faFTeKfsVl3I//
         y47ygZloPaPjuX+eWkMqZulCSxUoFVc1bkl36CHE1N+k0HJWixbkGzXwaSXDD+MCOMQ0
         Vbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706914676; x=1707519476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+9C861Or38wIGNRJBfnNgD9VEtWyWlu1NtzNzxixYk=;
        b=VQCi3Yximo3MabLkW8bcXewAKnNsgyHJCQrvjGVX+Ao8alaVOqdGwmBX5H9uJIiB7w
         yw8hksb9LAijmoyVQHeFEKTtnhRMXwVR7p2Do16TyIAK2/R7I4Rf7TQ3LYxjOjU0huCs
         ZbiTMg0SLTSPDnZmgUT+xE9KNHDxlM18A4MWj86t9rDX+jKS2uymelnQQRmMxGyrF1cz
         JVcsnEDzEae1k+t9UczPQKOAg4nPVgVxlsHvOwxDcUmDM5TupInF8/N+Ef4S7z8qh7vg
         RheMEhp541/lFmKqzOUjPdyDFyMYDFR1iBeT72Grw9w0qqnM8pFiU4Kf92xeli6ene2K
         B4pg==
X-Gm-Message-State: AOJu0YyB1VRUV+Akl+fyixQxGeZqu8rnGdVkV3R7qXqYQpSNM4qpnK+9
	59U0M+RAi3a08OmzuzZNmk2owRlWhFwVv7MpZPk6vkzHaj+py1LjB+iCRYaCCQBWKgOk25kWCK+
	QbMmX2WgaL4l2WJ+7V7w6Xmq6um4=
X-Google-Smtp-Source: AGHT+IFdLuYSHxczzqUKhEO0+vv7NG8pEYjZffP8MH65RIdQnlvkU4N+O2XWrAhS4Fg3aPkwRLCI4EmrdyNruH3mTWc=
X-Received: by 2002:a05:6870:304a:b0:219:4546:3a7b with SMTP id
 u10-20020a056870304a00b0021945463a7bmr510128oau.44.1706914676347; Fri, 02 Feb
 2024 14:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20240202220618.1620238-1-derek@asterius.io>
In-Reply-To: <20240202220618.1620238-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Feb 2024 14:57:30 -0800
Message-ID: <CAMKF1srNr9AfWXqg=JCs2zFSMK-8HkubuCtS_0_vc7FeBQpP8A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pymodbus: update to version 3.6.3
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 22:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108553

On Fri, Feb 2, 2024 at 2:06=E2=80=AFPM Derek Straka <derek@asterius.io> wro=
te:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  ...on3-pymodbus_3.5.2.bb =3D> python3-pymodbus_3.6.3.bb} | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pymodbus_3.5.2.bb =
=3D> python3-pymodbus_3.6.3.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.b=
b b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
> index 4cd3801ee..337fd0e19 100644
> --- a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
> @@ -1,13 +1,11 @@
>  SUMMARY =3D "A fully featured modbus protocol stack in python"
>  HOMEPAGE =3D "https://github.com/riptideio/pymodbus/"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a146397c35e3d0953758ce8803de=
347"
> -DEPENDS +=3D "python3-six-native"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deba8057aa82c058d2042b4b0a0e9c=
c63"

checksums are different here, what changed ?

>
> -SRC_URI[sha256sum] =3D "26c1aa9919b24f2247794d5d9d80f65ec06fdfd9bd6b76b8=
1d446b55335cabf3"
> -S =3D "${WORKDIR}/pymodbus-${PV}"
> +SRC_URI[sha256sum] =3D "862f64376ae201f979c91ca2398f0ed5df8f136b76491e09=
95edeebbd0fa8940"
>
> -inherit pypi setuptools3
> +inherit pypi python_setuptools_build_meta
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[repl] =3D ",,,python3-aiohttp python3-click python3-prompt=
-toolkit python3-pygments python3-pyserial-asyncio"
> @@ -31,5 +29,3 @@ RDEPENDS:${PN} +=3D " \
>      python3-pyserial \
>      python3-six \
>  "
> -
> -
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108551): https://lists.openembedded.org/g/openembedde=
d-devel/message/108551
> Mute This Topic: https://lists.openembedded.org/mt/104129327/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

