Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 821E560851
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 21:55:45 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so2157733pfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=fmwWJWm/Dn0e16BTWZNna3azd3jx727uKEA++BZRSB4=;
	b=d+85K910tkEBYXZwYWt86KR1KogyvVwA4j+VTeiS/vDlkC7uCMN16OMQ0/3fM12vD9
	1s6Fd0IoXNYBOZtY/IigCerbM+BlXFC7Xx67Lz+VXcGDFkiQ3Etc+YYLFCQ8fl7B9mQV
	XJO8X+xffywWgfG7TAFPexcssMpAGVuysca/Cbc75tDA1IHVusFebggtLZVqqFahs3QQ
	KAF8kocOj13dOkTwOYi6Vh+3l24hBecMXL7/WxaBhQfkxq6nTECXtoxt5Z9Q8g3WwH8O
	akKebeICsUYtOKjOM0BoSE8Td2NWQwG7jCcNHYBoVDwMet8jD/H0/4kHCHMVcVxWgXa9
	BLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=fmwWJWm/Dn0e16BTWZNna3azd3jx727uKEA++BZRSB4=;
	b=CfMZnb0QCNOuEIBu0I4gBlceYdSpq3wkf6I3KAF61dKQVgfasFCuqj14W/xBPFJKkh
	ipe5LJ21J0al2ZEytF1AS38UTMEQ9Fq/f/TD81S0TtbVreZ3tXQsK4CTlyGunTAHUP0Q
	utSRS+isG9zzJBlS6OJ7XEJ2umnUPRcXfUFJEczXDsciXIlodH0hDvB6IUHFVrpl6xxO
	63KIUu0yKgQHg1Z1bNfXgSgHDswByrIwW8ea+cF/aQtKNWQGzjhSRiyzknYVmwWprPqj
	DWEy3vHa9OCR96YbS3boplZfd5jnx/CrmnxMchMZ6g80xyMQRM/LrAyMXKN2xbDmbsH3
	012g==
X-Gm-Message-State: ALyK8tJgHDoYAWFsEuzAwcBdEBY0S0N0nKE0pFLYI+lViMTzCIkk1VbGTAM9HcOLsOMLGw==
X-Received: by 10.98.50.1 with SMTP id y1mr30029973pfy.120.1466546146007;
	Tue, 21 Jun 2016 14:55:46 -0700 (PDT)
Received: from [10.0.0.112] ([76.126.209.57]) by smtp.gmail.com with ESMTPSA id
	o68sm11834597pfb.18.2016.06.21.14.55.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 14:55:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160621210707.5816-1-danismostlikely@gmail.com>
Date: Tue, 21 Jun 2016 14:55:40 -0700
Message-Id: <FAE90C58-12F8-490D-BFC5-FDD0164E5B70@gmail.com>
References: <20160621210707.5816-1-danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-java][PATCH v2] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Tue, 21 Jun 2016 21:55:48 -0000
X-Groupsio-MsgNum: 61918
Content-Type: multipart/signed;
	boundary="Apple-Mail=_99CEB4E2-9B96-4710-9492-BB9AD6F41CFD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_99CEB4E2-9B96-4710-9492-BB9AD6F41CFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 21, 2016, at 2:07 PM, Dan McGregor <danismostlikely@gmail.com> =
wrote:
>=20
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> elimination by default. icedtea7 is not ready for either of these
> changes, so just set the C++ standard back to gnu++98 and disable dead
> store elimination.
>=20
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
> recipes-core/icedtea/icedtea7-native.inc | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/recipes-core/icedtea/icedtea7-native.inc =
b/recipes-core/icedtea/icedtea7-native.inc
> index d624b7a..3344acb 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -17,6 +17,13 @@ PACKAGECONFIG[x11] =3D =
",--disable-headful,libx11-native xproto-native libxt-nativ
> OEMAKE_BUILD_HEADLESS_ONLY =3D "${@bb.utils.contains('PACKAGECONFIG', =
'x11', '', 'BUILD_HEADLESS_ONLY=3D1', d)}"
> CFLAGS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' =
-DHEADLESS=3Dtrue', d)}"
>=20
> +# Disable dead store elimination and set C++ standard to C++98.
> +# There are dead stores in the JVM that would be pretty hard to
> +# remove, so disable the optimisation in the compiler.
> +CFLAGS_append =3D " -fno-tree-dse"
> +CXXFLAGS_append =3D " -fno-tree-dse"
> +CXX_append =3D " -std=3Dgnu++98=E2=80=9D

this is better.

> +
> inherit native java autotools pkgconfig
>=20
> JAVA_HOME[unexport] =3D "1"
> @@ -153,6 +160,8 @@ do_configure_append() {
> 	for F in openjdk/hotspot/make/linux/makefiles/gcc.make =
openjdk/hotspot/agent/src/os/linux/Makefile ;
> 	do
> 		sed -i \
> +			-e"s|HOST_GCC =3D gcc$|HOST_GCC =3D ${CC}|" \
> +			-e"s|HOST_CPP =3D g++$|HOST_CPP =3D ${CXX}|" \
> 			-e"s|gcc\$(GCC_SUFFIX)|${CC}|" \
> 			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
> 			$F
> --
> 2.9.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_99CEB4E2-9B96-4710-9492-BB9AD6F41CFD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldpt+AACgkQuwUzVZGdMxRCWACeLxK73N1BqNcdqYnwyjeLi/1h
B8kAnAk67LL3PXAiQJdGQiArHyIBhq2/
=AoxS
-----END PGP SIGNATURE-----

--Apple-Mail=_99CEB4E2-9B96-4710-9492-BB9AD6F41CFD--
