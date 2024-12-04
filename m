Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE89E77185
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:55 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com (SEYPR02CU001.outbound.protection.outlook.com [52.103.74.81])
 by mx.groups.io with SMTP id smtpd.web10.10710.1733307153889508577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 02:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=gEifdP+z;
 spf=pass (domain: outlook.com, ip: 52.103.74.81, mailfrom: poojasharma3355@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFOq9rLAYMTbilEV3xZMdBt0yApskK1pfx0j+fE5lSR1hecIfl/v7wMpaKLrtpiE9pTWhBj0t0IdVzeyM/b+/Mwq203gKb3uK3gXyNyC+sxsTzx7Y6a/WzskvOojkcMoERaMRDfrfxyByrGDDYGaorxlFnYfTCkdcqOr1mDg0VlR5uSjp7TBwsQpz+Nk39PMA/uKzFTvcdp+IvWByPRXokYNfdbgmWhwsOgRdRcNCdwTySjTOiOoepCd2y4aC31AFSUPYditVsTBzMewv+2mSHEGJdsrRLusqXLFMIsHe/VuyAP9Cs3cVHwMFGwVl9Vo7fSmY8wCaxgB0HTyrAXy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgNhrUGXAI6x1LFxiFzPyhnLo68V1EyHheFIbx55uUg=;
 b=BuVMdn6GfaFcADPzmmxsimc42SPEnmQTl2+OyNqkSGQCfnFlvShDdrSCUFWDA9UtJnegwY2NaT7h9FbOK6Jff95SDg49307+qD6Yn48uI9nICS1KmxfMV+aSTO2jSH/3p1Fu/FZHF7f/VL2fHGJKsYzSgW8kogbcLk3RuSkuo6MamsWoVYZKvEIV290OcF6bSgCZN2OPQA2xD3O41+WhtCTaCy4Tak7gf4gmkW45ioH7nJyKY515hCEgQ2p7QdFUKb84L5mGYW7Qr41nIwLox2J+9Il4Gdu1Ai2vV5kHjVSt73JoZVChBxp8l8Ss4D0JpeNhQuNW54CMgK576BCMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgNhrUGXAI6x1LFxiFzPyhnLo68V1EyHheFIbx55uUg=;
 b=gEifdP+ztc6oqU02SBIKUurQkxelyauwH2sLVuYYNlFyqnzeg1uwrC2aWSYQBFec4x+imcSpehr4tPAAMS1CQ5PuIBMgqt1QBiZHyweUQ+xMkxqqgJrmJ72sJHlZgyQr38AWI/OG5YCAezVjE2Q4rTH50Xqps01Rxr+Uw+nW5BODgSCfkz5nSqhtbx9QCJXl6/Hff89eTxm8WVjSvMHDJ7+zNIvDZogsL3QB6XJKGv5OZoGIH1eqwjWF/VU2W8QQSXd+c+q8lU15j9cFZ4GYwgZn5Y8uYKuxonlXh6ViwLcvUoR0p2+9X6eoIyNPWCyfVV2ntX8HpUrPsCx+kxbbzQ==
Received: from KL1PR0401MB6492.apcprd04.prod.outlook.com
 (2603:1096:820:ba::11) by TYSPR04MB8219.apcprd04.prod.outlook.com
 (2603:1096:405:8e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 10:11:38 +0000
Received: from KL1PR0401MB6492.apcprd04.prod.outlook.com
 ([fe80::9f6d:2bb9:3fe0:dfd6]) by KL1PR0401MB6492.apcprd04.prod.outlook.com
 ([fe80::9f6d:2bb9:3fe0:dfd6%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 10:11:38 +0000
From: Pooja Sharma <PoojaSharma3355@outlook.com>
Subject: Site Layout!#
Thread-Topic: Site Layout!#
Thread-Index: AQHbRjTnvEtHqMYHFEa7lY/XXJ0LIg==
Date: Wed, 4 Dec 2024 10:11:37 +0000
Message-ID: 
 <KL1PR0401MB64923CBB7753D145445A7C3DA3372@KL1PR0401MB6492.apcprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6492:EE_|TYSPR04MB8219:EE_
x-ms-office365-filtering-correlation-id: 55ff12be-16ba-4406-c717-08dd144c0a5b
x-microsoft-antispam: 
 BCL:0;ARA:14566002|15080799006|7071999006|7092599003|8060799006|19110799003|8062599003|461199028|15030799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?8MzN9llPU5tIFscMLzk7zd0nRJFgCCGFeQAoq79FuznZf0qNLEBAKoK67U?=
 =?iso-8859-1?Q?/tIQDSIWDBjFZcfkwqX8ebk6xw/NbtXo1ylXsVyIKB+tU2e/4oS4c0ptQe?=
 =?iso-8859-1?Q?/CWURpUFOiXeJ+o0PaihEMGg+sMt3sPVn5rXnTpeX+gMj+q4hrGR8gnYFv?=
 =?iso-8859-1?Q?4a3UgzrUjxyely7jMtj5aiKe1A03/X4eK1adUBNg4oHT7nEFwx50rmC0Na?=
 =?iso-8859-1?Q?P19hJ9y/oakamliWCILXQ4S+GCpzUYp+yUsEMuxDdB69avccwbgXhHb1eO?=
 =?iso-8859-1?Q?qypaGrKIOTtdcN/g0yBaDhON+8Q8cnchc+pKIflprhgI+i3mUvsdlwJaYm?=
 =?iso-8859-1?Q?6U7KUCI+hxVulUPhrNhSn06jIgpNc0EhnH8Jl4EPFP2MwGUTNuHMWDFMd3?=
 =?iso-8859-1?Q?Y1CBaDHLfB+Bvi7RQs/RKD47AFgrszB0KiTpeOEaVYvH2E8XSiHkvp0bSG?=
 =?iso-8859-1?Q?Rqh2ualWu0fUhHwsvXyt6hEa0icTndLPFyYM4oHPgL/7tauiezy8mCLQl6?=
 =?iso-8859-1?Q?mjK1JInnMzDhmIouO1/Dt1dH7vLyHwlbz4XYrEIegzDhjAcodCIrHrG1In?=
 =?iso-8859-1?Q?V/qrXltUgRt5kfew8tfe1CiWtbJDV3Wb/s0x8GGcbI87/V5voUJ9/3MvO5?=
 =?iso-8859-1?Q?gp/cB3erL/YzUd6G8DK6TrQWRsLzWxaL+nyiEXfaRRUYh+9t0oZw8sRD0E?=
 =?iso-8859-1?Q?QpkOyNeTunlytf0QvqEULVh7Dd0r/EQNGTHba/X0AIi3QZPX1eigpV0nVI?=
 =?iso-8859-1?Q?9sDPf0bP7XZ3Mb1W9Q/foS4flQTOx6F0UnsOYVMtZGsvU1EVyRZ3f/QLjk?=
 =?iso-8859-1?Q?Mh7hBKL1iL0HYsgEWg3bO/RE5FHsgb2SiKr7w4WzEXD7NdXX8HzHrlpA7d?=
 =?iso-8859-1?Q?ZFGWZ4qIs6ET3u8Mj/4Rp9wYQQiyQgDBzGYhUSNV3uB0yH0rs9ZxEOfvPY?=
 =?iso-8859-1?Q?EEClcuXT5f5JIY/Md6/N49TljQ5faYqOi5cx9DEFwekPOOeCqmFghdLU4B?=
 =?iso-8859-1?Q?ItyclIHmjE8zdZHM+sYFYGn4AvW4R2KJdP1vOCTXafYQX5raseXwSBl3xT?=
 =?iso-8859-1?Q?JgQ1/2GUvV7Cf4f5XzFrR0x+crRzLbqndDEGJvoB0tR/8CHMMT6dxL0Vne?=
 =?iso-8859-1?Q?O6FJqfdRQXMdqvdd12qlva5y9Rdyc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1H8tcK6+ZF+uN720ItqLIZF4eOnaCLGthyVUKosBlNtaxUsQXCweec8+qk?=
 =?iso-8859-1?Q?Xm0lHMP/3HUm7PoBMfVMopNS7rLNxWEgClsiuxsEPJGw89eSw8rfmwYnXL?=
 =?iso-8859-1?Q?hpCUKNy5NZPAMhfk1XOghgAEIKf1QeZ2Jx0OBn43V9CziBYLoH7uZHHrIy?=
 =?iso-8859-1?Q?7Et0+uE1SmQ1vScQiT44W1oP+kq+fMU4DaxipOfJymg6N7/eYd5yNg3o+a?=
 =?iso-8859-1?Q?JeqReOwSZuTuY+zX6LTkxFUN+gmU1Lhw9pKkgkkZKka/bQ2WEbzwMa2Gwq?=
 =?iso-8859-1?Q?Gnc0r5/xbowmibe8+obCfTsyCbo78N7rBf4dhQGTIuDSsVmyo3xYn84J+1?=
 =?iso-8859-1?Q?dv5ND06IN2U44ZHO6JuuyhZxefcrLKpD6CLKGdDiADfD09aiA4+/wE7dKx?=
 =?iso-8859-1?Q?HqzrMzkKK6kdKAWgUigs7JwzSDMGNiq+0rwYw5psHZUB8PNzLxfsXgccB4?=
 =?iso-8859-1?Q?yQLEfVMb+EvJ3hOPR6JPYLPocNRbhVP7hYbxdoOGm68U9CiTO4/Q5T5Kic?=
 =?iso-8859-1?Q?HY65rDFD9xdVlOSqCL93+k57BxFC3raN+GUoFHrBqIkFBl7g3cwX5Kn4op?=
 =?iso-8859-1?Q?A6De/OkM4nGaTM8ThzN3GGZ0V8x+PNK7yJSqgfC8JNKWRhRxF9506sYouU?=
 =?iso-8859-1?Q?9Zj+X+j8X9k6uBQV6bOhJCp9dx+SQ35n7g3cG3bN6IabwgbJszxc2+WbLT?=
 =?iso-8859-1?Q?AeeXW/fMdKTNL01Kkv4c9vxcEKYQXwyQHc0luulQ4Gv+XsoERoconLK4wZ?=
 =?iso-8859-1?Q?3Y4Cb+jFLMtXAEm7ypqZXHFGX9qnTxj9Z6boZGBi+aXN/5/RG++jGQ0cvp?=
 =?iso-8859-1?Q?nnt0dXZ4jQJjX2v5S4XkXwx0Ic7BHG+V4Ba3mq9wvG8LHNi+F4LjwP6ikg?=
 =?iso-8859-1?Q?xSZ3GBsjuGf13LK3Mh2h2vIGrsnFEh6QBUVhiNED6h8/l5lFLJBSuNEa4m?=
 =?iso-8859-1?Q?u32j9zrlTZG506bt/1RqfHO6QdeI65RwjApiZKegCX19VHlSqzWJjMRivR?=
 =?iso-8859-1?Q?ZAMmVblbvGlxcu3LlAwejJ1rRHDSIKUA5Eov44KaTDtHN1nJeAs5uZMRcO?=
 =?iso-8859-1?Q?KDJSNAtmGNqwlXjPItgLhtUAO1mqACxWzFDICu2cRF65e5N/S7+aJqy4cz?=
 =?iso-8859-1?Q?Rekdd3Alp/P2Sx7ythoIjqvUKzW/bokYjICRqb1Wo4HEMu/EnbPa5SAoOA?=
 =?iso-8859-1?Q?/ekjS1kvKyJmSTprgyhCrDHsbwqFf/LZ4Obtyblip6m1VmHwe6rZ6gYfep?=
 =?iso-8859-1?Q?fyTMt2KpPD30CxM5X4veTNp6riNk/wsEvHWI+4mws=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6492.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ff12be-16ba-4406-c717-08dd144c0a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 10:11:37.9975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8219
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_KL1PR0401MB64923CBB7753D145445A7C3DA3372KL1PR0401MB6492_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114231

--_000_KL1PR0401MB64923CBB7753D145445A7C3DA3372KL1PR0401MB6492_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
As a professional graphic designer, I have worked online for at least the l=
ast eight years. I produce unique designs that are thoughtful, timely, and =
cost-effective.
Apart from developing new websites, I also work on e-commerce platforms, we=
b design, and other marketing activities.
I can send you an email with some of the websites we've created and the ass=
ociated costs if you're interested.
Sincerely,
Pooja Sharma.

--_000_KL1PR0401MB64923CBB7753D145445A7C3DA3372KL1PR0401MB6492_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
As a professional graphic designer, I have worked online for at least the l=
ast eight years. I produce unique designs that are thoughtful, timely, and =
cost-effective.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Apart from developing new websites, I also work on e-commerce platforms, we=
b design, and other marketing activities.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I can send you an email with some of the websites we've created and the ass=
ociated costs if you're interested.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sincerely,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Pooja Sharma.&nbsp;</div>
</body>
</html>

--_000_KL1PR0401MB64923CBB7753D145445A7C3DA3372KL1PR0401MB6492_--

