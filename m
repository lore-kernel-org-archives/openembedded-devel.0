Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B6D1A427
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 03:13:47 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.4824.1728962021248917809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 20:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoHyMGFq;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e5c9026ea1so1840148b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 20:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728962020; x=1729566820; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hWiJlW3HTlzRFumkv22NOQoszS3lyk4LZBq33bchLI=;
        b=FoHyMGFqCtUplO76TUPFNlCkOv7dGK+rfG/Dkvj0Yzi4GD6XVTihj6ualx4W0mdC78
         6GQuOhkMGHXOelNtNn2QqEEAHMrqQNvL8VjoWW6y6M6dYiKogXO3KI7q/xmG55rpsh59
         iaQ8A5aoW/tVXqZ+koSPth6+8Lq57ToVWHUYcbF1wzdGZreZ+3Ec01AuX4uoml3FGZtn
         U2UIUfklEPxI6BfbV448g6OHycTGfXLUQNUoAlw95TTI3a/YhLay8ITYNBDY6L8U1r2I
         XFEB/jA2KetlAq3TtLeZv70acsymI9GTidwUxHRIav2eYihcrUwHiPWZEe1Y7SxWtzoO
         wlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728962020; x=1729566820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hWiJlW3HTlzRFumkv22NOQoszS3lyk4LZBq33bchLI=;
        b=IMriHrQCOgzGjz3+QecAfOUMlFe7LygD2X+o0VQSsKEZfFnE5Bep07Ck+1UkHSiNDA
         tZCHPewVQbSUmlE0dnNBIKfkCHnrj5CO8NFF4UcWMSfekL51D5Gk266WSWDbKV6Tew/5
         gioXWR4+sPGUO+1KMjQ/2gNHkJpPqKWJDK8B55YWH7J2NYoeFR+fFDjDaScBcUH+poJw
         nvDXt3spGKOvbJMgOBswC1qfUzvUSMl7JTwXmh4S3DcE45FboBLlk3wD1sgAH5T88GJ2
         4bmrDA3vPeovqT4K1BQ1fUvayqAptLyfe9+S9pCS4v7iNVmLbHzgqeuihCmeJWyIbmuD
         jzOQ==
X-Gm-Message-State: AOJu0YyJ3fsAC6+tnFm91sVI+9BiFy+TLaBfztZIBpwlmRnqeQX/W6Tr
	XGu1wJf9+z6TBAw7t3fNlFCWBL5sbQmlFswRiEsv+FrRhSt7VcSEeWfVd3d6RuWqyFa/Ms64xdK
	U4oFVWAqTIrajo1DLqCnkkSzNZDaQ6fOJ3/M=
X-Google-Smtp-Source: AGHT+IHLT1MRhj5SMk5DLKlAUCzUFQRuvlD7t2YbYOYtE9P226DoanGIApaTnTxw6e//2A/eLSVZk2eU6KacYug6iAE=
X-Received: by 2002:a05:6808:2123:b0:3e5:df65:5a76 with SMTP id
 5614622812f47-3e5df656040mr2505760b6e.0.1728962020450; Mon, 14 Oct 2024
 20:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com> <1728896115-2944-48-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1728896115-2944-48-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Oct 2024 20:13:14 -0700
Message-ID: <CAMKF1sqVTh-B2HFRiXTMThNc4dfvjqCHnGvnPyauC-QQNPa+ow@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 48/54] python3-yarl: upgrade 1.14.0 -> 1.15.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 03:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112919

Thanks for sending these upgrades; they are essential for the project.
However, I would like to suggest that ptests are also run
before sending the upgrades. e.g. this upgrade needs pytest-codspeed
module to run the ptests successfully, I have fixed this and
sent patches to ml but it will be good to run the ptests for
meta-python recipes for multiple patches like this series, it might
make
sense to run meta-python-image-ptest-all to ensure all the ptests
enabled packages are good.

On Mon, Oct 14, 2024 at 1:57=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Improved performance of calling :py:meth:~yarl.URL.build
> - Improved performance of all :class:~yarl.URL methods that create
>   new :class:~yarl.URL objects
> - Improved performance of :class:~yarl.URL methods that modify the networ=
k
>   location
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-yarl_1.14.0.bb =3D> python3-yarl_1.15.1.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-yarl_1.14.0.bb =3D> =
python3-yarl_1.15.1.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb b=
/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
> index 7c41edc6f..0a15b2e34 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.15.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/aio-libs/yarl/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRC_URI[sha256sum] =3D "88c7d9d58aab0724b979ab5617330acb1c7030b79379c813=
8c1c8c94e121d1b3"
> +SRC_URI[sha256sum] =3D "02e1c9e36528de270c22c06aac6a5a1de8cc870fafefb5e9=
0e5b35cb8985d0b2"
>
>  SRC_URI +=3D "file://run-ptest"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112900): https://lists.openembedded.org/g/openembedde=
d-devel/message/112900
> Mute This Topic: https://lists.openembedded.org/mt/108998140/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

