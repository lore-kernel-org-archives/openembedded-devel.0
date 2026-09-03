Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE83C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:25:09 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2850.1788423906619130707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=VdBIgBap;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout07.t-online.de (Postfix) with SMTP id 7EAF9E5F2;
	Thu,  3 Sep 2026 10:25:04 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.164.36]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22kp-0HUWtE0; Thu, 3 Sep 2026 10:25:03 +0200
Date: Thu, 03 Sep 2026 10:24:57 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 2/6] gjs: update
To: ankur.tyagi85@gmail.com
Cc: "Ankur Tyagi via lists.openembedded.org"
	<ankur.tyagi85=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <LP4SKT.9MQIGMDJKGZO@t-online.de>
In-Reply-To: <CADySD0ESmpePK6kdD=mhucv_=m=YikUkJTOewaT7b5j+7_OgRA@mail.gmail.com>
References: <20260903081916.156273-1-f_l_k@t-online.de>
	<20260903081916.156273-2-f_l_k@t-online.de>
	<CADySD0ESmpePK6kdD=mhucv_=m=YikUkJTOewaT7b5j+7_OgRA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-l03wt2Osx6mqxQUMLma5"
X-TOI-EXPURGATEID: 150726::1788423903-F7FFC91C-B0B65EB1/0/0 CLEAN NORMAL
X-TOI-MSGID: 99ff94e1-4a7b-4769-92ed-2d3e00a89288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423904; i=f_l_k@t-online.de;
	bh=2Og3bYzvoJpLoQoGubRZ8+UGd6BIsX72QUENTJCOBr0=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=VdBIgBapYejFiprvk1LXQXF+UMxr0gQUIF6cXkquT8oT5DnpypdjisWLsuk3lfzq4
	 +oBITDQMH3Wy1ayAbnu25PU1P9+WOlfS98hquYmajuaxEvHNY0KrC3Sr4Ntt6t9BIX
	 Y9hJWIDhz2fugtx71ZztFRYerx5pEq6RN2OtGx/TMHPo2d0dpiHv7wFC1RZpohAvfH
	 Sa4UIMJPDNaQk0jYPOEGrA4l4ZnZoKpzWC3AVj9J4qwXKgpFS6IkPiusqtfqbfkc9C
	 a/3UlVSkZNKnMTB/5pn+VXPDpeJJnnctWV0DdU229pof8/ZGtz8sqQ63yqZyHINFIA
	 GEE3f07MB5Oxg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129712

--=-l03wt2Osx6mqxQUMLma5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

yes, thanks

