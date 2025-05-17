Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A6C2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 05:52:45 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7094.1747461156431871277
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 22:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 681B375C;
	Sat, 17 May 2025 07:52:34 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.172.191]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGATJ-0TJ5BA0; Sat, 17 May 2025 07:52:34 +0200
Date: Sat, 17 May 2025 07:52:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] librest: update 0.8.1 -> 0.9.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <GN5EWS.RKKQFDABMYVG1@t-online.de>
In-Reply-To: <CAMKF1srLxh-ge+ud=7FKioaXhuABo_forxrU2fiDbu6vF2cZoA@mail.gmail.com>
References: <20250516162617.2910805-1-f_l_k@t-online.de>
	<CAMKF1srLxh-ge+ud=7FKioaXhuABo_forxrU2fiDbu6vF2cZoA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-a2Qb3m6p1+K5OWBvJ4ge"
X-TOI-EXPURGATEID: 150726::1747461154-6A7FA535-2EF4841A/0/0 CLEAN NORMAL
X-TOI-MSGID: 6066e9d1-8fa6-4af9-8052-dde7db7756c5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 May 2025 05:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117440

--=-a2Qb3m6p1+K5OWBvJ4ge
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I overlooked the fact that the librest-0.9.1 update is already=20
available as rest-0.9.1.
After my update, rest and librest are the same version. The update can=20
therefore be ignored

On Fri, May 16 2025 at 17:48:11 -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> I am seeing this error
>=20
> <https://errors.yoctoproject.org/Errors/Details/854795/>
>=20
> Rest-1.0.gir should perhaps come from librest and not from rest=20
> package ?
>=20
> On Fri, May 16, 2025 at 9:26=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  - switch to meson buildsystem
>>  - add missing dependencies
>>  - use libsoup-3
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../recipes-gnome/rest/librest_0.8.1.bb       | 33=20
>> -------------------
>>   .../recipes-gnome/rest/librest_0.9.1.bb       | 23 +++++++++++++
>>   2 files changed, 23 insertions(+), 33 deletions(-)
>>   delete mode 100644 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
>>   create mode 100644 meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
>>=20
>>  diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb=20
>> b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
>>  deleted file mode 100644
>>  index 63372afa5d..0000000000
>>  --- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
>>  +++ /dev/null
>>  @@ -1,33 +0,0 @@
>>  -SUMMARY =3D "library to access web services that claim to be=20
>> "RESTful""
>>  -HOMEPAGE =3D "<https://wiki.gnome.org/Projects/Librest>"
>>  -LICENSE =3D "LGPL-2.1-only"
>>  -LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"=20
>> <file://copying;md5=3D2d5025d4aa3495befef8f17206a5b0a1/>
>>  -
>>  -DEPENDS =3D " \
>>  -    glib-2.0 \
>>  -    glib-2.0-native \
>>  -    libsoup-2.4 \
>>  -    libxml2 \
>>  -"
>>  -
>>  -GNOMEBASEBUILDCLASS =3D "autotools"
>>  -inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
>>  -
>>  -GNOMEBN =3D "rest"
>>  -
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
>>  -
>>  -S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
>>  -# * gnome environment requires libsoup build with in gnome=20
>> PACKAGECONFIG
>>  -# * libsoup-gnome support was removed upstream three years ago [1]
>>  -# [1]=20
>> <https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2bb38a7bf72245cdf=
2f1ecad17e9a720>
>>  -EXTRA_OECONF =3D "--without-gnome"
>>  -
>>  -do_configure:prepend() {
>>  -    # rest expects introspection.m4 at custom location (see=20
>> aclocal.m4).
>>  -    cp -f=20
>> ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build
>>  -}
>>  -
>>  -do_compile:prepend() {
>>  -    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
>>  -}
>>  diff --git a/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb=20
>> b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
>>  new file mode 100644
>>  index 0000000000..f923c7c1cd
>>  --- /dev/null
>>  +++ b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
>>  @@ -0,0 +1,23 @@
>>  +SUMMARY =3D "library to access web services that claim to be=20
>> "RESTful""
>>  +HOMEPAGE =3D "<https://wiki.gnome.org/Projects/Librest>"
>>  +LICENSE =3D "LGPL-2.1-only"
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"=20
>> <file://copying;md5=3D2d5025d4aa3495befef8f17206a5b0a1/>
>>  +
>>  +DEPENDS =3D " \
>>  +    glib-2.0 \
>>  +    glib-2.0-native \
>>  +    gtksourceview5 \
>>  +    libadwaita \
>>  +    libsoup \
>>  +    libxml2 \
>>  +    json-glib \
>>  +"
>>  +
>>  +inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
>>  +
>>  +GNOMEBN =3D "rest"
>>  +
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "9266a5c10ece383e193dfb7ffb07b509cc1f51521ab8dad76af96ed14212c2e3"
>>  +
>>  +S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
>>  +
>>  --
>>  2.49.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#117435):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/117435>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/113148143/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-a2Qb3m6p1+K5OWBvJ4ge
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I overlooked the fact that the lib=
rest-0.9.1 update is already available as rest-0.9.1.</div><div>After my up=
date, rest and librest are the same version. The update can therefore be ig=
nored</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, May 16 20=
25 at 17:48:11 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><bl=
ockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break=
-spaces;">I am seeing this error

