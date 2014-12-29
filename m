Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6727D7269B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:01:16 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so21512615wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 02:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YqJQloh34n5AXsKo5qAqDdOmsfQk1DTmu0fT5u3ciDY=;
	b=yYb8PHBRSNXpl5r5OHJqBEzuRt813jL9B2welgh7cmGCHze2sY2BfP1GxBGlNU3mOP
	NAvweALc5N9yjfwTnyQslMQhVOF4cdKgtIe4YqRqjqtE5BaztTh1ejFnHpaVkpfPYs7p
	WVp/Jr4fYipWqpcwBKuYuovwQcf+3sXMEDQ81d3b5QVDp61rzq7L4CKPaqbaQFs0ZIj4
	9OTmJDlWtlHupheNuqFXXbifE429yuSb8Z+ohGdSfC+7chaJtKODlfT1k9OMLwL90qiY
	nY6GzCqeI+T5/StTU+GIKHndqDB4+AXcs5RDM/6xrb/HqcPbsP2kjnlqVRDAPFLIutKa
	JtmA==
X-Received: by 10.194.90.81 with SMTP id bu17mr17447343wjb.3.1419847276955;
	Mon, 29 Dec 2014 02:01:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u13sm46488817wjr.26.2014.12.29.02.01.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Dec 2014 02:01:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Dec 2014 11:01:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141229100125.GL2465@jama>
References: <1419218925-35226-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1419218925-35226-1-git-send-email-biannm@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] linux-atm: add recipe.
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
X-List-Received-Date: Mon, 29 Dec 2014 10:01:21 -0000
X-Groupsio-MsgNum: 53503
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o+ZCuNqY+dEAKBWl"
Content-Disposition: inline

--o+ZCuNqY+dEAKBWl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 11:28:45AM +0800, Bian Naimeng wrote:
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
> index 0000000..a32d2a7
> --- /dev/null
> +++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Drivers and tools to support ATM networking under Linux"
> +HOMEPAGE =3D "http://linux-atm.sourceforge.net/"
> +SECTION =3D "libs"
> +LICENSE =3D "GPL-2.0 LGPL-2.0"

WARNING: Recipe linux-atm, LICENSE (GPL-2.0 LGPL-2.0) has invalid
format, LICENSES must have operator "([&|() ])" between them.

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
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o+ZCuNqY+dEAKBWl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlShJnUACgkQN1Ujt2V2gBy1EwCeJgEaJD85vIoU14OHK9HficDF
VFYAnRy4YIcAuKmv/UyZE/8W9Qd4UiRq
=gaGs
-----END PGP SIGNATURE-----

--o+ZCuNqY+dEAKBWl--
