Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web10.15167.1594628746607905133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 01:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=o6odqMlq;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=456410d3b=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1594628746; x=1626164746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ewc5JtA/qZgjYcQf+Pat/cDiSZBv+FYGSODwuGl+lUc=;
  b=o6odqMlqfc4uJvhbmjZHDamlKeBAgt0S4VpvpSqdmtJkbykAnt87nc2m
   ttfqbSyAHKnxs43kxQ+jhRYilGQ4eZaPYs/lbSh4WlR20w1OYLBC/PB5T
   IrVAo4CF2WQSFWi+BW2A9v2zYUTLAkdAEzfrtVjD2HpOUTOX8dWCWyEQc
   w=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 13 Jul 2020 10:25:43 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw2.muc with ESMTP/TLS;
 13 Jul 2020 10:25:43 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp) ([160.48.96.49])
 by esabb5.muc with ESMTP/TLS; 13 Jul 2020 10:25:42 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10m.europe.bmw.corp
 (160.48.96.49) with Microsoft SMTP Server (TLS;
 Mon, 13 Jul 2020 10:25:41 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 13 Jul 2020 10:25:41 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <raj.khem@gmail.com>, <Martin.Jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
Thread-Topic: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
Thread-Index: AQHWTzuheh3t6q+gcEKvV7kMPYyzp6j/SUeAgAAMgICAAAurgIAAi9KAgABstQCAA95HAIAA5iQA
Date: Mon, 13 Jul 2020 08:25:41 +0000
Message-ID: <20200713082540.GX108868@korppu>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
 <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
 <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
 <20200710073738.GQ108868@korppu>
 <06e723c4-54f1-10f8-3d2a-f8be6cca1a06@gmail.com>
In-Reply-To: <06e723c4-54f1-10f8-3d2a-f8be6cca1a06@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA9C6671C76D174FAB423CBEFB865C54@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jul 12, 2020 at 11:41:58AM -0700, akuster wrote:
>=20
>=20
> On 7/10/20 12:37 AM, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >
> > jsoncpp seems to have messy ABI history so I would not update even min=
or versions
> > in stable branch:
> so are you for a revert?

Yes, I would prefer a revert.

-Mikko

> -armin
> > https://abi-laboratory.pro/index.php?view=3Dtimeline&l=3Djsoncpp
> >
> > Cheers,
> >
> > -Mikko
>=20

>=20
