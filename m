Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC8E75CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:54:23 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ba1IV-000514-6R from Joe_MacDonald@mentor.com ;
	Wed, 17 Aug 2016 06:54:23 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Aug 2016 06:54:23 -0700
Received: by burninator (Postfix, from userid 1000)	id 0146B580578; Wed, 17
	Aug 2016 09:54:20 -0400 (EDT)
Date: Wed, 17 Aug 2016 09:54:20 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <yue.tao@windriver.com>, <yi.zhao@windriver.com>
Message-ID: <20160817135419.GA21469@mentor.com>
References: <1470643473-17129-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1470643473-17129-1-git-send-email-yi.zhao@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] squid: fix configure host contamination
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
X-List-Received-Date: Wed, 17 Aug 2016 13:54:23 -0000
X-Groupsio-MsgNum: 62690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yi,

Please include a signed-off-by and upstream-status line for patches you
contribute.

http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_R=
ecommendations

This patch seems like it's probably suitable for submitting upstream,
but I'd be content to call it inappropriate-embedded specific, if you
don't want to send it upstream.

-J.

[[oe] [meta-networking][PATCH] squid: fix configure host contamination] On =
16.08.08 (Mon 16:04) Yi Zhao wrote:

> From: Yue Tao <yue.tao@windriver.com>
>=20
> When configuring squid with --enable-esi option,
> the following error was observed:
> [snip]
> checking libxml/parser.h usability... no
> checking libxml/parser.h presence... no
> checking for libxml/parser.h... no
> configure: Failed to find libxml2 header file libxml/parser.h
> [snip]
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> [snip]
>=20
> It tried to search libxml header file in host path. Set the SYSROOT
> to avoid this host contamination.
>=20
> Signed-off-by: Yue Tao <yue.tao@windriver.com>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../squid/files/set_sysroot_patch.patch            | 26 ++++++++++++++++=
++++++
>  .../recipes-daemons/squid/squid_3.5.20.bb          |  6 +++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/squid/files/set_sysro=
ot_patch.patch
>=20
> diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patc=
h.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.pat=
ch
> new file mode 100644
> index 0000000..68733f9
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
> @@ -0,0 +1,26 @@
> +diff --git a/configure.ac.old b/configure.ac
> +index 54eda73..874f48e 100644
> +--- a/configure.ac.old
> ++++ b/configure.ac
> +@@ -964,15 +964,15 @@ if test "x$squid_opt_use_esi" =3D "xyes" -a "x$wit=
h_libxml2" !=3D "xno" ; then
> +   dnl Find the main header and include path...
> +   AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_in=
clude], [
> +     AC_CHECK_HEADERS([libxml/parser.h], [], [
> +-      AC_MSG_NOTICE([Testing in /usr/include/libxml2])
> ++      AC_MSG_NOTICE([Testing in $SYSROOT/usr/include/libxml2])
> +       SAVED_CPPFLAGS=3D"$CPPFLAGS"
> +-      CPPFLAGS=3D"-I/usr/include/libxml2 $CPPFLAGS"
> ++      CPPFLAGS=3D"-I$SYSROOT/usr/include/libxml2 $CPPFLAGS"
> +       unset ac_cv_header_libxml_parser_h
> +-      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include=3D"-I/=
usr/include/libxml2"], [
> +-        AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
> +-        CPPFLAGS=3D"-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
> ++      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include=3D"-I$=
SYSROOT/usr/include/libxml2"], [
> ++        AC_MSG_NOTICE([Testing in $SYSROOT/usr/local/include/libxml2])
> ++        CPPFLAGS=3D"-I$SYSROOT/usr/local/include/libxml2 $SAVED_CPPFLAG=
S"
> +         unset ac_cv_header_libxml_parser_h
> +-        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include=3D"-=
I/usr/local/include/libxml2"], [
> ++        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include=3D"-=
I$SYSROOT/usr/local/include/libxml2"], [
> +           AC_MSG_NOTICE([Failed to find libxml2 header file libxml/pars=
er.h])
> +         ])
> +       ])
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta=
-networking/recipes-daemons/squid/squid_3.5.20.bb
> index f26aebe..3ce195a 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "http://www.squid-cache.org/Versions/v${MAJ=
_VER}/${MIN_VER}/${BPN}-${P
>             file://squid-use-serial-tests-config-needed-by-ptest.patch \
>             file://run-ptest \
>             file://volatiles.03_squid \
> +           file://set_sysroot_patch.patch \
>  "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc492e2d6d32ec5c1aad0e0609a141=
ce9 \
> @@ -48,6 +49,11 @@ EXTRA_OECONF +=3D "--with-default-user=3Dsquid --enabl=
e-auth-basic=3D'${BASIC_AUTH}'"
>  export BUILDCXXFLAGS=3D"${BUILD_CXXFLAGS}"
> =20
>  TESTDIR =3D "test-suite"
> +
> +do_configure_prepend() {
> +    export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
> +}
> +
>  do_compile_ptest() {
>      oe_runmake -C ${TESTDIR} buildtest-TESTS
>  }
> --=20
> 2.7.4
>=20
--=20
-Joe MacDonald.
:wq

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXtGyIAAoJEEn8ffcsOfaWaokH/1/IsoppCHyNvlS/gvy0fJIE
lnoPMqWXWQ6YMvBlSYo3En8UsuctMBkwLwty9bqRPRzvXwHU+/8/Vt0lFumdZ7Ux
saPhQ1MiIEvTDReg8Wk+ksrWQdGMRn9+umws7+dLmhFJd0oul20Ss/KEwRfZ42jL
Zz1mppJYBb8Gto1fJ0an6F9Qqp9LXIK/F7Sw/wOzedYh2OCyTPVDe4RcVfV8d29u
dcKQCYXa5X6lKwdZlZM/0jogXWS19zJN7FJ/qYz/fmDK9Rgi0xkT/EUfcFcAZVRt
yt3GW1tUA9T6QPJAD+47yEb0cjoZ3bYmeJAbRv+yXfCUdmBgwEg27lsklC+e6+A=
=uykF
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
