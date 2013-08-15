Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0796B2CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 20:03:50 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so570323eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wd1CdihO8/vfuPKyJXdaoBVjuo5ZAWsjKkhztCDq7f4=;
	b=TBdOHKPDbG20e7ZPZHa8/GkoxDGC7Jczt5j9KJoYaxx2FO/8rcj+D2dNPFGcx0v+xj
	s4P8frbQ70z6cIh+JDYL/+ErNsLlRGlptcWYKtTAB5BsqKTyHZDjWBu1yv6ABDw89pyf
	Gw3tZDiN4SfIMygy8hDglyzf7HWXwV3weymt5ttXo4Ac+0OMW6/kaLkB+2tG6JkuT+Ii
	ZN19xTIobIYzKwle0nOtgORDDl8poei7uqWdO93owvf7Y8pWRtaq6TTBklnF6kTlfw1o
	nF4rmh4FT4QT58VGreTjCtoqAPnS504yRKBkchS+2i3DdknE9bgb1QsvMbsac94Gzw9q
	P2yw==
X-Received: by 10.14.122.132 with SMTP id t4mr25070442eeh.20.1376597029832;
	Thu, 15 Aug 2013 13:03:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm1268052eeg.17.2013.08.15.13.03.48 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 13:03:49 -0700 (PDT)
Date: Thu, 15 Aug 2013 22:04:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130815200441.GF17945@jama>
References: <1376594316-9677-1-git-send-email-marek.belisko@open-nandra.com>
MIME-Version: 1.0
In-Reply-To: <1376594316-9677-1-git-send-email-marek.belisko@open-nandra.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: Re: [meta-qt5][dylan][PATCH] Fix download url for qt5-5.0.2.
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
X-List-Received-Date: Thu, 15 Aug 2013 20:03:51 -0000
X-Groupsio-MsgNum: 45759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6U+WTAJHBcf3BHs"
Content-Disposition: inline

--i6U+WTAJHBcf3BHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 09:18:36PM +0200, Marek Belisko wrote:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  recipes-qt/qt5/qt5-5.0.2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied in dylan as well as master.

>=20
> diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
> index 0bf1404..c04b3a2 100644
> --- a/recipes-qt/qt5/qt5-5.0.2.inc
> +++ b/recipes-qt/qt5/qt5-5.0.2.inc
> @@ -7,7 +7,7 @@ QT_VERSION ?=3D "${PV}"
>  QT_VERSION_DIR ?=3D "${QT_VERSION}"
> =20
>  SRC_URI +=3D " \
> -    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/subm=
odules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
> +    http://download.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/subm=
odules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
>  "
> =20
>  S =3D "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i6U+WTAJHBcf3BHs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlINNFkACgkQN1Ujt2V2gBxL0gCfT0DEjKWCSYyxY85lfjX+cK9B
XcAAn0I2QQHSh+zA85gedQJYCuWbtcCf
=JqvB
-----END PGP SIGNATURE-----

--i6U+WTAJHBcf3BHs--
