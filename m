Return-Path: <chris.paterson2@renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D176C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:55:49 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.37])
 by mx.groups.io with SMTP id smtpd.web10.13057.1750146940022795407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 00:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@renesas.com header.s=selector1 header.b=S6NCWTJS;
 spf=pass (domain: renesas.com, ip: 52.101.229.37, mailfrom: chris.paterson2@renesas.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/nOpPG0bU1ajkA/PDsJCccv21ULWpI7mE4/BlZdkRWO17+NOw8i5o2QXPEyDdBWdynpOeYJQuksNY2i8OKizlEBHLupJyNfyw9T4BhEGl2V5CFxgw68JeZw57QsyiYBoXWM6TuaIYyKdzFoCQhS9u1TtT7/eG9oo+axeAtpmhbPnogPvbhK+Ai4yhL2CD/+K5Jc3Ky0nr7HHghA5pz/xz9isYJuhs3lhpIP267NCwa/+ZJTuZDafQFZ5ruddOgwBISFaJ0CgSdsgdz0aPIzJW/ZyteXV6ffx5yR7tUZr2TrNguneHCuJtYIoolvEtpvzNyuofJusK97VKL3TbDmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA7syNJXGI2pxaS89wO+nd501qbjceWExAVEPdjquAA=;
 b=i5Dg056NKI3/M18YjqWDt34v7sbSnbsZgs7HwAnoAaWqAdV74Pxs2geFox8af6aDw8tEeN4KnEVfdCDWsDxJLE7zJ4Hsp5aOmVAIEZeNBslStqAMmupPW0xqLvR3aS1Ui6SkjGgdeSnMIQZuZDbITK+56TmOk6v0a0kZcQn/jvjuYUUYyxmCRXSvVzx55+uqTT0ZlUemnpqnPjSm20vSVBa0VbOSe4IG8iJVrocD8ZCzA6HO1Wfmgbi2OmPc0bYpv50HnSUJxnROK/X5otmoNqyxPh/TtTHCU/Vu+14pVIUkwUVMxLP4x5WXtPWtvzKlbWPI62DBpuPGAvggB+GHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA7syNJXGI2pxaS89wO+nd501qbjceWExAVEPdjquAA=;
 b=S6NCWTJSjmSG8lqqVqya7Dosq9AbBbn7CKUJyx2OVOPyEGYH+CXRhyztA6NfXOzPoOVaDZ462jJylpxPoiJu5kb4CisptlivzSa+ntK3SyIsJHjfceZbvUs6UEDRyIt8h1yZp640rbimL4zML/90onYlWVA589w5Qv6AO0zH4Yk=
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 (2603:1096:604:370::13) by OS3PR01MB10233.jpnprd01.prod.outlook.com
 (2603:1096:604:1e3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:55:34 +0000
Received: from OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812]) by OS7PR01MB15130.jpnprd01.prod.outlook.com
 ([fe80::2c4:bb3f:57b4:5812%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:55:34 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Topic: [oe] [meta-oe][PATCH] smarty: Drop allarch
Thread-Index: AQHbydGJlvpwV08t0EWj9RpD1xBwBLQHFBCwgAACaoCAAA+1cA==
Date: Tue, 17 Jun 2025 07:55:34 +0000
Message-ID: 
 <OS7PR01MB15130647C07EB7E8967CC9532B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
References: <18415ACCB9C1FC11.11990@lists.openembedded.org>
 <OS7PR01MB151309CB28F4D907420E19720B773A@OS7PR01MB15130.jpnprd01.prod.outlook.com>
 <2a08db91-f139-4bd7-ac0f-14c89a0dc784@gmail.com>
In-Reply-To: <2a08db91-f139-4bd7-ac0f-14c89a0dc784@gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB15130:EE_|OS3PR01MB10233:EE_
x-ms-office365-filtering-correlation-id: 42390b51-c94b-4259-4435-08ddad74570a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MnhnNjR3blNJU3g2ckhRS2FuRkF0RVFhQiswMy9aREdQYlArckF2WFZCbEVP?=
 =?utf-8?B?ekFyazlCQzBoSHREUWdwT1RPUDNRSWZiVFJBZTg2dm4rU2VvSGVOQXpjMURu?=
 =?utf-8?B?dXlHZ0YyMGdJaFB6U3BwQjdJRW1SeW5OTE9qQXBFYktDWUcvMEVSNEpoU3J0?=
 =?utf-8?B?VDFCcWNnMjN1SHR6aWVsai8xd2tRNkcxd1lUZ1ROOElxbVpOK0UzeURCYklI?=
 =?utf-8?B?a1FKM0pQRUI4a2h6c3ZXQ3FYdVc0NFArby9YcDRSdTVyVDNWb1luV2ZCV09Y?=
 =?utf-8?B?UXRRZTZtYXU1ais4czRGYTVZdDNmeVdWZ0lNZmQ1NnBSVUJuaVpmVktkMC9C?=
 =?utf-8?B?VmowbmNmblAzdE1rY1VRZFB6Z1lrbVcvQmdYa2QwMlJDV21uWUxWK2NuM2ZF?=
 =?utf-8?B?T011cklkb24zdGMweWowRzV2NHQ5UHJoYi9qcHRnaGdmRXFEeUUxdjBFaU5u?=
 =?utf-8?B?dnlUdlFvUTlTK0V0dmFDVkxoejZiUGJHQlQ1T2VRa3ZxU05XWmpqQXo1eEJH?=
 =?utf-8?B?VmZiWkdtRC9KWXNRSmI4dmUwVTlJMmFSRzBlT0p5bGxlY0dyUlhMeUpEbWxm?=
 =?utf-8?B?RTR2S1NrSmhlL3JNR25aRmdQOVlVRUUzRlB3dGRXWTBJek5HdEZCK25zTEJH?=
 =?utf-8?B?ajQzTVVsZ0hNRml5WW8rSTZvN2FoTHVXVitmR1k5Mjczc2wxZ0ZYRGJRZzdw?=
 =?utf-8?B?dnl2dm80czFzcU9uM2pxcTNkTjBwS1VPcWlSZDJmRHlpeVpNa3FDaXZhcS9t?=
 =?utf-8?B?V3RJTjZZYTk4UFlYb0xIaXdZNVNYRnNqWWljZ2dsWE10OHpJcmh6eHgzWE94?=
 =?utf-8?B?bG1tbm1QNWtFUzJFaGpBczZseU1ZZTVMYkluTXprLzd3WUNUNEZlVkRGMDha?=
 =?utf-8?B?aGlqdk5ZYTNTUG1HS2JUOVE2cG1xNHVLNy9XZTJJbFp0M1VLUHdtckFacjRY?=
 =?utf-8?B?NWdlWThUOEdzZTFPemFJQ2sxWkVGWGxockFLbitkbjk1NThRSGhjZm83VUVK?=
 =?utf-8?B?OG1Jck5xR0JXQ1JkYlYyR1VsNXE1eml5eEdweWlocWhoMkVmOEwvQ0hHUHFJ?=
 =?utf-8?B?NGlCNk9rbkJIajliZ3RUWkpsWjQ3Z0tobVd2WVpjVk9GRjBQZ3dzQktjcyts?=
 =?utf-8?B?NFhPSVZmYVh6YkhtRXBDbEMySmtHOXFHLzdCMVpXcmlJTC9PZjRCQlByVVc0?=
 =?utf-8?B?Q3V2Q0tXd0owRzRUbWRnWFdHU0Y0ZGd1Ykd5QkR2Tko5dzVqR3hNRGFGSmly?=
 =?utf-8?B?clhVRnNOWFpJY0pReVIwRXRuMWZ0a1dNYmtKL3F2WXFUU0NPN3J2eHJNRWJP?=
 =?utf-8?B?VDhhOGU1Mjh2ZXgweGRiMnhTU2dLUmd4MlB0NTg3Um9DdFZBcVp0MlN6MU1T?=
 =?utf-8?B?aGtaQ3lwcTRoTnVPdzAvTS81UlBPTnhLNFFaemxQZ25keUVEdmZ3Q2lUSWc2?=
 =?utf-8?B?SU82RnRPdFY5YlZOS2lDZHFOU0RwTDhmUzlSWG9vN002Wm5sejVkU3NMZC9J?=
 =?utf-8?B?NEJJUVlnS2pKbEZsYTU1RzlwaGowKzI0K21UL0NxQ0hXeTBkRWF2UFBCYnYy?=
 =?utf-8?B?V1N5TXVOUnlCMGRLRi94dnBuclRjMTRESURoc3JkRmFqNTV5VlZTR0diTEdh?=
 =?utf-8?B?cXY1V1QwUHZ1b0JsN1NHb2JHMjZNdFFaSUlzcVNZNllnb25qTEJDQi9UZTBP?=
 =?utf-8?B?dmttbThjNEdzbHRUY3UvR09qOEJwSHU4enhJTmhzT00xK0tkMjN2N3c1RE5Q?=
 =?utf-8?B?OEJnVkVEQTZvODJWdE1YT29ZaXdZTzU0dzJvL3dzNWpwT0JXancvQmdPNHBT?=
 =?utf-8?B?eW9oZ3Q0WWlDSWhIRkI3RDNaRmFOcTA1ZytFYnFubENkdUl0RklrczU2TXlk?=
 =?utf-8?B?VTlleDdJazB4MktENWhMbnVWVzVXNENqdWlGR3pRRW5lVFo3LzYweUIrWThW?=
 =?utf-8?Q?71w+H6GEKkM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB15130.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUgxdjdjbUR4bEhQRlUxYVloTUZkbytKaHhzajl5UDZrbmRsZ3FvNlpjc3dY?=
 =?utf-8?B?MXFxUUZxb1BGYjZycW1FRloyUFREK0xYaXJrOGttZEF0azBndzFnb251bEpv?=
 =?utf-8?B?cXQxU29UbXZac3FCRGVweXY3ekZyTGYzdXliUWxEWmVzQmQzWWsrSmtNNjgz?=
 =?utf-8?B?L0w5ZnArSmp1aTVTVnZ5Q3VMNStBUzdRMU1vU2tXbmM5K084eDRTcE9TcXh6?=
 =?utf-8?B?YU1jTGozR25jTzB3SVp6NlJZYU1zdlVEVHltSTZ1bFhqUXJWVWx4ZndScVcx?=
 =?utf-8?B?ZU5RWlBVOUpWS0lJQzUxVEdjNjZsTkpOdmkvekFqTHhaT0F5SUxURmNEaGht?=
 =?utf-8?B?VjlGb0JDWjlVYzR1OXBaMjlJaXg5TnNWaDZHMyttbC9XeXhCVHR3OGF2M3Bh?=
 =?utf-8?B?eGtxakxJNXI5VkgzMTJLSU9pT3djMStHbGN3WTlFSjcvZmw2N00yUlVyMXlN?=
 =?utf-8?B?MHBEVDZOTDQ0aU9TdWFvSThNRU5VUFpaa1V6Z1ZJNzZSVUxXVXZGMkJMcmF4?=
 =?utf-8?B?ZktrVi9tTDljRkYxbjdLTXI5RGZMemd1ZW8vcklETjRkNzhuWTNwdGwrdU9B?=
 =?utf-8?B?czZYdUpETG9YNUdDOVlyaEFNUTE2ZTdJYUFDbnZGSHBoR2lWRS9LalJwSnYz?=
 =?utf-8?B?dUliNVZyWFBPNGN3MnNVWTl5UE9hd0hrTlVqc2xYWkhTVndKS0ZNajFiQnhH?=
 =?utf-8?B?aFV2Q25ISXY5bVpQQStXb2JzNDVSOU1XeEtteDVuUlhiT01tMDN0SzVrS3ND?=
 =?utf-8?B?WG1uT0FURkdsUDJzL3VGMjJSQTk3MWRrN1BkSGJwS2lkMXdsODA1N1JCSFEv?=
 =?utf-8?B?UkloNnBaMHNGMHlhaXpLaDIveE00VGFETXhDNmFxUjBKVVdzcEdnQkV1RFBG?=
 =?utf-8?B?TXVkVGxXeVhONy81RXpMUUM5bk9TalVYZXRJRU03U0lUb0QyWG45K3hqNUZU?=
 =?utf-8?B?ckNIdWNDRlMvemN5cUdJR3NXREcvdkthODVSSjhHRFEreFFhRW9pZExSMU55?=
 =?utf-8?B?TzZKKzNtUGhUeU5jeUhhZHBnT2lYRVFhZXRaRnFTZHh3ellQdHFCcUxZMjAw?=
 =?utf-8?B?QUowQWZ4bTliTk4vL1l3M0cvUEJWQjhxL0R4Z0tZQTRmMHpVbEpteU8wUGdT?=
 =?utf-8?B?d1JGSDEyYVEwVWJSeVJCeXZDMnoyaFFiakJIcndBRGh5dGVRNnlvYVpxUWsy?=
 =?utf-8?B?Qlpkd04yUzJ0aFk0UlpwcjJQTGZNUllIVmYyVHJwOEtHNjl0N1k5VnRTRHlE?=
 =?utf-8?B?VDg1VUJwNGovR1dFNzVrTzA4YTFuL2E1YzdPTnRzdHlsZUkwR2JCeHFzSU82?=
 =?utf-8?B?L3lMSjViS3dGV2ZYUnV6LzM1NGtTeGFlUzFRWWJDUW1FTkY0TVJvMXRhaEMy?=
 =?utf-8?B?dHdSY3NZdmp2dXBEWUNYelU1ZFdzUUV1bWxhVytiREhVM0dMcWI5OWhsSUo5?=
 =?utf-8?B?amkwN2RLeVRUdkx0THRFTGkxKzE0WXl2TEtPaDFac2hoMXN0RmVsTGFGbE1U?=
 =?utf-8?B?TERMU29yMFVqTjZFeGxMMFQ4WTdxSHQrYU5ycXlYOEE4bURtSnpwUWI3TEV1?=
 =?utf-8?B?WEoweVlrdkRmSWNYS24vTHVKMEhqa1NrWG9VNWR2LzU2ZTVqQ0tRWmY4RjU0?=
 =?utf-8?B?V2IrUHBNRmFUOFMycTkxdTh5TjRhSkdLbWQ1TXNCUCtHd0hxR2Y1dWJMd2Z5?=
 =?utf-8?B?WWtWYUlQY3pvVWpVRG9hbXVvbGxGR1M4Q283bEdHNEFPRlBNRVpUaWFVY2Nt?=
 =?utf-8?B?VXB6R2ZkN0JBL3VrS3lHeFRvdWtUYU5RTXExcmtWVGhjUkRMS1dIb20rS1Zu?=
 =?utf-8?B?d2NocThoVkRHWFUwOHM0R2NSV0o3OTh5azBMaytib0RIcHZFUWhaUmlVK2lq?=
 =?utf-8?B?ZGp6RUVLbmpaMGM3NGJ5KzNjOStLRVN5eWJsdlB1VHBMeVcvRHQveUpXdDRT?=
 =?utf-8?B?LzlIb2hOY2ExSFJ0Z09vaE4vdkJpNzBMYU5wU2Q4NXhtT0tjODdMRWMzUGs2?=
 =?utf-8?B?N2VlS2JWOUhOck5hb1g3MU53Z2ZZbjhBQ1lDZXMyOXZJNE9KSXF1S0RIR2Vq?=
 =?utf-8?B?cWt0NkN0Q3NwWTFsNTZtOEh1OERYZFduSnJ5ZWFhZVZRRjRWT05UcVkzK1lB?=
 =?utf-8?B?VG5taGluenV0Ung0aFlhMDhaSFRmZi83a0lXNzY4MDNhWlRHMjIwb3hRb1JV?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB15130.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42390b51-c94b-4259-4435-08ddad74570a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 07:55:34.4379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYGk73kRlMFzfSlSGu4m/E0L/m1d2gHG26EWXEVz5m3s9Rs4iOQVT9JOzw71l5tQ5H0hPdvrTais9vUnAfkaW9ztlOyHVLYg2FMRU1w5WMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10233
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 07:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117921

SGVsbG8gR3lvcmd5LA0KDQo+IEZyb206IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFp
bC5jb20+DQo+IFNlbnQ6IDE3IEp1bmUgMjAyNSAwNzo1Nw0KPiANCj4gT24gNi8xNy8yNSAwODo1
MCwgQ2hyaXMgUGF0ZXJzb24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4g
RG9lcyBhbnlvbmUgaGF2ZSBhbnkgb3BpbmlvbnMgb24gdGhpcyBwYXRjaD8NCj4gPiBIYXZlIEkg
bWlzc2VkIGEgc3RlcCBpbiB0aGUgYnVnIHJlcG9ydGluZy9maXhpbmcgcHJvY2VzcyBmb3IgbWV0
YS1vZT8NCj4gPg0KPiA+IEkgYWxzbyBzZW50IHNvbWUgcmVsYXRlZCBwYXRjaGVzIG9uIHRoZSAy
Mi8wNSBidXQgSSB3b24ndCBzcGFtIHRoZSBNTCBieQ0KPiBwaW5pbmcgdGhlbSBhbGwgcmlnaHQg
bm93Lg0KPiANCj4gVGhpcyBoYXMgYmVlbiBwYXJ0IG9mIG1hc3RlciBicmFuY2ggc2luY2UgYSB3
aGlsZToNCj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9j
b21taXQvbWV0YS1vZS9yZWNpcGVzLQ0KPiBzdXBwb3J0L3NtYXJ0eS9zbWFydHlfNS40LjUuYmI/
aWQ9MWU1NzFmZGRkZWU1NTJkNmE1NGE3MmY1YTY5MjZlYzY1YTNkMzkyZQ0KDQpTbyBpdCBpcyEN
ClNvcnJ5IGZvciB0aGUgbm9pc2UhDQoNCkkgd2FzIGZvb2xpc2hseSBvbmx5IGNoZWNraW5nIHRo
ZSBXYWxuYXNjYXIgYnJhbmNoIGFzIHRoYXQncyB0aGUgdmVyc2lvbiBJJ20gY3VycmVudGx5IGJh
c2VkIG9uLg0KDQoNCj4gDQo+IEluIGNhc2UgdGhlcmUgaXMgbm8gcHJvYmxlbSB3aXRoIGEgcGF0
Y2ggYW5kIHRoZXJlIGlzIG5vdGhpbmcgdG8NCj4gZGlzY3VzcywgdXN1YWxseSBpdCBpcyBqdXN0
IGFjY2VwdGVkIGFuZCBhcHBsaWVkwqBpbiBhIGRheSBvciB0d28gYWZ0ZXINCj4gc3VibWlzc2lv
biB3aXRob3V0IGFueSBmZWVkYmFjay4NCg0KVGhhbmsgeW91IGZvciB0aGUgaW5mb3JtYXRpb24u
DQoNCktpbmQgcmVnYXJkcywgQ2hyaXMNCg0KPiANCj4gPiBUaGFua3MsIENocmlzDQo+ID4NCg==

