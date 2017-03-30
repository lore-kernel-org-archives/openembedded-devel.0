Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8A4077C99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:48:13 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so10463087wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5RZb6HiNNMQEZHgGoGzrucZp+vr4eA1+bOrUSiy4QUM=;
	b=Emt7yCLlMXXPa7lRSxRDN2XsoX60NrmOhKYbyDWvpGNtsb6ezYh4f/SPykWqni0wk0
	U4O6D29ajPWqN/UQnmDpQwxf4sMEXlCCXAe2BcJSC3s1K4UQa6KmsFsGwLY7i5i7AW/5
	7lbPwxwFP2XexruBEd3MW+JLOPS+hp2D8E1m3XDjlRb33G8eU8GXI6IBn+b+gB9bRFlf
	EjvA9MjkDYOwka+i63OTjBwUiuu+qrGfYM7O7/Ag4Z+V3WJ9j6ErD6XginqowfuepgjV
	gfWnSBxG4V8+AO35U+mE3Ilaxc4Hq9CCUHopY68Inj9aKUi0g3EwlZ038r8sSnGmV5eN
	LVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5RZb6HiNNMQEZHgGoGzrucZp+vr4eA1+bOrUSiy4QUM=;
	b=Wuib9MXrPx9rrEhU0rFG0gUeqGvz094MgsP8+TEjmH2byb3BSYnYWQ1gozAVqHR6hW
	hLdqIQ9XOrisX/Ky47C33cghRNhG8CqEcEX4JyvVUKoSAcUpGNCRo9Q2FYvpLRS7FqkJ
	Cw389v4aMnIO70wZF3NhrHZe98bzSSWNDTAi+r2U6RZx2iI6DDf8DQHBpha2pPU40SPo
	zahyUWgPZe1o/43Yj6Nv282yQedycTnu36SZJhKANzNJm+FD4sU4vi6sUWJrQT28U2Md
	cGEOgL3GfyfOG4H53jaHN3Zq+izDsz73FLGAfPbDFXNZIWvK+osiJbrbTp11JCKsm7bW
	pBTg==
X-Gm-Message-State: AFeK/H0fXolkqnm2UDsGPCALaxicT9PIby98g/AI7UqnVhNsDSfc3lXLZrKjxLTN45ECsw==
X-Received: by 10.28.225.69 with SMTP id y66mr2668125wmg.84.1490867294576;
	Thu, 30 Mar 2017 02:48:14 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 92sm2111599wrh.8.2017.03.30.02.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 02:48:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:48:13 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20170330094813.GE3060@jama>
References: <1490659416-14589-1-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <1490659416-14589-1-git-send-email-stefan@agner.ch>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-python][PATCH] python-smbus: upgrade to 3.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Mar 2017 09:48:14 -0000
X-Groupsio-MsgNum: 65983
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 05:03:36PM -0700, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Upgrade to 3.1.2 and use Yocto source mirror to follow commit f76fe46e098d
> ("i2c-tools: point SRC_URI at Yocto source mirrors") in OpenEmbedded cores
> i2c-tools recipe.
>=20
> With the upgrade to i2c-tools 3.1.2 Python 3 support has been added. To
> support Python 3 add a common recipe for all common information and one f=
or
> each supported Python version 2 and 3.

Fails here:
http://errors.yoctoproject.org/Errors/Details/138492/
http://errors.yoctoproject.org/Errors/Details/138494/

>=20
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../python/{python-smbus_3.1.1.bb =3D> python-smbus.inc}            | 8 =
+++-----
>  meta-python/recipes-devtools/python/python-smbus_3.1.2.bb         | 2 ++
>  meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb        | 2 ++
>  3 files changed, 7 insertions(+), 5 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-smbus_3.1.1.bb =3D> p=
ython-smbus.inc} (64%)
>  create mode 100644 meta-python/recipes-devtools/python/python-smbus_3.1.=
2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-smbus_3.1=
=2E2.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb b/=
meta-python/recipes-devtools/python/python-smbus.inc
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python-smbus.inc
> index df47df6..71de976 100644
> --- a/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
> @@ -2,15 +2,13 @@ SUMMARY =3D "Set of i2c tools for linux - Python module"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://smbusmodule.c;startline=3D1;endline=3D17;md=
5=3Dfa24df321a520ff8e10f203425ab9fa8"
> =20
> -SRC_URI =3D "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}=
=2Etar.bz2 \
> +SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-=
${PV}.tar.bz2 \
>  "
> -SRC_URI[md5sum] =3D "0fdbff53ebd0b8d9249256d6c56480b1"
> -SRC_URI[sha256sum] =3D "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b=
58c1e392d2db1700"
> +SRC_URI[md5sum] =3D "7104a1043d11a5e2c7b131614eb1b962"
> +SRC_URI[sha256sum] =3D "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f5892=
1c8c5b8a7860a441"
> =20
>  DEPENDS =3D "i2c-tools"
> =20
> -inherit distutils
> -
>  S =3D "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
> =20
>  do_configure_prepend() {
> diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb b/=
meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
> new file mode 100644
> index 0000000..1b95778
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
> @@ -0,0 +1,2 @@
> +inherit distutils
> +require python-smbus.inc
> diff --git a/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb b=
/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
> new file mode 100644
> index 0000000..b357bcd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
> @@ -0,0 +1,2 @@
> +inherit distutils3
> +require python-smbus.inc
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNzUXAAKCRA3VSO3ZXaA
HIZZAJ4paaKnL9zSVKQVAFR61lvOmRVtIwCgqzbAQ5kz+sQeF7Snrzpkf8R4/JE=
=U8u/
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
