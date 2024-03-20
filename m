Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C14C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 07:58:21 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.38477.1710921496326198146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 00:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id D734B288E;
	Wed, 20 Mar 2024 08:58:14 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmqpy-03y6ls0; Wed, 20 Mar 2024 08:58:14 +0100
Date: Wed, 20 Mar 2024 08:58:45 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] gnome-session: update 45.0 -> 46.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <XHZMAS.MWVOV5M8BXP4@t-online.de>
In-Reply-To: <CAMKF1sr=13g3gP2O+o_eWe=JoYQ49m9J33SqpV17cbkwCsTCdw@mail.gmail.com>
References: <20240319104318.873991-1-f_l_k@t-online.de>
	<CAMKF1sr=13g3gP2O+o_eWe=JoYQ49m9J33SqpV17cbkwCsTCdw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WJQZalfJZKFVKOl5/i9I"
X-TOI-EXPURGATEID: 150726::1710921494-CD7F9957-6EE11872/0/0 CLEAN NORMAL
X-TOI-MSGID: 93d50c91-925b-4f89-8558-88d56cf3321d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 07:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109484

--=-WJQZalfJZKFVKOl5/i9I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Khem,

yes, sorry for that. I've sent a fixed version for gnome-session

On Tue, Mar 19 2024 at 09:59:08 AM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> Hi Markus
>=20
> Subject seems to indicate that its upgrading 45.0 -> 46.0, however
> patch is missing the file move/rename part.
>=20
> On Tue, Mar 19, 2024 at 3:43=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  - consolekit support was removed upstream
>>  - add PACKAGECONFIG for doc
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../gnome-session/gnome-session_46.0.bb           | 15=20
>> ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
>>=20
>>  diff --git=20
>> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb=20
>> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
>>  index ad8912b2c..87117fd17 100644
>>  --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
>>  +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
>>  @@ -4,29 +4,26 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>>=20
>>   DEPENDS =3D " \
>>       glib-2.0-native \
>>  -    libxslt-native \
>>  -    xmlto-native \
>>       xtrans \
>>       libice \
>>       libsm \
>>       virtual/libx11 \
>>  -    gtk+3 \
>>       gnome-desktop \
>>  -    gsettings-desktop-schemas \
>>  +    gtk+3 \
>>       json-glib \
>>  +    systemd \
>>   "
>>=20
>>  -
>>   inherit gnomebase gettext gsettings upstream-version-is-even=20
>> features_check
>>=20
>>  -REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam=20
>> gobject-introspection-data"
>>  +REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam=20
>> gobject-introspection-data"
>>=20
>>   SRC_URI[archive.sha256sum] =3D=20
>> "c6e1624af6090bc4e1a191fe2268abfa7a8de07831ca7a57f217e679bf7b9a54"
>>=20
>>  -PACKAGECONFIG ??=3D "${@bb.utils.contains=20
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd',=20
>> 'systemd', 'consolekit',d)}"
>>  +PACKAGECONFIG ??=3D ""
>>=20
>>  -PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue,=20
>> -Dconsolekit=3Dfalse, dbus-glib"
>>  -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue,=
=20
>> -Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
>>  +PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
>>  +PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native=20
>> libxslt-native"
>>=20
>>   FILES:${PN} +=3D " \
>>      ${datadir}/xdg-desktop-portal \
>>  --
>>  2.44.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#109478):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/109478>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/105021407/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-WJQZalfJZKFVKOl5/i9I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi Khem,</div><div><br></div><div>=
yes, sorry for that. I've sent a fixed version for gnome-session</div></div=
><div id=3D"geary-quote" dir=3D"auto"><br>On Tue, Mar 19 2024 at 09:59:08 A=
M -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Hi =
Markus

Subject seems to indicate that its upgrading 45.0 -&gt; 46.0, however
patch is missing the file move/rename part.

On Tue, Mar 19, 2024 at 3:43=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f=
_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 - consolekit support was removed upstream
 - add PACKAGECONFIG for doc

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../gnome-session/gnome-session_46.0.bb           | 15 ++++++---------
  1 file changed, 6 insertions(+), 9 deletions(-)

 diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb =
b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
 index ad8912b2c..87117fd17 100644
 --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
 +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
 @@ -4,29 +4,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5f=
ce4486a80fdaf4a4263"

  DEPENDS =3D " \
      glib-2.0-native \
 -    libxslt-native \
 -    xmlto-native \
      xtrans \
      libice \
      libsm \
      virtual/libx11 \
 -    gtk+3 \
      gnome-desktop \
 -    gsettings-desktop-schemas \
 +    gtk+3 \
      json-glib \
 +    systemd \
  "

 -
  inherit gnomebase gettext gsettings upstream-version-is-even features_che=
ck

 -REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspectio=
n-data"
 +REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-da=
ta"

  SRC_URI[archive.sha256sum] =3D "c6e1624af6090bc4e1a191fe2268abfa7a8de0783=
1ca7a57f217e679bf7b9a54"

 -PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.contains">${@bb.utils.=
contains</a>('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
 +PACKAGECONFIG ??=3D ""

 -PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse,=
 dbus-glib"
 -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -D=
systemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
 +PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
 +PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt-=
native"

  FILES:${PN} +=3D " \
     ${datadir}/xdg-desktop-portal \
 --
 2.44.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#109478): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/109478">https://lists.openembedded.org/g/openembe=
dded-devel/message/109478</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105021407/19=
97914">https://lists.openembedded.org/mt/105021407/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-WJQZalfJZKFVKOl5/i9I--


