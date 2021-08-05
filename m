Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4135.1628131699378974667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p7uNHAuM;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38514ef0f4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1752TWlS003578
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 02:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=0XtqZsHUXryXKPKboxbBnaFgYX5MG38G+pHPP+P6ysY=;
 b=p7uNHAuMpyKTcrKwMCTdCuLPIDvE1deLlu7W9FLYG1ou7v3fG+PShAXOB+r2hDQKeRN1
 cf4pBfPM2SDG++oXYQ1b5pTBJJ/i+OHj9H2F6egWfzawyXN/s4L5wCNaz0vDjaCJfG04
 Uv3cB21bNB3sx8cOepKuXFiocL1PH1Y53afj/8T8iXQyZKS4/+Iy188YTgjf8WDWzEbw
 6uNbCFUgI+ICx2TcjdewFciCFR2wJnPeHYXVr+Y4REUHax9JlALvTLkZy5RY64tJ0OLA
 PeMMHB0r7CMiNNAFwZZEUKTUr7NaUQRkECxuHsMeBnF5zDvaHDli4xl490PcISL+tvS4 NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718daq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Aug 2021 02:48:17 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1752mH1h003256
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 02:48:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w718dap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Aug 2021 02:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcmU/bUWLYxb5OftxcZuSObVXi4vpOhWNPP3tlkXwKADKjoA6ZagsMVSzq636z6GInwEcuY+wgLONs2QNSoN+gvUdZVEso0iNuM2BBlokQwSSfVGoUoW+5SE0tAJwf4ORGSlGz/35V2aSF+yZhNRFDn4rTg+Xzz9Izg2OpKBqezqzliam3iHsRtACoo5RXcJxN4R9/dmthcD6qjWo91O1pHUvdbz3naQHalfosqnHJxvt7+6aP0H0VAJ9Yg6BMnPc0XIyZMpn7MvCasEm/EGAN7ddHrjE/nuVeKN3uOpSC8ZqNGAaciOYpxjo1YoDtHoyxq7ZxWRBNh+rcOzP3tUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XtqZsHUXryXKPKboxbBnaFgYX5MG38G+pHPP+P6ysY=;
 b=mOgu1cJDpEWLW/z3uV/K8E/Gd3LEU4FvjJjwxZZsAnIxC1XA23vP9mUnFqX34Ly71xMmVFKEbVW2HPplkc/uiCnLQbahCqD9lck5hFEwkRpOBkyMyK8mNcFhrsSGf0uJnqLubYRgiH5DB06KbwEHUiyqY65rOYVAQV6cQ3qzCnHtntdDxa/F8BZHewQBjKyZsezqVRDNUX9JUvPjWK4Vrsgnsydjj6jAjw82uDsI02nQz177iJIuCews9h+2TFNfs0WXGIhCdkAQh+WnuBtAxIzdoDPfwj7EqjmYomb17RVc9f3rNv/cfiuVHN5C4IzM3Rr0mOKKVvWeN4+yEBhXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 02:48:16 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 02:48:16 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Topic: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Thread-Index: AQHXiPLQtgYQe+wE3kGtNuvU8+Y+SqtjX8+AgADSZcaAAALmgIAAAURs
Date: Thu, 5 Aug 2021 02:48:16 +0000
Message-ID: 
 <CO1PR11MB500946DFBAA512C2B2D597FCF1F29@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
 <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
 <CO1PR11MB500988659DDA01C7B1B713C4F1F29@CO1PR11MB5009.namprd11.prod.outlook.com>,<CAMKF1sqgy4PmVTbq0_Fk+=yvJgd3L4gK1h=LUX4Oz33V7F=+9Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqgy4PmVTbq0_Fk+=yvJgd3L4gK1h=LUX4Oz33V7F=+9Q@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bcd1534-457d-476b-750b-08d957bb799b
