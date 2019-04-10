Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Apr 2019 12:29:55 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 31DE87D80C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 12:29:55 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x3ACOk7r029437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 Apr 2019 14:24:46 +0200
Received: from DEFTHW99ERKMSX.ww902.siemens.net
	(defthw99erkmsx.ww902.siemens.net [139.22.70.147])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id x3ACOXag020684
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 10 Apr 2019 14:24:46 +0200
Received: from DENBGAT9ER9MSX.ww902.siemens.net (139.22.70.88) by
	DEFTHW99ERKMSX.ww902.siemens.net (139.22.70.147) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Wed, 10 Apr 2019 14:24:42 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.89]) by
	DENBGAT9ER9MSX.ww902.siemens.net ([139.22.70.88]) with mapi id
	14.03.0435.000; Wed, 10 Apr 2019 14:24:41 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Adrian Bunk <bunk@stusta.de>, "Valek, Andrej" <andrej.valek@siemens.com>
Thread-Topic: [oe] [meta-networking][PATCH] squid: upgrade squid 3.5.28 -> 4.6
Thread-Index: AQHU7rDNNSwALpdjtEqF/TQiTPnmI6YzeH4AgAACuYCAAbBhgIAAJxxQ
Date: Wed, 10 Apr 2019 12:24:40 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA35B12@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190409084621.27294-1-andrej.valek@siemens.com>
	<20190409100504.GA12869@localhost>
	<1898c904-c55b-c34c-4162-cdfd0dd2d27a@siemens.com>
	<20190410120221.GA7028@localhost>
In-Reply-To: <20190410120221.GA7028@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
x-originating-ip: [139.22.70.49]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] squid: upgrade squid 3.5.28 -> 4.6
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
X-List-Received-Date: Wed, 10 Apr 2019 12:29:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
> Adrian Bunk
> Sent: Mittwoch, 10. April 2019 14:02
> To: Valek, Andrej (IOT DS EU SK BT1) <andrej.valek@siemens.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] squid: upgrade squid 3.5.28 ->
> 4.6
>=20
> On Tue, Apr 09, 2019 at 12:14:49PM +0200, Andrej Valek wrote:
> > I think, my changes are backport-compatible.
> >
> > The esi feature was not enabled int the previous version. It means,
> > that libxml2/expat was also not required. In the current version, they
> > have invert the logic. So it needs to be explicitly disabled.
> > I have added on option to enable/disable openssl support. Previous
> > version has openssl disabled.

I can confirm that we explicitly had to enable openssl support in squid by =
adding "--with-openssl".
You can also see this as the squid 3.5 recipe builds against OE master whic=
h uses OpenSSL 1.1. But suiqd 3.5 is not compatible with OpenSSL 1.1
The build only fails when adding "--with-openssl".

> You are saying the unconditional DEPENDS in the current version are usele=
ss
> since explicit enabling is required for both options in 3.5.28?
>=20
> It would be good to mention in the description when such a bug existed.
>=20
> > Regards,
> > Andrej
>=20
> cu
> Adrian
>=20
Pascal

