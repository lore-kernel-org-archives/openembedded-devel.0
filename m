Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F40BFD007C
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 21:35:39 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146870.1772400932073029315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 13:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id 31C4C842;
	Sun,  1 Mar 2026 22:35:30 +0100 (CET)
Received: from [192.168.178.36] ([84.163.39.124]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vwoRi-0APNmi0; Sun, 1 Mar 2026 22:35:26 +0100
Date: Sun, 01 Mar 2026 22:35:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, f_l_k@t-online.de
Message-Id: <WAP8BT.7MCV16N6W4811@t-online.de>
In-Reply-To: <20260228054848.3197690-1-changqing.li@windriver.com>
References: <20260228054848.3197690-1-changqing.li@windriver.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gUI85aPbaDXXqtEfTklP"
X-TOI-EXPURGATEID: 150726::1772400926-B8FE88CF-297C18EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 1efa7c67-0dc6-4acd-b3da-a4fd82a72f44
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 21:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124795

--=-gUI85aPbaDXXqtEfTklP
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I sent a fix that removed DISTRO_FEATURES =3D =E2=80=9Cx11=E2=80=9D from gt=
kmm4 and=20
pangomm-2.48, which fixed this issue for me locally.
Have you seen these patches or do you know if there is a problem with=20
this approach?

I ask because I never received any feedback on these patches.

On Sat, Feb 28 2026 at 13:48:48 +08:00:00, Changqing Li=20
<changqing.li@windriver.com> wrote:
> pavucontrol depends on gtkmm4, which require x11, so add x11 to
> REQUIRED_DISTRO_FEATURES for pavucontrol, refer [1]
>=20
> [1]=20
> <https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&i=
d=3Daed20cd843fb00726d7c8da1aa19d238c2f9f195>
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>>
> ---
>  meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
> b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> index b6b9a068a9..9e54f49dcb 100644
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D "gtkmm4 pulseaudio json-glib"
>  inherit meson features_check pkgconfig gettext
>=20
>  ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
> +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
>  SRC_URI =3D=20
> "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz=20
> <http://www.freedesktop.org/software/pulseaudio/$%7BBPN%7D/$%7BBP%7D.tar.=
xz>"
>  SRC_URI[sha256sum] =3D=20
> "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
> --
> 2.34.1
>=20


--=-gUI85aPbaDXXqtEfTklP
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi,</div><div><br></div><div><div>=
I sent a fix that removed DISTRO_FEATURES =3D =E2=80=9Cx11=E2=80=9D from gt=
kmm4 and pangomm-2.48, which fixed this issue for me locally.</div><div>Hav=
e you seen these patches or do you know if there is a problem with this app=
roach?</div><div><br></div><div>I ask because I never received any feedback=
 on these patches.</div></div></div><div id=3D"geary-quote" dir=3D"auto"><b=
r>On Sat, Feb 28 2026 at 13:48:48 +08:00:00, Changqing Li &lt;changqing.li@=
windriver.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plainte=
xt" style=3D"white-space: break-spaces;">pavucontrol depends on gtkmm4, whi=
ch require x11, so add x11 to
REQUIRED_DISTRO_FEATURES for pavucontrol, refer [1]

[1] <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dm=
aster-next&amp;id=3Daed20cd843fb00726d7c8da1aa19d238c2f9f195">https://git.o=
penembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3Daed20cd8=
43fb00726d7c8da1aa19d238c2f9f195</a>

Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m">changqing.li@windriver.com</a>&gt;
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/met=
a-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
index b6b9a068a9..9e54f49dcb 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "gtkmm4 pulseaudio json-glib"
 inherit meson features_check pkgconfig gettext
=20
 ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
+REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI =3D "<a href=3D"http://www.freedesktop.org/software/pulseaudio/${B=
PN}/${BP}.tar.xz">http://www.freedesktop.org/software/pulseaudio/${BPN}/${B=
P}.tar.xz</a>"
 SRC_URI[sha256sum] =3D "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e8=
9ed52fd4f15d32"
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-gUI85aPbaDXXqtEfTklP--