x-ms-traffictypediagnostic: MWHPR11MB1853:
x-microsoft-antispam-prvs: 
 <MWHPR11MB1853223A3FF2CCD9FEEAAAC6F1F29@MWHPR11MB1853.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iV7aerEih+qe0ZYzNrrtlMPGIVABj7f8Ihdsp82ySrruuhXBeJz/gyhrUai88AAxHtydkzYr21uzV4XkHOKGpWdxCRUYmkZ08L9n3GcaLqyW/jZ98XqoL7Rrf9/5dHOwOCIhTGa7d8f+TFO1/2e4Hd7tQgRiqqYR+Jcxr+kUjbOxrNWEe9eovHNrRzzN3wxjqWcz/TYDgznFpFOOMgVtRQi7pkj0dGx45nRf/JYSvj8rzfX3ChjFJljWoEAudCh5AZD+Y/B3yOoLxoDUQFnJDkJNZSQPa21+9DtKK7dRkqO+HZqz2Az5Zv+2+gaGPm5+w5bbr0vWSDMnGGRRJXYtJolQm5Jx1KO2t2hFeBs5U1cqxm8HZqtbe9mP2lhn9PsO2b+3u+CZh2sd3yV0+HwwAepWKE2tb3S02+sJf/MllBsND7WbdBA8BupR4JOaBdiqKIsl6gDD038q4QztO3Hu86f7i4OxjebMn2T5P7UhPdEjoPZEW9e3uV7wFoc0GIgr/8BFbOq4xa2c7yVDgd876phuSgsXlMGsezYH4jasT0gJq3/ZGCdBU9hFITUjtNljt0a2Lsuhs3ZQ7BBq9HsOCRulIM02aFVbNPrwM33I8OQnTWq3TURxkstfvX0S+wNQGsFz4os3ghBAEiUlo9cIxU8FfE1cIT6YLnsqLd4GIBcQaYytHPQ+XgK031M2/Hx2M5vwWyyc5KvdPlP8L0XBCOCYRX4dM//yev4XKdz5fxr2fnL4YUHULE11omZTsPWYMSnGq6uqz07Y/odDN2DlY6U4MDz4+KbrvMBVqvyJluI9S7nf/wxdKzozCKDhdMtExP4n59or5PLebY2+yOGuGB3b65OKk0kFXt4lT3n/aTw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(55016002)(83380400001)(54906003)(316002)(71200400001)(9686003)(76116006)(8676002)(91956017)(33656002)(66556008)(4326008)(122000001)(38070700005)(38100700002)(66476007)(66946007)(86362001)(18265965003)(66446008)(64756008)(8936002)(966005)(478600001)(15650500001)(5660300002)(6916009)(6506007)(2906002)(7696005)(19627405001)(53546011)(166002)(52536014)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ClpN0TNrdnsqnmoC3PtFzjpbAa7lL6oig//EpyxU/yeHAPe/X3tdSe3yKZgE?=
 =?us-ascii?Q?gYZz15mMmS82fnoKwThOPWEMcdx0pUca1urGQDECZ/1y5CtW0xoe8NU7d9mf?=
 =?us-ascii?Q?RX5ihGVLWtBur21pY5xg30tYZoQEZwq5dHu9cgvbTlzw5eg815hlpOHoOwVu?=
 =?us-ascii?Q?aeqkzfunsAHa+PQvDSTu1WyjjdDGlTpoz7HOk6r66PG8j6wSSNI3MZaS0+JT?=
 =?us-ascii?Q?Hsa467AL1AVqrxiUpzzSJSknt6WsK24txdDJc7AhY3o5IGv+kemphqT/2vXU?=
 =?us-ascii?Q?yPZ+POv9inVsAngy2MFzzi3IV8M7wHqmhnvTuc8jb/Jz1/Agy/G1Ly3wo6yZ?=
 =?us-ascii?Q?e0NB7h/ecPWZzGpWvOg4OpXaamLwI/nXxf7eZqxb77GNOSz9+LsM7LJyRl29?=
 =?us-ascii?Q?HBl30AXTdXgFDOf5qMKOHAauLZJBjpil0wRs2wOAgqq5L5xQLiyyHzbrxEz7?=
 =?us-ascii?Q?eh3sw6j9ch5cFyqJwW9xT+UGTN3y6EPWtAcEAqXlPb5ZeaglNmOMdHN5VLMR?=
 =?us-ascii?Q?G+FuC2tRYtikl/OBGYsF+p2I5UHDG+k+YdGn+KVbS641OQ9dBz6uZ5M7CiKN?=
 =?us-ascii?Q?dDHIF052f3Fv/lXNV+x599XcOf4MK/grSdD0Wyae1IFxyZm/tfkbIdjG1bn7?=
 =?us-ascii?Q?lkxeqNlQH7fOPiYHkBK9c3qeoMtArPa7WqK2+HGKShZzo9AzZUCLcXG3ZZ3a?=
 =?us-ascii?Q?pvMcpp79HufmtAcLIIeyd9NelhZ/L/5HTL4winjSX9xZLkQF1ZY8IVSKcXgf?=
 =?us-ascii?Q?r4oCpB/jzsgMQ39AHyVpM8e/M4GkkINyTHYs6WsXCDlFSH/QiVz8oxKqYLbR?=
 =?us-ascii?Q?YTOWjLHHwWEkJHi7YuNvkVlVjVa9DwoAHwh5D9V/oHRzN7b3ndfOf1kaMKxY?=
 =?us-ascii?Q?WfJOKEerU3cMDOCEBTmkjtN2g4N4hlm+1N3VbqKCosJCZXpww9HjGj9OWzen?=
 =?us-ascii?Q?Gin0RmFJm22ecibEEZP6sLR+6yqc7glPLYuMa7EeHtwxhpgvyvRfX5wa8cvM?=
 =?us-ascii?Q?OW89/wMQYrLU4rolNErrpAsGFzXzqojSiw3Yw15PhRB9FGc+fDvgzQFZE9Pc?=
 =?us-ascii?Q?9oKPpmemXv/jDjNtSZyIK0OoGv96k/gxw0E9Kg2ET5FsbdFCls7ZDj9GF1C+?=
 =?us-ascii?Q?9zEEhumGmAUPhV0EOZKvyAZoBUawmCcomzmMS4Dbtv56fbc2+DH1R8POcSQe?=
 =?us-ascii?Q?cPvEkpQMmUB3nnCBSjHJTY85NsWAU1i8lerTrgRe8MJ6lgKKms96IbS5hTm7?=
 =?us-ascii?Q?B8qGe81Ntsr1W3taBSF+rIxS4kof9JgCVLzYRAd1IvzyASSuqMa5rWI+hcyH?=
 =?us-ascii?Q?wdw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcd1534-457d-476b-750b-08d957bb799b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 02:48:16.0079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+kAyctypeiIV7rBIMjs9Eht0NIDPFph5vNHKh7TjqUQ1wh/HujGXVwHya1Okvu6Fq2DHJJl0cywQuu1wbpNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
