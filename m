Return-Path: <prvs=67237e28b6=alexandru.vasiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5F19B7603B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 14:57:10 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w64EuEiY003230; Wed, 4 Jul 2018 09:57:09 -0500
Received: from nam04-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam04lp0115.outbound.protection.outlook.com
	[216.32.180.115])
	by mx0a-00010702.pphosted.com with ESMTP id 2k0dpfjtff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 04 Jul 2018 09:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xVs064FZox5OsL1YaUaboLVzK6erimYGsTfwMEiprH0=;
	b=Jr0WjwFaIZ8aRdpIgva1GGi25lK/SfKG0bc1V+0VhZxL9ih30C4KYu2P/AGEj0qZOefpfv6UQRcyLQLz+BZcfJMa+Qxg/UzvJGSnYZjsTCHbEAKZyS25z1+//k6Nb1m8fAEogNdBA98fJx+wxr0N9WA+zAk4xIQJECABJ4tOOj4=
Received: from MWHPR04MB0976.namprd04.prod.outlook.com (10.174.249.165) by
	MWHPR04MB1007.namprd04.prod.outlook.com (10.174.250.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.23; Wed, 4 Jul 2018 14:57:06 +0000
Received: from MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989]) by
	MWHPR04MB0976.namprd04.prod.outlook.com
	([fe80::c900:e3b8:f10a:5989%3]) with mapi id 15.20.0906.026;
	Wed, 4 Jul 2018 14:57:06 +0000
From: Alexandru Vasiu <alexandru.vasiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][meta-python][PATCH v3] python-pyiface: Upgrade to
	0.0.7
Thread-Index: AQHUE6V5Atc/ECD+PkSbf0K7l5+iA6R/Jmvx
Date: Wed, 4 Jul 2018 14:57:06 +0000
Message-ID: <MWHPR04MB0976B2D20658F801162B40DA98410@MWHPR04MB0976.namprd04.prod.outlook.com>
References: <20180704085702.14811-1-alexandru.vasiu@ni.com>,
	<CAMKF1spt6G=YrQRT5f_SWweGib4k47bg_ZyS63gGKLR6o2foOA@mail.gmail.com>
In-Reply-To: <CAMKF1spt6G=YrQRT5f_SWweGib4k47bg_ZyS63gGKLR6o2foOA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [80.97.64.55]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1007;
	7:iwrtzocuh/LxS4N1VOBB7q8xUBfQwTCksQuxwwjFi3AUA5IGJW0cdNTTbVPD5LOB6UjpvG4SQq5U7ftjDME0DMZutRcJqeI+Dt6IOjqJitNbidAb+HMMnjXBx47QS+QQx3v7bibWH87EQ97zFND9MqK3/Ps2wryQhaNBmxgKCe61mab5Zf7eQZvNn+HZUgtb6nQy0QTQRov5VEDMiAQ8Xh9Sw8ympqBoyogJPZkzcTJF8yZIa1GIAOinQaWcxttT
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a69399ee-c88f-4ab2-4913-08d5e1be68ed
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1007; 
x-ms-traffictypediagnostic: MWHPR04MB1007:
x-microsoft-antispam-prvs: <MWHPR04MB1007EEC7B77580E793D8654698410@MWHPR04MB1007.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(10436049006162)(22074186197030)(85827821059158)(264703809997249)(145744241990776)(278428928389397);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB1007; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1007; 
x-forefront-prvs: 0723A02764
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(346002)(39860400002)(376002)(366004)(199004)(189003)(478600001)(106356001)(6116002)(105586002)(6606003)(19627405001)(6436002)(53936002)(3846002)(5250100002)(2900100001)(5660300001)(2906002)(6916009)(25786009)(966005)(81166006)(26005)(81156014)(229853002)(6506007)(186003)(53546011)(8936002)(8676002)(102836004)(7736002)(55016002)(6246003)(236005)(74316002)(606006)(4326008)(39060400002)(6306002)(76176011)(54896002)(9686003)(68736007)(7696005)(97736004)(486006)(66066001)(33656002)(11346002)(14454004)(14444005)(256004)(316002)(446003)(575784001)(86362001)(476003)(99286004)(44832011)(2004002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1007;
	H:MWHPR04MB0976.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: FqC6FQ8lm72T9gj8NyzUrd4Mrx49glKb+/hJzcpVtwdiEKLy6gxX5ZM88sx6Sr0a2+Tng0JecEDmVZxaEa3fKQBHMoi7q7xv9+5A3Gtw7b7OgApodScSt1UGBa+HNosc4ps3986dW3r71AspXxPEv/u3IVfRvZZWpmMQXeJUeh1hbFeyhAnVwppx3qUzlYE1S0//cpNTXkb8EkeQ9uLJU08MJ3Z0+BURiD16nGXWiIas3nSJPmCXimYwYVM83j0SrYZPo0tSuzqVmNEDb27g9e8lw2tSF9JfEAQk7eSW5/iz1jyBJnzDCoTBmxRalH6OeOX9RP3q8z/DfkNm+sAIWtkKkgnRNY6Pf+RM4H+oXkY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69399ee-c88f-4ab2-4913-08d5e1be68ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2018 14:57:06.1022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807040172
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH v3] python-pyiface: Upgrade to 0.0.7
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
X-List-Received-Date: Wed, 04 Jul 2018 14:57:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Oh ... I forgot to change, during the rebase, the license checksum how it w=
as in version 0.0.5 (with good end lines).  Sorry for this.


