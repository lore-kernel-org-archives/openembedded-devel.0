Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0155.outbound.protection.outlook.com [207.46.163.155])
	by mail.openembedded.org (Postfix) with ESMTP id 024DE6DA89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 14:31:26 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB172.namprd03.prod.outlook.com (10.255.200.152) with Microsoft
	SMTP Server (TLS) id 15.0.847.13; Wed, 15 Jan 2014 14:31:24 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) with Microsoft
	SMTP Server (TLS) id 15.0.847.13; Wed, 15 Jan 2014 14:31:23 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.234]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.153]) with mapi id
	15.00.0847.008; Wed, 15 Jan 2014 14:31:23 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2] inetutils: fix libreadline path to
	fix QA errors
Thread-Index: AQHPEdyo3VVgIq516k6SYMRpRYkTLZqF1qKQ
Date: Wed, 15 Jan 2014 14:31:22 +0000
Message-ID: <24e0a63cf9054fbfa987b2aaea577e06@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1389771373-5181-1-git-send-email-b28495@freescale.com>
	<20140115102929.GG3717@jama>
In-Reply-To: <20140115102929.GG3717@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(679001)(689001)(779001)(377454003)(13464003)(24454002)(199002)(189002)(51704005)(65816001)(76576001)(59766001)(74502001)(76786001)(79102001)(1671002)(85306002)(80022001)(87936001)(46102001)(51856001)(76796001)(47976001)(50986001)(74316001)(87266001)(93516001)(47736001)(49866001)(2656002)(4396001)(66066001)(74366001)(15202345003)(77982001)(56776001)(47446002)(74662001)(81686001)(33646001)(81342001)(74706001)(80976001)(83072002)(77096001)(81542001)(19580405001)(81816001)(83322001)(31966008)(92566001)(19580395003)(63696002)(54316002)(76482001)(56816005)(69226001)(90146001)(85852003)(54356001)(53806001)(74876001)(15975445006)(93136001)(59246002)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB156;
	H:BN1PR03MB156.namprd03.prod.outlook.com; CLIP:123.151.195.49;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH v2] inetutils: fix libreadline path to fix QA errors
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
X-List-Received-Date: Wed, 15 Jan 2014 14:31:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Wednesday, January 15, 2014 6:29 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2] inetutils: fix libreadline path to
> fix QA errors
>=20
> On Wed, Jan 15, 2014 at 01:36:13AM -0600, b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > If wrong path set, inetutils configure script will add a absolute
> > rpath, which result in the below QA errors:
> > | ERROR: QA Issue: package inetutils-ftp contains bad RPATH
> > | ERROR: QA Issue: package inetutils-telnet contains bad RPATH
> > | ERROR: QA Issue: package inetutils-telnetd contains bad RPATH
> > | ERROR: QA run found fatal errors. Please consider fixing them.
> > | ERROR: Function failed: do_package_qa
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  .../inetutils/inetutils_1.9.1.bb                   |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> > a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> > b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> > index 97fc6a1..80022c7 100644
> > ---
> > a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> > +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.b
> > +++ b
> > @@ -37,7 +37,7 @@ PACKAGECONFIG[uucpd] =3D "--enable-uucpd,--disable-
> uucpd,readline"
> >
> >  EXTRA_OECONF =3D "--with-ncurses-include-dir=3D${STAGING_INCDIR} \
> >          ${noipv6} \
> > -        --with-libreadline-prefix=3D${STAGING_DIR_HOST}${prefix} \
> > +        --with-libreadline-prefix=3D${STAGING_LIBDIR} \
>=20
> Can you confirm that libreadline support is still enabled after this
> change?

Here is the log grabbed from log.do_configure:

checking for shared library run path origin... done
checking for readline... yes
checking how to link with libreadline... -lreadline
checking readline/readline.h usability... yes
checking readline/readline.h presence... yes
checking for readline/readline.h... yes
checking readline/history.h usability... yes
checking readline/history.h presence... yes
checking for readline/history.h... yes
checking for crypt in -lcrypt... yes

Without this patch, the log is:

checking for shared library run path origin... done
checking for readline... yes
checking how to link with libreadline... /home/liut/upstream/build_t4240qds=
-64b_release/tmp/sysroots/t4240qds-64b/usr/lib64/libreadline.so -Wl,-rpath =
-Wl,/home/liut/upstream/build_t4240qds-64b_release/tmp/sysroots/t4240qds-64=
b/usr/lib64
checking readline/readline.h usability... yes
checking readline/readline.h presence... yes
checking for readline/readline.h... yes
checking readline/history.h usability... yes
checking readline/history.h presence... yes
checking for readline/history.h... yes
checking for crypt in -lcrypt... yes

>=20
> >  "
> >
> >  do_configure_prepend () {
> > --
> > 1.7.9.7
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

