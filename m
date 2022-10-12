Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0C9C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 17:24:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.180.1665595440958725686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 10:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cMhEyR7P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7284e3cc2c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29CHO0Hk000379
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 17:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=gPgUrNU5e67d1sx9IZnNveOo/tBWM7SGFl/E5jZqMKo=;
 b=cMhEyR7P9wbL5EZrqXgA92MsahCOM8OKQ97xYV59Ty1Vxapx2qiljc6O6PrGb0gEvTaF
 HcLqo1MFkJIXBDkyyrc7j5L34E5mCfH3Qr1Y8oXcoB2nPVt/FTDxBaTwC13cC1BY05dq
 uOk9tcQbmnT7J6uawEQMrg/j1Jwn9RKgAN5Oi1rjcM4KsJrfCbfpOdgmBgRZsN1WHI4C
 f1Hrtl2nsxTZkaT0xCYl7Og9dHt76HIdyM54HK34v9q1WC7RG8Gf8GP3xOGIy0OBzpQt
 tA1q2zaqbe7v3f/0KoNd7WJhifANfyW1rUjm5AKXBYRceuL4+dweekT1NVdP16uqun9j mg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs3ew2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 17:24:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGAwwl4w/IBV6NmaG0GcZQmM1TDDM2iKXUPzzX40K55qkcWCTjnHaUI6Z30n2hNXC6S8nFxsRAlCH936EcUxhsADBzFh9n5uA14gzwXqRud8KSEeMP0WKdDQ2390SQRJtLJIl2IKi9fkcvJitkguAIgeUAl9+S40wDrq6aDRDhjWxbCplA1U+FxHg4N2tqEstuA0tplMus9qW3lNEpcl0DwwFH5PpkZK/VGG7/GcVcbotiYA/s8ugBcGYNXQ8Roco2h+jMjIFh+aYy8GC5lk9WQkiZqidQZrOCUuDgriExXwciQBOBAqmSnDlP/NkaE4eCAlomge/Va/1lw69iesDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPgUrNU5e67d1sx9IZnNveOo/tBWM7SGFl/E5jZqMKo=;
 b=FFQUVS9vuxV3456KPZiTWsnJ/OYx0q0gGNZFSTdvsxp8CIuakTTQvDha7Tbu3GZgSBy+W6EZoEwr2OQyfCQJY62XiRdd5drHNc3xIvYYzO/BDJwKsDe6jw4k7O1eFlQMnoZQGbME0Olpn0KVOgYUA4gAObFVpi1blsmMaC8PgA9UN7sR85eEb0VlZxrektA9n9kjga32u/1/OzFIL9CRI00Wa4m0ctzfNPVJfpP5+9dWBo/Ww7JhoCrsJ8J2xS16Q+3d4LKNzvBVrcG7ypBXGfVri4OfOMivENlmpZiB+b+jHunNTlC2M7lk51YvRd3FaL44AkCfzliYRgj/nMQCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BN9PR11MB5404.namprd11.prod.outlook.com (2603:10b6:408:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 17:23:57 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::9d20:1c29:a0:d61c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::9d20:1c29:a0:d61c%5]) with mapi id 15.20.5676.032; Wed, 12 Oct 2022
 17:23:57 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Security Advisory - yasm - CVE-2021-33461
Thread-Topic: Security Advisory - yasm - CVE-2021-33461
Thread-Index: AQHY3l0F48+iUohY1E6KPYZcZIXOSw==
Date: Wed, 12 Oct 2022 17:23:57 +0000
Message-ID: 
 <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BN9PR11MB5404:EE_
