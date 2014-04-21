Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 099A465D1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 02:58:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L2wAsX002724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 19:58:10 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Sun, 20 Apr 2014 19:58:10 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/3] gd: update to version 2.1.0
Thread-Index: AQHPXHIDrpIxxXwpCUmtuJa0gQFTZpsbYWZQ
Date: Mon, 21 Apr 2014 02:58:09 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BF554E@ALA-MBB.corp.ad.wrs.com>
References: <cover.1397545082.git.jackie.huang@windriver.com>
	<00038b50f96f259beae9e06813ec54085dd9fa17.1397545082.git.jackie.huang@windriver.com>
	<20140420082402.GK2486@jama>
In-Reply-To: <20140420082402.GK2486@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/3] gd: update to version 2.1.0
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
X-List-Received-Date: Mon, 21 Apr 2014 02:58:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Sunday, April 20, 2014 4:24 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/3] gd: update to version 2.1.0
>=20
> On Tue, Apr 15, 2014 at 03:01:24PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> > - Add DESCRIPTION and HOMEPAGE
> > - libgd.org is down, use bitbucket.org instead and also
> >   remove the MIRROR for it.
> > - Remove the unnecessary specified dir for --with-png.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.bb}     |   22 ++++++++++=
++--------
> >  1 file changed, 13 insertions(+), 9 deletions(-)  rename
> > meta-oe/recipes-support/gd/{gd_2.0.35+2.0.36rc1.bb =3D> gd_2.1.0.bb}
> > (43%)
> >
> > diff --git a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> > b/meta-oe/recipes-support/gd/gd_2.1.0.bb
> > similarity index 43%
> > rename from meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> > rename to meta-oe/recipes-support/gd/gd_2.1.0.bb
> > index 957c4eb..1b78b9b 100644
> > --- a/meta-oe/recipes-support/gd/gd_2.0.35+2.0.36rc1.bb
> > +++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
> > @@ -1,22 +1,26 @@
> > +SUMMARY =3D "gd is a library used to create PNG, JPEG, or WBMP images"
> > +DESCRIPTION =3D "The gd graphics library allows your code to quickly
> > +draw images \ complete with lines, arcs, text, multiple colors, cut
> > +and paste from other \ images, and flood fills, and to write out the
> > +result as a PNG or JPEG file. \ This is particularly useful in Web
> > +applications, where PNG and JPEG are two \ of the formats accepted
> > +for inline images by most browsers. Note that gd is not \ a paint prog=
ram."
> > +HOMEPAGE =3D "http://libgd.bitbucket.org/"
> >  SECTION =3D "libs"
> > +
> >  LICENSE =3D "GD"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc97638cafd3581eb87abd373321=
37669"
> > -SUMMARY =3D "gd is a library used to create PNG, JPEG, or WBMP images"
> >  DEPENDS =3D "freetype libpng jpeg zlib"
> > -PR =3D "r5"
> > -
> > -SRC_URI =3D "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz"
> > -SRC_URI[md5sum] =3D "39ac48e6d5e0012a3bd2248a0102f209"
> > -SRC_URI[sha256sum] =3D
> "dd7c1795271221b9237769b96b8cec7fbdc5db7b8954d864ead51fc1296a6ac8"
> >
> > -MIRRORS +=3D "http://www.libgd.org/releases/ http://fossies.org/unix/w=
ww/ \n"
> > +SRC_URI =3D "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV=
}.tar.bz2"
> > +SRC_URI[md5sum] =3D "5a1d5bab3a4a41d9f111bcceee4ad25b"
> > +SRC_URI[sha256sum] =3D
> "f3e1bc472bd81ee976a739436659fe752a14727a964c64530fde68531ddeee91"
> >
> > -S =3D "${WORKDIR}/gd-2.0.36RC1"
> > +S =3D "${WORKDIR}/libgd-${PV}"
> >
> >  inherit autotools binconfig gettext
> >
> >  EXTRA_OECONF +=3D " --with-zlib=3D${STAGING_LIBDIR}/.. \
> > -                  --with-png=3D${STAGING_LIBDIR}/.. \
> >                    --with-jpeg=3D${STAGING_LIBDIR}/.. \
> >                    --with-freetype \
>=20
> http://patchwork.openembedded.org/patch/69991/ adds --with-freetype=3D${S=
TAGING_LIBDIR}/.. \
>=20
> and together with this it fails with:
> | configure:13838: error: freetype support requested, but not found:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-
> eglibc/sysroots/qemuarm/usr/lib/../bin/freetype-config
>=20
> can you please check it?

I saw that you have fixed it "[oe] [meta-oe][PATCH] gd: fix --with-freetype=
 option",=20
I checked that it work fine with your patch, thanks!

Thanks,
Jackie

>=20
> >                    --without-fontconfig \
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

