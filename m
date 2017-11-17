Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0062.outbound.protection.outlook.com [104.47.36.62])
	by mail.openembedded.org (Postfix) with ESMTP id 518AF78842
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MGpt/4LK8xZczyKchQhNOR3GIP0MgF3tWlEaiufTZXg=;
	b=T76OfCC7Xdl86KoOtBG8l2/n6kk+j+tmRjw9uD5OU5WA3IlLhaOIjYy6lbhrIIqXjNyvqz/QZYKz2I6dEdstpYI5W1TDrn7CYRufx0DAGU9EQxOAEoG6PFhdPr0nmI0LRr6exzNmnJApqsuwZOfQgum4cueuYw3WKxxy5ISA0PQ=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Fri, 17 Nov 2017 18:28:37 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0218.015;
	Fri, 17 Nov 2017 18:28:36 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Denys Dmytriyenko
	<denis@denix.org>
Thread-Topic: [oe] [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone
	benchmark
Thread-Index: AQHTVMhUM3lvolfC8EmD3PdzQpr8TaMY+a1wgAAAVEA=
Date: Fri, 17 Nov 2017 18:28:36 +0000
Message-ID: <BL2PR02MB216324E719B25BE399EE7784B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1509684158-12893-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<20171103172223.GO9221@denix.org>
	<BL2PR02MB2163EC1C5521CFC3D0E8C228B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
In-Reply-To: <BL2PR02MB2163EC1C5521CFC3D0E8C228B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:wrrORZfHu64TK3lxWnroEOWNDccOrg/h/hwBXv6IBQahjRD0X8iSw9qDS3skhKhHhpcseSaMYcTWxsk3Y65rlDtPT9+GJ7lnyz+wpfTg4VgTcqF9thhIBLYPFRTFpL0a7k9nR6BUR9KUUzP5bVoUAJWDmDtlqqIyJ9HnYjcCjup/x7pmiDHLp+s6K5Vv7KZLvMcQkv2JoLPrapzthTWxKZYsvmUVqAhDrWC270EGZnyQabYza1c3mHD+zvxHX1Jufta+btyUXNFQn6lrViBBTqgmI/B1UbCCu2sT5ljyh9WdZZcRtyE/pBZkS9eieOBwS6B/19x7mt+8AmTAzmkanFZqLMT232Yzomm4PI0Wp1Y=;
	5:OQMk9UZfYzTHdkK4LEpM/EcfKIV3i48SQDdwSwy5Ph/laATa7lfhXPQNqDbtAa8ruHlZcM72wGUrG0T1LUB4vr/S9BWpFQYDokVW3PR8NU4rRru8rZIIUv+EGc/tRNA57LTQCkMQ6u/fiBA74X6H+tQQnI0JH7vRMlJOO+l5oV8=;
	24:jXq/dbez3Kz+5Zv5nDu8ZzTeF64rUmg5JYCkioTx3mLM9ATCnVBi1f5+QrSNOJqwrUNp68BWnm2uBs7s80FvT0Vq4xjLAOgKhTZm5EeJtYk=;
	7:/FucuArUruiqsbWUY8crWqsbq7RDVBLgHzk1tGIpe0ly1ECvVeAd6EqyEeX2ZWvtLopPA9Xd/DpXDF1zMMP6Wf+Fdl0jxRNBhIt/0NdRL7/5+ZS77mN6cmWdE2C5f894qYEcrBq3bflLu6kmLXuary2xd0BexCwa62SaBMkN8TjDTg1jk59IeB9vEcq3e+IuyZPR280g5lRvXKAvooKbj9z0e/AAg42B+xO+UvsOlww/BkdWI6yymF8349REkrHx
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(199003)(24454002)(13464003)(53366004)(81166006)(5250100002)(19273905006)(55016002)(99286004)(478600001)(229853002)(966005)(106356001)(66066001)(6306002)(6506006)(53546010)(6436002)(4326008)(5660300001)(53936002)(2950100002)(2940100002)(316002)(72206003)(9686003)(53376002)(6246003)(97736004)(25786009)(14454004)(7696004)(110136005)(86362001)(305945005)(54356999)(81156014)(6116002)(2900100001)(74316002)(7736002)(8676002)(33656002)(50986999)(101416001)(102836003)(3846002)(8936002)(189998001)(68736007)(105586002)(76176999)(3660700001)(3280700002)(2906002)(1720100001)(563064011)(10090945008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2164;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 02147ff0-00a5-4053-7d7f-08d52de9043c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
x-microsoft-antispam-prvs: <BL2PR02MB216415CFC11F072706618B0EB92F0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(31051911155226)(264703809997249)(192813158149592)(229230349288389);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3231022)(6055026)(6041248)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2164; 
x-forefront-prvs: 049486C505
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02147ff0-00a5-4053-7d7f-08d52de9043c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2017 18:28:36.2621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2164
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Fri, 17 Nov 2017 18:44:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, this was sitting in my outbox and they went out

This has been applied

Thanks,
Manju

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Manjukumar Harthikote Matha
> Sent: Friday, November 17, 2017 10:27 AM
> To: Denys Dmytriyenko <denis@denix.org>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone
> benchmark
>=20
> [This sender failed our fraud detection checks and may not be who they ap=
pear to
> be. Learn about spoofing at http://aka.ms/LearnAboutSpoofing]
>=20
> Ping
>=20
> Thanks,
> Manju
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Friday, November 03, 2017 10:22 AM
> > To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone
> > benchmark
> >
> > On Thu, Nov 02, 2017 at 09:42:38PM -0700, Manjukumar Matha wrote:
> > > The Whetstone benchmark is a synthetic benchmark for evaluating the
> > > performance of computers.
> > >
> > > https://en.wikipedia.org/wiki/Whetstone_(benchmark)
> > >
> > > Signed-off-by: Manjukumar Matha
> > > <manjukumar.harthikote-matha@xilinx.com>
> >
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> >
> >
> > > ---
> > >  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 20
> > > ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >  create mode 100644
> > > meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > >
> > > diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > > b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > > new file mode 100644
> > > index 0000000..8fad04e
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > > @@ -0,0 +1,20 @@
> > > +DESCRIPTION =3D "Whetstone benchmark is a synthetic benchmark for
> > > +evaluating
> > the performance of computers"
> > > +SUMMARY =3D "CPU benchmark to measure floating point performance"
> > > +
> > > +LICENSE =3D "PD"
> > > +LIC_FILES_CHKSUM
> > =3D"file://${WORKDIR}/whetstone.c;beginline=3D1;endline=3D52;md5=3Dc795=
edc15e7
> > e1d92
> > ca8f88ad718449f5"
> > > +
> > > +SRC_URI =3D "http://www.netlib.org/benchmark/whetstone.c"
> > > +SRC_URI[md5sum] =3D "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> > > +SRC_URI[sha256sum] =3D
> > "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
> > > +
> > > +S =3D "${WORKDIR}"
> > > +
> > > +do_compile () {
> > > +   ${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm }
> > > +
> > > +do_install () {
> > > +   install -Dm 0755 whetstone ${D}${bindir}/whetstone }
> > > +
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

