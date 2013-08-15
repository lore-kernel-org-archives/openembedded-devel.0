Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 971406B2CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 14:51:22 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so416572eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V9vJyoiGQTeKHYSZ9RLcl3UCKQh0+eUOq04CYaW2UKQ=;
	b=bFY3UMASLm2fRke5BxNILfKsyPJSLALVvY8ken86LBHCe4MJXZUoHSRgy6G+khHavJ
	5KviyMvAsdCB25lma83dfhtvOKKNdNx0xT6xaW2UKKm+csArDJLhj5EF0a3xRBRFMKAs
	wgWe9zLqrX8U177jD7aJlA7fgOtifoXb3hiYnbOxiipPR3N+a/nKwUGxNhcuIPaWm2nt
	gtRjAOJIpAHE11F3jWfca1O3vlsdZ65ge0oKXHUSoy9fw0roLgbqL/NRcEDFc0lVyjoh
	9pvsQtfmK3cq3VVKbFFePjKC1RYvLs4Hr1kN1dPVEiwR52Z1ae8LdSYC3oR/t1L0+wD0
	opGA==
X-Received: by 10.15.35.196 with SMTP id g44mr23562851eev.18.1376578282093;
	Thu, 15 Aug 2013 07:51:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm71945617eeh.8.2013.08.15.07.51.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 07:51:21 -0700 (PDT)
Date: Thu, 15 Aug 2013 16:52:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130815145213.GC17945@jama>
References: <CAAfyv35Cig9wH7tYx2b72_groQeqLeWO8jZdRrGmn+ZBonFaFg@mail.gmail.com>
	<CAAfyv379BfBtBff1yg4MDAVfYmSm2MuDi2UgO+JP2EQEgsWspg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfyv379BfBtBff1yg4MDAVfYmSm2MuDi2UgO+JP2EQEgsWspg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][dylan] Problem with fetching qt5 sources
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
X-List-Received-Date: Thu, 15 Aug 2013 14:51:23 -0000
X-Groupsio-MsgNum: 45756
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z4ZSWl3cPHKQyRxO"
Content-Disposition: inline

--Z4ZSWl3cPHKQyRxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 02:09:28PM +0200, Belisko Marek wrote:
> Hi,
>=20
> I'm using meta-qt5 (dylan branch) but fetching qt5.0.2 sources failed.
> Fix follows:

yes it was changed again yesterday or few days ago, would you care to
send proper git patch, so that I can pick it from patchwork instead of
applying it manually from e-mail? Thanks

> diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
> index 0bf1404..c04b3a2 100644
> --- a/recipes-qt/qt5/qt5-5.0.2.inc
> +++ b/recipes-qt/qt5/qt5-5.0.2.inc
> @@ -7,7 +7,7 @@ QT_VERSION ?=3D "${PV}"
>  QT_VERSION_DIR ?=3D "${QT_VERSION}"
>=20
>  SRC_URI +=3D " \
> -    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/subm=
odules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
> \
> +    http://download.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/subm=
odules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz
> \
>  "
>=20
>  S =3D "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
>=20
>=20
> Marek
>=20
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>=20
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Z4ZSWl3cPHKQyRxO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIM6x0ACgkQN1Ujt2V2gBw6YQCdEqQGiGJB8R1q062Vpt5yE9E6
+uwAnj55KEsBgx81GuKcgUjKEU/U2Vna
=mtDP
-----END PGP SIGNATURE-----

--Z4ZSWl3cPHKQyRxO--
