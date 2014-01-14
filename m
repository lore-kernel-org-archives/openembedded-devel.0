Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0151.outbound.protection.outlook.com [207.46.163.151])
	by mail.openembedded.org (Postfix) with ESMTP id 54D066B446
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:54:03 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB153.namprd03.prod.outlook.com (10.255.201.15) with Microsoft
	SMTP Server (TLS) id 15.0.847.13; Tue, 14 Jan 2014 09:54:02 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.234]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.153]) with mapi id
	15.00.0847.008; Tue, 14 Jan 2014 09:54:02 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 2/2] inetutils: not hard coded
	libreadline path
Thread-Index: AQHPEQoCWdABZ96jK0OmvMj+IfGA1JqD8m9AgAAHdwCAAAEHkA==
Date: Tue, 14 Jan 2014 09:54:02 +0000
Message-ID: <25a33e1ca1ed42c1bc0950809bbdf306@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1389690610-4230-1-git-send-email-b28495@freescale.com>
	<1389690610-4230-2-git-send-email-b28495@freescale.com>
	<20140114092139.GO16995@jama>
	<d6d29dfe2a204196a850afc04467a23d@BN1PR03MB156.namprd03.prod.outlook.com>
	<20140114095000.GP16995@jama>
In-Reply-To: <20140114095000.GP16995@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.50]
x-forefront-prvs: 0091C8F1EB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(679001)(779001)(689001)(24454002)(377454003)(189002)(199002)(13464003)(51704005)(47736001)(46102001)(53806001)(81816001)(54356001)(63696002)(56816005)(49866001)(80976001)(87936001)(74366001)(76482001)(74706001)(33646001)(74876001)(74502001)(74316001)(51856001)(31966008)(81686001)(47446002)(2656002)(56776001)(81542001)(93136001)(4396001)(90146001)(87266001)(74662001)(69226001)(59766001)(15202345003)(77982001)(85306002)(79102001)(81342001)(77096001)(50986001)(85852003)(76786001)(47976001)(66066001)(19580395003)(15975445006)(54316002)(76796001)(19580405001)(83072002)(80022001)(83322001)(76576001)(92566001)(65816001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB153;
	H:BN1PR03MB156.namprd03.prod.outlook.com; CLIP:123.151.195.50;
	FPR:; RD:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] inetutils: not hard coded libreadline path
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
X-List-Received-Date: Tue, 14 Jan 2014 09:54:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, January 14, 2014 5:50 PM
> To: Liu Ting-B28495
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 2/2] inetutils: not hard coded
> libreadline path
>=20
> On Tue, Jan 14, 2014 at 09:26:18AM +0000, ting.liu@freescale.com wrote:
> > > -----Original Message-----
> > > From: Martin Jansa [mailto:martin.jansa@gmail.com]
> > > Sent: Tuesday, January 14, 2014 5:22 PM
> > > To: Liu Ting-B28495
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH 2/2] inetutils: not hard coded
> > > libreadline path
> > >
> > > On Tue, Jan 14, 2014 at 05:10:10PM +0800, b28495@freescale.com wrote:
> > > > From: Ting Liu <b28495@freescale.com>
> > > >
> > > > Avoid below QA issues:
> > > > | ERROR: QA Issue: package inetutils-ftp contains bad RPATH
> > > > | ERROR: QA Issue: package inetutils-telnet contains bad RPATH
> > > > | ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
> > > > | ERROR: QA run found fatal errors. Please consider fixing them.
> > > > | ERROR: Function failed: do_package_qa
> > >
> > > Doesn't it autodetect libreadline?
> >
> > it can find libreadline without specifying --with-libreadline-prefix,
> so just remove the option to avoid QA errors.
>=20
> If it disables libreadline support, that should be clearly stated in
> commit message - from current one it looks like you're just fixing QA
> issue.
>=20

OK. I will check. Thanks.


> >
> > >
> > > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > > ---
> > > >  .../inetutils/inetutils_1.9.1.bb                   |    1 -
> > > >  1 files changed, 0 insertions(+), 1 deletions(-)
> > > >
> > > > diff --git a/meta-networking/recipes-
> > > connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-
> > > connectivity/inetutils/inetutils_1.9.1.bb
> > > > index 97fc6a1..03b8e65 100644
> > > > ---
> > > > a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.b
> > > > b
> > > > +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9
> > > > +++ .1.bb
> > > > @@ -37,7 +37,6 @@ PACKAGECONFIG[uucpd] =3D
> > > > "--enable-uucpd,--disable-
> > > uucpd,readline"
> > > >
> > > >  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
> > > >          ${noipv6} \
> > > > -        --with-libreadline-prefix=3D${STAGING_DIR_HOST}${prefix} \
> > > >  "
> > > >
> > > >  do_configure_prepend () {
> > > > --
> > > > 1.7.3.4
> > > >
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