X-Proofpoint-ORIG-GUID: 0wRnI519dIKKY-XhjyWkCK387ohjfSFl
X-Proofpoint-GUID: ntTDSK0F6Ph26gNTSz_u0QLO6bUBESSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_08,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050014
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB500946DFBAA512C2B2D597FCF1F29CO1PR11MB5009namp_"

--_000_CO1PR11MB500946DFBAA512C2B2D597FCF1F29CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

The one we want to update is the persistent archive and also send a patch =
to master.

Thanks,
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Thursday, August 5, 2021 10:42
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: akuster808 <akuster808@gmail.com>; openembedded-devel@lists.openembedd=
ed.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Armin,
>
> Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, but =
after 10.5.12 comes out, the issue will be there again if we don't upgrade =
timely.
>
> Considering the previous URL only stores the latest tar ball and the upd=
ated one stores all the tar balls. It's better use the updated one.

Dont we have some persistent archive location to point to ?
secondly, we should put the tarballs on oe source mirror for fall back.

>
> Thanks,
> ________________________________
> From: akuster808 <akuster808@gmail.com>
> Sent: Wednesday, August 4, 2021 21:58
> To: Yu, Mingli <Mingli.Yu@windriver.com>; openembedded-devel@lists.opene=
mbedded.org <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 8/3/21 10:43 PM, Yu, Mingli wrote:
> > Ping.
> >
> > Thanks,
> >
> > On 7/27/21 2:32 PM, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Fixes:
> >> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
> >> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mari=
adb-10.5.9.tar.gz,
> >> attempting MIRRORS if available
>
> Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?
>
> -armin
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> index 2974341bf..e8ff41461 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> >>   LICENSE =3D "GPLv2"
> >>   LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311"
> >>   -SRC_URI =3D
> >> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz=
 \