I've sent version 4 now.


Alex


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, July 4, 2018 5:43 PM
To: Alexandru Vasiu
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][meta-python][PATCH v3] python-pyiface: Upgrade =
to 0.0.7

I am seeing license change which is not accounted for in checksum

ERROR: python-pyiface-0.0.7-r0 do_populate_lic: QA Issue:
python-pyiface: The LIC_FILES_CHKSUM does not match for
file://LICENSE.txt;md5=3Dfe06497acaf4f45999925d348c2605f9
python-pyiface: The new md5 checksum is 4fe869ee987a340198fb0d54c55c47f1
python-pyiface: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttp-3A__fsf.org_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6Y=
CiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=
=3DvkxczbnedAM4kLHK3PQB-350EC_hNJ3kw848MYmWYMI&s=3Dv50pjweBxmGTdwrmDC5XQhrR=
m-UesTFI23xawd40NDE&e=3D>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
...
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.gnu.org_licenses=
_&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=3DV3-K-8AFkh=
BUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3DvkxczbnedAM4kLHK3PQB-350EC_hNJ3kw848M=
YmWYMI&s=3DgZX7YztyJ7vQRVl5jYEl59L66vwXIFnxBSZHZRaqL8U&e=3D>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.gnu.org_philosop=
hy_why-2Dnot-2Dlgpl.html&d=3DDwIBaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIP=
elcSjixA&r=3DV3-K-8AFkhBUtg_ELgwyZIouJ7keS5Dl3C5-KCLlJq8&m=3DvkxczbnedAM4kL=
HK3PQB-350EC_hNJ3kw848MYmWYMI&s=3D_95d8Qt596HSDXLaQz7av8DmwZRX1LaXHMaxewNBk=
aQ&e=3D>.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python-pyiface: Check if the license information has changed in
/mnt/a/oe/build/tmp/work/core2-64-bec-linux/python-pyiface/0.0.7-r0/pyiface=
-0.0.7/LICENSE.txt
to verify that the LICENSE value "GPLv3+" remains valid
[license-checksum]
On Wed, Jul 4, 2018 at 1:57 AM Alexandru Vasiu <alexandru.vasiu@ni.com> wro=
te:
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc        | 4 ++--
>  .../{python-pyiface_0.0.6.bb =3D> python-pyiface_0.0.7.bb}      | 0
>  .../{python3-pyiface_0.0.6.bb =3D> python3-pyiface_0.0.7.bb}    | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pyiface_0.0.6.bb =3D>=
 python-pyiface_0.0.7.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.6.bb =3D=
> python3-pyiface_0.0.7.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/met=
a-python/recipes-devtools/python/python-pyiface.inc
> index 8e464a83f..c341779bf 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -5,7 +5,7 @@ LICENSE =3D "GPLv3+"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfe06497acaf4f45999925d348=
c2605f9"
>
> -SRC_URI[md5sum] =3D "2379d8d4506e6c4d83cf3d4824abce8b"
> -SRC_URI[sha256sum] =3D "774ea47bb1387e493f6d5d0937b68fa28202c948eccddbd6=
e4cf2d708dcd86f2"
> +SRC_URI[md5sum] =3D "1bbc53c281925eae5f508b8b1a1f8259"
> +SRC_URI[sha256sum] =3D "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed=
4f6987322051928d"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb =
b/meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python-pyiface_0.0.7.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb=
 b/meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pyiface_0.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-pyiface_0.0.7.bb
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
=3DvkxczbnedAM4kLHK3PQB-350EC_hNJ3kw848MYmWYMI&s=3DjLD-jggrYsBVciz32bL_nzln=
g9PzKUxu8KsxRNgF9Tk&e=3D

