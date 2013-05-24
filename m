Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 716CD60974
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 11:36:54 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so4110848pbc.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X27hVHS6pl2KLFS2qGgGh7E3VSnocMbp+U5FjNg2Ghk=;
	b=XkOa+dUwZpI1OcVgFbnQkO4Hgf4EuZ94uNsmjAnEVV4tXz+rRxuO4N2zzkKfK0+2GT
	IFbhHfqlwh1SNVJYkEuw9AoJSSom+3hVl0Lk0kYf8QIrGFmulmrxDH4GZ/iQ4VCvQ5KG
	yxnfF1DiPtDKAo91p8F8fsOvs8WbSxHcqMiXpRLj5etxP6wzowlVMLAZ1jREviVYqUgQ
	TbCusdWcxTAeXeUwDtc4srJrTAR6arq2fTL/ppxdbevMV+IYlHlxpb4ZodxTpks1EYkn
	mzV+amNHIFTlLJvrbDzjghhCeoASh8atRus1f51r3L5Ew1lixVSse+dOiNfMdfZuvfJa
	98lQ==
X-Received: by 10.68.247.68 with SMTP id yc4mr17331961pbc.54.1369395415604;
	Fri, 24 May 2013 04:36:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wt5sm15864065pbc.38.2013.05.24.04.36.53 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 04:36:54 -0700 (PDT)
Date: Fri, 24 May 2013 13:36:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130524113652.GU32431@jama>
References: <1369388734-15750-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1369388734-15750-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt: package examples
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
X-List-Received-Date: Fri, 24 May 2013 11:36:55 -0000
X-Groupsio-MsgNum: 44857
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K0M4iRgkWWXhiQ9N"
Content-Disposition: inline

--K0M4iRgkWWXhiQ9N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 11:45:34AM +0200, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qt5.inc          |    9 ++++++++-
>  recipes-qt/qt5/qtbase.inc       |    1 +
>  recipes-qt/qt5/qtmultimedia.inc |    4 ++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index d370844..018c9ad 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -20,7 +20,7 @@ OE_QMAKE_PATH_SETTINGS =3D "${OE_QMAKE_PATH_QT_SETTINGS=
}"
>  OE_QMAKE_PATH_EXAMPLES =3D "${OE_QMAKE_PATH_QT_EXAMPLES}"
>  OE_QMAKE_PATH_TESTS =3D "${OE_QMAKE_PATH_QT_TESTS}"
> =20
> -PACKAGES =3D. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${=
PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
> +PACKAGES =3D. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${=
PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-stati=
cdev ${PN}-examples-dbg ${PN}-examples "
> =20
>  # extra -dbg packages
>  FILES_${PN}-qmlplugins-dbg =3D " \
> @@ -98,3 +98,10 @@ FILES_${PN}-dbg +=3D " \
>  FILES_${PN}-staticdev +=3D " \
>      ${OE_QMAKE_PATH_LIBS}/*.a \
>  "
> +
> +FILES_${PN}-examples             =3D "${datadir}/${QT_DIR_NAME}/examples=
/*"
> +
> +FILES_${PN}-examples-dbg         =3D "${datadir}/${QT_DIR_NAME}/examples=
/.debug ${datadir}/${QT_DIR_NAME}/examples/*/.debug ${datadir}/${QT_DIR_NAM=
E}/examples/*/*/.debug ${datadir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${da=
tadir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${datadir}/${QT_DIR_NAME}/exa=
mples/*/*/*/*/*/.debug"

Please wrap it to multiple lines so it's easier to see that it's just
multiple levels of .debug directories.

> +ALLOW_EMPTY_${PN}-examples =3D "1"
> +ALLOW_EMPTY_${PN}-examples-staticdev =3D "1"
> +ALLOW_EMPTY_${PN}-examples-dbg =3D "1"

Do we need to always create them?

> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 5d4334a..be6f10a 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -167,3 +167,4 @@ do_install_append() {
> =20
>  PACKAGES =3D. "${PN}-fonts "
>  FILES_${PN}-fonts =3D "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
> +FILES_${PN}-examples-staticdev   =3D "${datadir}/${QT_DIR_NAME}/examples=
/tools/plugandpaint/plugins/libpnp_basictools.a"

Shouldn't this go to qt5.inc (with * and *.a)

> diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedi=
a.inc
> index d9fdf79..e773ad1 100644
> --- a/recipes-qt/qt5/qtmultimedia.inc
> +++ b/recipes-qt/qt5/qtmultimedia.inc
> @@ -3,3 +3,7 @@ require qt5.inc
>  DEPENDS +=3D "qtdeclarative gstreamer alsa-lib "
> =20
>  INC_PR =3D "r0"
> +
> +do_install_append() {
> +    rm -f ${D}/${datadir}/${QT_DIR_NAME}/examples/multimedia/spectrum/*.=
so
> +}
> \ No newline at end of file
> --=20
> 1.7.10.4
>=20

Please use OE_QMAKE_PATH_EXAMPLES variable everywhere and add some comment =
explaining
why examples/multimedia/spectrum needs to be removed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K0M4iRgkWWXhiQ9N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGfUNQACgkQN1Ujt2V2gByTgwCdE7TCamLnDBnggQBsii9J95xm
ES8AninL5e4/8PAn54qGNu9vvFCiVaD5
=cwIV
-----END PGP SIGNATURE-----

--K0M4iRgkWWXhiQ9N--
