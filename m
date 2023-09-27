Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745B5E82CD5
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:21:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.27228.1695846083853300444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WI2YZ4NW;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50306b2920dso14273412e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846082; x=1696450882; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU0hODf4NlTqx2t24/z//91YEJ4UaFrbzlUy2pHtREs=;
        b=WI2YZ4NWJ3z8FOWY8GrfQylV+GeEyoNQ3grrufl9DqHdrVzeaho+sLX6oHZFgDDltj
         f5eiBzd8grc9IXwdMeI2xCYMSLhsy+CQRkXAM2tFk+86k03/Sv5w3PShxMdkq92ZBqKl
         ksBNNETrU/DZ+HzJfY074RFM/cRyhvFSL7OZgiJlqyKaWGlCPletHW5GVg6W4+xQGjJx
         N47Rb7rMhPspO9KVySHnkM/E8Vijorgtyjm0JadafGgmbcU2q4c+QKPbEWpWcDfDjwXE
         vFxGQuVMZq4TFmk9Oz6b6rUHeA7v86bxXoQovPlp6Zf2IPOEDUpefwrlexNuCZAYmZs4
         k1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846082; x=1696450882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BU0hODf4NlTqx2t24/z//91YEJ4UaFrbzlUy2pHtREs=;
        b=u23nsNyY/R/DKj3pM8hjyozyST+ZybIlFqwTj+z0iiIVds1eqrDKF1IKANYMRsAcbr
         4/lUTeZWxpwDEbDBtlaRO36dhvfab5jKrGo8PjDFzNf9vLvXjJPLrVKss6mu0zoI3+5H
         baqdn20qCeZVVcxNpeZgJiF+YPDOwVrhN+lcUNsHzF6Q+9Hbd/y4JJlcWTX/GHrw5szs
         BINzndkDwyx4+HS2vFUcAA1B2bdIlnS741gVvURmV1eu6afuSSAvLy43xhJjSO7Ay7/J
         s+0ESxjpgOQhvFALz2DxVqhhyx9dAr06dC83tDCAX77sUIlO5foZoVVJtw14wa+0hAc1
         kJjw==
X-Gm-Message-State: AOJu0YwMUoVf0dZI+k7ZQujwC23zDrjgcNlnR6iMR/NA61WqlbkBllTr
	OqNQQ4l4fOsuWo2sqylk254nOUSt5vGz1r+BG11Lyu+m
X-Google-Smtp-Source: AGHT+IEjrrlX/yZhahu2gtUqGiCEO1MZWiylNj5zKzoYxfwgR3vRZ49y9peUNPd+JR5ah1YdB/GNhdJtDY9c8bDALNU=
X-Received: by 2002:a05:6512:3e0b:b0:504:320a:b420 with SMTP id
 i11-20020a0565123e0b00b00504320ab420mr2810703lfv.17.1695846081772; Wed, 27
 Sep 2023 13:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230927201136.2587713-1-martin.jansa@gmail.com>
In-Reply-To: <20230927201136.2587713-1-martin.jansa@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 27 Sep 2023 22:21:09 +0200
Message-ID: <CAJiuCcfBSBzCUjZ3CJkUB3x4DsE8BkQOSOMdfp3z1ZBwSgfkkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105205

Hi Martin

On Wed, 27 Sept 2023 at 22:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 ++
>  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 ++
>  .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> index 3275e57e38..7374cbd26f 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets li=
brary if needed see:
>
>  Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel=
 Engberg <daniel.engberg.lists@pyret.net>
>  ---
> +Upstream-Status: Pending
> +
>   src/CMakeLists.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.pa=
tch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> index a9e9c97b83..853f881754 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online w=
hen starting
>
>  See: https://github.com/eclipse/mosquitto/issues/2878
>  ---
> +Upstream-Status: Pending
> +
>   service/systemd/mosquitto.service.simple | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-=
when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0=
001-cmake-fix-when-cross-compiling.patch
> index d1126aa05b..ce12d4270a 100644
> --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cr=
oss-compiling.patch
> +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cr=
oss-compiling.patch
> @@ -17,6 +17,8 @@ CMake is cross compiling.
>
>  Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>  ---
> +Upstream-Status: Pending

It has been accepted and merged.

Thanks

> +
>   CMakeLists.txt | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105203): https://lists.openembedded.org/g/openembedde=
d-devel/message/105203
> Mute This Topic: https://lists.openembedded.org/mt/101625428/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

