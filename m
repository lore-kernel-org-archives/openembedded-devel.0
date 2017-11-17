Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0041.outbound.protection.outlook.com [104.47.40.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0F29878835
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1hxUZqyqPPQ51Us406Ionb7r9ifHNgFJXoK8Xj+B/1E=;
	b=pNOGuiSDJapHE6gYQ3XhtcbsO6FfO5x7HIDunhjuLKjV2vkbYOGlcgz/RaZhXfmFoyJbysK2NKWd9D90TxY/XO6be7dFC5e9hJL/NulTIpTZbvPvcmdQSK3Bz9ZXe8Ly0fGwMRIhwdEnX0osl9TpObGITOrCdmZuTmEkEqkHep4=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Fri, 17 Nov 2017 18:26:57 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0218.015;
	Fri, 17 Nov 2017 18:26:56 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [oe] [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone
	benchmark
Thread-Index: AQHTVMhUM3lvolfC8EmD3PdzQpr8TaMY+a1w
Date: Fri, 17 Nov 2017 18:26:56 +0000
Message-ID: <BL2PR02MB2163EC1C5521CFC3D0E8C228B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1509684158-12893-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<20171103172223.GO9221@denix.org>
In-Reply-To: <20171103172223.GO9221@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:O763EXxAZJKcNzeR4Ms6678h3kCUp6eFvHakpE2clSqWvZGO8IAMo63f9poZknt+or2AEADYUpPLqMNRIHG9OWOlDchVP58Xxhd/0Yxi/6YnXHYoyQ9h4sbnxAwZ8H0z/IWFb8B0dzHacQm7LH2Mx4KMYYyMaEFKy49+ayGtqcjgk1IDrU6wnuGh6Jqpe/LD0nNwQ2if+HTCWWO08PUAb2/JOEeIJezXE4ip/nIfM3l5dTLnZj+wGyi5oTE6559qWItin58DKwEnhl8Wp7fuF7TL8Zg0UL0JqM+LMCwdswa60ghFw+YrC/BBxeJc1WQbLJPZ4VU1erlsXwxbUnOpwrfby2Hxm2KEE8WZT4P5BgY=;
	5:IDqcl5owC2RcokxHAGTz2Vsap1pgN5P2XgeZn/tQ/GMtl0oF+wJ0aHvQahF0RjtRYkuJ02Kn4oJAoeRQPusfblynjb5HfG2vC9uec7Xeke9Td61unV+Gtp5Dx2rWh66CpdBeAXtVGSX6vgbo0U5RETc2ITjMwqkmyxpIwyyqFPo=;
	24:wjRbnnHkHMuekKv2guVhYnNpY8jQTF9YxCAsi3jxsIJ7wYxruL5o+fwqD7qT80QrnJL9qZ+ZAyiN4x2APz8TrPEnVByzeGo6c7xusAl3NeU=;
	7:nPKZeb+zvIK012kulkk/kbaOY6UyIHnM0pf4ntCUrW0WTYmspe1FH/bn+OysMn/4HsZudiTyabh6WC0hBb3SzAgi8lJk7prITRSOUkP+rp4krSolNJM/kIK8qT6zNdj+VPXWjcg4JVK+LW370azhx7nCcg1sf0iqjD4SzA8jQPUzd8J2oMUKRCVkFhBniravIya+dGMcmtVY0R0fdkCtb4pkMkRDB2kjVEWp229GvJRsv7lLzRZDsuMc60NBRS6s
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 53ca3185-f559-4af4-2e77-08d52de8c8c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
x-microsoft-antispam-prvs: <BL2PR02MB2164433EA2946897CE8B5207B92F0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(31051911155226)(264703809997249)(192813158149592)(229230349288389);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3231022)(6055026)(6041248)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2164; 
x-forefront-prvs: 049486C505
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(199003)(24454002)(13464003)(81166006)(5250100002)(19273905006)(55016002)(99286004)(478600001)(229853002)(966005)(106356001)(66066001)(6306002)(6506006)(53546010)(6436002)(4326008)(5660300001)(53936002)(6916009)(2950100002)(316002)(72206003)(9686003)(6246003)(97736004)(25786009)(14454004)(7696004)(86362001)(305945005)(54356999)(81156014)(6116002)(2900100001)(74316002)(7736002)(8676002)(33656002)(50986999)(101416001)(102836003)(3846002)(8936002)(189998001)(68736007)(105586002)(76176999)(3660700001)(3280700002)(2906002)(1720100001)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2164;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ca3185-f559-4af4-2e77-08d52de8c8c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2017 18:26:56.4321 (UTC)
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
X-List-Received-Date: Fri, 17 Nov 2017 18:26:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

Thanks,
Manju

> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Friday, November 03, 2017 10:22 AM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v4] whetstone_1.2.bb: Add whetstone
> benchmark
>=20
> On Thu, Nov 02, 2017 at 09:42:38PM -0700, Manjukumar Matha wrote:
> > The Whetstone benchmark is a synthetic benchmark for evaluating the
> > performance of computers.
> >
> > https://en.wikipedia.org/wiki/Whetstone_(benchmark)
> >
> > Signed-off-by: Manjukumar Matha
> > <manjukumar.harthikote-matha@xilinx.com>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
>=20
> > ---
> >  meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb | 20
> > ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644
> > meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> >
> > diff --git a/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > new file mode 100644
> > index 0000000..8fad04e
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION =3D "Whetstone benchmark is a synthetic benchmark for eval=
uating
> the performance of computers"
> > +SUMMARY =3D "CPU benchmark to measure floating point performance"
> > +
> > +LICENSE =3D "PD"
> > +LIC_FILES_CHKSUM
> =3D"file://${WORKDIR}/whetstone.c;beginline=3D1;endline=3D52;md5=3Dc795ed=
c15e7e1d92
> ca8f88ad718449f5"
> > +
> > +SRC_URI =3D "http://www.netlib.org/benchmark/whetstone.c"
> > +SRC_URI[md5sum] =3D "d8eb2cd7104bb5a12d614ac6d3f1f9fb"
> > +SRC_URI[sha256sum] =3D
> "333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf"
> > +
> > +S =3D "${WORKDIR}"
> > +
> > +do_compile () {
> > +	${CC} ${CFLAGS} ${LDFLAGS} -Ofast -o whetstone whetstone.c -lm }
> > +
> > +do_install () {
> > +	install -Dm 0755 whetstone ${D}${bindir}/whetstone }
> > +
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

