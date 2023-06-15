Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADBEEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:10:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15371.1686827413518578268
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VB5w1V3S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55301e784d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FAde0J006277
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=b/gOcPKlhKnOklQ8PJWi1MGdSUJkyMeEztJvKIebX0Y=;
 b=VB5w1V3S+xmKYSsR20A1ETt1ehh9IwVMXPMSeg+nF7OBjcY4l4XKTYMzG0kELum6YU3q
 uNW0ILzpgUD9xSL7daOyVCFRF8vX+TgeFwQZjpHH+L/I+JVNY4sko+3tMKwyVVxCr1Eu
 GYajNSLxXapeJddc/9ddyCmK5kraSzvlcY53tJ9Q6ZhIFB1sdKut+1/CI9RZiXbJU/P4
 fQqrxK5c0yiOh8++BUdlCr7l0c/Xxe2yZI7JrLnIM+0eVjfXBrqxEezh/f+ysy4MPaDK
 1TMPCsrCx0z+EwYZdN+hK/4+SVHdNtWjE+ivUkliLNWdQDCIKm038M82DDUgXhzxxPQl hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed04vrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:10:12 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35FB4BDD013941
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:10:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed04vrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 11:10:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8laS7HBTTMYagQnztM2g94wDZHUc3IP332ggXXhmOIMfccDxhZy//JzqRnyFDgmFYJ8z0lMCed4xksEnGPep88zDc8YjugdAZw4f1fYyA6nN7Si0xn3e9f5f+vyQzIfexTSLxkX52VOzDMf+s7Jh9zd13lZIMBTqx2XOsjltEfmDCClOl3Ds/cq4IzHRGTyCjuJi2Z/u6tiPyQVWX8zy2RUZ+Bt8DTUfO6RRFz+OS7w1DpWoeNEM0LubCryNHEztSm0mDBfOSNmuBnbt2ahMq5K7FUhTB8DQt9r9dFcioISZ4pKjnO8b2fsiICNBpDnqzQleib9zlUZr/j8wtsv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/gOcPKlhKnOklQ8PJWi1MGdSUJkyMeEztJvKIebX0Y=;
 b=btuzGcQy7dIhJTLZMylGU3CVyxKq7qOeD/vUBG0BW4LNmA6ewV6Rny4Y5dOg+VKh+6j7S+nLSr9Y81DsuI3IOFxbiVObtJuWjvCBSqxIdGNKJik6n+8oWZw96NFgX0mpm7FyLaxzGhcbTishWJuEkHEv7i4ZVDzWAymnoMgXSyE9tXL9XzX0IvA45Ly3xy51CdL6Nbhgu4Y3HO2XKVKhOflleYcu2HHiYDcz399ytTRDRxH3NWe0yx1l9JDu/3vjAlt4SZ4vYJEfe0CWc6nJJfq+5wXac/CAVzKvMv84e4Iv31ZJ9UJxPGrHi/hajM/BLGP8sRzt1LoGIsh+W7ssEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 11:10:06 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Thu, 15 Jun 2023
 11:10:06 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Index: AQHZn3E6IiIqjRah0EumUxSPsEbhJK+LrHFwgAAHnx0=
Date: Thu, 15 Jun 2023 11:10:06 +0000
Message-ID: 
 <MW4PR11MB5822AC64F8414AEA0D2E77A0845BA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230615100658.543762-1-archana.polampalli@windriver.com>
 <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: 
 <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CH3PR11MB8341:EE_