On Thu, Sep 3 2026 at 20:23:12 +12:00:00, Ankur Tyagi via=20
lists.openembedded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org>=20
wrote:
> will be good to include from and to version in the commit message
>=20
> On Thu, Sep 3, 2026 at 8:19=E2=80=AFPM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb | 45 ------------------
>>   meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb | 53=20
>> ++++++++++++++++++++++
>>   2 files changed, 53 insertions(+), 45 deletions(-)
>>   delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
>>   create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
>>=20
>>  diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb=20
>> b/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
>>  deleted file mode 100644
>>  index 1330342426..0000000000
>>  --- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
>>  +++ /dev/null
>>  @@ -1,45 +0,0 @@
>>  -SUMMARY =3D "Javascript bindings for GNOME"
>>  -LICENSE =3D "LGPL-2.0-or-later AND MIT"
>>  -LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51ec48"=20
>> <file://copying;md5=3D8dcea832f6acf45d856abfeb2d51ec48/>
>>  -
>>  -
>>  -DEPENDS =3D "mozjs-128 cairo"
>>  -
>>  -inherit gnomebase gobject-introspection gettext features_check=20
>> upstream-version-is-even pkgconfig multilib_script
>>  -
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "35142edf345705636300291ec3a7d583f14969ff3fae0ff30f4a95b1e6740166"
>>  -SRC_URI +=3D " \
>>  -    file://0001-Support-cross-builds-a-bit-better.patch=20
>> <file://0001-support-cross-builds-a-bit-better.patch/> \
>>  -   =20
>> file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch=20
>> <file://0002-meson.build-do-not-add-dir-installed-tests-when-inst.patch/=
>=20
>> \
>>  -"
>>  -
>>  -# gobject-introspection is mandatory and cannot be configured
>>  -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>  -GIR_MESON_OPTION =3D ""
>>  -
>>  -EXTRA_OEMESON =3D " \
>>  -    -Dinstalled_tests=3Dfalse \
>>  -    -Dskip_dbus_tests=3Dtrue \
>>  -    -Dskip_gtk_tests=3Dtrue \
>>  -"
>>  -
>>  -LDFLAGS:append:mipsarch =3D " -latomic"
>>  -LDFLAGS:append:powerpc =3D " -latomic"
>>  -LDFLAGS:append:powerpc64 =3D " -latomic"
>>  -LDFLAGS:append:riscv32 =3D " -latomic"
>>  -
>>  -FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
>>  -
>>  -PACKAGES =3D+ "${PN}-valgrind"
>>  -FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
>>  -RDEPENDS:${PN}-valgrind +=3D "valgrind"
>>  -
>>  -# Valgrind not yet available on rv32/rv64
>>  -RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
>>  -RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
>>  -
>>  -MULTILIB_SCRIPTS:append =3D=20
>> "${PN}:${libexecdir}/installed-tests/gjs/GIMarshallingTests-1.0.typelib=20
>> \
>>  -                   =20
>> ${PN}:${libexecdir}/installed-tests/gjs/Regress-1.0.typelib \
>>  -                   =20
>> ${PN}:${libexecdir}/installed-tests/gjs/Utility-1.0.typelib \
>>  -                   =20
>> ${PN}:${libexecdir}/installed-tests/gjs/WarnLib-1.0.typelib \
>>  -                    "
>>  diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb=20
>> b/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
>>  new file mode 100644
>>  index 0000000000..16c8636d84
>>  --- /dev/null
>>  +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
>>  @@ -0,0 +1,53 @@
>>  +SUMMARY =3D "Javascript bindings for GNOME"
>>  +HOMEPAGE =3D "<https://gitlab.gnome.org/GNOME/gjs>"
>>  +LICENSE =3D "LGPL-2.0-or-later AND MIT"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51ec48"=20
>> <file://copying;md5=3D8dcea832f6acf45d856abfeb2d51ec48/>
>>  +
>>  +DEPENDS =3D "mozjs-140 cairo glib-2.0 glib-2.0-native libffi"
>>  +
>>  +inherit meson pkgconfig gettext gobject-introspection=20
>> features_check
>>  +
>>  +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim=20
>> <mailto:${@oe.utils.trim>_version("${PV}",=20
>> 2)}/${BP}.tar.xz;name=3Darchive"
>>  +SRC_URI +=3D "file://0001-Support-cross-builds-a-bit-better.patch"=20
>> <file://0001-support-cross-builds-a-bit-better.patch/>
>>  +SRC_URI +=3D=20
>> "file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch"=
=20
>> <file://0002-meson.build-do-not-add-dir-installed-tests-when-inst.patch/=
>
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "767bab80e665d672cb00563c25f0b392a9ec8c2996ed1d4454c698b4c2f0a3d9"
>>  +
>>  +# gobject-introspection is mandatory and cannot be configured
>>  +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>  +GIR_MESON_OPTION =3D ""
>>  +
>>  +# readline and profiler are meson features with value 'auto' and=20
>> would otherwise
>>  +# be picked up from whatever happens to be in the sysroot.
>>  +PACKAGECONFIG ??=3D "readline"
>>  +PACKAGECONFIG[readline] =3D=20
>> "-Dreadline=3Denabled,-Dreadline=3Ddisabled,readline"
>>  +PACKAGECONFIG[profiler] =3D=20
>> "-Dprofiler=3Denabled,-Dprofiler=3Ddisabled,sysprof"
>>  +
>>  +EXTRA_OEMESON =3D " \
>>  +    -Dinstalled_tests=3Dfalse \
>>  +    -Dskip_dbus_tests=3Dtrue \
>>  +    -Dskip_gtk_tests=3Dtrue \
>>  +    -Ddtrace=3Dfalse \
>>  +    -Dsystemtap=3Dfalse \
>>  +    -Dverbose_logs=3Dfalse \
>>  +    -Dbsymbolic_functions=3Dtrue \
>>  +"
>>  +
>>  +LDFLAGS:append:mipsarch =3D " -latomic"
>>  +LDFLAGS:append:powerpc =3D " -latomic"
>>  +LDFLAGS:append:powerpc64 =3D " -latomic"
>>  +LDFLAGS:append:riscv32 =3D " -latomic"
>>  +
>>  +FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
>>  +
>>  +PACKAGES =3D+ "${PN}-valgrind"
>>  +FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
>>  +RDEPENDS:${PN}-valgrind +=3D "valgrind"
>>  +
>>  +# Valgrind not yet available on rv32/rv64
>>  +RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
>>  +RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
>>  +
>>  +# The GIMarshallingTests/Regress/Utility/WarnLib typelibs that the=20
>> 1.84 recipe
>>  +# listed in MULTILIB_SCRIPTS are no longer produced by the build=20
>> system.
>>  +
>>  +UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
>>  --
>>  2.55.0
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129711):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/129711>
> Mute This Topic: <https://lists.openembedded.org/mt/121065944/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-l03wt2Osx6mqxQUMLma5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>yes, thanks</div></div><div id=3D"=
geary-quote" dir=3D"auto"><br>On Thu, Sep 3 2026 at 20:23:12 +12:00:00, Ank=
ur Tyagi via lists.openembedded.org &lt;ankur.tyagi85=3Dgmail.com@lists.ope=
nembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plainte=
xt" style=3D"white-space: break-spaces;">will be good to include from and t=
o version in the commit message

