Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 365D377205
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:05:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tACB5pok026211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 03:05:51 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 12 Nov 2015 03:05:50 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 2/6] talloc: upgrade to 2.1.3
Thread-Index: AQHRHTfUFFL/V9BjN0aCpzLdDMmYFJ6YOWMA
Date: Thu, 12 Nov 2015 11:05:49 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C72341F@ALA-MBA.corp.ad.wrs.com>
References: <cover.1447324249.git.jackie.huang@windriver.com>
	<003a6952d90ed5b8c4cb45964b5dae59dd7034ff.1447324249.git.jackie.huang@windriver.com>
	<20151112104942.GC2574@jama>
In-Reply-To: <20151112104942.GC2574@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.164]
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Thu, 12 Nov 2015 11:05:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, November 12, 2015 6:50 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 2/6] talloc: upgrade to 2.1.3
>=20
> On Thu, Nov 12, 2015 at 06:44:21PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> >  - use PV instead of hardcoded version number
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}              | 12 ++=
++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >  rename meta-oe/recipes-support/talloc/{talloc_2.1.1.bb =3D> talloc_2.1=
.3.bb} (80%)
> >
> > diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/r=
ecipes-
> support/talloc/talloc_2.1.3.bb
> > similarity index 80%
> > rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > rename to meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> > index 89c390f..7784794 100644
> > --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > +++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> > @@ -7,8 +7,8 @@ SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.t=
ar.gz"
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LG=
PL-
> 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> >                      file://${COREBASE}/meta/files/common-licenses/GPL-
> 3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> >
> > -SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
> > -SRC_URI[sha256sum] =3D "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2=
fb6a459025488b6174"
> > +SRC_URI[md5sum] =3D "3e285de2228ae67ff0a0f5cec658f627"
> > +SRC_URI[sha256sum] =3D "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6=
e58dd9e311f41f2cb0"
> >
> >  inherit waf-samba
> >
> > @@ -28,18 +28,18 @@ FILES_${PN}-dev =3D ""
> >  FILES_${PN}-dbg =3D ""
> >
> >  FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
> > -                   ${libdir}/libtalloc.so.2.1.1"
> > +                   ${libdir}/libtalloc.so.${PV}"
> >  FILES_libtalloc-dbg =3D "/usr/src/debug/ \
> > -                   ${libdir}/.debug/libtalloc.so.2.1.1"
> > +                   ${libdir}/.debug/libtalloc.so.${PV}"
>=20
> Why not use ${SOLIBS} and ${SOLIBSDEV} variables?

Sure, I should use them, I will sent v2 for this patch.

Thanks,
Jackie

>=20
> >  FILES_libtalloc-dev =3D "${includedir}/ \
> >                     ${libdir}/libtalloc.so \
> >                     ${libdir}/pkgconfig/"
> >
> >  FILES_pytalloc =3D "${libdir}/python${PYTHON_BASEVERSION}/site-package=
s/* \
> >                    ${libdir}/libpytalloc-util.so.2 \
> > -                  ${libdir}/libpytalloc-util.so.2.1.1 \
> > +                  ${libdir}/libpytalloc-util.so.${PV} \
> >                   "
> >  FILES_pytalloc-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-pac=
kages/.debug \
> > -                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
> > +                      ${libdir}/.debug/libpytalloc-util.so.${PV}"
> >  FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
> >  RDEPENDS_pytalloc =3D "python"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

