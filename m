Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF292CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 06:49:05 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.5344.1712299736317895082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 23:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 5B85E1A50F;
	Fri,  5 Apr 2024 08:48:54 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.45.220]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rsdNd-15JPGa0; Fri, 5 Apr 2024 08:48:53 +0200
Date: Fri, 05 Apr 2024 08:49:11 +0200
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <0YIGBS.J01SL0J2C2S41@t-online.de>
In-Reply-To: <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
References: <20240402054947.10487-1-f_l_k@t-online.de>
	<CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-yCX7+bVrvAgVTJ3zfAxG"
X-TOI-EXPURGATEID: 150726::1712299733-35FF8846-1DA8ADC5/0/0 CLEAN NORMAL
X-TOI-MSGID: 71b47acc-070f-41d2-9c61-256e0b3da30c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 06:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109813

--=-yCX7+bVrvAgVTJ3zfAxG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Does this also happen if you add '-mfpu=3Dneon' to CXXFLAGS ?

On Fri, Apr 5 2024 at 07:54:47 AM +02:00:00, Martin Jansa=20
<martin.jansa@gmail.com> wrote:
> I'm seeing build failure in 32bit arm builds (with multilib):
>=20
> lib32-libjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnu=
eabi/gcc/arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1:
> error: inlining failed in call to 'always_inline' 'float32x4_t
> vcvt_f32_f16(float16x4_t)': target specific option mismatch
>  7526 | vcvt_f32_f16 (float16x4_t __a)
>       | ^~~~~~~~~~~~
> In file included from
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/th=
ird_party/skcms/skcms.cc:2315:
> TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/th=
ird_party/skcms/src/Transform_inl.h:155:24:
> note: called from here
>   155 |     return vcvt_f32_f16((float16x4_t)half);
>       |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>=20
> should I try to reproduce on some publicly available arm MACHINE (like
> qemuarm) or is someone else seeing this as well?
>=20
> On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Import this recipe from meta-wayland, because it is a prerequisite
>>  for the Gnome desktop. The recently updated gnome-backgrounds=20
>> package
>>  has converted most of the backgrounds to jxl and to keep them usable
>>  the gdk-pixbuf-loader for jpegxl must be provided. This is included
>>  in the libjxl package itself.
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../libjxl/libjxl_2.10.0.bb                   | 42=20
>> +++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>   create mode 100644=20
>> meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
>>=20
>>  diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb=20
>> b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
>>  new file mode 100644
>>  index 000000000..0c4f79fdb
>>  --- /dev/null
>>  +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
>>  @@ -0,0 +1,42 @@
>>  +SUMMARY =3D "Reference implementation of JPEG XL (encoder and=20
>> decoder)"
>>  +HOMEPAGE =3D "<https://github.com/libjxl/libjxl/>"
>>  +
>>  +LICENSE =3D "BSD-3-Clause"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D6a905a337cc228a1f68f0b5416f52a7f"=20
>> <file://license;md5=3D6a905a337cc228a1f68f0b5416f52a7f/>
>>  +
>>  +inherit cmake pkgconfig mime
>>  +
>>  +DEPENDS =3D "highway brotli"
>>  +
>>  +SRC_URI =3D=20
>> "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;nobranch=3D1"
>>  +
>>  +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
>>  +S =3D "${WORKDIR}/git"
>>  +
>>  +EXTRA_OECMAKE =3D " \
>>  +       -DCMAKE_BUILD_TYPE=3DRelease \
>>  +       -DJPEGXL_ENABLE_PLUGINS=3DON \
>>  +       -DBUILD_TESTING=3DOFF \
>>  +       -DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
>>  +       -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
>>  +       -DJPEGXL_ENABLE_SJPEG=3DOFF \
>>  +       -DJPEGXL_ENABLE_BENCHMARK=3DOFF \
>>  +       -DJPEGXL_ENABLE_EXAMPLES=3DOFF \
>>  +       -DJPEGXL_ENABLE_MANPAGES=3DOFF \
>>  +       -DJPEGXL_ENABLE_SKCMS=3DON \
>>  +       -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
>>  +       -DJPEGXL_FORCE_SYSTEM_HWY=3DON \
>>  +       -DJPEGXL_ENABLE_JNI=3DOFF \
>>  +       -DJPEGXL_ENABLE_TCMALLOC=3DOFF \
>>  +       -DJPEGXL_ENABLE_TOOLS=3DOFF \
>>  +"
>>  +
>>  +PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
>>  +PACKAGECONFIG[gdk-pixbuf-loader] =3D=20
>> "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=
=3DOFF,gdk-pixbuf"
>>  +PACKAGECONFIG[gimp] =3D=20
>> "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DOF=
F,gimp"
>>  +PACKAGECONFIG[mime] =3D=20
>> "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENABLE_PLUGIN_MIME=3DOFF"
>>  +
>>  +FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
>>  +
>>  +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
>>  +
>>  --
>>  2.44.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#109774):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/109774>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/105282918/3617156>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-yCX7+bVrvAgVTJ3zfAxG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div style=3D"orphans: 2; widows: 2;">D=
oes this also happen if you add '-mfpu=3Dneon' to CXXFLAGS ?</div></div><di=
v id=3D"geary-quote" dir=3D"auto"><br>On Fri, Apr 5 2024 at 07:54:47 AM +02=
:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
I'm seeing build failure in 32bit arm builds (with multilib):

