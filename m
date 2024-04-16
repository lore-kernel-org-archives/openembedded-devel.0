Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C05AC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 18:22:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.58])
 by mx.groups.io with SMTP id smtpd.web10.28900.1713291713464003838
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 11:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kQwsqopp;
 spf=pass (domain: siemens.com, ip: 40.107.20.58, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPYkVMKKGDHxhgcVkkTWSjR0wWjizPit4BnbEkopZKwkl7qQDVgS/ftacUSFiIaNIDiiY4Qc1Vh/r+fzZG96vGj9GOhwSoOXBKnpVt4eeEuYH+VVo7zbrF20C+Evl+ju/0OkbaSl6imqFmdv8oe6/aoUBOkgbwC8vVPlcp2Dcr1Fn3tLS4m63fYXoZ1uI2eEkRCnNHAVPxDuMnOMJ7CST9j5yQ/tkDckx7veY1c05fsl+2jgEHt/y/H1jlW0K1WCO8Pq6vGUjJygnG9BSoLn6wg+GPufihaRuT7yjE/VpLf9qmY2T7PtKSje/Zj+andVTq74xihJSYsWzTYeuYCwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lksgBJMjcdtgvEwjp4znkIwROc8LXJMUTiP5OR/USzU=;
 b=AHakma6NnpMBLUxknkjlRVK8THsyhQCUO/WjSYuZMXk0dA5bkqMr7UuCYestBEPrUZrNHqxE8GgkBKCRdcODwBN4k2/nr3I3Ev1I/1Mj2HdzGJS4nL12/qd7p22fFcut0BQvDijdVdBvjwrtNHfM7D6HXdcgcYkcEnlPMOYLUPO28ckLEOSBvTh4jJXVPq//yp2J2lIQOOe/Lrl7MDneglGRpe9lzHp1GxuiOjfBBG/tmYgPC/FAYOInJ3r67HQ3rLj/P9I4ahrnN7XSMT2TiYOpLjf7EgzsT3voNQw+RndQKRIhaGLcgFirJ0AYxDiBeJY645a5d3mlRlYxfNCbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lksgBJMjcdtgvEwjp4znkIwROc8LXJMUTiP5OR/USzU=;
 b=kQwsqoppa5vEsNj/x2rCfnCBXZm5+NdhjOy6o8IO89Jyjs9Z6N75Ds3nkdJdS4V4Iz+zcOzA7CRHVLV9VnTqLia+NJOf5zmIR0/oOhUFc2MKpASNaMCxiN9THzTuBE05jKyN1HmNnbINv9Ci3byspmRpOfmIJwgNPUku0rxPOUvYcr6Jx7Ltw/+rAETl4DVuTa3v6KO1UeK5ai+SbGNtM/19Xd/LZB1UMLh/7kX5ocnSIrk1hj+b/0ZeT1AXU8yXZfojvTyUbK1jbqPsOV5f3j6TC8w25AX9ZgohDyE5FB5Vji6GPoTdW5WyJocljousFZgM6X6/jJKRKdoOZp5UTA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB9012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 18:21:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 18:21:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] jemalloc: Update to tip of dev branch
Thread-Topic: [oe] [meta-oe][PATCH] jemalloc: Update to tip of dev branch
Thread-Index: AQHajIXae3c3nXC5S0Kz1ZkZlDIjT7Fq3ZgwgABYdICAAAY9kA==
Date: Tue, 16 Apr 2024 18:21:49 +0000
Message-ID: 
 <AS1PR10MB5697FE098477B557DBEA6F3EFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240412030220.3073678-1-raj.khem@gmail.com>
 <AS1PR10MB56974A2ED47120F1E54B23CFFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1sqUbeRSXXP44HMJSgmvuN9aHdzyhGvxUEYArnf=1D-pOg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqUbeRSXXP44HMJSgmvuN9aHdzyhGvxUEYArnf=1D-pOg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a8da9ebf-024d-4349-a5cf-64e7dfc3e7f0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-16T18:19:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB9012:EE_
