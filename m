Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyiEa-000427-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:18:18 +0100
Received: by mail-pb0-f45.google.com with SMTP id rq13so178988pbb.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 04:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Rdx9v5izHL0uRstBGk+4uAA5QQSfLUIFPs7Wmz244rs=;
	b=ha85myljoQysfMSV9YtDjF1Spk59tSHnvYrw+qJwuiOsPvJvbt9stKUTO09SdmIApH
	l10gklgGv5MFZsJJor8+B0eABg1ZuV2hHjg+59YSQJ7CZ5e2u0zTaa/q6xNroysVVWoX
	uDea6IjbaIHFhVPCMbc6Tx6wAiOcE2DvPSRF2e+UUoGnTtuY3e9crBVKXnkrIFnNauCa
	wPGXLd5ByQY8rrvfs34DiFAcRtbQ1b3oEdsEwz2+Jks0OfQfpJEfuy328cirrunT9Tzl
	IA+B0yZzrTJlj6z4339s5KhNjB+An8ReG8reChwfAiXWrxUGYy/TB1vnz11c1P054+1a
	tQ2A==
X-Received: by 10.66.87.67 with SMTP id v3mr12839911paz.63.1359115360874;
	Fri, 25 Jan 2013 04:02:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm762624paw.16.2013.01.25.04.02.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 04:02:39 -0800 (PST)
Date: Fri, 25 Jan 2013 13:02:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130125120236.GE3200@jama>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
	<1359114536-3823-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1359114536-3823-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-systemd 1/5] thunar: add RRECOMMENDS and RDEPENDS to ensure full functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 12:18:19 -0000
X-Groupsio-MsgNum: 42836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 12:48:52PM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb b/meta-xfce/re=
cipes-xfce/thunar/thunar_1.6.2.bb
> index 55b54d4..aec2db1 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.2.bb
> @@ -3,6 +3,7 @@ SECTION =3D "x11"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>  DEPENDS =3D "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm =
dbus-glib startup-notification libnotify xfce4-panel"
> +PR =3D "r1"
> =20
>  inherit xfce
> =20
> @@ -22,3 +23,7 @@ FILES_${PN} +=3D "${libdir}/thunarx-2/* \
>  FILES_${PN}-dbg +=3D "${libdir}/thunarx-2/.debug/ \
>                      ${libdir}/xfce4/panel/plugins/.debug/ \
>                      ${libdir}/Thunar/.debug/"
> +
> +# RRECOMMENDS does not drag in charmaps (tested with opkg)
> +RDEPENDS_${PN} =3D "eglibc-charmaps"

what about uclibc builds?

> +RRECOMMENDS_${PN} =3D "gvfs gvfsd-trash udisks"
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECdFwACgkQN1Ujt2V2gByS9QCfa++lZCTDshkP7RtvdESZEFjF
1b8An3j9APi5dKxgpSUlwJbonpcBWGlp
=UBke
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
