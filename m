Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D311C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:22:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.100])
 by mx.groups.io with SMTP id smtpd.web10.55136.1711380127775804265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 08:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=NhSEzLwh;
 spf=pass (domain: nedap.com, ip: 40.107.8.100, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Amq5K3OT5wHoNfB4kUxeyZNvklFFfSajCHUPVtLqeA7/9rSgkz3KnW50p3RlOhozRo+bSCgvC89E7JGrl1Hm5Hh71CaG8YSErNLDbxziCDrhI7EBYPryBkeAWyxdV4UhCeA+4xG2Sf5GiDYoxKQXwuQ5o7TMXHvVYpXRh2qkFnW9rLzAxwkXDwNnH31KYPEnFn5Xbk9zmfTCvKyrNnmRiXuZ1wqTX+UcPRkvoSl8/Af1bSS3LHDtHoUN9RHR7zPIekggo4/Q22RVLW2cl42168JSPTUbfroweJg5Lhigd2IEEdNNKsmvBcIgGlE8pFv5oLiraI1/Q2lmOe/XDTNLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQuFHH8bT5KNauRSfT4Be7V9fJXDL3Vgac+4UIFHxKY=;
 b=i9kMTClbgvnV/vzgjRFJiE350yRIVYbKH2QQexBRlftAEsaaUPxf2iiRwgmD1rjBKb5Ws58QMOutDRv9S0fygSpzuQgOu/l6eIvTkhkMAS2rcCP+mCIMFDYmUaX7gdpLjLw279BXXz/UtDQdVwZsgs1LILNJe0Izl52cAtAFqoKWMv+toJ6nQoDGEP/M3sV5bIgq/bEKXOkM5fu3GlY0D59IXDMusftcfL3HwxFITIzpqAtRo55uVDsNCEpN+Sk59so9GxOFJKEaGIPGDfJoGxH2mtfV722JmlaaIrZzVX9nocv5F+GboK2/VY5AHi5+JVaZ3GexGeYM+gO0uGkUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQuFHH8bT5KNauRSfT4Be7V9fJXDL3Vgac+4UIFHxKY=;
 b=NhSEzLwhS2JN3FubSjbiAPKxGfUFt8ATiCGPaoupj64wGzTHju+D1k/j5CljfVfFN7q7xeellU+HZo7WMFRR4mCUm+EYbxb1Lh5+905iAO7SlRu7bfvigwuvyCK7D86Es5mReXlGL78jjQHwbUC7YwpsdgnK0Wj6lISpc9h5HiQ=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AS2PR10MB7761.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:644::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 15:22:04 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fcf4:a83d:66b1:796a%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:22:03 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Tim Orling <ticotimo@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-java][PATCH 2/7] icedtea: Update URL for source
 downloads
Thread-Topic: [oe] [meta-java][PATCH 2/7] icedtea: Update URL for source
 downloads
Thread-Index: AQHafrhrjW5MdEekN0uU55gdHdvRyLFIjHaAgAAFbjA=
Date: Mon, 25 Mar 2024 15:22:03 +0000
Message-ID: 
 <VI1PR10MB318284DFD0ECDE612997D104F7362@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
 <20240325132603.2477-2-jermain.horsman@nedap.com>
 <CANx9H-DS7wfF2U5DrfTOM+GrxsufdW2J+VgHioUer03bbho=Uw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-DS7wfF2U5DrfTOM+GrxsufdW2J+VgHioUer03bbho=Uw@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AS2PR10MB7761:EE_