lib32-libjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnuea=
bi/gcc/arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1:
error: inlining failed in call to 'always_inline' 'float32x4_t
vcvt_f32_f16(float16x4_t)': target specific option mismatch
 7526 | vcvt_f32_f16 (float16x4_t __a)
      | ^~~~~~~~~~~~
In file included from
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/thir=
d_party/skcms/skcms.cc:2315:
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/thir=
d_party/skcms/src/Transform_inl.h:155:24:
note: called from here
  155 |     return vcvt_f32_f16((float16x4_t)half);
      |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~

should I try to reproduce on some publicly available arm MACHINE (like
qemuarm) or is someone else seeing this as well?

On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_=
l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Import this recipe from meta-wayland, because it is a prerequisite
 for the Gnome desktop. The recently updated gnome-backgrounds package
 has converted most of the backgrounds to jxl and to keep them usable
 the gdk-pixbuf-loader for jpegxl must be provided. This is included
 in the libjxl package itself.

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++++
  1 file changed, 42 insertions(+)
  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb

 diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe/=
recipes-multimedia/libjxl/libjxl_2.10.0.bb
 new file mode 100644
 index 000000000..0c4f79fdb
 --- /dev/null
 +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
 @@ -0,0 +1,42 @@
 +SUMMARY =3D "Reference implementation of JPEG XL (encoder and decoder)"
 +HOMEPAGE =3D "<a href=3D"https://github.com/libjxl/libjxl/">https://githu=
b.com/libjxl/libjxl/</a>"
 +
 +LICENSE =3D "BSD-3-Clause"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D6a905a337cc228a1f68=
f0b5416f52a7f" "=3D"">file://LICENSE;md5=3D6a905a337cc228a1f68f0b5416f52a7f=
"</a>
 +
 +inherit cmake pkgconfig mime
 +
 +DEPENDS =3D "highway brotli"
 +
 +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;nobran=
ch=3D1"
 +
 +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
 +S =3D "${WORKDIR}/git"
 +
 +EXTRA_OECMAKE =3D " \
 +       -DCMAKE_BUILD_TYPE=3DRelease \
 +       -DJPEGXL_ENABLE_PLUGINS=3DON \
 +       -DBUILD_TESTING=3DOFF \
 +       -DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
 +       -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
 +       -DJPEGXL_ENABLE_SJPEG=3DOFF \
 +       -DJPEGXL_ENABLE_BENCHMARK=3DOFF \
 +       -DJPEGXL_ENABLE_EXAMPLES=3DOFF \
 +       -DJPEGXL_ENABLE_MANPAGES=3DOFF \
 +       -DJPEGXL_ENABLE_SKCMS=3DON \
 +       -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
 +       -DJPEGXL_FORCE_SYSTEM_HWY=3DON \
 +       -DJPEGXL_ENABLE_JNI=3DOFF \
 +       -DJPEGXL_ENABLE_TCMALLOC=3DOFF \
 +       -DJPEGXL_ENABLE_TOOLS=3DOFF \
 +"
 +
 +PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
 +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3D=
ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
 +PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_ENA=
BLE_PLUGIN_GIMP210=3DOFF,gimp"
 +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENABLE=
_PLUGIN_MIME=3DOFF"
 +
 +FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
 +
 +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
 +
 --
 2.44.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#109774): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/109774">https://lists.openembedded.org/g/openembe=
dded-devel/message/109774</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105282918/36=
17156">https://lists.openembedded.org/mt/105282918/3617156</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-yCX7+bVrvAgVTJ3zfAxG--


