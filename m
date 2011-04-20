Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCRu7-00083z-1m
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:32:51 +0200
Received: by fxm19 with SMTP id 19so316873fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=T2jTldwNC+U/FCFAFzmY0xIiBVKRWzKbKmvS1WmDhE4=;
	b=vdN+spdrDF2ElHRgLQnmfCDvWf4s9nedR4XVIXiwmrO5SUW797ZT5C4mAxV8Kfmag5
	lcaUj5oFKnT9v1UX0rMP2XTk2P49Q8WXRKD5+O1KyfwzGyRawerAfKSmzBqtl5QlMKAg
	Zigm9LgnXQr57K6OfhT/Sv891zSvPKf2+fjAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Pst73iigkB6S9BwyyVzyKHxmprIQ05kzaj6yXCxi+MDVEH57OX9dOCL9FGMAeF/TgC
	kFdKRQxFWepsHrEZBscC2dkhgEPYzcKSocSzyA/drfxvCZJW5a6I3uY+jfRGwLqj535U
	6K9AR1D5Mo6xR+DsY2GqQCxt0PExWH3Wl1MAY=
Received: by 10.223.17.142 with SMTP id s14mr1730747faa.145.1303284625588;
	Wed, 20 Apr 2011 00:30:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n9sm191929fax.3.2011.04.20.00.30.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:30:24 -0700 (PDT)
