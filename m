Return-Path: <prvs=6721abd1e0=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id A669D786C9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 08:34:56 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w628UewB032113; Mon, 2 Jul 2018 03:34:56 -0500
Received: from nam03-by2-obe.outbound.protection.outlook.com
	(mail-by2nam03lp0056.outbound.protection.outlook.com [216.32.180.56])
	by mx0b-00010702.pphosted.com with ESMTP id 2jx6u1bsdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 02 Jul 2018 03:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IDr3gKOLIYYBu15FzhSxCPBy3g46XoN1FEWVEHmR8cc=;
	b=UGRus6c7989YzXEkLzXQx4+VlnxiUjp62jVfesKfSahn00z8dROG3itB6jxPQ3oPuWSjNoKvp1N8lR4l7w0E52K4smPDhcH1gkd2Ppp9oWdymf7ce13b5wMG3i17J0cL96SLF0Rd6PmR5LGpCaD1I9CK5CT42lpQyiRP9KVoamg=
Received: from MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) by
	MWHPR04MB1055.namprd04.prod.outlook.com (10.174.250.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.25; Mon, 2 Jul 2018 08:34:53 +0000
Received: from MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989]) by
	MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989%3]) with mapi id 15.20.0906.026;
	Mon, 2 Jul 2018 08:34:53 +0000
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to
	0.0.6
Thread-Index: AQHUD5Ont3pM0Gp7sEy0uOw1gExrh6R3P6yAgAAHWyOAAAocAIAETmuc
Date: Mon, 2 Jul 2018 08:34:53 +0000
Message-ID: <MWHPR04MB097627C4AA6392C453346B5098430@MWHPR04MB0976.namprd04.prod.outlook.com>
References: <20180629101758.28179-1-alexandru.vasiu@ni.com>
	<CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
	<MWHPR04MB097618A7658FEC9BA2B59757984E0@MWHPR04MB0976.namprd04.prod.outlook.com>,
	<CAMKF1spePt0Zm3eqagOmjoyzMHqTrokwGGdGRXMX80deEbHEnQ@mail.gmail.com>
