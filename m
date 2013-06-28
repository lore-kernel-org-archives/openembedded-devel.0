Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA936A4D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:08:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5SF88bp002476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 08:08:08 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 08:08:06 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C109AA06C;
	Fri, 28 Jun 2013 11:08:00 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 0E7F2410DF; Fri,
	28 Jun 2013 11:08:06 -0400 (EDT)
Date: Fri, 28 Jun 2013 11:08:05 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20130628150805.GA10011@windriver.com>
References: <1372123379-20337-1-git-send-email-rongqing.li@windriver.com>
	<51CD4D0A.5070802@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51CD4D0A.5070802@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] cyrus-sasl: Avoid to call AC_TRY_RUN
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
X-List-Received-Date: Fri, 28 Jun 2013 15:08:06 -0000
X-Groupsio-MsgNum: 45238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH meta-networking] cyrus-sasl: Avoid to call AC_TRY_RUN] On =
13.06.28 (Fri 16:44) Rongqing Li wrote:

> ping

Hey Roy,

Sorry about that, I had a couple of outstanding questions I was trying
to answer for myself first.  Merged now.

-J.

>=20
> On 06/25/2013 09:22 AM, rongqing.li@windriver.com wrote:
> >From: "Roy.Li" <rongqing.li@windriver.com>
> >
> >If the gssapi libraries are compiled before cyrus-sasl, configure will c=
all
> >AC_TRY_RUN to check if gssapi libraries support SPNEGO, but calling AC_T=
RY_RUN
> >will fail on cross-compile environment.
> >
> >Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >---
> >  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |    6 ++-
> >  .../files/avoid-to-call-AC_TRY_RUN.patch           |   46 ++++++++++++=
++++++++
> >  2 files changed, 51 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/av=
oid-to-call-AC_TRY_RUN.patch
> >
> >diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.2=
6.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >index bf6f95c..4311540 100644
> >--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> >@@ -4,7 +4,8 @@ DEPENDS =3D "openssl virtual/db"
> >  LICENSE =3D "BSD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d2=
06396"
> >
> >-SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz=
 "
> >+SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz=
 \
> >+	   file://avoid-to-call-AC_TRY_RUN.patch"
> >
> >  inherit autotools pkgconfig
> >
> >@@ -14,6 +15,9 @@ EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
> >                   --without-pam --without-opie --without-des \
> >                   andrew_cv_runpath_switch=3Dnone"
> >
> >+PACKAGECONFIG ??=3D ""
> >+PACKAGECONFIG[gssapi] =3D "--enable-gssapi=3Dyes,--enable-gssapi=3Dno,k=
rb5,"
> >+
> >  do_configure_prepend () {
> >      rm -f acinclude.m4 config/libtool.m4
> >  }
> >diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-c=
all-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/avo=
id-to-call-AC_TRY_RUN.patch
> >new file mode 100644
> >index 0000000..df9fa15
> >--- /dev/null
> >+++ b/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_=
TRY_RUN.patch
> >@@ -0,0 +1,46 @@
> >+Avoid to call AC_TRY_RUN
> >+
> >+Upstream-Status: Inappropriate [configuration]
> >+
> >+Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
> >+on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
> >+
> >+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >+---
> >+ cmulocal/sasl2.m4 |   13 ++++++++++++-
> >+ 1 file changed, 12 insertions(+), 1 deletion(-)
> >+
> >+diff --git a/cmulocal/sasl2.m4 b/cmulocal/sasl2.m4
> >+index 3c2841a..a5ecf81 100644
> >+--- a/cmulocal/sasl2.m4
> >++++ b/cmulocal/sasl2.m4
> >+@@ -281,6 +281,17 @@ if test "$gssapi" !=3D no; then
> >+
> >+   cmu_save_LIBS=3D"$LIBS"
> >+   LIBS=3D"$LIBS $GSSAPIBASE_LIBS"
> >++  AC_ARG_ENABLE([spnego],
> >++              [AC_HELP_STRING([--enable-spnego=3D<DIR>],
> >++                              [enable SPNEGO support in GSSAPI librari=
es [no]])],
> >++              [spnego=3D$enableval],
> >++              [spnego=3Dno])
> >++
> >++  if test "$spnego" =3D no; then
> >++       echo "no"
> >++  elif test "$spnego" =3D yes; then
> >++       AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementatio=
n supports SPNEGO])
> >++  else
> >+   AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
> >+   AC_TRY_RUN([
> >+ #ifdef HAVE_GSSAPI_H
> >+@@ -308,7 +319,7 @@ int main(void)
> >+ 	AC_MSG_RESULT(yes) ],
> >+ 	AC_MSG_RESULT(no))
> >+   LIBS=3D"$cmu_save_LIBS"
> >+-
> >++   fi
> >+ else
> >+   AC_MSG_RESULT([disabled])
> >+ fi
> >+--
> >+1.7.10.4
> >+
> >
>=20
--=20
-Joe MacDonald.
:wq

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHNptUACgkQPN8S4W6ZZnf/cwCfQTGhkqGsbUUQfITZRblfqOIR
BMcAn1Q2wGu66twlj/lCYt8ESRGvu5s4
=3HWd
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
