Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A9E9C60721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:09:04 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so193049100wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 11:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=h3FnRJF3yqn6CvaF4qcweUX2rO4RXvOD9V0lD5m3+6g=;
	b=NV+6s37a7M1sojIl7dE5VdmnmA6qQDjX074nBmaGRQt20FpMMqHrfji8k5xjUyfUUA
	ptmK51o3qizl7KUuQlfxLA3/sdtG59bfoBEWsj5BcxoC8uxGue3WMVs2BLP9kmmIZEbR
	LHb2m8h/nK+50noiHDOB849mZUkmC5y01oyE7I2ayb8r3KnHaN0A0UFQ2WeRyqa03nEC
	gp+gVggaBTTrfZxITyZbCK1hvyQLvTtaMCmJxl/77ic7LWUg8FcbuuvB2H43VdjWkDHF
	gB6vwV6yQz7vbLUkLN6jpYUL+trCsNHM+cEhd2dI2jeCmViDWi71+tkrenG+kpJ/UpCY
	f2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=h3FnRJF3yqn6CvaF4qcweUX2rO4RXvOD9V0lD5m3+6g=;
	b=Irn9vW+aAVt7awhL1vG2YdVfNgRgITL2HDqA/nRwqSh45FNTq/rtkRIspLoKPKHPmL
	YztW5ze5IxpReYjus8tQOE1m64gXW0Bq09ZNDfUHhwk6fqf3OAef06SIghcZw8gmAXo4
	5c2resB4jFgT/vg5SqPAdn49OxAOCWG3u4wwbW1HWF0JxHSiw67C8TjvQe76piVk67Wj
	SBVv1kLEaI2fkLtW9cae1zG+TttK3R1oOQ1yhNhHqm0MycAsMxbg+1IFoGrtLxNCHt6y
	UJJdUCiEFj/qdJgEvlrhYEwknmyZQnZT7eT0g9YcabMBkuo9Ak7FMjwYB70ZY643ZC4E
	FTag==
X-Gm-Message-State: AD7BkJLQy1bevGCt6tVlvHJj3oxk5Czq1Nj7T8CTRPIhTmxQIlvrnzOUSN0SRzsgmrJfqw==
X-Received: by 10.28.10.18 with SMTP id 18mr736345wmk.64.1457550544558;
	Wed, 09 Mar 2016 11:09:04 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e127sm25262297wma.20.2016.03.09.11.09.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 11:09:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 20:11:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160309191156.GH2542@jama>
References: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1457543217-11211-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: Re: [meta-python][jethro][PATCH][V2] python-m2crypto: fix SSLv2 symbol issue
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
X-List-Received-Date: Wed, 09 Mar 2016 19:09:05 -0000
X-Groupsio-MsgNum: 60431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mXDO3udm/xYWQeMQ"
Content-Disposition: inline

--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 09:06:57AM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> missed using "-D"  for OPENSSL_NO_SSL2 swig_features.

fido version:
http://patchwork.openembedded.org/patch/117291/
needed -D as well, right?

I've pushed both to fido-next and jethro-next

>=20
> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site=
-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>=20
> disable using SSLv2_method if not supported in openssl. This is now the c=
ase
> with the advent of CVE-2016-0800
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
> index ff6203f..9daea5e 100644
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
> +SWIG_FEATURES +=3D "-DOPENSSL_NO_SSL2"
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

--mXDO3udm/xYWQeMQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgdXwACgkQN1Ujt2V2gByv/ACgoHIiETNJ3WAvWNVx7HOTsZwI
H6YAoIRzOJBGMSCNSv0LxDXAUGkQXudU
=Kg8O
-----END PGP SIGNATURE-----

--mXDO3udm/xYWQeMQ--
