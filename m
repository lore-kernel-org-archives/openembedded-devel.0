Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 740BB6A5B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:24:18 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hj6so2594227wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J+TpwsiolYALxCf4+SXIwH1Xe+6NTmUZA7qG8hEBkKY=;
	b=bcsUEGY+H0LHMIJYGWc4S55iEk5FOWldEnJLXBp3zlycqfg4FFyLGkQB4rZOjvh1f5
	c38AaPTUMzsZk+6V0vEGOwHleasFTu4zZn6iOaZaD1kOI667PzPrTJpr9/ap8JwtZSXB
	kYPdbdlOGJog9sdDhIXkUsmkoIWNM1n3kN5N8DPynl73THexl/PiXOteGyVEiRygmYiF
	hS2HwiuDrEImlcBIDPw7g0AqUqsoT9/qTpkBsYFR5cgbZ+EPLnOoKr1SgUiEDpe/lMkj
	n+DpWyy2PRLmqg2LfpdiALwddXjLl7/QFTYuw4txbP3NCuDy0CG/KnO95UEiS2TrN4hB
	l8AA==
X-Received: by 10.180.37.208 with SMTP id a16mr12622361wik.24.1370262258449;
	Mon, 03 Jun 2013 05:24:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ay7sm23057137wib.9.2013.06.03.05.24.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 05:24:17 -0700 (PDT)
Date: Mon, 3 Jun 2013 14:24:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130603122433.GB3279@jama>
References: <1369218937-26345-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1369218937-26345-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv3] gnuradio : Update recipe to build for all machines.
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
X-List-Received-Date: Mon, 03 Jun 2013 12:24:18 -0000
X-Groupsio-MsgNum: 44954
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 06:35:37AM -0400, Philip Balister wrote:
> Also updated the git repo address after recent changes in hosting.
>=20
> The recipe failed to build for machines without neon as a tune feature.
> The cmake config options have been changed so that it configures properly
> now.
>=20
> Also dropped documentation from build to work around a doc generation pro=
blem.
>=20
> Test on armv7a, x86, and x86-64.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta=
-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> index edd4615..45f4c77 100644
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> @@ -70,7 +70,7 @@ SRCREV =3D "5f69899e059e9bea58f92af61f70fc3f63825087"
>  GIT_REPO =3D "gnuradio.git"
>  GIT_BRANCH =3D "master"
> =20
> -SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};proto=
col=3Dgit \
> +SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};p=
rotocol=3Dgit \
>  "
> =20
>  S=3D"${WORKDIR}/git"
> @@ -82,21 +82,18 @@ EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
>                   -DENABLE_GR_FCD=3DOFF \
>                   -DENABLE_GR_WXGUI=3DOFF \
>                   -DENABLE_GR_VIDEO_SDL=3DOFF \
> +                 -DENABLE_SPHINX=3DOFF -DENABLE_DOXYGEN=3DOFF \

This isn't enough, it still fails to build docs in jenkins builds (see
status update email).

>                   -DIMPORT_EXECUTABLES=3D${S}/gr-vocoder/lib/generate_cod=
ebook.txt \
>                   -DQT_HEADERS_DIR=3D${STAGING_INCDIR}/qt4 \
>                   -DQT_QTCORE_INCLUDE_DIR=3D${STAGING_INCDIR}/qt4/QtCore \
>                   -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
>                   -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtCo=
re.so \
>                   -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtGui=
=2Eso \
> +                 ${@base_contains('TUNE_FEATURES', 'neon', \
> +                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', d)}=
 \
>  "
> =20
>  inherit distutils-base cmake pkgconfig
> =20
>  EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
> =20
> -# Only builds for machines with neon instructions. Problem is in upstrea=
m cmake.
> -python () {
> -    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d):
> -        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
> -}
> -
> --=20
> 1.7.11.7
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGsiwEACgkQN1Ujt2V2gBx63wCdHJxCXfjVmYn6X/I+hQRolXL5
ss4AoJRWvYJCvZJgWyHNdvdtNt3O5pVO
=hiqV
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
