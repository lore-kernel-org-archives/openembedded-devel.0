Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF07160124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u61KPFro005288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Jul 2016 13:25:15 -0700
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.50]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Fri, 1 Jul 2016 13:25:14 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG
	certain dependencies
Thread-Index: AQHR0wggy/HNrvv7U0CQ7O0hLHCAgKADfeGAgACI5aA=
Date: Fri, 1 Jul 2016 20:25:13 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84A6F8DED5@ALA-MBB.corp.ad.wrs.com>
References: <1467316002-12489-1-git-send-email-jslater@windriver.com>
	<CABcZANnH_85yL9=_VBfwsuFTivqK+VbW5zyz=aoXvTA5a3k1Lw@mail.gmail.com>
In-Reply-To: <CABcZANnH_85yL9=_VBfwsuFTivqK+VbW5zyz=aoXvTA5a3k1Lw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG certain dependencies
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
X-List-Received-Date: Fri, 01 Jul 2016 20:25:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> Sent: Thursday, June 30, 2016 10:13 PM
> To: Openembedded Discussion
> Subject: Re: [oe] [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG=
 certain
> dependencies
>=20
> On Thu, Jun 30, 2016 at 12:46 PM, Joe Slater <jslater@windriver.com> wrot=
e:
>=20
> > +PACKAGECONFIG ??=3D "gnutls lz4 libproxy"
> > +
> > +# config defaults
> > +PACKAGECONFIG[gnutls] =3D ",--without-gnutls,gnutls,"
> > +PACKAGECONFIG[lz4] =3D ",--without-lz4,lz4,"
> > +PACKAGECONFIG[libproxy] =3D ",--without-libproxy,libproxy,"
> > +
> > +# not config defaults
> > +PACKAGECONFIG[pcsc-lite] =3D ",--without-libpcsclite,pcsc-lite,"
> >
>=20
> Why are the options not being passed for the enabled case, here? We prefe=
r
> to be explicit, rather than relying on defaults.

I can easily add them.  I left them out because configure help only mention=
s the --without
options to override the defaults.

Joe


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

