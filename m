Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E75C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:29:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.137098.1692113377600744274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cZ2Gxzsp;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a7d7df4e67so3866198b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692113377; x=1692718177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z33lVjvbu9kroYXvvZ+w7Lx7/t5E0R01d+m4urGPmtw=;
        b=cZ2GxzspSAKMDr+WV1ErtwhHSIsogdE9F5pCnwFcWXD3toxjBIWCmmWrlfX+YX3Pwq
         heGIkRBWEDOTzU57DTNTp7uREWsFcf3rBVA4oxjUv159pV0CYXlavrjBZ5X5jDcMpMjS
         OvoE8wvlvcMuAzkCn1xr1u/9YotYS5pZ6cA9jpizS2z1RW5dDhfR4MTPAjaZdk8lP48p
         ExyKK4UKT1VsHkMUCcQPz3gp9vj9xuDL+QkgQLr+xTe5z5hM8IKk+SgO5xrX8G5diPCj
         1Kr5yko4witEt9YqEIaLrkshOx4FUw8IIChOYnwikUDjtaYeWqsmiZ45snPk+Ljjxg++
         i0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692113377; x=1692718177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z33lVjvbu9kroYXvvZ+w7Lx7/t5E0R01d+m4urGPmtw=;
        b=lBFistpCKHRgaiUbsa7k09BITH0yZp2kOBPWUyJLiDRQnt/IAkZ1pThKuRNuGrRFcf
         LoJGCpLcJezBKTlOFl4xpl0y4nokb2DHTN/ybsp3lGwgGNrGlVdl/Gn0emrW9MujHJkR
         u53lY0Vi2RvxlAiaFweQRir75bHtb961Bjz//hoXVFOf1AOElmM2NNa8u9F/hlxTXCzf
         Z32P9Glg+Z/tT6zyeHjXYb8LpYoJeSAFsqT79hwlpqLLGN7yC9c6bBv0FJPJsrRyf8bo
         snNlVm89taIF5ZdWQW+kU9bwsZUWNRhCYUvXJdS9PfRRd6YsInPSRMfyhiE+82rbQdTq
         CJAQ==
X-Gm-Message-State: AOJu0Yx2L4ZVkAxCafOxR+PzzD+h0GCVRxi3zmkl9daWH0yaI44SWm9o
	72epTFOThjsYR2Qli7eGjSpeJoLLDIE2WzkPwVQ=
X-Google-Smtp-Source: AGHT+IHfU/omVGM2SXm+SHGYMFCRFZcLQJLlhJQq6eZLVJ4b9nzGPMv3wRmibgvaN75jVjuLBP3XXkNBhqyGK5ajM6k=
X-Received: by 2002:a05:6808:3cf:b0:3a7:612:f62b with SMTP id
 o15-20020a05680803cf00b003a70612f62bmr12570784oie.25.1692113376755; Tue, 15
 Aug 2023 08:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230814213631.535375-1-chaitanya.vadrevu@ni.com>
In-Reply-To: <20230814213631.535375-1-chaitanya.vadrevu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Aug 2023 08:29:10 -0700
Message-ID: <CAMKF1sp3Nv+gQ0onYU43oj1YHzHuN+UGowkvWvqvxvY+z_1_Gw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-bsp: Add bolt
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 15:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104357

On Mon, Aug 14, 2023 at 11:10=E2=80=AFPM Chaitanya Vadrevu
<chaitanya.vadrevu@ni.com> wrote:
>
> bolt is used for managing thunderbolt devices.
>
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
>
> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp=
/bolt/bolt_0.9.5.bb
> new file mode 100644
> index 0000000000..f9f1b026f4
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Thunderbolt user-space management tool"
> +DESCRIPTION =3D "Userspace system daemon to enable security levels for T=
hunderbolt on GNU/Linux"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/bolt/bolt"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS =3D "cmake-native udev polkit dbus"

cmake-native would be added by inherit cmake below. polkit is a distro
feature so we should add
a check for that feature see meta/recipes-gnome/gnome/gconf_3.2.6.bb
for an example. If polkit is
always needed for this then add a distro feature check.


> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=3Dhttps=
;branch=3Dmaster"
> +SRCREV =3D "5a8a5866a847561566499847d46a97c612b4e6dd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig meson
> +
> +FILES:${PN} +=3D "${datadir}/dbus-1/* ${datadir}/polkit-1/*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104355): https://lists.openembedded.org/g/openembedde=
d-devel/message/104355
> Mute This Topic: https://lists.openembedded.org/mt/100753366/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