> >> +SRC_URI =3D "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >>              file://my.cnf \
> >>              file://mysqld.service \
> >>              file://install_db.service \
> >>
> >>
> >>
> >>
> >>
>
>
>=20
>

--_000_CO1PR11MB500946DFBAA512C2B2D597FCF1F29CO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi Khem,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
The one we want to update is the <font size=3D"2"><span style=3D"font-size=
:11pt">persistent archive</span></font> and also send a patch to master.</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khe=
m@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 5, 2021 10:42<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> akuster808 &lt;akuster808@gmail.com&gt;; openembedded-devel@lis=
ts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_U=
RI</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">[Please note: This e-mail is from an EXTERNAL e-m=
ail address]<br>
<br>
On Wed, Aug 4, 2021 at 7:36 PM Yu, Mingli &lt;mingli.yu@windriver.com&gt; =
wrote:<br>
&gt;<br>
&gt; Hi Armin,<br>
&gt;<br>
&gt; Though the do_fetch issue is gone after upgrade mariadb to 10.5.11, b=
ut after 10.5.12 comes out, the issue will be there again if we don't upgra=
de timely.<br>
&gt;<br>
&gt; Considering the previous URL only stores the latest tar ball and the =
updated one stores all the tar balls. It's better use the updated one.<br>
<br>
Dont we have some persistent archive location to point to ?<br>
secondly, we should put the tarballs on oe source mirror for fall back.<br=
>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; ________________________________<br>
&gt; From: akuster808 &lt;akuster808@gmail.com&gt;<br>
&gt; Sent: Wednesday, August 4, 2021 21:58<br>
&gt; To: Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;; openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br>
&gt; Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI=
<br>
&gt;<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; On 8/3/21 10:43 PM, Yu, Mingli wrote:<br>
&gt; &gt; Ping.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt;<br>
&gt; &gt; On 7/27/21 2:32 PM, Yu, Mingli wrote:<br>
&gt; &gt;&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Fixes:<br>
&gt; &gt;&gt; WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL<br>
&gt; &gt;&gt; <a href=3D"https://downloads.mariadb.org/interstitial/mariad=
b-10.5.9/source/mariadb-10.5.9.tar.gz">
https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-1=
0.5.9.tar.gz</a>,<br>
&gt; &gt;&gt; attempting MIRRORS if available<br>
&gt;<br>
&gt; Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue=
?<br>
&gt;<br>
&gt; -armin<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;&nbsp;&nbsp; meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; &gt;&gt; b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; &gt;&gt; index 2974341bf..e8ff41461 100644<br>
&gt; &gt;&gt; --- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; &gt;&gt; +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
&gt; &gt;&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt; &gt;&gt;&nbsp;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt;&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt; &quot;<a href=3D"file://COPYING;md5=3Db1becf0cfa3366e0f4d854=
d1d264f311">file://COPYING;md5=3Db1becf0cfa3366e0f4d854d1d264f311</a>&quot;=
<br>
&gt; &gt;&gt;&nbsp;&nbsp; -SRC_URI =3D<br>
&gt; &gt;&gt; &quot;<a href=3D""></a>https://downloads.mariadb.org/interst=
itial/${BP}/source/${BP}.tar.gz \<br>
&gt; &gt;&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://archive.mariadb.=
org/${BP}/source/${BP}.tar.gz \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <a href=3D"file://my.cnf">file://my.cnf</a> \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <a href=3D"file://mysqld.service">file://mysqld.service</=
a> \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <a href=3D"file://install_db.service">file://install_db.s=
ervice</a> \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB500946DFBAA512C2B2D597FCF1F29CO1PR11MB5009namp_--