x-ms-office365-filtering-correlation-id: dd265f9a-0341-43f1-c4a2-08dc4cdf5319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iYgRxYjMoPqwF3+cMDcWKb0FS5Pptwb0jM14+9zP3g0sVetlUNN8qqyWhIH83HQirqeRQwJ9Z+ccm7doMgn2WJl7IcEvEqnDM7KpwWlMAWVlFGTcbb6gD3mxZJERTmABfIHkuyS1/v55V2d2dBlf/dfyo0dRQdQmOfZQ5CYcnAB5LL/sjwZrAA/XlgkVymrnfiIod1lETi9/G44kI0s7Ec+dW19IfLBUH2ShJdiPCiuSMLndEAYqaT5lcvA4qsIPE5ELN6TsLLC/SmCAX7AT6o5h2wbvjVfta2mQg12YEKxyTUMx+XUk6q/W9nRTc0FvL07eW71NoylV40fbJ61yM2fdtYjmq8gGStHXdcb9+NZ/RApvS1jgMHfnNexDLXmlLsaK9dSLFhBa02ZBKQMmOG2W39XlOXhBD3tpt4LCFL2EBkX/AyW3dvAXHRPUAs6fM0jYjRGbP26L2xNy5nsl3Z46+hA/ESt3EH22I8bZMz8cxYdRJfoQHmtkj8t/8nzOLpsbgcH1c/jSAr4D7EUVggvPmWZvem5WnMzN0LNp7GDtQ6peJQ5l7/YmpPcaBCUCCHheXO07v4tILRSN4xR5nvwLJ6UT7rdwCcai6iO6U+FvnAZ3AWpywEKzPo0VGgeJNgGiNQmHyDUlV76EiggbMHvgD/h1Hk2a/fVG6hsD93M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dU1QMlVNQVJVUGNHeWFRQzVVRW5rc3dyMjJaaTNvdEsyWmRyOEd0VHlVaXg0?=
 =?utf-8?B?ajRHNWc4aWpyLzdLd0NQNnRMWEYrYUI3Y1pGTXlvb0NVOVZHaEcrcEF4eDAr?=
 =?utf-8?B?ZEpTeU51SzRJa01wdDBqZERmUWUyZ05QQThmU2NqQk0waStFRFFQTEhSYWFu?=
 =?utf-8?B?azRxMlFzOElkc0Z1ZzBRakhmdDVNdDFrcU9OVE1GSzAxL0FORUpSd1VpRjFX?=
 =?utf-8?B?cHcyYitYRExZUFNtYzd3KzhuYzNuWDdLdVRrQWFNNllvNWFMRjlpOEZzNDZp?=
 =?utf-8?B?bTQvek5UQkwvcE42UjdvbHVuT0VGZmVsdTB6UXNSekw2TUd1MzVITHg0TWlR?=
 =?utf-8?B?YlFabFBKNklPT29LRDhUSHcwYnlBbTA1VXo2MkdKRkkzUkFFeGwxSnluaktS?=
 =?utf-8?B?S3FPVzJzei84Q0loMzREOEo5QmlhN3M2eE1YaVFyZURlS1l6TEIyYS9Tb0ha?=
 =?utf-8?B?YzQ1WXd4ZTgyRTl0dGhmcWp5eHJDaDBTVGg4OWxsNSsyWEljd3JyejdwejZT?=
 =?utf-8?B?ZExxMitwZS90UGxIZVNqRStQRnQxVG81ZjFUTGFuanF2ckIxajZWTmxhczQ0?=
 =?utf-8?B?Tmk0S0tXdWFvaDV0V1Bhc3lxeTNxNm8zbnlmaEFiWkhDUnBaOWVjdmt3a0VZ?=
 =?utf-8?B?a2NuZnpkb241OTl1b0I0QWQ0a21RVk9LK3orWEhWeWZua2hQT3RLUzJRRTRq?=
 =?utf-8?B?anNRKy8yMUZhbTBidmQxekJUSWNac3p1WFhJTkZGa3ZWaWRQc0d0YzE0MDNW?=
 =?utf-8?B?N1VML0lUTU5sYStIWTRNYXBHSEM0bllwWFNUdDh2dkMvaitFK3ZqYk0yWUwv?=
 =?utf-8?B?bllDTnhwb0lrNzIvMUtDWTNOdWpBajRHYUdyamRuUDFnWlY4RDI2RGJFUzl6?=
 =?utf-8?B?RmlHbzJrTTMzYk52eVhSbXc5N2xiYS9lK0R5VDMwaTE0eDJqNy93aTVHWUxy?=
 =?utf-8?B?Z1lKSmtlTUZSUjhDLzZXR3dnenI2TDRTRFo0QVcreTh5bkpmdDZmN3BvV3Zh?=
 =?utf-8?B?VkJBd2d1eDNsNm1FWEkxMlplNUJET3hTZysvallnTHdJbEx2SXI0d013dWJW?=
 =?utf-8?B?eS9IOVo3bmF5Q0ZiSnRtT3FrZnBaNklGWDhERlQwUGdwRklUV2tPay85WmdI?=
 =?utf-8?B?Rmh1YmpzZVBMaUw4ZzR4c3VtUE0vTENoNnE5WUZKSXVuR3pSSkVQK09RQThV?=
 =?utf-8?B?NVI1eDVVekhMMThYRW1sbFMrME1xV3VrMSthcVowb1Y1cFVnUHNVdTN4ODhQ?=
 =?utf-8?B?N3lPQ2dTRFoxOU1zN3V0a3kxVUN5Q0FQbXZYMGxDSmRkSUVLRnB3cUJZTnBX?=
 =?utf-8?B?YnZEOTAyWm1vWnJnRmhJTkpvbFkrS0hBcE1vLzdCV1JINjIzTXFLY2MwbmhT?=
 =?utf-8?B?TDIrYmEzVUhzSmJ6c2lNMStYT1RJWmk3UEh2R1JYV2JMNkdXNkFQcVIyZ2Y0?=
 =?utf-8?B?anhiaGNzS2J3UnV6OWRnL0hHeGg1N0lpNE9NSy9pa2p0aVphMUcyQ0JTRFZn?=
 =?utf-8?B?STMzRVd0MWdiRkR3c1ZMWlRUNWpVQW44WmU5bGMydXE1SStkSlExNzBNQ2pS?=
 =?utf-8?B?OVFSV3M1U1gzUy9tUzZxbG9UR0s2dE5oOUdCYTJBS1JtN0p1SWZzYWxONEw2?=
 =?utf-8?B?YzFFalpRK1M1dHFtRndlN2tKUnE1Z09QVmRNb3I3VFU5SEN4eWJpRVFyNTBi?=
 =?utf-8?B?dHR4YUx0T251TC9TUHZjTXdOc1dhdXhWVTVzN3FvV0lNZ0JwcUludWEzNkYv?=
 =?utf-8?B?NlZHdXhxN1hWTjRsSVZyeUF5ZXhDemNYc2NnYUtpQ3NVTDM3bVRjQkdDbWRN?=
 =?utf-8?B?VzV6VVE3ZmhXUTY4UUY4dUFwWVJjSEE0Z25hYlJWNVZHZ3FvQnQrMnFRWWlY?=
 =?utf-8?B?WnNkbm1Ya2xiaDBIVDR1N055dlZQRFNIL2k4MzUxYmYrMlR6THpHbE1Pelgv?=
 =?utf-8?B?Umo5eHB2SkNaTzZ5M05TQXVCTXRrSitmbjVJRjU0cVpLeHA2TUJZdWFNN0VX?=
 =?utf-8?B?UzdEcVlTMnIzUllHZ29tWUNNVHd0cmh2RjhsY1JKaEpXYSsyM3k2aGNDeGsx?=
 =?utf-8?B?WTVBaXZDaFNGS2MxUlNKRDkrTjcyRUY2SVR2MlBxNUZnU3JudDNOV1JoWWxG?=
 =?utf-8?Q?tMShTvszWaAMMy9lMTYoSnHeW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd265f9a-0341-43f1-c4a2-08dc4cdf5319
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 15:22:03.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6eyfBAKrv0AAg8bfKkgZbK/kftEYNmTWHCAMwMMtJAv8O44tM04gA9VSt4ylAgwlWVnuoXxe8fJBQK1iW0tKFYIRo133kKJODle5hWphGAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7761
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 15:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109590

