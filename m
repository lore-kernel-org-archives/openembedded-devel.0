Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DCECFC505
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 01:22:17 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.3023.1728955327351951453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 18:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGxMBbK0;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e3e5c4a01cso3148593b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 18:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728955326; x=1729560126; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy3/3GhOLRdRcN91ImIr3ikWte+EctMPjPgV2i9fujA=;
        b=YGxMBbK02sgTyNAcVSxBZcH9eh5YhLZXLTjqlkHTB3r+hpTjvzfosQg4zsntCmSzRW
         +MZmoVsEGuhB23I9LtQBc03bzSjJneg1izw60gn8t72KX7vYOTmFgcjHZaEO3V8AaXVq
         V1zocNO1Dr/BRn9M+vQ15K3VZh+s75SEJboY/bPMXOH5Noq1LvYBaaHRAaIBdLDqC4gr
         FoZxqzEIA+u1+PZp92XZunDxi4zJlAl4/wbZEheLCQ5rJbn5Z0xxwWVwn3xflIYto1AP
         fmqSy6oHzrrBeAXgyS0GdkUAhhIO4eyjrAcUvGFu0ZLDWlchGy3OwgKqSJKEiV/cTvgi
         25dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728955326; x=1729560126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wy3/3GhOLRdRcN91ImIr3ikWte+EctMPjPgV2i9fujA=;
        b=PeqBs+ZYiO4B6ANsEM5E32WaT7BO6Cw9VT9upWpfcObcRlMuc8az4uaZ/PFtDQ6XaP
         WqDJTjrV+2EfZ/2kw/NOseKb9zlO2UkDCO10kyTd8zcu97tiBq7HsgByTvl77LFsdduL
         qKkaSa2M1x7tlqLDMNoMfGNM4jRja3GfIl+bvG3chPr9uNam18WnSVdH9i6Y2A5ru0ip
         juChcR67Lf10pM/9gggk1kA4CMcLt4D4g7QBJghum1lmm1/EF0C9pj/T7zhHe6cbaSH8
         LZZIzl4F16J2mExNkgDYqe5nDxe9VmLz6Hd19oRUjEzku9hCpWF/V5MwKai8JwOKlj6k
         SrXg==
X-Gm-Message-State: AOJu0YwLj4ogyKT8l/fOD1Ms2oKOn9XVOeoxQJk7JI+G9zB27iZQjA2H
	aO1fCCesQEVLScEmr7eQ+O1M/NXZvurbuRQAOZOiqIVVLKwoSSX+3bVarl1ErkK0nH0BnTWsyYz
	Mr+Ms1l3mtFmi+yucoh7D5XMJqYw=
X-Google-Smtp-Source: AGHT+IEtPpA5GsccarKbpILPjnBBh5UIjeLv5M4nvAmCyDnbxYGgT4XiHLZxPtISRThZeh6LBIh77GcRgOd15xck4gw=
X-Received: by 2002:a05:6808:f01:b0:3e0:4414:5f41 with SMTP id
 5614622812f47-3e5c91201c5mr8101584b6e.29.1728955326541; Mon, 14 Oct 2024
 18:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241013203459.47304-1-f_l_k@t-online.de> <20241013203459.47304-2-f_l_k@t-online.de>
 <CAMKF1sq6tB33wMYaagLTeV+7Nv+g15X4L8VmZR3waq8VK8qaLw@mail.gmail.com> <HRDDLS.QXBUBYWUISYY@t-online.de>
In-Reply-To: <HRDDLS.QXBUBYWUISYY@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Oct 2024 18:21:40 -0700
Message-ID: <CAMKF1srZmxJQY9usYExUy6A2QG6DMGzej4fBTfLDYqnwCkYDpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libplacebo: dont use gitsm
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 01:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112916

On Mon, Oct 14, 2024 at 4:38=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> The reason why I'd like to change this is that if libplacebo is built wit=
h gitsm, mpv fails with gpu-api=3Dvulkan
>
> fastfloat is a header only library but it has support for cmake, so it wo=
uld presumably be easy to add a recipe for it.
> If you dont mind i'd like to check out, if that would work with clang

