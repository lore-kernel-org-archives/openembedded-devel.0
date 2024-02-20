Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF308C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:16 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.17839.1708447512974553185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 08:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzrKkixH;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21eea6aab5eso1454364fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708447512; x=1709052312; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCX0Cq2GAOb+HKelfUxQofhrSD3aXLWfkpSKpojO9zM=;
        b=mzrKkixHrb9/nsj4sF6JjAriaqcVvoO4wLa0ffDvd0ap4qKdPGZibgkoC3T4eDSlUo
         5t9LTmc4Tnrx4GlT0iG591ZkugsDniu6c1/73tXZTGENI5BvrW+u2Jn62cTnVmSpEA6R
         rPika+WmdBiGf0+Po+EFwb7OPREQ7YmbyIhpGAi+wPXTKScPk64y9Nqt46LlONevrpsE
         LPQqB9mR8SmOuqTDNcMtwOyOiyavLsjD95/XVmLsUNO6EB0CyjywJy/U05w9m+7E1wYV
         pUY/y/vM3Gj73YVd1mm/Q210TSms4Ko5u8ZZQn9ouBN8CMK4BaFCvVkj6+CYLv2lz/pO
         gj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447512; x=1709052312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCX0Cq2GAOb+HKelfUxQofhrSD3aXLWfkpSKpojO9zM=;
        b=kXSuFvmY5kurPeC45vLUXssnx1Q76Nvh5xAPb7e3f15CmycrxTNYtyKby9CcJYL93I
         sAhCWJKWjJaGoiQhrIUESxwYv5g17KZ73ZS+0nERxcbZ0Zgd6tuNIdfBUgmX+rY7YOsE
         pmazltCDZAPdcOCNGgvzFy8fCv+UbbBaAlS12A69cy58e7fM8WRuoQjD+MP9j9iD6aqB
         3Mw+C3U/1/kh8bZupwIk0jILXHskyaPhr0P/bqhOil2OLVsAphXWrLuK4jtonkpHdjYM
         VGraVeQ8zwZFNAIy7PHxNQc2NjV2RYQv7ZGCbiV8JWTA868RMRHd+PUWvlwEoARMW5dY
         xKhw==
X-Gm-Message-State: AOJu0Yydw5t2FHRUxy/3yeRp6pjh2b13Tvh0GP1V7sxGo8VoS4QYd55t
	faaKVmLosYL+E3IjykCsz6mV+26yqT0skdsR6pIckueQjbgubbev9et3j3zl4giMS/i7bYVQ0OC
	arojL9vipKsaFH5D2rao6fe+eYfLMCC+I+K/JpQ==
X-Google-Smtp-Source: AGHT+IFhzcI529ttysIsa+p7fhm7Mj3QM7twlu3qvsLNdn+uijspZdJZRqRbaICSRowHJC5FDzWcpYsqBCQCH0YqVFg=
X-Received: by 2002:a05:6870:b24e:b0:21e:5bca:82b7 with SMTP id
 b14-20020a056870b24e00b0021e5bca82b7mr15829491oam.25.1708447512219; Tue, 20
 Feb 2024 08:45:12 -0800 (PST)
MIME-Version: 1.0
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com> <1708419281-26047-19-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1708419281-26047-19-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 08:44:46 -0800
Message-ID: <CAMKF1sr85j_h6YZy85bDh8Gzx8qPABB9Z8KbS4mO=xdAY5MpNg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 19/26] python3-socketio: upgrade 5.11.0
 -> 5.11.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108951

please rebase this patch on current master-next branch and resend.

On Tue, Feb 20, 2024 at 12:55=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Connection retry option in the client
> -use Socket.IO sid in transport
> -Add support for Python 3.12 and drop 3.7
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-socketio_5.11.0.bb =3D> python3-socketio_5.11.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-socketio_5.11.0.bb =
=3D> python3-socketio_5.11.1.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.=
bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-socketio_5.11.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
> index 72471e956..b89430ef9 100644
> --- a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
> @@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
>
>  PYPI_PACKAGE =3D "python-socketio"
>
> -SRC_URI[sha256sum] =3D "b03186e04b942088781f6286c13604a853e5e35ed59158c5=
1ff7af22fa032e6f"
> +SRC_URI[sha256sum] =3D "bbcbd758ed8c183775cb2853ba001361e2fa018babf5cbe1=
1a5b77e91c2ec2a2"
>
>  PACKAGECONFIG ?=3D "asyncio_client client"
>  PACKAGECONFIG[asyncio_client] =3D ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-=
websockets"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108939): https://lists.openembedded.org/g/openembedde=
d-devel/message/108939
> Mute This Topic: https://lists.openembedded.org/mt/104464229/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

