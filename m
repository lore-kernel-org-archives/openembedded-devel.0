Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835DCE7718B
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:25:55 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com (HK2PR02CU002.outbound.protection.outlook.com [52.103.64.3])
 by mx.groups.io with SMTP id smtpd.web11.15367.1733322166112198123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Dec 2024 06:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=fNsLSFIg;
 spf=pass (domain: outlook.com, ip: 52.103.64.3, mailfrom: ankit_mishra1992@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly8OVtPb9LVb018szopVi6bbOHpysmMSq2c7/5TR91WzHB+1QjUwio0KJ6z9V9Vix2Wuz9T5xupTNPk4m0BuU/w5s0yns+1oq0Q5QLY9q6bHEd8y1xTOPsvPxOItIhcfE6nnXsi55g8Zazg2URa1lpXBSB3OCXSjJO2/iezmSnWkHEcI5LTJD1A7IztxXxB+Itw1uJXd6kUaHvIo7AdzhxKaLFaqDnWz8OZG6OGX7DVEJQOGQlOn/cvEPBCfwL1oyMopsfzTXIfvMgRsZqz0lYpl5pyLAM6se6uiBISOOcpcvyJDQSAaoLOzM7Rr3ihNfzXjNBMgkugDRhUVOD1IHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2A2deczBXKACtiWkaxR0j5EC6HbSok1IPKeO4erIFw=;
 b=iLB0qhd7aLSkfi2XJeWNa0vRC1QHWestdax4jjrBR7VA2NKcLgWMqZ8FSLuDONFcvMtIfQ0pRANRMGUs0jwHyoYBqbhdWxtbJm+Q/+bI4xnklaBSX+3yohdA/tGvFUWD0eKe97k50WFemPfl2nprJysTP5ageuYnDR0ZvNnZqyr2O1C6zTjF6t45jfAaxf7R3P83rDQo7n4aIwP5/qr2kqxoFgekVW+tF1f8mMUvhFcrviEX3XlypT4k2QUuEAlwLniNTbXCxbj8fP0VPQj6H0UNSKMTkB/wAGIFfJ2rRMPbmeGfiJ8dSgTbMf/1Qo59JvDTwy5T4xwSOkZ3p1OdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2A2deczBXKACtiWkaxR0j5EC6HbSok1IPKeO4erIFw=;
 b=fNsLSFIgzth9dukyU0EsCoUOuADoZl6EtTedh0lhOJfKdP9ud5NYUNWaAgylGX+/p71SUu0sgBTy151T2jJAomHnPYciQUfLqtgAAk6Fawmh5wGYuZ4tQYtVRqBA4p6IPy4RCTIuIp5itxbngS4YtMiR/nUbHPktqfEhAKVXT5aqgjGB7DVGmMzP3a6laiUi5VtHbq7e22UK7MA+/hR0s5cSSiMmB2KmfzaSgRcOK6OZPy88qdSebdmI5gZ1UPH3fkWpZzHRa8rUjvxQc8NWIGdqlDdEDrVQIAoQbI+qk9ZLQXwIBPc+ABK/Es9/HDsa5jRTTTHOscBf8m57nIF4xg==
Received: from SEZPR04MB7985.apcprd04.prod.outlook.com (2603:1096:101:22f::5)
 by SEZPR04MB8310.apcprd04.prod.outlook.com (2603:1096:101:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 14:22:10 +0000
Received: from SEZPR04MB7985.apcprd04.prod.outlook.com
 ([fe80::7907:6ef0:1de2:58cf]) by SEZPR04MB7985.apcprd04.prod.outlook.com
 ([fe80::7907:6ef0:1de2:58cf%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 14:22:10 +0000
From: Ankit Mishra <Ankit_mishra1992@outlook.com>
Subject: Make an application#?
Thread-Topic: Make an application#?
Thread-Index: AdtGVUGKTl2ffFXDRpKxoov9DWNt+w==
Date: Wed, 4 Dec 2024 14:22:04 +0000
Message-ID: 
 <SEZPR04MB798587F16D8A81ACF439B5D7F5372@SEZPR04MB7985.apcprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB7985:EE_|SEZPR04MB8310:EE_
x-ms-office365-filtering-correlation-id: 28ed99c2-6647-44ff-80e3-08dd146f09f6
x-microsoft-antispam: 
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|461199028|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+oAvbIY3UY4K2E4catsCWN8dsGVz+fZJ/sJqIOLvorSA/NFap+IEjHa2kWvi?=
 =?us-ascii?Q?3XdnwQWl6HJla1P692vCkfkpJFSxCtlXDtLwv5RUtoHlgtXt3EzvHDOzxX0H?=
 =?us-ascii?Q?5/daloYDTWQmACqxvs3YePEumoQl/qFKim1NP4NEQFC5eErbPwW1ma3whL5m?=
 =?us-ascii?Q?jnFdEPntGjdc2vtOIpOdzSOwsI04KSOvwQYR1i3D25SMhJkuw6Y3YkepW/e1?=
 =?us-ascii?Q?2DGxKOugYDEI0btHx0RFXns5EFcjfGfKE78lOSWkzLouQgXZjfWpma+yfXyG?=
 =?us-ascii?Q?HJ++5eXRRZJZhbexuqKUqCA2APt7z0baLMzMGytjJ9w253mgLfpsx6rvRvHs?=
 =?us-ascii?Q?xOJ50k/WNQ+PMaDpkvbWZDvUyphrSWILhR+YbU8NxK0tW3m2r4FqkHvLUo3J?=
 =?us-ascii?Q?dCYwOaXCwRtPGDCHiigJV12qJXvoIADyXc40XtsBz+JJtzv+sWzVQHAMpeGO?=
 =?us-ascii?Q?AWPLJlQC9R1/6Tpqn5k+H4cFwMv8nn87O4Li5/nWNF0TlHMxFTqPnwvZsxuI?=
 =?us-ascii?Q?Tk9KzTUWF4inzu0BNLwZE6BXjyMDTk3oi5mg3CJ7+QMKHISwlTnlwwV8G0Fl?=
 =?us-ascii?Q?K3ab0K6umN2y5dIyMhB9J46lO/reFbr23vvX6nfEB1c3aTIrwsrcweYEJWXh?=
 =?us-ascii?Q?2L7sconzOaV7PLR6lrwMP36rSQJ8tj49rTrei4+hdiOVx6tNlQa9UbP2nMub?=
 =?us-ascii?Q?tJmdA2a1Jn9pdo2htIEwGDmZvwgKxt26xUkyjGiqfaTWuK01ymD48nVHIgLd?=
 =?us-ascii?Q?SViQnd+wZcG/zIqco9xjwIOFOsMKrERVQ5S3g5cdH72fBChrscOZ4E6QIes5?=
 =?us-ascii?Q?WYN1zJf4wIg1Atyex3ty9KdXtshZVact/BD+gFIjFIf+P2azGhf4ICkpNNUZ?=
 =?us-ascii?Q?SSQ6JLuiZBtfw2lIxqFTWbyW2HqPGI4SLALiC6q6uNbuz4r+milqXpKL4j7I?=
 =?us-ascii?Q?vd0oqE/+ZkplokkA2L44gN+PWLIyIhbZnJLKLnZ+luNH51BFbCwyR1lKnRmH?=
 =?us-ascii?Q?TcPTUmw0nSnu7SZQRKevMLVNIA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D0V7IsKuZufKw169c/5n6/e1RHYuOdhHftJldIT4j2NWh0ygGqCYLBoQNQza?=
 =?us-ascii?Q?yT+bME+3SSHc+B2G3t3IenqMmXYxKdPKKQgUv/LqhbHgdur+dnnWh0aIkt/h?=
 =?us-ascii?Q?zgmEhJ0kxwQucik+1mHqf8nQT42zpJQvimiehsx/YIoCkOKKSGwEuFRVM7Ru?=
 =?us-ascii?Q?va2AXL3tB0Ks5/t2C1QGDcoxEYMSz8zQU0VtXMIeu8KIDUbpNdMyI6//KVPZ?=
 =?us-ascii?Q?wCCcn/AJgNeivmeb6bpAdnkB3y0PkqaS94WaqJyvbhuPFhyi0bXxne37ezPc?=
 =?us-ascii?Q?p0eYV3uieQqWhcpHcGGQJxYvGRsZgyI2wa7fdEzFz/4x5LBfovmaDNXRQ1I0?=
 =?us-ascii?Q?k03TmDK7Gew2UYEMp3fHAiqPkC9Z2nQDbKDk57Gr7N+3Z2ZjG3OKDE/xTAFk?=
 =?us-ascii?Q?sm8WAYhGYEP1CBqO/MydrDA9b3VasWhcv24DxJWf3VnjKiucJmmc0FX+pDV1?=
 =?us-ascii?Q?qWaA0Dhc2zNgGL9Mpcpx4gYm63an+3QF00YJsa+9iddHsNmjZqgrXb2hO1xG?=
 =?us-ascii?Q?j3ztUmY4SH5kF/tFgAxh1jb+TF5NnM/kL67sEgopgKy4iRS9tfuu+ZZ5xuRR?=
 =?us-ascii?Q?pJuo21sHXoBJGsJfQ2TNOC2hHCTADLcY/BdkFF6naDKv2Lok2w5DKXFY7789?=
 =?us-ascii?Q?FEwI/Kv8cwuhL/ISb0+TSRzO3xLNByKtUor0mssUCW/6ww88h2gZaL37HMDN?=
 =?us-ascii?Q?uCKljZAJ/zTKKZwALgBHA0DcYwp1aOOw3UTdQ6sSTDXulEonYxxEH6S6qMY0?=
 =?us-ascii?Q?Z/5dQjtye0c3RAHoGxnF7fLZytbYdFxh83xi10zFaG6SqXc7eKpHnpH7c9nC?=
 =?us-ascii?Q?H3hZ1bC7GS55xP6v8Nu6ARAJAFo0AYiN1YY8vvuz77xrVEg3drUgn50ZKlO2?=
 =?us-ascii?Q?WvSKvNKt4Xb8YGloeW54+fK6fX1ZB2tRSsVUoGckkROXzSrkdsZycxImMcuW?=
 =?us-ascii?Q?JDk5GzTsNatAFLa5ofjYDqgD8i/qhQ9wDgiL0B738cttLNH/t4Cx+rmeueH4?=
 =?us-ascii?Q?NONv9d6C5nDz6jnzG+Avmx3yOOAYBM3uZBpr/fALTjNN6qul28ipekexD8w0?=
 =?us-ascii?Q?ELBcU6vArRx7Vz+oqHBAQKoIxrn8O388Ozvm9nBFJYo8V0LoWqSSTd5vwvj7?=
 =?us-ascii?Q?F01+gnAnVfIvuCK7OMh/fpSHnbdDjKE39uYmTk8dZLcCa3o+ysL0c8+03H8z?=
 =?us-ascii?Q?27GbYJViISV+y74feIprF8WxRUbtp/LH41q+s0hsEttBCUUZp4m5jr9ToUry?=
 =?us-ascii?Q?eq8VLcCBKPpaWVMmvNnW?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB7985.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed99c2-6647-44ff-80e3-08dd146f09f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 14:22:04.7826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8310
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SEZPR04MB798587F16D8A81ACF439B5D7F5372SEZPR04MB7985apcp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114235

--_000_SEZPR04MB798587F16D8A81ACF439B5D7F5372SEZPR04MB7985apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there

Our award-winning Indian mobile application development company focuses on =
creating the newest Android and iPhone applications for a wide range of int=
ernational clients.

A Financial Firm's Mobile App
Applications from a mobile insurance provider for businesses, such as those=
 for scheduling, billing, purchasing, financing, and food delivery and taxi=
 services [Travel, Booking and Utility, Food & Drink, and Health Apps] Rest=
aurant App

You should do the following if you wish to use these apps:

Tell me what you need, please, so I can send you our quotes. Since client e=
xpectations impact our pricing, please be specific about what you need.

I'm hoping for a favorable response.

Many thanks.
Ankit Mishra

--_000_SEZPR04MB798587F16D8A81ACF439B5D7F5372SEZPR04MB7985apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi there <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our award-winning Indian mobile application developm=
ent company focuses on creating the newest Android and iPhone applications =
for a wide range of international clients.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">A Financial Firm's Mobile App<o:p></o:p></p>
<p class=3D"MsoNormal">Applications from a mobile insurance provider for bu=
sinesses, such as those for scheduling, billing, purchasing, financing, and=
 food delivery and taxi services [Travel, Booking and Utility, Food &amp; D=
rink, and Health Apps] Restaurant App<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">You should do the following if you wish to use these=
 apps:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tell me what you need, please, so I can send you our=
 quotes. Since client expectations impact our pricing, please be specific a=
bout what you need.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I'm hoping for a favorable response.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Many thanks.<o:p></o:p></p>
<p class=3D"MsoNormal">Ankit Mishra<o:p></o:p></p>
</div>
</body>
</html>

--_000_SEZPR04MB798587F16D8A81ACF439B5D7F5372SEZPR04MB7985apcp_--