In-Reply-To: <CAMKF1spePt0Zm3eqagOmjoyzMHqTrokwGGdGRXMX80deEbHEnQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [80.97.64.55]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1055;
	7:DS1JfsMpo394ncY6QyfB5kwG8Azh0xpm79FPv1YeCsNFXsAYKYOaPD1k3v9crupSr+j01hgmb42mqMCn1IeUQoHKSmNWT6BXNPyOUlmsPbPUfShmNN6NbL8cUHE7LM6wad0lBvGkI/auY8PiDWEmmTYCnkonsHvOHibPwzuDnQ121TEMq3Mq//MNw+qYYXsOmtGUBPFPMsCJGsZutP+EH8Z9qyg4Y1VJlF4AwcTXAnrza+OmUZqZapBBXXUJMj2r
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2abd10f2-d59b-4d8d-97dc-08d5dff6af1d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1055; 
x-ms-traffictypediagnostic: MWHPR04MB1055:
x-microsoft-antispam-prvs: <MWHPR04MB10551099E214973BD0C8F60D98430@MWHPR04MB1055.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(85827821059158)(264703809997249)(145744241990776);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB1055; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1055; 
x-forefront-prvs: 07215D0470
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(2900100001)(81156014)(8676002)(81166006)(478600001)(97736004)(6436002)(8936002)(44832011)(486006)(476003)(11346002)(6116002)(446003)(3846002)(14454004)(256004)(229853002)(74316002)(54896002)(6306002)(966005)(93886005)(2906002)(86362001)(14444005)(236005)(5250100002)(9686003)(25786009)(316002)(99286004)(575784001)(55016002)(6606003)(102836004)(66066001)(4326008)(33656002)(53936002)(6246003)(39060400002)(6506007)(5660300001)(7696005)(68736007)(105586002)(7736002)(6916009)(106356001)(19627405001)(26005)(53546011)(186003)(76176011)(606006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1055;
	H:MWHPR04MB0976.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: kpkbYxiFMa1/zHBs/NanMeQ17KqDWUbT2pY6Bv+6rgsNU1tgpZI/LT7GxrzSsJPFva66gvh3uMCIVvRbeAhTPeawxkZfDRYa8knv/LHntlgYaEk4XcQfGv2fdjZbhVwmY0JFECzr1cdOcvYyu8faUSu9v8Ma/+51bA1DcsTQjfYvYPp5EGd9pvIdgTudx2ovrNoM71ge1/UMneSV5jcko8frC2pY16AimbZT5cUaKkmtUq1jJE1ncx9SO2+ZRME/+eMgP7WRk9aWyt1IEWC/NBDTTs5nYYGJsEybo9TWMSH4ofGo0ZxRMTrtPc2AAbROzexCIaLzji5M+x5jXZhAsUG6nB9DgeMELWdEjqo+G98=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abd10f2-d59b-4d8d-97dc-08d5dff6af1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2018 08:34:53.4600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1055
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807020100
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to 0.0.6
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
X-List-Received-Date: Mon, 02 Jul 2018 08:34:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'll change the LICENSE in pypi repo to have the original line endings and =
I'll resend the patch.


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Friday, June 29, 2018 5:47 PM
To: Alexandru Vasiu
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to =
0.0.6

Hi Alexander,

Please add a line or two about why license checksum has changed and
resend the patch
On Fri, Jun 29, 2018 at 7:15 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wr=
ote:
>
> I fixed getIfaces which returns all network interfaces from system. [1]
>
>
> Alex
>
>
> [1] - https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_b=
at-2Dserjo_PyIface_pull_11&d=3DDwIFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZu=
IPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3DQRMFvPHHQw-3=
94ILp_uPGveN_LT1bHkj_qfmp12nFGM&s=3DaqvdL-Qq2V1_9Wwt1BD3_IDi01VEwbJ3pX7eC7u=
VNq4&e=3D

>
>
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, June 29, 2018 4:45 PM
> To: Alexandru Vasiu
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade t=
o 0.0.6
>
> On Fri, Jun 29, 2018 at 3:26 AM Alexandru Vasiu <alexandru.vasiu@ni.com> =
wrote:
> >
> > Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> > ---
> >  meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
> >  .../{python-pyiface_0.0.5.bb =3D> python-pyiface_0.0.6.bb}    | 0
> >  .../{python3-pyiface_0.0.5.bb =3D> python3-pyiface_0.0.6.bb}  | 0
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb =
=3D> python-pyiface_0.0.6.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb =
=3D> python3-pyiface_0.0.6.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/m=
eta-python/recipes-devtools/python/python-pyiface.inc
> > index 620b244c6..8e464a83f 100644
> > --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> > +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> > @@ -3,9 +3,9 @@ SECTION =3D "devel/python"
> >  HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__p=
ypi.python.org_pypi_pyiface_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZ=
ZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3D5tZAgNTd4p=
-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DvAz7s9Lx6KxR7duweLBdBkFuJ4wXLJnWdXwP7=
8oEIX4&e=3D"
> >  LICENSE =3D "GPLv3+"
> >
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fe869ee987a340198fb0d5=
4c55c47f1"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfe06497acaf4f45999925d3=
48c2605f9"
> >
> what changed here ?
>
> > -SRC_URI[md5sum] =3D "06c3c71fe51df740dae6a88a13afb5e0"
> > -SRC_URI[sha256sum] =3D "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1=
bf903ec32e043af924"
> > +SRC_URI[md5sum] =3D "2379d8d4506e6c4d83cf3d4824abce8b"
> > +SRC_URI[sha256sum] =3D "774ea47bb1387e493f6d5d0937b68fa28202c948eccddb=
d6e4cf2d708dcd86f2"
> >
> >  inherit pypi
> > diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.b=
b b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
> > rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.=
bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.b=
b
> > rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org_mailman_listinfo_openembedded-2Ddevel&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVd=
yO6YCiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8=
&m=3D5tZAgNTd4p-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DcJjM59nw1Gsf8kbrzR07Sz=
nshRlnyt9NTHExIi4LP1I&e=3D

