Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0061.outbound.protection.outlook.com [104.47.36.61])
	by mail.openembedded.org (Postfix) with ESMTP id 908577883F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1D/BhhV7sTQNJRWK36OITaFTnofZm4xUXCMQNcEoBsI=;
	b=fuMPTUJ3vxmxaoNXnnspSGXdOAq8FpSbpdeY2n6TqAHVl8RJc7fCAvoiryMJqChvwx7Pa2bZ4RIWs7X38PA1pLOFT8RkY/gDPUF+KwxoXu2ujv5qS3d7QhHUkQPEYwSWVLBnaDjUYL42LhZ/dUHDLFUrT8n3NLGypPhZmMREpYg=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Fri, 17 Nov 2017 18:28:39 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0218.015;
	Fri, 17 Nov 2017 18:28:39 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH v3] linpack_1.0.bb: Add linpack benchmark
Thread-Index: AQHTU5OpcBl1DzZjtEiXmgSXcKjWsKMY/C1ggAAAbvA=
Date: Fri, 17 Nov 2017 18:28:39 +0000
Message-ID: <BL2PR02MB2163161430973E379C3F48F9B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1509596826-21204-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<BL2PR02MB216393A549AF19E13C4A8F55B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
In-Reply-To: <BL2PR02MB216393A549AF19E13C4A8F55B92F0@BL2PR02MB2163.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:qu3Eys6r+O9UeNl02ttRNuZBfXtD+btJFY219zDD0rspImsKAIQXlFXu3Dh8MjsyabZkgfgRcps/vwE1G+dT996oToLxg8xQoK75AW+UZBf+SndPNuxe1/saS7Zo+hEObZiIHOwBAVZXOJAPDdK4HQ51lOpqGyvXVe7B1yI4gj6Fr5SbgOtfT+bXxf4gDc1PMOY67mx4CDnbobRJfnkhVvjZczYPmeEeyzXlUaKGr0Umb8DUn1rsPzi0/ODFR5wkUZZegmoul101uITiX76i8ak7nKIfP27BD2tbVEyqZ8w3bUIgJt00BUtM5awzuQ8effgF20vMJWKqntz+kobLX7ssX1oB2WLOsEHpsjZj1E0=;
	5:msHL/IYN9TKs5Y/rnghZr3VAL2ajgczz2fayBy4a2/idqztcp7/kG/KKu2+nJq27IY/QFPAy955yYrved+GWXWZDwJ9OuOeJVAlBUAkIPV3rJOYEPz0tmf/hY32N2ic9mdKHcTbXTO9NMjwt9hLrTJtsoZsM6F/f2Pqg9ADwQPU=;
	24:PH8QA6JKOM8hIMpXD+Xmybr76c4ffPccADNQC2kVqWB+xpOJ+AYRt3l6yQLzW3xj7tkeVizYbq4qGGMVvQnGh3BI21J2r5h/AHpxymqCjQM=;
	7:QxfvztQRmgZ3vUr9zH1K7NPu8APZzh97bJyAOI+Som29NQ+lXBaQNyJvSBHnP0+7JDQaOtNq37mHK5JXpsmtpm83MxFcJpuUmcvLp2idG0hnHUx5JUHZdPEgr83zwI5nvxG1QVRlY7ZVNkhds6lSub+ZJHiGsujjhfmRglEQorghc1x9TU9pVHYVtBPqORV5tDNYk6yivqlYQ1rxnLF9fl9srH9SklL/U3uXCnBo6ONIP4uez49GxmrrzxG3gyw6
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: af510e35-0d3d-412d-1acc-08d52de9061e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
x-microsoft-antispam-prvs: <BL2PR02MB2164458FF5596549DB0FC2BAB92F0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592)(229230349288389); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3231022)(6055026)(6041248)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2164; 
x-forefront-prvs: 049486C505
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(199003)(13464003)(575784001)(2501003)(81166006)(5250100002)(55016002)(99286004)(478600001)(229853002)(966005)(106356001)(66066001)(6306002)(6506006)(53546010)(6436002)(5660300001)(53936002)(6916009)(2950100002)(2940100002)(316002)(72206003)(9686003)(6246003)(97736004)(25786009)(5640700003)(14454004)(7696004)(86362001)(305945005)(2351001)(54356999)(81156014)(6116002)(2900100001)(74316002)(7736002)(8676002)(33656002)(50986999)(101416001)(102836003)(3846002)(8936002)(189998001)(68736007)(105586002)(76176999)(3660700001)(3280700002)(2906002);
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af510e35-0d3d-412d-1acc-08d52de9061e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2017 18:28:39.3403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2164
Subject: Re: [meta-oe][PATCH v3] linpack_1.0.bb: Add linpack benchmark
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
X-List-Received-Date: Fri, 17 Nov 2017 18:43:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, this was sitting in my outbox and they went out

This has been applied

Thanks,
Manju

> -----Original Message-----
> From: Manjukumar Harthikote Matha
> Sent: Friday, November 17, 2017 10:27 AM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; openembedded-
> devel@lists.openembedded.org
> Subject: RE: [oe][meta-oe][PATCH v3] linpack_1.0.bb: Add linpack benchmar=
k
>=20
> Ping?
>=20
> Thanks,
> Manju
>=20
> > -----Original Message-----
> > From: Manjukumar Matha [mailto:manjukumar.harthikote-matha@xilinx.com]
> > Sent: Wednesday, November 01, 2017 9:27 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> > Subject: [oe][meta-oe][PATCH v3] linpack_1.0.bb: Add linpack benchmark
> >
> > The LINPACK Benchmarks are a measure of a system's floating point
> > computing power. Introduced by Jack Dongarra, they measure how fast a
> > computer solves a dense n by n system of linear equations Ax =3D b,
> > which is a common task in engineering.
> >
> > https://en.wikipedia.org/wiki/LINPACK_benchmarks
> >
> > Signed-off-by: Manjukumar Matha
> > <manjukumar.harthikote-matha@xilinx.com>
> > ---
> >  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 20
> > ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> >
> > diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> > b/meta-oe/recipes- benchmark/linpack/linpack_1.0.bb new file mode
> > 100644 index 0000000..aed95cd
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION =3D "LINPACK Benchmarks are a measure of a system's
> > +floating point
> > computing power"
> > +SUMMARY =3D "LINPACK is a software library for performing numerical
> > +linear algebra
> > on digital computers"
> > +
> > +LICENSE =3D "PD"
> > +LIC_FILES_CHKSUM
> > =3D"file://${WORKDIR}/linpacknew.c;beginline=3D1;endline=3D23;md5=3Daa0=
25e3bc4
> > 4190c7
> > 1e4c5e3b084fed87"
> > +
> > +SRC_URI =3D
> >
> "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=3Dlinpackn=
ew.c"
> > +SRC_URI[md5sum] =3D "1c5d0b6a31264685d2e651c920e3cdf4"
> > +SRC_URI[sha256sum] =3D
> > "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
> > +
> > +S =3D "${WORKDIR}"
> > +
> > +do_compile () {
> > +	${CC} ${CFLAGS} ${LDFLAGS} -o linpack linpacknew.c -lm }
> > +
> > +do_install () {
> > +	install -Dm 0755 linpack ${D}${bindir}/linpack }
> > +
> > --
> > 2.7.4