On Thu, Sep 3, 2026 at 8:19=E2=80=AFPM Markus Volk via lists.openembedded.o=
rg
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb | 45 ------------------
  meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb | 53 ++++++++++++++++++++++
  2 files changed, 53 insertions(+), 45 deletions(-)
  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb

 diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb b/meta-gnome/recip=
es-gnome/gjs/gjs_1.84.2.bb
 deleted file mode 100644
 index 1330342426..0000000000
 --- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
 +++ /dev/null
 @@ -1,45 +0,0 @@
 -SUMMARY =3D "Javascript bindings for GNOME"
 -LICENSE =3D "LGPL-2.0-or-later AND MIT"
 -LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D8dcea832f6acf45d856=
abfeb2d51ec48" "=3D"">file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51ec48=
"</a>
 -
 -
 -DEPENDS =3D "mozjs-128 cairo"
 -
 -inherit gnomebase gobject-introspection gettext features_check upstream-v=
ersion-is-even pkgconfig multilib_script
 -
 -SRC_URI[archive.sha256sum] =3D "35142edf345705636300291ec3a7d583f14969ff3=
fae0ff30f4a95b1e6740166"
 -SRC_URI +=3D " \
 -    <a href=3D"file://0001-Support-cross-builds-a-bit-better.patch">file:=
//0001-Support-cross-builds-a-bit-better.patch</a> \
 -    <a href=3D"file://0002-meson.build-Do-not-add-dir-installed-tests-whe=
n-inst.patch">file://0002-meson.build-Do-not-add-dir-installed-tests-when-i=
nst.patch</a> \
 -"
 -
 -# gobject-introspection is mandatory and cannot be configured
 -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 -GIR_MESON_OPTION =3D ""
 -
 -EXTRA_OEMESON =3D " \
 -    -Dinstalled_tests=3Dfalse \
 -    -Dskip_dbus_tests=3Dtrue \
 -    -Dskip_gtk_tests=3Dtrue \
 -"
 -
 -LDFLAGS:append:mipsarch =3D " -latomic"
 -LDFLAGS:append:powerpc =3D " -latomic"
 -LDFLAGS:append:powerpc64 =3D " -latomic"
 -LDFLAGS:append:riscv32 =3D " -latomic"
 -
 -FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
 -
 -PACKAGES =3D+ "${PN}-valgrind"
 -FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
 -RDEPENDS:${PN}-valgrind +=3D "valgrind"
 -
 -# Valgrind not yet available on rv32/rv64
 -RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
 -RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
 -
 -MULTILIB_SCRIPTS:append =3D "${PN}:${libexecdir}/installed-tests/gjs/GIMa=
