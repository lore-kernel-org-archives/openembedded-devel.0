Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmMm-0002vw-E8
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2013 11:56:18 +0100
Received: by mail-wi0-f175.google.com with SMTP id hq12so788310wib.8
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2013 02:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RM88rWVDV99tivcoxW7fsr9Te0wQsQB6HNqK7oUjer8=;
	b=XbaABjoBq29XZxAcSfurxCeJ25zFj3oqlUwEHWuk8Ba2riTsOOFDgxKlSL9x3U/JBI
	/eNc/uGNTPy5vl6Z6py7LUzSPiA8a/Ev1hPrlANLEz6a4FlcPTWtWJNmFgMB7hnIyoF0
	CWtSdTaZA2MOjGosdfxRd5Bh1XF2M6ceZxTlO1ZQWD6gP8nolL+X9kfDtNHLgBwnBeK5
	WI3QCq3+wnlEPcAJKiFTURbgb+zl1x/VTpJKl5F6LMQgjoCAIDvE0lIDNsDMkz3jY122
	dbC1/LcA+BsAT5yar2skKofQPiAN6VmIgcf+JSV16GRO8xHuWUqlDgxWdGj8BUdDFXBA
	+LHA==
X-Received: by 10.180.106.231 with SMTP id gx7mr8806116wib.4.1359369570164;
	Mon, 28 Jan 2013 02:39:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hu8sm11467981wib.6.2013.01.28.02.39.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:39:29 -0800 (PST)
Date: Mon, 28 Jan 2013 11:39:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130128103933.GS16904@jama.palm1.palmone.com>
References: <1359141866-19402-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1359141866-19402-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org
Subject: Re: [meta-oe][PATCH] gnuradio : Use PACKAGECONFIG so users can tweak build options.
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
X-List-Received-Date: Mon, 28 Jan 2013 10:56:22 -0000
X-Groupsio-MsgNum: 42878
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bk6L21jbBNK7V1Rv"
Content-Disposition: inline

--Bk6L21jbBNK7V1Rv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 02:24:26PM -0500, Philip Balister wrote:
> I hear from users that they are fiddling with the recipe to build gnuradio
> with different options for various purposes. Start adding PACKAGECONFIG
> support to reduce user editing of the recipe.
>=20
> Currently these options are supported:
>=20
> uhd : enable support for UHD based hardware.
> grc: Build gnuradio companion.
> qtgui: Build the qtgui component.

Applied, thanks.

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 30 ++++++++++++++++=
+++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta=
-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> index e1a023f..85f52fc 100644
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> @@ -4,8 +4,17 @@ SECTION =3D  "apps"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -DEPENDS =3D "uhd gsl fftwf python alsa-lib boost cppunit \
> -           swig-native python-numpy python-pygtk orc qt4-x11-free qwt"
> +DEPENDS =3D "gsl fftwf python alsa-lib boost cppunit \
> +           swig-native python-numpy python-cheetah-native orc"
> +
> +#Available PACKAGECONFIG options are qt grc uhd
> +PACKAGECONFIG ??=3D "qtgui grc uhd"
> +
> +PACKAGECONFIG[uhd] =3D "-DENABLE_GR_UHD=3DON,-DENABLE_GR_UHD=3DOFF,uhd,"
> +PACKAGECONFIG[grc] =3D "-DENABLE_GRC=3DON,-DENABLE_GRC=3DOFF,python-pygt=
k python-cheetah, "
> +
> +PACKAGECONFIG[qtgui] =3D "-DENABLE_GR_QTGUI=3DON,-DENABLE_GR_QTGUI=3DOFF=
,qt4-x11-free qwt, "
> +
> =20
>  inherit distutils-base cmake pkgconfig
> =20
> @@ -16,8 +25,9 @@ RDEPENDS_${PN} =3D "python-core python-audio python-thr=
eading python-codecs \
>                    python-lang python-textutils python-shell python-pickl=
e \
>                    python-compiler python-pkgutil python-pydoc python-mma=
p \
>                    python-netclient python-difflib \
> -                  python-pprint python-numpy python-pygtk python-lxml \
> +                  python-pprint python-numpy  \
>                   "
> +RDEPENDS_${PN}-grc =3D "python-pygtk python-lxml python-cheetah"
> =20
>  C_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
> =20
> @@ -68,7 +78,19 @@ S=3D"${WORKDIR}/git"
>  OECMAKE_BUILDPATH =3D "${S}/build"
>  OECMAKE_SOURCEPATH =3D "${S}"
> =20
> -EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE -DENABLE_GR_QTGUI=3DON -DENA=
BLE_GR_WXGUI=3DOFF -DENABLE_GR_VIDEO_SDL=3DOFF -DQT_HEADERS_DIR=3D${STAGING=
_INCDIR}/qt4 -DQT_QTCORE_INCLUDE_DIR=3D${STAGING_INCDIR}/qt4/QtCore -DQT_LI=
BRARY_DIR=3D${STAGING_LIBDIR} -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDI=
R}/libQtCore.so -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtGui.so =
-DENABLE_GR_FCD=3DOFF -DIMPORT_EXECUTABLES=3D${S}/gr-vocoder/lib/generate_c=
odebook.txt"
> +EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
> +                 -DENABLE_GR_FCD=3DOFF \
> +                 -DENABLE_GR_WXGUI=3DOFF \
> +                 -DENABLE_GR_VIDEO_SDL=3DOFF \
> +                 -DIMPORT_EXECUTABLES=3D${S}/gr-vocoder/lib/generate_cod=
ebook.txt \
> +                 -DQT_HEADERS_DIR=3D${STAGING_INCDIR}/qt4 \
> +                 -DQT_QTCORE_INCLUDE_DIR=3D${STAGING_INCDIR}/qt4/QtCore \
> +                 -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
> +                 -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtCo=
re.so \
> +                 -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtGui=
=2Eso \
> +"
> +
> +inherit distutils-base cmake pkgconfig
> =20
>  EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
> =20
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bk6L21jbBNK7V1Rv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGVWUACgkQN1Ujt2V2gBxspwCfYwOzfekv4t1WHcwkziEjoZAb
cH4AniMuitEvgkwXWdYLHjE1SJR74Dr5
=DU9E
-----END PGP SIGNATURE-----

--Bk6L21jbBNK7V1Rv--
