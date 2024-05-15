Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C2FC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 15:44:53 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.83])
 by mx.groups.io with SMTP id smtpd.web10.20037.1715787891207908045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 May 2024 08:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Trbnqy9+;
 spf=pass (domain: axis.com, ip: 40.107.105.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHlNtcjR7jlEjlCfwPAHqonssNr6mKh1oLelBYOmDedV6O6FPZPV1p1Rqh+V6rHWor4O22C7mEKTaA2bJuuroUwHvaZg4PBX5yzQX+Yc8eLLfv1cK/N2couPrXn8qjpDTz177/ROKXR46wafMdGbBf1AFXkIEGFagEfHP31+7iGlRcTH/Vcp+3STefES9B4DPD7LhCBhsBEyvd11wZF/DeUd3xGaxFh++mmB39tXwu69UAF7bXgcRjI7YGAKgZG/Z57mpiN14qHmf2astvoAAA9XI5qhoJRdvzUB3nSnPdSLjuD2H/Z2PQjQ+stoIiGspajZsJxXz6bg3R1phQuhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWkxXvQcXe1nOsxKU0n/AfGWOBBg4fvRTWG6iP3jy8s=;
 b=PgisWgDR+WvbA0TtKqdvFzivY3QDi02MSRaE6fXEepAJARlGeU8T0WV2CshNjje48u3ndwleu0eEQTf4CwimQPuIkonepgZdTtiMRSw4j+AgN7hh+AZJovm3lrlhWuTlKyeu0AoJP6xMFHV4xYG3+v6rg9wid0ye8T8oa1ChgOk73xeQ2GgYo0c1SR/7znQQLISQ2S8i02F05lFXId2coMy8uaIz57+6c5LZk1mZWUGvsPtIAo4AqEaVTFjYkTSp5Em/Mb3ARphq/9TS+wxNxyruteY7m5GWjpB/H62BpYE7sUAD7DxvmAzL/pYCsPBYeNxWVZeeKsNCyqmnFuFZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWkxXvQcXe1nOsxKU0n/AfGWOBBg4fvRTWG6iP3jy8s=;
 b=Trbnqy9+BHLyFfB5ereBlxrLY2YZuI1IU20Yzdm0a7zfIYgll0PBtaZ+wdl5C7EZpAFeJr6Fb7dFz03FLTTMtJFkkKL+D9ejiw10vI2ILs6HeNEHHj9NbaQ+lxPSaK52GUzW89O2I1ZFqsnabk1IKHrTK/pEjashDNu5eZ7d+mE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB10200.eurprd02.prod.outlook.com (2603:10a6:800:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 15:44:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 15:44:46 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>, Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to
 RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to
 RDEPENDS
Thread-Index: AQHapXFGA0zR20sbvEqxD7GsCNpgV7GVnemAgAAJTICAAsNhwA==
Date: Wed, 15 May 2024 15:44:46 +0000
Message-ID: 
 <DB5PR02MB1021325F091D3D54A8F2FF356EFEC2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240513200825.39767-1-f_l_k@t-online.de>
	<CA+chaQfXGRSwepv6+DS2fYx6ashYnHN0mXx7qc9-XjGcEL-nLw@mail.gmail.com>
 <BUZFDS.4175JRWDQOCF@t-online.de>
In-Reply-To: <BUZFDS.4175JRWDQOCF@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB10200:EE_
x-ms-office365-filtering-correlation-id: a204794d-7c94-4536-ed51-08dc74f5f2a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Z5Mm9e3hp1tDdLymzGJ9IPedlPVakJHZeWd+t7dIpJVZdwH1on12Ki+9MhXG?=
 =?us-ascii?Q?RYOax9Ucg1RQYQ847Zvty8FwDoih184Y9zOPYuIrMUo9zz4l/t+zyUVSlWZQ?=
 =?us-ascii?Q?4gpdOYcwfHtq2wZ6G28B3VLQtjr7RLTgC6H1Q+BMAlEgZKKqjw8VK5+XcuhS?=
 =?us-ascii?Q?XsxvF1mhBwQ2OTEMqZ4/E9F0NNwXRz4DyMFaU/X/ml6UXqwdCykD6G1iiL0A?=
 =?us-ascii?Q?lBP5BnZG7wyPKn+DteSezkuz195JZfz0yfP6EjDa7g6jQU4n4O9XyvUN2UeG?=
 =?us-ascii?Q?0FM34Hs5J9ar+DdfIIfecl9lXMNGAR1EiPBM7vZOexpig9ZeX53DGxHmZGbM?=
 =?us-ascii?Q?sViQFnlBaHkBrhjxkGhQasyBvt4Tpj5g7t5O/udQoh8/AgFzfzQwYqisQpGf?=
 =?us-ascii?Q?uO5TcjS/sIoBsDDxqQ4xgLv+1/O2yz0Gvhyamnc79aPRuLHv2EGom9y6NK4p?=
 =?us-ascii?Q?KMQ/MVU/CjfRyRKqi7YSjNfB/ULg6bPF084ra1yINet0D6ansKb58yzWZXql?=
 =?us-ascii?Q?iW/DRPf/cHfe6AZmDo97V5zyeT61FhzfxTv1nbAPTQjF/eqH3ItsixRazlZ6?=
 =?us-ascii?Q?KwRlSRLN3Rz9YcS/ai2YSV2zT93VQ/WyuKGI6zSrgOUAy1y1Qwjtvj6J9mKh?=
 =?us-ascii?Q?YymAd7ZSzRoJJ5h0i4qDANk96reFtypo3dwWKpzle0M+dWx5prDkVE81kLa3?=
 =?us-ascii?Q?PZb1FY3a2Vpf5pT0rIkWu7V5lG5/ryFDoyyK/9KfHZIyyZOZTVMyOkKkiUtj?=
 =?us-ascii?Q?1K4hYdCXM47DqP0TX4CN2IFEfCgzIixE/oTMhf3PB8rNJl53ITiNjx8W6CdK?=
 =?us-ascii?Q?+xIDpeHw+fblcBLXPKFKHdedfonQ3SA0R17+P+iQ415mtcgtekM9aoXOYF+x?=
 =?us-ascii?Q?2ey9/6v96BOnBCuabz1CqnOTW5jx9Tb9FbM3j4d8TWMlSDDDF8HMty85wr3+?=
 =?us-ascii?Q?01H8hRT/lOYBkMOo6Fn76xP28zZHU3IE+m/pYvPPoKJDXuNLax16MgDxsjeN?=
 =?us-ascii?Q?De5LR55ioLcj8W8/NXSMFjTExOg9LsVDS2V5Wpg03NK3m+QiPcvvdBsMQRGq?=
 =?us-ascii?Q?iMNLtJJNEv/VaEjrQiVFkS+cT0VHvDd5Z/DRVkaByya7MBsCm56tyUgkfsfA?=
 =?us-ascii?Q?RbiWq3sKJXqCmrVE1Oaibr8Zg26ru5wFDAtQkui35ToV1dkMtER5vbDJA+HB?=
 =?us-ascii?Q?nufg+0PKX9dc6ckBjJZNmkk1V1bZY/0QnpT4cF/CO3oBtEIchxP8NZ57sB5e?=
 =?us-ascii?Q?35mLM0CXkV68t003xibv8BAiAIByIm9kVBf2mrTJGJiHnBzlVrk/TIXtQIty?=
 =?us-ascii?Q?uOfx/5wMh5I50r/x2lf5YEUUO8xuZyFWVZFB/hXlQ58Vvw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Xe3lxNyQNqGo+pLyT6c5mGi3lj5P7o1HAy4avczLgMTqViIBV0saHd6ggHtd?=
 =?us-ascii?Q?QL2aqONVndChf6G6Jd0e0ncO0MYE3rzvgd+HZocmMRKLONExdUzszidXe1Y+?=
 =?us-ascii?Q?Nrygy/dhHIHndhx6VwiADSbce3BU1PpUzcDjXuDoMjEHHjLeDuLn0Eybdg3k?=
 =?us-ascii?Q?ZkwLceEDwWx0tcXci7xQF+NgigKNQn9DiguWwQQhkNNXHjqN14uB4Cu5bUJg?=
 =?us-ascii?Q?Z3YSYoOhR+yhyRrNJCF8n5nHAE8nKApyOp5wt7otSficyGp8wi8IwVURnX3M?=
 =?us-ascii?Q?H4BxjzLg4IU+8OV8y3PMh9ZapRRE6pqzPHRQFk0jLgwG93Myfz2JzTcWYj3w?=
 =?us-ascii?Q?SJiXbNUbnq6VZTsC1xNm/q7oOwaWGXrD9f0nyhywdpQBUwMO8ye8LnTJJy9H?=
 =?us-ascii?Q?bM2v0A87B1IfrQqSLZw1ooXpabIRQlfarB29cVqChiE8rZcc5sy2fCb7T5SA?=
 =?us-ascii?Q?V7W2Nu/XFUuApOckYBU4+06MZ7Il85lkMbcItmCLrF+detfaBq7aEX8zAdqf?=
 =?us-ascii?Q?ba56AFRbp8tI8EAcWv7SWYhmJXhV9zqK9dVPPz5zrtd5j9lQ2EZG+SakiRlj?=
 =?us-ascii?Q?ToxLeF3TettCWghCrHz6Tp63NZICiBbREEBQMFpwf4sfM3hU1oXltbxhbDKe?=
 =?us-ascii?Q?sIyFWWuzhlp+JnXH8wMJ8EsOh+544tXGmNTP83dB7++sibQmxW/9zJNnw2XG?=
 =?us-ascii?Q?axkxYTaiHWiW9u9MtRKmAqrDSFexm8Bpl1vKcm9NbXbNkm2KIuTG4pqg5ovH?=
 =?us-ascii?Q?g0FfL1zejWu3psVoVn5O68jeMjW5EOcbPapAT4JTO3VW781l9wtx0KqJX4t6?=
 =?us-ascii?Q?RJV0YmUBmIt/lJyxHPKa7jRfIX0xIN1T0prtudOfHzxRmyaJm/qj9U1SP5M2?=
 =?us-ascii?Q?rCUYWiRgZJ2/ZLquS7Kb3VjEqWDUW89QQEPSjTM6KgOMiSi2pJlb8sEnAxlA?=
 =?us-ascii?Q?t5OQJSaI4jNYE64uWluWOc6Te3yQMXq9DyavnHaAR50xiWATylw8sD+abyla?=
 =?us-ascii?Q?165aA1yZf+v3HaeknyUxvQqOa4qWm/f+aCsbQrjx06JRGHQTW7eJRgleKSC1?=
 =?us-ascii?Q?gq2rnKOPqTimtuDE0WFxCJ5HczScf88XnH6cMecX0AOr2yTs8nlqdTvNsFUC?=
 =?us-ascii?Q?hnm7FKuT4qsIvGgnqP7uCPsFaIP4O1hGEwLy59I1uIA8gyU6g9pggFR+2x0I?=
 =?us-ascii?Q?ebiNZ6BhTVwVYfKYTFtYPqnF1nrF8C9hgeNMb8IWmy2Xl5Ug5umvo83Cidca?=
 =?us-ascii?Q?42iXcJV6SQbvt7WDyPGiGOuwMfEFUVJOplTrAzXGQuXnaBHmYdGqPWSkEubT?=
 =?us-ascii?Q?QBJl0Hn2Fw+UBU8XUc+MlxdXMMSUPsGhRt3baDUHjtdLm65sTIp/OE4j1oYe?=
 =?us-ascii?Q?l2grTXH7iUBIhHNjanDjVqk44JoEwqDqnIyouzFJxFxW1yecs5FoyNXSutZE?=
 =?us-ascii?Q?Cm1MecbXs4fzgisMM6f6eRCkA5F4EBsiT7u8GDNFe+OLMIDd0Z2fOjrHHEhs?=
 =?us-ascii?Q?9bbOjfjutFtzEbOFBFCjl4XsWz7wpSqLrGzIDze+l4dOQEiyWMqVw4V0rboI?=
 =?us-ascii?Q?8IQf6OygSHjBplbyFCU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB5PR02MB1021325F091D3D54A8F2FF356EFEC2DB5PR02MB10213eu_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a204794d-7c94-4536-ed51-08dc74f5f2a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 15:44:46.5959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQSB9Uc71/3OvySQxQc/2aRPEGVmVj72A+h9wFe07/Y9cKWnkzx2dNeLkhDv+47m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10200
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 May 2024 15:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110405

--_000_DB5PR02MB1021325F091D3D54A8F2FF356EFEC2DB5PR02MB10213eu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If libmalcontent-ui links with libmalcontent, then the malcontent-ui recipe=
 should have a DEPENDS on malcontent, and you should not need to add an exp=
licit RDEPENDS:${PN} for it (just as Martin wrote).

The reason I guess that you get that error is because I believe the malcont=
ent-ui recipe has actually built libmalcontent itself (given that both reci=
pes use the same source code) rather than using the one produced by the mal=
content recipe (which malcontent-ui doesn't depend on...) Would it be an op=
tion to just have one recipe that builds both libraries and then packages t=
hem in different packages?

Also (since I now looked at the recipes), I would strongly recommend not to=
 do:

FILES:${PN} =3D "${bindir} ${libdir} ${datadir}"

as you do in the malcontent-ui recipe, or:

FILES:${PN} +=3D "${libdir} ${datadir}"

as you do in the malcontent recipe. Resetting FILES:${PN} (as in the first =
case) is always a source of problems and can easily lead to incorrect packa=
ging of files. And for ${libdir} and ${datadir}, be more specific with what=
 paths you are actually adding.

//Peter

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Markus Volk
Sent: den 13 maj 2024 23:04
To: Martin Jansa <martin.jansa@gmail.com>
Cc: f_l_k@t-online.de; openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to RDE=
PENDS

On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin Jansa <martin.jansa@gm=
ail.com<mailto:martin.jansa@gmail.com>> wrote:

If libmalcontent-ui-1.so.1 links with libmalcontent-0.so.0 then this should=
 be build-time DEPENDS (and then shlibs code in do_package will automatical=
ly add malcontent to RDEPENDS.

This error is caused by adding malcontent to the DEPENDS field in PACKAGECO=
NFIG like I did in gnome-control-center. After enabling this  in my build t=
he error occurred.
But in the end this RDPEND is not wrong I guess? I've split the package in =
two and without this RDEPEND it would be possible to install libmalcontent-=
ui without libmalcontent which would then be broken

--_000_DB5PR02MB1021325F091D3D54A8F2FF356EFEC2DB5PR02MB10213eu_
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
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-ligatures:none;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">If
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent-ui</span><span lang=3D"EN-US" style=
=3D"color:#943634;mso-fareast-language:EN-US"> links with
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US">, then the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe should have a
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">DEPENDS</span><span lang=3D"EN-US" style=3D"color:=
#943634;mso-fareast-language:EN-US"> on
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US">, and you should not need to add an =
explicit
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">RDEPENDS:${PN}</span><span lang=3D"EN-US" style=3D=
"color:#943634;mso-fareast-language:EN-US"> for it (just as Martin wrote).
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">The reason I guess that you get that error is because I=
 believe the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe has actually built
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">libmalcontent</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> itself (given that both recipes =
use the same source code) rather than using
 the one produced by the </span><span lang=3D"EN-US" style=3D"font-family:C=
onsolas;color:#943634;mso-fareast-language:EN-US">malcontent</span><span la=
ng=3D"EN-US" style=3D"color:#943634;mso-fareast-language:EN-US"> recipe (wh=
ich
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> doesn&#8217;t depend on&#8230;) =
Would it be an option to just have one recipe that builds
 both libraries and then packages them in different packages?<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">Also (since I now looked at the recipes), I would stron=
gly recommend not to do:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:#943634;mso-fareast-language:EN-US">FILES:${PN} =3D &quot;${bindir} ${=
libdir} ${datadir}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">as you do in the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent-ui</span><span lang=3D"EN-US" style=3D"=
color:#943634;mso-fareast-language:EN-US"> recipe, or:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:#943634;mso-fareast-language:EN-US">FILES:${PN} +=3D &quot;${libdir} $=
{datadir}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">as you do in the
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">malcontent</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US"> recipe. Resetting FILES:${PN} (as i=
n the first case) is always a source of
 problems and can easily lead to incorrect packaging of files. And for </sp=
an><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso-far=
east-language:EN-US">${libdir}</span><span lang=3D"EN-US" style=3D"color:#9=
43634;mso-fareast-language:EN-US"> and
</span><span lang=3D"EN-US" style=3D"font-family:Consolas;color:#943634;mso=
-fareast-language:EN-US">${datadir}</span><span lang=3D"EN-US" style=3D"col=
or:#943634;mso-fareast-language:EN-US">, be more specific with what paths y=
ou are actually adding.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openembedded-devel@lists.openembedded.org &lt;openembedded-deve=
l@lists.openembedded.org&gt;
<b>On Behalf Of </b>Markus Volk<br>
<b>Sent:</b> den 13 maj 2024 23:04<br>
<b>To:</b> Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
<b>Cc:</b> f_l_k@t-online.de; openembedded-devel@lists.openembedded.org<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent=
 to RDEPENDS<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"geary-body">
<p class=3D"MsoNormal">On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin=
 Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com=
</a>&gt; wrote:<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">If libmalcontent-ui-1.so.1 links with libmalcontent-=
0.so.0 then this should be build-time DEPENDS (and then shlibs code in do_p=
ackage will automatically add malcontent to RDEPENDS.<o:p></o:p></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">This error is caused by adding malcontent to the DEP=
ENDS field in PACKAGECONFIG like I did in gnome-control-center. After enabl=
ing this &nbsp;in my build the error occurred.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">But in the end this RDPEND is not wrong I guess? I'v=
e split the package in two and without this RDEPEND it would be possible to=
 install libmalcontent-ui without libmalcontent which would then be broken =
&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB5PR02MB1021325F091D3D54A8F2FF356EFEC2DB5PR02MB10213eu_--

