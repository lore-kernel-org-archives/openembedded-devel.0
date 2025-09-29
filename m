Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EE8CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:55:43 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.3338.1759164933564272009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKgzpzUr;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcab69so45758567b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759164933; x=1759769733; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcDk4rUJqAz0yICNPKaUfRSeQ100fO6zPc1tmSo7ZRc=;
        b=WKgzpzUrMOsUXq8m+iDFa7oRnC3cHIm+3i8qVczbzUJXJC6F3rgdmLRNOM8CeY399n
         tMrufwj4uUrUIMDAo944uL1emWQRHvly2UZuY4k98iI/gKfnKVjQs1DdDZtPvtSPWCUR
         n+x3G5CgjMudTA2lruy2hgT5Eof3cdS8STV8gamYnCUi7T/pRz3hhLQDEAIKhtSSPBkC
         YYT8GpbHkfIdK++Pz5wz/3q6tb8dv9x51/e0HD2f1w7ECk0jKBFojyjsqBz2j8OIO9QO
         heg1VTG/Vkm5enQBG0Ier4Y8qhR3Gu13VnN3cd55/S5JhwMfTtckwJqo/Av5pss/hYkb
         4+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759164933; x=1759769733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcDk4rUJqAz0yICNPKaUfRSeQ100fO6zPc1tmSo7ZRc=;
        b=HBSj7EcDoXa9EsCPP3p+BfQ6a6H9ZFLcUG2acNp6OeDvT8b35F7e+SP5xv+0Uf6BMQ
         nwBnc7Ha5QONGhk6zLUXZFvu4PkBQ7J6w1i/r5+VKF7F3qJTYZi/4hGwsl+ZY6trRJL2
         R1hMOUvTO3BXBshBmdUPKbZVU8yXpFtCj9GseW/CJNlw2VHr1cu0ALkEerqrtgjSuOLw
         K8nFCZO72JF84YUcmJ0G04+i/wCuQ8BwvD0c/E/4szmUGKe3wsCiU6TqRpWviTgaQSuI
         bh4DYWtYlwj6f6t+KMxPwnp1CaLrEDNeU9zDPJBJtev1pdaDnTP9xcuLPiEk5M9rn6Cp
         y0pQ==
X-Gm-Message-State: AOJu0YwALTIpbI/TamOg7my0L/rG+VFHG1LpYw7FXKMIraiRe90nRCG4
	+B7XikgADnByV/sOShZmRVfqgxZX4qwZxb01ck1yqZN0ga820A8Ho4dK+yyhqCEgDv5syJbhbMD
	GehpiJc2SYyqxP9tePCWRYe/eW308wO69Bcs/
X-Gm-Gg: ASbGncvOszEclLuShQY/WUZOTKNLEXdXYqTQpL1TLme7GyxC6yUfrUUVZKLyGAnXUYP
	ilz+0gJ2v6PHYmyeQ2UMsxukGycJK5TKC1M5GziIpYIUY8B9S4oovc2lWbcDFKl5yVBphJ55+2J
	aVr+GlurjmtwhcrULV7r0KE2THm8mFNFbwGavU8XStzzc53eC3lq46WEaVrj/Rr6S6lob667B3r
	UG3XKAe3I7griCHduH9X1Gsq6xODMDtQBjNlYiXsM/yPPr+BleNgFrXY/101i1MTe0+4cVeE4xH
	mwpxy/aFDvVraIpbbXeCsr6McAxo+dF7lUDRSAlf6mtC5nJ45BXwyktnbwaws67/HiNA
X-Google-Smtp-Source: AGHT+IEy8yxX1OwmhJGnwuMsR3adpWuqx1d8hnj5IqWuRpHH4lFonOAdcZHfWVXeWs3rOqq5NiNEExEYbBFujNuxjrI=
X-Received: by 2002:a53:c202:0:b0:635:4ed0:5723 with SMTP id
 956f58d0204a3-6361a83517amr15718792d50.39.1759164932624; Mon, 29 Sep 2025
 09:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250929130425.2912077-1-skandigraun@gmail.com> <20250929130425.2912077-3-skandigraun@gmail.com>
In-Reply-To: <20250929130425.2912077-3-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 09:55:05 -0700
X-Gm-Features: AS18NWBBr4yNsNpT2rCcrqvALDLNVCqynCaz6B-DzHPt8jpbmiRmf53qdBsH3BU
Message-ID: <CAMKF1sqK_wGaW0P6uy1b+OQ24dU6nQWcYjP2DmWr_CSEtWzcAw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 02/22] lksctp-tools:
 upgrade 1.0.19 -> 1.0.20
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 16:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120039

On Mon, Sep 29, 2025 at 6:05=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Yi Zhao <yi.zhao@windriver.com>
>
> ChangeLog:
> https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog
>
> Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
> recipe.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 162039c327f065d87730565b18fdc3986844a065)
>
> Adapted to Kirkstone.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...lksctp-tools_1.0.19.bb =3D> lksctp-tools_1.0.20.bb} | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>  rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19=
.bb =3D> lksctp-tools_1.0.20.bb} (80%)
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.=
bb
> similarity index 80%
> rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0=
.19.bb
> rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.2=
0.bb
> index 4a9d2f54d9..51d9605624 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20.bb
> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
>  "
>
> -SRCREV =3D "05b50d379ff0037de4957bb2a1befcce88b70225"
> +SRCREV =3D "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
>
>  PV .=3D "+git${SRCPV}"
> -LK_REL =3D "1.0.19"
>
>  SRC_URI =3D " \
>      git://github.com/sctp/lksctp-tools.git;branch=3Dmaster;protocol=3Dht=
tps \
> @@ -34,19 +33,14 @@ do_install_ptest () {
>      done
>  }
>
> -SOLIBVERSION=3D"${LK_REL}"
> -SOLIBMAJORVERSION=3D"1"
> -
>  PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
>
>  FILES:${PN} =3D " \
> -    ${libdir}/libsctp.so.${SOLIBVERSION} \
> -    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/libsctp.so.* \

do the versioned shared libs still follow same conventions as prior release=
 ?

>  "
>
>  FILES:${PN}-withsctp =3D " \
> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
> +    ${libdir}/lksctp-tools/libwithsctp.so.* \
>  "
>
>  FILES:${PN}-dev +=3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120015): https://lists.openembedded.org/g/openembedde=
d-devel/message/120015
> Mute This Topic: https://lists.openembedded.org/mt/115494436/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

