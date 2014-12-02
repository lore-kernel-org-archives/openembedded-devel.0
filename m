Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 87A99601F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 20:45:05 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1XvuJl-0004RL-Au from Joe_MacDonald@mentor.com ;
	Tue, 02 Dec 2014 12:45:05 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.181.6; Tue, 2 Dec 2014
	12:45:04 -0800
Received: by burninator (Postfix, from userid 1000)	id 7A2925814AD; Tue,  2
	Dec 2014 15:45:04 -0500 (EST)
Date: Tue, 2 Dec 2014 15:45:04 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20141202204504.GF12784@mentor.com>
References: <1417490373-1909-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1417490373-1909-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] radiusclient-ng : add new recipe
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
X-List-Received-Date: Tue, 02 Dec 2014 20:45:12 -0000
X-Groupsio-MsgNum: 53157
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Content-Disposition: inline

--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Li,

[[oe] [meta-networking][PATCH] radiusclient-ng : add new recipe] On 14.12.0=
2 (Tue 11:19) Li xin wrote:

> RADIUS protocol client library.
> It is Portable, easy-to-use and standard compliant library suitable
> for developing free and commercial software that need support for a RADIUS
> protocol (RFCs 2128 and 2139).
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../files/Fix-configure-and-compile-errors.patch   | 79 ++++++++++++++++=
++++++
>  .../files/config-site.radiusclient-ng-0.5.6        |  1 +
>  .../radiusclient-ng/radiusclient-ng_0.5.6.bb       | 36 ++++++++++
>  3 files changed, 116 insertions(+)
>  create mode 100644 meta-networking/recipes-support/radiusclient-ng/files=
/Fix-configure-and-compile-errors.patch
>  create mode 100644 meta-networking/recipes-support/radiusclient-ng/files=
/config-site.radiusclient-ng-0.5.6
>  create mode 100644 meta-networking/recipes-support/radiusclient-ng/radiu=
sclient-ng_0.5.6.bb

Can you move this to recipes-protocols?

> diff --git a/meta-networking/recipes-support/radiusclient-ng/files/Fix-co=
nfigure-and-compile-errors.patch b/meta-networking/recipes-support/radiuscl=
ient-ng/files/Fix-configure-and-compile-errors.patch
> new file mode 100644
> index 0000000..5220923
> --- /dev/null
> +++ b/meta-networking/recipes-support/radiusclient-ng/files/Fix-configure=
-and-compile-errors.patch
> @@ -0,0 +1,79 @@
> +From 72154b3179d9352d3747d7b47d6029a9f1a304b2 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 2 Dec 2014 02:33:53 +0900
> +Subject: [PATCH] Fix configure and compile errors
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>

We'll need an upstream-status on this, even if you're just integrating
Fedora patches.  If you are the author of this patch, could you
elaborate a bit in your comments here?  Looking at the Makefile.am patch
I think I understand the intent, but it's probably best to write it out.

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
> diff --git a/meta-networking/recipes-support/radiusclient-ng/files/config=
-site.radiusclient-ng-0.5.6 b/meta-networking/recipes-support/radiusclient-=
ng/files/config-site.radiusclient-ng-0.5.6
> new file mode 100644
> index 0000000..a30c144
> --- /dev/null
> +++ b/meta-networking/recipes-support/radiusclient-ng/files/config-site.r=
adiusclient-ng-0.5.6
> @@ -0,0 +1 @@
> +ac_cv_func_uname=3Dno
> diff --git a/meta-networking/recipes-support/radiusclient-ng/radiusclient=
-ng_0.5.6.bb b/meta-networking/recipes-support/radiusclient-ng/radiusclient=
-ng_0.5.6.bb
> new file mode 100644
> index 0000000..bc9d08e
> --- /dev/null
> +++ b/meta-networking/recipes-support/radiusclient-ng/radiusclient-ng_0.5=
=2E6.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "RADIUS protocol client library"
> +DESCRIPTION =3D "Portable, easy-to-use and standard compliant library su=
itable \
> +for developing free and commercial software that need support for a RADI=
US \
> +protocol (RFCs 2128 and 2139)."
> +HOMEPAGE =3D "http://developer.berlios.de/projects/radiusclient-ng/"

This 404s for me.  Actually, developer.berlios.de NXDOMAINs.  :-)

I was ready to write this off as abandonware since I know a bit of the
history of freeradius, but it actually looks like it's still relatively
actively developed on SF.  So can you update the HOMEPAGE to point to
http://sourceforge.net/projects/radiusclient-ng.berlios/ (or some more
appropriate page, if you've got one).

> +SECTION =3D "Applications/Internet"
> +
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${BP}.tar.gz/=
6fb7d4d0aefafaee7385831ac46a8e9c/${BP}.tar.gz \
> +    file://Fix-configure-and-compile-errors.patch \
> +    file://config-site.radiusclient-ng-${PV}"
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

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUfiTQAAoJEEn8ffcsOfaWzCMH/1gHujl7FEMgVwxf3krzdvnN
4brLfWlZGrYfECRoKlCuWp3OPJNGp5sB8bsx+417VVhx0gh7tE7a438hvWI61X+B
ObdDVHhYNqgWV8Nc87LGwWyPOcnJ8FoDtLgS9u4t0cYWeD4JBWaqSuuI8o/UkuaS
aClJqTe4ILQHHkgStULYdYxOvL46AMHqpovf8hP8M8N1WJyP4E9y+rISeSIDTwRW
rECXxM3zQH0nieBl/nzV2gUpu4izBCcO7gBw5gK5W1/hhgODi2MnECFcgnNt1UE1
4YyVks7qthM5lT/ffV5DTYSVQIMOJV1Z5ELOHPV4JihsZOO2rI5QGeOEHUyKR+c=
=KVZS
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
