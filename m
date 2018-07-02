Return-Path: <prvs=6721abd1e0=alexandru.vasiu@ni.com>
X-Greylist: delayed 533 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Jul 2018 06:51:48 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id C4793783F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 06:51:48 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w626eg3E016212; Mon, 2 Jul 2018 01:42:55 -0500
Received: from nam01-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam01lp0176.outbound.protection.outlook.com
	[216.32.180.176])
	by mx0b-00010702.pphosted.com with ESMTP id 2jx6u1bjkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 02 Jul 2018 01:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zMxQ1SOlB+LbDTbDIvNtKFfsfkmqW1vLzGlv2xmmCD8=;
	b=Q5Vgjgymuy2F+OzHntIEMFer2oNb8rt3dVDsJlekmHfPErrVe6YTpEdDqnfzzyvrOIjovwyWqoPvDrnZFt4dz0zWKZQb3+iaASCsfCxgBI9IZL9bu7nmFSyn15Ym+kXqLE9Le75FTGDnFCkm9DIfXiCa4ONdC9TTwTjlcWIo5kg=
Received: from MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) by
	MWHPR04MB0609.namprd04.prod.outlook.com (10.173.49.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.25; Mon, 2 Jul 2018 06:42:52 +0000
Received: from MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989]) by
	MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989%3]) with mapi id 15.20.0906.026;
	Mon, 2 Jul 2018 06:42:52 +0000
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to
	0.0.6
Thread-Index: AQHUD5Ont3pM0Gp7sEy0uOw1gExrh6R3P6yAgAAHWyOAAAocAIAELs03
Date: Mon, 2 Jul 2018 06:42:52 +0000
Message-ID: <MWHPR04MB097647C999B588A7A960698098430@MWHPR04MB0976.namprd04.prod.outlook.com>
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
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0609;
	7:UpZlkbG1JwP27DYh0lHjWptxB7foRMPEtBFJInZ207lircDB7/NqaMQxokZYM5mq6CgOi/oU8JcdzKmAkR5weZhjDivIeyx2YoELW/Q9WCjWC++0XGtYs5FJwVGH3HMDCsJpDEol4vodGxlQtfKqV6XYZzIxsi0e6cal1Yc0AcRgNXQNv+XjKn58USkUgYaYy0Nlyqjue3QcYZOKzJcm7cHgUYX2OpTjvVjytH+kWqHDIKfp0pEUUkdpX/Ww2fXq
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 7920e58d-3150-4bf6-2791-08d5dfe7090b
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0609; 
x-ms-traffictypediagnostic: MWHPR04MB0609:
x-microsoft-antispam-prvs: <MWHPR04MB0609FFBEBE7C012A5EBA50EC98430@MWHPR04MB0609.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(85827821059158)(264703809997249)(145744241990776);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231254)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0609; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0609; 
x-forefront-prvs: 07215D0470
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(396003)(376002)(39850400004)(366004)(199004)(189003)(236005)(81156014)(81166006)(3846002)(6116002)(316002)(6606003)(33656002)(6306002)(5250100002)(14454004)(6436002)(6246003)(966005)(229853002)(9686003)(93886005)(6916009)(8676002)(8936002)(55016002)(99286004)(53936002)(68736007)(5660300001)(54896002)(446003)(97736004)(575784001)(86362001)(478600001)(105586002)(66066001)(19627405001)(106356001)(476003)(486006)(6506007)(76176011)(14444005)(256004)(39060400002)(102836004)(606006)(74316002)(44832011)(11346002)(4326008)(7736002)(186003)(53546011)(26005)(2900100001)(7696005)(25786009)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0609;
	H:MWHPR04MB0976.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: HMvKR0XJT1b3utJkl8HM17YKQ8155FewuL5/CzOx0w+SMt32UCF2Lr92tMsg4nAOphm5e5G4jIk7vb0jKeOvMkrnL+RtRQraTqbHNCitEzxLX+fU1EKOJ4lKljXGWlSqTizsUIFv40QYWGhvE/xO6ouYdcg7Ez4eSbBfNAuo24nRNqjtL6PklbOd7Ebo0ZawsWugWCXZx4CFk7fDkUIdp1IMxDUJjvjQ7swiOvUrfleTxufhjQynsKjbIuCfNcSo0+ecVZ14sk/32IAY9aNmdY0p73p2TmUm43s3Op8/oGDVP3ANx5Py6uC/Og95nfPHuNw2gDjlrnR43MtN7ZcnPh8ae/AEE3bUucAW8vku6Cc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7920e58d-3150-4bf6-2791-08d5dfe7090b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2018 06:42:52.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0609
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807020078
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
X-List-Received-Date: Mon, 02 Jul 2018 06:51:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,


I found that end of each line from LICENSE.txt  changed from \n to \r\n wit=
hout any intention. So, that's why the md5sum changed. I think this is ok.



Alex

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

