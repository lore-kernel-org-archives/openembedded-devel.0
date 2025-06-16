Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4349CC71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 14:46:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.32603.1750085173652250414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jun 2025 07:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBn50UQD;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553543ddfc7so4750181e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750085172; x=1750689972; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEbJQ3ZJrvbaZN2CaQjAkz7uir7p/I5h3Go8Ce7IPWk=;
        b=EBn50UQDcCvfM18bIBvnpYkjfviRavd5VeS9se9b6ueXE9xEbA/JUcHb6vFQR2lXhg
         euHgC3pTg9ndfo1Z+5MjfqD6XxxWxDvJE4O+vCkKzPUwxdOI0hko5XNBWJ5v5dXXw+hc
         qCUqfbdmSMV8UpU9BBbDFJ8ip25z7XlXLVshsvzCldb5M2QFISRdLrlXqf0Fy8yx2+lD
         s8uXnvg6RsmZAG4oSQ4nLpdgtZdqJ/FLN5NGCBhYQzlLmxTyONe8NO5sfSa9VWtNlcfT
         hFyti8sZs1sLAqjmh6QiqPWVaNQ9CPpjVC7ofn2SWVTyicoHY2ET7MKm5ZL+Miztbf0h
         FmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085172; x=1750689972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEbJQ3ZJrvbaZN2CaQjAkz7uir7p/I5h3Go8Ce7IPWk=;
        b=ZvVbmyaiW1ifuVOzPhdp8VUykcvfn+7Ab2kjNMC/abtWZwTDoEo5PvST0l4o5inCX6
         KrrhdYnTE+GERIY9SDe8iwkybrcUNdMMw5yheghazNucjwKfwPSXK0XVtW62qvv0pVFM
         c1yTbbJIEsn58cF+fnQo9kK1ToC4hAiEaZsE30QcNu0lM1riqOcXBtXsLoQVQ2cM9sMz
         SjUpDfrLBgqcSNUa1Qk/su2GeultUIE0vaYsxFu6bFwVxihfgMLJUEkVgEQqPe1x+MFm
         Jup44VBHqH2pqIx7zX0EOsf9vRl5by7hDACmyGsXXztuc6dGxBIzDCB7x9s803RTiX+s
         mt/Q==
X-Gm-Message-State: AOJu0Ywope39yaqIYGX3jTuR0vVePYmJipBaryGkNN9B2YAtF6kjh2ay
	tqai3aA9N0nUBj5vcO32C43XWTU6NMQtBmuEHPw+/gKu1zt6oraAO2aZhiXhxnJ2/uP3Gd9pzzG
	gTAFU1EQ0Rwf3JeF/BHHcHslyKBW4yks=
X-Gm-Gg: ASbGncv16lJnYJUxRIsMKV/Re+JhuKP3t636XfWpvcXbtoweUpmqcQKtPXyzadYKrEA
	a8JYbZtrS+up7wH9TGKnBbG6VVX/fW1X9B+X3oP2avPMaBCrCksSR8jKLjcpjXQgvJkZo2kjrko
	Ia/t+XU12Qgaka7WLZl6xj0nIImpHeH/+yhjMTIyXIrMbmsw==
X-Google-Smtp-Source: AGHT+IEB0lhAARzjzoZw9Dxl7dg1DrqniFAuAEf42e+zn2AmNxXjlC7DW1rzq/jHfrplEz2M63ELdrRdU7e/Ye9r9EI=
X-Received: by 2002:a05:6512:15a4:b0:553:2421:f5e6 with SMTP id
 2adb3069b0e04-553b6eaf161mr2373375e87.20.1750085171331; Mon, 16 Jun 2025
 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250413080802.602658-1-yoann.congal@smile.fr>
In-Reply-To: <20250413080802.602658-1-yoann.congal@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jun 2025 16:45:59 +0200
X-Gm-Features: AX0GCFtnUYVWolKVqDoXiAgRmSgN1RhBOeQNlKpL6rUcSKQXOE3tDWtAtVlajsQ
Message-ID: <CA+chaQcPcw8AaDtRancFsU01E7-R-YqtSn0VZqNLRMJ1BAQ=Hw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-evdev: Use Yocto kernel
 headers instead of host's
To: yoann.congal@smile.fr, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 14:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117915

This is now needed in walnascar branch as well.

On Sun, Apr 13, 2025 at 10:08=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Commit 01ebfecf1c94 ("python3-evdev: switch to PEP-517 build backend")
> did not update the way build arguments are passed to the build making
> them unused. In python3-evdev case that meant that the build used host
> kernel headers instead of Yocto's.
>
> When host's and Yocto's headers were different (currently the case on
> Debian 12 as seen on AB[0]), that triggered:
>
> | src/evdev/ecodes.c:542:29: error: 'KEY_LINK_PHONE' undeclared (first us=
e in this function); did you mean 'KEY_PICKUP_PHONE'?
> |   542 |     PyModule_AddIntMacro(m, KEY_LINK_PHONE);
> |       |                             ^~~~~~~~~~~~~~
> [...]
> ERROR: Task (.../../../layers/meta-openembedded/meta-python/recipes-devto=
ols/python/python3-evdev_1.9.1.bb:do_compile) failed with exit code '1'
>
> To fix this, use PEP517_BUILD_OPTS with the working (but weird looking) e=
scaping.
>
> Now that correct headers are used, their paths end up in the ecode.c
> file which lead to a buildpaths error, skip the check for this patch.
> This will be fixed in a following patch.
>
> [0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/4=
0/steps/40/logs/stdio
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b=
/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> index c48bc39c1f..b8930c97d5 100644
> --- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> @@ -11,7 +11,8 @@ do_compile:prepend() {
>      rm -rf ${S}/evdev/ecodes.c
>  }
>
> -SETUPTOOLS_BUILD_ARGS =3D "build_ecodes --evdev-headers ${STAGING_DIR_TA=
RGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/inp=
ut-event-codes.h"
> +PEP517_BUILD_OPTS =3D "--config-setting=3D--build-option=3D'build_ecodes=
 \
> +    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${ST=
AGING_DIR_TARGET}/usr/include/linux/input-event-codes.h'"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-ctypes \
> @@ -20,3 +21,4 @@ RDEPENDS:${PN} +=3D "\
>      python3-shell \
>      python3-stringold \
>      "
> +INSANE_SKIP:${PN}-src =3D "buildpaths"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116822): https://lists.openembedded.org/g/openembedde=
d-devel/message/116822
> Mute This Topic: https://lists.openembedded.org/mt/112238391/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

