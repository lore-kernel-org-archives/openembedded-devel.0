Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B4E2F731C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 13:54:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a136so15165521wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eEjY5iReWJw4MwbvfXBJ6vryaEoHgZJTqo7x6K6BmmQ=;
	b=CiDZEEmGfBLCV19GXtF5Jm8QRSAyemipgThwVx842pTmjZBVa2VftW7ukDiUXoIJvX
	8vHKMFY7+VXQKeZAgSEbh3OLsqFC25fC4vVV+nP8cY4fvnL5iEAJtMbppdA36OYJ2c33
	5dqPFeIo7uhxKd2vI7RNA3uiXYDrThoFkQy3z4KHEvIfNgq0MXese2PQjEvt4kJYBoPt
	++S4+tWOIe/8yXGKQmbbfyTuc/wt4vUscAgRErmVx8gSdq1xEJ5J0ldBCGCcJfOod7oT
	EoZRFfyjabgjEZIIVhEABCuFWk4wlcO9/3VxgTfEWFSXD3EN8VcT7ri7BIZ52PXUynbi
	I0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eEjY5iReWJw4MwbvfXBJ6vryaEoHgZJTqo7x6K6BmmQ=;
	b=b98yWM3TxsuTzfHqU/0truBjDtPq1bduzUuuX+NYJguvPkXyHzuUW0mm84SBE4w+N/
	VYqs2kY8QoCpl8SlP3VnaHKVdD/fttlAOIaUI8cISyLk8qHfj50vUGlk0Pj+uPSToBuN
	Q3AJAWaK2kJZ9BSu37mhKgRUUIzZp++CHrDnEUlx6yndyTKzCSqi2lnz6lM/gTQajSnv
	U+WPgq+fweC1X9ikuihZ0rj8WIiQf8Wg7G6JYDW+lH0RZwlQxYtHJ0jD/cuuNuKuildo
	WU6AU/iitDPNenOIwV3BCRVVDgwkAC84QaAUM8aNBHDf8HAdrzweG8RsxAmfOlKltPjI
	8a0A==
X-Gm-Message-State: ALyK8tLBQpvpWs1NgrHVXviRWjVKDcA8SBLRZmumUTBslYTvz6BGaXzr0m/SdzvkUhKS3Q==
X-Received: by 10.28.148.210 with SMTP id w201mr9798796wmd.63.1464357249693;
	Fri, 27 May 2016 06:54:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i4sm19559865wjj.49.2016.05.27.06.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 06:54:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 15:54:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160527135436.GF2570@jama>
References: <1463344766-1554-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1463344766-1554-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-python][master][krogoth][PATCH] python-cryptography: fix compile issue with openssl 1.0.2h
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
X-List-Received-Date: Fri, 27 May 2016 13:54:09 -0000
X-Groupsio-MsgNum: 61634
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline

--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 15, 2016 at 01:39:26PM -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> this fixes:
>=20
> error: 'SSLv2_method' redeclared as different kind of symbol
> |  SSL_METHOD* (*SSLv2_method)(void) =3D NULL;

Can you please create similar change for jethro?
It also has 1.0.2h now and jethro is using older
python-cryptography_0.8.1.bb so it's not just cherry-pick of this.

