Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0181.outbound.protection.outlook.com [207.46.163.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2E38B70604
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:09:19 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB153.namprd03.prod.outlook.com (10.255.201.15) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Thu, 17 Jul 2014 07:09:18 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.21]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.21]) with mapi id
	15.00.0985.008; Thu, 17 Jul 2014 07:09:18 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for
	powerpc/powerpc64
Thread-Index: AQHPoPnD12K7WoUuREaO37e5ONjtWpuj2McA
Date: Thu, 17 Jul 2014 07:09:18 +0000
Message-ID: <960fede6c06346c78c13b2cc097255dc@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-2-git-send-email-ting.liu@freescale.com>
	<20140716132725.GX2433@jama>
In-Reply-To: <20140716132725.GX2433@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(199002)(13464003)(51704005)(24454002)(189002)(377454003)(95666004)(77982001)(4396001)(2656002)(99286002)(79102001)(85852003)(33646002)(83072002)(74502001)(99396002)(87936001)(101416001)(66066001)(86362001)(21056001)(105586002)(81342001)(106356001)(20776003)(575784001)(64706001)(50986999)(92566001)(54356999)(76176999)(31966008)(76576001)(15202345003)(83322001)(107886001)(107046002)(19580395003)(2351001)(19580405001)(81542001)(110136001)(80022001)(106116001)(15975445006)(74316001)(77096002)(46102001)(76482001)(85306003)(74662001)(108616002)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB153;
	H:BN1PR03MB156.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
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
X-List-Received-Date: Thu, 17 Jul 2014 07:09:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, July 16, 2014 9:27 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: yocto@mindchasers.com
> Subject: Re: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 f=
or
> powerpc/powerpc64
>=20
> On Wed, Jul 16, 2014 at 02:23:59PM +0800, ting.liu@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > In recent libhugetlbfs source, powerpc/powerpc64 is changed back to
> > ppc/ppc64 (to match with the output of `uname -a`).
> >
> > Update the recipe to avoid build issue for now.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  .../libhugetlbfs/libhugetlbfs_git.bb               |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git
> > a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > index e8e0787..e554b26 100644
> > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > @@ -25,7 +25,10 @@ S =3D "${WORKDIR}/git"
> >  COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> >
> >  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> > -EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC=
}' ${LIBARGS}
> V=3D1"
> > +LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> > +LIBHUGETLBFS_ARCH_powerpc =3D "ppc"
> > +LIBHUGETLBFS_ARCH_powerpc64 =3D "ppc64"
> > +EXTRA_OEMAKE =3D "'ARCH=3D${LIBHUGETLBFS_ARCH}' 'OPT=3D${CFLAGS}' 'CC=
=3D${CC}'
> ${LIBARGS} V=3D2"
> >  PARALLEL_MAKE =3D ""
> >  CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-frame=
-
> pointer -g0"
>=20
> libhugetlbfs is currently failing with
> http://logs.nslu2-
> linux.org/buildlogs/oe/world/log.dependencies.20140714_130534.log/3_min/f=
ailed
> /libhugetlbfs.log

I think the issue was fixed by this patch:
http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D66709a85a2c0d0fdfadbd9832cb8056e65b39a36

>=20
> and it also fails to build for qemux86-64 (log in last world status e-mai=
l).
>=20
> Can we please fix it first?
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

