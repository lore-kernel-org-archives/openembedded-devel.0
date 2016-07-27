Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8260606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:33:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R1XTML018963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 26 Jul 2016 18:33:29 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.195]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Tue, 26 Jul 2016 18:33:29 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/2] unixodbc: Add the new recipe
Thread-Index: AQHR5yvzLTevGuGoKkKV0Rdyj3DMO6ArfwKw
Date: Wed, 27 Jul 2016 01:33:28 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013100D5AA@ALA-MBA.corp.ad.wrs.com>
References: <cover.1469524511.git.jackie.huang@windriver.com>
	<c5db424fbf578e677fb4b731f96aa48ee97ff4d8.1469524511.git.jackie.huang@windriver.com>
	<20160726105221.h2moj7mrfihp5v74@jama>
In-Reply-To: <20160726105221.h2moj7mrfihp5v74@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.141]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] unixodbc: Add the new recipe
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
X-List-Received-Date: Wed, 27 Jul 2016 01:33:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, July 26, 2016 6:52 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/2] unixodbc: Add the new recipe
>=20
> On Tue, Jul 26, 2016 at 05:18:07AM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > unixODBC is an Open Source ODBC sub-system and an
> > ODBC SDK for Linux, Mac OSX, and UNIX.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../do-not-use-libltdl-source-directory.patch      | 43 ++++++++++++++=
++++++++
> >  meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb | 27 ++++++++++++++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/unixodbc/files/do-not-use-l=
ibltdl-source-
> directory.patch
> >  create mode 100644 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
> >
> > diff --git a/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-=
source-directory.patch
> b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-direct=
ory.patch
> > new file mode 100644
> > index 0000000..69d26ad
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-=
directory.patch
> > @@ -0,0 +1,43 @@
> > +Subject: [PATCH] do not use libltdl source directory
> > +
> > +Don't use the included libltdl, use the one provided
> > +by our libtool instead.
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +Signed-off-by: Song.Li <Song.Li@windriver.com>
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +---
> > + Makefile.am  | 1 -
> > + configure.ac | 2 --
> > + 2 files changed, 3 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index e881cca..1321802 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -5,7 +5,6 @@ SUBDIRS =3D \
> > + 	log \
> > + 	lst \
> > + 	ini \
> > +-    libltdl \
> > + 	odbcinst \
> > + 	DriverManager \
> > + 	exe \
> > +diff --git a/configure.ac b/configure.ac
> > +index 218502f..d50b7af 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -136,9 +136,7 @@ dnl AC_CONFIG_MACRO_DIR([libltdl/m4])
> > + dnl LT_CONFIG_LTDL_DIR([libltdl])
> > + dnl LTDL_INIT
> > +
> > +-LT_CONFIG_LTDL_DIR([libltdl])
> > + LT_INIT([dlopen])
> > +-LTDL_INIT([convenience])
> > +
> > + dnl Substitute INCLTDL and LIBLTDL in the Makefiles
> > + AC_SUBST(LTDLINCL)
> > +--
> > +2.8.1
> > +
> > diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb b/meta-=
oe/recipes-
> support/unixodbc/unixodbc_2.3.4.bb
> > new file mode 100644
> > index 0000000..23d6d04
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "An Open Source ODBC sub-system"
> > +DESCRIPTION =3D "unixODBC is an Open Source ODBC sub-system and an ODB=
C SDK \
> > +for Linux, Mac OSX, and UNIX."
> > +
> > +HOMEPAGE =3D "http://www.unixodbc.org/"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7b37bf80a3df5a65b355433ae3=
6d206"
> > +
> > +DEPENDS =3D "libtool mysql5"
> > +
> > +SRC_URI =3D "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz=
 \
> > +           file://do-not-use-libltdl-source-directory.patch \
> > +"
> > +SRC_URI[md5sum] =3D "bd25d261ca1808c947cb687e2034be81"
> > +SRC_URI[sha256sum] =3D
> "2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5965309c632421e39"
> > +
> > +inherit autotools-brokensep
> > +
> > +S =3D "${WORKDIR}/unixODBC-${PV}"
> > +
> > +EXTRA_OEMAKE +=3D "LIBS=3D-lltdl"
> > +
> > +do_configure_prepend() {
> > +	# old m4 files will cause libtool version don't match
> > +	rm -rf m4/*
> > +	rm -fr libltdl
>=20
> Don't use tabs in meta-oe layers. I'll fix it this time, but next time
> just reject it.

I see, thanks!

Thanks,
Jackie

>=20
> > +}
> > --
> > 2.8.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

