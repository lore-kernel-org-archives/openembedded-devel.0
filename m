Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD07C35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 12:22:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.8562.1742646150405805921
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Mar 2025 05:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m14Oj9XE;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54954fa61c9so3403519e87.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742646148; x=1743250948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfTzdIaAWmbH8ufi+cV4c7T+XcOn5/UQadldWi/g4pE=;
        b=m14Oj9XEsfc5DC2YA1p/OaRcQDMaSoU1s4MM/BRqihG5tAZuscR9bu6/hFaqaVzQAD
         7h9oGKZyABjQvh3kBLU+Zg66eIjzKYmGQ4oBjyK6Qd2nIiAbiGBjwk1UR6sKagAmVYN/
         D5tKEEE1rZyQBPLmSa/ZYbAQstsd3jNjHdOspGoOgUsYu/8TNGeVJURJMNKuq9aEfR7/
         UxHI96cXkARKS+SIDfl1DX7pfKom9wVHoAu83tuuLO77L7mri6P4fLAOwbFiYtWyuaO6
         vRSWRXibLyCpxNDAmtiBVxaPEHvaQwMFfCfPPBM6e12qd8z0MjdAqYNanc3HogMxmH97
         0aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742646148; x=1743250948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfTzdIaAWmbH8ufi+cV4c7T+XcOn5/UQadldWi/g4pE=;
        b=gLTgZH86R5T0nGkeL+bwoi+R3PfIpMIx2/NVXYULn0ILRmAenby3JSPN9Ezgr1kYuw
         bAW4sZ0+4U9QGMO9LUX/QmoHmlg1D5S6xVV35t1QlPIIDMNs/XEOCfYKFKggqJE+X9tJ
         g96TKYZe+BhRQ0qXnmqs5VHVq47Uqll5ks5NjRBde4fVbMBes4bwJhPT97XLjE+1qWfS
         PPMHnQ+fhfYlhCUrhKTq/5MdR2V4bDR2vsiVc8QC2elGF2EQYRoXtyWpawFV5p44M6b+
         1lq/MRmrI/VQRYmWHxBECq4GA4sSH0cL9fDNM4KWP0tqcx/JCl2ucSL6eM5JEnj9Ycq3
         fe+A==
X-Gm-Message-State: AOJu0Ywu6ueVHPUHjMm06jDUFcg4r4V/JjWD4plREIk8BLnTl9nl6ik1
	YjRQEw4/LVOwKM6BLjva5np4US48tjdgrF8UZC2ARAcYBn9OWhzIsZY5NpZWt5k2458L1mUCfTt
	dyETkz5oFhCtoT/BFssfXTyPOI2E=
X-Gm-Gg: ASbGncu4BHgMuZJGkOegkWnM5x6D3hGrc1GpRM18GQ6+u28uii5KZj7nGz6eT1shV87
	mlBj+ALDsAt5+eHvnxkajcnEN9aghHx8R+bd2Ymq+/lygAPd5BtykWnGzSUwMMeANu5KuvreayF
	tmh4QOFkStrz/wspvILlkMwxuJgN3a
X-Google-Smtp-Source: AGHT+IGMNo6cHcUWrnxyu+X8OmlfRf6JJXvvUH5vMDpNoC8v2bmMbnExJii74GCYDJOHsUMKZmnxL4t+U+tz4yMP5GQ=
X-Received: by 2002:a05:6512:33ce:b0:549:7354:e4d1 with SMTP id
 2adb3069b0e04-54ad64f5a99mr2231965e87.38.1742646148173; Sat, 22 Mar 2025
 05:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250322025925.1070828-1-raj.khem@gmail.com>
In-Reply-To: <20250322025925.1070828-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Mar 2025 13:22:16 +0100
X-Gm-Features: AQ5f1Jqq-1DQ7Mx8Wi4MzSWRdk0OtRm9520EI_bfYTaCjOVmIy5EFcvc0wKVbCM
Message-ID: <CA+chaQccQAwyh4TfvFMKRkxAiBjF=zSthmyy7x5QK+zHs54uJA@mail.gmail.com>
Subject: Re: [PATCH] lvgl: Upgrade to 9.2.2 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>, 
	Jaeyoon Jung <jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 12:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116199

On Sat, Mar 22, 2025 at 3:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Drop backported patches
> Enable thorvg packageconfig, build fails without it now

Did you plan to add thorvg to default PACKAGECONFIG (I don't see that
in the commit) or did you mean just adding those LV_USE_MATRIX,
LV_USE_FLOAT, LV_USE_LOTTIE to be enabled when someone enables thorvg
in bbappend?

Otherwise LGTM, thanks.

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
..
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
> index 41133f3438..69e42af922 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -33,10 +33,16 @@ LVGL_CONFIG_LV_USE_GRIDNAV =3D "${@bb.utils.contains(=
'PACKAGECONFIG', 'gridnav', '
>
>  LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D "0"
>
> +LVGL_CONFIG_USE_LOTTIE =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorv=
g', '1', '0', d)}"
> +
>  LVGL_CONFIG_USE_VECTOR_GRAPHICS =3D "${@bb.utils.contains('PACKAGECONFIG=
', 'thorvg', '1', '0', d)}"
>
>  LVGL_CONFIG_USE_THORVG_INTERNAL =3D "${@bb.utils.contains('PACKAGECONFIG=
', 'thorvg', '1', '0', d)}"
>
> +LVGL_CONFIG_USE_MATRIX =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorv=
g', '1', '0', d)}"
> +
> +LVGL_CONFIG_USE_FLOAT =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorvg=
', '1', '0', d)}"
> +
>  DEBUG_BUILD ??=3D "0"
>
>  ALLOW_EMPTY:${PN} =3D "1"
> @@ -84,6 +90,9 @@ do_configure:append() {
>          \
>          -e "s|^([[:space:]]*#define LV_USE_VECTOR_GRAPHIC[[:space:]]).*|=
\1${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|" \
>          -e "s|^([[:space:]]*#define LV_USE_THORVG_INTERNAL[[:space:]]).*=
|\1${LVGL_CONFIG_USE_THORVG_INTERNAL}|" \
> +        -e "s|^([[:space:]]*#define LV_USE_MATRIX[[:space:]]).*|\1${LVGL=
_CONFIG_USE_MATRIX}|" \
> +        -e "s|^([[:space:]]*#define LV_USE_FLOAT[[:space:]]).*|\1${LVGL_=
CONFIG_USE_FLOAT}|" \
>          \
> +        -e "s|^([[:space:]]*#define LV_USE_LOTTIE[[:space:]]).*|\1${LVGL=
_CONFIG_USE_LOTTIE}|" \
>          -i "${S}/lv_conf.h"
>  }
...

