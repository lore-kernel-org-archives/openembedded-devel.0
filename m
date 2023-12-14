Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987C1C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:50:00 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.29422.1702576196348680062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCzpkjT5;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-20305c66f60so395568fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702576195; x=1703180995; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS2x8pDxspia5SgTVSvVsLXjbFS2vXU5sieaCCNEdX4=;
        b=RCzpkjT5OuFtvjxWzjwlGj8iCWrj2Y/2wuLj18a3OdyYqc9ctzchlLb1VbYydwAKk7
         XW3iP4pkGS+dAaW/XhcWWjMQeWeLtsMyCUtWED58IEk4kUgMm2dD7PYQzCDjMVbCL2Q+
         zcYi3i91keXdxofIyFOPeyAk4PFfb62je3Lgq0Uu3TkzbkzdcyNs4ep7WF478oi+56Mf
         ocDgtif9L8nNaa9W/nr8y683nA/AGi+6GUcjCDt7s4ih+pryVkchG+wQKCqT3UEzeUGR
         X2fOi7uMfCvikfzBkKbs+CRUeR+Nwvs3RZ+M6TaQLkXiCYepZA8gcV0vt6PnOXI3iH1m
         E1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576195; x=1703180995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS2x8pDxspia5SgTVSvVsLXjbFS2vXU5sieaCCNEdX4=;
        b=o49clI/votQh3kyxoqhSB3AwxiyHIR49sPBDAXMsVnUnbYCHDqmfPnbEFWQfmzMrQu
         I7wEn+4Wdwx+KMK8PMF1MAUpuDGChgnukuS8KZEHSbfblYWX4nFJzxiWi69nFH5o1NoZ
         rXDS9p26Ul7CpcrDQWwCZtT1VQRQhefYwOg2N9zEYP7veWws0F7ceNt0QgF33G/Ih/6f
         HIm7+ivnOu2nK4OzWAwRpYew662k+FNoVyamX01zBiB4t8B1D2AFj/667pIWcCdtp9Fb
         HbbwYkxCMODNcXVfC2K2ZSYVkm1vZvNZMIdXhTZDL1XEaLQJrX5R3glVzCiYQZoJ1mcD
         TsTw==
X-Gm-Message-State: AOJu0Yxq9ZEiir+aWYVsmNJS6R3K42McGhTa/WAOS2kd6OTDiO6f80iG
	tXuGj9DF+0jF5nW9ypDZ2BS+2QVfThWsfrpMDF8=
X-Google-Smtp-Source: AGHT+IEWa3+j1xBcX9jHbPjMtttd4UI6igolhanVoNi3OaoBpHcP12MFQs+NUao2paHjVe7z6e/Ux1wpS9xwR8wHeWE=
X-Received: by 2002:a05:6870:15c5:b0:203:5c2d:7d22 with SMTP id
 k5-20020a05687015c500b002035c2d7d22mr221077oad.44.1702576195554; Thu, 14 Dec
 2023 09:49:55 -0800 (PST)
MIME-Version: 1.0
References: <1702543728-27602-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702543728-27602-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:49:29 -0800
Message-ID: <CAMKF1sqUwphbB4335TaL6ONiuLYauJeBdKpOTjw6yhq+Q7aoGQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.3 -> 4.1.4
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107463

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
3725.1214842-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:49=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 'bytes' token can't be used without explicit length.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-bitstring_4.1.3.bb =3D> python3-bitstring_4.1.4.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.3.bb =
=3D> python3-bitstring_4.1.4.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.=
bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.3.b=
b
> rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
> index 8831d84cb..6fc2cf480 100644
> --- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/scott-griffiths/bitstrin=
g"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D661f450e2c0aef39b4b1559733344=
4a7"
>
> -SRC_URI[sha256sum] =3D "1b47c84644a961ba8503db2bba8a5965ab53e81474becdf0=
a18383b5b5f3f795"
> +SRC_URI[sha256sum] =3D "94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac=
421b44f89ac85213"
>
>  PYPI_PACKAGE =3D "bitstring"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107427): https://lists.openembedded.org/g/openembedde=
d-devel/message/107427
> Mute This Topic: https://lists.openembedded.org/mt/103166775/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

