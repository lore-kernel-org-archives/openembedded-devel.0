Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B29C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 16:05:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web10.2610.1746115501543794512
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 09:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AZ4Y1h08;
 spf=pass (domain: axis.com, ip: 40.107.20.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyW2f+KfX/RVXXAdx0cL0CPCd+Vk6RQ0A5NXJSQJTyvnzf8AoFVbMn0sQtZxsB4Y6qyAq3043AM+S56oE5xrykootGy4zbFcnRieCP7IBuOX8/hcvFF5ZdBwE8ibBvfxiuJqt+BzCqHLkLhu0RNkYtGGcFK3l+72Nv7h2rrhDwvXtnCuzW/TWaV/L5o06FWIWp9SqHpciwMOrKXac7JtsMQBOJfGt0Xfe8/Mg2WQEqCmkTAcLUWemvGPWypr/VnDeM/L4G6KNN7aQVvgY/5jA2xM2cO8OTLI+JtlVwGUXq2iyBEE2A8xUVtPT3It2jRs3MlDOWT5Xb7VHaQjTw8IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWCmvX4LlMBJ2CUUHBMvxY0EOMnR443u2+qj1vibYUE=;
 b=ZlB0C15h70YLXIf+eHLWz5RonVV0t56ySA9m1eN+aYtnKAWrhiNAOsCmRTho46FiX7VkvFA9Mp5yz6RadiPnTlvS6dhrMtMTh1/ZXJNH9zZNvq+gmFLOfo6rwjmb8FEgf16asdfwXoqbhnLAB4pbFfM/NMU2XmlVv5MwZM41dIM7ytOEhWhNzmvBn3kgSMmK6oopNNxF+1NNV9MFVMH7jbvTuE/7097i7FbI0K5c9MWQPv4nN0ZYm2kN7CGfdLP4nsggpdM382nhoc+h27jRdMTyqAxfdSl/+kFYyt96bApNc/29OPBIe1EtMlDsjhGDd/yWCotZpuHdY1ujzvFN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWCmvX4LlMBJ2CUUHBMvxY0EOMnR443u2+qj1vibYUE=;
 b=AZ4Y1h086RcjT230qYhMddb/eec/iiVXnIGbbJrLwnkipl4iGWfqBhUnBRZI5ujDSGiSkGPkRc7B9RsW0NV8+Of0TH4qFhGygB/VR5uTnHVXhXpBRJJKCTPfB3a8lPXacHlEFG1EVj0g2XCkbfRAWVSBdIP/848+hLZWpwKNgRk=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PA4PR02MB7987.eurprd02.prod.outlook.com (2603:10a6:102:2a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.10; Thu, 1 May
 2025 16:04:57 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%5]) with mapi id 15.20.8699.008; Thu, 1 May 2025
 16:04:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/1] ne10: Avoid requesting an executable
 stack
Thread-Topic: [oe] [meta-oe][PATCH 1/1] ne10: Avoid requesting an executable
 stack
Thread-Index: AQHbpN65ue530j8kYUOhv81FXXJKw7O9moOAgACAkBA=
Date: Thu, 1 May 2025 16:04:56 +0000
Message-ID: 
 <AS8PR02MB1020138BD1EDFF65E4D4CD5A4EF822@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250403212342.3580553-1-pkj@axis.com>
 <2547531C-CADD-4B40-B9F1-E06FF8F15318@arm.com>
