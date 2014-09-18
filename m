Return-Path: <B40869@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0118.outbound.protection.outlook.com [207.46.100.118])
	by mail.openembedded.org (Postfix) with ESMTP id BDC0A71458
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Sep 2014 08:36:38 +0000 (UTC)
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com (25.160.78.150) by
	BN1PR0301MB0755.namprd03.prod.outlook.com (25.160.78.15) with Microsoft
	SMTP Server (TLS) id 15.0.1029.13; Thu, 18 Sep 2014 08:36:38 +0000
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) by
	BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) with
	mapi id 15.00.1034.003; Thu, 18 Sep 2014 08:36:38 +0000
From: "B40869@freescale.com" <B40869@freescale.com>
To: Khem Raj <raj.khem@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
Thread-Index: AQHP0iHzgkzay2Pt5UyQ7lRmTAkn65wF9YYAgACbODw=
Date: Thu, 18 Sep 2014 08:36:35 +0000
Message-ID: <1411029954445.49205@freescale.com>
References: <1410921525-20513-1-git-send-email-b40869@freescale.com>,
	<CAMKF1sr34LcpU_EGoG2MFdsSekarU7sGw9KaBiuLFkx9ggrDTQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr34LcpU_EGoG2MFdsSekarU7sGw9KaBiuLFkx9ggrDTQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.158.211]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;UriScan:;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(189002)(377454003)(199003)(20776003)(77096002)(105586002)(46102003)(81542003)(76482002)(107046002)(21056001)(85852003)(74662003)(77982003)(99286002)(95666004)(85306004)(80022003)(19580395003)(76176999)(66066001)(81342003)(99396002)(101416001)(19580405001)(74502003)(107886001)(79102003)(90102001)(54356999)(83322001)(50986999)(64706001)(86362001)(92726001)(31966008)(36756003)(117636001)(92566001)(106356001)(87936001)(2656002)(4396001)(83072002)(106116001)(97736003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR0301MB0755;
	H:BN1PR0301MB0756.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Thu, 18 Sep 2014 08:36:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=0A=
=0A=
I add it to fix a build error:=0A=
...=0A=
| pimd.h:36:25: fatal error: netinet/pim.h: No such file or directory=0A=
|  #include <netinet/pim.h>=0A=
...=0A=
=0A=
netinet/pim.h is under ${S}/include,=0A=
and in ${S}/include/README, it said "This directory contains missing system=
 headers".=0A=
=0A=
BR,=0A=
YangHaibo=0A=
________________________________________=0A=
From: Khem Raj <raj.khem@gmail.com>=0A=
Sent: Thursday, September 18, 2014 7:12 AM=0A=
To: openembeded-devel=0A=
Cc: Yang Haibo-B40869=0A=
Subject: Re: [oe] [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1=
.8=0A=
=0A=
On Tue, Sep 16, 2014 at 7:38 PM, YangHaibo <b40869@freescale.com> wrote:=0A=
> +CFLAGS_prepend =3D "-I ${S}/include "=0A=
=0A=
can you explain this change ?=0A=

