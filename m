Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC0756B207
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 19:08:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6HJ86ko006866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 12:08:06 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Jul 2013 12:08:06 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 32A067FE4;
	Wed, 17 Jul 2013 15:08:05 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 17F91410DF; Wed,
	17 Jul 2013 15:08:05 -0400 (EDT)
Date: Wed, 17 Jul 2013 15:08:05 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130717190804.GB31259@windriver.com>
References: <1374042294-7344-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1374042294-7344-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cyrus-sasl: several fixes
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
X-List-Received-Date: Wed, 17 Jul 2013 19:08:06 -0000
X-Groupsio-MsgNum: 45395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[PATCH] cyrus-sasl: several fixes] On 13.07.17 (Wed 14:24) rongqing.li@win=
driver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. Fix hardcoded libdir
> 2. configure cyrus-sasl based on PACKAGECONFIG
> 3. create user by inherit useradd
> 4. add -fPIC to CFLAG to fix a building failure, the cause as below:
>         ld: ../sasldb/.libs/libsasldb.a(db_berkeley.o): relocation R_X86_=
64_32S against
>         `.rodata' can not be used when making a shared object; recompile =
with -fPIC
>         ../sasldb/.libs/libsasldb.a(db_berkeley.o): could not read symbol=
s: Bad value
>=20
>     Further investigation shows Upstream chose a strange way to keep comp=
atible
>     with certain versions of automake.
>=20
>         --- a/sasldb/Makefile.am
>         +++ b/sasldb/Makefile.am
>         @@ -1,6 +1,6 @@
>          # Makefile.am for the SASLdb library
>          # Rob Siemborski
>         -# $Id: Makefile.am,v 1.28 2005/04/11 05:09:31 shadow Exp $
>         +# $Id: Makefile.am,v 1.29 2005/05/07 04:14:56 shadow Exp $
>          # Copyright (c) 2000 Carnegie Mellon University.  All rights res=
erved.
>          #
>          # Redistribution and use in source and binary forms, with or wit=
hout
>         @@ -62,7 +62,7 @@ libsasldb_la_LIBADD =3D $(SASL_DB_BACKEND)
>          libsasldb_a_SOURCES =3D
>          EXTRA_libsasldb_a_SOURCES =3D
>=20
>         -libsasldb.a: libsasldb.la $(LOCAL_SASL_DB_BACKEND_STATIC)
>         -       $(AR) cru .libs/$@ $(LOCAL_SASL_DB_BACKEND_STATIC)
>         +libsasldb.a: libsasldb.la $(SASL_DB_BACKEND_STATIC)
>         +       $(AR) cru .libs/$@ $(SASL_DB_BACKEND_STATIC)

This is ... odd.  I'm not sure how this relates to the comment below,
but your solution seems sound.

>=20
>     that snippet of Makefile rule made libsasldb.a built twice, one with
>     -fPIC, other without -fPIC. if no -fPIC library follow behind, this e=
rror
>     will appear. so we enable -fPIC no matter whatever objects are built.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |   32 ++++++++++++++=
+++---
>  .../cyrus-sasl/files/Fix-hardcoded-libdir.patch    |   25 +++++++++++++++
>  2 files changed, 52 insertions(+), 5 deletions(-)
>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/Fix-=
hardcoded-libdir.patch
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 4311540..4dac450 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -5,21 +5,40 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3f55e0974e3d6db00ca6f57f2d206=
396"
> =20
>  SRC_URI =3D "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
> -	   file://avoid-to-call-AC_TRY_RUN.patch"
> +	   file://avoid-to-call-AC_TRY_RUN.patch \
> +	   file://Fix-hardcoded-libdir.patch"=20
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig useradd
> =20
>  EXTRA_OECONF +=3D "--with-dblib=3Dberkeley \
>                   --with-bdb-libdir=3D${STAGING_LIBDIR} \
>                   --with-bdb-incdir=3D${STAGING_INCDIR} \
> -                 --without-pam --without-opie --without-des \
> +                 --with-bdb=3Ddb-5.3 \
> +                 --enable-login \
> +                 --with-plugindir=3D"${libdir}/sasl2/" \

I'm not sure I expected any of these changes based on your commit log,
though.  Well, moving --with/out-pam/opie/des into PACKAGECONFIG
variables, yes, but not --with-bdb/--enable-login/--with-plugindir.  Can
you comment on those as well?

>                   andrew_cv_runpath_switch=3Dnone"
> =20
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG =3D "ntlm \
> +        ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
> +        ${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> +        "

Shouldn't you be checking the other values in DISTRO_FEATURES as well?
And is ntlm a given?  I'm thinking you didn't necessarily mean to drop
the ?? here.

-J.

>  PACKAGECONFIG[gssapi] =3D "--enable-gssapi=3Dyes,--enable-gssapi=3Dno,kr=
b5,"
> +PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam,"
> +PACKAGECONFIG[opie] =3D "--with-opie,--without-opie,opie,"
> +PACKAGECONFIG[des] =3D "--with-des,--without-des,,"
> +PACKAGECONFIG[ldap] =3D "--with-ldap=3D${STAGING_LIBDIR} --enable-ldapdb=
,--without-ldap --disable-ldapdb,openldap,"
> +PACKAGECONFIG[ntlm] =3D "--with-ntlm,--without-ntlm,,"
> +
> +CFLAGS +=3D "-fPIC"
> =20
>  do_configure_prepend () {
>      rm -f acinclude.m4 config/libtool.m4
> +
> +    # make it be able to work with db 5.0 version
> +    local sed_files=3D"sasldb/db_berkeley.c utils/dbconverter-2.c"
> +    for sed_file in $sed_files; do
> +        sed -i 's#DB_VERSION_MAJOR =3D=3D 4.*#(&) || DB_VERSION_MAJOR =
=3D=3D 5#' $sed_file
> +    done
>  }
> =20
>  do_compile_prepend () {
> @@ -29,8 +48,11 @@ do_compile_prepend () {
>      cd ..
>  }
> =20
> +USERADD_PACKAGES =3D "${PN}-bin"
> +GROUPADD_PARAM_${PN}-bin =3D "--system mail"
> +USERADD_PARAM_${PN}-bin =3D "--system --home=3D/var/spool/mail -g mail c=
yrus"
> +
>  pkg_postinst_${PN}-bin () {
> -    grep cyrus /etc/passwd || adduser --disabled-password --home=3D/var/=
spool/mail --ingroup mail -g "Cyrus sasl" cyrus
>      echo "cyrus" | saslpasswd2 -p -c cyrus
>      chgrp mail /etc/sasldb2
>  }
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcod=
ed-libdir.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hard=
coded-libdir.patch
> new file mode 100644
> index 0000000..3fa8431
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/files/Fix-hardcoded-libd=
ir.patch
> @@ -0,0 +1,25 @@
> +Fix hardcoded libdir.
> +
> +Upstream-Status: Pending=20
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + plugins/Makefile.am |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/plugins/Makefile.am b/plugins/Makefile.am
> +index b00915f..25262a1 100644
> +--- a/plugins/Makefile.am
> ++++ b/plugins/Makefile.am
> +@@ -62,7 +62,7 @@ plugindir =3D @plugindir@
> +=20
> + common_sources =3D plugin_common.c plugin_common.h
> +=20
> +-sasldir =3D $(prefix)/lib/sasl2
> ++sasldir =3D $(libdir)/sasl2
> + sasl_LTLIBRARIES =3D @SASL_MECHS@
> + EXTRA_LTLIBRARIES =3D libplain.la libanonymous.la libkerberos4.la libcr=
ammd5.la \
> + 	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.=
la \
> +--=20
> +1.7.4.1
> +
--=20
-Joe MacDonald.
:wq

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHm65QACgkQPN8S4W6ZZnfpIACfXbEgiHNC3/FH062GSd4PheV/
7zkAni0LRLsx+XfYXZu2F6LBnQfbEgf3
=thhS
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