In-Reply-To: <2547531C-CADD-4B40-B9F1-E06FF8F15318@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PA4PR02MB7987:EE_
x-ms-office365-filtering-correlation-id: 641134d0-3567-4aeb-e099-08dd88c9ea94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aEYzSmlRcWxUdFlBQjM4NFZ1NnRKdllFNi9zcndZbXAyVTdZRE5vYWlxbksv?=
 =?utf-8?B?UFJmZndvNFVSQ0d6bDMxWkMwNExqaDRpVGdiV212TDE5N3lKZ0o5eTd3MlR6?=
 =?utf-8?B?aUtqTkpRTWFKeEYraW1ZeldCQ2dGMzRtS0ZNSklwQTB5bEdqZy81QmhHenlw?=
 =?utf-8?B?T0pIZldia1hYZ244WEQrbUN3UkJUdndZWFQ2ZGZ2SWh5QThwRmJlNDBXMU54?=
 =?utf-8?B?d01zajNXLzFmUGlEbU8rR3VDeEt1N0ZIVWVKTDRaR1hQS1J0d0xnRjdlRUdD?=
 =?utf-8?B?UlRLWSt0VEcrQlljU1RVR093cU54d2JTOUtISEd6OHFxUzhjTFkwZzkxelg5?=
 =?utf-8?B?U1NvMVVKYnErY01LN1hsUkJEZ3FFdUJYT2hucUZTalF3K0Y0T1lOcm9qWDk3?=
 =?utf-8?B?c3BBMVNYaHh6YzdTdGgvQlJoQTJQWGszZm5xdzBxd2tESjF5bDY3S3RHZmlR?=
 =?utf-8?B?anNZUnlmWUlOUTRtSUtWeVdQTkdDQzNFNjlZak02Vkh0Mms3WXMrdWNHRWla?=
 =?utf-8?B?TURKVnBnU0tseERpREs4U2lLN3A4Ry9WZXZzQ0EvSXVWZlJ5QUE5NXlLdWNP?=
 =?utf-8?B?QnNLajVyUlNScmRpa0ozSmgxTVRuWkkxTUx1MjRCanNQUUdTRzJkL09PQjFp?=
 =?utf-8?B?citydVkyL1JxaUdvTHpwSTIxQVZTdWl6Rm1vVW8zRkVhNk9lbWp4cks3czhE?=
 =?utf-8?B?VEF3SnNILzhkOVNlT0ZiaUd4TE4rOG5aSDNGa3JJaWlvd2lvKzM2NTVLYVd0?=
 =?utf-8?B?dkpjcDNva2ZBbWg0OGJPR0tlcEErY3kzcUwrNjh6L1hsZmhzK2s4ZjY0cGtj?=
 =?utf-8?B?dFJhN093N2QvZ2hpNTNzT0UzS1hwOERJWWVtUjVVcTZITzNLSWl4V0NYRkVm?=
 =?utf-8?B?ZVIzQ1NaZXJKU3hYZ1hGdnFTeGtFUnJqbXkxcm0wTVd5aVdkMVFWQnAvYWp3?=
 =?utf-8?B?ZGlCY2N4Z0orMkhQMjU4Sy9EeE5BOVBHM2JEaWJQV1FLVkNVcHRLRmpDenJB?=
 =?utf-8?B?QzdxNlR6UE1seG5jR3BoSFN6NHlyb3AvM25rWkFQQnNWS2VXaWRPQjFWWERK?=
 =?utf-8?B?bVN0QnRUVUxNajBIWFdiRnBqbGhSbERTLzBCYkZDUHNTSFpUY0p4NmFYTlZH?=
 =?utf-8?B?d0tPdFNjZXVHU2Y0ZTdFalVzZ2JQc3hqOC9ZVW5hUXZFVjhzYXhMRFU4eThH?=
 =?utf-8?B?S0s0NEd6eXFIWjlWS21WQzNvL2lxQWhYdElOb0lYUWMwTkh3cUE1MTRPeC9F?=
 =?utf-8?B?cmJVdnlUOWxpVk9MM05Qc0ladHZ4aDErN0l0S2lqRWlZZmFjQmsxdmtWUUFO?=
 =?utf-8?B?dGplaytIRlFOQ3hBbHliS244QVJZeDcxd0NUNXk1WW0wNHFaVGM1RUtMVGRu?=
 =?utf-8?B?ZFQ2blRWK28rNW1hd0RjL0l1V1hMOTYwTStSTEtyYzlYQk9MQ21VZVlaMmpL?=
 =?utf-8?B?QzRkbFIvMGZBQXB0TWVSblpYQ0IxcG9jNkZVZ2VPeUxhVFEwdUdiVWlwRGl0?=
 =?utf-8?B?YjlOMzloQ2VRKzhpS2Z4TDl0UzRQc2ZXbFFNV2NNQmJLUXgxRXhKWVUwbWhZ?=
 =?utf-8?B?T1JSaEMvVjF0OGRwbEV0TE1xdnQxWkhxaDJ6dVRLK3ZtOVlGZkNDK2Y0N2hq?=
 =?utf-8?B?RzU1bFNybFFGaEhkYnA1Q1Q0YWt5OC9oeGNuVEJWWlRvdk1DNnk4L2xPZzAz?=
 =?utf-8?B?ZzFmb25pa1MzMXFtcWFKcDhpQytIYlRsY21la2R1N2xBSHFNckRCNnV1T3d1?=
 =?utf-8?B?Uk5hbEpLRnJyM0N3YUFsSHd5NUs3NVU3dDlSdjZETkFSOFFHcm1USkIxNzEz?=
 =?utf-8?B?RUp6ZlRVSm5VSko0dnRONzRaQm5IeVFQQ1VEYjRUajRMOUZDTzB1bk8xNEJT?=
 =?utf-8?B?M01kL0ljbklMd3p2bFYzTzR6Vmxsc2NXM1kzN2c1TTlxZXBxRjVUZGw3czhm?=
 =?utf-8?B?SVRZcklrbVEvVzNFbExoN1YrcmwzVkZyNjgzcHRyaUFCODVzVGt3eWREQjNF?=
 =?utf-8?B?UzE3Rm1nNmRRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VmJnNUdVNkhiYWJoWkNNSzdCVjZoQkJhWUFuM1UzOTJQb2lrUTI2eFhCdENF?=
 =?utf-8?B?Ky9lME9GVkhuYjdtVmZjTTMyYWMwT281Vy80SndBKzNYdHpnM3JvSFBZYTFR?=
 =?utf-8?B?WGFxVVc5SEVBMmZ0ZEVkVTdCS1RneU9FM2U4Q2U1WS84L2M3eTVwaUxnb3Ax?=
 =?utf-8?B?L0M4NStGMk0yQm9pYkJqTXVjYlBod1ZEYkZnMXh0Z0RSN0l2NHF5L1FYSGY2?=
 =?utf-8?B?VWlLYkhGQlYzTWZRblpGdmdwQmpacTdrM2tsL0d0TWRKaGR2NEZFTXhvVEIw?=
 =?utf-8?B?MjZkSTliQzhxQjh3RXJTQytVYUMvcnNCenZ0d245UUtFQ1E3QnBIR3NjSnJZ?=
 =?utf-8?B?OHRYempHQlNSY1h0UU84YnBCN0VVcGNtbXJiQUpNOEx1cFJTczJYcXY4TlhJ?=
 =?utf-8?B?Ni9yTGlUTnExa1U0Yit1ZEtCNGRsaURLb0NIdXFYYVFaN0p4cE5zUzMxeTdT?=
 =?utf-8?B?d3NpSEFMSXBJajZYbHFPT2RhN3I4MzY5ZWwvZmptNVFqLzFnTldPQVZNY0Zn?=
 =?utf-8?B?UURKVWx5SmUxYTMvVDNXckNzeEovMWE4Tkw0TG1OaThuZmJvQWhnR08ycCsw?=
 =?utf-8?B?eVE1d1ZIWlJmM2dpVVY4Y2kydU0zRzlrcDNHZmUxN2RFK0d0WVFsOFh6V3BC?=
 =?utf-8?B?b2w2cjM3TWdDdFFmRHY0UWtkR0xBejQ2ODZ4MVRpYWZhck5lajY4SkM3dEZy?=
 =?utf-8?B?dVRFancwWnNRYVRmVndhMi9SR1ArNlFkQi95dFd6cHFQN1FYYVZkR1dKQlA5?=
 =?utf-8?B?dlhmM0YyQUo1bWwrL05JYkZKblhjWHVnS3ZVNG1GNTRHYUd5UFhLY0RxNy82?=
 =?utf-8?B?WW9aZ0FsczY4c2pWRCtwWHBKUGFiUXNLdlJpSzh3TEZkZGMxbm5Fc090K0ht?=
 =?utf-8?B?ZnhhTmJaeUVxV1grNnd5NEFxd25EaXZ4eTJQaXoyQ1lmUkZFQ052NkE1OENu?=
 =?utf-8?B?Wmh4OHdYU090VDJzRUhrTE1vSS9vTVZWOEdGZE8zWTJXS3FreTVnL3RyQzNK?=
 =?utf-8?B?U082ZkhjdXp2SFFvaEdza09aL1dOZ0ZzU1M4bW0va1RNOVJwRnFrUWJVVGcw?=
 =?utf-8?B?bDJoUDFwM0ZDN0V6OTA1a3ZwUUM2a1VNV25yemFKL09jeTF2dDNmajZ3cW9K?=
 =?utf-8?B?M2pTVXpoUnZhcE84MTgvT2NQTFRMbnd6WmVhOEdHeGNxN09TOHJ6cUZPdjQr?=
 =?utf-8?B?RHpaUC9wbnRvN2d5WVFpREsyRU5zWjdZckFQSFBFdFlXTzU2TFVqbUxIb1Q4?=
 =?utf-8?B?dE5XMWxWdXlQTVFCV3ExUEltUXphZUg2ZjE1Ly9WbGM0aUVNS0M2VHVSeElH?=
 =?utf-8?B?NjlSbkFwaVU4dGVrN2FVTEt3alpYdWkweDhjWStrSisyU01SdXdyWjY5Rnlr?=
 =?utf-8?B?RFZXTFVpdHlsbnhETFRhcUI0aTJPOHY1dmdjdWQ0dmxYR3poUnEvMCs2bHpT?=
 =?utf-8?B?U29GRmRJejNNSk1heUs4UDRnKytDNERqbWRvRGVsMXhIZEZIa0QyNDRUTnd5?=
 =?utf-8?B?aWxxVWljaHE0Q0ZYNkVSMUdMRmNMRnNqZVFoRDdLaDBUcmNYYlgzajVhMk5h?=
 =?utf-8?B?dkdHWVZwOWlOa1M2VnBUMFQ0K3F3MG1Qazcrb0p3L2M2UE1GQ2V3U1JoQnRJ?=
 =?utf-8?B?YWUyV05yUy9YSDhnRXZkYVFDaHpiQThZZUV5aTVCNy9BMFhqTStkaHRvYVMz?=
 =?utf-8?B?d2wyeWZPVTVRL0xiWGNyemtzZUhiWjhtRVNIbEJQZ3dLMTN1eVUyTDl4ZFN6?=
 =?utf-8?B?UC8zdndwcVZqMmluN1hBZFJoZlhaR25SQ25EWTRZMCt4S1NLdEdadk1na3Ew?=
 =?utf-8?B?cDFtUGdYaUltVnNRMkk3MnN6cm85UjM0RTNlZFhSc2p1bldtY3Nwd09kci9M?=
 =?utf-8?B?eXhGUzZtN2xncHNTSjlpbUM3aHg2SGlHRE5KeWdSYlMzMmUvMXhPYzZXMGto?=
 =?utf-8?B?RDJLcG9QOWNDeW0wVmZSVWUrSXA5NUtGN0Y4MU56QzB0eTZvc1piM1F4Yi9E?=
 =?utf-8?B?OVpFRGdER09qVjFMTFBRTEJJa2lsUFZzc1dzRWJsWWt6QUdIdDMydHlqQnNW?=
 =?utf-8?B?YUg0Nm8ybWcxdTNnOUgzNGtvRzJUSVRncTFvdkN0RHlHY0lSdmJ2ZncyRTBB?=
 =?utf-8?Q?w884=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641134d0-3567-4aeb-e099-08dd88c9ea94
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 16:04:56.1536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zER4hleLZp2Za586tjv3UI6VEL9HZuiba15zm1yCbN1CKfUm8zfuKfOr0n8WeVqi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7987
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 16:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117269

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDEgbWFqIDIwMjUgMTA6MjINCj4gVG86IFBldGVy
IEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0g
W21ldGEtb2VdW1BBVENIIDEvMV0gbmUxMDogQXZvaWQgcmVxdWVzdGluZyBhbg0KPiBleGVjdXRh
YmxlIHN0YWNrDQo+IA0KPiBPbiAzIEFwciAyMDI1LCBhdCAyMjoyMywgUGV0ZXIgS2plbGxlcnN0
ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5ramVsbGVyc3RlZHQ9YXhp
cy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIGF2b2lk
cyB3YXJuaW5ncyBsaWtlOg0KPiA+DQo+ID4gIGxkOiB3YXJuaW5nOiBORTEwX3BoeXNpY3MubmVv
bi5zLm86IG1pc3NpbmcgLm5vdGUuR05VLXN0YWNrIHNlY3Rpb24NCj4gPiAgaW1wbGllcyBleGVj
dXRhYmxlIHN0YWNrDQo+ID4gIGxkOiBOT1RFOiBUaGlzIGJlaGF2aW91ciBpcyBkZXByZWNhdGVk
IGFuZCB3aWxsIGJlIHJlbW92ZWQgaW4gYSBmdXR1cmUNCj4gPiAgdmVyc2lvbiBvZiB0aGUgbGlu
a2VyDQo+IA0KPiBDb25zaWRlcmluZyBuZTEwIGhhc27igJl0IGhhZCBhIGNvbW1pdCBpbiBzZXZl
biB5ZWFycyBhbmQgdGhlIG9ubHkgdXNlciBpbg0KPiBtZXRhLW9lIChsaWJvcHVzKSBhbHNvIGhh
cyBpbnRyaW5zaWMgY29kZXBhdGhzIHdoaWNoIHRoZSBjb21waWxlciBwcm9iYWJseQ0KPiBkb2Vz
IGEgYmV0dGVyIGpvYiBhdCBvcHRpbWlzaW5nLCBJ4oCZbSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxk
IGp1c3QgZHJvcCBuZTEwDQo+IGVudGlyZWx5Lg0KPiANCj4gRGlkIHlvdSBjb21lIGFjcm9zcyB0
aGlzIGZyb20gYW55IHNwZWNpZmljIHJlY2lwZSB0aGF0IGlzbuKAmXQgbGlib3B1cz8NCj4gDQo+
IENoZWVycywNCj4gUm9zcw0KDQpXZSBoYXZlIGEgY291cGxlIG9mIG91ciBvd24gcmVjaXBlcyB0
aGF0IGRlcGVuZCBvbiBuZTEwLg0KDQovL1BldGVyDQoNCg==

