Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C7EE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:55 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.29])
 by mx.groups.io with SMTP id smtpd.web11.8724.1733297911534357437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=D0IHbSWt;
 spf=pass (domain: outlook.com, ip: 40.92.52.29, mailfrom: akashyadav147@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8gBSV1ijBT/zXNgPOGUFxjvsI1iHeCOl3vhg/0EDOBsBF+36rKiKqoCGqbvnBEqZ/dkWAJTUGj/Yx5gzDqkZUteZkSzylkoD3vYBRCloKnOxxeikgvreQcFZu4+RzdwJvRnX5ZMH/R5uMXu4Lys/0YERc1xRTN+MmY7CMMVc4PAoMF34Han6F0T8LXb75B1+qF0y8iQq61CO/WCaTmAUaWaO/wqzZufp/EyTZKubyIh9KJclXdFPiWYF83RB1l+l1Dj7dUxitwc/iS/jYl+LExREdY48chvEe53gB+kv02bozTwBRSC7EMtmF4cZ3c0M+GZ9G2ZcicvkJ8jN+XjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvD3qwVzeMTG9v2l6woDEM74+zdQFpNgCDl9p3BTzws=;
 b=h/xp2eS5skiLYC42Z5By4S01id+NG/0Q5yNcjwWlNJadECEi7+Qy60oE2xE5Rnzm6oypsvlZXb0ACQ8uG8GtJw/EF9NqnCXu8DZsPXJRoXJOR/366UkrTS236BeX9vaF+I9uLrkS3r44Xu/blVAMOhnOolSIFxvWZnRMjSO6swAsPqiNA6Nad5OemDaButi9tvG7idOm0CwgVZgptd84Ye2gGwLkQPnn6vjUAla1W9aJeCFSInLj1kFNapNr5U1eNMzj4G26xB/ajfNgJNKaEHLhHheiBjGeSNoX9eipP9iJD/He8ysQeJbPMP1IwHfLpQEXV5O2RcA6nDmZak4MIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvD3qwVzeMTG9v2l6woDEM74+zdQFpNgCDl9p3BTzws=;
 b=D0IHbSWtgPiAXrh3rRAFzPsHNP+55Xx1PWMRTMRcs6p7CYsFL49voLVyWD+wYI32vL4RyY2/Hy50bz6J0QXbKDeWIb9otbh27b5TwegRCR5e6LVkapzxlaZN/4y1N20k+Ao92G90nY8KCmk4gFnG1UB0KLgA2dtIKX0R3VDQwVhS/LLiU/74cnAvfXLEzbYEBFlY42w7OWnr6SU4RXtKkLPyJQBXUE3Jjs0vxSQqKH8079KtLDCHSoPUBTLwsa42A5tcrBYJGAhq8cNBYANbrGVYWHacgdjIxhAOd9QxQUrKyXc9r/zOEzoFBbVuSi1R88HZqH2gUhVftniZsGBn1g==
Received: from PUZPR04MB5229.apcprd04.prod.outlook.com (2603:1096:301:bc::10)
 by TYSPR04MB7714.apcprd04.prod.outlook.com (2603:1096:405:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 4 Dec
 2024 07:37:31 +0000
Received: from PUZPR04MB5229.apcprd04.prod.outlook.com
 ([fe80::96d6:a058:f847:77b7]) by PUZPR04MB5229.apcprd04.prod.outlook.com
 ([fe80::96d6:a058:f847:77b7%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 07:37:31 +0000
From: Akash Yadav <Akashyadav147@outlook.com>
Subject: Site Design!
Thread-Topic: Site Design!
Thread-Index: AQHbRh9gc1BmC1qrB0OrV2LY8q+xZg==
Date: Wed, 4 Dec 2024 07:37:30 +0000
Message-ID: 
 <PUZPR04MB52296A03A3D681F7C9B7C2FBF5372@PUZPR04MB5229.apcprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5229:EE_|TYSPR04MB7714:EE_
x-ms-office365-filtering-correlation-id: a8a2cd6d-cbe9-4625-0705-08dd143682b2
x-microsoft-antispam: 
 BCL:0;ARA:14566002|8062599003|19110799003|461199028|15030799003|15080799006|7092599003|7071999006|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Vq7STN4ydWX1ZTmPRJ5yUfMWMqaMauB7NxGKX03fSdjl3OeWbxpdCokZy8?=
 =?iso-8859-1?Q?hI/0OCOTzDbnQPmRleYHwmsqLGGXTLO/85/bWlPGo4WiLP68Gx2JstsC+a?=
 =?iso-8859-1?Q?B4pDpUFuyHdCpUuSby16a6ejpT8KNygDIpholf0gFB6YpQDNkdH8rW5GFS?=
 =?iso-8859-1?Q?eq9mDMBClrvVPCu7NsQ70Z8JbM5srq79DMogG50j1xnA3xdfzdCR3jXxBi?=
 =?iso-8859-1?Q?DO1UXOVnFkK/GhsKqr5gcuPllTMi5xdwqIGwB7VDvnDTii2muwO7GYyMNH?=
 =?iso-8859-1?Q?XKyvQJDkXPRXWDcO15d1upfHZTlEUTuKtOAh9STFYbYJ2yKGQZCDffJ61Z?=
 =?iso-8859-1?Q?2yGJgXMQqwpwiPsTsxm03rsxMBv2Ql1ZEJsqfTDgKCo4iAnEzMF7kZVwon?=
 =?iso-8859-1?Q?/eR4UoEnXslJtrzLgooiYMtTQjfU65GzlfJZwQh+yfBpjxmdoW0oejVlcP?=
 =?iso-8859-1?Q?7+w9B3pO+SHhNTi6bvTL5lc9pVo9eSVA4FFIYk7/PWzOb3Yy1UNoExp2FX?=
 =?iso-8859-1?Q?wCY2SmBeNNFFpc2/Wl4caHQzmZ+RJFdQYEDsdbs2wsuaDbwya9n+sLTS1o?=
 =?iso-8859-1?Q?uF38KtCv816e0qYSQXoHinEl6DHzFsG/wMu+L3JddMa9OdgH3iRjepmjn8?=
 =?iso-8859-1?Q?3lrXOk6tcalSEyllKwYDf1ZFlxrxU/FjBn/flwPnxVEoPliAaEe2fBIXI1?=
 =?iso-8859-1?Q?eQaC8BIoTdz1n+K+jlfCpWuK/Ld9ueCJ3lxjdG8sAvl+aaPTTU7pK7otOy?=
 =?iso-8859-1?Q?LRVZZGCsVeIzCzsxCe6drDifYqOeyBG/muC3Q6YXcbkqj5giJl/m3NPjt0?=
 =?iso-8859-1?Q?xQoQkyeeL6gOGcJ/3XSfg1iw/0/OU3OgIU7MgbNgUbm8mcu9te5WGfmOoG?=
 =?iso-8859-1?Q?rGmzbp+M0RkYxTA1yvvSAOtdX0+S6af9khrJONPIu7/J0eTijQZWO2aMV9?=
 =?iso-8859-1?Q?jltm5K/7qrk9T11OjBvxBsak4Q6Npp5sk6na4mY89+g9M2/LFgMOupsuzL?=
 =?iso-8859-1?Q?nSjvB3GPHJ+sa8wLrGqJyOBiZNGIUv4MKhxA4ju4umMcetJMHr8XmMzNis?=
 =?iso-8859-1?Q?RGZGGimHhiM5tnwrK4QPElTgTMyZIRPxf6KPLD9mF2vTe89IhhRRrNrY5Z?=
 =?iso-8859-1?Q?T/ICXhB0YtODZ0QAuOdizvkgbaHNI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?zFgIU3jIRuhfe2MSN533vzrO9K3/OkMfPYOediWekiwRJQ2WU2KkcTqhXF?=
 =?iso-8859-1?Q?/eFfaz5R2H8W/U8fLoId0GL4QdZOlBXVD4I234IwG5EIZKN+iEEGkY0HFS?=
 =?iso-8859-1?Q?bM9juQL9KCNS4jPPQWO7DuYUqkh+8o4skHOmIAlQNbBVASa2wuBja6psYw?=
 =?iso-8859-1?Q?qHu9BoaFWFmdzAiznR2cGUv+eED6OKlQKfTqfsUzD61pA/Jmo55qKeiWpE?=
 =?iso-8859-1?Q?TTvoveqqn3MKOzXK7qH9bE6lPJlnaO1Le8Yp1enEFTD8VNDQSynggaGznV?=
 =?iso-8859-1?Q?EWqZ4PSh/XRJhZ3wZL6DM0+BVACiJo2po7gwuLEHTFlHni8e8JX0/WZR0Z?=
 =?iso-8859-1?Q?H8ixMRK4BW8f2MrkFWWO+Q4lQhGyMCwt1s7sl4kGQvm1g96xeVF6WX5tiQ?=
 =?iso-8859-1?Q?5z4BLDPAJmKaPOgEUCDcgFD8VblVH9vPa1f1CbW0RlpRY96qEfKVAZoTMD?=
 =?iso-8859-1?Q?+fOrKzl0+wGQWpZezm6baQ1SWcddHFyoZG8swkiHJSMeg4GXF6B3CLZ8df?=
 =?iso-8859-1?Q?3urtIJk14sheggVFAxQPAZOZxJ3ctHmLWiynpi7x7wNQtfB+4Iw1NkIOt5?=
 =?iso-8859-1?Q?99er7yvFX+1xx+r7Ho57G3W22/Omej+LlTu3SnfeySUsv83c9kca8AWL/v?=
 =?iso-8859-1?Q?4FCTx8gBELWCLnH24RFqM9PVFJpX29i61qI5P6m4fLVxOoAqds/IQ1/OOk?=
 =?iso-8859-1?Q?30fdJ4SkSU42vCBAgwR0IX7NJJhQ+4AOS+uX681uq5+BZPKqceyesdqNn9?=
 =?iso-8859-1?Q?Ejp5zUPbKjgJrFfoV2HM0gL1B2MLd+5hsMSthwYLcEbIwp2ddWgedmJFr7?=
 =?iso-8859-1?Q?+SbwnlupUmkELfH0WVuWUZLj6D1tSy9/mxB5EH9ScNeWZ0UhYYI9CkiKgq?=
 =?iso-8859-1?Q?luwNmZPD32fT7EAZRP4zBSqY84EFcR+g0DARKsNKXPr+d2qWLxZ0s7gis0?=
 =?iso-8859-1?Q?8MSWgfPUIEZo3EyiwASyYVP9MXXFaCVBZ5YWJCIfrOPanu9GgkQIgpG5lQ?=
 =?iso-8859-1?Q?O4ET2Uiqxh/oahdGieX6HrrWgDaiWYpAthy5WKGlfwb70hisXPqGzxsJ6W?=
 =?iso-8859-1?Q?xF9py83LJJPlZIgu6B7UfKtJxqHybeouDVxuHU8qOHJEazT/0vdMJT+fB9?=
 =?iso-8859-1?Q?MwouVHeiWfEeSJXtFA6OEUE8LpnT/5uUhwloqDLP/pq7/C8ILlIqealbtt?=
 =?iso-8859-1?Q?2Xt+QgowvawOabOXlwV9APDViRP6BsvPHCHOYApoPTGgNPHQ+V/i5dR026?=
 =?iso-8859-1?Q?oSqXyMDWrKuT7h07jcwVQrHkkXgMsE5/ggzbYnr1o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5229.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a2cd6d-cbe9-4625-0705-08dd143682b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 07:37:30.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7714
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB52296A03A3D681F7C9B7C2FBF5372PUZPR04MB5229apcp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114228

--_000_PUZPR04MB52296A03A3D681F7C9B7C2FBF5372PUZPR04MB5229apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
For at least the past eight years, I have been employed online as a profess=
ional graphic designer. I create original, well-considered, timely, and eco=
nomical designs.
I work on e-commerce platforms, web design, and other marketing campaigns i=
n addition to creating new websites.
If you're interested, I can send you an email with a few of the websites we=
've made and the prices involved.
Regards,
Akash Yadav

--_000_PUZPR04MB52296A03A3D681F7C9B7C2FBF5372PUZPR04MB5229apcp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
For at least the past eight years, I have been employed online as a profess=
ional graphic designer. I create original, well-considered, timely, and eco=
nomical designs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I work on e-commerce platforms, web design, and other marketing campaigns i=
n addition to creating new websites.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
If you're interested, I can send you an email with a few of the websites we=
've made and the prices involved.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Akash Yadav</div>
</body>
</html>

--_000_PUZPR04MB52296A03A3D681F7C9B7C2FBF5372PUZPR04MB5229apcp_--

