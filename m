Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C052C60D31
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 12:02:16 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so7030291eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Jan 2014 04:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zvkNuOnTH+gIIIC/RLbqLNqE5ZdbI8P/8Xtb2B4oklo=;
	b=O8HeGRm8u+rMBeDUHmicxOazyd+3g4041n7xK6pGq6uWNje4s/4TgVyiJZokve4QBD
	a3J26ZkzlvWaEIxyPhoNUx6Ww9y8hnatVQ1nz0Tig1peHMIve3/BaUkaETbXHxwy4xEx
	cXeARsbpo4Wh9xMNj1obFUSRrmuaReT2Vf3QESPW+ZOgTk9qqnmv08v7qdt2jLKZlW97
	bhHawxpTYabcEISA/tvbd0MltUH0mPaIB62GR5+nGiCKHj6WvN8ua232daAArcU7soWn
	Q938+g9/+ogYmKLXtd5razUGIRpDPZXlTQBuLs+V4aZgVlrecSosc6/UUa3OJF9wsn9A
	MGHA==
X-Received: by 10.15.53.200 with SMTP id r48mr1447283eew.111.1388836937512;
	Sat, 04 Jan 2014 04:02:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	h48sm152978561eev.3.2014.01.04.04.02.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 04:02:16 -0800 (PST)
Date: Sat, 4 Jan 2014 13:02:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140104120221.GK3707@jama>
References: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
	<l9m4qt$96c$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <l9m4qt$96c$1@ger.gmane.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][for-dora 1/3] geos: Update to 3.4.2 and rework the packaging
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
X-List-Received-Date: Sat, 04 Jan 2014 12:02:18 -0000
X-Groupsio-MsgNum: 47597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ee6FjwWxuMujAVRe"
Content-Disposition: inline

--ee6FjwWxuMujAVRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2013 at 10:15:21AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> All 3 patches look good to me for going into the dora branch

I've merged 2 without gdal which has problem in master.

I've also merged few pending changes for dora, unfortunately libssh
and bash-completion recipes somehow slipped into my dora branch and I've
merged them too.

They shouldn't cause more harm than this accidental merge, but if you
want I'll revert those 2.

> Otavio Salvador schreef op 27-12-13 06:15:
> > * This updates to the 3.4.2 release and rework the packaging splitting=
=20
> > the C bindings in another binary package to reduce footprint in rootfs;
> > this also moves geos-config to the development package as it should.
> >=20
> > * Fix -dev installation and upgrade path Using 'lib_package' renames the
> > binaries and we need a transitional package to be used as upgrade path.
> > This is done using an empty 'geos' package which installs the new ones =
as
> > runtime dependency.
> >=20
> > This same package is used to satisfy -dev dependency of geos package=20
> > allowing for its inclusion into SDK.
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> Signed-off-by:
> > Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../geos-config-Add-includedir-variable.patch      | 39
> > ++++++++++++++++++++++ meta-oe/recipes-navigation/geos/geos.inc
> > | 22 ++++++------ meta-oe/recipes-navigation/geos/geos_3.3.2.bb      | =
 7
> > ---- meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  6 ++++ 4 fil=
es
> > changed, 56 insertions(+), 18 deletions(-) create mode 100644
> > meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-variab=
le.patch
> >
> >=20
> delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb
> > create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> >=20
> > diff --git
> > a/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-vari=
able.patch
> > b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-vari=
able.patch
> >
> >=20
> new file mode 100644
> > index 0000000..645e6f6 --- /dev/null +++
> > b/meta-oe/recipes-navigation/geos/files/geos-config-Add-includedir-vari=
able.patch
> >
> >=20
> @@ -0,0 +1,39 @@
> > +From 9d51027c228dafd7db2d0cffca1f0fc695e950fd Mon Sep 17 00:00:00 2001=
=20
> > +From: Otavio Salvador <otavio@ossystems.com.br> +Date: Mon, 2 Dec 2013
> > 11:33:26 -0200 +Subject: [PATCH] geos-config: Add includedir variable +=
=20
> > +This fixes cross-compile as it is easier to mangle the includedir=20
> > +during sysroot generation. + +Upstream-Status: Pending + +Signed-off-b=
y:
> > Otavio Salvador <otavio@ossystems.com.br> +--- + tools/geos-config.in |
> > 3 ++- + 1 file changed, 2 insertions(+), 1 deletion(-) + +diff --git
> > a/tools/geos-config.in b/tools/geos-config.in +index 9b45b5f..1749892
> > 100644 +--- a/tools/geos-config.in ++++ b/tools/geos-config.in +@@ -1,6
> > +1,7 @@ + #!/bin/sh + prefix=3D@prefix@ + exec_prefix=3D@exec_prefix@=
=20
> > ++includedir=3D@includedir@ + libdir=3D@libdir@ + + usage() +@@ -38,7 +=
39,7
> > @@ case $1 in +     echo @VERSION@ +      ;; +     --cflags) +-    echo
> > -I${prefix}/include ++    echo -I${includedir} +       ;; +     --libs)=
 +
