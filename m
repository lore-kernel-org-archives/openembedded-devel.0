Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61152D3C525
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 16:46:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.2766.1729183569125640796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 09:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5rFLw3K;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e8607c2aso1470773e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729183567; x=1729788367; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVhUf/7sfAoVIoBOp3qGkoSntrRHDJAIaGlcONxU48E=;
        b=M5rFLw3KvvY9clTgJ1lNaArB6ShlxPW2AC7O+UwokaM4U/27xwk3Jlc39NH/dv+g8D
         KGpdXGuGal1Ux+Ql0KCNZJuE8jnMOxRSDLqD6oU7UbC8ANt98DQqQfSDr7groeoOXQDB
         KX66t85YTPUt2JNG19baZfIAyLpxR0HSuS4ftAv0ECWmgNAw+acpqaFBd0QiLrIsqE98
         PMFMJqXrb+89PkUx0JZMPrmIvTUs87LsaeJBtIATEzZwE18aAQgM6vFjccZkaGJ/KEmC
         to3Ms1GAmaelWDQvQEIzyWE91/b13bKfnm7CUBCJcLYcin0zd4tew988E9t3/oDgPo7Y
         fz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183567; x=1729788367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVhUf/7sfAoVIoBOp3qGkoSntrRHDJAIaGlcONxU48E=;
        b=ZoZw3dTDfQ51OJ9ASKQLtqNZgU5tNnu7s8xPUKhR8mXPnXJcLKNTDUAH8Rg2wLMTJZ
         eiig/xBv8ZgwaxYNgoY5Z/GrcSgKbgwtlHwB+SbQccHO0QL1t5V8huQZxjaW0xU0tSmH
         kUPj5tcQmJmqDRSSE4FpYfS+mOk3mEtyv3R3RRmzXu6bH7g4fUbUTTX7SoW3hVY97lhi
         5XetTarWz+VlRX0Q39LpjMuqVlQZcbU7aH0oNjfYqGxbpTRdaCvpG4Gtr15J7W9LeCmf
         KJ4yVYYx1TXJhlliEvkBDjaxtLnIZRrd0WWSX8NTy5U9liR79RSAWL1qY1iWUhIVF9wA
         jaLg==
X-Gm-Message-State: AOJu0YxJTutUSpvJWrcsBbVU/SYNyCgoAHPmY7HDSRJjmRobA8vX/v2D
	YGA3TaQR714aTtuNukp3tYzBK9S434pK3r8Tw2/GJ4lheyHrGBdg29aVIEhENOy5qy85zNCA5Yo
	3giIBm6QXtXKiIJHVg7F0BoSmqXY=
X-Google-Smtp-Source: AGHT+IEj4jP4cu6mOwpGfemd8kB4TG2oYGGn4sYs1j3uNaGaF8imGx/EBWy6yY6u3L7BFdrnVsCAbTTbR4HzATcPkIo=
X-Received: by 2002:a05:6512:3d23:b0:539:fde9:4bbe with SMTP id
 2adb3069b0e04-53a03f19291mr6013745e87.20.1729183566698; Thu, 17 Oct 2024
 09:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241015003627.1014058-1-f_l_k@t-online.de> <17FE791DE787812C.27606@lists.openembedded.org>
 <MGGDLS.DG417TWA6BZ1@t-online.de>
In-Reply-To: <MGGDLS.DG417TWA6BZ1@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Oct 2024 18:45:54 +0200
Message-ID: <CA+chaQdtyXayfRYFQrj8vV8RvM2iJLuAJ=aNY+_7LQwqgDmOPg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2 2/2] libplacebo: dont use gitsm
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 16:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112967

In world builds I'm now seeing libplacebo failing in do_configure with:

../git/src/opengl/include/glad/meson.build:11:2: ERROR: Problem
encountered: glad (required: >=3D 2.0, found: none) was not found in
PYTHONPATH or `3rdparty`. Please run `git submodule update --init`
followed by `meson --wipe`.

not sure why but I haven't seen this before this commit (and it seems
a bit random e.g. qemux86 world build failed, but rpi4 didn't but on
different DISTRO rpi4 build failed the same).

On Tue, Oct 15, 2024 at 2:36=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> I have successfully built this for Clang
>
> On Tue, Oct 15 2024 at 02:36:27 AM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES - Add pa=
th to vulkan-registry - Add fastfloat dependency for clang - Build with lcm=
s by default, because mpv warns about missing littlecms2 support Signed-off=
-by: Markus Volk <f_l_k@t-online.de> --- .../mplayer/libplacebo_7.349.0.bb =
| 28 +++++++++---------- 1 file changed, 14 insertions(+), 14 deletions(-) =
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/met=
a-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb index b68e67a8c..f0f1=
8f2e4 100644 --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb=
 +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb @@ -1,22 +1=
,22 @@ SUMMARY =3D"Reusable library for GPU-accelerated video/image renderi=
ng primitives" -LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT" -LI=
C_FILES_CHKSUM =3D "file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3D3b83ef=
96387f14655fc854ddc3c6bd57 \ - file://3rdparty/fast_float/LICENSE-APACHE;md=
5=3D81db248e90379bcfc0582b578b009bc3 \ - file://3rdparty/fast_float/LICENSE=
-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2 \ - file://3rdparty/fast_floa=
t/LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f3e68eb \ - file://3rdparty/gl=
ad/LICENSE;md5=3Dae570f26774ac096cff8f992091a223c \ - file://3rdparty/jinja=
/LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462 \ - file://3rdparty/jin=
ja/docs/license.rst;md5=3D5f4c795946979fabc2361be4c70d0a9f \ - file://3rdpa=
rty/markupsafe/LICENSE.rst;md5=3Dffeffa59c90c9c4a033c7574f8f3fb75 \ - file:=
//3rdparty/markupsafe/docs/license.rst;md5=3D5f4c795946979fabc2361be4c70d0a=
9f \ - file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da \ - file://dem=
os/3rdparty/nuklear/src/LICENSE;md5=3D6052431ae6cd4f0082276c54996e7770 \ - =
file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b53b00626032" +LICENSE =3D "=
LGPL-2.1-only" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585=
d93824e7da3d85da" -SRC_URI =3D "gitsm://github.com/haasn/libplacebo;protoco=
l=3Dhttps;branch=3Dmaster" +DEPENDS +=3D "fastfloat" +SRC_URI =3D "git://co=
de.videolan.org/videolan/libplacebo.git;protocol=3Dhttps;branch=3Dv7.349" S=
RCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5" inherit meson pkgconfi=
g S =3D "${WORKDIR}/git" + +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO=
_FEATURES', 'vulkan opengl', d)} lcms" + +PACKAGECONFIG[vulkan] =3D "-Dvulk=
an=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader vulkan-headers shaderc spirv=
-shader-generator python3-mako-native python3-jinja2-native glad-native" +P=
ACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,glslang=
" +PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad" +PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms" +PA=
CKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 libsd=
l2-image" + +EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulk=
an/registry/vk.xml"
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112915): https://lists.openembedded.org/g/openembedde=
d-devel/message/112915
> Mute This Topic: https://lists.openembedded.org/mt/109014305/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

