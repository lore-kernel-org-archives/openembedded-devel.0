Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C062872A13
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 19:12:00 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y8w1R-0005xO-9I from Joe_MacDonald@mentor.com ;
	Wed, 07 Jan 2015 11:12:01 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Jan 2015
	11:12:00 -0800
Received: by burninator (Postfix, from userid 1000)	id EA3F058251B; Wed,  7
	Jan 2015 14:11:56 -0500 (EST)
Date: Wed, 7 Jan 2015 14:11:56 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20150107191156.GH10013@mentor.com>
References: <1420448513-21578-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420448513-21578-1-git-send-email-biannm@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] linux-atm: add recipe.
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
X-List-Received-Date: Wed, 07 Jan 2015 19:12:00 -0000
X-Groupsio-MsgNum: 53748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Content-Disposition: inline

--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, I changed DESCRIPTION to SUMMARY in the recipe since it was just
a one-liner, but that's it.  Thanks.

-J.

[[oe] [meta-networking][PATCH v2] linux-atm: add recipe.] On 15.01.05 (Mon =
17:01) Bian Naimeng wrote:

> Drivers and tools to support ATM networking under Linux
>=20
> Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> ---
>  .../linux-atm/linux-atm/install-from-buildir.patch | 19 +++++++++++
>  .../linux-atm/linux-atm/link-with-ldflags.patch    | 38 ++++++++++++++++=
++++++
>  .../recipes-support/linux-atm/linux-atm_2.5.2.bb   | 22 +++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/i=
nstall-from-buildir.patch
>  create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/l=
ink-with-ldflags.patch
>  create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm_2=
=2E5.2.bb
>=20
> diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/install-=
=66rom-buildir.patch b/meta-networking/recipes-support/linux-atm/linux-atm/=
install-from-buildir.patch
> new file mode 100644
> index 0000000..d1380eb
> --- /dev/null
> +++ b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-bu=
ildir.patch
> @@ -0,0 +1,19 @@
> +install binaries from builddir not srcdir.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +--- linux-atm-2.5.2.orig/src/extra/Makefile.am	2010-12-21 05:07:22.00000=
0000 +0800
> ++++ linux-atm-2.5.2/src/extra/Makefile.am	2014-12-22 10:56:04.458563269 =
+0800
> +@@ -9,9 +9,9 @@ CLEANFILES =3D pca200e.bin pca200e_ecd.bin
> +=20
> + install-exec-hook:
> + 	$(MKDIR_P) $(DESTDIR)/lib/firmware
> +-	$(INSTALL_DATA) $(srcdir)/pca200e.bin $(DESTDIR)/lib/firmware
> +-	$(INSTALL_DATA) $(srcdir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
> +-	$(INSTALL_DATA) $(srcdir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
> ++	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
> ++	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
> ++	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
> +=20
> + %.bin %.bin2: %.data
> + 	objcopy -Iihex $< -Obinary $@.gz
> diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/link-wit=
h-ldflags.patch b/meta-networking/recipes-support/linux-atm/linux-atm/link-=
with-ldflags.patch
> new file mode 100644
> index 0000000..62fad2a
> --- /dev/null
> +++ b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldfla=
gs.patch
> @@ -0,0 +1,38 @@
> +LDFLAGS_FOR_BUILD should be required when doing link for qgen.
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> +
> +diff -Nurp linux-atm-2.5.2.orig/configure.in linux-atm-2.5.2/configure.in
> +--- linux-atm-2.5.2.orig/configure.in	2010-12-28 23:36:07.000000000 +0800
> ++++ linux-atm-2.5.2/configure.in	2014-12-22 10:25:23.830510932 +0800
> +@@ -66,6 +66,7 @@ else
> + fi
> + AC_SUBST(CC_FOR_BUILD)
> + AC_SUBST(CFLAGS_FOR_BUILD)
> ++AC_SUBST(LDFLAGS_FOR_BUILD)
> + dnl Add -d flag to bison/yacc to create intermediate .h files
> + YACC=3D"$YACC -d"
> +=20
> +diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.am linux-atm-2.5.2/src=
/qgen/Makefile.am
> +--- linux-atm-2.5.2.orig/src/qgen/Makefile.am	2010-12-28 22:29:31.000000=
000 +0800
> ++++ linux-atm-2.5.2/src/qgen/Makefile.am	2014-12-22 10:23:51.914508318 +=
0800
> +@@ -5,7 +5,7 @@ qgen_SOURCES =3D common.c common.h file.c
> + qgen_LDADD =3D -lfl
> +=20
> + COMPILE =3D @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@
> +-LINK =3D @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ -o $@
> ++LINK =3D @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o $@
> +=20
> + #TESTS =3D $(check_PROGRAMS)
> +=20
> +diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.in linux-atm-2.5.2/src=
/qgen/Makefile.in
> +--- linux-atm-2.5.2.orig/src/qgen/Makefile.in	2010-12-29 00:06:11.000000=
000 +0800
> ++++ linux-atm-2.5.2/src/qgen/Makefile.in	2014-12-22 10:23:51.914508318 +=
0800
> +@@ -106,6 +106,7 @@ INSTALL_SCRIPT =3D @INSTALL_SCRIPT@
> + INSTALL_STRIP_PROGRAM =3D @INSTALL_STRIP_PROGRAM@
> + LD =3D @LD@
> + LDFLAGS =3D @LDFLAGS@
> ++LDFLAGS_FOR_BUILD =3D @LDFLAGS_FOR_BUILD@
> + LEX =3D @LEX@
> + LEXLIB =3D @LEXLIB@
> + LEX_OUTPUT_ROOT =3D @LEX_OUTPUT_ROOT@
> diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb=
 b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> new file mode 100644
> index 0000000..4c0345b
> --- /dev/null
> +++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Drivers and tools to support ATM networking under Linux"
> +HOMEPAGE =3D "http://linux-atm.sourceforge.net/"
> +SECTION =3D "libs"
> +LICENSE =3D "GPL-2.0 & LGPL-2.0"
> +
> +DEPENDS =3D "virtual/kernel flex flex-native"
> +
> +SRC_URI =3D "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz \
> +           file://link-with-ldflags.patch \
> +           file://install-from-buildir.patch"
> +
> +SRC_URI[md5sum] =3D "d49499368c3cf15f73a05d9bce8824a8"
> +SRC_URI[sha256sum] =3D "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37=
581018fbd16dd53a"
> +
> +LIC_FILES_CHKSUM =3D "\
> +file://COPYING;md5=3Dd928de9537d846935a98af3bbc6e6ee1 \
> +file://COPYING.GPL;md5=3Dac2db169b9309e240555bc77be4f1a33 \
> +file://COPYING.LGPL;md5=3D6e29c688d912da12b66b73e32b03d812"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN} +=3D "${base_libdir}/firmware"
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUrYT8AAoJEEn8ffcsOfaWGaoIAL1hvOXoys1BhgVnh+38TZPM
lOVE/nT9UCXeyusyVUXqNltQIMODu+iwBsIkElgNJLhs5DYm/gWqbUe5kM15K+lg
FpuIQysbefWATjG4s5l+Mo/m45n9PLz+UvhJ+4xjMK8l1ZaZj6ARJo+Jyh/0M77K
CwDKSIirorRu9iG+TQsW0cXflOObaoGDLqd1sYcp4NHoabz5eSPqo558IAxw6ciz
qHn7Oqyl4qPBevqnjEu+2eHjoxGzDxMA9eHaCsndlgLTNbJ47tDJbur5x5Lf8KCb
WeG4VtH4C0woYduJrNIMJGj/rEJBIOpOrpYx8Q2P4hJWOR9TZvwkIcPacvBcd8E=
=Pl6T
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--
