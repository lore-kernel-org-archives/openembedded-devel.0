Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3F4A6FD16
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 15:29:24 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so1766287wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mQk+lbi/m4EWEzGp7nj0KpZug4zd56v/1+t9GgL/W9w=;
	b=0+rqKWzjHP+srOWHvAVXYtTCt0S6C70n605CeR3bpyud62WnDeP/TWf9ffcGHdIORP
	kR2oQ8amMRBKQcTcVCXN6N9E7UokmyyCmqtKzVej9HxxUqVv76Fp4qtE//45gBTSh5Uh
	/DgAsZGq+pBAsZjfs3sRkKHlY4cn5ReItp+PqIEfLsBHDfPc/XOgtVzd6DsEJjGVJUD3
	RwMkAzcNevjOEEFqtWjzUJernKYRa4gf13xmMfbNW+GG8z4P9qk0ZBDMy7NLc+ekdV0a
	8I1L5ZakRS7mUK+RCS+oQD0MgthN9cUX1pBEPTaNiuT0sX4Gu2O+0EG3NxaiqVCS2FyV
	Cefw==
X-Received: by 10.194.119.193 with SMTP id kw1mr8533862wjb.82.1412350165192;
	Fri, 03 Oct 2014 08:29:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gt7sm2412726wib.18.2014.10.03.08.29.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 08:29:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Oct 2014 17:30:21 +0200
To: Changhyeok Bae <changhyeok.bae@lge.com>
Message-ID: <20141003153021.GL25706@jama>
References: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
	<20141001152158.GE25706@jama>
	<00cd01cfdef8$c86aeca0$5940c5e0$@lge.com>
MIME-Version: 1.0
In-Reply-To: <00cd01cfdef8$c86aeca0$5940c5e0$@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gdal: update to version 1.11.0
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
X-List-Received-Date: Fri, 03 Oct 2014 15:29:33 -0000
X-Groupsio-MsgNum: 52346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yruHGtsrg8HLSUpe"
Content-Disposition: inline

--yruHGtsrg8HLSUpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 07:57:11PM +0900, Changhyeok Bae wrote:
> I successfully built in qemux86. But I didn't test by qemuarm.
>=20
> I'll test it on qemuarm.
>=20
> Q: If I change the recipes, then which environment should I test (qemux86,
> qemuarm, both)?

I'm testing at least on qemuarm, qemux86, qemux86-64 before accepting
any patches.

But for this you would better test from empty sysroot, so that all
dependencies are pulled only gdal (and missing ones are found) - you
should be able to see this with any MACHINE.

Regards,

> Thanks
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, October 02, 2014 12:22 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] gdal: update to version 1.11.0
>=20
> On Mon, Sep 29, 2014 at 10:09:21AM +0900, Changhyeok Bae wrote:
> > ---
> >  .../gdal/{gdal_1.10.1.bb =3D> gdal_1.11.0.bb}        |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)  rename=20
> > meta-oe/recipes-navigation/gdal/{gdal_1.10.1.bb =3D> gdal_1.11.0.bb}=20
> > (94%)
> >=20
> > diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb=20
> > b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> > similarity index 94%
> > rename from meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> > rename to meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> > index 14f1a57..8526cee 100644
> > --- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> > +++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> > @@ -1,14 +1,14 @@
> >  SUMMARY =3D "GDAL is a translator library for raster geospatial data
> formats"
> >  HOMEPAGE =3D "http://www.gdal.org/"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3Db9bd75ae5af7ff87ab259be0121c4106"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D0952e17969fab12227096b5228f23149"
> > =20
> >  DEPENDS =3D "proj sqlite3 tiff"
>=20
> Missing dependency on json-c and sqlite3 check doesn't seem to work
> correctly
>=20
> | checking for SQLite3 library >=3D 3.0.0... yes
> | cat:=20
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/inc
> | lude/sqlite3.h: No such file or directory
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueab
> | i/gdal/1.11.0-r0/gdal-1.11.0/configure: line 25763: test: !=3D: unary=
=20
> | operator expected
> | configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h head=
er
> to retrieve SQLite version!
> | checking for sqlite3_column_table_name in -lsqlite3... yes disabled=20
> | checking Checking for DWGdirect... disabled
> | configure: "IBM Informix DataBlade support disabled."
> | configure: checking whether we should include ESRI SDE support...
> |         ESRI SDE support not requested.
> | checking for geos-config...=20
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/bin/cro
> | ssscripts/geos-config checking for GEOS version >=3D 3.1.0... yes=20
> | checking for GEOSversion in -lgeos_c... yes
> | configure: Using C API from GEOS 3.4.2 checking for OpenCL support...=
=20
> | no checking for FreeXL support... checking for=20
> | json_object_set_serializer in -ljson-c... yes using pre-installed=20
> | libjson-c
> | configure: error: could not find json-c/json.h Configure failed. The=20
> | contents of all config.log files follows to aid debugging=20
> | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueab
> | i/gdal/1.11.0-r0/gdal-1.11.0/config.log
> | This file contains any messages produced by compilers while running=20
> | configure, to aid debugging if configure makes a mistake.
> |=20
> | It was created by configure, which was generated by GNU Autoconf 2.69. =
=20
> | Invocation command line was
>=20
>=20
> > =20
> >  SRC_URI =3D "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
> > =20
> > -SRC_URI[md5sum] =3D "f354c614aea76e5630e4edbf06e5c292"
> > -SRC_URI[sha256sum] =3D
> "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
> > +SRC_URI[md5sum] =3D "31f2c4a7230b40e5fdc3cf12a100f96b"
> > +SRC_URI[sha256sum] =3D
> "b5186b5817e94743de1bceef66aeee1461687e14f73bf81034fcf0377eacbcc3"
> > =20
> >  inherit autotools-brokensep lib_package binconfig
> > =20
> > --
> > 1.7.9.5
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yruHGtsrg8HLSUpe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQuwQ0ACgkQN1Ujt2V2gBzAkQCeMvINMfPmA46fpvsRov07eH8F
aCsAoIFN/FPRq8cyvvgmdCPFlLePqkHq
=TLRd
-----END PGP SIGNATURE-----

--yruHGtsrg8HLSUpe--
