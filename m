Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E7DC30638
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:11:49 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.189947.1692285102457773641
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=f6zhVnFp;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a76cbd4bbfso6826351b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692285102; x=1692889902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q//LoNx1vkRiUqRuJXrq+qt+MMMFTRV8daSjUgVxUBY=;
        b=f6zhVnFpBaiufI6T5j+OMDtnsbu3cscb/EoslD+HEtok0PKgKoSe1wctA/5F/Co8vN
         VlxeXGrtIeuBgNfZeLUGsXYv88tsheqck19XK0sZR5KpjkPbVmukLpn2kYrjkb0fH/Lo
         VIxqc+GSZtPu3FO5tF6Q30q6M6UP+FLHlQXXaHKhMEpkjI21/y6+YJDLnUfO1myidJQs
         ggp7KkPPKIJV1LZ9inm/8Ze8VnINJI2R5N3ItJy7z4oa0Z1FsnAVwP7AmvORRLggWOHj
         NLY3vjpVGtFdn86l0W9cxp95ZPU+JFfIyMZ5CUCkBt4X/NEOoZMr9feO4ZZya3vkc/lW
         FRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692285102; x=1692889902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q//LoNx1vkRiUqRuJXrq+qt+MMMFTRV8daSjUgVxUBY=;
        b=C4ByykQ2e3ofRx3HKzaqOLoWrHSVjQ8KeaswaCRp6hVxh2qI2jzS8LgfOU3Q+2Elnt
         DGiOuql5ktJ7b6KsgMRVnBpdRuVFHm3IjY4Q/rQQXs9lw2AtKQXXt181UD1TwHJxw3n3
         GRqImIFyWFZTwaatwmHR1wdSeDm2RLjdtGn2Cw4SHSKVycTxWGiFNDq7mVpMg0hexRTW
         TqoTc74WOJW+kTrCqscWlkKkx4CqURNRq6Hj2Dr9cVNMWHuxFzGSgE/ntsq3WNJ+xlbv
         2x4TtqFLe38EPbFD0jU2WwtG9SY2IJ90MukDz+ovQyHk9DQ8tNbGL56W2SgcI7dwQX+P
         caGg==
X-Gm-Message-State: AOJu0YyFKxxjuS+OgfDfZfYiHV1kawQ5L83/IiqGdQsoGGYxDUOWgu/+
	1OZ1X5J4j2gYD6SxM8krBiIrcS5t91pBzUmr6yXeumkf2X8=
X-Google-Smtp-Source: AGHT+IE21mdGt+YWL3nv6VQVKhtNgVR+rXS0XkyAeDF4A/Edze/jngNYHqPxmJWQ3osKqGi1fOjH9dopXVNp+tLwPuw=
X-Received: by 2002:a05:6808:3083:b0:3a4:4b42:612b with SMTP id
 bl3-20020a056808308300b003a44b42612bmr6750620oib.42.1692285101656; Thu, 17
 Aug 2023 08:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230817124736.3524633-1-ewa.kujawska@3mdeb.com>
In-Reply-To: <20230817124736.3524633-1-ewa.kujawska@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:11:15 -0700
Message-ID: <CAMKF1sohzPnnhp3bZ6ubp=ccfPNCXYzN3v_2QiksgVN85Bwj7w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-libusb1_1.7.1.bb: recipe added
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104466

this does not apply on top of master or master-next, please rebase and
send again.

On Thu, Aug 17, 2023 at 5:47=E2=80=AFAM Ewa Kujawska <ewa.kujawska@3mdeb.co=
m> wrote:
>
> A pure-python wrapper for libusb-1.0 refers to a Python module or
> package that provides an interface to interact with the libusb-1.0
> library using Python code. libusb-1.0 is a cross-platform library
> that allows applications to communicate with USB devices without
> the need for platform-specific drivers. It provides a standardized
> way to access USB devices from various operating systems.
>
> Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
> ---
>  .../python/python3-libusb1_1.7.1.bb                 | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb=
 b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
> index 476966c2178b..9f95e5595178 100644
> --- a/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-libusb1_1.7.1.bb
> @@ -1,15 +1,16 @@
>  SUMMARY =3D "Pure-python wrapper for libusb-1.0"
> +
>  HOMEPAGE =3D "http://github.com/vpelletier/python-libusb1"
> -AUTHOR =3D "Vincent Pelletier <plr.vincent@gmail.com>"
> -LICENSE =3D "LGPL-2.1"
> +LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -SRC_URI =3D "https://files.pythonhosted.org/packages/80/bb/4ee9d760dd294=
99d877ee384f1d2bc6bb9923defd4c69843aef5e729972d/libusb1-1.7.1.tar.gz"
> -SRC_URI[md5sum] =3D "cb4073182fef4cee6ab9c6666b48d1a1"
> +SRC_URI =3D "https://files.pythonhosted.org/packages/80/bb/4ee9d760dd294=
99d877ee384f1d2bc6bb9923defd4c69843aef5e729972d/libusb1-${PV}.tar.gz"
>  SRC_URI[sha256sum] =3D "adf64a4f3f5c94643a1286f8153bcf4bc787c348b38934aa=
cd7fe17fbeebc571"
>
> -S =3D "${WORKDIR}/libusb1-1.7.1"
> +PV =3D "1.7.1"
> +
> +S =3D "${WORKDIR}/libusb1-${PV}"
>
> -RDEPENDS_${PN} =3D "libusb1"
> +RDEPENDS:${PN} =3D "libusb1"
>
>  inherit setuptools3
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104463): https://lists.openembedded.org/g/openembedde=
d-devel/message/104463
> Mute This Topic: https://lists.openembedded.org/mt/100799510/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

