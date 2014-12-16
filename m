Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AB7E472613
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 21:02:20 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y0zG9-0003rZ-GD from Joe_MacDonald@mentor.com ;
	Tue, 16 Dec 2014 13:02:21 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 16 Dec 2014 13:02:21 -0800
Received: by burninator (Postfix, from userid 1000)	id 7F35F581DE4; Tue, 16
	Dec 2014 16:02:20 -0500 (EST)
Date: Tue, 16 Dec 2014 16:02:20 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20141216210220.GN6113@mentor.com>
References: <20141202204504.GF12784@mentor.com>
	<1417672199-7141-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417672199-7141-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] radiusclient-ng: add new recipe
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
X-List-Received-Date: Tue, 16 Dec 2014 21:02:22 -0000
X-Groupsio-MsgNum: 53345
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6o78gXsyQHm68LY/"
Content-Disposition: inline

--6o78gXsyQHm68LY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2] radiusclient-ng: add new recipe] On 14.12=
=2E04 (Thu 13:49) Li xin wrote:

> RADIUS protocol client library.
> It is Portable, easy-to-use and standard compliant library suitable
> for developing free and commercial software that need support for a
> RADIUS protocol (RFCs 2128 and 2139).
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

Merged, thanks for the updates.

-J.

> ---
>  .../Modify-configure.in-and-etc-Makefile.am.patch  | 84 ++++++++++++++++=
++++++
>  .../config-site.radiusclient-ng-0.5.6              |  1 +
>  .../radiusclient-ng/radiusclient-ng_0.5.6.bb       | 36 ++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/rad=
iusclient-ng/Modify-configure.in-and-etc-Makefile.am.patch
>  create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/rad=
iusclient-ng/config-site.radiusclient-ng-0.5.6
>  create mode 100644 meta-networking/recipes-protocols/radiusclient-ng/rad=
iusclient-ng_0.5.6.bb
>=20
> diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclie=
nt-ng/Modify-configure.in-and-etc-Makefile.am.patch b/meta-networking/recip=
es-protocols/radiusclient-ng/radiusclient-ng/Modify-configure.in-and-etc-Ma=
kefile.am.patch
> new file mode 100644
> index 0000000..ecc2d74
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/M=
odify-configure.in-and-etc-Makefile.am.patch
> @@ -0,0 +1,84 @@
> +From 45b97b474ce2d0ad56828db11edde8562bb47a43 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 2 Dec 2014 02:33:53 +0900
> +Subject: [PATCH] Modify configure.in and etc/Makefile.am
> +
> +this patch is from Fedora to fix error:
> +"conftest.c:26:9: error: unknown type name 'not'"
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + configure.in             | 6 +++++-
> + etc/Makefile.am          | 9 ++++++---
> + etc/radiusclient.conf.in | 2 +-
> + 3 files changed, 12 insertions(+), 5 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 812f640..3a8af99 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -29,6 +29,9 @@ AC_SUBST(LIBVERSION)
> + pkgsysconfdir=3D${sysconfdir}/$PACKAGE
> + AC_SUBST(pkgsysconfdir)
> +=20
> ++pkgdatadir=3D${datadir}/$PACKAGE
> ++AC_SUBST(pkgdatadir)
> ++
> + AC_PROG_LIBTOOL
> +=20
> + AC_PROG_CC
> +@@ -118,7 +121,8 @@ then
> + 	],
> + 	AC_MSG_RESULT(yes)
> + 	AC_DEFINE(HAVE_STRUCT_UTSNAME_DOMAINNAME),
> +-	AC_MSG_RESULT(no)
> ++	AC_MSG_RESULT(no),
> ++	AC_MSG_RESULT(assume no),
> + 	)
> + fi
> +=20
> +diff --git a/etc/Makefile.am b/etc/Makefile.am
> +index 39b6975..a3c403f 100644
> +--- a/etc/Makefile.am
> ++++ b/etc/Makefile.am
> +@@ -14,9 +14,11 @@ CLEANFILES =3D *~ radiusclient.conf
> +=20
> + sbindir =3D @sbindir@
> + pkgsysconfdir =3D @pkgsysconfdir@
> +-pkgsysconf_DATA =3D issue port-id-map radiusclient.conf \
> +-	dictionary dictionary.ascend dictionary.compat dictionary.merit \
> +-	dictionary.sip
> ++pkgsysconf_DATA =3D issue port-id-map radiusclient.conf
> ++
> ++pkgdatadir =3D @pkgdatadir@
> ++pkgdata_DATA =3D dictionary dictionary.ascend dictionary.compat \
> ++	dictionary.merit dictionary.sip
> +=20
> + EXTRA_DIST =3D issue port-id-map dictionary dictionary.ascend \
> + 	dictionary.compat dictionary.merit servers radiusclient.conf.in \
> +@@ -25,6 +27,7 @@ EXTRA_DIST =3D issue port-id-map dictionary dictionary=
=2Eascend \
> + radiusclient.conf: radiusclient.conf.in
> + 	sed -e 's|@sbin''dir@|$(sbindir)|g' \
> + 	    -e 's|@pkgsysconf''dir@|$(pkgsysconfdir)|g' \
> ++	    -e 's|@pkgdata''dir@|$(pkgdatadir)|g' \
> + 	    <$(srcdir)/radiusclient.conf.in >radiusclient.conf
> +=20
> + install-data-local: servers
> +diff --git a/etc/radiusclient.conf.in b/etc/radiusclient.conf.in
> +index 948bc2f..aac9973 100644
> +--- a/etc/radiusclient.conf.in
> ++++ b/etc/radiusclient.conf.in
> +@@ -47,7 +47,7 @@ servers		@pkgsysconfdir@/servers
> +=20
> + # dictionary of allowed attributes and values
> + # just like in the normal RADIUS distributions
> +-dictionary 	@pkgsysconfdir@/dictionary
> ++dictionary 	@pkgdatadir@/dictionary
> +=20
> + # program to call for a RADIUS authenticated login
> + login_radius	@sbindir@/login.radius
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclie=
nt-ng/config-site.radiusclient-ng-0.5.6 b/meta-networking/recipes-protocols=
/radiusclient-ng/radiusclient-ng/config-site.radiusclient-ng-0.5.6
> new file mode 100644
> index 0000000..a30c144
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng/c=
onfig-site.radiusclient-ng-0.5.6
> @@ -0,0 +1 @@
> +ac_cv_func_uname=3Dno
> diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclie=
nt-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiuscl=
ient-ng_0.5.6.bb
> new file mode 100644
> index 0000000..73bbb51
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0=
=2E5.6.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "RADIUS protocol client library"
> +DESCRIPTION =3D "Portable, easy-to-use and standard compliant library su=
itable \
> +for developing free and commercial software that need support for a RADI=
US \
> +protocol (RFCs 2128 and 2139)."
> +HOMEPAGE =3D "http://sourceforge.net/projects/radiusclient-ng.berlios/"
> +SECTION =3D "Applications/Internet"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/r/${PN}/${PN}_${PV}.orig.tar.gz \
> +   file://Modify-configure.in-and-etc-Makefile.am.patch \=20
> +   file://config-site.radiusclient-ng-${PV}"
> +
> +SRC_URI[md5sum] =3D "6fb7d4d0aefafaee7385831ac46a8e9c"
> +SRC_URI[sha256sum] =3D "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad3=
61ac595f72f09f14"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D3e47566c9271b786693d8a08792=
dbf41"
> +
> +inherit autotools-brokensep
> +
> +EXTRA_OECONF +=3D "--disable-static"
> +
> +do_configure_prepend () {
> +    export CONFIG_SITE=3D./config-site.${P}
> +}
> +
> +do_compile_prepend() {
> +    for m in `find . -name "Makefile"` ; do
> +        sed -i -e 's:^program_transform_name =3D.*:program_transform_nam=
e =3D:g' ${m}
> +    done
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +    rm -f ${D}${libdir}/*.la
> +    rm -f ${D}${sbindir}/radexample
> +}
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--6o78gXsyQHm68LY/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUkJ3cAAoJEEn8ffcsOfaWgIAIALdhDxMUHWwYf900oHTCcI8H
SjF/W3ele6vmp33y1Nu+9YgRO/m5WPy7SrlBJpovGUIv3UwEA8HjAH4HPrQK7kyu
95Nzr2XggdadAlLd7VH17mXmzK8+zAsAvp3kVNrD7eT4LnD+OTTc74nZ2f1JfkG3
ZCTdk+f6HyJJ/IjweOsGNpKs02WheVTQR9Y4ak327RZskSSQrVQfxiNaUZhl5rvq
L30YaYhDRc2UF8SW3mzckjP1NsWPlF9vDEoFLZPJDIcC7TaRJjbhm3mN7Pq9WYpW
2ifiJ+hyPb6aYtv8Gfcsep3yrjf0k1vaJEB/QVzoRZQ14FdsWQ0glNKn736Hf04=
=mIe+
-----END PGP SIGNATURE-----

--6o78gXsyQHm68LY/--
