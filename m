Return-Path: <kieran.bingham@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82BFD3B7DD
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:16:50 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4385.1765185405569850619
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=GPjM/ObH;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56133AD0;
	Mon,  8 Dec 2025 10:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765185264;
	bh=sRYWxQEcFc+Z+oClIT4NNIZd1UBlDUV5HFN5y7TlZbw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GPjM/ObHhMDlmctuMlRtBQvwQutOLkAcUOjZSEZ7ZK7CzK+/bfXlQyC+iDOazijlV
	 REHpqsUyHS639rHdK5VZh/2lbi3I2rSRyVPAXKUgKiE/uub55wtR40jZ9kQ2AynakL
	 XRZFW/Tm9dosqHVZstdpw2yk6EezoNbSvbkxMYPU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251208-upgrade-libcamera-v1-1-2dca4e4c9e5c@schnwalter.eu>
References: <20251208-upgrade-libcamera-v1-1-2dca4e4c9e5c@schnwalter.eu>
Subject: Re: [PATCH] libcamera: upgrade 0.5.2 -> 0.6.0
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: Walter Werner SCHNEIDER <contact@schnwalter.eu>, openembedded-devel@lists.openembedded.org
Date: Mon, 08 Dec 2025 09:16:39 +0000
Message-ID: <176518539944.890597.16128317924143285350@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 09:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122372

Quoting Walter Werner SCHNEIDER (2025-12-08 08:44:21)
> Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
> ---
>  .../libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch  | 8 ++=
++----
>  .../libcamera/{libcamera_0.5.2.bb =3D> libcamera_0.6.0.bb}          | 2 =
+-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
libcamera-Do-not-assume-libc-with-clang.patch b/meta-multimedia/recipes-mul=
timedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.pa=
tch
> index 74952050413a9a824712e37f00f1167305a60d0e..25d88cfff432b2ce2d032d778=
bfec1671c1d903c 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcame=
ra-Do-not-assume-libc-with-clang.patch
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcame=
ra-Do-not-assume-libc-with-clang.patch
> @@ -1,4 +1,4 @@
> -From 82e9d391d312d65e7a62252e9e153b93c06ad37b Mon Sep 17 00:00:00 2001
> +From 0c68347365ec4c0bd3f84e1d2f9f51eb3c2405c8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 24 Oct 2025 11:10:59 -0700
>  Subject: [PATCH] libcamera: Do not assume libc++ with clang
> @@ -17,13 +17,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 21 insertions(+), 11 deletions(-)
> =20
>  diff --git a/meson.build b/meson.build
> -index fd508fd7..5707f850 100644
> +index fa6487f6..89294936 100644


Is there a need to change this patch?
(0001-libcamera-Do-not-assume-libc-with-clang.patch)

>  --- a/meson.build
>  +++ b/meson.build
>  @@ -118,7 +118,24 @@ cpp_arguments =3D [
>       '-Wnon-virtual-dtor',
>   ]
> -
> +=20

I think you can drop this whitespace change

>  -cxx_stdlib =3D 'libstdc++'
>  +# Try to detect libc++
>  +libcxx_ver =3D cxx.get_define('_LIBCPP_VERSION',
> @@ -43,7 +43,7 @@ index fd508fd7..5707f850 100644
>  +endif
>  +
>  +message('Detected C++ standard library: ' + cxx_stdlib)
> -
> +=20

And this one.

>   if cc.get_id() =3D=3D 'clang'
>       if cc.version().version_compare('<9')
>  @@ -138,16 +155,9 @@ if cc.get_id() =3D=3D 'clang'
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> similarity index 98%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> index 0c6941213be2b4b2ffc07042e1fe086834e485dc..3b9e4e3fd4ef3dc2e8120f5e3=
ea22ae6cbb69340 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D " \
>          file://0001-libcamera-Do-not-assume-libc-with-clang.patch \
>  "
> =20
> -SRCREV =3D "096c50ca881f72d858aca19757a5e73b4775a7cc"
> +SRCREV =3D "3c17d1fbb2bd93f221afee788ebf0d7394032e4d"

But this is indeed v0.6.0.

> =20
>  PE =3D "1"
> =20
>=20
> ---
> base-commit: 31a08525bedd960c21214f84c256f67c6090bb5a
> change-id: 20251203-upgrade-libcamera-9970beda88ca
>=20
> Best regards,
> --=20
> Walter Werner SCHNEIDER <contact@schnwalter.eu>
>=20
>

