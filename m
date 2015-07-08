Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8AD75D07
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 11:59:07 +0000 (UTC)
Received: by wiga1 with SMTP id a1so282896945wig.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2015 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D1zpPP5/QN54WecdFRaUw70UXy/wJ+DM0/0fxKyNQ0Q=;
	b=IZkTPB7QD3tXRkimgrp3wvTAra6MLIOCRpjYy4pv1nRCEobTtQ5FmzrHt67Q7qVg9w
	1F2/YlyTw9cgjtaAhrP+knH+/DWJF1IuW/Iyn8tpCex06X4wuBWszU7kM/123100HxfP
	WX6xCo7sPyi98QomgEcJ3nU4FrN08gDd0PvARfjHIgCxbP7mBPVTqQysr/jb4irem8Ir
	Nmbz28ebD5c4qMQTRkAmIHr8md/o79ZQ2ZUNUixfjExcdINQXXG3hcrRVRg7eVgkOi8N
	qZg/onmnoZqw1Y/0bFNAetDUOvEHwDgj3N1rWK9J7p7SliwF4MJvY0WRG2B98kfE2D4t
	6cig==
X-Received: by 10.180.78.136 with SMTP id b8mr70793361wix.89.1436356747451;
	Wed, 08 Jul 2015 04:59:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	se11sm2934542wic.2.2015.07.08.04.59.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 04:59:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Jul 2015 13:59:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150708115915.GF2398@jama>
References: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
	<1434527353-47017-4-git-send-email-biannm@cn.fujitsu.com>
	<20150619155637.GA2398@jama>
	<30DC4EDFD798C94083F3E083754532CC73E10A6B@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CA+chaQcK+DoksMSVKpFRQzze58CLihk1LEnH0Pn+J-n3rY_DUw@mail.gmail.com>
	<30DC4EDFD798C94083F3E083754532CC73E10EF8@G08CNEXMBPEKD02.g08.fujitsu.local>
	<30DC4EDFD798C94083F3E083754532CC73E16FB7@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20150708103237.GA2398@jama>
MIME-Version: 1.0
In-Reply-To: <20150708103237.GA2398@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 3/7] libldb: add new recipe
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
X-List-Received-Date: Wed, 08 Jul 2015 11:59:09 -0000
X-Groupsio-MsgNum: 56190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DEueqSqTbz/jWVG1"
Content-Disposition: inline

--DEueqSqTbz/jWVG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 12:32:37PM +0200, Martin Jansa wrote:
> On Thu, Jul 02, 2015 at 09:01:14AM +0000, Bian, Naimeng wrote:
> > Hi Martin,
> >=20
> > I think I have fixed them and pushed them to github, please cherry-pick=
 them.
> >=20
> > - libldb
> >   https://github.com/bendaaron/meta-oe-dev/commit/c6cade4236226646fde99=
611c20fe3fcc6612e7a
>=20
> Hi Bian,
>=20
> it's still failing with this patch. I'll try to build it manually and
> provide more details.

find /usr/lib/python* -name \*tdb\*
=3Dnothing=3D

ldb and tdb workdirs are here:
http://logs.nslu2-linux.org/buildlogs/oe/world/libldb.tar.bz2
http://logs.nslu2-linux.org/buildlogs/oe/world/libtdb.tar.bz2

