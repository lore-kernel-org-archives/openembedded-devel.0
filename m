Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DF5D68BEF
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 06:29:15 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com (SEYPR02CU001.outbound.protection.outlook.com [40.107.44.85])
 by mx.groups.io with SMTP id smtpd.web10.34575.1731911349269033468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 22:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=iBRwverT;
 spf=pass (domain: aspeedtech.com, ip: 40.107.44.85, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5IDNULfunHO3kwAL958Y9+F3wtd9GFAFZ0YbV+n7dY2C1R7fi4m62gFpu7baw71ixn0QtszomHWT/e17VxaZENdGba5YTCDiG8obQkKiblgQzlllB3UmH7q+1h8mEviml0I0AxF2JUqNWp560uVKvOhPeQaIz6n1j2QJlWfmnDLy1t8kn3kj6aXSYg8P4Z2kLm6u6jvp43vwrvROvs+VtpoIDCWwUA5CaId3BOwVoe2e2kmCcO2UbeYJJij6m1GBfXkCGbOqM73YYrGa8PtMx6H9t4lqXdPT64mE1W+CgFQb4rGkAsYz3QXFjcBTh4cQxit94m1FJ9MitGmkex9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU4uNYwLr1tyfjNfeTJoH0zWBwXOm+Gm4BOGijSiOjk=;
 b=Vlem34voRzSm+7XhUBu3In44X4i+Sr2wEZ1xb3LGMCecw52uIriXkU7E7cVCyDJ8iCORud9et+fnqV8kQj8Vfgs7cBFOFrmQs7lwbZTXRwxRyLqbaRUIWVlrvbcjMFcsQqzf/k3k/nZn1D4rx48dh46fj3fJrlAFxQ9OJu4zr3AvyI7iKUenx2MtcghUNSHg+koJxeRO4tvYQTgm7AENHIPD1jko7NO7JxvTWCIWrFDo0N6wamP8q3XmI/BnMHbqymLm5WbbESz9GFppGUR6bjqdckyI68FEJob6M96tRmGYyWy/2HOJKix/xI8z05dcSQrCYNel+UGkVVJX73dY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU4uNYwLr1tyfjNfeTJoH0zWBwXOm+Gm4BOGijSiOjk=;
 b=iBRwverTCaH1auVu08+3XXPhnqwzssgpK4AU1tvj282ZM8EwOFWdJtFko15NBXZ/BRCjSp3+vH0EA5HxWGO3wIHwTgbbjenu5Kx8IlcXlrNeQYAIQyaxV0uF/p0CFaGxmKQvYLOQH1hOaSyeA9eD6IJmW51m8w3L28/O+8Q3DyBFhUHjN8J7j2pOKOVIoXD7zLsP8jgoWEtF05kHNWXpgsmXfWjctsMtfiwE9fzXtXKN7fwEbJOSHADzeuAMZFVAydao4QaiR6Vlwfzy4XEfY2yfdjxFymlqKnux1kbGop7O9Rzv7A6Hi79nByeVx6Z//6S2maTl1sEbaryGO/FHTw==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 PUZPR06MB5934.apcprd06.prod.outlook.com (2603:1096:301:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.11; Mon, 18 Nov
 2024 06:29:02 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%6]) with mapi id 15.20.8182.004; Mon, 18 Nov 2024
 06:29:02 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: RE: [oe] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Topic: [oe] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Index: AQHbOYJ3XL5H54gy7EmVraWl+0rmBLK8kr6AgAAARrA=
Date: Mon, 18 Nov 2024 06:29:02 +0000
Message-ID: 
 <SI2PR06MB50417B0B852669150F1E20D4FC272@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241118062358.283666-1-jamin_lin@aspeedtech.com>
 <CA+chaQcxsswz9iUbaX8rJ8wopwu7ti_DQ+ZLHxS74=spBnwsng@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcxsswz9iUbaX8rJ8wopwu7ti_DQ+ZLHxS74=spBnwsng@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|PUZPR06MB5934:EE_
