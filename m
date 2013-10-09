Return-Path: <B28495@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0251.outbound.messaging.microsoft.com [213.199.154.251])
	by mail.openembedded.org (Postfix) with ESMTP id DD5F76CBF4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 08:35:11 +0000 (UTC)
Received: from mail213-db9-R.bigfish.com (10.174.16.251) by
	DB9EHSOBE032.bigfish.com (10.174.14.95) with Microsoft SMTP Server id
	14.1.225.22; Wed, 9 Oct 2013 08:35:12 +0000
Received: from mail213-db9 (localhost [127.0.0.1])	by
	mail213-db9-R.bigfish.com (Postfix) with ESMTP id 91048160130	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 08:35:12 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de097h186068h8275bh8275dhz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail213-db9 (localhost.localdomain [127.0.0.1]) by mail213-db9
	(MessageSwitch) id 1381307710798150_6190;
	Wed,  9 Oct 2013 08:35:10 +0000 (UTC)
Received: from DB9EHSMHS002.bigfish.com (unknown [10.174.16.232])	by
	mail213-db9.bigfish.com (Postfix) with ESMTP id B4FE1140071	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 08:35:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS002.bigfish.com
	(10.174.14.12) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 9 Oct 2013 08:35:10 +0000
Received: from 039-SN2MPN1-012.039d.mgd.msft.net ([169.254.2.56]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.03.0158.002; Wed, 9 Oct 2013 08:35:08 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64 to
	support large files
Thread-Index: AQHOwb3bHwO/BUATKE2gbUvI3c1Yp5nsERVg
Date: Wed, 9 Oct 2013 08:35:08 +0000
Message-ID: <AF604684617F454390621992F367F1690BB4835C@039-SN2MPN1-012.039d.mgd.msft.net>
References: <1380187231-23854-1-git-send-email-b28495@freescale.com>
	<20131005112719.GN6240@jama>
In-Reply-To: <20131005112719.GN6240@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.193.20.135]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64 to support large files
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
X-List-Received-Date: Wed, 09 Oct 2013 08:35:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Saturday, October 05, 2013 7:27 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64
> to support large files
>=20
> On Thu, Sep 26, 2013 at 05:20:31PM +0800, b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > Without this patch, netperf2.6 can only support files smaller than 2GB
> > with TCP_SENDFILE item.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > Tested-by: Jianhua Xie<jianhua.xie@freescale.com>
> > ---
> >  .../recipes-support/netperf/netperf_2.6.0.bb       |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> > b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> > index eda7859..1d9ba20 100644
> > --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> > +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> > @@ -23,6 +23,10 @@ S =3D "${WORKDIR}/netperf-${PV}"
> >  # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_
> > macros  CFLAGS_append =3D " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
> >
> > +# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support
> > +files # larger than 2GB CFLAGS_append =3D " -D_FILE_OFFSET_BITS=3D64"
> > +
>=20
> http://patchwork.openembedded.org/patch/57331/
> This patch is superseded, right?

Yes, it is superseded.

>=20
> Please update as Otavio requested.

I have sent the v2 patch. Thanks for your review.

>=20
> >  # autotools.bbclass attends to include m4 files with path depth <=3D 2
> > by  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
> >  do_configure_prepend() {
> > --
> > 1.7.3.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