Thanks,

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../Comment_lingering_SSLv2_symbol.patch           | 24 +++++++
>  .../Remove_SSLv2_bindings.patch                    | 75 ++++++++++++++++=
++++++
>  .../python/python-cryptography_1.1.bb              |  4 +-
>  3 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-cryptograp=
hy/Comment_lingering_SSLv2_symbol.patch
>  create mode 100644 meta-python/recipes-devtools/python/python-cryptograp=
hy/Remove_SSLv2_bindings.patch
>=20
> diff --git a/meta-python/recipes-devtools/python/python-cryptography/Comm=
ent_lingering_SSLv2_symbol.patch b/meta-python/recipes-devtools/python/pyth=
on-cryptography/Comment_lingering_SSLv2_symbol.patch
> new file mode 100644
> index 0000000..b28e7ef
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cryptography/Comment_lin=
gering_SSLv2_symbol.patch
> @@ -0,0 +1,24 @@
> +From f326e4a97cce6b9479560ce0c65ad18d54393f96 Mon Sep 17 00:00:00 2001
> +From: Cory Benfield <lukasaoz@gmail.com>
> +Date: Mon, 14 Dec 2015 15:37:46 +0000
> +Subject: [PATCH] Comment lingering SSLv2 symbol.
> +
> +---
> + src/_cffi_src/openssl/ssl.py | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
> ++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
> +@@ -421,6 +421,10 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
> + static const long Cryptography_HAS_SECURE_RENEGOTIATION =3D 1;
> + #endif
> +=20
> ++/* Cryptography now compiles out all SSLv2 bindings. This exists to all=
ow
> ++ * clients that use it to check for SSLv2 support to keep functioning as
> ++ * expected.
> ++ */
> + static const long Cryptography_HAS_SSL2 =3D 0;
> +=20
> + #ifdef OPENSSL_NO_SSL3_METHOD
> diff --git a/meta-python/recipes-devtools/python/python-cryptography/Remo=
ve_SSLv2_bindings.patch b/meta-python/recipes-devtools/python/python-crypto=
graphy/Remove_SSLv2_bindings.patch
> new file mode 100644
> index 0000000..8522325
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv=
2_bindings.patch
> @@ -0,0 +1,75 @@
> +From 90c6a53a885dd5c66992309e0af98ac554f1bb97 Mon Sep 17 00:00:00 2001
> +From: Cory Benfield <lukasaoz@gmail.com>
> +Date: Mon, 14 Dec 2015 08:35:20 +0000
> +Subject: [PATCH] Remove SSLv2 bindings.
> +
> +This commit removes bindings that allow users to set SSLv2 handshake
> +methods. These are regarded as unnecessary and out-of-date: see #2527.
> +This commit does leave in a few options that refer to SSLv2 in order to
> +avoid breaking deployments that rely on them, and in order to allow
> +users to continue to request that SSLv2 not be enabled at all in their
> +OpenSSL.
> +
> +Upstream-Status: Backport
> +
> +This fixes the compile issue after updating to openssl 1.0.2h
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/_cffi_src/openssl/ssl.py                            | 17 +---------=
-------
> + .../hazmat/bindings/openssl/_conditional.py             |  6 ------
> + 2 files changed, 1 insertion(+), 22 deletions(-)
> +
> +Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
> ++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
> +@@ -292,15 +292,6 @@ unsigned long SSL_CTX_add_extra_chain_ce
> +=20
> + /*  methods */
> +=20
> +-/* SSLv2 support is compiled out of some versions of OpenSSL.  These wi=
ll
> +- * get special support when we generate the bindings so that if they are
> +- * available they will be wrapped, but if they are not they won't cause
> +- * problems (like link errors).
> +- */
> +-const SSL_METHOD *SSLv2_method(void);
> +-const SSL_METHOD *SSLv2_server_method(void);
> +-const SSL_METHOD *SSLv2_client_method(void);
> +-
> + /*
> +  * TLSv1_1 and TLSv1_2 are recent additions.  Only sufficiently new ver=
sions of
> +  * OpenSSL support them.
> +@@ -429,14 +420,8 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
> + #else
> + static const long Cryptography_HAS_SECURE_RENEGOTIATION =3D 1;
> + #endif
> +-#ifdef OPENSSL_NO_SSL2
> ++
> + static const long Cryptography_HAS_SSL2 =3D 0;
> +-SSL_METHOD* (*SSLv2_method)(void) =3D NULL;
> +-SSL_METHOD* (*SSLv2_client_method)(void) =3D NULL;
> +-SSL_METHOD* (*SSLv2_server_method)(void) =3D NULL;
> +-#else
> +-static const long Cryptography_HAS_SSL2 =3D 1;
> +-#endif
> +=20
> + #ifdef OPENSSL_NO_SSL3_METHOD
> + static const long Cryptography_HAS_SSL3_METHOD =3D 0;
> +Index: cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_condit=
ional.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- cryptography-1.1.orig/src/cryptography/hazmat/bindings/openssl/_cond=
itional.py
> ++++ cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_condition=
al.py
> +@@ -274,12 +274,6 @@ CONDITIONAL_NAMES =3D {
> +         "TLSv1_2_client_method",
> +     ],
> +=20
> +-    "Cryptography_HAS_SSL2": [
> +-        "SSLv2_method",
> +-        "SSLv2_client_method",
> +-        "SSLv2_server_method",
> +-    ],
> +-
> +     "Cryptography_HAS_SSL3_METHOD": [
> +         "SSLv3_method",
> +         "SSLv3_client_method",
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.=
bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
> index c501787..665a4cb 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
> @@ -5,7 +5,9 @@ DEPENDS +=3D " python-cffi-native python-cffi python-enum=
34 python-six python-pyas
>  SRCNAME =3D "cryptography"
> =20
>  SRC_URI =3D "file://run-ptest \
> -           file://build_fix_openssl_1.0.1g.patch"
> +           file://build_fix_openssl_1.0.1g.patch \
> +           file://Remove_SSLv2_bindings.patch \
> +           file://Comment_lingering_SSLv2_symbol.patch"
> =20
>  SRC_URI[md5sum] =3D "dd06da41535184f48f2c8e8b74dd570f"
>  SRC_URI[sha256sum] =3D "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573=
a59a430d8cb7a32d"
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldIUZsACgkQN1Ujt2V2gBz1YgCeOpcLvqbV9xyybTOx34wX5Wvk
3uIAnR6YkKobk0hUcw7eru6dDCGRDkBS
=bGry
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--
