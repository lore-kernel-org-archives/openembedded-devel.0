Return-Path: <kieran.bingham@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FB5C44507
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 10:38:33 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8156.1783939101648008316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 03:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=kUWuXYyG;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23D0742B;
	Mon, 13 Jul 2026 12:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783939044;
	bh=HaVk9NAbyuwVadpmMZ0qUqIfMXSR6KjIXL1cHL2t7Ww=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=kUWuXYyGOuWOVJdXEJw6vudkwwd9Ri4JZ1eImNS+XvJb++CXfxyXJ/9YFJG9J1qPL
	 vlWbaw+Yb/ZK7/W8HNxWR+GU0Oj1SWhba2RDK1PQ+QT7/KMR6Qtx9zzE3tBgNZGYy5
	 ktOod7wrHe4uFP9gHuSObO9nozUrgZ+omRrNIx2k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260713091756.66416-1-f_l_k@t-online.de>
References: <20260713091756.66416-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] libcamera: add libdrm dependency
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2026 11:38:14 +0100
Message-ID: <178393909487.727359.6008456952924140739@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 10:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128156

Hi Markus,

Quoting Markus Volk (2026-07-13 10:17:56)
> This fixes an issue seeen if 'glvnd' is in DISTRO_FEATURES:
> | FAILED: [code=3D1] src/libcamera/libcamera.so.0.7.1.p/egl.cpp.o
> | x86_64-oe-linux-g++ -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Ds=
se -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wf=
ormat-security -Werror=3Dformat-security --sysroot=3D/home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/recipe-sysr=
oot -Isrc/libcamera/libcamera.so.0.7.1.p -Isrc/libcamera -I../sources/libca=
mera-0.7.1/src/libcamera -Iinclude -I../sources/libcamera-0.7.1/include -Ii=
nclude/libcamera -Iinclude/libcamera/ipa -Iinclude/libcamera/internal -Isrc=
/libcamera/proxy -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei=
7-64-oe-linux/libcamera/0.7.1/recipe-sysroot/usr/include/p11-kit-1 -fdiagno=
stics-color=3Dalways -D_GLIBCXX_ASSERTIONS=3D1 -D_FILE_OFFSET_BITS=3D64 -Wa=
ll -Winvalid-pch -Wextra -Werror -std=3Dc++20 -Wnon-virtual-dtor -Wno-redun=
dant-move -Wmissing-declarations -Wshadow -include /home/flk/bitbake/bitbak=
e-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/build/config.=
h -O2 -g -fcanon-prefix-map -ffile-prefix-map=3D/home/flk/bitbake/bitbake-b=
uilds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/sources/libcamer=
a-0.7.1=3D/usr/src/debug/libcamera/0.7.1 -ffile-prefix-map=3D/home/flk/bitb=
ake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/bui=
ld=3D/usr/src/debug/libcamera/0.7.1 -ffile-prefix-map=3D/home/flk/bitbake/b=
itbake-builds/oe/build/tmp/work/corei7-64-oe-linux/libcamera/0.7.1/recipe-s=
ysroot=3D -ffile-prefix-map=3D/home/flk/bitbake/bitbake-builds/oe/build/tmp=
/work/corei7-64-oe-linux/libcamera/0.7.1/recipe-sysroot-native=3D -pipe -fv=
isibility-inlines-hidden -Wno-error=3Darray-bounds -fPIC -DLIBCAMERA_BASE_P=
RIVATE -MD -MQ src/libcamera/libcamera.so.0.7.1.p/egl.cpp.o -MF src/libcame=
ra/libcamera.so.0.7.1.p/egl.cpp.o.d -o src/libcamera/libcamera.so.0.7.1.p/e=
gl.cpp.o -c ../sources/libcamera-0.7.1/src/libcamera/egl.cpp
> | ../sources/libcamera-0.7.1/src/libcamera/egl.cpp:22:10: fatal error: li=
bdrm/drm_fourcc.h: No such file or directory
> |    22 | #include <libdrm/drm_fourcc.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~
>=20

libcamera doesn't actually depend on libdrm but this egl.cpp shouldn't
point to libdrm/drm_fourcc as we have a local copy of this header in the
libcamera project.

https://gitlab.freedesktop.org/camera/libcamera/-/blob/master/include/linux=
/drm_fourcc.h?ref_type=3Dheads

This incorrect dependency was fixed in=20

https://gitlab.freedesktop.org/camera/libcamera/-/commit/b9302237231471c043=
bb102dd8dc045fa05eb983

which is integrated in libcamera-0.7.2.

Perhaps rather than add an incorrect dependency, we could backport the
patch for the recipe or bump to libcamera-0.7.2?

Regards
--
Kieran

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> index 2b351a39be..68b2c6648c 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> @@ -17,7 +17,7 @@ SRCREV =3D "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
> =20
>  PE =3D "1"
> =20
> -DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
> +DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml libdr=
m"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
> =20
>  PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
> --=20
> 2.55.0
>=20
>

