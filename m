Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 04B9265D6F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:16:14 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2851576eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l099jP5LmH5FgooAppjGDC3MTssYfGa3wiHU45tL6S8=;
	b=mSibsEkPlfgaEPLUiFTunculYjh8mo2FyXbg2P6SlDgRLSwlsVnV+Iri2dfz6cP3fx
	xV1cMdkVn+Mny7UXBhchdG3euxC7pHvOAi6nAf9cuKL5HcuZf0urNDjO5trEmpAKCKAm
	6021/zmcFCktXzm0gPWjvYkVWaBzeiJkXGqWB9ILzSbCue7UY8htUnubQuEQ7F/nUHOr
	3GpETP0S99eG95v6Z7SCakGRWSAiUnDWfzrvIpcfIj7Jc57fqFoaDdEnQ0V7df61/ljO
	bMmBK+eKSP0iJ7nfZ3jUPrnKtmts97TwJkpdBaVgWFVl4YDp1vZgyq91fpEDt6socpOJ
	xs8w==
X-Received: by 10.14.218.193 with SMTP id k41mr37174086eep.16.1397985375385;
	Sun, 20 Apr 2014 02:16:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm92919140eep.12.2014.04.20.02.16.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:16:14 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:16:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091619.GW2486@jama>
References: <1397187242-25786-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397187242-25786-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libnet: update version to 1.1.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 09:16:17 -0000
X-Groupsio-MsgNum: 49304
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B8YbZbqleQryf2nq"
Content-Disposition: inline

--B8YbZbqleQryf2nq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 11:34:02AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - use doc/COPYING instead of README as the license file
> - use BPN instead of PN to fix multilib build
> - rebase the fix-endianess-test.patch

Merged, thanks.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../fix-endianess-test.patch                       |   14 ++++++++------
>  .../libnet/{libnet_1.1.5.bb =3D> libnet_1.1.6.bb}    |   10 +++++-----
>  2 files changed, 13 insertions(+), 11 deletions(-)
>  rename meta-oe/recipes-connectivity/libnet/{libnet-1.1.5 =3D> libnet-1.1=
=2E6}/fix-endianess-test.patch (80%)
>  rename meta-oe/recipes-connectivity/libnet/{libnet_1.1.5.bb =3D> libnet_=
1.1.6.bb} (57%)
>=20
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endiane=
ss-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endian=
ess-test.patch
> similarity index 80%
> rename from meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianes=
s-test.patch
> rename to meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-=
test.patch
> index 4d8697d..4f9d5a4 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test=
=2Epatch
> +++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test=
=2Epatch
> @@ -6,19 +6,21 @@ Idea from http://www.security-lists.org/lists/libnet/20=
03/03/00001.html
> =20
>  Also remove the old test from aclocal.m4.
> =20
> -Rebased for libnet-1.1.5 on 2011/04/19.
> +Rebased for libnet-1.1.6
> =20
> ---- a/configure.in	2010-11-03 00:59:21.000000000 +0100
> -+++ b/configure.in	2011-04-19 17:08:47.087712604 +0200
> -@@ -6,6 +6,7 @@
> +diff --git a/configure.in b/configure.in
> +index e54c688..e2e768e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -4,6 +4,7 @@ dnl All rights reserved.
>   dnl
>   dnl Process this file with autoconf to produce a configure script.
>  =20
>  +AC_PREREQ(2.52)
> - AC_INIT(libnet, 1.1.5)
> + AC_INIT(libnet, 1.1.6)
>   AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_=
VERSION} ...)
>   AC_CANONICAL_SYSTEM
> -@@ -39,7 +40,16 @@
> +@@ -38,7 +39,16 @@ dnl
>   dnl And some custom things
>   dnl
>  =20
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-o=
e/recipes-connectivity/libnet/libnet_1.1.6.bb
> similarity index 57%
> rename from meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
> rename to meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
> index 76959fe..0db074b 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
> @@ -3,18 +3,18 @@ SUMMARY =3D "A packet dissection and creation library"
>  HOMEPAGE =3D "https://github.com/sam-github/libnet"
>  SECTION =3D "libs"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://README;md5=3D533bea47338d490e86744c6a0c5692=
e7"
> +LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dfb43d5727b2d3d1238545f75c=
e456ec3"
>  DEPENDS =3D "libpcap"
>  # There are major API changes beween libnet v1.0 and libnet v1.1
>  PROVIDES =3D "libnet-1.1"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
>             file://fix-endianess-test.patch"
> =20
> -SRC_URI[md5sum] =3D "a9bc1d75a610efcfee200d3e28d8eb8f"
> -SRC_URI[sha256sum] =3D "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d=
8275db994496a20d"
> +SRC_URI[md5sum] =3D "710296fe424a49344e5fcc0d09e53317"
> +SRC_URI[sha256sum] =3D "d392bb5825c4b6b672fc93a0268433c86dc964e1500c279d=
c6d0711ea6ec467a"
> =20
> -S =3D "${WORKDIR}/${PN}-${PV}"
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> =20
>  inherit autotools binconfig
> =20
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

--B8YbZbqleQryf2nq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkGMACgkQN1Ujt2V2gBxhSQCcCFhte+dBDYnl06LCTrRM8gu8
FvwAnA9/5fEBX8q0UELhUvSqzG0wHfa8
=m1ZW
-----END PGP SIGNATURE-----

--B8YbZbqleQryf2nq--