x-ms-office365-filtering-correlation-id: 31d8ef5e-d98e-444c-10c9-08daac768b6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qIVmzdbywUzGV3e1PSfi4Di/3rAGDCe8Wq7uf7TP9p1xFvlGtOnH8LYI96lYZKHJ1u+WOnSQ8G1Y2/4hvtdkJIUCWCuvGDn/RVyarM353NXy0Sh0Fq0C9m+W6xrUDWw6xlNoypUwrHWsiBsgU6GSlgeqOm5KVOkI9pVPUGcs8lEoDGCw2Vff+rBk+uqtjaDxkkMI6HeMOsdHPUx6UVGTMxs8sjpnrMnKuhAaPXg1nRW/9BFjy2+/dw9lJjAGj4nwS/gOjThrBaQjydapnSQVPZ4xA+wjrF4qYUBZSGodRfsBLfyjaZmo0BY9k8DDPU4lRo5Lc1xMXjiBC19GTuc9gzqEoEED1ts1bNu7IG3pWVk1UN5fj5D4cGgvT4ITdr7t0Q1M1friROQPc80G61+hMUW5Hr3Gyv49I/hxzId10C+mWPAG9/5K1j77coaomAFbLpcMltjQHH4t5pBZ2elCx+vtY7EbLQ3aEokeAjnnKOyvfqLJsYXcsoGBBFOKZ9+LLSglw72WSNH06uZ63sXwlXMAxh5gkmp27V9mDSQ4a4hPhP52OLr6SdEY1419Sa2OBdG+U34AOdyoH/rmYORtlxLnnKiTFh6W13j4VT5+BcO2y2UcMfGwG17QSSvMmRibHbQbUZMLS3BYfNxbtS+tnUyUYep5EefmSWj+/oIaX2PhK4L80XEDu4Z5kONexCjNFZeFfM6E6ecBScdsnaqhNiUpEbtNMdnDt4dChnjE1AZnLYfn/xMpOPJftmwuhJuJghDoDjcV/yfxWijqk7BjwA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(39850400004)(346002)(451199015)(6916009)(5660300002)(186003)(8676002)(86362001)(8936002)(52536014)(83380400001)(9686003)(122000001)(66476007)(64756008)(66446008)(316002)(26005)(91956017)(66556008)(33656002)(55016003)(19627405001)(76116006)(66946007)(6506007)(7696005)(41300700001)(15650500001)(2906002)(558084003)(38070700005)(71200400001)(478600001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xQTGnGdi7rFumV9q2/u1buu74NVAko7n+kN2CAN0CfRL3dyZ1CylH8kYAi?=
 =?iso-8859-1?Q?iiMyu0JCv7BUv+L0pF1tZESnEb9GSF5Z5h5cMP4qXoEryRGm0IY1377DeU?=
 =?iso-8859-1?Q?agHSq0WR0G+PZtGcC3BNv5UPvNDMaAv29HRePaeV1qrpanscg7ekTXCwWu?=
 =?iso-8859-1?Q?vfFhYF/mpBbna29YP4ISpWKZWdQrfjVgj6QFshcr7nB/zgxrfDHgl2AKvu?=
 =?iso-8859-1?Q?fcYRRBE3LSj76NwDeofXsHJ1Ptytg2Aa1BAKXuu6ATcJfz2yQpkM/eXafx?=
 =?iso-8859-1?Q?2akI+HfcgtBS1aHvWgx9ikhcmhuCbhSuLmFNz7uKE22oaPUIbqpE8QJOZ9?=
 =?iso-8859-1?Q?uDT0b9MTH/3f0G4ZoePVHzF+VPc0OvLkF+Tn/nDDtzx/QhtEEk7RGTBRqz?=
 =?iso-8859-1?Q?V60AEZp3+ClME6quDhQ9NY/DTnk9bYFx3uPHp2jg2aL2f53wjrAGJcDu6M?=
 =?iso-8859-1?Q?6gGlz+OJLpSqNYbNdEeBPBDbZAuuE7sVkSAZWAl1BuSg6NhByDbgAJ5DEx?=
 =?iso-8859-1?Q?Vllgrp0ywVqUW5gEauwBKwdUjXkjmU5gOX/2i3/xqTJ41OPmr5KGUql1De?=
 =?iso-8859-1?Q?FoaNETVML1oVEXLBvAOq9rFTiIewK2EM5QSQzegWlvTT1ECYomG8DvAcU6?=
 =?iso-8859-1?Q?9lh5fVK0aDEuG0M0QhR6i7xTKfeJwuRf1FJYZ/jdLj0dSJ7VGLiQbG97rI?=
 =?iso-8859-1?Q?c9FRY1QirOwjjmBBFmvClr0g90/H5gLDBjU+hGF8pQzPrHwH+qb8DiP8oa?=
 =?iso-8859-1?Q?dVKh6NF5ZnmkWvljVaZvljaDmfHU65tWgO20sXLPPVUe1OV3U9LRuPcWAt?=
 =?iso-8859-1?Q?hVBjazIITlM4DJBqYcSiMRlRsw81wxxPhirOn02po4vStuneln0T7dY8XF?=
 =?iso-8859-1?Q?+2ITOtAlLvOF78kfDuc37zoZzwLFp4L90+bz3tQ7ljZI70n0WOHbes7OuQ?=
 =?iso-8859-1?Q?7XjYUB6TlXNC4JG9d0GRSrqu/Nogf/nvXq+pfBTyqsPM18+FhVWoxCCj/l?=
 =?iso-8859-1?Q?/wzSRUD/XnIegTzwn+4VP6PpE/XawGCW47+0PNHoY0pLE0ObJSxHMAbyX4?=
 =?iso-8859-1?Q?ZyWzo9ZGjAdvgM1dtzUHp3Hnewacs/iiCtFpNmx/YSsBM2IvL3dWMXBRkB?=
 =?iso-8859-1?Q?zsr9c+vHx+gWmjqbKmn9agOuGW+L2pxKDGq8M3qYH+91ZM4Ea77p+91GJR?=
 =?iso-8859-1?Q?AaTeTTEDOxmdZgpBmCPp1+gnEmPydu9Jtw1aCO5P83Zs/ov6Bdmr8UrNZc?=
 =?iso-8859-1?Q?URjmkkoa7FV64Ifg7FM1jWxaOmnDeX3GHbamNXq6v7v06pxMjLUIOoiT4T?=
 =?iso-8859-1?Q?G6m5NXhLKekEHmpDFAIszUsqtvLm4tqNEHrqTR/SJ18vwmhyJUHNj4Pw49?=
 =?iso-8859-1?Q?OvdzoLZOf5EbvHvNvvH044xdQxjSDzQfFpYFRSZx3+aOqko3iQ6VXyVsso?=
 =?iso-8859-1?Q?UeV2pngpn9xBg9WMhDCEYEqY7ofP6CMnovDQBRHw+ez3iWymbOv1v7SDMR?=
 =?iso-8859-1?Q?n0AbxIsErk110UQZHWT+mUuRHIBXRT6NAIcDgukus67yQz60wFoQPQ3qZ2?=
 =?iso-8859-1?Q?1de1Syip+tbaUGKJ35vDO69xE+5MBhRko1yLtnr+Cscecoy6yFX6aUfbIz?=
 =?iso-8859-1?Q?1y38yTuRm+d2BgB3+mpHnGbZHhvBFCxL/4oI+5H/eLeTVoMDQlURRhvA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582294CA64F65F30BD08496984229MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d8ef5e-d98e-444c-10c9-08daac768b6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 17:23:57.1423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXT2rivrLB0cWlkOraNuIENPFj+Ng8fVc5poS6wUzfNybM1rw8/0SFeXoPc37GvhnetREEu/Q/rwFlVjiAIMxhJMsMaQUb8+ywITGUiA+SY5iIfynoRcPeSav4gLEOBp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5404
X-Proofpoint-ORIG-GUID: vTPmFCMwS19Za4nVIdUXH4JzWi3iL71H
X-Proofpoint-GUID: vTPmFCMwS19Za4nVIdUXH4JzWi3iL71H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=423 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 17:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99147

--_000_MW4PR11MB582294CA64F65F30BD08496984229MW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

HI,

Could you please confirm is there any security fix providing for CVE-2021-3=
3461.


Regards,
Archana

--_000_MW4PR11MB582294CA64F65F30BD08496984229MW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
HI,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Could you please confirm is there any security fix providing for CVE-2021-3=
3461.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Archana<br>
</div>
</body>
</html>

--_000_MW4PR11MB582294CA64F65F30BD08496984229MW4PR11MB5822namp_--