x-ms-office365-filtering-correlation-id: 2288df3d-9280-4dd0-d7fd-08dd079a4b57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WHNvTXRPSGJQeDlQaGlZc1REVDdPRUZjK3g3VkZ0NEtCOFdOQUtYN0RGaXRz?=
 =?utf-8?B?Qk8xUlQxZi9KeEthcHdiZmtSTHprRG15d3EreXdraGdteUJwU2NjMHR6N1hZ?=
 =?utf-8?B?cloveFZMbFJ2UzF0V2JuMW5UU0M5RmgxcUlFL05ETi8xb1lnSUpYVHJpQjY0?=
 =?utf-8?B?eHN6ak1zY1dZb3hrTkdTMDgzaXlUUVlGSTRJTGkxcTcwQUY3VFpUcUZTZlI0?=
 =?utf-8?B?VmNkMW01dkJQbmtqNVdYbUhPMGM2L08vV0QvTHQxNDBTUjJoLy9qNnYzS1NS?=
 =?utf-8?B?WURocW9vNW85a3pkdlRMZXhtYzdLUmROYnpLd3RLYk9tWng1K0FNODNxYy9i?=
 =?utf-8?B?TkFGeEErUHdyWERHSmpVWHZ4alg5QUNYK3BMTnZ5OUJER0xUbHpmQzMvaWZ2?=
 =?utf-8?B?ZEJJaUNXN0thaUpncTN4dTduZjhLZDRORU5sQ1JWdENwVXdvUU9ta1ZETmlD?=
 =?utf-8?B?b2xJbDdyZXRQSEhyRm9BS01DSTBqblJYQ0ZkWnI3ZExTMmtPdlE5SWo5akpj?=
 =?utf-8?B?bEJabkZ4YnBuY1QxOTZ3aWNLMThULzVrYXE4NUczSFNEOUhVcWphMktmZlRD?=
 =?utf-8?B?bjN5Vnp5NXRGYlp2WnlvcEF0YU4vOTlVTG83L3I1R3J6ZjhVRjJCMWlwZCtR?=
 =?utf-8?B?VTZ2NGZjR3NhcVFHUTdyek1YYzV3dDV6cVBmSm42Ryt1dkF0MDJWZ2ZreGZm?=
 =?utf-8?B?dWVkOUUvbzkwTm4xcG5ycWhBVTA5UGRXVWgvSEIvempXRnN0RUR1ckpreXVJ?=
 =?utf-8?B?T3FXV3ZqUkxLamhsQ1NuVmtqZjFqS1YwTDA3TWsvVW85ZEdRVnNkQ3dTbHFJ?=
 =?utf-8?B?cm5IeTNDSEJ1cUFibEFMVFhPV0ltaTJvOWRFcmRSb1ZPSHppNXpKSGZ4eEFx?=
 =?utf-8?B?bm5neEpwSGV3c0dMYUpYSzRGTGFRMGhCK0JGRVM3VHFyVk55cjFpZHBqV2kx?=
 =?utf-8?B?dExZY0Rlc3dDWTlveWhIdVVKZ3lnU2hiWGpxUDBLcUtaQWQ4U3BhMnZuR0Mv?=
 =?utf-8?B?dmhBT0I0NDdobk9vNmdmVHZtdW5vTlkyT2NwOWJIK21nSWpNaDU1dEdKNXlo?=
 =?utf-8?B?WFB5ckJLNld5VER2aDQxRlROdkJ2TjBnTWJkNVdGNzN1NnFhSWlnaXJMaHJK?=
 =?utf-8?B?RW55L0VSRS9ISU44ZlZVa0pkOGlDRFRodklGT1UrMjBNYmRxRkpqWG9zSS9a?=
 =?utf-8?B?WnVpVm5RaEMvVHJhcTh2OFNWZjgvbU05NkFkY1ErWWVZTEovZ3BZeGNSRGpC?=
 =?utf-8?B?NUYvakcxcEF3YW15UjlzL1BlQUFSamp0N0pqakovMFFpL25LTkdoK3hVVU82?=
 =?utf-8?B?VlZ4YzVNT1FmS3RVVVN3T2JTUDdBY25aajJ1VFJJdXZyMXFKbG15RThHUU1q?=
 =?utf-8?B?VzNhd2pWb0hXRVdsRkpvaVpHS09EVURlcnlCZW9kc3lrcE4rZDZYQXI3ZzZz?=
 =?utf-8?B?TU1VdVFBcVkzaGtYMGY5Wi91czMwdzJjcUJWaEFqbGEvZWVaM25pWU9LZ0Nj?=
 =?utf-8?B?UWM0OHpuOUZoY21vT0QrQWRIM1g3TWtyR2oyeWZwQ01Sek9HSzRRUXlMY0NG?=
 =?utf-8?B?anBnUThodjFKMkIzcHBoa1NmN2kxNDFPbVZQTTE3Y1Q4LzV6bndJVENhY1p3?=
 =?utf-8?B?Ri80OWJpR20xajJrbjN0Ykk2N1dNS09EVDhQM3orNzlmaExsQStLcThRUWFY?=
 =?utf-8?B?WU5POEVLYUlRY01hN3BtS2VqTURzT3pLQldNWFdOblZETVdmUmIrdW85NitJ?=
 =?utf-8?Q?zN6UsHLgYfXbkXnqw+CTJ+R8wGFtKht0+8iZfYR?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UjFveDQ3UVJFMFVSZ3lsUUMvdmVWd0FRNGd5NkhueTR1aUpTNjREMnNVMVpv?=
 =?utf-8?B?SjUzMTAxTnlnVFhFeUo2VTBDMmsxMUpyeXVLTzZwYjVWa2UyTGZKLzBpTGhF?=
 =?utf-8?B?RmJvNXBUYTZQYTRJNHlaMng3RkkrTUp2TlBTTGF1TThmUHpJakJmNytLSUJQ?=
 =?utf-8?B?N0QxN0l6b29vQjFDZWtlNkVodVNFaGZtMEYzVGRiZEtCM1lLZVh0clloRWxV?=
 =?utf-8?B?SDNId2lwQWV1Zk83WUwxMHFiQ2hUTnpGUHZpV1UybllpUTVtN3d4SzJlQ0xX?=
 =?utf-8?B?ejRoVG1SZzR5a2ZHK2o1MlhYY1J0MHFweks0QnBDTUl1aFkrbkZOaEs1Q2dy?=
 =?utf-8?B?UnoyWHZFa1lPVGR2MjRBYjFoMUpZQTVtWGp5aEQyNlhWZE5RbWYrQ1VTSU9k?=
 =?utf-8?B?b0pJOEFGK0NFNERiSkNKSnMwRlgvS211aUZuZGNhanF1WXhOaDBlb3dqK20y?=
 =?utf-8?B?VEtBZzVVdkhEQTFpMmNWVU5WYWFnWjBEaDNaREEwSXZJVWtCMDVyblpsUldF?=
 =?utf-8?B?RlFzWVNJakgvV1dOU3Z3cGFJSUdPM2F5WTBVS3o4ZGJpQjMyZ3hNTC9odi9z?=
 =?utf-8?B?d1ZhTTd3M1I5VU8vUmdIODVzcTFYbTNPYmxFT1FUaWtIOTF2c2M5UzRMNG13?=
 =?utf-8?B?Mkc1MDBNUGlxdVUzWFF5dzRmWGIyQktPakNtaEo5RThCYnNBQ0tKWExRUG44?=
 =?utf-8?B?Mis0UzQwZFdaelc1cTV1WEFIb2JnaGhlWTJxNkwyeEZISkZ4L1czSmY0RlpW?=
 =?utf-8?B?SGJZYnBNSmQzWkxaU0pWNWJHbzB0d21jVFJMdkxrVGlRK1pkSy9KUWVpZThS?=
 =?utf-8?B?SkFJL3hJQ1FPZXVSOTBNdmdvSk1LdnJFNmFWNWwvdmIzbU9waVYrTVJGRi9M?=
 =?utf-8?B?STJaV2FWQ1A2YTZvYTVkbXZSdnNMM05Ncis4Nmd4NWM4V0QzMlpzQTlvUEts?=
 =?utf-8?B?RUxjNStEdEphRkxDcXJLRjRveVBXYStFTVE5bndXckZTTEk0cXBpVmE3dnFh?=
 =?utf-8?B?RlBpY2tEM0Y3dkFjYzV1bVlGR28zZ25sSHJxNFBUMVZnUkVQS3RWMDlVNWVN?=
 =?utf-8?B?M1lzRWYyUlVsZThvbjU0TTNWbXRQQU5XaTFVZ0J6a293cXI0T1ZwemNSQ3FT?=
 =?utf-8?B?NGJDYzJRclpGZS9OTkJxVlZRTXJJMk0wVU4zbEJ2SEsvR1EvSkxZSDVrYnd5?=
 =?utf-8?B?NjdGVU4yMkw0aW14aERrU2ErejJtQUorRXV4ZTJVRnBTKysyRXdVc2Z5dlZK?=
 =?utf-8?B?eGs4SGlDNktYejN2UGtGdnova1Q3OXZaWjBBcHJ5OVl5cUZvNzV4RFBCYXBW?=
 =?utf-8?B?eFlrbXFldTBkVHdSN1k3c2ZqTDFhVGdvcHMvb2swYlIvek85N3haZ1pwbDJ6?=
 =?utf-8?B?QUpPUDltWDluaGlSQUlyZUlPOU80YWpKdGZPS2tncy91cTdZNFNISTBZTXBv?=
 =?utf-8?B?dCs4c21XUHJEUFVrakVINkppQVVQQ0VvRjEzRDA3SGt3TGRvNmVpVWI0bUhm?=
 =?utf-8?B?SnJuODZQKytkME0wZGFEUU5YS0RIRWRraHRENW9PSFFoSFBBNGVrZnh4U3Jk?=
 =?utf-8?B?ZGdKUGloUkxsNHNleHd5M0x6TWxycjJOWnJxNkU2d20ybEtPK0g3dlJ5Vnli?=
 =?utf-8?B?M0MvZUIxdzY4T1hEeGVYYmYzMlZsSGcxOUY0bjkwN3hlcElOMUsvQ2V1azFW?=
 =?utf-8?B?VWFVTDZZU2xHdVVPMDQ3OCs5RFFEZVkvVkFMUG8rVmFLaEJVNDZ0MDhGVERE?=
 =?utf-8?B?OU9FL05kOHkzVndQQUZWTWNYVWlRVUpycDRhN1Bqc3Z2NGtaUGlMMEdwTmxX?=
 =?utf-8?B?VDIwVmc3SzFkdW5yZlFZRTZsZHlEUFg4aFdVeWJXTGZISGp5THEvUG1mcTJw?=
 =?utf-8?B?UlBJOTU2SGtTelZhcHQ5bGxUSTBycDdsakJWTktRcnlCYTF1VVJrazc5SEEr?=
 =?utf-8?B?Q2RyWmFCQWJXOGxRVUttV04xaUhiQ2FDTXowak5tQmFKZjVqMGFFV3BqUGVG?=
 =?utf-8?B?UmhFemdqQklpYVpNbFRMenpRZzQ2UUxvMHlXTWphUEJBSUNCaVdVemJNWjla?=
 =?utf-8?B?aUUyeFAybzJ3SWtrRWtNcW5lUEY1cFNIekpHaGV0aEwwWU5sR3RXNEd4d1o2?=
 =?utf-8?Q?rACTZCHcX9zZkVlYNjyAI3212?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2288df3d-9280-4dd0-d7fd-08dd079a4b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 06:29:02.6325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oC5ogtuTEeO6i9KMEdsC1lGg4Zn9N6si0/eUZxPsHHsDyyNDy3BGoQvNQo4DqSu8rs3ZQGMN4OQEI0p9HMoHH2zMsMh6XzLU05/9keTo8Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5934
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 06:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113862

