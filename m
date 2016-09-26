Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B4EA16022E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:38:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l132so12435884wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QBRqzUBG/0QI0uuEQOUDU2zTGD0ZGD6Qg7yv1w9siJY=;
	b=JMXWC9CxtpbasvLAwS36LG8fDYqTaXeu7HuYm8HdrpkV1H7kFK6ZqIz6V9GH/TBtTZ
	uBHQEpZNuinPI8Dw0riZEloP5c4nr1fIqRi1lOnKm81z85Vjk/78imc+eVQNZWhRzZ2v
	msRGckzpcHWfyVq5sWvfUexojGfPNEFG6GNGucGgcV57SyMj8uc68ejogoHZXbH6Q3KN
	EZFzgUorfjOSoxcODR3xNseCwkcyu8eCsTHbE9Qm4bY/hgy0Hq1J8FTieK/s6E7RU7pd
	FS2hsQvYR7Jh+enZzFuTopb9RWeCQUTjiuT7s2y6xmxuk8U3u+dk12C590u7f2diEF1j
	KgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QBRqzUBG/0QI0uuEQOUDU2zTGD0ZGD6Qg7yv1w9siJY=;
	b=N1hgGrN8OgDYAphH/XabrFe78+8l9DoJ330hoikpe+UvO18aaxcJ6M1ABnxBgxq2CK
	fSp/myVXBnjMRZq2MrFA9UPR/827og1QJ0nYLEVGI+kiL6oy+RhpWNE4lnnLIpaZ++Mm
	W63NbSkhHWI35osat8/5B20QeD/bQr5UqcdaoL3AVOYoxeRo0wq8C15e2QlU0oCjbL4s
	CNx2pW7/lDzgoNSR7s0YhWOINxBSOO6TVsqtRGa0GbYscGu+wU9rN/SRkIn6518woj2v
	ikM64pBR2J7RUcBEyBhEdB1QXTB50/Ydt/GXM8ATXvlEoBSi9VOQ0GeRbVVmtjd8s9ud
	A3ag==
X-Gm-Message-State: AA6/9Rnu49klG6+GSD35a8pbMT8o6qJLRArpAEQEGFeQZFTaSJefXAr577ukdLiThkE4mA==
X-Received: by 10.28.189.197 with SMTP id n188mr11874503wmf.116.1474871939249; 
	Sun, 25 Sep 2016 23:38:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	q142sm9474293wmd.4.2016.09.25.23.38.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Sep 2016 23:38:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Sep 2016 08:39:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160926063903.GC2631@jama>
References: <1474649164-7513-1-git-send-email-roman.alyautdin@rtsoft.de>
MIME-Version: 1.0
In-Reply-To: <1474649164-7513-1-git-send-email-roman.alyautdin@rtsoft.de>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-networking][PATCH] mbedtls: separate general .inc and version-specific recipe
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
X-List-Received-Date: Mon, 26 Sep 2016 06:38:59 -0000
X-Groupsio-MsgNum: 63284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline

--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 07:46:04PM +0300, Roman Alyautdin wrote:
> The patch proposes to separate general part of mbedtls recipe into .inc
> and introduces mbedtls_1.3.10.bb that requires mbedtls.inc. This will
> help to add another versions without duplication of general stuff
>=20
> Signed-off-by: Roman Alyautdin <roman.alyautdin@rtsoft.de>

I don't know why it was sent 4 times, but there is upgrade to
1.3.17 already in master-next:

OE @ ~/meta-openembedded $ git log --pretty=3Dfuller meta-networking/recipe=
s-connectivity/mbedtls/
commit c5af6e71907714821c0edfb23085f0a700b1118d
Author:     Wenzong Fan <wenzong.fan@windriver.com>
AuthorDate: Wed Sep 14 01:49:13 2016 -0400
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Sep 26 08:29:34 2016 +0200

    mbedtls: upgrade to 1.3.17

Which version do you need that it requires adding .inc instead of adding su=
ch version to meta-networking?

> ---
>  .../recipes-connectivity/mbedtls/mbedtls.inc       |   35 ++++++++++++++=
++++++
>  .../recipes-connectivity/mbedtls/mbedtls_1.3.10.bb |   35 +-------------=
------
>  2 files changed, 36 insertions(+), 34 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls.=
inc
>=20
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc b/m=
eta-networking/recipes-connectivity/mbedtls/mbedtls.inc
> new file mode 100644
> index 0000000..8bb6855
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls.inc
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> +DESCRIPTION =3D "mbedtls is a lean open source crypto library          \
> +for providing SSL and TLS support in your programs. It offers        \
> +an intuitive API and documented header files, so you can actually    \
> +understand what the code does. It features:                          \
> +                                                                     \
> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> +   Camellia and XTEA                                                 \
> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> +   ECDSA and ECDH                                                    \
> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> + - Abstraction layers for ciphers, hashes, public key operations,    \
> +   platform abstraction and threading                                \
> +"
> +
> +HOMEPAGE =3D "https://polarssl.org"
> +BUGTRACKER =3D "https://github.com/polarssl/polarssl/issues"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +SECTION =3D "libdevel"
> +
> +SRC_URI =3D "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
> +
> +
> +DEPENDS =3D "openssl"
> +RDEPENDS_${PN} +=3D "libcrypto"
> +PROVIDES +=3D "polarssl"
> +RPROVIDES_${PN} =3D "polarssl"
> +EXTRA_OECMAKE =3D "-DUSE_SHARED_POLARSSL_LIBRARY=3Don -DLIB_INSTALL_DIR=
=3D${baselib}"
> +
> +inherit cmake
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
> index d5c7afe..3f1c1fe 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
> @@ -1,37 +1,4 @@
> -SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> -DESCRIPTION =3D "mbedtls is a lean open source crypto library          \
> -for providing SSL and TLS support in your programs. It offers        \
> -an intuitive API and documented header files, so you can actually    \
> -understand what the code does. It features:                          \
> -                                                                     \
> - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> -   Camellia and XTEA                                                 \
> - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> - - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> -   ECDSA and ECDH                                                    \
> - - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> - - Abstraction layers for ciphers, hashes, public key operations,    \
> -   platform abstraction and threading                                \
> -"
> -
> -HOMEPAGE =3D "https://polarssl.org"
> -BUGTRACKER =3D "https://github.com/polarssl/polarssl/issues"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -SECTION =3D "libdevel"
> -
> -SRC_URI =3D "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
> +require mbedtls.inc
> =20
>  SRC_URI[md5sum] =3D "19ebbc96feceb430ad958dfe89cb633f"
>  SRC_URI[sha256sum] =3D "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8=
995094aa6adb407e"
> -
> -DEPENDS =3D "openssl"
> -RDEPENDS_${PN} +=3D "libcrypto"
> -PROVIDES +=3D "polarssl"
> -RPROVIDES_${PN} =3D "polarssl"
> -EXTRA_OECMAKE =3D "-DUSE_SHARED_POLARSSL_LIBRARY=3Don -DLIB_INSTALL_DIR=
=3D${baselib}"
> -
> -inherit cmake
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

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfowoYACgkQN1Ujt2V2gBxksACdFIbkrVEZPakanI6wmZVAsDfi
AbIAoKHqzK2RbyDR5WV3W+e3+9nZ4xBg
=naV6
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
