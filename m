Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518DBC433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 13:18:12 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.9151.1642943890205377934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id 831121C494;
	Sun, 23 Jan 2022 14:18:07 +0100 (CET)
Received: from [192.168.178.83] ([84.163.32.167]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nBcks-0tQSC90; Sun, 23 Jan 2022 14:18:02 +0100
Subject: Re: [oe] [meta-gnome][PATCHv2] folks: initial add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20220120203602.3833757-1-f_l_k@t-online.de>
 <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
 <CANNYZj9V_6q9S-vovMMw7i3GdJjog==9EXDCJ_+SMnknCNxHuQ@mail.gmail.com>
 <baeb1c77-f334-2282-3a40-19916962332d@t-online.de>
 <CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=PAKkXVpNOw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <6c490468-aadb-e91d-28ce-551f21e3605a@t-online.de>
Date: Sun, 23 Jan 2022 14:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=PAKkXVpNOw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4010221065D699F0876B90A9"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1642943882-0000B8A1-97C62EC8/0/0 CLEAN NORMAL
X-TOI-MSGID: e5f5810b-7b99-4f91-bf76-ce7885e76d1c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 13:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95018

This is a multi-part message in MIME format.
--------------4010221065D699F0876B90A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

But what you want is literally fighting against upstream design=20
decision. This always brings with it additional maintenance burden and i=20
don't see the big win of this.

Theres already plenty of gnome=C2=A0 recipes that require introspection t=
o be=20
enabled:

./meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb:GI=
R_MESON_OPTION=20
=3D ""
./meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb:GIR_MESON_OPTION =3D ""
./meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41=
.0.bb:GIR_MESON_OPTION=20
=3D ""
./meta-gnome/recipes-gnome/gdm/gdm_41.0.bb:GIR_MESON_OPTION =3D ""
./meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb:GIR_MESON_OPTION =3D =
""
./meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb:GIR_MESON_OPTI=
ON=20
=3D ""
./meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb:GIR_MESON_OPTION =3D ""
./meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb:GIR_MESON_=
OPTION=20
=3D ""
./meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb:GIR_MESON_OPTI=
ON=20
=3D ""
./meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb:GIR_MESON_OPTION =3D ""
./meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb:GIR_MESON_OP=
TION=20
=3D ""
./meta-gnome/recipes-gnome/gedit/gedit_40.1.bb:GIR_MESON_OPTION =3D ""
./meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb:GIR_MESON_OPTI=
ON=20
=3D ""
./meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb:GIR_MESON_OPT=
ION=20
=3D ""
./meta-oe/recipes-support/colord/colord.bb:GIR_MESON_OPTION =3D ""

And they all just set

REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"

Am 23.01.22 um 14:00 schrieb Alexander Kanavin:
> You need to add a patch that guards introspection with a meson option,=20
> submit the patch upstream, and then add the patch to the recipe, with=20
> a link (in the patch file) to the upstream submission.
>
> Alex
>
> On Sun, 23 Jan 2022 at 13:14, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>
>     yes, but folks is one of that gnome projects that made
>     introspection mandatory. I can't find an option to disable it with
>     the meson buildsystem:
>
>     https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson_options.tx=
t
>     <https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson_options.t=
xt>
>
>     So i'm really unsure what to do here.
>
>     But i have added some more usable PACKAGECONFIG options and sent a
>     patchv3
>
>     Am 22.01.22 um 20:54 schrieb Alexander Kanavin:
>>     Gobject introspection is inherently hostile to cross compilation
>>     environments as it requires running a cross-compiled binary with
>>     the qemu emulator. That does not always work, and if it does not,
>>     your build will break. So there must be a way to turn it off when
>>     it happens.
>>
>>     Alex
>>
>>     On Sat, 22 Jan 2022 at 20:29, Markus Volk <f_l_k@t-online.de
>>     <mailto:f_l_k@t-online.de>> wrote:
>>
>>         I tried to make the 'folks' backends buildable and it turned
>>         out, that
>>         there are some more places where vala introspection is missing=
.
>>
>>         https://github.com/openembedded/meta-openembedded/blob/461c046=
57c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data=
-server/evolution-data-server.bb#L34
>>         <https://github.com/openembedded/meta-openembedded/blob/461c04=
657c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-dat=
a-server/evolution-data-server.bb#L34>
>>
>>         https://github.com/openembedded/meta-openembedded/blob/566049b=
4f1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/=
telepathy-glib_0.24.1.bb#L17
>>         <https://github.com/openembedded/meta-openembedded/blob/566049=
b4f1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy=
/telepathy-glib_0.24.1.bb#L17>
>>
>>
>>         Most gnome projects meanwhile make gobject-introspection
>>         mandatory and i
>>         can really feel why they are doing so for two important reason=
s.
>>
>>         First it is just mandatory if you want to be able to build
>>         the whole
>>         gnome universe and second it is in my option one of the greate=
st
>>         features of gtk to be able to write code for it in almost
>>         every language
>>         available. This should not be an optional feature so people
>>         could rely
>>         on it.
>>
>>         In both recipes introspection is disabled by default and
>>         dependent on
>>         'GI_DATA_ENABLED=3Dtrue'. Wouldn't it be a good idea to just
>>         enable
>>         Introspection by default? We already inherit
>>         gobject-introspection anyway.
>>
>>         There are also some more issues in libgdata and libical with
>>         introspection i was able to fix locally. Will send patches
>>         for it if
>>         it'll be ok making introspection mandatory.
>>
>>         Am 20.01.22 um 21:36 schrieb Markus Volk:
>>         > Signed-off-by: Markus Volk <f_l_k@t-online.de
>>         <mailto:f_l_k@t-online.de>>
>>         > ---
>>         >=C2=A0 =C2=A0.../folks/folks_0.15.4.bb <http://folks_0.15.4.b=
b> =C2=A0 =C2=A0 =C2=A0
>>         =C2=A0 =C2=A0 =C2=A0| 24 +++++++++++++++++++
>>         >=C2=A0 =C2=A01 file changed, 24 insertions(+)
>>         >=C2=A0 =C2=A0create mode 100644
>>         meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>>         <http://folks_0.15.4.bb>
>>         >
>>         > diff --git
>>         a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>>         <http://folks_0.15.4.bb>
>>         b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>>         <http://folks_0.15.4.bb>
>>         > new file mode 100644
>>         > index 000000000..b4ca551c8
>>         > --- /dev/null
>>         > +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>>         <http://folks_0.15.4.bb>
>>         > @@ -0,0 +1,24 @@
>>         > +SUMMARY =3D "Folks is a contact aggregation library."
>>         > +LICENSE =3D "LGPLv2.1"
>>         > +LIC_FILES_CHKSUM =3D
>>         "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
>>         > +
>>         > +DEPENDS =3D " \
>>         > +=C2=A0 =C2=A0 glib-2.0 \
>>         > +=C2=A0 =C2=A0 libgee \
>>         > +=C2=A0 =C2=A0 libxml2 \
>>         > +=C2=A0 =C2=A0 dbus-glib \
>>         > +=C2=A0 =C2=A0 telepathy-glib \
>>         > +"
>>         > +
>>         > +GNOMEBASEBUILDCLASS =3D "meson"
>>         > +
>>         > +# gobject-introspection is mandatory and cannot be configur=
ed
>>         > +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>         > +GIR_MESON_OPTION =3D ""
>>         > +
>>         > +EXTRA_OEMESON =3D "-Deds_backend=3Dfalse -Dbluez_backend=3D=
false
>>         -Dofono_backend=3Dfalse -Dtelepathy_backend=3Dfalse"
>>         > +
>>         > +inherit gnomebase gettext gobject-introspection vala
>>         features_check
>>         > +
>>         > +SRC_URI[archive.sha256sum] =3D
>>         "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124a=
f5f"
>>         > +
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>         Links: You receive all messages sent to this group.
>>         View/Reply Online (#95004):
>>         https://lists.openembedded.org/g/openembedded-devel/message/95=
004
>>         <https://lists.openembedded.org/g/openembedded-devel/message/9=
5004>
>>         Mute This Topic:
>>         https://lists.openembedded.org/mt/88611345/1686489
>>         <https://lists.openembedded.org/mt/88611345/1686489>
>>         Group Owner: openembedded-devel+owner@lists.openembedded.org
>>         <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>         Unsubscribe:
>>         https://lists.openembedded.org/g/openembedded-devel/unsub
>>         <https://lists.openembedded.org/g/openembedded-devel/unsub>
>>         [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--------------4010221065D699F0876B90A9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>But what you want is literally fighting against upstream design
      decision. This always brings with it additional maintenance burden
      and i don't see the big win of this.</p>
    <p>Theres already plenty of gnome=C2=A0 recipes that require
      introspection to be enabled:</p>
    <p>./meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.=
5.bb:GIR_MESON_OPTION
      =3D ""<br>
      ./meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb:GIR_MESON_OPTION =3D
      ""<br>
./meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_41=
.0.bb:GIR_MESON_OPTION
      =3D ""<br>
      ./meta-gnome/recipes-gnome/gdm/gdm_41.0.bb:GIR_MESON_OPTION =3D ""<=
br>
./meta-gnome/recipes-gnome/tracker/tracker_3.2.1.bb:GIR_MESON_OPTION =3D
      ""<br>
./meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb:GIR_MESON_OPTI=
ON
      =3D ""<br>
      ./meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb:GIR_MESON_OPTION =3D
      ""<br>
./meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_41.2.bb:GIR_MESON_=
OPTION
      =3D ""<br>
./meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb:GIR_MESON_OPTI=
ON
      =3D ""<br>
      ./meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb:GIR_MESON_OPTION =3D "=
"<br>
./meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb:GIR_MESON_OP=
TION
      =3D ""<br>
      ./meta-gnome/recipes-gnome/gedit/gedit_40.1.bb:GIR_MESON_OPTION =3D
      ""<br>
./meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb:GIR_MESON_OPTI=
ON
      =3D ""<br>
./meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb:GIR_MESON_OPT=
ION
      =3D ""<br>
      ./meta-oe/recipes-support/colord/colord.bb:GIR_MESON_OPTION =3D ""<=
br>
    </p>
    <p>And they all just set</p>
    <p>REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"<br>
    </p>
    <div class=3D"moz-cite-prefix">Am 23.01.22 um 14:00 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=3DPAKkXVpNOw@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>You need to add a patch that guards introspection with a
          meson option, submit the patch upstream, and then add the
          patch to the recipe, with a link (in the patch file) to the
          upstream submission.</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sun, 23 Jan 2022 at 13:1=
4,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de"
            moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <p>yes, but folks is one of that gnome projects that made
              introspection mandatory. I can't find an option to disable
              it with the meson buildsystem:</p>
            <p><a
href=3D"https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson_options.=
txt"
                target=3D"_blank" moz-do-not-send=3D"true">https://gitlab=
.gnome.org/GNOME/folks/-/blob/master/meson_options.txt</a></p>
            <p>So i'm really unsure what to do here.<br>
            </p>
            <p>But i have added some more usable PACKAGECONFIG options
              and sent a patchv3<br>
            </p>
            <div>Am 22.01.22 um 20:54 schrieb Alexander Kanavin:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">
                <div>Gobject introspection is inherently hostile to
                  cross compilation environments as it requires running
                  a cross-compiled binary with the qemu emulator. That
                  does not always work, and if it does not, your build
                  will break. So there must be a way to turn it off when
                  it happens.</div>
                <div><br>
                </div>
                <div>Alex<br>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Sat, 22 Jan 2022=
 at
                  20:29, Markus Volk &lt;<a
                    href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"
                    moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">I tried to make the
                  'folks' backends buildable and it turned out, that <br>
                  there are some more places where vala introspection is
                  missing.<br>
                  <br>
                  <a
href=3D"https://github.com/openembedded/meta-openembedded/blob/461c04657c=
3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-se=
rver/evolution-data-server.bb#L34"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">https://github.com/openembed=
ded/meta-openembedded/blob/461c04657c3151629b503fe134e9d672520aacbb/meta-=
gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb#L34</a=
><br>
                  <br>
                  <a
href=3D"https://github.com/openembedded/meta-openembedded/blob/566049b4f1=
ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/tel=
epathy-glib_0.24.1.bb#L17"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">https://github.com/openembed=
ded/meta-openembedded/blob/566049b4f1ddc049c1f89a5838d1a71bb429faa3/meta-=
oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb#L17</a><br>
                  <br>
                  <br>
                  Most gnome projects meanwhile make
                  gobject-introspection mandatory and i <br>
                  can really feel why they are doing so for two
                  important reasons.<br>
                  <br>
                  First it is just mandatory if you want to be able to
                  build the whole <br>
                  gnome universe and second it is in my option one of
                  the greatest <br>
                  features of gtk to be able to write code for it in
                  almost every language <br>
                  available. This should not be an optional feature so
                  people could rely <br>
                  on it.<br>
                  <br>
                  In both recipes introspection is disabled by default
                  and dependent on <br>
                  'GI_DATA_ENABLED=3Dtrue'. Wouldn't it be a good idea to
                  just enable <br>
                  Introspection by default? We already inherit
                  gobject-introspection anyway.<br>
                  <br>
                  There are also some more issues in libgdata and
                  libical with <br>
                  introspection i was able to fix locally. Will send
                  patches for it if <br>
                  it'll be ok making introspection mandatory.<br>
                  <br>
                  Am 20.01.22 um 21:36 schrieb Markus Volk:<br>
                  &gt; Signed-off-by: Markus Volk &lt;<a
                    href=3D"mailto:f_l_k@t-online.de" target=3D"_blank"
                    moz-do-not-send=3D"true">f_l_k@t-online.de</a>&gt;<br=
>
                  &gt; ---<br>
                  &gt;=C2=A0 =C2=A0.../folks/<a href=3D"http://folks_0.15=
.4.bb"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">folks_0.15.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 +++++++++=
++++++++++<br>
                  &gt;=C2=A0 =C2=A01 file changed, 24 insertions(+)<br>
                  &gt;=C2=A0 =C2=A0create mode 100644
                  meta-gnome/recipes-connectivity/folks/<a
                    href=3D"http://folks_0.15.4.bb" rel=3D"noreferrer"
                    target=3D"_blank" moz-do-not-send=3D"true">folks_0.15=
.4.bb</a><br>
                  &gt;<br>
                  &gt; diff --git
                  a/meta-gnome/recipes-connectivity/folks/<a
                    href=3D"http://folks_0.15.4.bb" rel=3D"noreferrer"
                    target=3D"_blank" moz-do-not-send=3D"true">folks_0.15=
.4.bb</a>
                  b/meta-gnome/recipes-connectivity/folks/<a
                    href=3D"http://folks_0.15.4.bb" rel=3D"noreferrer"
                    target=3D"_blank" moz-do-not-send=3D"true">folks_0.15=
.4.bb</a><br>
                  &gt; new file mode 100644<br>
                  &gt; index 000000000..b4ca551c8<br>
                  &gt; --- /dev/null<br>
                  &gt; +++ b/meta-gnome/recipes-connectivity/folks/<a
                    href=3D"http://folks_0.15.4.bb" rel=3D"noreferrer"
                    target=3D"_blank" moz-do-not-send=3D"true">folks_0.15=
.4.bb</a><br>
                  &gt; @@ -0,0 +1,24 @@<br>
                  &gt; +SUMMARY =3D "Folks is a contact aggregation
                  library."<br>
                  &gt; +LICENSE =3D "LGPLv2.1"<br>
                  &gt; +LIC_FILES_CHKSUM =3D <a moz-do-not-send=3D"true">=
"file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"</a><br>
                  &gt; +<br>
                  &gt; +DEPENDS =3D " \<br>
                  &gt; +=C2=A0 =C2=A0 glib-2.0 \<br>
                  &gt; +=C2=A0 =C2=A0 libgee \<br>
                  &gt; +=C2=A0 =C2=A0 libxml2 \<br>
                  &gt; +=C2=A0 =C2=A0 dbus-glib \<br>
                  &gt; +=C2=A0 =C2=A0 telepathy-glib \<br>
                  &gt; +"<br>
                  &gt; +<br>
                  &gt; +GNOMEBASEBUILDCLASS =3D "meson"<br>
                  &gt; +<br>
                  &gt; +# gobject-introspection is mandatory and cannot
                  be configured<br>
                  &gt; +REQUIRED_DISTRO_FEATURES =3D
                  "gobject-introspection-data"<br>
                  &gt; +GIR_MESON_OPTION =3D ""<br>
                  &gt; +<br>
                  &gt; +EXTRA_OEMESON =3D "-Deds_backend=3Dfalse
                  -Dbluez_backend=3Dfalse -Dofono_backend=3Dfalse
                  -Dtelepathy_backend=3Dfalse"<br>
                  &gt; +<br>
                  &gt; +inherit gnomebase gettext gobject-introspection
                  vala features_check<br>
                  &gt; +<br>
                  &gt; +SRC_URI[archive.sha256sum] =3D
                  "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536af=
b79124af5f"<br>
                  &gt; +<br>
                  <br>
                  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                  Links: You receive all messages sent to this group.<br>
                  View/Reply Online (#95004): <a
                    href=3D"https://lists.openembedded.org/g/openembedded=
-devel/message/95004"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">https://lists.openembedded.o=
rg/g/openembedded-devel/message/95004</a><br>
                  Mute This Topic: <a
                    href=3D"https://lists.openembedded.org/mt/88611345/16=
86489"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">https://lists.openembedded.o=
rg/mt/88611345/1686489</a><br>
                  Group Owner: <a
                    href=3D"mailto:openembedded-devel%2Bowner@lists.opene=
mbedded.org"
                    target=3D"_blank" moz-do-not-send=3D"true">openembedd=
ed-devel+owner@lists.openembedded.org</a><br>
                  Unsubscribe: <a
                    href=3D"https://lists.openembedded.org/g/openembedded=
-devel/unsub"
                    rel=3D"noreferrer" target=3D"_blank"
                    moz-do-not-send=3D"true">https://lists.openembedded.o=
rg/g/openembedded-devel/unsub</a>
                  [<a href=3D"mailto:alex.kanavin@gmail.com"
                    target=3D"_blank" moz-do-not-send=3D"true">alex.kanav=
in@gmail.com</a>]<br>
                  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                  <br>
                </blockquote>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------4010221065D699F0876B90A9--

