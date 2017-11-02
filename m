Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0041.outbound.protection.outlook.com [104.47.34.41])
	by mail.openembedded.org (Postfix) with ESMTP id 822F578307
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 19:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BtkTeqXushfOA48Zl1rATSZsb1nO6kn2z4O8PszNcIY=;
	b=AWZaQ99uijW+CzX919i9RynCBOuTXqGK1nQNGDIe2SbCrgGMxzzIIwg439MyVZgIyXH2ULV6OfPmLKesTmWKdAJXrzXFqgrMq6OmqddlThki0QCqMV56aCgoFhEzqaHQaPnLsdlVeABJpv5MTJx3aM8YFYMUcnZredPZ8oxW02Y=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Thu, 2 Nov 2017 19:22:14 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0178.015;
	Thu, 2 Nov 2017 19:22:14 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [oe] [meta-oe][PATCH v3] whetstone_1.2.bb: Add whetstone
	benchmark
Thread-Index: AQHTVA+6H8IeIr5HokG8FnpOiFfKTKMBd5Xg
Date: Thu, 2 Nov 2017 19:22:14 +0000
Message-ID: <BL2PR02MB216374A4AA8B0C851405F93BB95C0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1509596819-21148-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<20171102192059.GM9221@denix.org>
In-Reply-To: <20171102192059.GM9221@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:o3zcdSQ2Ea3PMw6dLYyApb0xVvjEDTOv8ivTuSXmNAklRlke3NrFkFR7ha/fnc1fgKWIKfdZwv5A9bl1aBPldL3be+PKO5NsGv8BxwMLe4KamLipTNMPUqCiXh4qxDWTgeQxJdeE92dRWCjhIScTOa6widAgRj1EyVZe3t8TCAVrKfD1WJnzItqM4t+gSfTHi7Ecf4RQGHl5smkANpTT2naLUoKOjOt70TamUsmNXJbuKl+vV4vQVMdQwhQ8s3R+LuhljPI6D7h8uD48XQnyZhc9BA66lAJkbviXE49FFX4AnvYCQ3hZ3k2uHM8/df31F6sqE38LUyDhbJXH/rGVWHRF9MFtaFPKgqXlsvKca7k=;
	5:IsiWk9/47eAliNfC5SMLGm9BQgaj9nWDbf/nxA+Za9ybn5n1GzNT3TkaEro6kkyTLQ41g9aiZ362v0BcL/jV+8NrvaE3K/mEve9i63cPjNyArVCsjC82pl2TNJlKUqz5owdE74RtbLMajLoQ/c9XsfcYeSBxsYyVFfLZ8/B7Hso=;
	24:N9Gxrv4vd+Qn8HRvOw8HgefL8bMWSiKWrDfeeQemlxI2KDSTaPA2rourq75RmKdi8IOCFjPHutWbyda5mZzsYSWW4PQQIJOeMHYa41VOk00=;
	7:Z3JHQw38ujo1mLpD/d/lMA5/BqS9veXC6VQgoYmNupNP+Ylv2r7bXI+nCIWRW/NusJoHKmSul0YQJMz2FqmX5WO1PdEZXp8T0ytw09EH2RhjuaXCorFpEzNCzEs3TOYwxMukEyBWCsCwY6rr6Ra2vkL6UGv20+ZRe9h7aSXIBg2X/FgpL2qBLwOzenLsMr1d3jjCN/yJ+8G59JtKZob6uysK0RVKl4xODgVN7WWFmXeshZZQZHWQdEohofBfdPpH
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 93740d11-d2cb-4147-97ff-08d522270666
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603238);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-microsoft-antispam-prvs: <BL2PR02MB216476A4AD5D96FC8C8F921FB95C0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(3231020)(6055026)(6041248)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2164; 
x-forefront-prvs: 047999FF16
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(13464003)(24454002)(189002)(199003)(55016002)(74316002)(2900100001)(7736002)(316002)(86362001)(68736007)(66066001)(19273905006)(99286004)(97736004)(6306002)(102836003)(6116002)(76176999)(3846002)(54356999)(305945005)(33656002)(50986999)(105586002)(101416001)(106356001)(53936002)(189998001)(3280700002)(3660700001)(6436002)(6506006)(6246003)(2906002)(9686003)(4326008)(7696004)(1720100001)(478600001)(72206003)(81156014)(8676002)(8936002)(81166006)(5250100002)(14454004)(229853002)(53546010)(5660300001)(25786009)(2950100002)(6916009)(966005)(563064011);
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93740d11-d2cb-4147-97ff-08d522270666
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2017 19:22:14.7842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2164
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Thu, 02 Nov 2017 19:22:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, November 02, 2017 12:21 PM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v3] whetstone_1.2.bb: Add whetstone
> benchmark
>=20
> On Wed, Nov 01, 2017 at 09:26:59PM -0700, Manjukumar Matha wrote:
> > The Whetstone benchmark is a synthetic benchmark for evaluating the
> > performance of computers.
> >
> > https://en.wikipedia.org/wiki/Whetstone_(benchmark)
> >
> > Signed-off-by: Manjukumar Matha
> > <manjukumar.harthikote-matha@xilinx.com>
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
> > index 0000000..a5f963d
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/whetstone/whetstone_1.2.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION =3D "CPU benchmark to measure floating point performance"
> > +SUMMARY =3D "Whetstone benchmark is a synthetic benchmark for evaluati=
ng the
> performance of computers"
>=20
> Actually it's the other way around ^^^
>=20

Ok V4 it is ;)

Thanks,
Manju

>=20
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