x-ms-office365-filtering-correlation-id: bf186f05-7b96-4faa-a503-08db6d911342
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rgddn9G+me/a4N1NxH5pg19fjHDtRVprvQkEyc4lNCG1ODcemUQLeL3ocQtUSZGMLB4noeazgmp9+h4m6SnxuYcYw4tbWkegkVC1Zu3izkYyL5R6iufJlE1wWcDCYENL1Bi2VEDqyS81QNf3wk/wmv2svCDF7wlMy1vHm+DORarIN2H/v8j8W2ThbCxZwUXnj6MHUsxV4UQmjL7yh2jiqWnMAAbVxyFy0I0E6v2ZPfsbtukB0R3exdq6ysuPv19gs0V5+emS4mC4h4rraiNHY6B5eV4O48u7GiqRZ0pbCKMF8Qyuk8A5s5qTtpQBBkUqTdGnGqpF/D9tv9K3IEKQUn+fM2ycJuXpVMam/x7TQsQWcdf35uxrmN0UCy9jptx/V1Jpx/yT3OlDufFLMA7R3dPV7b4AVJrDsNzLZWtB7PpjMqIZXQ7QYcC7l+asWtMf9RqcGRsTUYFKPiU3+Z+DkZrJ8mKcm3AEKucTRO2nFwANaWDE4YW18QNV12tQaegakJCGmdGNLFKCNvq8JK6FNH3DkenzlB5PUMYbOGj6EvHYJGzdin0Vb/oVLrWJE9QEc9NPdZltfHkhdbc2zqeryWk+oUupljLtCEwNp3WST4Om3McRLlI0A3xI72Mgu4z6gOhyWutnc3BioSwf4z1YVg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(451199021)(66476007)(66446008)(91956017)(66556008)(4326008)(66946007)(76116006)(166002)(33656002)(316002)(64756008)(19627405001)(52536014)(5660300002)(2906002)(8676002)(8936002)(41300700001)(7696005)(38070700005)(110136005)(86362001)(55016003)(38100700002)(478600001)(122000001)(6506007)(26005)(9686003)(55236004)(107886003)(966005)(186003)(53546011)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KVnC/kC1TYZg4z5N864uSMrfUL5n0WzxUbQKsqe5hQpymhHrhwSm8qO+ieDK?=
 =?us-ascii?Q?4zX6lqrLlY/WWEFkw67tqy9+fYCWq7yZsi4Q4RToVp530upC8ZdGiqJYCnWX?=
 =?us-ascii?Q?nwPec5xPwg60csW+sDdI1bQ1X6nG2O7H9BGMd8H2lxkQ2bt9LMiYrgH5svlK?=
 =?us-ascii?Q?0s8TMs7l8frRmsGfsBu1up+Q1OgxTLsQ+1RV2Enk2zpyQZw+KTEAUP3UJ+9/?=
 =?us-ascii?Q?Z2nb4KCU+3CUUhkiCwx1QfKdzZv6XSoB+9DbBEQq2uevf4s9u9Za6SmkgKOf?=
 =?us-ascii?Q?rvDsuKyJ/GlTEeCgbzX6NQ88yAfL/Yw5bSh1bskiWwlJbIzKRqcl8SfrWoii?=
 =?us-ascii?Q?Jc4jjFpT+pdfDu8VtwmgwuLzeqh2RnqNoNbzURfyScDMonSEwmlb5p6H98FN?=
 =?us-ascii?Q?OF3aJ/4cpoOni/RoYDvq3wLGKSssA2vA3nlQ5a2j5x09wHjL+lhcItbraILy?=
 =?us-ascii?Q?wNaTzCro0l1g2+/30qpSnWRBVl93RQcfqQ2rQmTIIE/skNQfX90U88lvspAW?=
 =?us-ascii?Q?Inx04PcNrRqGm6fhBqKJyK5rFS3d3bML1fskDsk4JS4I0D8scBUUjf9hwioU?=
 =?us-ascii?Q?+5pXtluuvJ1B+FwSmh5axNmZIeOlh7yyALbff5YP3E4ScuIlKdPYQP8V2Wld?=
 =?us-ascii?Q?6nOZRzrCEoZ2jVa7WLMIVZpsi7yVwGKFMF1B/UpNzuN9KWxhhXtZQvfnMHiF?=
 =?us-ascii?Q?p5kBh74k82c0tFbBYoao/EK6KbwI0yDeptxOcMHTZ0UAWtbEyUqr/48seF/l?=
 =?us-ascii?Q?2uzWy7FEt8lgKy6uOfmGgOtk0SpPVPDT1PEKcR0HM7IC9tHGXPg5FrNVA5EM?=
 =?us-ascii?Q?3cRencrfUd6IwPwFCww0gT6iCi0QRO9pFQ0yiqAnrkkRIOl2tQakt9ylMzsX?=
 =?us-ascii?Q?WLyRijpVy9PjzouBnfKNQCrVBvvDWFnJNFHcw+TZcv0cnyBy0ZnGzPmGZvGe?=
 =?us-ascii?Q?NPSGwh3PgpTR1HLbFAICt2POoIHrtLpQdNMSCTshrDbrK6f9FFMk2QCBwEJz?=
 =?us-ascii?Q?FDBCbI9enSBMXDRiWNqVgDqy+Cq1cKiz8zxEd4h1etaQC7Xdqb1YAy64vT0X?=
 =?us-ascii?Q?6iNqmqtVNZQCCfdsagZUGspGSocf14CDKF8bxf63fSLHAPrnpOb6ACww6651?=
 =?us-ascii?Q?ioolIiOepowVLiZVzSvKehqLBJhxEbbpBWx1fYQoMtY81pKMKgWA/quJZ/ZA?=
 =?us-ascii?Q?U/ZNwOxc0RMKx6PgFJp6rTku4wOejmfqHQNNQvAC+bmUjQYYFjEbMDyBVRCQ?=
 =?us-ascii?Q?iqH7gSw70VbbeXCFj9CLj/r0A1foQkoPzmS42zYPi/JDVxxTskrAQzC/tVd/?=
 =?us-ascii?Q?+Npa9h6J8/34Nx3/s5yAJtjcG8sSm35jJdESfuRc2oM0IMGffuHrq2RuM841?=
 =?us-ascii?Q?U/6Yj2REr7Q52igyPw2N4EQl5zZiYAqUPsl3hC8zS+H/wMy3+7v6e1o1RpgT?=
 =?us-ascii?Q?2aZSQj98fpnJCD/0PLcAO8EHYSKANn9wazY15eXreZpPY3HWJ+jTMLFxFIPj?=
 =?us-ascii?Q?SkX4vVqEWx4a/JOF2GiNP9ifC0/dIdcat0wwVnVoCipnZ9dR/5wmLucfduPX?=
 =?us-ascii?Q?Cw+WNGZHVBU4nxCUrIQPdKEFCvIes1EIbqAFd5CET3LOmomVYfVg3s401Fj9?=
 =?us-ascii?Q?jQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822AC64F8414AEA0D2E77A0845BAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf186f05-7b96-4faa-a503-08db6d911342
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 11:10:06.3482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOSRTXb4t22acbJgJHxzbvGUGTu7BGfsW2kW4rn6C/J3hBdHjz+MzCD6epRf1paYtQgxDfdC2+aVUXdADYAUBsz/0kLuzjFRInJVIpL6P2CDg+rDhz1VMFfG6SeQevAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
X-Proofpoint-GUID: jP5ZRYRhxO0d7QhQhZGJ6cM6Ic2l5XGu
X-Proofpoint-ORIG-GUID: ZXu9J_xWuyUhcF6yKDW12ECsfzGpJ_WS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=977
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 11:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103298

