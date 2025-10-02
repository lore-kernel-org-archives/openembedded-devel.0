Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589F7CAC5BB
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:14:49 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.1067.1759364083744148255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 08D613C314
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Oct 2025 02:14:42 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.168.197]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1v46xu-3BzlK40; Thu, 2 Oct 2025 02:14:34 +0200
Date: Thu, 02 Oct 2025 02:14:29 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv3] rygel: update 44.1 -> 45.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <50AH3T.PFJ84EQIX4C42@t-online.de>
In-Reply-To: <186A843A2D6981E9.5914@lists.openembedded.org>
References: <186A843A2D6981E9.5914@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U855XjR14EM2yrQNmQdz"
X-TOI-EXPURGATEID: 150726::1759364074-FDFF8A62-D086E1F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dc07430-510d-4c13-9737-14beb70f8f07
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 00:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120151

--=-U855XjR14EM2yrQNmQdz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Be more consistent and also remove x11 from REQUIRED_DISTRO_FEATURES.

On Do, Okt 2 2025 at 02:12:27 +02:00:00, Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> - adjust PACKAGECONFIG for gtk and localsearch
>=20
> 45 (stable)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Translation updates
>=20
> All contributors to this release:
>  - Alan Mortensen <alanmortensen.am@gmail.com=20
> <mailto:alanmortensen.am@gmail.com>>
>  - Anders Jonsson <anders.jonsson@norsjovallen.se=20
> <mailto:anders.jonsson@norsjovallen.se>>
>  - Antonio Marin <gnmer.6qxyg@slmail.me=20
> <mailto:gnmer.6qxyg@slmail.me>>
>  - Asier Saratsua Garmendia <asiersarasua@ni.eus=20
> <mailto:asiersarasua@ni.eus>>
>  - Aurimas Aurimas =C4=8Cernius <aurisc4@gmail.com=20
> <mailto:aurisc4@gmail.com>>
>  - Bal=C3=A1zs =C3=9Ar <balazs@urbalazs.hu <mailto:balazs@urbalazs.hu>>
>  - Changwoo Ryu <cwryu@debian.org <mailto:cwryu@debian.org>>
>  - Daniel Mustieles <daniel.mustieles@gmail.com=20
> <mailto:daniel.mustieles@gmail.com>>
>  - Daniel Rusek <mail@asciiwolf.com <mailto:mail@asciiwolf.com>>
>  - Ekaterine Papava <papava.e@gtu.ge <mailto:papava.e@gtu.ge>>
>  - Hugo Carvalho <hugokarvalho@hotmail.com=20
> <mailto:hugokarvalho@hotmail.com>>
>  - Jordi Mas i Hernandez <jmas@softcatala.org=20
> <mailto:jmas@softcatala.org>>
>  - Juliano de Souza Camargo <julianosc@protonmail.com=20
> <mailto:julianosc@protonmail.com>>
>  - Nathan Follens <nfollens@gnome.org <mailto:nfollens@gnome.org>>
>  - Quentin PAG=C3=88S <pages_quentin@hotmail.com=20
> <mailto:pages_quentin@hotmail.com>>
>  - Yuri Chornoivan <yurchor@ukr.net <mailto:yurchor@ukr.net>>
>=20
> Added/updated translations:
>  - po/ca.po, courtesy of Jordi Mas i Hernandez
>  - po/cs.po, courtesy of Daniel Rusek
>  - po/da.po, courtesy of Alan Mortensen
>  - po/es.po, courtesy of Daniel Mustieles
>  - po/eu.po, courtesy of Asier Saratsua Garmendia
>  - po/hu.po, courtesy of Bal=C3=A1zs =C3=9Ar
>  - po/ka.po, courtesy of Ekaterine Papava
>  - po/ko.po, courtesy of Changwoo Ryu
>  - po/lt.po, courtesy of Aurimas Aurimas =C4=8Cernius
>  - po/nl.po, courtesy of Nathan Follens
>  - po/oc.po, courtesy of Quentin PAG=C3=88S
>  - po/pt_BR.po, courtesy of Juliano de Souza Camargo
>  - po/pt.po, courtesy of Hugo Carvalho
>  - po/ro.po, courtesy of Antonio Marin
>  - po/sv.po, courtesy of Anders Jonsson
>  - po/uk.po, courtesy of Yuri Chornoivan
>=20
> 45.rc (unstable)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> LocalSearch:
>  - Fix file upload
>=20
> All contributors to this release:
>  - Danial Behzadi <dani.behzi@ubuntu.com=20
> <mailto:dani.behzi@ubuntu.com>>
>  - Jens Georg <mail@jensge.org <mailto:mail@jensge.org>>
>  - Yaron Shahrabani <sh.yaron@gmail.com <mailto:sh.yaron@gmail.com>>
>  - luming zh <lumingzh@qq.com <mailto:lumingzh@qq.com>>
>  - Fran Di=C3=A9guez <frandieguez@gnome.org=20
> <mailto:frandieguez@gnome.org>>
>  - Piotr Dr=C4=85g <piotrdrag@gmail.com <mailto:piotrdrag@gmail.com>>
>  - Artur S0 <arturios05@bk.ru <mailto:arturios05@bk.ru>>
>=20
> Added/updated translations:
>  - fa.po, courtesy of Danial Behzadi
>  - gl.po, courtesy of Fran Dieguez
>  - he.po, courtesy of Yaron Shahrabani
>  - pl.po, courtesy of Piotr Dr=C4=85g
>  - ru.po, courtesy of Artur So
>  - zh_CN.po, courtesy of lumingzh
>=20
> 45.beta (unstable)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> LocalSearch:
>  - Fix UPnP container contents after store update
>  - Fix graph names
>=20
> Bugs fixed in this release:
>  - <https://gitlab.gnome.org/GNOME/rygel/issues/110>
>=20
> All contributors to this release:
>  - Jens Georg <mail@jensge.org <mailto:mail@jensge.org>>
>  - Emin Tufan =C3=87etin <etcetin@gmail.com <mailto:etcetin@gmail.com>>
>=20
> Added/updated translations:
>  - tr.po, courtesy of Emin Tufan =C3=87etin
>=20
> 45.alpha (unstable)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Major changes:
>  - Port UI parts to GTK4
>  - Drop support for Tracker 3
>  - Add support for LocalSearch
>=20
> Presets:
>  - Fix OpenH264 preset config
>  - Add more presets for other codecs
>=20
> Transcoding:
>  - Remove WMV decoder from list of default-enabled transcoders
>=20
> Server:
>  - Support .ssa subtitles
>=20
> Bugs fixed in this release:
>  - <https://gitlab.gnome.org/GNOME/rygel/issues/240>
>  - <https://gitlab.gnome.org/GNOME/rygel/issues/241>
>  - <https://gitlab.gnome.org/GNOME/rygel/issues/242>
>=20
> All contributors to this release:
>  - Jens Georg <mail@jensge.org <mailto:mail@jensge.org>>
>  - Pawan Chitrakar <chautari@gmail.com <mailto:chautari@gmail.com>>
>  - Vasil Pupkin <3abac@3a.by <mailto:3abac@3a.by>>
>  - Yuki Okushi <yokushi@gnome.org <mailto:yokushi@gnome.org>>
>  - Martin <miles@filmsi.net <mailto:miles@filmsi.net>>
>  - Piotr Dr=C4=85g <piotrdrag@gmail.com <mailto:piotrdrag@gmail.com>>
>  - Baxrom Raxmatov <magdiyevbahrom@gmail.com=20
> <mailto:magdiyevbahrom@gmail.com>>
>=20
> Added/updated translations:
>  - be.po, courtesy of Yuras Shumovich
>  - ja.po, courtesy of Yuki Okushi
>  - ne.po, courtesy of Pawan Chitrakar
>  - sl.po, courtesy of Martin Srebotnjak
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../rygel/{rygel_0.44.1.bb =3D> rygel_45.0.bb}         | 12=20
> ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.44.1.bb=20
> =3D> rygel_45.0.bb} (87%)
>=20
> diff --git=20
> a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb=20
> b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> similarity index 87%
> rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
> rename to meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> index 6423d51a31..97948d896f 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
> @@ -18,15 +18,15 @@ RRECOMMENDS:${PN} =3D "rygel-plugin-media-export"
>  inherit gnomebase features_check vala gobject-introspection gettext=20
> systemd
>=20
>  # gobject-introspection is mandatory for libmediaart-2.0 and cannot=20
> be configured
> -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "7b2c631b842408da27a54242f8082aba49bd1ca02041e79e1eefba0c7009a87b"
> +SRC_URI[archive.sha256sum] =3D=20
> "82667b902fc0672e64cf91eb727a70137a8fdfe7a3d9a4c158b0f4b1fc700882"
>=20
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>=20
>  EXTRA_OEMESON =3D "-Dengines=3Dgstreamer=20
> -Dplugins=3D${@strip_comma('${RYGEL_PLUGINS}')}"
> -PACKAGECONFIG:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>("DISTRO_FEATURES", "x11", " gtk+3", "",=20
> d)}"
> +PACKAGECONFIG:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>_any("DISTRO_FEATURES", "opengl vulkan",=20
> " gtk4", "", d)}"
>=20
>  PACKAGECONFIG ?=3D "external mpris ruih gst-launch media-export"
>=20
> @@ -35,8 +35,8 @@ PACKAGECONFIG[mpris] =3D ""
>  PACKAGECONFIG[ruih] =3D ""
>  PACKAGECONFIG[media-export] =3D ""
>  PACKAGECONFIG[gst-launch] =3D ""
> -PACKAGECONFIG[tracker3] =3D ""
> -PACKAGECONFIG[gtk+3] =3D ",-Dgtk=3Ddisabled,gtk+3"
> +PACKAGECONFIG[localsearch] =3D ""
> +PACKAGECONFIG[gtk4] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk4"
>=20
>  RYGEL_PLUGINS =3D ""
>  RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'external',=20
> ',external', '', d)}"
> @@ -44,7 +44,7 @@ RYGEL_PLUGINS:append =3D=20
> "${@bb.utils.contains('PACKAGECONFIG', 'mpris', ',mpris',
>  RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'ruih', ',ruih', '',=20
> d)}"
>  RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'gst-launch',=20
> ',gst-launch', '', d)}"
>  RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'media-export',=20
> ',media-export', '', d)}"
> -RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'tracker3',=20
> ',tracker3', '', d)}"
> +RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'localsearch',=20
> ',localsearch', '', d)}"
>  RYGEL_PLUGINS:append =3D "${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'playbin', ',playbin',=20
> '', d)}"
>=20
>  LIBV =3D "2.8"
> --
> 2.51.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120150):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/120150>
> Mute This Topic: <https://lists.openembedded.org/mt/115544539/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-U855XjR14EM2yrQNmQdz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Be more consistent and also remove=
 x11 from REQUIRED_DISTRO_FEATURES.</div></div><div id=3D"geary-quote" dir=