rshallingTests-1.0.typelib \
 -                    ${PN}:${libexecdir}/installed-tests/gjs/Regress-1.0.t=
ypelib \
 -                    ${PN}:${libexecdir}/installed-tests/gjs/Utility-1.0.t=
ypelib \
 -                    ${PN}:${libexecdir}/installed-tests/gjs/WarnLib-1.0.t=
ypelib \
 -                    "
 diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb b/meta-gnome/recip=
es-gnome/gjs/gjs_1.88.1.bb
 new file mode 100644
 index 0000000000..16c8636d84
 --- /dev/null
 +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
 @@ -0,0 +1,53 @@
 +SUMMARY =3D "Javascript bindings for GNOME"
 +HOMEPAGE =3D "<a href=3D"https://gitlab.gnome.org/GNOME/gjs">https://gitl=
ab.gnome.org/GNOME/gjs</a>"
 +LICENSE =3D "LGPL-2.0-or-later AND MIT"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D8dcea832f6acf45d856=
abfeb2d51ec48" "=3D"">file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51ec48=
"</a>
 +
 +DEPENDS =3D "mozjs-140 cairo glib-2.0 glib-2.0-native libffi"
 +
 +inherit meson pkgconfig gettext gobject-introspection features_check
 +
 +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/<a href=3D"mailto:${@oe.utils.trim">$=
{@oe.utils.trim</a>_version("${PV}", 2)}/${BP}.tar.xz;name=3Darchive"
 +SRC_URI +=3D "<a href=3D"file://0001-Support-cross-builds-a-bit-better.pa=
tch" "=3D"">file://0001-Support-cross-builds-a-bit-better.patch"</a>
 +SRC_URI +=3D "<a href=3D"file://0002-meson.build-Do-not-add-dir-installed=
-tests-when-inst.patch" "=3D"">file://0002-meson.build-Do-not-add-dir-insta=
lled-tests-when-inst.patch"</a>
 +SRC_URI[archive.sha256sum] =3D "767bab80e665d672cb00563c25f0b392a9ec8c299=
6ed1d4454c698b4c2f0a3d9"
 +
 +# gobject-introspection is mandatory and cannot be configured
 +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 +GIR_MESON_OPTION =3D ""
 +
 +# readline and profiler are meson features with value 'auto' and would ot=
herwise
 +# be picked up from whatever happens to be in the sysroot.
 +PACKAGECONFIG ??=3D "readline"
 +PACKAGECONFIG[readline] =3D "-Dreadline=3Denabled,-Dreadline=3Ddisabled,r=
eadline"
 +PACKAGECONFIG[profiler] =3D "-Dprofiler=3Denabled,-Dprofiler=3Ddisabled,s=
ysprof"
 +
 +EXTRA_OEMESON =3D " \
 +    -Dinstalled_tests=3Dfalse \
 +    -Dskip_dbus_tests=3Dtrue \
 +    -Dskip_gtk_tests=3Dtrue \
 +    -Ddtrace=3Dfalse \
 +    -Dsystemtap=3Dfalse \
 +    -Dverbose_logs=3Dfalse \
 +    -Dbsymbolic_functions=3Dtrue \
 +"
 +
 +LDFLAGS:append:mipsarch =3D " -latomic"
 +LDFLAGS:append:powerpc =3D " -latomic"
 +LDFLAGS:append:powerpc64 =3D " -latomic"
 +LDFLAGS:append:riscv32 =3D " -latomic"
 +
 +FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
 +
 +PACKAGES =3D+ "${PN}-valgrind"
 +FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
 +RDEPENDS:${PN}-valgrind +=3D "valgrind"
 +
 +# Valgrind not yet available on rv32/rv64
 +RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
 +RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
 +
 +# The GIMarshallingTests/Regress/Utility/WarnLib typelibs that the 1.84 r=
ecipe
 +# listed in MULTILIB_SCRIPTS are no longer produced by the build system.
 +
 +UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P&lt;pver&gt;\d+\.\d*[02468]\.\d+)$"
 --
 2.55.0


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#129711): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129711">https://lists.openembedded.org/g/openembed=
ded-devel/message/129711</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121065944/361=
8223">https://lists.openembedded.org/mt/121065944/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-l03wt2Osx6mqxQUMLma5--