> > # TODO: make an alias for --clibs +-- +1.7.10.4 + diff --git
> > a/meta-oe/recipes-navigation/geos/geos.inc
> > b/meta-oe/recipes-navigation/geos/geos.inc index e0c82bc..2e308b4 10064=
4=20
> > --- a/meta-oe/recipes-navigation/geos/geos.inc +++
> > b/meta-oe/recipes-navigation/geos/geos.inc @@ -2,20 +2,20 @@ DESCRIPTION
> > =3D "GEOS - Geometry Engine, Open Source" HOMEPAGE =3D
> > "http://trac.osgeo.org/geos/" SECTION =3D "libs"
> >=20
> > -INC_PR =3D "r1" - LICENSE =3D "LGPLv2.1+" LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e34"
> >=20
> > SRC_URI =3D "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
> >=20
> > -inherit autotools pkgconfig +inherit autotools pkgconfig binconfig +=
=20
> > +PACKAGES =3D+ "geoslib ${PN}-c1" + +DESCRIPTION_${PN}lib =3D "Geometry
> > engine for Geographic Information Systems - C++ Library" +FILES_${PN}lib
> > +=3D "${libdir}/libgeos-${PV}.so" + +DESCRIPTION_${PN}-c1 =3D "Geometry
> > engine for Geographic Information Systems - C Library" +FILES_${PN}-c1 =
+=3D
> > "${libdir}/libgeos_c.so.*"
> >=20
> > -# libgeos-${PV}.so is needed in PV -FILES_SOLIBSDEV =3D ""=20
> > -FILES_${PN}-dev =3D "${libdir}/*.la \ -
> > ${libdir}/libgeos.so \ -                   ${libdir}/libgeos_c.so \ -
> > ${includedir}" -FILES_${PN} +=3D " ${libdir}/libgeos-${PV}.so"=20
> > -INSANE_SKIP_${PN} =3D "dev-so" +ALLOW_EMPTY_${PN} =3D "1" +RDEPENDS_${=
PN} +=3D
> > "geoslib ${PN}-c1" diff --git
> > a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
> > b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb deleted file mode 10064=
4=20
> > index e57ca6b..0000000 ---
> > a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb +++ /dev/null @@ -1,7
> > +0,0 @@ -require geos.inc - -PR =3D "${INC_PR}.0" - -SRC_URI[md5sum] =3D
> > "5b7270c73fd1c516f368af8fd1962323" -SRC_URI[sha256sum] =3D
> > "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b" - di=
ff
> > --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> > b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb new file mode 100644=20
> > index 0000000..3a9a028 --- /dev/null +++
> > b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb @@ -0,0 +1,6 @@ +require
> > geos.inc + +SRC_URI +=3D
> > "file://geos-config-Add-includedir-variable.patch" + +SRC_URI[md5sum] =
=3D
> > "fc5df2d926eb7e67f988a43a92683bae" +SRC_URI[sha256sum] =3D
> > "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
> >=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFSvpapMkyGM64RGpERAu23AKCTwqKh/MOVeen0WBKbAtq1CLTDYgCgkXRe
> ZhxeqjTmCOJbU8SGJowgWuE=3D
> =3DqqxF
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ee6FjwWxuMujAVRe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLH+E0ACgkQN1Ujt2V2gBwyuACgkRtdOjFr+loHcZnQ8kh1Ezo0
BawAn3BmisHXhzig5Ckud4pWJiK8Z1M8
=Bng8
-----END PGP SIGNATURE-----

--ee6FjwWxuMujAVRe--
