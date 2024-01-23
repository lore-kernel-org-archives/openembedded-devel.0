Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD8EC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:44:54 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.1479.1705974288199859533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXP2g4FL;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ddf05b1922so2874206a34.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 17:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705974287; x=1706579087; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJxd1UtLHFUp/Y+Czyf+z8j1OukYJVCQVQXvj0xAMqo=;
        b=LXP2g4FLig/oRI0cWs5RaLn6y0j5FyEaAr/7jwIysn4hitiaHavhYmG8VC6JL1jEmg
         PLKaYLG/ZztZq42UdxoVFuQuWXVgZsi7PwEx1oq8fUAVW6I2Tzlk9uhvXfTl6ZDZEZeV
         k0+Bl0N21PgECkZEn8G6VLPAazNwBeykArMmzeL57vUFnuVZJkgUK2xlqsgcZlsCSe7a
         PGh3AGqZ0tnITvwCbACpArDmjbWdIGxNk70TPT33x0Htk3O+8OOnvA7kZEacOBIY8uYr
         +fkRFgQA4jyMGAK4O4QTjWRUotc6UGdv34+CDYfJ7uL49mem7MqCqrh6WEJf9ON+RMWS
         0axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705974287; x=1706579087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJxd1UtLHFUp/Y+Czyf+z8j1OukYJVCQVQXvj0xAMqo=;
        b=Ps7xBHdkX0Z26fhgKXLPMYQqS4/BgU3nYQu3UJ0whFzUGNSaNhLowCVE+i98l3lVBR
         2ryvycHrOrRvAKU0KuqmFxdeUYZgMK6APi7Kmra7K+UnWkEKMZd19/9YQmt6Vp9BTx/R
         kLSB3tDPbJyXcEhPqmLQVlclGZS+V+u9Y72k9A8Nlxh3bmYQNZ8jJcnJxp0yV/t+n5aU
         aj3PgmujfM0ndyWP4ENavJxfK0WUw4FlNwvXY5Euo83DexWYU44hRb5LoiOCzctq9Ye3
         0pEeGzJYenCG7HHqHfn4mPrejyhBxcjLpqR2qAYHtdV3t3vDg+W0cZ/s5U+vVTF8WYoM
         pY6g==
X-Gm-Message-State: AOJu0YwHdVID/x+2EoAfG4KiMB9/NbcsKwuoUGJSFljhdYOTqyqwfmQj
	losI9mfeIsT6Mz4ou73GH9JQ5TsjGHddEKK1vvjpOAutU2haH26nJyaRXH7SAluC+zX7hxaTP8O
	vq9Sgacx7uh20hIN6tD9eleKyLNY=
X-Google-Smtp-Source: AGHT+IGLqNvxa+7cfzhjQsMnwvF/qYP6rWGhghWNBHMgzquV2NOXg7otB87fhSnJysOjm3heAvN+az9kOCad8wvYIyc=
X-Received: by 2002:a05:6870:219b:b0:210:ba0d:fa9a with SMTP id
 l27-20020a056870219b00b00210ba0dfa9amr915339oae.48.1705974287306; Mon, 22 Jan
 2024 17:44:47 -0800 (PST)
MIME-Version: 1.0
References: <1705970908-24302-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705970908-24302-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jan 2024 17:44:21 -0800
Message-ID: <CAMKF1srfbrpUhpbQd_CHsXZSiWtN2tCHnHSR7LGBpZmXXoyfdQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] ccid: upgrade 1.5.4 -> 1.5.5
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108409

On Mon, Jan 22, 2024 at 4:52=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Add-build-rule-for-README.patch
> refreshed for 1.5.5
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Add support of
>   - Alpha-Project ANGARA Token
>   - Broadcom Corp 58200 (idProduct: 0x5864)
>   - Broadcom Corp 58200 (idProduct: 0x5865)
>   - Imprivata USB CCID
>   - KAPELSE eS-KAP-Ad
>   - Kapelse inSide
>   - KAPELSE KAP-Care
>   - KAPELSE KAP-eCV
>   - KAPELSE KAP-GO
>   - KAPELSE KAP-LINK2
>   - Kapelse KAP-Move
>   - Kapelse Ti-Kap
>   - rf IDEAS USB CCID
>   - SIMHUB pcsc reader
> - support Kapelse readers on macOS (composite as multislot)
> - Some other minor improvements
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../ccid/ccid/0001-Add-build-rule-for-README.patch  | 13 ++++++-------
>  .../ccid/{ccid_1.5.4.bb =3D> ccid_1.5.5.bb}           |  2 +-
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-support/ccid/{ccid_1.5.4.bb =3D> ccid_1.5.5.bb} (=
85%)
>
> diff --git a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-RE=
ADME.patch b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-READ=
ME.patch
> index 46d30e8c1..0904207bb 100644
> --- a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.pa=
tch
> +++ b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.pa=
tch
> @@ -1,24 +1,23 @@
> +From c82680a21c7411ba63e5815786eeb471720faa29 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Wed, 6 Nov 2019 20:10:09 +0800
>  Subject: [PATCH] Add build rule for README.
>
>  fix do_configure error:
>  Makefile.am: required file `./README' not found
>
>  Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ----
> -Upstream-Status: Pending

This is dropped without updating this elsewhere, I have restored it
while staging.

>
> +---
>   Makefile.am | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 49574a3..a5a7c2a 100644
> +index e77c4c4..fd77ecd 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -26,3 +26,4 @@ libtool: $(LIBTOOL_DEPS)
> +@@ -27,3 +27,4 @@ libtool: $(LIBTOOL_DEPS)
>   ChangeLog:
>         git log --stat --decorate=3Dshort > $@
>
>  +README: README.md
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.4.bb b/meta-oe/recipes=
-support/ccid/ccid_1.5.5.bb
> similarity index 85%
> rename from meta-oe/recipes-support/ccid/ccid_1.5.4.bb
> rename to meta-oe/recipes-support/ccid/ccid_1.5.5.bb
> index e53ffa40b..e76881916 100644
> --- a/meta-oe/recipes-support/ccid/ccid_1.5.4.bb
> +++ b/meta-oe/recipes-support/ccid/ccid_1.5.5.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "https://ccid.apdu.fr/files/ccid-${PV}.tar.=
bz2 \
>      file://0001-Add-build-rule-for-README.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "6e832adc172ecdcfdee2b56f33144684882cbe972daff193=
8e7a9c73a64f88bf"
> +SRC_URI[sha256sum] =3D "194708f75fe369d45dd7c15e8b3e8a7db8b49cfc5557574c=
a2a2e76ef12ca0ca"
>
>  inherit autotools pkgconfig
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108379): https://lists.openembedded.org/g/openembedde=
d-devel/message/108379
> Mute This Topic: https://lists.openembedded.org/mt/103900764/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

