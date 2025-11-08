Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE468CCFA1A
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 07:17:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1381.1762586234462079015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 23:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=BgvVr/gr;
 spf=pass (domain: axis.com, ip: 52.101.65.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv15Ys54MzVDIpL7KreoVwXrkhZ+H7C8PSQUl8kP565pXBwh57hUkoFxxxaiD4HOx2T2TzvvK+cinA7BTFxJW3x3J0/aHtQstPMaKi5EQEg2+ALp2YLrTGppu2mp73e7/THkOqI/xsTukVL0dCGSpl+VHTWfcu7/jYb6UMUi4wkJ4xhF8D1IC7M1Yi5ocWpIip/+ouCneqd/67gmq6zxRyahSWaPTcRMz7nGd1k2QaKooySxh0mhkUbhYTtvkXHF1PJshIEVw2ZuKW5yFa16wIo9r0vSjN320iKaP9HdKTvdTE/XNN2MQkkKrxnLpMRmlziNPUnQJk08CJsiXwRG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2mQ6j8+Ptlq4CTfwe9HgneO7fvArSNv21EmTQs7yv8=;
 b=I1004HgAOKdtHl4Ag4qYOQWkr7QU3zmMZ99VIOmxeDgZ9OuB++FKLF6ZDn6V8fILyPBKfEVZ3kB7r8yPVLi4DizlMoeG0ytfkbz//fUCnYb253xad5LZ8b4i1c9vg7M3D1TDPnIVID4xYZzz6QP2yEbDtgx7J7bd9jRIE5tVBNyvX08u9CFCNAltP2aNtACafWs2KRzM83N+E45I/GrdgUqE3UXuCEzuR4HXToLJBXw7rHhfz2Vt+tjqO22a3deNkh5GDIGe2p9lNM9VQ4/kUTMnWkFSS+owCXLsKjoGORxt358FlAtCxKWvx/cXlIaHSZGeVfH9YzQxmZEMckmm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2mQ6j8+Ptlq4CTfwe9HgneO7fvArSNv21EmTQs7yv8=;
 b=BgvVr/gryzClwVgzlEr4ekxM2kZcqlFjkUM3DTIfBPzxUPla5qdH6fcTbISwKXVdIY5oKVK3gmXJJRmTzQaSBfZrYNO4oZbzjDD0YPJNmD2ni+tE+ztw8E8f1iDjPy2kHMg7KSQddL1Ho6f/Z3yGf2R3V+zofiLhFyYm2jMJWzA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9292.eurprd02.prod.outlook.com (2603:10a6:20b:5fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sat, 8 Nov
 2025 07:17:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 07:17:09 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Wen Yang <wenyang.linux@foxmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH v2] nethogs: add recipe
Thread-Topic: [oe] [meta-oe][PATCH v2] nethogs: add recipe
Thread-Index: AQHcUFH6+TxTTwbCG0epHWDSFeurp7ToClzggABJJoCAAAnKUA==
Date: Sat, 8 Nov 2025 07:17:09 +0000
Message-ID: 
 <DB5PR02MB10213CBDC499AA8D11B177E54EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <tencent_27FD029FC5AAAEA8AB837C276FD225996D09@qq.com>
 <DB5PR02MB102135E5DE3FAB1543D477544EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <tencent_F5643F9CE792AA336AF520A9C9D774466607@qq.com>
In-Reply-To: <tencent_F5643F9CE792AA336AF520A9C9D774466607@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9292:EE_
x-ms-office365-filtering-correlation-id: 32e9ab12-c2c6-41e9-8162-08de1e96d497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OFRubGxRb0dpcDZvRDVWSzBkaDN4VzVERktKaTNsMEFOZ2dZOXZkWEJlVDVU?=
 =?utf-8?B?ZlpLaFBOR1Z0Rk5UMW0vaGJWUmpRMUF2OTZlcWlzZ0JnMGpKcG92aUNPSVlq?=
 =?utf-8?B?RUxjeFBlN2xqU3Z1eXhrVjIya2tMUGx0L0toWVlvd2NoWmw1M2wrWEtGU2Vi?=
 =?utf-8?B?OXpQRWdvd0FJN0lFZnFQcUdQQmJJZVkxZDB0NXVtU29xT2xtY29oZ2J6L2lx?=
 =?utf-8?B?Z0FncFA5VTUzVEx5THd0QklHb3p1c1kvREVkNjcrc3JZNWNjQzFJMndjOEN0?=
 =?utf-8?B?a0pWWWNqY1hrRlJsVEp6ZXpYeXRIbFpLUWgwN3llRnE1ajBySEE0T05aMHpB?=
 =?utf-8?B?TFpDeUVmQU1NU0pCRUxob0ZNaXMyaUFkVWZaeXg2K1A2bExPcnQ1UUNTWTls?=
 =?utf-8?B?Q1NGTEY5VFBqSmpZYnhYMVRiWGNjUGZoZ3pIRjdHSGVNOHg1WVJDWlc2T0Ew?=
 =?utf-8?B?UjBaOGFPVUcwOUE0VUJMK2hsNHNBUWdLZ1NIcFRhOWFqcmVpWHVkei84cFZV?=
 =?utf-8?B?bW81MFlxb1k3SHdxZFZHTERRL3NTcVBWdjA5NmN6aytRc2UxU3ZJZ0QxbkRr?=
 =?utf-8?B?a05RK1FGQ1YvQ2xEbHVQVGxkcjhkQ0tQRjMzQllLMDdQRlJFODRsUVp4NTJs?=
 =?utf-8?B?YTkyVGc1VjA0ejVHdWloOFBZbkVQRGsrM0ZKUGxVdncrYVdsa29CYm9DaTlU?=
 =?utf-8?B?SzRneFk4Q3hEU0d3ck9Na2YwUCsyRVJJdVI4WUxQakV6QnV4K2ZrN0FOaEdU?=
 =?utf-8?B?MEFmKzRrd096N2FPZnl2STBiOTk2R0ZOTDhpRVh5bkxOM0NJUlI3dGVUWUhX?=
 =?utf-8?B?bUZPZXZVeGEyOVM3MDJoRkViNVpZZG5EZzRYZ2JCVW1hOW5nQVV1d2I3S2tS?=
 =?utf-8?B?bzJDVlYybWdCNDZXdWhYQVJuM0dZcGhvRjVHQWlmYW16VktiOUoxR212elJi?=
 =?utf-8?B?ajloVDV3UEJMR2dUU24rN3A4d1hSUHN2c0paR2dSL0lwRHAvU1JoaGZrU054?=
 =?utf-8?B?TzQxbkx6Yktodk9xNE9qRExBL215TlEzNThPdmZwcktFRWpzTDM3aSswOUZI?=
 =?utf-8?B?UnI0QmZyM2pVczNZcC9HUzhmajVqS2ZiMTBCdVhHQmE1WlBJOGQzVXFvM1lS?=
 =?utf-8?B?N3FVbEtpalZ1bDFxNGRMbE10YVNVcGhKNzd6QS90UlNXcGNadEo3VHhkM1FY?=
 =?utf-8?B?cDdVVk9NR2Z6cUZLeTNqRURCcUVFQUt3bmdubEIrQXJnYjNTSVZzN2k5ZlBv?=
 =?utf-8?B?MFVHVmpGUjZpYzdMdGF1amtqYmFnM24xNzZCRW9sdXdMaG90dUpyb3ArWU84?=
 =?utf-8?B?eHJiM0xxZGFmMElDZzVxL1BrWGhNMDhIOXBrWEo5Nk1GdnRnMVNINnkyaEhr?=
 =?utf-8?B?dVg4NGlnb3I4SFJhOHZtSTdTNDZXMXdiNDFjNUpwTXd5bmFqNzgxUDliZFdr?=
 =?utf-8?B?aFM4YmxGZnVSRE1MV09wMnFvMFlvUjNOcjFsVk9VM1BiMUl3OS9ySitFTWVk?=
 =?utf-8?B?b3JhN3A0UDkrVmQ2K2xLcU54UHZiSVlnbW5yNnNRenNIVE9RTzFOd0pvT2NL?=
 =?utf-8?B?djJ5dFd1UVllOHh1TSs5WkRjN0tDZmlLUVJGSjdpY3U3VDBmK1VSbUJ4dHJh?=
 =?utf-8?B?TVc2MUpSV0VJc2V0WE5NakxRSjlXVTVTOVNJRHVPaUF1eklqWWlXVHcyaERE?=
 =?utf-8?B?QStRUFlobzl5OGhaUElpNVB4Zm1wQUJCcWhvKzdWL0NpVkZnajN1a29HRFRW?=
 =?utf-8?B?WjQwWm93d1RlVFo5VzMxdlAyd3dlcXd3ODViN0VUc1M0YVd5UEUrbXhsbEhW?=
 =?utf-8?B?c3ovblA1Zm5laVNkcHFtTEk0ZzdIVlB6cVJ1aXE1RkI2RysxcjNGb1o3UzM0?=
 =?utf-8?B?Nzh2M0RFaWVHdjRxSjQxZDd2MjhqU3hRQ3FqVG1HUjFGTXZJU0YrTjZYTTVu?=
 =?utf-8?B?MzVHZ01MVGJabWFaQy9Wd0dGelBibGczUEZiNlAwTWQ2cURHY3lHaW1YRlVU?=
 =?utf-8?B?b1kvV2F1TzlQTy9GamdMZVBOVy9HMnNrZEVrRzVoVTg4SlR0RjBrbVNMY2dD?=
 =?utf-8?Q?pJ64fz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VlZYbnB2WUdKT2tib0JEb2hRanZrTTQ0LzBkckhIYUtQUHY5R0JsbnFOUkoz?=
 =?utf-8?B?Wk5mazR2SGRwbUplRk9HcVRJVlhLVmNJUmtBR0tlS1ROM2J1cEk3cGV5QnZP?=
 =?utf-8?B?ZUp5ZS9GTHpKcFdtRDRpcUl1L2lqY1NubEx0OWNDLzNTdnRSWmlEM1N4VHZn?=
 =?utf-8?B?R2dWU1BLSFdobG5ZQ1laa0tzVWVqQkZ3aWp2alZGZGtOUE1OM0QwWXNoN0VO?=
 =?utf-8?B?YUM0SXgya0lyK3hMRjdsdGhZZ2J5Zm1sT2wrRUlsRDgva3hndzJHV3JmTUNZ?=
 =?utf-8?B?VW1id0luaXI5amtZS2JGbnFEckxiQ2owdzB4bEdsc0t6d05PbVpmNnFVZ1dG?=
 =?utf-8?B?dng0REg3L2ROeEs1U1o5c3A0ME1UaG54ZmRncjJYa2o1VTR1TjY1MkdTM0E1?=
 =?utf-8?B?aWRFNUhVM2ZIb3pWNTVFNTJ4YTNFTkJUVXdRclFEd1NyekRTQ043cjI0dHlF?=
 =?utf-8?B?aktXZlpndXZJb3hmQWxuTWhOUVNXeVhESG5XYTdYaUxyUk5sWVRuZHFRWHcr?=
 =?utf-8?B?NjhTWHN1N3RPdTFtMUlLMDRxdkRnaHFqTmx5TEF3SDhwbGQ0QTcwb2R0byt6?=
 =?utf-8?B?dzhyZ3Mrd1Nna05HWjJ3dkNsMW1KbXhFb2tId0tiRzQ0U3dtZ3l6U0kwMWhJ?=
 =?utf-8?B?VnJUVDk4U0tSU3E0dzdiNlhTa2VrQVRnSVNzelZlamFCNWFYbkhlallWQ3ha?=
 =?utf-8?B?dGpCczhmWlJqS1hmMWJHWFFoVVdVT0o2T2Q1ZEJST25tVkRTV3JSbTlOUHlM?=
 =?utf-8?B?N2IzNTZ1RXUxRFArODJQRnRhZG1DYW12VG5JT3VlWU5kdXhoVkNzcXJ4bXYy?=
 =?utf-8?B?dWF3NHByOU1mSlNCVFhKdmpJb0I0a2lhRktndVpWNEZGWEFRY0d3K3c0K1ln?=
 =?utf-8?B?QjZHQ3hVODdyV1NFRy9WSVp1RlJMT0Y3azhYcDVTVUJOMFAxQ0FZR3ZsQ0tm?=
 =?utf-8?B?ZUZ5SzA2bGc1TWEvR0VheGNCRnZGVEtjTnlwZzREaUIzb2dmbG41WUdqWlow?=
 =?utf-8?B?bGQzRnM4d3pmbkMrN0tGbXJUbisyOWVPK2IrdUVHbTMvcmhYNnlJSFpZeG43?=
 =?utf-8?B?T1dUdEIxbi9zYXdHbmlXZWVDNkhxZkl3eng3aTB5OGtjNUN0R3FManJpY0VL?=
 =?utf-8?B?QmxvMjQ5RHRVcG5EMXR1L0dxZkFuVDV2VWcxTUlnVlpTVmFzc2ZZcXJRRWs3?=
 =?utf-8?B?ZytZeW02azFSekZYRU11SlZzZUpTcXd0VkowMXQ1SGtZZGlBREdmMlhYMERj?=
 =?utf-8?B?a1pSUlhMejVKckhHVU1VaDBLVTlJRWFBRmRtY3AyeHd2ejA0TUlydDVrMlFs?=
 =?utf-8?B?ZTdlOHd2ZGpyMnpKaFJSOG5TVDFHQ3JwbGRtWDYrYml2c0t6dWJsTmk0OVIw?=
 =?utf-8?B?QWl0cmsyeDJ0MTBSTGI4TTUzR0lYWWQrOE90L0tqaDFoVHpuLzhEc0IwaS9H?=
 =?utf-8?B?UjZLZGRJN3hhLzVDQko4dTdycGozZWV4MWN2SiticVJTWUF4bWZ2MHI2eFJ2?=
 =?utf-8?B?YWhyNDd1aXVwa0NTTk1XNmQrVlBYV3V4TjU0SGNhMWZBMFRNQTVOYklrRlhs?=
 =?utf-8?B?K0R0ZStndkd6T1JDZ2I5Qno5MlBhdTJhd3J1YXNxYnEzVktKSGljcFduS0VN?=
 =?utf-8?B?QzlReEo3WHpWYVVSUWxaWWZwVnBLeDZMTXdnb0lMZHQyVWJRY2U2UUc3RGpY?=
 =?utf-8?B?NWdVQmI2VjhWTFhobS9IWmlFZDFaUlZWRWhrQnI3NkEwdlVObk1VM05PS2k4?=
 =?utf-8?B?UHFCTm00U1kvMCtrS3ZNaFVnaEtLVEZ0S0Y4VzI0QS9zZEJjcEtnVnJIRkR5?=
 =?utf-8?B?cFFMU1AwWExjaGFWWDMxZ2RaTWRKUU5OWlJwTStyeWg5MXgrY1lVQUZEZGFN?=
 =?utf-8?B?a1BNc1U1M1ozV2FFVzJxdnRTVGtKcDBGNmZYRGRGSVdCTDZ0UzZ6UE0yZ09s?=
 =?utf-8?B?TS9ROVBjNWJyVEhwT0xvWThLcU5oMXU5ZytOQjBXY1hCeW0zelliTDlSTGJL?=
 =?utf-8?B?bC9DN2haSEdaeDRXL3FNWnpLUDduUjBLUmJOOS8yR3VSWHdZZUpMNjg0RlNI?=
 =?utf-8?B?NWRhMTNwQXBmaHd2N2ZEOXlkLzliSXNDdUZPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e9ab12-c2c6-41e9-8162-08de1e96d497
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 07:17:09.3485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHJuU5JHa3jafYE1Uhr88ngAgIbHQl4TDDPUVszqP8PZKYcbTKnfN+RTQoOsatNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9292
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 07:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121379

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXZW4gWWFuZyA8d2VueWFuZy5s
aW51eEBmb3htYWlsLmNvbT4NCj4gU2VudDogZGVuIDggbm92ZW1iZXIgMjAyNSAwNzozNw0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIHYyXSBuZXRo
b2dzOiBhZGQgcmVjaXBlDQo+IA0KPiBPbiAxMS84LzI1IDEwOjI4LCBQZXRlciBLamVsbGVyc3Rl
ZHQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IG9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIHdlbnlhbmcubGludXggdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU2VudDogZGVuIDcgbm92ZW1iZXIgMjAyNSAx
ODowMg0KPiA+PiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsg
b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+DQo+ID4+IENjOiBXZW4gWWFuZyA8d2VueWFuZy5saW51eEBmb3htYWls
LmNvbT4NCj4gPj4gU3ViamVjdDogW29lXSBbbWV0YS1vZV1bUEFUQ0ggdjJdIG5ldGhvZ3M6IGFk
ZCByZWNpcGUNCj4gPj4NCj4gPj4gRnJvbTogV2VuIFlhbmcgPHdlbnlhbmcubGludXhAZm94bWFp
bC5jb20+DQo+ID4+DQo+ID4+IE5ldEhvZ3MgaXMgYSBzbWFsbCAnbmV0IHRvcCcgdG9vbC4gSW5z
dGVhZCBvZiBicmVha2luZyB0aGUgdHJhZmZpYw0KPiA+PiBkb3duIHBlciBwcm90b2NvbCBvciBw
ZXIgc3VibmV0LCBsaWtlIG1vc3QgdG9vbHMgZG8sIGl0IGdyb3Vwcw0KPiA+PiBiYW5kd2lkdGgg
YnkgcHJvY2Vzcy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogV2VuIFlhbmcgPHdlbnlhbmcu
bGludXhAZm94bWFpbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIC4uLi9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZXRob2dzL25ldGhvZ3NfZ2l0LmJiIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiA+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldGhvZ3MvbmV0aG9nc19naXQuYmIN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0
aG9ncy9uZXRob2dzX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0aG9n
cy9uZXRob2dzX2dpdC5iYg0KPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAw
MDAwMDAwMDAwLi4yOWFmMTQ5NjFjDQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXRob2dzL25ldGhvZ3NfZ2l0LmJiDQo+ID4NCj4g
PiBDaGFuZ2UgdGhlIHZlcnNpb24gdG8gIjAuOC44Ii4NCj4gPg0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIGNvbW1lbnQuDQo+IFdlIHdpbGwgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbiB0byBjaGFuZ2Ug
aXQgdG8gMC44LjguDQo+IFRoZXJlIGFyZSBhbHNvIDYgcGF0Y2hlcyB0aGF0IHdpbGwgYmUgYmFj
a3BvcnRlZCBiZWNhdXNlIDAuOC44IGhhcw0KPiBpc3N1ZXMgd2l0aCBtZXNvbi4NCj4gV2Ugd2ls
bCBzZW5kIHRoZSB2MyBwYXRjaCBzb29uLg0KDQpBIHNsaWdodCBtaXN1bmRlcnN0YW5kaW5nLiBJ
IGRpZCBub3QgbWVhbiB0aGF0IHlvdSBzaG91bGQgcmV2ZXJ0IHRoZSANClNSQ1JFViB0byBtYXRj
aCB0aGUgdjAuOC44IHRhZy4gSnVzdCB0aGF0IHlvdSBzaG91bGQgc2V0IFBWIHRvIA0KMC44Ljgr
Z2l0IHNpbmNlIHRoYXQgaXMgd2hhdCB0aGUgU1JDUkVWIGJlbG93IGlzIGJhc2VkIG9uLg0KDQo+
IA0KPiA+PiBAQCAtMCwwICsxLDE3IEBADQo+ID4+ICtTVU1NQVJZID0gIk5ldEhvZ3MgaXMgYSBz
bWFsbCAnbmV0IHRvcCcgdG9vbCB0aGF0IGNhbiBncm91cCBiYW5kd2lkdGggYnkgcHJvY2VzcyIN
Cj4gPj4gK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9yYWJvb2YvbmV0aG9ncyINCj4g
Pj4gK1NFQ1RJT04gPSAiY29uc29sZS9uZXR3b3JrIg0KPiA+PiArTElDRU5TRSA9ICJHUEwtMi4w
LW9ubHkiDQo+ID4+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0
ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyINCj4gPj4gKw0KPiA+PiArU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL3JhYm9vZi9uZXRob2dzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwcyINCj4gPj4gKw0KPiA+PiArREVQRU5EUyA9ICJuY3Vyc2VzIGxpYnBjYXAiDQo+ID4+ICsN
Cj4gPj4gK2luaGVyaXQgbWVzb24gcGtnY29uZmlnDQo+ID4+ICsNCj4gPg0KPiA+IEFkZDoNCj4g
Pg0KPiA+IFBWIC49ICIrZ2l0Ig0KPiA+DQo+ID4+ICtTUkNSRVYgPSAiMDhkYWY3NmQ4MTIzOTQz
MzkyYzg0YTA3MTA4YmVlYTNlMjNlYTM5YiINCj4gPj4gKw0KPiA+PiArRklMRVM6JHtQTn0gPSAi
JHtiaW5kaXJ9Ig0KPiA+PiArRklMRVM6JHtQTn0tZGV2ID0gIiR7aW5jbHVkZWRpcn0gJHtsaWJk
aXJ9L2xpYiouc28gJHtsaWJkaXJ9L2xpYiouc28qICR7bGliZGlyfS8qLmxhICR7bGliZGlyfS9w
a2djb25maWcvKi5wYyINCj4gPg0KPiA+IFJlbW92ZSB0aGUgdHdvIEZJTEVTIHZhcmlhYmxlcy4g
VGhlIGRlZmF1bHRzIHdvcmsganVzdCBmaW5lLg0KPiA+DQo+ID4+ICsNCj4gPj4gLS0NCj4gPj4g
Mi4yNS4xDQo+ID4NCj4gPiAvL1BldGVyDQoNCi8vUGV0ZXINCg0K