SGkgTWFydGluDQoNClNvcnJ5LCBJIHNlbmQgdGhlIHdyb25nIGUtbWFpbCBhZGRyZXNzLg0KVGhh
bmtzIGZvciByZW1pbmRpbmcgbWUuDQoNCkphbWluDQoNCj4gU3ViamVjdDogUmU6IFtvZV0gW1BB
VENIIHY0IDAvM10gdWJvb3Qtc2lnbjogc3VwcG9ydCBBVEYgYW5kIFRGRSBJVFMgZ2VuZXJhdGlv
bg0KPiANCj4gd3JvbmcgTUwsIHRoaXMgc2hvdWxkIGJlIHNlbnQgdG8gb3BlbmVtYmVkZGVkLWNv
cmUNCj4gDQo+IE9uIE1vbiwgTm92IDE4LCAyMDI0IGF0IDc6MjTigK9BTSBKYW1pbiBMaW4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGphbWluX2xpbj1hc3BlZWR0ZWNoLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IHYwOg0KPiA+ICAgMS4gYWRkIHZh
cmlhYmxlIHRvIHNldCBsb2FkIGFkZHJlc3MgYW5kIGVudHJ5cG9pbnQuDQo+ID4gICAyLiBGaXgg
dG8gaW5zdGFsbCBub25leGlzdGVudCBkdGIgZmlsZS4NCj4gPiAgIDMuIHN1cHBvcnQgdG8gdmVy
aWZ5IHNpZ25lZCBGSVQNCj4gPiAgIDQuIHN1cHBvcnQgdG8gbG9hZCBvcHRlZS1vcyBhbmQgVEZB
IGltYWdlcw0KPiA+IHYxOg0KPiA+ICAgRml4IHBhdGNoIGZvciBjb2RlIHJldmlldw0KPiA+IHYy
Og0KPiA+ICAgY3JlYXRlZCBhIHNlcmllcyBwYXRjaA0KPiA+IHYzOg0KPiA+ICAgYWRkIGNvdmVy
IGxldHRlcg0KPiA+IHY0Og0KPiA+ICAgQWRkIG9lLXNlbGYgdGVzdGNhc2VzIGZvciByZXZpZXdl
ciBzdWdnZXN0aW9uDQo+ID4gICBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgcmV2aWV3ZXIgc3VnZ2Vz
dGlvbi4NCj4gPiAgIExpbms6DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsueW9jdG9wcm9qZWN0Lm9y
Zy9wcm9qZWN0L2RvY3MvcGF0Y2gvMjAyNDExMTgwNjIxMTMuMg0KPiA+IDY5MjUzLTEtamFtaW5f
bGluQGFzcGVlZHRlY2guY29tLw0KPiA+DQo+ID4gICBUaGUgZm9sbG93aW5nIHBhdGNoZXMgaGFk
IGJlZW4gYXBwbGllZCBmcm9tIHYwIGNoYW5nZXMuDQo+ID4gICBhLiBGaXggdG8gaW5zdGFsbCBu
b25leGlzdGVudCBkdGIgZmlsZQ0KPiA+ICAgYi4gc3VwcG9ydCB0byB2ZXJpZnkgc2lnbmVkIEZJ
VA0KPiA+ICAgYy4gYWRkIHZhcmlhYmxlIHRvIHNldCBsb2FkIGFkZHJlc3MgYW5kIGVudHJ5cG9p
bnQuDQo+ID4NCj4gPiBKYW1pbiBMaW4gKDMpOg0KPiA+ICAgdWJvb3Qtc2lnbjogc3VwcG9ydCB0
byBjcmVhdGUgVEVFIGFuZCBBVEYgaW1hZ2UgdHJlZSBzb3VyY2UNCj4gPiAgIHVib290LXNpZ246
IHN1cHBvcnQgdG8gY3JlYXRlIHVzZXJzIHNwZWNpZmljIGltYWdlIHRyZWUgc291cmNlDQo+ID4g
ICBvZS1zZWxmdGVzdDogZml0aW1hZ2U6IGFkZCB0ZXN0Y2FzZXMgdG8gdGVzdCBBVEYgYW5kIFRF
RQ0KPiA+DQo+ID4gIG1ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzICAgfCAx
MDAgKysrKysrKy0NCj4gPiAgbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9maXRpbWFnZS5w
eSB8IDI4OA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzg3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IC0tDQo+ID4gMi4y
NS4xDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBs
eSBPbmxpbmUgKCMxMTM4NTcpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExMzg1Nw0KPiA+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwOTY0MDA1NC8zNjE3MTU2DQo+ID4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1kZXZlbC91bnN1Yg0KPiA+IFttYXJ0aW4uamFuc2FAZ21haWwuY29tXQ0KPiA+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

