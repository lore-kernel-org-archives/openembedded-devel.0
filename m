Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF2D18159
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 23:38:36 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.922.1728949112840884050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 16:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 0117E299FC;
	Tue, 15 Oct 2024 01:38:31 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.230.111]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t0Udt-1aV5BQ0; Tue, 15 Oct 2024 01:38:25 +0200
Date: Tue, 15 Oct 2024 01:40:29 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libplacebo: dont use gitsm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <HRDDLS.QXBUBYWUISYY@t-online.de>
In-Reply-To: <CAMKF1sq6tB33wMYaagLTeV+7Nv+g15X4L8VmZR3waq8VK8qaLw@mail.gmail.com>
References: <20241013203459.47304-1-f_l_k@t-online.de>
	<20241013203459.47304-2-f_l_k@t-online.de>
	<CAMKF1sq6tB33wMYaagLTeV+7Nv+g15X4L8VmZR3waq8VK8qaLw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-j8krzTXoXFsDD4WwmL5d"
X-TOI-EXPURGATEID: 150726::1728949105-A5FF94D7-32204A15/0/0 CLEAN NORMAL
X-TOI-MSGID: f3bbcb0a-3986-4835-beb2-f0d20cd6b472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 23:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112912

--=-j8krzTXoXFsDD4WwmL5d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

The reason why I'd like to change this is that if libplacebo is built=20
with gitsm, mpv fails with gpu-api=3Dvulkan

fastfloat is a header only library but it has support for cmake, so it=20
would presumably be easy to add a recipe for it.
If you dont mind i'd like to check out, if that would work with clang

On Sun, Oct 13 2024 at 10:57:07 PM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> I think we can not shun using submods for fetching the needed modules.
> It ends up with build time errors since it can not find fastfloat now,
> and errors out with clang
>=20
> <https://errors.yoctoproject.org/Errors/Details/809534/>
>=20
> On Sun, Oct 13, 2024 at 1:41=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
>>  - Add path to vulkan-registry
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../mplayer/libplacebo_7.349.0.bb             | 25=20
>> +++++++++----------
>>   1 file changed, 12 insertions(+), 13 deletions(-)
>>=20
>>  diff --git=20
>> a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb=20
>> b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
>>  index b68e67a8c..26e946370 100644
>>  --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
>>  +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
>>  @@ -1,22 +1,21 @@
>>   SUMMARY =3D"Reusable library for GPU-accelerated video/image=20
>> rendering primitives"
>>   LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT"
>>  -LIC_FILES_CHKSUM =3D=20
>> "<file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57>=20
>> \
>>  -                   =20
>> <file://3rdparty/fast_float/LICENSE-APACHE;md5=3D81db248e90379bcfc0582b5=
78b009bc3>=20
>> \
>>  -                   =20
>> <file://3rdparty/fast_float/LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2=
608fd7d2>=20
>> \
>>  -                   =20
>> <file://3rdparty/fast_float/LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f=
3e68eb>=20
>> \
>>  -                   =20
>> <file://3rdparty/glad/LICENSE;md5=3Dae570f26774ac096cff8f992091a223c> \
>>  -                   =20
>> <file://3rdparty/jinja/LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a522946=
2>=20
>> \
>>  -                   =20
>> <file://3rdparty/jinja/docs/license.rst;md5=3D5f4c795946979fabc2361be4c7=
0d0a9f>=20
>> \
>>  -                   =20
>> <file://3rdparty/markupsafe/LICENSE.rst;md5=3Dffeffa59c90c9c4a033c7574f8=
f3fb75>=20
>> \
>>  -                   =20
>> <file://3rdparty/markupsafe/docs/license.rst;md5=3D5f4c795946979fabc2361=
be4c70d0a9f>=20
>> \
>>  -                   =20
>> file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da=20
>> <file://license;md5=3D435ed639f84d4585d93824e7da3d85da/> \
>>  -                   =20
>> <file://demos/3rdparty/nuklear/src/LICENSE;md5=3D6052431ae6cd4f0082276c5=
4996e7770>=20
>> \
>>  -                   =20
>> file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b53b00626032"=20
>> <file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b53b00626032>
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da"=20
>> <file://license;md5=3D435ed639f84d4585d93824e7da3d85da/>
>>=20
>>  -SRC_URI =3D=20
>> "gitsm://github.com/haasn/libplacebo;protocol=3Dhttps;branch=3Dmaster"
>>  +SRC_URI =3D=20
>> "git://code.videolan.org/videolan/libplacebo.git;protocol=3Dhttps;branch=
=3Dv7.349"
>>=20
>>   SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
>>=20
>>   inherit meson pkgconfig
>>=20
>>   S =3D "${WORKDIR}/git"
>>  +
>>  +PACKAGECONFIG ??=3D "${@bb.utils.filter=20
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'vulkan opengl', d)}"
>>  +
>>  +PACKAGECONFIG[vulkan] =3D =20
>> "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader vulkan-headers=20
>> shaderc spirv-shader-generator python3-mako-native=20
>> python3-jinja2-native glad-native"
>>  +PACKAGECONFIG[glslang] =3D=20
>> "-Dglslang=3Denabled,-Dglslang=3Ddisabled,glslang"
>>  +PACKAGECONFIG[opengl] =3D=20
>> "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,glad"
>>  +PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
>>  +PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl=
2=20
>> libsdl2-image"
>>  +
>>  +EXTRA_OEMESON =3D=20
>> "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registry/vk.xml"
>>  --
>>  2.47.0
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112846):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/112846>
> Mute This Topic: <https://lists.openembedded.org/mt/108989872/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-j8krzTXoXFsDD4WwmL5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>The reason why I'd like to change =
this is that if libplacebo is built with gitsm, mpv fails with gpu-api=3Dvu=
lkan</div><div><br></div><div>fastfloat is a header only library but it has=
 support for cmake, so it would presumably be easy to add a recipe for it.<=