Date: Wed, 20 Apr 2011 09:30:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110420073024.GE5675@jama.jama.net>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
	<ee745668556da407eaed75a4c0f49d2e930dc7c2.1303283391.git.michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ee745668556da407eaed75a4c0f49d2e930dc7c2.1303283391.git.michael.lippautz@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 5/6] libnet: Clean and upgrade (see below)
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
X-List-Received-Date: Wed, 20 Apr 2011 07:32:51 -0000
X-Groupsio-MsgNum: 31344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 09:18:54AM +0200, Michael Lippautz wrote:
> * libnet upstream on packetfactor is dead
>   using https://github.com/sam-github/libnet instead
> * Move to version 1.1.5
> * Dropped patches (not needed): support-uclibc, new-autotools
> * Added LIC_FILES_CHKSUM
> * Removed useless do_install_append, works automatically
> * Not building statically anymore
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../libnet/libnet-1.1.2.1/new-autotools.patch      |   20 ----------
>  .../libnet/libnet-1.1.2.1/support-uclibc.patch     |   13 ------
>  .../fix-endianess-test.patch                       |   20 +++++----
>  .../recipes-connectivity/libnet/libnet_1.1.2.1.bb  |   41 --------------=
------
>  .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 +++++++++++
>  5 files changed, 35 insertions(+), 83 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/ne=
w-autotools.patch
>  delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/su=
pport-uclibc.patch
>  rename meta-oe/recipes-connectivity/libnet/{libnet-1.1.2.1 =3D> libnet-1=
=2E1.5}/fix-endianess-test.patch (70%)
>  delete mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
>  create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autot=
ools.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotoo=
ls.patch
> deleted file mode 100644
> index 064413e..0000000
> --- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/new-autotools.pa=
tch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Index: libnet/src/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libnet.orig/src/Makefile.am	2004-03-12 05:50:20.000000000 +1100
> -+++ libnet/src/Makefile.am	2007-08-11 16:41:09.000000000 +1000
> -@@ -57,15 +57,5 @@
> - 			libnet_version.c \
> - 			libnet_write.c
> -=20
> --EXTRA_libnet_a_SOURCES =3D libnet_link_bpf.c \
> --			libnet_link_dlpi.c \
> --			libnet_link_linux.c \
> --			libnet_link_nit.c \
> -- 			libnet_link_none.c \
> --			libnet_link_pf.c \
> --			libnet_link_snit.c \
> --			libnet_link_snoop.c \
> --			libnet_link_win32.c
> --
> - libnet_a_LIBADD =3D @LIBOBJS@
> -=20
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-u=
clibc.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uc=
libc.patch
> deleted file mode 100644
> index 84d117c..0000000
> --- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/support-uclibc.p=
atch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Add support for building with uclibc.
> -
> ---- libnet/config.sub	2005/11/16 12:34:11	1.1
> -+++ libnet/config.sub	2005/11/16 12:35:56
> -@@ -117,7 +117,7 @@
> - # Here we must recognize all the valid KERNEL-OS combinations.
> - maybe_os=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
> - case $maybe_os in
> --  nto-qnx* | linux-gnu* | storm-chaos* | os2-emx* | windows32-*)
> -+  nto-qnx* | linux-gnu* | linux-uclibc* | storm-chaos* | os2-emx* | win=
dows32-*)
> -     os=3D-$maybe_os
> -     basic_machine=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
> -     ;;
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endia=
ness-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endi=
aness-test.patch
> similarity index 70%
> rename from meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endian=
ess-test.patch
> rename to meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-=
test.patch
> index 6d93e04..4d8697d 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.2.1/fix-endianess-te=
st.patch
> +++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test=
=2Epatch
> @@ -6,17 +6,19 @@ Idea from http://www.security-lists.org/lists/libnet/20=
03/03/00001.html
> =20
>  Also remove the old test from aclocal.m4.
> =20
> ---- libnet/configure.in	2005/11/15 03:49:30	1.1
> -+++ libnet/configure.in	2005/11/15 03:50:29
> -@@ -7,6 +7,7 @@
> +Rebased for libnet-1.1.5 on 2011/04/19.
> +
> +--- a/configure.in	2010-11-03 00:59:21.000000000 +0100
> ++++ b/configure.in	2011-04-19 17:08:47.087712604 +0200
> +@@ -6,6 +6,7 @@
> + dnl
>   dnl Process this file with autoconf to produce a configure script.
>  =20
> -=20
>  +AC_PREREQ(2.52)
> - AC_INIT(src/libnet_build_ip.c)
> - LIBNET_VERSION=3D`cat VERSION`
> - AC_MSG_RESULT(beginning autoconfiguration process for libnet-$LIBNET_VE=
RSION...)
> -@@ -29,7 +30,16 @@
> + AC_INIT(libnet, 1.1.5)
> + AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_=
VERSION} ...)
> + AC_CANONICAL_SYSTEM
> +@@ -39,7 +40,16 @@
>   dnl And some custom things
>   dnl
>  =20
> @@ -31,6 +33,6 @@ Also remove the old test from aclocal.m4.
>  + LIBNET_CONFIG_DEFINES=3D"$LIBNET_CONFIG_DEFINES -DLIBNET_LIL_ENDIAN"
>  +], AC_MSG_WARN(cannot detect endianess. try setting ac_cv_c_bigendian t=
o yes or no))=20
>  +
> - AC_LBL_UNALIGNED_ACCESS
>   dnl AC_LBL_LIBRARY_NET
>  =20
> + AC_SUBST(ENDIANESS)
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb b/meta=
-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
> deleted file mode 100644
> index b09f56e..0000000
> --- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.2.1.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DESCRIPTION =3D "A packet dissection and creation library"
> -HOMEPAGE =3D "http://www.packetfactory.net/libnet/"
> -SECTION =3D "libs"
> -PRIORITY =3D "optional"
> -LICENSE =3D "BSD"
> -DEPENDS =3D "libpcap"
> -# There are major API changes beween libnet v1.0 and libnet v1.1
> -PROVIDES =3D "libnet-1.1"
> -PR =3D "r4"
> -
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/libn/libnet/libnet_${PV}.orig.tar.gz \
> -           file://support-uclibc.patch \
> -           file://fix-endianess-test.patch \
> -           file://new-autotools.patch"
> -
> -S =3D "${WORKDIR}/libnet"
> -
> -inherit autotools binconfig
> -
> -do_configure_prepend() {
> -        rm -f aclocal.m4 Makefile.am ltmain.sh
> -}
> -
> -do_install_append () {
> -        oe_runmake -C src 'DESTDIR=3D${D}${libdir}/' 'libdir=3D' install=
-libLIBRARIES
> -        oe_runmake -C include 'DESTDIR=3D${D}${includedir}/' 'includedir=
=3D' install-includeHEADERS
> -        oe_runmake -C include/libnet 'DESTDIR=3D${D}${includedir}/' 'inc=
ludedir=3D' install-libnetincludeHEADERS
> -        install -d ${D}${datadir}/man/man3/
> -        install -d ${D}${bindir}
> -        install -m 0644 ${S}/doc/man/man3/*.3 ${D}${datadir}/man/man3/
> -        install -m 0755 ${S}/libnet-config ${D}${bindir}
> -}
> -
> -#static build
> -FILES_${PN} =3D ""
> -FILES_${PN}-dev +=3D "${bindir}/libnet-config"
> -
> -CPPFLAGS_prepend =3D "-I${S}/libnet/include "
> -
> -SRC_URI[md5sum] =3D "be845c41170d72c7db524f3411b50256"
> -SRC_URI[sha256sum] =3D "ab01882a3d0556176018c09342cd0731f7cbc8e687795009=
894c3326942c76ff"
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-o=
e/recipes-connectivity/libnet/libnet_1.1.5.bb
> new file mode 100644
> index 0000000..236f1a0
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "A packet dissection and creation library"
> +# libnet at packetfactory.net is dead
> +HOMEPAGE =3D "https://github.com/sam-github/libnet"
> +SECTION =3D "libs"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D533bea47338d490e86744c6a0c5692=
e7"
> +DEPENDS =3D "libpcap"
> +# There are major API changes beween libnet v1.0 and libnet v1.1
> +PROVIDES =3D "libnet-1.1"
> +PR =3D "r6"

r0, same as with eventlog

> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
> +           file://fix-endianess-test.patch"
> +
> +SRC_URI[md5sum] =3D "a9bc1d75a610efcfee200d3e28d8eb8f"
> +SRC_URI[sha256sum] =3D "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d=
8275db994496a20d"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools binconfig
> +
> +do_configure_prepend() {
> +        rm -f aclocal.m4 Makefile.am ltmain.sh
> +}
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2ui5AACgkQN1Ujt2V2gByOzgCfZMhDrzOfV6e6/+DkbTpeuKQf
NMYAn2KVCZSwZBcn22bk2GNE8sakcvrc
=+AHz
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
