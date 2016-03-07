Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6C98460761
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:05:26 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so105347413wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BgcjUiwF/iDyl90kE0ELkvyWvS90r+gYtqIEtmNJrwo=;
	b=jSXt65z4lEgXDmihIrdRa7DSCfeibdY0sw9QU/y4pUoDiEhxpY8RJZaCZZskuyDbky
	XQhTLqUhyDa55XRRpm5Dh9Yfy6tXmEuFr+DBpTcc9eChUXq25RVTqggXtISQbF68SoNj
	ObqslhUHrrfodkfPy3q376phG4OEoJcUXUEjI2mSbgNA2KF9KD5SVgtoU+lCr9NuoiPJ
	Cpt1HxZ257rbzvyj5wqwedG4p8Z4XgEzOvJMoO25KYUhgV1FmfTkEKsPO+18aRx+IBEs
	WbU/aWzCMbzzEd7R5PfI8MtwyKY0SHVU2B63FLTdmZlHtDX6YgnyKc2tTOpSHQCFsVvb
	NvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BgcjUiwF/iDyl90kE0ELkvyWvS90r+gYtqIEtmNJrwo=;
	b=A2TdrPe4+PbAr/pte0BBJh0zsQZpGH0XFjcfErczWQs5pZBWNBmuRVBlF91RVOplJk
	Jz6f0i+aqYvmoBQOw6pO1T4QUVQqwdCwlfL53c4ZXKnGiXEDmSLm9p4YBlU7uztrGSbQ
	f+XCGXBJwbkxFsV4rktfkGRkQB73OSk16HiJKQRBpykEISU3avwaUYdxQlukYUygfD+V
	ff3vZFkqhFF+kX9sNeuhuMF+ZdeVQjDPsCOE3knTXJ0mQUpdWZTnLJ/VQv/2kr8wdAXI
	7e4e27KI1LSe3Pwq7N9H6uFFt3NBYUx1k+MekAjU7gVoZPIuJPx3fyS6xRu4ME1fd6OF
	gNpQ==
X-Gm-Message-State: AD7BkJJ3ZuSSkP9lmbZKaeiWWuN0nymTc8kP5uPc1xl/+0bwZuGRppvx+3Mnan84ZyGxlQ==
X-Received: by 10.194.223.104 with SMTP id qt8mr22348202wjc.11.1457352327334; 
	Mon, 07 Mar 2016 04:05:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	av3sm17657190wjc.44.2016.03.07.04.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 04:05:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Mar 2016 13:07:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160307120754.GC2549@jama>
References: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: Re: [meta-python][jethro][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Mon, 07 Mar 2016 12:05:27 -0000
X-Groupsio-MsgNum: 60362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline

--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 05, 2016 at 08:54:57AM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site=
-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>=20
> disable using SSLv2_method if not supported in openssl. This is now the c=
ase
> with the advent of CVE-2016-0800

Doen't apply cleanly in fido-next, can you send version for fido
separately?

>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++=
++++++
>  .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/d=
ont_try_build_with_SSLv2_when_it_is_not_available.patch
>=20
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try=
_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devt=
ools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_availa=
ble.patch
> new file mode 100644
> index 0000000..526c23f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_=
with_SSLv2_when_it_is_not_available.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Backport
> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63f=
d35fa8d1db5b
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
> + extern const char *SSL_alert_desc_string_long(int);
> +=20
> ++#ifndef OPENSSL_NO_SSL2
> + %rename(sslv2_method) SSLv2_method;
> + extern SSL_METHOD *SSLv2_method(void);
> ++#endif
> + %rename(sslv3_method) SSLv3_method;
> + extern SSL_METHOD *SSLv3_method(void);
> + %rename(sslv23_method) SSLv23_method;
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.b=
b b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> index ff6203f..7dfa8d8 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db0e1f0b7d0ce8a=
62c18b1287b991800e"
> =20
>  SRC_URI =3D "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-=
${PV}.tar.gz \
>             file://0001-setup.py-link-in-sysroot-not-in-host-directories.=
patch \
> -           file://0001-M2Crypto-Error-fix.patch"
> +           file://0001-M2Crypto-Error-fix.patch \
> +           file://dont_try_build_with_SSLv2_when_it_is_not_available.pat=
ch"
> =20
>  SRC_URI[md5sum] =3D "f93d8462ff7646397a9f77a2fe602d17"
>  SRC_URI[sha256sum] =3D "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042=
a1c85ceca264fc0a"
> @@ -19,6 +20,7 @@ inherit setuptools
> =20
>  SWIG_FEATURES_x86-64 =3D "-D__x86_64__"
>  SWIG_FEATURES ?=3D ""
> +SWIG_FEATURES +=3D "OPENSSL_NO_SSL2"
>  export SWIG_FEATURES
> =20
>  # Get around a problem with swig, but only if the
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

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbdbxYACgkQN1Ujt2V2gByVcQCfY1fjzwjkna+vQP2KJwGcP1kt
/cgAn1QbokCOWOf1kI53OqCVNfmfdgE6
=ZFGa
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