x-ms-office365-filtering-correlation-id: 700f7700-d5be-4db8-15b2-08dc5e421560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 71wJ7tQiQ9jacyC/5G+84JRPFRx1l0fXRfBzoXw7idNHsGKwjMBp4C6FvZhWsbH18hMiG7AmHIqhfbDdWiludFwIsiBMBUn3Jd8JJMyaeQFM7FrICB0Acupv+r0n/nq1+w73jenoXbFTjxsBhG9VQWBsz3ZcQZFHXSVk/o4tTMOPCZRkcBKTqvbU8MAgB7e/hwqlwFbk1NMZOzOM+eZKVyGeI2jDgcabS8SLuX+wKj4PVc2PRawGqK+2WmKKkY2EdsfybVFourmFP/oNBM5iFIksN/8KUuA9vQnwVtfT2B0L6Wdh+g4WN5li6tBaOckDR2mLjXjKhQG6FDys1jIYfpDf9DSCHMl9PgIS3lHlAIVaozJ+BIM8UR5kWpM/A1mReVK8tdE1C6XVy/3XagQLxE4xFVohLvquAxeSZ/A7IY3Tx7srWr7xW84HHF/h1B3c4D9osNheBwuK3UXtlCJ2j9rr4cavb5QW9DOi0SXPOvbF/Jrhvj/FEPvq3+7m3Y0+0XIBWeiyYxub/b+FkSI/8ZFkKScJoD1gK1wlitQUMWH6205zDAU6X4n5vCD4bbdZ58dT97Jjx+54a5dFAJY237CP2bcTL/UXm0NxPKLieRTEZI4nsgyodxlGwKVBndnX90836mOFv7kFqNP9hVlcNQkPbyQ2GZq13jNfv94nDkc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SFgxT0tvSUE0aCtlNXVXaUt6dER2cnQ2OFVSMU85V2RjL0NLUDZzL2Jsdk1n?=
 =?utf-8?B?a0o3ZDlCbzNOVC81VkcwQkJEOU11SzdWeWd2L3pZNFhXemNSZ0ZrSXNldnZo?=
 =?utf-8?B?R0NwTGRnRU4xWVI4MTNqb0N0ekNhZ29DYkF0RUM1RmlkakplNEZlZ1N3Yzdh?=
 =?utf-8?B?aWp4UWMvdFU1TmZFQm1RQkowNHlScFMyV1FEWXpjYUNxMVRqRHMrRVFoTysr?=
 =?utf-8?B?L3ExdEtkODJCLzlYMElMY1NXMXZJMytwMTVNWk1MN3NmNWhBdVYrSkRCVExX?=
 =?utf-8?B?Wno3MU94eEkvaUFGZWJQZEZHL1phYUtaMm9FVVpuTFpaN0lvZ25wdjRrY2Rr?=
 =?utf-8?B?Vitzb0xGaWJRR3Y3SVIxcG1EVnFEekI3eTkwZHh0OFNPMzVUc1lySVhpTEhJ?=
 =?utf-8?B?QlNRaURZUHFHTjQ4eGZBZVV0TEl6SSs3R3g4VWNsaDAxTHJkNDBLNm9wTDZU?=
 =?utf-8?B?VE16Qm1yblVlUG55bXM5WnhSOWpLai9XcFZjL0ZVeFZiRzM4RWQwVWpGYU9E?=
 =?utf-8?B?NFp0Z1dqLzB1allDZDk2R3BqMUMxN29sOGh2LytMT2VXVHVrcXFHTHVUa1hD?=
 =?utf-8?B?UHVjbm1lTjdleGRVbnJJSXhLbVFOWnIrbFV3VVBxdU1MTE5kaGVqd2tUblJN?=
 =?utf-8?B?SXU0amJ6SkFSY0RLc2ZybkJaWTZqdW41bHdlSFZXYUZJN2VZcUU2VlpQQWU5?=
 =?utf-8?B?ZGUwUmZub1AwRm9XQWtJUTN3VWUwR3FPbW1YeVcxYzZGam5QZjQxVzNuMVBM?=
 =?utf-8?B?QTBaUEZhNE5PNUIwU3pzTVgxbG4yMU9acmVlQ043OThpTDNlTW12UW1xSFhK?=
 =?utf-8?B?RmRQZjVuRU9rZnNyQi8yYVF2RHZhN0lCTExYNTBmN3V6aUtQNGZUVWU4NWZV?=
 =?utf-8?B?bGx0V2tZME15dkhOV1MzNEd1RnhFZFN1NXJyS0VDOWF0QUZnTmVyUTFZT3ND?=
 =?utf-8?B?TGJuMHR4UmIrZGZCQ3ZZNUNVSkQxY1pHVWtjc25LckZ3UkUrcVVuSitucHZl?=
 =?utf-8?B?L00yZU1HdXB0ZlVzdWYyWEJNN0lCZzNqRU5qbCtyZTYxVDIvN1RuVDVsV1hR?=
 =?utf-8?B?azhCbS9CRmlzMURlYXl0c3F4b0R5VFZsNlgwYUJCR2ZRc1lDeXJORkw5aWxv?=
 =?utf-8?B?MU9DQ3hwVUxmby92ZzFyaXNBVWUwM1pBTnVTM1hQQVVlUmtqWVFJcFBnbEI0?=
 =?utf-8?B?VFNER2V6U1ZSckNKTkpMeS9mbi9qdi9mZFo0c3VVenlsSzM5Z3hyckhNaVVy?=
 =?utf-8?B?amYyZDRtbzlySVNlUWFoTTdyQllDaG5VRVdOS0c1YU5uZWpZd3pncldsL3BG?=
 =?utf-8?B?TFZMbjZ6Z1ZaMENOMzNqdGpWdVREWTJENENQODNGMmhyOWxBUmJBcWsxUm9k?=
 =?utf-8?B?NENXTVpTVVZqVFp0QkJKY0pMeXVNLzVNK0IzRDI3YU1zUlJFSDg1Y1pqZXN3?=
 =?utf-8?B?dnlLRDJwWmdwempROEtvdmRGVHJkWlV5TTJCSWRqZi9rL0JHWG5sdFVMSEFn?=
 =?utf-8?B?Uk8xSDBFUFF3WldZc2xqUlpaS29qSFNPOHFsQ3EzbG9PWlhsamNPeTVFQWti?=
 =?utf-8?B?QVlTeXNaMm5vbFRsRE5LNll0czR4TnNzdVNCUUV5cWREWkJtYjdjYVNRYkRJ?=
 =?utf-8?B?T3hKY2pKRC9QWUhLckMxSVV2endJTjN1bVFScG9yMlQ4azZPOGQ2Q2pLSlhG?=
 =?utf-8?B?bzFTMzFTT2hkY3JKUjhpbmxxU250T09sT2FnM1c3UmxqekJQbHhhVmw2ZEdp?=
 =?utf-8?B?SHg3bFkvLzB5WlFqU1RtOFpNWEtjY1lzR3pjRW5OVnBKNXExeEpBdU9hM0FG?=
 =?utf-8?B?S1ViTlNRdXVGcHYza0xYem5aZW9KRXN4Ui93czRYOFRaKzN1ZlJWUUpldWhC?=
 =?utf-8?B?enY2cXFBQVJNYzRtQWd6bXZnZkJ6YkZ5QWtQbWkycEtVTkIxZTB2Z3VmZWhD?=
 =?utf-8?B?L04xMlZKNmRaWmJSN1pBa0VlSWRNY1oxSFFpL1VsUFpWUTljQ0JZRUtvVzE0?=
 =?utf-8?B?NGJpa21TZ3RHTWxQUkIwYzVSUEtuSGFCU1FybWxwNlZ0UTJkTUxLV01qL3k2?=
 =?utf-8?B?ZzlhU1FhOFhmWlNMSTNDVTM4M0lRSXpBL2RLcW9vVW5JZXVLZWlyTmMrSXJH?=
 =?utf-8?Q?pdWwNKOcks4hdPQfUCtf+HmBw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 700f7700-d5be-4db8-15b2-08dc5e421560
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 18:21:49.9079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Q/aIwOzLpehL9a7XeTiXakaVZJWI3VsKwHAnOOxu/aKLhAqwZPv75StZrzZTqwantgrKLhGIFoW7tgFF1YjYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 18:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109984

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IA0KU2VudDogVHVlc2RheSwgQXByaWwgMTYsIDIwMjQgMTk6NTcNClRvOiBNYXJrbywg
UGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4NCkNjOiBv
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtv
ZV0gW21ldGEtb2VdW1BBVENIXSBqZW1hbGxvYzogVXBkYXRlIHRvIHRpcCBvZiBkZXYgYnJhbmNo
DQoNCj4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgNTo0M+KAr0FNIE1hcmtvLCBQZXRlciA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBD
b3VsZCB3ZSByZXZlcnQgdGhpcyBwYXRjaCB0b2dldGhlciB3aXRoIHJlbGF0ZWQgcGFydCBvZiBy
ZWxhdGVkIGNvbW1pdD8NCj4gPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL21ldGEtb3Bl
bmVtYmVkZGVkL2NvbW1pdC8/aD1zY2FydGhnYXAmaWQ9DQo+ID4gOTJiY2FhOGMxYjVmN2UyYmRk
NjA3ZWFmZTU5ZWEyZDU3OTliYTdkNg0KPiA+DQo+ID4gRGV2IGJyYW5jaCBpcyB1bnN0YWJsZSBh
bmQgbm90IHJlYWxseSBzdWl0YWJsZSBmb3IgbmV3IExUUyByZWxlYXNlLg0KPg0KPiBMYXN0IGZl
dyByZWxlYXNlcyBoYXZlIGNvbWUgb2YgZGV2IGJyYW5jaCwgc28gaXQgaXMgbWFpbnN0cmVhbSBB
RkFJQ1QsIHNlY29uZGx5LCB0aGlzIGZpeGVzIG90aGVyd2lzZSBmYWlsaW5nIHB0ZXN0cyB3aXRo
IG9sZGVyIHZlcnNpb25zIHNvIHVuaXQgdGVzdCB3aXNlIGl0IHNob3VsZCBiZSBtb3JlIHNvdW5k
Lg0KPg0KPiBBcmUgdGhlcmUgYW55IG90aGVyIHJlYXNvbnMgeW91IGhhdmUgaW4gbWluZCB0aGF0
IHdlIG1heSBub3Qgd2FudCBpdCA/DQoNCk5vLCBJJ20ganVzdCB2ZXJpZnlpbmcgdmVyc2lvbnMg
ZHVyaW5nIHVwZ3JhZGUgdG8gbmV3IExUUy4NCg0KPg0KPiA+DQo+ID4gVGhhbmtzIGZvciBjb25z
aWRlcmluZyB0aGlzLg0KPiA+ICAgUGV0ZXINCg==