=3D"auto"><br>On Do, Okt 2 2025 at 02:12:27 +02:00:00, Markus Volk via list=
s.openembedded.org &lt;f_l_k=3Dt-online.de@lists.openembedded.org&gt; wrote=
:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-spac=
e: break-spaces;">- adjust PACKAGECONFIG for gtk and localsearch

45 (stable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Translation updates

All contributors to this release:
 - Alan Mortensen &lt;<a href=3D"mailto:alanmortensen.am@gmail.com">alanmor=
tensen.am@gmail.com</a>&gt;
 - Anders Jonsson &lt;<a href=3D"mailto:anders.jonsson@norsjovallen.se">and=
ers.jonsson@norsjovallen.se</a>&gt;
 - Antonio Marin &lt;<a href=3D"mailto:gnmer.6qxyg@slmail.me">gnmer.6qxyg@s=
lmail.me</a>&gt;
 - Asier Saratsua Garmendia &lt;<a href=3D"mailto:asiersarasua@ni.eus">asie=
rsarasua@ni.eus</a>&gt;
 - Aurimas Aurimas =C4=8Cernius &lt;<a href=3D"mailto:aurisc4@gmail.com">au=
risc4@gmail.com</a>&gt;
 - Bal=C3=A1zs =C3=9Ar &lt;<a href=3D"mailto:balazs@urbalazs.hu">balazs@urb=
alazs.hu</a>&gt;
 - Changwoo Ryu &lt;<a href=3D"mailto:cwryu@debian.org">cwryu@debian.org</a=
>&gt;
 - Daniel Mustieles &lt;<a href=3D"mailto:daniel.mustieles@gmail.com">danie=
l.mustieles@gmail.com</a>&gt;
 - Daniel Rusek &lt;<a href=3D"mailto:mail@asciiwolf.com">mail@asciiwolf.co=
m</a>&gt;
 - Ekaterine Papava &lt;<a href=3D"mailto:papava.e@gtu.ge">papava.e@gtu.ge<=
/a>&gt;
 - Hugo Carvalho &lt;<a href=3D"mailto:hugokarvalho@hotmail.com">hugokarval=
ho@hotmail.com</a>&gt;
 - Jordi Mas i Hernandez &lt;<a href=3D"mailto:jmas@softcatala.org">jmas@so=
ftcatala.org</a>&gt;
 - Juliano de Souza Camargo &lt;<a href=3D"mailto:julianosc@protonmail.com"=
>julianosc@protonmail.com</a>&gt;
 - Nathan Follens &lt;<a href=3D"mailto:nfollens@gnome.org">nfollens@gnome.=
org</a>&gt;
 - Quentin PAG=C3=88S &lt;<a href=3D"mailto:pages_quentin@hotmail.com">page=
s_quentin@hotmail.com</a>&gt;
 - Yuri Chornoivan &lt;<a href=3D"mailto:yurchor@ukr.net">yurchor@ukr.net</=
a>&gt;

Added/updated translations:
 - po/ca.po, courtesy of Jordi Mas i Hernandez
 - po/cs.po, courtesy of Daniel Rusek
 - po/da.po, courtesy of Alan Mortensen
 - po/es.po, courtesy of Daniel Mustieles
 - po/eu.po, courtesy of Asier Saratsua Garmendia
 - po/hu.po, courtesy of Bal=C3=A1zs =C3=9Ar
 - po/ka.po, courtesy of Ekaterine Papava
 - po/ko.po, courtesy of Changwoo Ryu
 - po/lt.po, courtesy of Aurimas Aurimas =C4=8Cernius
 - po/nl.po, courtesy of Nathan Follens
 - po/oc.po, courtesy of Quentin PAG=C3=88S
 - po/pt_BR.po, courtesy of Juliano de Souza Camargo
 - po/pt.po, courtesy of Hugo Carvalho
 - po/ro.po, courtesy of Antonio Marin
 - po/sv.po, courtesy of Anders Jonsson
 - po/uk.po, courtesy of Yuri Chornoivan

45.rc (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

LocalSearch:
 - Fix file upload

All contributors to this release:
 - Danial Behzadi &lt;<a href=3D"mailto:dani.behzi@ubuntu.com">dani.behzi@u=
buntu.com</a>&gt;
 - Jens Georg &lt;<a href=3D"mailto:mail@jensge.org">mail@jensge.org</a>&gt=
;
 - Yaron Shahrabani &lt;<a href=3D"mailto:sh.yaron@gmail.com">sh.yaron@gmai=
l.com</a>&gt;
 - luming zh &lt;<a href=3D"mailto:lumingzh@qq.com">lumingzh@qq.com</a>&gt;
 - Fran Di=C3=A9guez &lt;<a href=3D"mailto:frandieguez@gnome.org">frandiegu=
ez@gnome.org</a>&gt;
 - Piotr Dr=C4=85g &lt;<a href=3D"mailto:piotrdrag@gmail.com">piotrdrag@gma=
il.com</a>&gt;
 - Artur S0 &lt;<a href=3D"mailto:arturios05@bk.ru">arturios05@bk.ru</a>&gt=
;

Added/updated translations:
 - fa.po, courtesy of Danial Behzadi
 - gl.po, courtesy of Fran Dieguez
 - he.po, courtesy of Yaron Shahrabani
 - pl.po, courtesy of Piotr Dr=C4=85g
 - ru.po, courtesy of Artur So
 - zh_CN.po, courtesy of lumingzh

45.beta (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

LocalSearch:
 - Fix UPnP container contents after store update
 - Fix graph names

Bugs fixed in this release:
 - <a href=3D"https://gitlab.gnome.org/GNOME/rygel/issues/110">https://gitl=
ab.gnome.org/GNOME/rygel/issues/110</a>

All contributors to this release:
 - Jens Georg &lt;<a href=3D"mailto:mail@jensge.org">mail@jensge.org</a>&gt=
;
 - Emin Tufan =C3=87etin &lt;<a href=3D"mailto:etcetin@gmail.com">etcetin@g=
mail.com</a>&gt;

Added/updated translations:
 - tr.po, courtesy of Emin Tufan =C3=87etin

45.alpha (unstable)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Major changes:
 - Port UI parts to GTK4
 - Drop support for Tracker 3
 - Add support for LocalSearch

Presets:
 - Fix OpenH264 preset config
 - Add more presets for other codecs

Transcoding:
 - Remove WMV decoder from list of default-enabled transcoders

Server:
 - Support .ssa subtitles

Bugs fixed in this release:
 - <a href=3D"https://gitlab.gnome.org/GNOME/rygel/issues/240">https://gitl=
ab.gnome.org/GNOME/rygel/issues/240</a>
 - <a href=3D"https://gitlab.gnome.org/GNOME/rygel/issues/241">https://gitl=
ab.gnome.org/GNOME/rygel/issues/241</a>
 - <a href=3D"https://gitlab.gnome.org/GNOME/rygel/issues/242">https://gitl=
ab.gnome.org/GNOME/rygel/issues/242</a>

All contributors to this release:
 - Jens Georg &lt;<a href=3D"mailto:mail@jensge.org">mail@jensge.org</a>&gt=
;
 - Pawan Chitrakar &lt;<a href=3D"mailto:chautari@gmail.com">chautari@gmail=
.com</a>&gt;
 - Vasil Pupkin &lt;<a href=3D"mailto:3abac@3a.by">3abac@3a.by</a>&gt;
 - Yuki Okushi &lt;<a href=3D"mailto:yokushi@gnome.org">yokushi@gnome.org</=
a>&gt;
 - Martin &lt;<a href=3D"mailto:miles@filmsi.net">miles@filmsi.net</a>&gt;
 - Piotr Dr=C4=85g &lt;<a href=3D"mailto:piotrdrag@gmail.com">piotrdrag@gma=
il.com</a>&gt;
 - Baxrom Raxmatov &lt;<a href=3D"mailto:magdiyevbahrom@gmail.com">magdiyev=
bahrom@gmail.com</a>&gt;

Added/updated translations:
 - be.po, courtesy of Yuras Shumovich
 - ja.po, courtesy of Yuki Okushi
 - ne.po, courtesy of Pawan Chitrakar
 - sl.po, courtesy of Martin Srebotnjak

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../rygel/{rygel_0.44.1.bb =3D&gt; rygel_45.0.bb}         | 12 ++++++-----=
-
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.44.1.bb =3D&gt;=
 rygel_45.0.bb} (87%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb b/m=
eta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
similarity index 87%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
index 6423d51a31..97948d896f 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
@@ -18,15 +18,15 @@ RRECOMMENDS:${PN} =3D "rygel-plugin-media-export"
 inherit gnomebase features_check vala gobject-introspection gettext system=
d
=20
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be con=
figured
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "7b2c631b842408da27a54242f8082aba49bd1ca020=
41e79e1eefba0c7009a87b"
+SRC_URI[archive.sha256sum] =3D "82667b902fc0672e64cf91eb727a70137a8fdfe7a3=
d9a4c158b0f4b1fc700882"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 EXTRA_OEMESON =3D "-Dengines=3Dgstreamer -Dplugins=3D${@strip_comma('${RYG=
EL_PLUGINS}')}"
-PACKAGECONFIG:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
+PACKAGECONFIG:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>_any("DISTRO_FEATURES", "opengl vulkan", " gtk4", "", d)}"
=20
 PACKAGECONFIG ?=3D "external mpris ruih gst-launch media-export"
=20
@@ -35,8 +35,8 @@ PACKAGECONFIG[mpris] =3D ""
 PACKAGECONFIG[ruih] =3D ""
 PACKAGECONFIG[media-export] =3D ""
 PACKAGECONFIG[gst-launch] =3D ""
-PACKAGECONFIG[tracker3] =3D ""
-PACKAGECONFIG[gtk+3] =3D ",-Dgtk=3Ddisabled,gtk+3"
+PACKAGECONFIG[localsearch] =3D ""
+PACKAGECONFIG[gtk4] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabled,gtk4"
=20
 RYGEL_PLUGINS =3D ""
 RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'external', ',external', '', d)}"
@@ -44,7 +44,7 @@ RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECO=
NFIG', 'mpris', ',mpris',
 RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'ruih', ',ruih', '', d)}"
 RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'gst-launch', ',gst-launch', '', d)}"
 RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'media-export', ',media-export', '', d)}"
-RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
+RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'localsearch', ',localsearch', '', d)}"
 RYGEL_PLUGINS:append =3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.ut=
ils.contains</a>('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"
=20
 LIBV =3D "2.8"
<div>--=20
</div>2.51.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#120150): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/120150">https://lists.openembedded.org/g/openembed=
ded-devel/message/120150</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115544539/361=
8223">https://lists.openembedded.org/mt/115544539/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-U855XjR14EM2yrQNmQdz--


