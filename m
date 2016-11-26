Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F37CC719CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:12:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so9862359wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=enOKX4T/SY7UkKfo9a1VnNfFUjMEjVhAelx9jdhcX7Q=;
	b=dbkgeshJn5eduEk1pWvoBFYziNju3EU9Ap6+9EFwsZRvpQXFPiJxzOd55ZdeIvuyMR
	fRTbEVcCnvoArZ/Wbgb7pszKkxIHDg51oS0a8GWOzGxCHzHEEkf51F7DWEAtJzurk4tD
	L5YYkXwGEN/A+8/s3+ysvP0OYyB5/CwD/gXTfdn8e2MltzTcw8fMmZ95l/ZAN9naeDwi
	+JAh3Yf80+rC3Zf5VbiEd1K6OtLcMxsA9kxTH4vYdKFVujQyhx9kOul2n8MCFeoxN2zq
	TLsbULI93s9TzJfNV4AKcEopMcjaWtM8phbVaB5kmRBct2B11Fyn2IuQc8OKfHrk3gmM
	WvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=enOKX4T/SY7UkKfo9a1VnNfFUjMEjVhAelx9jdhcX7Q=;
	b=ZIfO1b1FKx0uwQDs666yrnuwGCmMGaaM/t3NbnkRwb3h/2JOrScb4p0Z8XZVufBpCM
	U+BlE/nHZ9QovCcvE9lJl2W0QzL25ekqfCjlp+Vfw5ZKbhK5bJB31ELYmg7K1vYf7oDT
	/WjdjJ8ozRW7qOLmFSxv+2wuEf8BIswn5WhYJUBjP/VGr3SKj17JggougLVO1mZrwnKm
	+utaCx2OlEHG86i8kHqJPcxSdq6h686x4mBS6EEAtWmtz8qnVhPj6IGu3vNxq/lkorID
	bVvGzpgqo4Sin1fYxrgyb4RUOgLoVflAW0SIPD4Ho+qGIZs/uXmIwFIhUTgvMCMgFlNv
	yp8A==
X-Gm-Message-State: AKaTC03HR+PoKU/Dh40K7bPejatL1hgnGH4wSBldPrM7Tj/pg75JjVVJOjwfVQUqkVKdsw==
X-Received: by 10.28.105.81 with SMTP id e78mr10228185wmc.140.1480119129443;
	Fri, 25 Nov 2016 16:12:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ab10sm49368282wjc.45.2016.11.25.16.12.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:12:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:12:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001213.GA8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-18-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-18-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH V2 18/49] breakpad: Upgrade to latest
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
X-List-Received-Date: Sat, 26 Nov 2016 00:12:09 -0000
X-Groupsio-MsgNum: 64043
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:21:38AM -0800, Khem Raj wrote:
> Switch to using git
> Gets aarch64 support
>=20
> Define PV and use SRCPV
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../breakpad/{breakpad_svn.bb =3D> breakpad_git.bb}  | 22 ++++++++++++++=
+++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb =3D> breakpad_=
git.bb} (86%)
>=20
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/=
recipes-devtools/breakpad/breakpad_git.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> index b573ea5..c0e306c 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> @@ -13,9 +13,25 @@ inherit autotools
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SRCREV =3D "r1435"
> -SRC_URI =3D "svn://google-breakpad.googlecode.com/svn;module=3Dtrunk;pro=
tocol=3Dhttp"
> -S =3D "${WORKDIR}/trunk"
> +PV =3D "1.0+git${SRCPV}"

This is still going backwards:
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4e=
f5f_1549d20f6d:
Package version for package breakpad-dbg went backwards which would
break package feeds from (0:svn-r0.37 to
0:1.0+git0+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f6=
d-r0.0)
[version-going-backwards]

http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

> +
> +SRCREV_FORMAT =3D "breakpad_glog_gmock_gtest_protobuf_lss"
> +
> +SRCREV_breakpad =3D "2f6cb866d615d6240a18c7535c994c6bb93b1ba5"
> +SRCREV_glog =3D "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
> +SRCREV_gmock =3D "f7d03d2734759ee12b57d2dbcb695607d89e8e05"
> +SRCREV_gtest =3D "ec44c6c1675c25b9827aacd08c02433cccde7780"
> +SRCREV_protobuf =3D "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
> +SRCREV_lss =3D "1549d20f6d3e7d66bb4e687c0ab9da42c2bff2ac"
> +
> +SRC_URI =3D "git://github.com/google/breakpad;name=3Dbreakpad \
> +           git://github.com/google/glog.git;destsuffix=3Dgit/src/third_p=
arty/glog;name=3Dglog \
> +           git://github.com/google/googlemock.git;destsuffix=3Dgit/src/t=
esting;name=3Dgmock \
> +           git://github.com/google/googletest.git;destsuffix=3Dgit/src/t=
esting/gtest;name=3Dgtest \
> +           git://github.com/google/protobuf.git;destsuffix=3Dgit/src/thi=
rd_party/protobuf/protobuf;name=3Dprotobuf \
> +           git://chromium.googlesource.com/linux-syscall-support;protoco=
l=3Dhttps;destsuffix=3Dgit/src/third_party/lss;name=3Dlss \
> +"
> +S =3D "${WORKDIR}/git"
> =20
>  COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
> =20
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjTXAAKCRA3VSO3ZXaA
HG1eAJ45f/1MDfPDXxSpbkCr9+7vwUziEgCdGEcpldWAbKP2q819p7Bisgg3d+o=
=26pS
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
