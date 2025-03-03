Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C8AC282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 19:13:29 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.3614.1741029198796990220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 11:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dTx4md8S;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54954fa61c8so3458139e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 11:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741029197; x=1741633997; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbmQQF+Jhbzc9c28/kmlMp7sG+JmUuoeCKC8QOcwyHk=;
        b=dTx4md8S0Bfl/ymNrOofNbsKvMiKMXeL5Q5Ww5ZJGcsEQx/UXRjpHwyFepCjmSF4we
         RACRjHQeNcKe4TBv7ugnRIUWl+6DWa0qqPUXiWi7FcLPvGFVRgSHFu7qHKxvcmFKQ9Jc
         gknNZ8hes6OGS3WXmADYiTeyzMZUj9wFkus1STiM2L2ii4g4eIHdbkWaLOBKdJTfx3Df
         IS6SbfIuqQbAeW3BgF9BDi0Pz4Y4UOawElrRPBHIeMSDEyFHmHPXctt5iD0g06Bsk+Ix
         CaKBwZ01qShRCkpEBiOkreK60r4LkhKK7NF6POzt6KCqxlTkUlwe5Uts1+nS8dQ+omfM
         yNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029197; x=1741633997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbmQQF+Jhbzc9c28/kmlMp7sG+JmUuoeCKC8QOcwyHk=;
        b=vwNqz7agDIUEBRNJF0ap7pxiGui2SmNQe1gPq8goH72a3Lou9wSbvyFVqLIj5Km66r
         nkQe20dv4kWUdMhnPR9DzzyPaNjGIjOwHyPfSsKv1YhUW+6oU3PkSWFCv9tHCSOU3uRc
         d5azL10ZMsMfGYmUfFVMU+MWzfVRTssl4CGOmbTCaqiFSJ3Eoj6/5H7QWXfxVOOwLTl5
         oeyFzXsd4E5KXG7MrmcV4CAG56o5QC+A3Z89zhh5hM/8Jkv51WCZuxS0K7e19ezhV1e7
         xJjoOhtPxswD9eDqR/V9WB6X9n2uxrDsrEDPWA6qDZPCRSx2Ar+MGdTw5RgGMi/Yc3MH
         nlwg==
X-Gm-Message-State: AOJu0YypgDfQIb9bUAD8MgyPWDkaanI19dv+8GSuzujWcMB4bcdfoEeV
	3hNP5BdkCOawMav1iogCL0hhF6OVywpLx1IzOmg0tevUsSwBuvy0MnZokQBYhrCkdOENozz5c88
	x8Nc0Jz2bcGDBKCQzBk754TZZRR9XLKuOj2M=
X-Gm-Gg: ASbGncu25shd7+JkoD9DHL9prh0bDroKAPEfRJqrmpkHogmnTCmZt368CL8NS2TLJaT
	54wYlSImJozjkHZA1DJXPllxmedd85vJVHI5nG2CHk+o5saUNWPolhBsru/Du4qkDPg2OV3XSNY
	vSfYTQByLUcufDOHLAaap3wsIsFfsj
X-Google-Smtp-Source: AGHT+IHvN1ivuOd0DmhdAdsjeu/IYGRV9SHV/D8OtBId65WsID3ibdmOzFu20qzoLEu/0GHaE1QrN/oyobAd2QuPj3Y=
X-Received: by 2002:a05:6512:398e:b0:546:2f7a:38c4 with SMTP id
 2adb3069b0e04-5494c3235d3mr5608202e87.13.1741029196348; Mon, 03 Mar 2025
 11:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20250225034557.2148517-1-liezhi.yang@windriver.com> <20250225034557.2148517-2-liezhi.yang@windriver.com>
In-Reply-To: <20250225034557.2148517-2-liezhi.yang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 3 Mar 2025 20:13:02 +0100
X-Gm-Features: AQ5f1JqBjNz6Koc4BBheGwx4xWcHP8Dc3EFBW_hSTob5JXHGOY21oaRvhHH5crg
Message-ID: <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 -> 1.0.14
To: liezhi.yang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 19:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115728

On Tue, Feb 25, 2025 at 4:46=E2=80=AFAM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * License-Update: Update links in GPLv3 (http -> https)
>
> * It need depend on pkg-config, udev and clang-native to build
>
> * Move it to dynamic-layers since now it depends on meta-clang.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../thin-provisioning-tools-crates.inc        | 124 +++++++++++++-----
>  .../thin-provisioning-tools-git-crates.inc    |   0
>  .../thin-provisioning-tools_1.0.14.bb}        |  10 +-
>  3 files changed, 102 insertions(+), 32 deletions(-)
...

> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisio=
ning-tools_1.0.13.bb
> rename to meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools_1.0.14.bb
> index 1d3c797244..e5a683aa0f 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-t=
ools_1.0.13.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.0.14.bb
> @@ -4,17 +4,23 @@ HOMEPAGE =3D "https://github.com/jthornber/thin-provisi=
oning-tools"
>  LICENSE =3D "GPL-3.0-only"
>  SECTION =3D "devel"
>
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
>  S =3D "${WORKDIR}/git"
>
>  SRC_URI =3D " \
>      git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain;pro=
tocol=3Dhttps \
>      "
>
> -SRCREV =3D "116c05345bed5fe727992c3458311606d5443ff6"
> +# v1.0.14
> +SRCREV =3D "6be3e0937800cb947f1be7c0150825f155cfca14"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  inherit cargo cargo-update-recipe-crates
> +inherit pkgconfig
> +
> +DEPENDS +=3D "udev clang-native"
> +
> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"

This path won't be correct for multilib builds where target ${libdir}
might be e.g. /usr/lib32 while native libdir is /usr/lib.

Is there a reason why you haven't used STAGING_LIBDIR_NATIVE variable
which uses correct ${libdir_native}?

Regards,

>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115557): https://lists.openembedded.org/g/openembedde=
d-devel/message/115557
> Mute This Topic: https://lists.openembedded.org/mt/111371873/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

