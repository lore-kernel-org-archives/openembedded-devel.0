Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AB3C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:39:20 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.29148.1702575554798541356
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cp2jSFw8;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1fa1c3755afso395305fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575554; x=1703180354; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPNUvaYZ0q0IA5/GW3K+gfvo/qY5tsIBLVcqKJfapkI=;
        b=Cp2jSFw8YH53ADXpSN4KMzgQL9vgCCQl54NPG2lbUHL5Mry3vauUVnQBzxhs28Jduf
         9vWmGQostdRILtOSE/935/wsr9nz+1agNHD0SNxKnvMomFdHL2g0dBIdaqNP2hQgazzQ
         lHxl+Bu1AcOeRGXp7tFa59Yuu5IhjuC1jou+CDn3z/dPJ3hZyPSrQwVOYB4GWrg36Daz
         O+vn9SGiifPwef5cFP7S1JGZhiAvWisSuebunjho8PFD6JhhKyTygYi9vKxKQVx9K5WI
         DJNceHCth6mAsZqBc99Y1FsXrqk3n+7is2YuCUIriMW9+ce/12Uj9g1YlaDDaHelXRoY
         /LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575554; x=1703180354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPNUvaYZ0q0IA5/GW3K+gfvo/qY5tsIBLVcqKJfapkI=;
        b=sCjxafqNqYkquxO0mQDcf0pCD50eC9OXHTccyMtX/22Jx+hNA9WywxDZ094ddrnaGH
         59jq70AoKGl3WppZRMKaMr7wnVeABklFcCKtgPGUsP2hvmaixrp2AwRn0lMTpdPGt9kU
         Qf3PtDlqsP3zz1eq/3yh97I3jf879i9NPHEkgLxdm7/dQEYI5s/lqgrsPz8FSc+9MeB8
         hMX1QOIB9DG80QoKH3TxOKRsDAF+1v+koM1zzHKyAg6+qMK+15YrceovRlSLYAoCyWJ7
         QG+Wa8UvtxtkYkf0SdJ6boq31Ca5m0krs2t8LIqijiLwA8rsEsWDkmUlgg2lw2v7KzOI
         6jhw==
X-Gm-Message-State: AOJu0YwRaL6nl1qE0cBEr7rlHQPNVN2iADHKwbs42nZHsBLLhySUKSO8
	kapRl2E61pe7junkBeuIBgEgA7HNveTVGMLejFXlFKva25w=
X-Google-Smtp-Source: AGHT+IH0CWgmDLGW1ufjdrywR1SV7sddklI2AjG7AcaAWeWdJsgUff03fiedVWnb0yla5YkZlDovtQVaL8PKIT2UeLg=
X-Received: by 2002:a05:6870:912a:b0:203:3df9:47f9 with SMTP id
 o42-20020a056870912a00b002033df947f9mr777652oae.47.1702575553836; Thu, 14 Dec
 2023 09:39:13 -0800 (PST)
MIME-Version: 1.0
References: <1702544699-28431-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544699-28431-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:38:47 -0800
Message-ID: <CAMKF1soK6wH5TnX3eC1VKJXg3a58GQKKD196WE19fqGy1KRJYA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 25.1.1 -> 25.1.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107455

there was a patch submitted for this upgrade earlier
https://patchwork.yoctoproject.org/project/oe/patch/20231214003919.1179147-=
1-derek@asterius.io/

On Thu, Dec 14, 2023 at 1:05=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> club-rpath-out.patch
> refreshed for version 25.1.2
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/python3-pyzmq/club-rpath-out.patch               | 6 +++---
>  .../{python3-pyzmq_25.1.1.bb =3D> python3-pyzmq_25.1.2.bb}    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pyzmq_25.1.1.bb =3D>=
 python3-pyzmq_25.1.2.bb} (94%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath=
-out.patch b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-o=
ut.patch
> index 61aeaca5f..2dae7d1e2 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.pa=
tch
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.pa=
tch
> @@ -1,4 +1,4 @@
> -From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
> +From 8ef6a7bdc0669e85822188f7734b53bc64f54a89 Mon Sep 17 00:00:00 2001
>  From: Leon Anavi <leon.anavi@konsulko.com>
>  Date: Fri, 22 Jan 2021 11:41:12 +0200
>  Subject: [PATCH] setup.py: Adjust _add_rpath
> @@ -14,10 +14,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   1 file changed, 3 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index b634d94..7f6a2f1 100755
> +index 4ac4788..e917825 100755
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
> +@@ -215,9 +215,6 @@ def _add_rpath(settings, path):
>       """
>       if sys.platform =3D=3D 'darwin':
>           settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % pa=
th])
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
> index 504ef7abc..658dbe6e2 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
> @@ -13,7 +13,7 @@ SRC_URI:append =3D " \
>      file://club-rpath-out.patch \
>      file://run-ptest \
>  "
> -SRC_URI[sha256sum] =3D "259c22485b71abacdfa8bf79720cd7bcf4b9d128b30ea554=
f01ae71fdbfdaa23"
> +SRC_URI[sha256sum] =3D "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0ef=
d26056bf7eda0226"
>
>  inherit pypi pkgconfig python_setuptools_build_meta ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107447): https://lists.openembedded.org/g/openembedde=
d-devel/message/107447
> Mute This Topic: https://lists.openembedded.org/mt/103166900/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