> > - samba
> >   https://github.com/bendaaron/meta-oe-dev/commit/25430ee92bbb2820294cb=
9ce239d9d4dccc492ea
> >=20
> > Thanks
> >  Bian
> >=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of Bian,
> > > Naimeng
> > > Sent: Wednesday, June 24, 2015 3:05 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > >=20
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > > Of Martin Jansa
> > > > Sent: Tuesday, June 23, 2015 4:05 PM
> > > > To: openembedded-devel
> > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > > >
> > > > I don't have access to that build anymore (because it's jenkins job
> > > > using tmpfs for TMPDIR, so after the build the TMPDIR is gone), but
> > > > it's failing only in
> > > > qemux86-64 builds, so I assume that it's finding host tdb or python
> > > > directories, because it's running on 12.04 Ubuntu x86-64.
> > > >
> > > > Try to install tdb on your build host if it allows you to reproduce
> > > > the issue, otherwise I'll try to reproduce it again in some next je=
nkins build.
> > > >
> > >=20
> > > My host is CentOS6.5 x86-64, and although I installed tdb.so into my =
host, i
> > > still cannot reproduce it.
> > >=20
> > > And, I have exported
> > > PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} in
> > > waf-samba.bbclasss which is inherited by libldb. IMO, it should find =
modules
> > > in PYTHONPATH firstly.
> > >=20
> > > Thanks
> > >  Bian
> > >=20
> > >=20
> > > > On Tue, Jun 23, 2015 at 7:47 AM, Bian, Naimeng <biannm@cn.fujitsu.c=
om>
> > > > wrote:
> > > >
> > > > > > -----Original Message-----
> > > > > > From: openembedded-devel-bounces@lists.openembedded.org
> > > > > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> > > > > > Behalf Of Martin Jansa
> > > > > > Sent: Friday, June 19, 2015 11:57 PM
> > > > > > To: openembedded-devel@lists.openembedded.org
> > > > > > Subject: Re: [oe] [meta-oe][PATCH v2 3/7] libldb: add new recipe
> > > > > >
> > > > > > On Wed, Jun 17, 2015 at 03:49:09PM +0800, Bian Naimeng wrote:
> > > > > > > libldb is required by samba4
> > > > > > >
> > > > > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > > > ---
> > > > > > >  .../do-not-import-target-module-in-configure.patch | 32
> > > > > +++++++++++++++
> > > > > > >  meta-oe/recipes-support/libldb/libldb_1.1.17.bb    | 45
> > > > > > ++++++++++++++++++++++
> > > > > > >  2 files changed, 77 insertions(+)  create mode 100644
> > > > > > > meta-oe/recipes-support/libldb/libldb/do-not-import-target-mo=
dul
> > > > > > > e- in-c onfigure.patch  create mode 100644
> > > > > > > meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > > > >
> > > > > > Fails to build in bitbake world:
> > > > > >
> > > > > > | Checking for system tdb >=3D
> > > > > > 1.2.13                                                 : yes
> > > > > > | ERROR: Python module pytdb of version 1.2.13 not found, and
> > > > > > | bundling disabled
> > > > > > | WARNING: exit code 1 from a shell command.
> > > > > > | ERROR: Function failed: do_configure (log file is located at
> > > > > > | /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-li=
nux
> > > > > > | /l
> > > > > > | ibld
> > > > > > | b/1.1.17-r0/temp/log.do_configure.22697)
> > > > > > NOTE: recipe libldb-1.1.17-r0: task do_configure: Failed
> > > > > > ERROR: Task 25505
> > > > > >
> > > > > (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipe=
s-s
> > > > > up
> > > > > port
> > > > > > /libldb/libldb_1.1.17.bb, do_configure) failed with exit code '=
1'
> > > > > >
> > > > >
> > > > > tdb.so is provided by libtdb which is DEPEND-ed by libldb, I think
> > > > > it should be installed into STAGING_DIR_HOST/PYTHON_SITEPACKAGES_=
DIR.
> > > > >
> > > > > Because I could not reproduce it in my building, would you mind
> > > > > telling me whether does tdb.so exist in
> > > > > STAGING_DIR_HOST/PYTHON_SITEPACKAGES_DIR/ while this error was ca=
ught.
> > > > >
> > > > > Thanks
> > > > >  Bian
> > > > >
> > > > > > > diff --git
> > > > > > > a/meta-oe/recipes-support/libldb/libldb/do-not-import-target-=
mod
> > > > > > > ul
> > > > > > > e-in
> > > > > > > -configure.patch
> > > > > > > b/meta-oe/recipes-support/libldb/libldb/do-not-import-target-=
mod
> > > > > > > ul
> > > > > > > e-in
> > > > > > > -configure.patch
> > > > > > > new file mode 100644
> > > > > > > index 0000000..b4d522a
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb/do-not-import-tar=
get
> > > > > > > +++ -m
> > > > > > > +++ odul
> > > > > > > +++ e-in-configure.patch
> > > > > > > @@ -0,0 +1,32 @@
> > > > > > > +Some module can be loaded while cross compile, we jst check
> > > > > > > +whether the module exist
> > > > > > > +
> > > > > > > +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > > > +
> > > > > > > +--- ldb-1.1.17.orig/buildtools/wafsamba/samba_bundled.py
> > > 2014-05-05
> > > > > > 17:00:41.000000000 +0900
> > > > > > > ++++ ldb-1.1.17/buildtools/wafsamba/samba_bundled.py
> > > 2015-06-15
> > > > > > 10:09:50.210000217 +0900
> > > > > > > +@@ -1,7 +1,7 @@
> > > > > > > + # functions to support bundled libraries
> > > > > > > +
> > > > > > > + from Configure import conf
> > > > > > > +-import sys, Logs
> > > > > > > ++import sys, Logs, imp
> > > > > > > + from samba_utils import *
> > > > > > > +
> > > > > > > + def PRIVATE_NAME(bld, name, private_extension, private_libr=
ary):
> > > > > > > +@@ -222,6 +222,16 @@ def CHECK_BUNDLED_SYSTEM_PYTHON(conf, li
> > > > > > > +         m =3D __import__(modulename)
> > > > > > > +     except ImportError:
> > > > > > > +         found =3D False
> > > > > > > ++
> > > > > > > ++        build_arch =3D os.environ["BUILD_ARCH"]
> > > > > > > ++        host_arch =3D os.environ["HOST_ARCH"]
> > > > > > > ++        if build_arch !=3D host_arch:
> > > > > > > ++            # Some modules maybe can not be imported while
> > > > > > > ++ cross
> > > > > compile
> > > > > > > ++            # We just check whether the module exist
> > > > > > > ++            stuff =3D imp.find_module(modulename,
> > > > > > [os.environ["PYTHONPATH"]])
> > > > > > > ++            if stuff !=3D None:
> > > > > > > ++                Logs.warn('Cross module[%s] has been found,
> > > > > > > ++ but can
> > > > > not
> > > > > > be loaded.' % (stuff[1]))
> > > > > > > ++                found =3D True
> > > > > > > +     else:
> > > > > > > +         try:
> > > > > > > +             version =3D m.__version__
> > > > > > > diff --git a/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > > > > > b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > > > > > new file mode 100644
> > > > > > > index 0000000..17607f7
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-oe/recipes-support/libldb/libldb_1.1.17.bb
> > > > > > > @@ -0,0 +1,45 @@
> > > > > > > +SUMMARY =3D "Hierarchical, reference counted memory pool sys=
tem
> > > > > > > +with
> > > > > > destructors"
> > > > > > > +HOMEPAGE =3D "http://ldb.samba.org"
> > > > > > > +SECTION =3D "libs"
> > > > > > > +LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
> > > > > > > +
> > > > > > > +DEPENDS +=3D "libtdb talloc libtevent libtdb"
> > > > > > > +RDEPENDS_${PN} +=3D "libtevent popt libtalloc"
> > > > > > > +RDEPENDS_pyldb +=3D "python libtdb libtalloc"
> > > > > > > +
> > > > > > > +SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
> > > > > > > +           file://do-not-import-target-module-in-configure.p=
atch"
> > > > > > > +
> > > > > > > +LIC_FILES_CHKSUM =3D
> > > > > >
> > > > > "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfc=
cfe95
> > > > > 22
> > > > > 69ff
> > > > > > f2b407dd11f2f3083b \
> > > > > > > +
> > > > > >
> > > > > file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=3D1a6d=
268fd
> > > > > 21
> > > > > 8675
> > > > > > ffea8be556788b780 \
> > > > > > > +
> > > > > >
> > > > > file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff=
39f19
> > > > > df
> > > > > ec6d
> > > > > > 293b95dea7b07891"
> > > > > > > +
> > > > > > > +SRC_URI[md5sum] =3D "7c2ab4e3f2a4186493aa06eabbc61cc0"
> > > > > > > +SRC_URI[sha256sum] =3D
> > > > > > "b9a312aad19e9463716d257d8f2529fd7fc1a5ef24f6dcdc0c4a1930d7bdb6=
e6"
> > > > > > > +
> > > > > > > +inherit waf-samba
> > > > > > > +
> > > > > > > +S =3D "${WORKDIR}/ldb-${PV}"
> > > > > > > +
> > > > > > > +EXTRA_OECONF +=3D "--disable-rpath \
> > > > > > > +                 --disable-rpath-install \
> > > > > > > +                 --bundled-libraries=3DNONE \
> > > > > > > +                 --builtin-libraries=3Dreplace \
> > > > > > > +                 --with-modulesdir=3D${libdir}/ldb/modules \
> > > > > > > +                 --with-privatelibdir=3D${libdir}/ldb \
> > > > > > > +                 --with-libiconv=3D${STAGING_DIR_HOST}${pref=
ix}\
> > > > > > > +                "
> > > > > > > +
> > > > > > > +PACKAGES +=3D "pyldb pyldb-dbg pyldb-dev"
> > > > > > > +
> > > > > > > +FILES_${PN} +=3D "${libdir}/ldb/*"
> > > > > > > +FILES_${PN}-dbg +=3D "${libdir}/ldb/.debug/* \
> > > > > > > +                    ${libdir}/ldb/modules/ldb/.debug/*"
> > > > > > > +
> > > > > > > +FILES_pyldb =3D
> > > > > > > +"${libdir}/python${PYTHON_BASEVERSION}/site-packages/*
> > > > \
> > > > > > > +               ${libdir}/libpyldb-util.so.1 \
> > > > > > > +               ${libdir}/libpyldb-util.so.1.1.17 \
> > > > > > > +              "
> > > > > > > +FILES_pyldb-dbg =3D
> > > > > > "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
> > > > > > > +                   ${libdir}/.debug/libpyldb-util.so.1.1.17"
> > > > > > > +FILES_pyldb-dev =3D "${libdir}/libpyldb-util.so"
> > > > > > > --
> > > > > > > 1.9.1
> > > > > > >
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > Openembedded-devel mailing list
> > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-d=
eve
> > > > > > > l
> > > > > >
> > > > > > --
> > > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DEueqSqTbz/jWVG1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWdEJMACgkQN1Ujt2V2gBwlIQCeN9ALnlUGdWq5K6K157v6JO6P
UmIAoLf71uLUR71GrFCYTspn4hzBOLIn
=+Lo8
-----END PGP SIGNATURE-----

--DEueqSqTbz/jWVG1--