PiA+IFRoZSBvbGQgaHR0cDovL2ljZWR0ZWEuY2xhc3NwYXRoLm9yZyBVUkwgZG9lcyBub3Qgd29y
ayBhbnltb3JlLA0KPiA+IHVwZGF0ZSB0aGlzIHRvIHRoZSBodHRwOi8vaWNlZHRlYS53aWxkZWJl
ZXN0Lm9yZyBVUkwgdXNlZCBmb3Igb3RoZXINCj4gPiBkb3dubG9hZCBzb3VyY2VzLg0KPiANCj4g
aHR0cDovL2ljZWR0ZWEud2lsZGViZWVzdC5vcmcgaGFzIHNvbWUgb2xkZXIgc291cmNlcywgYnV0
IG5vdCB0aGUgbmV3ZXN0Lg0KPiANCj4gaHR0cHM6Ly9pY2VkdGVhLmNsYXNzcGF0aC5vcmcvZG93
bmxvYWQvc291cmNlLyBoYXMgc29tZSBuZXdlciBzb3VyY2VzLCBidXQgcGVyaGFwcyB0aGUNCj4g
cGF0aCBoYXMgY2hhbmdlZD8NCg0KWW91IGFyZSBjb3JyZWN0LCBpdCBzZWVtcyB0aGUgZG93bmxv
YWRzIGFyZSBzdGlsbCB1cGRhdGVkIChvciBhdCBsZWFzdCBtb3JlIHVwLXRvLWRhdGUpDQpvbiBp
Y2VkdGVhLmNsYXNzcGF0aC5vcmcsIG1heWJlIEkgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIHNwZWNp
ZmljIGluIHRoZSBwYXRjaCBpbiBzYXlpbmcNCnRoZSBzb3VyY2VzLCBhdCBpY2VkdGVhLndpbGRl
YmVlc3Qub3JnL2hnLyBzcGVjaWZpY2FsbHksIGFyZSBubyBsb25nZXIgYXZhaWxhYmxlLg0KDQpT
aW5jZXJlbHksDQoNCkplcm1haW4gSG9yc21hbg0K

