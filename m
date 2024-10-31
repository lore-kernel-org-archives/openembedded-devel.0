Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E23FD767D9
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 14:49:08 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.14261.1730386138707439324
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 07:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKHy7BEi;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7180cc146d8so469323a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730386138; x=1730990938; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=740vAQT+S5NZhCxjsxC6hmKGIOH4HWIlyMpJMAbxbUg=;
        b=LKHy7BEiJ6kjzARH88RKnj74f3nFC4yldtQXP7ER4xbtHrIptfdDI3or7qRTbzd3cd
         jsXIteG3peMGLCIyMR/eJTaQj719VMGAogWPGDT1FPrVRH3HgnWEBT6EhW8/IiM7XRrn
         EXOaT1GgCPhNCnFXcBJ2ncwJyJH4fV0IdnJe51Ls/cEm6ilLjsex6lWn8cDnrfah/uHX
         +hWjgql+L71XGSU8n9VZju3weuEMYJsTeRO9D/pHIpfsLcLAF4CbcvI4eRHl3UNABbUc
         8HSt6UHmO70pEek6YIz0vDFJagFd4ILwb/NMAJodP0T7vLtGqkX/68hG628bbB1mfD/g
         7voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386138; x=1730990938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=740vAQT+S5NZhCxjsxC6hmKGIOH4HWIlyMpJMAbxbUg=;
        b=TPDZaBCTcbgNn+9mLEnw6OmlARAvm79jebMFpbzHhYTFqmXm2h+tHdiyJ8LOs0DV6T
         UUXECedYAJr/qPF2wm+3vxUZoJ3JpNQHBAgvIktNkkSSBsbugEFqxxiTRZT7VX7nWrfw
         NhvPKCJ1XH+51Ee/XgNLqeOY/gYBbn95FsPuhPYPRLOQfr9wGxoCrchF59qKkvwFbw7h
         Gux5BRX4NHuZ61ugXUbPHbhjc2ExDa9imLLQ6P3JyZ5Dk2K4kJ4Rq/vrNxKwD5xllvMO
         HQxn2g4pxc2VwutAaj3rRP0ATCiGO9M07I8WSnEFKgVUUEPyUvRJmmhv2I04iYOJlstm
         XNNg==
X-Gm-Message-State: AOJu0YzxuDhnF5FbNrnRSUEb4VCzk/L/Qmsjy+sZ82lTIKfjQT6vGDXS
	aW/Gr4ahQx1B27UbTp9kOlBwOHQvXiSN/WdQlnj0H1UBfkNuThJ8LYb7AxpPGdp8Sfl5A7p9RGa
	hL+LjmMWaXFE1VqHG82lSObUoHXFf0LsD
X-Google-Smtp-Source: AGHT+IG7cye6En312om0zSpH1yb+trxLMLvfDAYPaQWKRxhdqgU98P5THW/vsQib4j/kN5TW1G+BkU3K4RaJkHw9FhU=
X-Received: by 2002:a05:6830:43a7:b0:718:18d6:a464 with SMTP id
 46e09a7af769-71891ffc8cbmr7064952a34.5.1730386137873; Thu, 31 Oct 2024
 07:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2024 07:48:31 -0700
Message-ID: <CAMKF1so6VjgNJp4EJUqohdi9_tUiPTow_8VEfEbR-_3RmmR7cg@mail.gmail.com>
Subject: Re: [oe] [master-next][meta-oe][PATCH 01/11] libgpiod: improve FILESEXTRAPATHS
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 14:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113369

Thanks for this series, such cleanups are very important.

On Thu, Oct 31, 2024 at 6:41=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * I thought that PN in FILESEXTRAPATHS worked as everywhere else and
>   as described in:
>   https://lore.kernel.org/all/2261745fc01a4e3887ee98f98a425e88@vivavis.co=
m/T/
>
> * but surprisingly (to me)
>   FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>   ends with effectively ${BPN}-2.x in bitbake -e (and the build doesn't f=
ail
>   to fetch file://gpio-manager.init in lib32-libgpiod build
>
> * I've tried with kirkstone and dunfell as well and it ends with
>   "libgpiod-2.x" for all 3 PNs:
>   dunfell $ grep ^FILESEXTRAPATHS=3D env.* | sed 's@/OE.*dunfell/@@g'
>   env.lib32-libgpiod:FILESEXTRAPATHS=3D"meta-oe/meta-oe/recipes-support/l=
ibgpiod/libgpiod-2.x:__default:"
>   env.libgpiod:FILESEXTRAPATHS=3D"meta-oe/meta-oe/recipes-support/libgpio=
d/libgpiod-2.x:__default:"
>   env.libgpiod-native:FILESEXTRAPATHS=3D"meta-oe/meta-oe/recipes-support/=
libgpiod/libgpiod-2.x:__default:"
>
>   dunfell $ grep ^PN=3D env.*
>   env.lib32-libgpiod:PN=3D"lib32-libgpiod"
>   env.libgpiod:PN=3D"libgpiod"
>   env.libgpiod-native:PN=3D"libgpiod-native"
>
>   There is the QA check for PN in SRC_URI, maybe I took it a bit
>   further and updated all FILESEXTRAPATHS references as well in our
>   layers (in 2023) even when it wasn't causing build failures, e.g.:
>   https://github.com/webosose/meta-webosose/commit/38d3cbf010a5e4e112d82e=
e473eecc718d9cc687
>
> * so it's not so important to use BPN, but it's a bit clearer as that's
>   what it ends evaluated into and what default FILESPATH is using as well=
:
>
>   meta/classes-global/base.bbclass:FILESPATH =3D "${@base_set_filespath([=
"${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"]=
, d)}"
>   meta/conf/bitbake.conf:#FILESPATH =3D "${FILE_DIRNAME}/${PF}:${FILE_DIR=
NAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BP=
N}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
>
>   BPN was added in denzil 2009 (and FILESPATH moved to base.bbclass,
>   bitbake.conf has commented-out value since then):
>   https://git.openembedded.org/openembedded-core/commit/?h=3Ddenzil&id=3D=
94c895aad5ad286f172b04bc33ba670220d5eba8
>
>   PF was dropped in dylan 2012:
>   https://git.openembedded.org/openembedded-core/commit/?h=3Ddylan&id=3D3=
efa13cd76bbd5611805021945fc9def88d9fd93
>
>   P and PN were dropped shortly after in dylan 2012:
>   https://git.openembedded.org/openembedded-core/commit/?h=3Ddylan&id=3Df=
b359583b659cda643973fa285002aaffb729a51
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 2 +-
>  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_1.6.5.bb
> index 0795839492..dac7dd36fc 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
> @@ -7,7 +7,7 @@ SRC_URI +=3D "file://0001-bindings-cxx-disable-tests.patc=
h"
>
>  SRC_URI[sha256sum] =3D "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb=
3fba24619daa72bc"
>
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-1.x:"
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-1.x:"
>
>  inherit python3native
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.2.bb
> index 8d8a2cc3a4..224918a55a 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a=
20f \
>  "
>
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
>
>  SRC_URI +=3D "file://gpio-manager.init"
>
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113358): https://lists.openembedded.org/g/openembedde=
d-devel/message/113358
> Mute This Topic: https://lists.openembedded.org/mt/109314377/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