--_000_MW4PR11MB5822AC64F8414AEA0D2E77A0845BAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Sanjay,

Thank you for you're review comment on patch format.

Shall I send V2 with updated format?.

Regards,
Archana


________________________________
From: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co) <schitrod@cisco.com>
Sent: Thursday, June 15, 2023 4:17 PM
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-de=
vel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-202=
2-41916

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Hari,

Regarding format only nothing specific to review of fix,

I saw many developers has contributed to samba package fixes.
I would be great if we can keep common format inside .patch file as followi=
ng.

----------------------------------------------
CVE: CVE-2022-41916
Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/eb87af=
0c2d18]

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----------------------------------------------

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Polampalli, Archana via lists.openembedded.or=
g
Sent: Thursday, June 15, 2023 3:37 PM
To: openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal's PKI certificate validation library, affecting the KDC (via PK=
INIT) and kinit (via PKINIT), as well as any third-party applications using=
 Heimdal's libhx509. Users should upgrade to Heimdal 7.7.1 or 7.8. There ar=
e no known workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03=
af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---


--_000_MW4PR11MB5822AC64F8414AEA0D2E77A0845BAMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Sanjay,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thank you for you're review comment on patch format.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Shall I send V2 with updated format?.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sanjaykumar kantibhai=
 Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco) &lt;schitrod@cisco.com&=
gt;<br>
<b>Sent:</b> Thursday, June 15, 2023 4:17 PM<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openem=
bedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix =
CVE-2022-41916</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hi Hari,<br>
<br>
Regarding format only nothing specific to review of fix,<br>
<br>
I saw many developers has contributed to samba package fixes.<br>
I would be great if we can keep common format inside .patch file as followi=
ng.<br>
<br>
----------------------------------------------<br>
CVE: CVE-2022-41916<br>
Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/co=
mmit/eb87af0c2d18">https://github.com/heimdal/heimdal/commit/eb87af0c2d18</=
a>]<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
----------------------------------------------<br>
<br>
Thanks,<br>
Sanjay<br>
<br>
-----Original Message-----<br>
From: openembedded-devel@lists.openembedded.org &lt;openembedded-devel@list=
s.openembedded.org&gt; On Behalf Of Polampalli, Archana via lists.openembed=
ded.org<br>
Sent: Thursday, June 15, 2023 3:37 PM<br>
To: openembedded-devel@lists.openembedded.org<br>
Cc: Hari.GPillai@windriver.com<br>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916<br>
<br>
Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.<br>
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal's PKI certificate validation library, affecting the KDC (via PK=
INIT) and kinit (via PKINIT), as well as any third-party applications using=
 Heimdal's libhx509. Users should
 upgrade to Heimdal 7.7.1 or 7.8. There are no known workarounds for this i=
ssue.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41916">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41916</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7d=
af483a47b03af80c2c">https://github.com/heimdal/heimdal/commit/eb87af0c2d189=
c25294c7daf483a47b03af80c2c</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822AC64F8414AEA0D2E77A0845BAMW4PR11MB5822namp_--

