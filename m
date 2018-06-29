Return-Path: <prvs=67189f18c8=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1C99775264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:15:57 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w5TEBj6x001716; Fri, 29 Jun 2018 09:15:57 -0500
Received: from nam05-co1-obe.outbound.protection.outlook.com
	(mail-co1nam05lp0079.outbound.protection.outlook.com [216.32.181.79])
	by mx0a-00010702.pphosted.com with ESMTP id 2jw1prbbf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 29 Jun 2018 09:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vh3/iMRq1QxoYcTMfuaz04uD3voBugNExoq0cOwDeQk=;
	b=P0I8Hln2UQ0uiervWVmhcaHM2mXnFs20QqwHX2hg05TfXCBnvKO9f/DfHy1vg9/AzDlcduJxWfwI7wKJ3aGlpJbUxOkTzzS9xY+B+bMYXxC2L8HQcKuyEVeABYduMzfx0GkuWR3JXalsdZbcmYHA9YY+BYA4Q4U2hUVRkN+TFyU=
Received: from MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) by
	MWHPR04MB0287.namprd04.prod.outlook.com (10.169.202.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.24; Fri, 29 Jun 2018 14:15:55 +0000
Received: from MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989]) by
	MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989%3]) with mapi id 15.20.0906.025;
	Fri, 29 Jun 2018 14:15:55 +0000
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to
	0.0.6
Thread-Index: AQHUD5Ont3pM0Gp7sEy0uOw1gExrh6R3P6yAgAAHWyM=
Date: Fri, 29 Jun 2018 14:15:55 +0000
Message-ID: <MWHPR04MB097618A7658FEC9BA2B59757984E0@MWHPR04MB0976.namprd04.prod.outlook.com>
References: <20180629101758.28179-1-alexandru.vasiu@ni.com>,
	<CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq6Q1p0fpzVzA0U3b-t6N3ieSDme6B5-ZaK0tLBazz8PQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [109.166.154.151]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0287;
	7:dpYS+6jIpUw2gdjtZks1nF1s6VnoDbae92llBvvZiVybloqBrAu9WFzT3wsY1NbDntXcmnVIJ/w16ci3psaEml3BS7IloEy7y1X8Gl8L4GWdHwU7vfM0ny1RdEpNH+A9pJV8xjbeaTdtHfy0Qj1DF2SUpu9vxW/7u3s3E2Ult/iPFhWi6lbJlHwEDGfkCsiTL04afl+s53boW+ihtrgPt51yzMdK3TGRkCJykL2MhB++ace56EO23mRjsHlZYb+a
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b6bc118a-402c-47c5-bae7-08d5ddcad409
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0287; 
x-ms-traffictypediagnostic: MWHPR04MB0287:
x-microsoft-antispam-prvs: <MWHPR04MB0287BC6221E9D5440C9FA612984E0@MWHPR04MB0287.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(166708455590820)(85827821059158)(264703809997249)(145744241990776);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0287; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0287; 
x-forefront-prvs: 0718908305
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(99286004)(33656002)(229853002)(606006)(44832011)(7696005)(5250100002)(106356001)(186003)(105586002)(476003)(19627405001)(97736004)(2900100001)(486006)(26005)(53936002)(39060400002)(2906002)(74316002)(66066001)(102836004)(7736002)(316002)(256004)(8676002)(53546011)(14444005)(25786009)(4326008)(55016002)(76176011)(6436002)(8936002)(81156014)(446003)(54896002)(9686003)(236005)(6506007)(6306002)(575784001)(81166006)(6606003)(11346002)(6916009)(86362001)(5660300001)(14454004)(6246003)(6116002)(478600001)(966005)(68736007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0287;
	H:MWHPR04MB0976.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: apIFJqtqYA+ATFp1gvc4ndUmoEhuUGYPEVjMiYyZrxqVxxZI60Sgn6smuZbD4dOO/Ny488wMAEKngCYQsghM/fAAaGjFJTQdk5daQLXvsLQup8s9h9ZVbs7d9YIHTlE2n8itHjd74FaunZrPoiFMV+AUxgrhMi5JXxmZbx3SCYkta3+aNAGtOgIsk5TvJrqZK/m7gm3LL+xp3+JKUvU4Yg8tGYsmCv6E/hu56R0NN+T6H+PSdxiRcW0LRDDdrSH+zG/sxYS7N5ULO4CVcbZCM8zj4RzqwqGNxPQpPzgSZ0rFMj7aVMdsrxeQuFNDRejHRlvEtLj24PuXIApFMwMu8xI1Rbily3Ik2HeCbttD+mg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bc118a-402c-47c5-bae7-08d5ddcad409
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2018 14:15:55.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0287
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-06-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1806290153
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
X-List-Received-Date: Fri, 29 Jun 2018 14:15:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I fixed getIfaces which returns all network interfaces from system. [1]


Alex


[1] - https://github.com/bat-serjo/PyIface/pull/11



________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Friday, June 29, 2018 4:45 PM
To: Alexandru Vasiu
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to =
0.0.6

On Fri, Jun 29, 2018 at 3:26 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wr=
ote:
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc      | 6 +++---
>  .../{python-pyiface_0.0.5.bb =3D> python-pyiface_0.0.6.bb}    | 0
>  .../{python3-pyiface_0.0.5.bb =3D> python3-pyiface_0.0.6.bb}  | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.5.bb =3D>=
 python-pyiface_0.0.6.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.5.bb =3D=
> python3-pyiface_0.0.6.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/met=
a-python/recipes-devtools/python/python-pyiface.inc
> index 620b244c6..8e464a83f 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -3,9 +3,9 @@ SECTION =3D "devel/python"
>  HOMEPAGE =3D "https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__pyp=
i.python.org_pypi_pyiface_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZu=
IPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3D5tZAgNTd4p-R=
mB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DvAz7s9Lx6KxR7duweLBdBkFuJ4wXLJnWdXwP78o=
EIX4&e=3D"
>  LICENSE =3D "GPLv3+"
>
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4fe869ee987a340198fb0d54c=
55c47f1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfe06497acaf4f45999925d348=
c2605f9"
>
what changed here ?

> -SRC_URI[md5sum] =3D "06c3c71fe51df740dae6a88a13afb5e0"
> -SRC_URI[sha256sum] =3D "4bb79100cbcf7344a1ccaddc578cd6455da47d8eac6eb1bf=
903ec32e043af924"
> +SRC_URI[md5sum] =3D "2379d8d4506e6c4d83cf3d4824abce8b"
> +SRC_URI[sha256sum] =3D "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6=
e4cf2d708dcd86f2"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb =
b/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb=
 b/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.5.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org_mailman_listinfo_openembedded-2Ddevel&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO=
6YCiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=
=3D5tZAgNTd4p-RmB66oCdSleVt6GidTOAE_lcaJiI5KLI&s=3DcJjM59nw1Gsf8kbrzR07Szns=
hRlnyt9NTHExIi4LP1I&e=3D

