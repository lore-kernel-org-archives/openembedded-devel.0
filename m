Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE47C742A7
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 21:59:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.6621.1678312741410807192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 13:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HuyEB5cv;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17671fb717cso273373fac.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678312740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GXoQpPuyVb/lpR7KNMzF2D7uVmy9+2pfktbtxwYRLo=;
        b=HuyEB5cvkmwadk/ufesv+AukYoUkQzx0fMj47iJ+oaFh3EY5B4nwqfab8zCoaQSSR4
         cPiecG1aro92+/Q/8Usick1HL4/I/wzZQNfl4Tp0e4oZMvV40bqspjj5UfVtNYyMDdCY
         oIegEsnksg0/47hsDu4gHlPLts1LnLPzOtatlmtzriKJktaRaEqKD59uqyy9S6aSTZBV
         4x4qbyTdROUubrEa9UXzIK8I16VwOJ+hKu5bkUrrzuiHjyglBEXT48gn5i8gVlLR8vPb
         7oyekDJyEfK2nbKk6oWqVvps+eoybXTlRMNEcsRwiV5cgaByB8qh8OqPolOnLt7FQoek
         CXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GXoQpPuyVb/lpR7KNMzF2D7uVmy9+2pfktbtxwYRLo=;
        b=ZWkzsDymN96J2+AK1KqXQkvEZzhvCRci5hakGML0GtmTgbc8qjy8gP7sSqA00rdpnI
         Uz36jUXBidmJVfMny5wJxTKMdzqagol6S6wCmIrRstB70FgBKqxKgIaBBYdbTN32EOpG
         f7j7juwnVmUSDY6A8Z0o8QENeAkLxVDo07762SFSs/BBPZ9SBzCfU0mCGci3TgSYyRDI
         mRxZJa9+k/B7d+3pEiqSlnXI1l/5L8zlf6bW87SfJDMc2gfmksfO9J7uX721DxauNE+g
         D383ZBsQmdRO2lWgDqQQjh8w9cyuhLLi5mJUyJQRWfLSiOe8CmkxLS32+pkuebM+N8SE
         XO5w==
X-Gm-Message-State: AO0yUKVrXf1GEMl8nd+Uw1eW/1vPqDo6LNv6wXndjFXaFAgOkmut000K
	sibQImNBdpL/kPF3r3TxzjtTDkJ5EkFEB4F5AnU=
X-Google-Smtp-Source: AK7set/1YmkLOEV2nUJsKuEKgVhwbhDLS+7ZvU0KNDmL4YzO2B+L8jjVIGhcMKZYmfj+KoaKIEK2ZLLK/ElHvBbwB6Q=
X-Received: by 2002:a05:6870:c793:b0:176:2903:95d8 with SMTP id
 dy19-20020a056870c79300b00176290395d8mr6770745oab.4.1678312740537; Wed, 08
 Mar 2023 13:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20230308105719.1360985-1-zboszor@gmail.com>
In-Reply-To: <20230308105719.1360985-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Mar 2023 13:58:34 -0800
Message-ID: <CAMKF1spdVSO46cCcP6vhtkZ3qQu0+Grj=Q1Oqi16oxSvXw_oJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: 4.7.0
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 21:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101427

I have a version already staged in master-next

On Wed, Mar 8, 2023 at 2:57=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail.co=
m> wrote:
>
> Removed an upstream patch.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...ng-header-for-LIBAVCODEC_VERSION_INT.patch | 26 -------------------
>  .../{opencv_4.6.0.bb =3D> opencv_4.7.0.bb}      |  5 ++--
>  2 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missin=
g-header-for-LIBAVCODEC_VERSION_INT.patch
>  rename meta-oe/recipes-support/opencv/{opencv_4.6.0.bb =3D> opencv_4.7.0=
.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-heade=
r-for-LIBAVCODEC_VERSION_INT.patch b/meta-oe/recipes-support/opencv/opencv/=
0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
> deleted file mode 100644
> index 59da6ab32..000000000
> --- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-L=
IBAVCODEC_VERSION_INT.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From d6bdd0a91eb0ed57688c0af5ba5088cf0afdc0a0 Mon Sep 17 00:00:00 2001
> -From: Jochen Sprickerhof <jspricke@debian.org>
> -Date: Mon, 8 Aug 2022 21:10:13 +0200
> -Subject: [PATCH] Add missing header for LIBAVCODEC_VERSION_INT
> -
> -Upstream-Status: Backport [https://github.com/opencv/opencv/pull/22357]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - modules/videoio/src/ffmpeg_codecs.hpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/modules/videoio/src/ffmpeg_codecs.hpp b/modules/videoio/src=
/ffmpeg_codecs.hpp
> -index 61788e0345..faad2596ed 100644
> ---- a/modules/videoio/src/ffmpeg_codecs.hpp
> -+++ b/modules/videoio/src/ffmpeg_codecs.hpp
> -@@ -60,6 +60,7 @@ extern "C" {
> - #include <errno.h>
> - #endif
> -
> -+#include <libavcodec/version.h>
> - #include <libavformat/avformat.h>
> -
> - #ifdef __cplusplus
> ---
> -2.38.1
> -
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/rec=
ipes-support/opencv/opencv_4.7.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.7.0.bb
> index 1e4c3545b..eef2e66ca 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
>  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>
> -SRCREV_opencv =3D "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
> -SRCREV_contrib =3D "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
> +SRCREV_opencv =3D "725e440d278aca07d35a5e8963ef990572b07316"
> +SRCREV_contrib =3D "e247b680a6bd396f110274b6c214406a93171350"
>  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
> @@ -30,7 +30,6 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3Dmaster;protocol
>             file://0001-Dont-use-isystem.patch \
>             file://download.patch \
>             file://0001-Make-ts-module-external.patch \
> -           file://0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.pat=
ch \
>             file://0008-Do-not-embed-build-directory-in-binaries.patch \
>             "
>  SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101410): https://lists.openembedded.org/g/openembedde=
d-devel/message/101410
> Mute This Topic: https://lists.openembedded.org/mt/97469941/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