/div><div>If you dont mind i'd like to check out, if that would work with c=
lang</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sun, Oct 13 202=
4 at 10:57:07 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><=
blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: bre=
ak-spaces;">I think we can not shun using submods for fetching the needed m=
odules.
It ends up with build time errors since it can not find fastfloat now,
and errors out with clang

<a href=3D"https://errors.yoctoproject.org/Errors/Details/809534/">https://=
errors.yoctoproject.org/Errors/Details/809534/</a>

On Sun, Oct 13, 2024 at 1:41=E2=80=AFPM Markus Volk via lists.openembedded.=
org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
 - Add path to vulkan-registry

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../mplayer/libplacebo_7.349.0.bb             | 25 +++++++++----------
  1 file changed, 12 insertions(+), 13 deletions(-)

 diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/me=
ta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
 index b68e67a8c..26e946370 100644
 --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
 +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
 @@ -1,22 +1,21 @@
  SUMMARY =3D"Reusable library for GPU-accelerated video/image rendering pr=
imitives"
  LICENSE =3D "Apache-2.0 &amp; BSD-3-Clause &amp; BSL-1.0 &amp; MIT"
 -LIC_FILES_CHKSUM =3D "<a href=3D"file://3rdparty/Vulkan-Headers/LICENSE.t=
xt;md5=3D3b83ef96387f14655fc854ddc3c6bd57">file://3rdparty/Vulkan-Headers/L=
ICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57</a> \
 -                    <a href=3D"file://3rdparty/fast_float/LICENSE-APACHE;=
md5=3D81db248e90379bcfc0582b578b009bc3">file://3rdparty/fast_float/LICENSE-=
APACHE;md5=3D81db248e90379bcfc0582b578b009bc3</a> \
 -                    <a href=3D"file://3rdparty/fast_float/LICENSE-BOOST;m=
d5=3D2c7a3fa82e66676005cd4ee2608fd7d2">file://3rdparty/fast_float/LICENSE-B=
OOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2</a> \
 -                    <a href=3D"file://3rdparty/fast_float/LICENSE-MIT;md5=
=3D32b11d50c7d9788d4270f6a83f3e68eb">file://3rdparty/fast_float/LICENSE-MIT=
;md5=3D32b11d50c7d9788d4270f6a83f3e68eb</a> \
 -                    <a href=3D"file://3rdparty/glad/LICENSE;md5=3Dae570f2=
6774ac096cff8f992091a223c">file://3rdparty/glad/LICENSE;md5=3Dae570f26774ac=
096cff8f992091a223c</a> \
 -                    <a href=3D"file://3rdparty/jinja/LICENSE.rst;md5=3D5d=
c88300786f1c214c1e9827a5229462">file://3rdparty/jinja/LICENSE.rst;md5=3D5dc=
88300786f1c214c1e9827a5229462</a> \
 -                    <a href=3D"file://3rdparty/jinja/docs/license.rst;md5=
=3D5f4c795946979fabc2361be4c70d0a9f">file://3rdparty/jinja/docs/license.rst=
;md5=3D5f4c795946979fabc2361be4c70d0a9f</a> \
 -                    <a href=3D"file://3rdparty/markupsafe/LICENSE.rst;md5=
=3Dffeffa59c90c9c4a033c7574f8f3fb75">file://3rdparty/markupsafe/LICENSE.rst=
;md5=3Dffeffa59c90c9c4a033c7574f8f3fb75</a> \
 -                    <a href=3D"file://3rdparty/markupsafe/docs/license.rs=
t;md5=3D5f4c795946979fabc2361be4c70d0a9f">file://3rdparty/markupsafe/docs/l=
icense.rst;md5=3D5f4c795946979fabc2361be4c70d0a9f</a> \
 -                    <a href=3D"file://LICENSE;md5=3D435ed639f84d4585d9382=
4e7da3d85da">file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da</a> \
 -                    <a href=3D"file://demos/3rdparty/nuklear/src/LICENSE;=
md5=3D6052431ae6cd4f0082276c54996e7770">file://demos/3rdparty/nuklear/src/L=
ICENSE;md5=3D6052431ae6cd4f0082276c54996e7770</a> \
 -                    <a href=3D"file://demos/LICENSE;md5=3D65d3616852dbf7b=
1a6d4b53b00626032" "=3D"">file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b5=
3b00626032"</a>
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D435ed639f84d4585d93=
824e7da3d85da" "=3D"">file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85da=
"</a>

 -SRC_URI =3D "gitsm://github.com/haasn/libplacebo;protocol=3Dhttps;branch=
=3Dmaster"
 +SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3Dh=
ttps;branch=3Dv7.349"

  SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"

  inherit meson pkgconfig

  S =3D "${WORKDIR}/git"
 +
 +PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fi=
lter</a>('DISTRO_FEATURES', 'vulkan opengl', d)}"
 +
 +PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native p=
ython3-jinja2-native glad-native"
 +PACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,glsl=
ang"
 +PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,gl=
ad"
 +PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
 +PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 l=
ibsdl2-image"
 +
 +EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registry=
/vk.xml"
 --
 2.47.0


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#112846): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112846">https://lists.openembedded.org/g/openembed=
ded-devel/message/112846</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108989872/361=
8223">https://lists.openembedded.org/mt/108989872/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-j8krzTXoXFsDD4WwmL5d--