That would be ok I guess, there are more gnome packages like vte which
could benefit from it eventually.

>
> On Sun, Oct 13 2024 at 10:57:07 PM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> I think we can not shun using submods for fetching the needed modules. It=
 ends up with build time errors since it can not find fastfloat now, and er=
rors out with clang https://errors.yoctoproject.org/Errors/Details/809534/ =
On Sun, Oct 13, 2024 at 1:41=E2=80=AFPM Markus Volk via lists.openembedded.=
org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES - Add pa=
th to vulkan-registry Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ..=
./mplayer/libplacebo_7.349.0.bb | 25 +++++++++---------- 1 file changed, 12=
 insertions(+), 13 deletions(-) diff --git a/meta-oe/recipes-multimedia/mpl=
ayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_=
7.349.0.bb index b68e67a8c..26e946370 100644 --- a/meta-oe/recipes-multimed=
ia/mplayer/libplacebo_7.349.0.bb +++ b/meta-oe/recipes-multimedia/mplayer/l=
ibplacebo_7.349.0.bb @@ -1,22 +1,21 @@ SUMMARY =3D"Reusable library for GPU=
-accelerated video/image rendering primitives" LICENSE =3D "Apache-2.0 & BS=
D-3-Clause & BSL-1.0 & MIT" -LIC_FILES_CHKSUM =3D "file://3rdparty/Vulkan-H=
eaders/LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \ - file://3rdpar=
ty/fast_float/LICENSE-APACHE;md5=3D81db248e90379bcfc0582b578b009bc3 \ - fil=
e://3rdparty/fast_float/LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d=
2 \ - file://3rdparty/fast_float/LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a8=
3f3e68eb \ - file://3rdparty/glad/LICENSE;md5=3Dae570f26774ac096cff8f992091=
a223c \ - file://3rdparty/jinja/LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a=
5229462 \ - file://3rdparty/jinja/docs/license.rst;md5=3D5f4c795946979fabc2=
361be4c70d0a9f \ - file://3rdparty/markupsafe/LICENSE.rst;md5=3Dffeffa59c90=
c9c4a033c7574f8f3fb75 \ - file://3rdparty/markupsafe/docs/license.rst;md5=
=3D5f4c795946979fabc2361be4c70d0a9f \ - file://LICENSE;md5=3D435ed639f84d45=
85d93824e7da3d85da \ - file://demos/3rdparty/nuklear/src/LICENSE;md5=3D6052=
431ae6cd4f0082276c54996e7770 \ - file://demos/LICENSE;md5=3D65d3616852dbf7b=
1a6d4b53b00626032" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d=
4585d93824e7da3d85da" -SRC_URI =3D "gitsm://github.com/haasn/libplacebo;pro=
tocol=3Dhttps;branch=3Dmaster" +SRC_URI =3D "git://code.videolan.org/videol=
an/libplacebo.git;protocol=3Dhttps;branch=3Dv7.349" SRCREV =3D "1fd3c7bde7b=
943fe8985c893310b5269a09b46c5" inherit meson pkgconfig S =3D "${WORKDIR}/gi=
t" + +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan op=
engl', d)}" + +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddis=
abled,vulkan-loader vulkan-headers shaderc spirv-shader-generator python3-m=
ako-native python3-jinja2-native glad-native" +PACKAGECONFIG[glslang] =3D "=
-Dglslang=3Denabled,-Dglslang=3Ddisabled,glslang" +PACKAGECONFIG[opengl] =
=3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,glad" +PACKAGECONFIG[lcms]=
 =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms" +PACKAGECONFIG[demos] =3D "-=
Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 libsdl2-image" + +EXTRA_OEMESO=
N =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registry/vk.xml" -- 2.=
47.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#112846): https://lists.openemb=
edded.org/g/openembedded-devel/message/112846 Mute This Topic: https://list=
s.openembedded.org/mt/108989872/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

