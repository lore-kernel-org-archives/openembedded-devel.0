Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46330C77B7C
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 01:19:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.web11.1160.1750900794566127340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 18:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HKDVfT3g;
 spf=pass (domain: axis.com, ip: 52.101.84.4, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKA3agk/PR/h1REsUIBV4TLVuDFCRMw2PchoO/ZrY4y51lN90bPYvlXin3PMGa24SSJPNHbbc/SZTjPqGjzKy0TydHcAYDN8rhKmJtWu4PxFmkvsosq0aZ1NPdAt/BGNLYsA1PJMOrdK/p/YOCuGvT12Ra2AldGsqLEpFpnwD86Og8yWuRcG42/Ra5IrGgCzaP2W7E44zObBHggSp7ZlKrcYBhbRbF7ieUzc2dc43RFD27hhMxv6DPNZdfsU/XjOLerLs5/4xzRQAvtUJ6Le90sFV1G2Nu/EVq53jkFxHn0W8N3HIYN41KgwICUNgoJbuUCVGlz+y1u3DiZGNoQUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyWlyHlFm8Ou9dt+ThGKCCfqnVdCfcFgh5lf5UWlbjo=;
 b=ZksDhq3KV7j1ttewHWW9AqmkPgudz0PLdlFtBAuN2CxrpKGUZTzGPzNtb9FK3xmhUgQBoE5uzsdNo1+uo4yxz+IyG9keJQ2Z8ZP0uPpY5APCWP5hvk8swWXLq57JPiV1HT49r5LRWCGlPbv1+onnbtMbRzYrEWZi7PT5UtaGcBqrAietezEwaYN75ngQAdRCO68NleGv3RqSc7qsmAKTEb/eRu+E59Za5k/c/db218N7VpWqi+GqSNfDQG8Pg6kDro1clpW1b61OEF82RB1jH/k7Xn1lmqycAYLZhacwiGZOJotKm4nDQvH/OJXe1LVndQBUy2YQ7WJM0ux8WxKx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyWlyHlFm8Ou9dt+ThGKCCfqnVdCfcFgh5lf5UWlbjo=;
 b=HKDVfT3gzODRZfhuWI29/U4nFpMtns8BHpmXMatfIvImxYYWwjsDPeA5f2POxy/QRfZj87m88TKzGCEiOF0GH18thOH0qLGJ+X8C0DZI5fcNPfxuHQCUTTzjog9mAYWMw5A6S01+NI2KVLPktVUUj6mfPj0LwRi9vjOmt4ZiTiE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8359.eurprd02.prod.outlook.com (2603:10a6:20b:516::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 01:19:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 01:19:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "reatmon@ti.com" <reatmon@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
Thread-Index: AQHb5izrtojajikI7kSkgSYzJDaOC7QUo4pQ
Date: Thu, 26 Jun 2025 01:19:50 +0000
Message-ID: 
 <DB5PR02MB1021308634340DFD241895C3AEF7AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <184C6E7578662DE2.823@lists.openembedded.org>
 <cf6b6313-bae2-4a87-b2ca-c5f076507109@ti.com>
In-Reply-To: <cf6b6313-bae2-4a87-b2ca-c5f076507109@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8359:EE_
x-ms-office365-filtering-correlation-id: 6b04c790-c650-42d5-af83-08ddb44f8c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Zmo3SitsSnJ0TEhiWk1pY1dxaGVmaXczWGpqQS95YTEvSTFlaFNTWWdQRUNV?=
 =?utf-8?B?Y0xLM1NWMUt4WkpYNG5TMUprT3k1Z1VKV05rQlQwb3JHWTAwRUtyemxnMWJ4?=
 =?utf-8?B?Tjd6OHowRTdTM2tUbU84SjZHYUk4Y29OS0hhU2JqVHZoMlRKa1VsMVg5WkJj?=
 =?utf-8?B?cEJXa1BBZ1Fpa0Z5YWlVbjQwWXlPZ3ROSDh1M1cxZDc2YitoZjVQeWdhZlYv?=
 =?utf-8?B?YkFyUzZpQXBVUzdHaXVLMjk1cHErOEVOV0NvWVVZZVFlLzZJZUlkYzhmVU55?=
 =?utf-8?B?T3A4YWpDTUgwcHBHQ3A1eUZHQTA4ZHhYTW1JVVE5TmkyWXBXNGlNblAvUFow?=
 =?utf-8?B?aVBuOVgvaW42Mm9GNndQT1V0MURySUFKUm1SMFFCaUJSa3M5SVdTUnFqcTg5?=
 =?utf-8?B?R3Y1eDBZMGVZQXVhN3lVUWo2cHlRMkFkaktqZ3hudEo1bTlIM2FqRE9rMldL?=
 =?utf-8?B?TUF4NGI0SzE2M25UdjJ0OEd5NW0zVkI1RlpXTk1uVmV6Z2swd1haMTdlaVl1?=
 =?utf-8?B?UEs4MFpTcGhQSWV1a1BwN2tEVThWS2RUOGlXVHRWUVpCRUs4OWFjWlA4Smwx?=
 =?utf-8?B?dHlWdkFvMXRva0Y0aEY4K29pYlhoZTY5R0xkbVg0Q1RySjBza2U0QmJzRDRM?=
 =?utf-8?B?b3Z5bG1wR0ZqYitYeDhtTjRKWXlEc3VnUWlDN3FjMjZtWjN5c1FrRTFKQ1pw?=
 =?utf-8?B?cGJ3RHZmV01VOXJLb1lrKzg3V0doN2VZcUQ3REV6b3VpMXdrZ21jSTlRalMx?=
 =?utf-8?B?dENOMGwybkM2NjkweUpBcFdaUmJZZlpQRVJyQlhVY202OWdNWmRRdGFjWitk?=
 =?utf-8?B?VHplL2d2c1VXUHUzTEdlenpLZVNTVEhFbVpYM2ExTHBGSzM3SWRlejk1Zlhx?=
 =?utf-8?B?VVNSN09KQzFWKzZBMzRESU50NGpuR0U1RGRjb3lwUjJGa3hKL2xzVThZd2Z5?=
 =?utf-8?B?Y0J2NXhWaXJzZmllVDZURzlXd1BxWUdoZlBMNEI4YnVmVnhUbDZES1NYNEcv?=
 =?utf-8?B?WXg0T3QxaFNoZjZWSS9RRU9Oa1pIa0toVmpxYWdmdG11S0ZHaERjUmVZTVA3?=
 =?utf-8?B?QkNkbUpTSmw0bGM4eVpDTjQ2T2JuZFB1N0dndStEdDNYMHhpV3J2TXpkM1F1?=
 =?utf-8?B?YVBHMzdHWHVjbytiTVdLWTMzMU9VRitMSW5KdW9BNlk1YmNHV0dMcm16RG1m?=
 =?utf-8?B?RnA1NEtmekxwRFNiMTlGN29IQkpDU0NWWGRURXJoUGtRQSszZnJEakhzelQ4?=
 =?utf-8?B?MUQyeDN5SDdnN2NPWm1jWDZrcmxJM0NLRmVzZmhQbXZUM2drQXBmRW5MQWVZ?=
 =?utf-8?B?aFlVS2lyOHBtWFpyNUhnTCtTWkEwYzg4eWlKUVlTSEw5clVtUWF6bTVaS1p0?=
 =?utf-8?B?WU9tWWdjQnZwcFIvaGEwMVZ2dkU4VVBFY3c1UzNmS2ZQelo0akdlMU15RTVB?=
 =?utf-8?B?UExEYXovelhXbzROL09VZmMwSkNocFR4UUh2azhzRzFhRG5jUGdnRnVxSk9S?=
 =?utf-8?B?MlRDZDBLekp5YUx6UGJLbGlpLzJlMVFwWnBxdXdZdzJzbEpQYklPTkxIS0hN?=
 =?utf-8?B?cDNSaUhmd2ZoamxScFBOeDU1MXc0QkxpdnpiRTlhUG9aazJwMjdIamlCN2hu?=
 =?utf-8?B?N2RvazZudGlrRG1FVlE2SjFUNUg3QnNad0ZxODB5d08rK3FGcXBPK2ZCOVBz?=
 =?utf-8?B?cUdQc1QyV1ZBalNnZmtzMHZHYmJydE5JK3Q4b0h6OHhmaVRua1BkaVFacW1Y?=
 =?utf-8?B?OHNQeFNOUmtsalcyZ2tHc3NJcy96UmFHS1p5Q1ZUOXREMlgvdWVUWVRpc2ly?=
 =?utf-8?B?d29tOUlBaDdLdUFxK013M1A4RFRYMTg2YWhSWnJrVmY0SXFFTXBWS2xWRFFt?=
 =?utf-8?B?ajdOa21vNktCMGVuTnJGcmZhME9aUWZ3MGVXZnN4UHBCVnc4akNyUGNheUJp?=
 =?utf-8?B?djltMUFmZ1AyaktHMSt4Smp6MjB1VVloc3R3Mk82OUVGZGM0aWVhT00wVjZT?=
 =?utf-8?Q?5SxFaf2GJgw9S6kjOTMIPS+AeRDmPw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTFQNzRHQm9jSmtLOGFJY1hOVUVsSWNOcTFjMWFuV0orZ2dhUVRDRW5FV3Iv?=
 =?utf-8?B?ZDEwU25MMUtrMmY2NEhQWHRiWnpnd09nL0Nac2NvTXNIZzRGVldLcWdLUmJJ?=
 =?utf-8?B?dEZCUFpHbjBJRWwzZEhtT21sdlh0Uk5heGdkMXpaUmYzeFJNdWFQaE03L1NX?=
 =?utf-8?B?RFpxZkpZOWFmdjRsUzI4MjloZThITnB1R2huZDdLVHFHOFYzcGZ2MC85SWcx?=
 =?utf-8?B?Ujd5dklZQnFyMU95cVhXcEpuZWo4RVBFckdYZVMxTEFUdk5SRitjVEIrMnpN?=
 =?utf-8?B?M29pVE9HZ2h0aHdrQ01kMFZqQWs4SjNuNjhERnB5R0p1OGhXWFhPQ1JSYUxF?=
 =?utf-8?B?YTJiMWRwaTBaa2NEaGd3cXYwa3pFSUo0UGNPQkxXRFR1NXhobWZEeEo4bUFn?=
 =?utf-8?B?TU9kZmFQYXVmcXZGM01tT29qa0JOc2FNeGx0T0tpODlIQkR5clpRUFVwZFp6?=
 =?utf-8?B?dG9zNUdVVnhzdVNWeGRWMmRScllvSzZhOFlxdko3d25MV1FGY240TTRKcmJO?=
 =?utf-8?B?a0xlcEdack95ZThuRG05emVrMVMzck1nazRMeDlpUTRHNFJoWitkM2Y3bXpH?=
 =?utf-8?B?cjNXcWVUalVaeVZKSnk1bG0xV0pNbVZxK2dkOEFGWi9teVBsekNpd3hWa2NX?=
 =?utf-8?B?c3hYQmVVUWpQTnhQbThJNUMxZzRPaUhUdW1lZ0NXbEtzb3loWTg4cFBiU2Q5?=
 =?utf-8?B?SEVhQkZ3TThwUVJZdlZocWt2VFR3UmFJZit2cjdUSFhxWDJpZG5sV1o5L2tL?=
 =?utf-8?B?bzlpc1ZvaGd2WndoNldpOStyT0JJL2FEMGZ1c3U0MzRPNUhZclljZHBxbnZR?=
 =?utf-8?B?a1VFNmtWL1R2d3QwbWcybTVrRHRKVldldFRNYXowWmFHaStxQ1hXMnJHVElB?=
 =?utf-8?B?dlVBejlCUHFHZXRPSXBia2tlVFIvTFpub2JnVnpHd0d3UjRMNUIrRmFxb3Jv?=
 =?utf-8?B?QWJMeXNFczJweExhdmdaR0dQcU05WVdTZitlY1BEYzRtdlFLaTlDL2xKWjVl?=
 =?utf-8?B?a2VPdFNxd2xGbVpJeHhVK20yczdYV1cvZEMveFpvWDByNzJHRm05bmpIc2da?=
 =?utf-8?B?T2ZzVkY2U2NIOVRob29PYXdIKythZk9MZlJYTm5qZHFERXhWcDRuc0N4ZjVQ?=
 =?utf-8?B?dGxBeFJxRmo0TjJmUGMwOHdpYzNCN2pDV1gzN0s2KzBJSVlDcTVpMm9FZGJn?=
 =?utf-8?B?S2FNbEV3VFZPazB1K2syZ2JWcUJ0dDZPaVBjb3NuTlJmYkpMNTdoTzVTZFlz?=
 =?utf-8?B?bXI5ZjUzTVdwWmxqK0gzaExidWFDMDRFdEllSlFkUm5zS0pYRllOanhUbE5v?=
 =?utf-8?B?Tmlod3FOenlrVjVsWTdjR054MDJtcDBvT3pTbTJ3azhnZkxuRDRzU0dQK2lO?=
 =?utf-8?B?L2hxbTRybGNCTlBkZitvZU5EWEZHRG5QY2k2TzZvSWdpb3p6QUFJNWgrR0wr?=
 =?utf-8?B?bjRiMTVLTlhxN0xXdWRZVDhYbGJsaElibGtCVjZnMy9aK1dtTStIZTlrNXNa?=
 =?utf-8?B?V1pmRlMwOSt0aXVqR0xjQnJtWFNla29FL1h2d3Y1ZUZUTTBxRWsvNkVsWmtW?=
 =?utf-8?B?VC9vL3RzbXlKdEFENkRDMHZQZ05JZnpqNXB2RE50TjV6OEVRSDlMNkRpYXRt?=
 =?utf-8?B?WXNqTjVkSFZ4ODVvK1dZN3lEaTUrZGhaejk0emp6Nk1DT3p3Q0svc3dMc1RR?=
 =?utf-8?B?VTRxMGs2M1pCd1pPT01qYk54OE9yZnZPbGltU094UlZ6MHdjcnQ4MUU2VEhz?=
 =?utf-8?B?SUJwM0tYQWxneWlTUUtXbHE0UXRVMmRwSE1ja0tjN2VsR0dFc1hZWk0wSDNR?=
 =?utf-8?B?aGk4cGF1TmJkbXluTjhiNWtHdzBwNjJNV0J2K2Y0SlI0akttSi81N2pSaXV5?=
 =?utf-8?B?N01xcUhtb2pkOGtZME9UUzZMczlGdmdpVVhIbmNiTzdLL2Y4Vk5jYllLSnNh?=
 =?utf-8?B?T3BrZGxKQTdybGRpTVlxSXRnWHFtWEViWEFGZSs5OUhEZmxZcmxOVGU0TWNR?=
 =?utf-8?B?TDV0UWlSZm01VmVQNHdJdE1kejV2VmRRTVo2QVlJOGo5ZFFHMjYzTVpCS1Av?=
 =?utf-8?B?Nld2bVNOTUxueGxpQjkyYnorcFNSR3Y1d1lQZzhZM09ocm52MFpuaERQUU9m?=
 =?utf-8?Q?xocw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b04c790-c650-42d5-af83-08ddb44f8c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 01:19:50.7209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVQiumXD1x8BwmZh+jAUD5bl4IRfYquJRRHxG3kV6u6fqT/HpiLIGK1GVD+pFK5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8359
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 01:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118115

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSeWFuIEVhdG1vbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTZW50OiBkZW4gMjYganVuaSAyMDI1IDAxOjU3DQo+IFRvOiBvcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1v
ZV1bUEFUQ0ggMS8yXSBwcm90b2J1ZjogNS4yOS41IC0+IDYuMzEuMQ0KPiANCj4gTm90IHN1cmUg
d2h5IGl0IHNheXMgMS8yLiAgSWdub3JlIHRoYXQuDQoNCllvdSBwcm9iYWJseSBzdWJjb25zY2lv
dXNseSBrbmV3IHRoYXQgeW91IHNob3VsZCB1cGRhdGUgcHl0aG9uMy1wcm90b2J1ZiANCmFzIHdl
bGwuIDspDQoNCi8vUGV0ZXINCg0K

