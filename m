Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0144.outbound.protection.outlook.com [207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD946AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:48:14 +0000 (UTC)
Received: from BLUPR03MB151.namprd03.prod.outlook.com (10.255.212.25) by
	BLUPR03MB149.namprd03.prod.outlook.com (10.255.212.17) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 08:48:14 +0000
Received: from BLUPR03MB151.namprd03.prod.outlook.com ([169.254.1.28]) by
	BLUPR03MB151.namprd03.prod.outlook.com ([169.254.1.28]) with mapi id
	15.00.0990.007; Wed, 16 Jul 2014 08:48:14 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES
	fslmachine with qoriq-ppc
Thread-Index: AQHPoMWRIcusi6wM1UuvtRztOUeNn5uiY4HA
Date: Wed, 16 Jul 2014 08:48:13 +0000
Message-ID: <5d7c7b3d5a7a4d5eb1458bf52380b48e@BLUPR03MB151.namprd03.prod.outlook.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-4-git-send-email-ting.liu@freescale.com>
	<20140716071400.GR2433@jama>
In-Reply-To: <20140716071400.GR2433@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(377454003)(13464003)(189002)(199002)(24454002)(51704005)(54356999)(76176999)(105586002)(77982001)(99396002)(110136001)(85852003)(83072002)(87936001)(46102001)(31966008)(21056001)(107046002)(2656002)(92566001)(76482001)(2351001)(4396001)(50986999)(74662001)(79102001)(74502001)(99286002)(77096002)(86362001)(83322001)(15395725005)(15202345003)(85806002)(76576001)(106356001)(66066001)(19580395003)(74316001)(20776003)(80022001)(64706001)(101416001)(19580405001)(85306003)(106116001)(95666004)(15975445006)(81342001)(33646002)(81542001)(108616002)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB149;
	H:BLUPR03MB151.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "yocto@mindchasers.com" <yocto@mindchasers.com>
Subject: Re: [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc
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
X-List-Received-Date: Wed, 16 Jul 2014 08:48:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, July 16, 2014 3:14 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: yocto@mindchasers.com
> Subject: Re: [oe] [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES
> fslmachine with qoriq-ppc
>=20
> On Wed, Jul 16, 2014 at 02:24:01PM +0800, ting.liu@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > fslmachine is too generic, use qoriq-ppc instead.
> > The change had been applided in meta-fsl-ppc layer.
>=20
> Should it be moved there completely as .bbappend?

It makes sense for me. Will send patch. Please ignore this one. Thanks.

>=20
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > index de3a40b..75885d6 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
> > @@ -9,7 +9,7 @@ SRC_URI =3D
> > "http://luajit.org/download/LuaJIT-${PV}.tar.gz \  SRC_URI[md5sum] =3D
> "f14e9104be513913810cd59c8c658dc0"
> >  SRC_URI[sha256sum] =3D
> "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79"
> >
> > -SRC_URI_append_fslmachine =3D " file://ppc-fixplt.patch "
> > +SRC_URI_append_qoriq-ppc =3D " file://ppc-fixplt.patch "
> >
> >  S =3D "${WORKDIR}/LuaJIT-${PV}"
> >
> > --
> > 1.7.3.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

