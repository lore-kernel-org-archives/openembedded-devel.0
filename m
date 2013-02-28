Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBDVr-0003sN-Bh
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 01:07:49 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so1073976daj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 15:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V4kYY4/qEbJUXKHsfYH+ClYAjuxznx1M0qrfLMJyDvQ=;
	b=XQNAFqlgnrguYJsD/JlQOFjPBkl3E6e9wxa/6mITCVeowfZbyKyoGmUEhgpFYIsyL9
	5gBOX/hFbbqj6RqR+MhK6BDv/tjkXKpCZija54fdyHZACjk5FVsvdhjE8utRqN9OXNYq
	yk9TMIqdUPOSHPdK4rD//lRspV3fVZsOG7Y+8nqFAac0qY1OSVU47YX8Z39AaE/3MldG
	5ffmnDdEXRsiggor04zwaRAO4PJHSniKumALd7gTsIBphY2y8TLHEAdJiN9KOD9ok6Xg
	tnAQCdLrkLAF+K+dkL4ri5Cxq9YrB9Rf/njzDCqOCob1bXbyryhVPOYhlej3nypd6ucW
	wFig==
X-Received: by 10.68.231.70 with SMTP id te6mr11545745pbc.159.1362095482278;
	Thu, 28 Feb 2013 15:51:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm10807798pax.0.2013.02.28.15.51.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 15:51:20 -0800 (PST)
Date: Fri, 1 Mar 2013 00:51:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130228235113.GE3279@jama>
References: <1361950224-26188-1-git-send-email-schnitzeltony@googlemail.com>
	<1361950224-26188-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1361950224-26188-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] geany: fix compile by removing extra check for c++ compiler
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
X-List-Received-Date: Fri, 01 Mar 2013 00:07:49 -0000
X-Groupsio-MsgNum: 43341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline

--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 08:30:24AM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Thanks, now it fails a bit later:
| configure:17392: checking for perl >=3D 5.8.1
| configure:17399: result: 5.14.2
| configure:17403: checking for XML::Parser
| configure:17409: error: XML::Parser perl module is required for intltool

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30228_192523.log/

> ---
>  ...001-configure.ac-remove-additional-c-test.patch |   47 ++++++++++++++=
++++++
>  meta-oe/recipes-devtools/geany/geany_1.22.bb       |    6 ++-
>  2 files changed, 52 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/geany/geany/0001-configure.a=
c-remove-additional-c-test.patch
>=20
> diff --git a/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remov=
e-additional-c-test.patch b/meta-oe/recipes-devtools/geany/geany/0001-confi=
gure.ac-remove-additional-c-test.patch
> new file mode 100644
> index 0000000..5166fec
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-addit=
ional-c-test.patch
> @@ -0,0 +1,47 @@
> +From e62d5b59262ec7ffe07931790712c7e247377795 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 21 Feb 2013 09:31:31 +0100
> +Subject: [PATCH] configure.ac remove additional c++ test
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +For openembedded cross-builds CXX can contain something like:
> +
> +arm-oe-linux-gnueabi-g++  -march=3Darmv5te  -marm -mthumb-interwork --sy=
sroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qem=
uarm
> +
> +This ends up in
> +
> +configure:5582: error: No C++ compiler found. Please install a C++ compi=
ler.
> +
> +Anyway if [1] is still valid, the combination of AC_PROG_CC and AC_PROG_=
CXX
> +should thow an error message.
> +
> +[1] http://lists.gnu.org/archive/html/bug-autoconf/2010-05/msg00001.html
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure.ac |    5 -----
> + 1 files changed, 0 insertions(+), 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c37312a..742bf35 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -26,11 +26,6 @@ AC_USE_SYSTEM_EXTENSIONS
> + AC_PROG_CC
> +=20
> + AC_PROG_CXX
> +-# check for C++ compiler explicitly and fail if none is found, do this =
check
> +-# after AC_PROG_CXX has set the CXX environment variable
> +-if ! which $CXX >/dev/null 2>&1; then
> +-	AC_MSG_ERROR([No C++ compiler found. Please install a C++ compiler.])
> +-fi
> +=20
> + AC_PROG_INSTALL
> + AC_PROG_LN_S
> +--=20
> +1.7.6.5
> +
> diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recip=
es-devtools/geany/geany_1.22.bb
> index 1e56ec8..e0b5df5 100644
> --- a/meta-oe/recipes-devtools/geany/geany_1.22.bb
> +++ b/meta-oe/recipes-devtools/geany/geany_1.22.bb
> @@ -3,10 +3,14 @@ HOMEPAGE =3D "http://www.geany.org/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc107cf754550e65755c42985a5d4e=
9c9"
>  DEPENDS =3D "gtk+"
> +PR =3D "r1"
> =20
>  inherit autotools pkgconfig
> =20
> -SRC_URI =3D "http://download.geany.org/${PN}-${PV}.tar.bz2"
> +SRC_URI =3D " \
> +    http://download.geany.org/${PN}-${PV}.tar.bz2 \
> +    file://0001-configure.ac-remove-additional-c-test.patch \
> +"
>  SRC_URI[md5sum] =3D "0672077fe83e2a739aa0eaca426aacf0"
>  SRC_URI[sha256sum] =3D "901a35a7395ef10a80fb10b3ab63bae3871693a4e82d5638=
8e9521a27877577e"
> =20
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEv7XEACgkQN1Ujt2V2gBzyzQCguJaHTS1m2ikTl+gJ+YXvRMDE
mdEAn011NL6AJIcemwsa5dE5YXy/9QdA
=+Tbn
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
