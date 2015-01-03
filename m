Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C6366727CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 15:03:40 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so910532wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jan 2015 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DzJ54ixk+DWCBhoKLMaGwnwghGDDFVcf4qYAe+Ms3eg=;
	b=YsnhRL1pYYZtoiv+Mn1x+wV6DoIMhUXPI5jFujqKbdHbO/TMD/jiG35cjKIlwt82tc
	XbXRaOlCYkk+nnmKzkHZXY89PaITcFTYWdpE0mJQ6GBW8/rfTqcDXLa1aJAdjcfd56M1
	BQJbN7ud91AmmJaymfz+gWMlhzAIJOc2xQnePU0fqAFovxnuTbn3z1pgeB8dsDxhsazK
	VD4ZVpAQCOicdHM+o6/QPX6dOkvO6am8mlUJfMeoNCv45PipWaOlUMwSuOiDsAI3XzsX
	83sLu+qoVB3jJiXZCXC9VnVfG+SIyUgIF0CAVO5L4X4sbhflDRQJI44QLSRN3cqvGqSV
	uQcA==
X-Received: by 10.180.88.165 with SMTP id bh5mr7503679wib.77.1420297419396;
	Sat, 03 Jan 2015 07:03:39 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eu8sm2801177wib.21.2015.01.03.07.03.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jan 2015 07:03:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 Jan 2015 16:03:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150103150344.GB24032@jama>
References: <1420297183-16573-1-git-send-email-liezhi.yang@windriver.com>
	<1420297183-16573-2-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1420297183-16573-2-git-send-email-liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking] [PATCH 2/2] ncftp: use BPN in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Jan 2015 15:03:42 -0000
X-Groupsio-MsgNum: 53576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 03, 2015 at 06:59:43AM -0800, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-=
networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> index 73a88b4..4f13f90 100644
> --- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "ClArtistic"
>  LIC_FILES_CHKSUM =3D "file://ncftp/cmds.c;beginline=3D3;endline=3D4;md5=
=3D9de76faeaedc4f908082e3f8142715f4"
>  DEPENDS =3D "ncurses"
> =20
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${PN}/${PN}_${PV}.orig.tar.gz"
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${PN}/${BPN}_${PV}.orig.tar.gz"

Shouldn't it use BPN in both cases?

>  SRC_URI[md5sum] =3D "685e45f60ac11c89442c572c28af4228"
>  SRC_URI[sha256sum] =3D "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b=
2c19fbd074a436c4"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSoBNAACgkQN1Ujt2V2gBxoGQCeI+hX2mJfI1CSSCtUu9A17tSD
yNsAn0UHaq82hDBz+e3lsY1el8C6p4bq
=PLYT
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