<a href=3D"https://errors.yoctoproject.org/Errors/Details/854795/">https://=
errors.yoctoproject.org/Errors/Details/854795/</a>

Rest-1.0.gir should perhaps come from librest and not from rest package ?

On Fri, May 16, 2025 at 9:26=E2=80=AFAM Markus Volk via lists.openembedded.=
org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 - switch to meson buildsystem
 - add missing dependencies
 - use libsoup-3

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../recipes-gnome/rest/librest_0.8.1.bb       | 33 -------------------
  .../recipes-gnome/rest/librest_0.9.1.bb       | 23 +++++++++++++
  2 files changed, 23 insertions(+), 33 deletions(-)
  delete mode 100644 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
  create mode 100644 meta-gnome/recipes-gnome/rest/librest_0.9.1.bb

 diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/r=
ecipes-gnome/rest/librest_0.8.1.bb
 deleted file mode 100644
 index 63372afa5d..0000000000
 --- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
 +++ /dev/null
 @@ -1,33 +0,0 @@
 -SUMMARY =3D "library to access web services that claim to be "RESTful""
 -HOMEPAGE =3D "<a href=3D"https://wiki.gnome.org/Projects/Librest">https:/=
/wiki.gnome.org/Projects/Librest</a>"
 -LICENSE =3D "LGPL-2.1-only"
 -LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D2d5025d4aa3495befef=
8f17206a5b0a1" "=3D"">file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
"</a>
 -
 -DEPENDS =3D " \
 -    glib-2.0 \
 -    glib-2.0-native \
 -    libsoup-2.4 \
 -    libxml2 \
 -"
 -
 -GNOMEBASEBUILDCLASS =3D "autotools"
 -inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
 -
 -GNOMEBN =3D "rest"
 -
 -SRC_URI[archive.sha256sum] =3D "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79=
775e53b2dba9456f15b01c9"
 -
 -S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
 -# * gnome environment requires libsoup build with in gnome PACKAGECONFIG
 -# * libsoup-gnome support was removed upstream three years ago [1]
 -# [1] <a href=3D"https://gitlab.gnome.org/GNOME/librest/commit/8f904a8e2b=
b38a7bf72245cdf2f1ecad17e9a720">https://gitlab.gnome.org/GNOME/librest/comm=
it/8f904a8e2bb38a7bf72245cdf2f1ecad17e9a720</a>
 -EXTRA_OECONF =3D "--without-gnome"
 -
 -do_configure:prepend() {
 -    # rest expects introspection.m4 at custom location (see aclocal.m4).
 -    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/=
build
 -}
 -
 -do_compile:prepend() {
 -    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
 -}
 diff --git a/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb b/meta-gnome/r=
ecipes-gnome/rest/librest_0.9.1.bb
 new file mode 100644
 index 0000000000..f923c7c1cd
 --- /dev/null
 +++ b/meta-gnome/recipes-gnome/rest/librest_0.9.1.bb
 @@ -0,0 +1,23 @@
 +SUMMARY =3D "library to access web services that claim to be "RESTful""
 +HOMEPAGE =3D "<a href=3D"https://wiki.gnome.org/Projects/Librest">https:/=
/wiki.gnome.org/Projects/Librest</a>"
 +LICENSE =3D "LGPL-2.1-only"
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D2d5025d4aa3495befef=
8f17206a5b0a1" "=3D"">file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1=
"</a>
 +
 +DEPENDS =3D " \
 +    glib-2.0 \
 +    glib-2.0-native \
 +    gtksourceview5 \
 +    libadwaita \
 +    libsoup \
 +    libxml2 \
 +    json-glib \
 +"
 +
 +inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
 +
 +GNOMEBN =3D "rest"
 +
 +SRC_URI[archive.sha256sum] =3D "9266a5c10ece383e193dfb7ffb07b509cc1f51521=
ab8dad76af96ed14212c2e3"
 +
 +S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
 +
 --
 2.49.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#117435): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/117435">https://lists.openembedded.org/g/openembe=
dded-devel/message/117435</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113148143/19=
97914">https://lists.openembedded.org/mt/113148143/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-a2Qb3m6p1+K5OWBvJ4ge--


