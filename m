Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LrNXI-0005MI-IW
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 04:29:12 +0200
Received: by wa-out-1112.google.com with SMTP id n7so1464719wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 19:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=6VCTtLKMYsuVIPjoNpDsW7GCMpARftTIMzIX4jP1vCg=;
	b=FCgWL6wUngQMVjzktPO64PuP3mbsm2pyqDIURDY5U4Qj+ct8F+2U8DkupAQXabHbiG
	o9krlAbE5GNhwVLACt99DQhxJfkkXVCreZutS6VUOg2CNCVgoVXLW8wLDPFupEPsgzo3
	+Og0lNd8+clxY6ZmznaOCyg1Chh+X6mZWrBsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=euE+MDp5FyKkQHOyrl4jzk6zMZV6XPEOyqAOCPK4WnyzZYOyi06sDYcvKMVPZHRkqG
	syF+Z6yuS6VVvqvom0TGXIv0gveH6rXHc9FHf2NnseWa2dCOOuzbEdjExQ7wJz7cmP6r
	to77uHyNcw2cMFFZXXuysFn9Yrxs5VrqRgi5k=
Received: by 10.114.159.17 with SMTP id h17mr425565wae.197.1239157568011;
	Tue, 07 Apr 2009 19:26:08 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id v25sm7665522wah.51.2009.04.07.19.26.06
	(version=SSLv3 cipher=RC4-MD5); Tue, 07 Apr 2009 19:26:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Apr 2009 19:25:59 -0700
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <20090407170655.GG2195@smtp.west.cox.net>
In-Reply-To: <20090407170655.GG2195@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200904071926.04783.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.146.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123]	SRC_URI to use ${GNU_MIRROR}
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
X-List-Received-Date: Wed, 08 Apr 2009 02:29:12 -0000
X-Groupsio-MsgNum: 9211
Content-Type: multipart/signed; boundary="nextPart3485104.IIgH6SJeRk";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3485104.IIgH6SJeRk
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 07 April 2009 10:06:55 Tom Rini wrote:
> gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123] SRC_URI to use ${GNU_MIRROR}=
 and update checksums.ini
