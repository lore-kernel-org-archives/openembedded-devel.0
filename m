Received: from mail-yh0-f46.google.com ([209.85.213.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFovK-0007qt-0z
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:53:08 +0100
Received: by mail-yh0-f46.google.com with SMTP id q15so203332yhf.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ixNuxH2a0SeYFq7A60n++6JxXHNYpDb9hS2tZzSybws=;
	b=asuW0PHirAy+osUodlynUSwKLHX14KvNNkcmLHdOcsQObXqe1tvlR0Y6tXPwXoXMGd
	xN0ljPHS5tpMediRGi2JEEHwMmGplIlZOar3mebWV7s2pTaU9j56zev1aJ2BUI2RNGGJ
	QgYMbRLC9kOd68CL2qBxHyiaIh20MACtnOgaRfppIgCUVE0kzRmpNtCsOhuB86d0u6Nf
	lMN8Qt4OLweBbKfRRurLtQp0zHMmah4QKOaqKvNYS5Ku4CGChGXT1VpKeTfHqsHXtD3A
	iR+sDUppppuly92PdcZN/9C14odu2urb09h1k989E2gq6MOvdFOc6/i2M9YOUs7wAaS9
	EENw==
X-Received: by 10.236.77.230 with SMTP id d66mr16343136yhe.182.1363192584812; 
	Wed, 13 Mar 2013 09:36:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n2sm36305749yhm.1.2013.03.13.09.36.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:36:24 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:36:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163617.GS3260@jama>
References: <1362605111-17641-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1362605111-17641-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] swig: avoid host contamination, make build deterministic
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
X-List-Received-Date: Wed, 13 Mar 2013 16:53:16 -0000
X-List-Received-Date: Wed, 13 Mar 2013 16:53:16 -0000
X-Groupsio-MsgNum: 43531
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e9fMjeYs+GPci+mg"
Content-Disposition: inline

--e9fMjeYs+GPci+mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 10:25:11PM +0100, Andreas Oberritter wrote:
> * Explicitly disable all other languages than python, which was the
>   only language listed in DEPENDS.
>=20
> * Inherit pythonnative to make it find OE's python executable.
>=20
> * Depend on libpcre in order to reliably enable Swig's regex feature.

Applied, thanks!

>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> Sorry, forgot to add [meta-oe] to the Subject line.
>=20
>  meta-oe/recipes-devtools/swig/swig.inc |   34 ++++++++++++++++++++++++++=
+-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-dev=
tools/swig/swig.inc
> index 97fc5c7..df6f780 100644
> --- a/meta-oe/recipes-devtools/swig/swig.inc
> +++ b/meta-oe/recipes-devtools/swig/swig.inc
> @@ -6,15 +6,39 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7807a628278=
4a7dde4c846626b08fc6 \
>                      file://LICENSE-UNIVERSITIES;md5=3D8ce9dcc8f7c994de4a=
408b205c72ba08"
> =20
>  SECTION =3D "devel"
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
> =20
> -DEPENDS =3D "python"
> +DEPENDS =3D "libpcre python"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> =20
> -inherit autotools
> -
> -EXTRA_OECONF =3D " --without-guile "
> +inherit autotools pythonnative
> +
> +EXTRA_OECONF =3D " \
> +	--with-python=3D${PYTHON} \
> +	--without-allegrocl \
> +	--without-android \
> +	--without-boost \
> +	--without-chicken \
> +	--without-clisp \
> +	--without-csharp \
> +	--without-d \
> +	--without-gcj \
> +	--without-go \
> +	--without-guile \
> +	--without-java \
> +	--without-lua \
> +	--without-mzscheme \
> +	--without-ocaml \
> +	--without-octave \
> +	--without-perl5 \
> +	--without-pike \
> +	--without-php \
> +	--without-python3 \
> +	--without-r \
> +	--without-ruby \
> +	--without-tcl \
> +"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e9fMjeYs+GPci+mg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqwEACgkQN1Ujt2V2gByxbQCcD2s/uH4INjZF2SqEByPI5tzz
0NAAn1XDxLPAn5AMhp9zL4MPvd/1S1Dd
=+RK5
-----END PGP SIGNATURE-----

--e9fMjeYs+GPci+mg--
