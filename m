Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D9FC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 08:26:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.15915.1661156792529562303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 01:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=oSW2gn3O;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661156792;
  x=1692692792;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KrVOV4vDe5LRHZBuJOQNV77dJGNTp0v2WxTwKszPQ5E=;
  b=oSW2gn3OftY/hIQJB2G9eB14btUf30z2pRz9Tx8x7fEOE9lW6HUK76ZG
   QJbS7alSTs1zZXe6YHMAQlZy9Od0SZZmdkgzIkNgyQnspeKT+j/6a7/C5
   UeretyEj1xAe2Dz4mDk63BoqqnVg90te/Ziy3HNHq8OlcKUMrgsqe+zyV
   Os5w6YYXfmtNGzK62VLr5PZF15KQpqQG+TV2zhRR4aRQZnClbo4Pz1X0k
   A2tiQ9YvgiFnohUv5fkfCf7kYI4DYgAHY/o3jyxxy6QT2Wa/d5w4JoEJx
   qdqhYsfmUDENMjARMwkCWhIWNQcThSqw8tazfZJkWwysLmtosrdvQwaZk
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCH] pipewire: install as configured
Thread-Topic: [oe] [meta-multimedia][PATCH] pipewire: install as configured
Thread-Index: AQHYtUavEq2ZcCNZNU2vsYem8+YF0a26lbOg
Date: Mon, 22 Aug 2022 08:26:29 +0000
Message-ID: <4e10c68d5b91402f9f213a32c5d7e1ef@axis.com>
References: <20220821101303.4155-1-f_l_k@t-online.de>
In-Reply-To: <20220821101303.4155-1-f_l_k@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 08:26:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98360

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk
> Sent: den 21 augusti 2022 12:13
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe] [meta-multimedia][PATCH] pipewire: install as configured
>=20
> This is to make sure that all configured parts of pipewire are installed =
on the target.
> For the systemd case, it would then just be a matter of starting the pipe=
wire user services,
> to get it running.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb          |  1 +
>  .../recipes-multimedia/pipewire/pipewire_0.3.56.bb    | 11 +++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-medi=
a-session_0.4.1.bb
> index 5dd1eb160..2facf8529 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
> @@ -11,6 +11,7 @@ DEPENDS =3D " \
>  "
>=20
>  RRECOMMENDS:${PN} +=3D "pipewire"
> +RPROVIDES:${PN} =3D "media-session"

Why is this needed?

>=20
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
>=20
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index eb8c9d01a..4dca6cc97 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -319,6 +319,17 @@ FILES:${PN}-jack =3D "\
>      ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
>  "
>=20
> +RRECOMMENDS:${PN}:class-target =3D " \
> +	pipewire-alsa-card-profile \
> +	pipewire-modules-meta \
> +	pipewire-spa-plugins-meta \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'pipewire-alsa', '', d)=
} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer1.0-pipe=
wire', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'jack', 'pipewire-jack', '', d)=
} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pipewire-pulse',=
 '', d)} \

The fifth argument to PACKAGECONFIG is for recommendations. That is where t=
hese=20
conditional dependencies belong.

> +	${PIPEWIRE_SESSION_MANAGER} \
> +"
> +
>  # Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
>  FILES:${PN}-spa-plugins =3D ""
>  RRECOMMENDS:${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
> --
> 2.34.1

//Peter


