Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 343B27728C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD24XUo011483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:04:33 -0800
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.247]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 12 Nov 2015 18:04:32 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [v2][PATCH] talloc: upgrade to 2.1.3
Thread-Index: AQHRHV4SYxtlPOj2vkyJKis4a5qz0p6ZMcKg
Date: Fri, 13 Nov 2015 02:04:32 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C724220@ALA-MBA.corp.ad.wrs.com>
References: <1447327014-27893-1-git-send-email-jackie.huang@windriver.com>
	<BA61B1AD-E729-4B0E-ABF1-8B5CC3E2768B@gmail.com>
In-Reply-To: <BA61B1AD-E729-4B0E-ABF1-8B5CC3E2768B@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [v2][PATCH] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Fri, 13 Nov 2015 02:04:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> Sent: Thursday, November 12, 2015 11:23 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [v2][PATCH] talloc: upgrade to 2.1.3
>=20
>=20
> > Am 12.11.2015 um 12:16 schrieb jackie.huang@windriver.com:
> >
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> > - use ${SOLIBS} and ${SOLIBSDEV} instead of hardcoded suffix
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> > .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}        | 18 ++++++++-=
---------
> > 1 file changed, 8 insertions(+), 10 deletions(-)
> > rename meta-oe/recipes-support/talloc/{talloc_2.1.1.bb =3D> talloc_2.1.=
3.bb} (69%)
> >
> > diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb b/meta-oe/r=
ecipes-
> support/talloc/talloc_2.1.3.bb
> > similarity index 69%
> > rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > rename to meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> > index 89c390f..83c8f8f 100644
> > --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> > +++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
> > @@ -7,8 +7,8 @@ SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.t=
ar.gz"
> > LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/LGP=
L-
> 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> >                     file://${COREBASE}/meta/files/common-licenses/GPL-
> 3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
> >
> > -SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
> > -SRC_URI[sha256sum] =3D "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2=
fb6a459025488b6174"
> > +SRC_URI[md5sum] =3D "3e285de2228ae67ff0a0f5cec658f627"
> > +SRC_URI[sha256sum] =3D "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6=
e58dd9e311f41f2cb0"
> >
> > inherit waf-samba
> >
> > @@ -27,19 +27,17 @@ FILES_${PN} =3D ""
> > FILES_${PN}-dev =3D ""
> > FILES_${PN}-dbg =3D ""
> >
> > -FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
> > -                   ${libdir}/libtalloc.so.2.1.1"
> > +FILES_libtalloc =3D "${libdir}/libtalloc${SOLIBS}"
> > FILES_libtalloc-dbg =3D "/usr/src/debug/ \
> > -                   ${libdir}/.debug/libtalloc.so.2.1.1"
> > +                   ${libdir}/.debug/libtalloc${SOLIBS}"
> > FILES_libtalloc-dev =3D "${includedir}/ \
> > -                   ${libdir}/libtalloc.so \
> > +                   ${libdir}/libtalloc${SOLIBSDEV} \
> >                    ${libdir}/pkgconfig/"
> >
> > FILES_pytalloc =3D "${libdir}/python${PYTHON_BASEVERSION}/site-packages=
/* \
> > -                  ${libdir}/libpytalloc-util.so.2 \
> > -                  ${libdir}/libpytalloc-util.so.2.1.1 \
> > +                  ${libdir}/libpytalloc-util${SOLIBS} \
> >                  "
> > FILES_pytalloc-dbg =3D "${libdir}/python${PYTHON_BASEVERSION}/site-pack=
ages/.debug \
> > -                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
> > -FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
> > +                      ${libdir}/.debug/libpytalloc-util${SOLIBS}"
> > +FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util${SOLIBSDEV}"
> > RDEPENDS_pytalloc =3D "python"
> > --
> > 1.9.1
> >
> > --
>=20
>=20
> I'm missing the fix discussed in http://patchwork.openembedded.org/patch/=
104719/ - is talloc-dev
> not empty with the update?

No, I didn't involve the above discussion and it seems pending, this only u=
pdates the version for the
updated wafsamba.bbclass builds, I think the empty package issue will need =
a separate patch.

Thanks,
Jackie

>=20
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