>  This fixes a big problem with 4.3.3 as it wasn't using ftp.gnu.org but
>  an alternate mirror that's gone away.  Since I had to fix one I noticed
>  others not calling ${GNU_MIRROR} but ftp.gnu.org.  Also a few weren't
>  using ${PV}, so use that too.
>=20
> ---
>  conf/checksums.ini        |   20 ++++++++++----------
>  recipes/gcc/gcc-4.1.0.inc |    2 +-
>  recipes/gcc/gcc-4.1.1.inc |    2 +-
>  recipes/gcc/gcc-4.1.2.inc |    2 +-
>  recipes/gcc/gcc-4.2.1.inc |    2 +-
>  recipes/gcc/gcc-4.2.2.inc |    2 +-
>  recipes/gcc/gcc-4.2.3.inc |    2 +-
>  recipes/gcc/gcc-4.2.4.inc |    2 +-
>  recipes/gcc/gcc-4.3.1.inc |    2 +-
>  recipes/gcc/gcc-4.3.2.inc |    2 +-
>  recipes/gcc/gcc-4.3.3.inc |    2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2a119dd..c416e16 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -6906,15 +6906,15 @@ sha256=3D38a9a01e195000976dcd04ec854c398478ada839=
510b1de384ffbd5f99791bdc
>  md5=3Da659b8388cac9db2b13e056e574ceeb0
>  sha256=3D37b3286c2bfb68da9df983f60721f868e29897f7a426306748fee93b25c5fb61
> =20
> -[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2]
>  md5=3D88785071f29ed0e0b6b61057a1079442
>  sha256=3D1159457a0e4c054b709547ae21ff624aebab2033e0d9e5bf46c9cf88b1970606
> =20
> -[http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2]
>  md5=3Dad9f97a4d04982ccf4fd67cb464879f3
>  sha256=3D985cbb23a486570a8783395a42a8689218f5218a0ccdd6bec590eef341367bb7
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2]
>  md5=3Da4a3eb15c96030906d8494959eeda23c
>  sha256=3Dcfc0efbcc6fcde0d416a32dfb246c9df022515a312683fac412578c4fd09a9bc
> =20
> @@ -6922,23 +6922,23 @@ sha256=3Dcfc0efbcc6fcde0d416a32dfb246c9df022515a3=
12683fac412578c4fd09a9bc
>  md5=3Dac6d19831220c4aeef4475492725486f
>  sha256=3D98bdb26cd2644f2290e34453d9115b88bcff940bd1feb88db5a0fc557ec0ea5e
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.1/gcc-4.2.1.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.1/gcc-4.2.1.tar.bz2]
>  md5=3Dcba410e6ff70f7d7f4be7a0267707fd0
>  sha256=3Dca0a12695b3bccfa8628509e08cb9ed7d8ed48deff0a299e4cb8de87d2c1fced
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.2/gcc-4.2.2.tar.bz2]
>  md5=3D7ae33781417a35a2eb03ee098a9f4490
>  sha256=3D673b85d780a082c014ded4ac11f8269a3fe893b4dbb584d65b8602d50b3872b1
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.3/gcc-4.2.3.tar.bz2]
>  md5=3Def2a4d9991b3644115456ea05b2b8163
>  sha256=3D5df9a267091eea09179651ad2a2302fe99f780ac7e598278e7f47b2339fa2e80
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2]
>  md5=3Dd79f553e7916ea21c556329eacfeaa16
>  sha256=3Dafba845e2d38547a63bd3976e90245c81ea176786f9e6966339c6d3761f1133a
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.1/gcc-4.3.1.tar.bz2]
>  md5=3D4afa0290cc3a41ac8822666f1110de98
>  sha256=3D66596b80995f88cb66aaaf937598df7a9af10cc06799c3a7a64879e20b552fd5
> =20
> @@ -6946,11 +6946,11 @@ sha256=3D66596b80995f88cb66aaaf937598df7a9af10cc0=
6799c3a7a64879e20b552fd5
>  md5=3D5dfac5da961ecd5f227c3175859a486d
>  sha256=3Dbfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.2/gcc-4.3.2.tar.bz2]
>  md5=3D5dfac5da961ecd5f227c3175859a486d
>  sha256=3Dbfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165
> =20
> -[ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.3.3/gcc-4.3.3.tar.bz2]
> +[ftp://ftp.gnu.org/gnu/gcc/gcc-4.3.3/gcc-4.3.3.tar.bz2]
>  md5=3Dcc3c5565fdb9ab87a05ddb106ba0bd1f
>  sha256=3D309f614a3c7fee88edc4928ff17185a19533949a1642ccf776e87d86303704de
> =20
> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
> index e12f93c..5cf2687 100644
> --- a/recipes/gcc/gcc-4.1.0.inc
> +++ b/recipes/gcc/gcc-4.1.0.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -SRC_URI =3D "http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.0/gcc-4.1.0.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://arm-nolibfloat.patch;patch=3D1 \
>  	file://arm-softfloat.patch;patch=3D1 \
>  	file://zecke-xgcc-cpp.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
> index ac8a4a8..22c20ce 100644
> --- a/recipes/gcc/gcc-4.1.1.inc
> +++ b/recipes/gcc/gcc-4.1.1.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "http://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://110-arm-eabi.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
> index 614e2bb..7ffb9ce 100644
> --- a/recipes/gcc/gcc-4.1.2.inc
> +++ b/recipes/gcc/gcc-4.1.2.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.2/gcc-4.1.2.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://110-arm-eabi.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
> index 16e5b8f..920805b 100644
> --- a/recipes/gcc/gcc-4.2.1.inc
> +++ b/recipes/gcc/gcc-4.2.1.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://103-uclibc-conf-noupstream.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
> index 0f4de3c..f587812 100644
> --- a/recipes/gcc/gcc-4.2.2.inc
> +++ b/recipes/gcc/gcc-4.2.2.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://103-uclibc-conf-noupstream.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
> index 7726030..35d8cc6 100644
> --- a/recipes/gcc/gcc-4.2.3.inc
> +++ b/recipes/gcc/gcc-4.2.3.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://103-uclibc-conf-noupstream.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
> index b21569b..085f241 100644
> --- a/recipes/gcc/gcc-4.2.4.inc
> +++ b/recipes/gcc/gcc-4.2.4.inc
> @@ -2,7 +2,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://100-uclibc-conf.patch;patch=3D1 \
>  	file://103-uclibc-conf-noupstream.patch;patch=3D1 \
>  	file://200-uclibc-locale.patch;patch=3D1 \
> diff --git a/recipes/gcc/gcc-4.3.1.inc b/recipes/gcc/gcc-4.3.1.inc
> index cdab6dc..132bbe7 100644
> --- a/recipes/gcc/gcc-4.3.1.inc
> +++ b/recipes/gcc/gcc-4.3.1.inc
> @@ -6,7 +6,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-c++-builtin-redecl.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-ia64-libunwind.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-java-nomulti.patch;patch=3D1;pnum=3D0 \
> diff --git a/recipes/gcc/gcc-4.3.2.inc b/recipes/gcc/gcc-4.3.2.inc
> index aeb3477..e053ba2 100644
> --- a/recipes/gcc/gcc-4.3.2.inc
> +++ b/recipes/gcc/gcc-4.3.2.inc
> @@ -6,7 +6,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "ftp://ftp.gnu.org/pub/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-c++-builtin-redecl.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-ia64-libunwind.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-java-nomulti.patch;patch=3D1;pnum=3D0 \
> diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
> index 4bed0e4..860c96c 100644
> --- a/recipes/gcc/gcc-4.3.3.inc
> +++ b/recipes/gcc/gcc-4.3.3.inc
> @@ -6,7 +6,7 @@ require gcc-common.inc
> =20
>  DEPENDS =3D "mpfr gmp"
> =20
> -SRC_URI =3D "http://gcc.releasenotes.org/releases/gcc-${PV}/gcc-${PV}.ta=
r.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>  	file://fedora/gcc43-c++-builtin-redecl.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-ia64-libunwind.patch;patch=3D1;pnum=3D0 \
>  	file://fedora/gcc43-java-nomulti.patch;patch=3D1;pnum=3D0 \
> --=20
> 1.5.6.3
>=20
Acked-by: Khem Raj <raj.khem@gmail.com>
=2D-=20
Khem Raj

--nextPart3485104.IIgH6SJeRk
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkncCzkACgkQHnJKy6V6em6IoQCeIWhwUdA1y+fGvgQ7aKZvOUz3
Og8AoKzkqbRflzGXhc6q/O+d7AsrrCPk
=iRU3
-----END PGP SIGNATURE-----

--nextPart3485104.IIgH6SJeRk--
