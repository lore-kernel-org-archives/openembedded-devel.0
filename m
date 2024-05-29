Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58232C27C44
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 17:55:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web10.22300.1717005336492443902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 10:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=B9d5FTmx;
 spf=pass (domain: axis.com, ip: 40.107.22.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+dg3jz7hb+poR2SSFZ2A7El6/s5e+RnYNkBacWLZXU2z0tRiz7jpQPtgNQMp5YqXTor0keuLkzBIM5kPC5Mvo3ONWwxZOMYzJ5/yI4h+bLb871ODSqV4o27qYO4u27v743zIGkGKVQfmbBAsAdh9flRmFq7l4ELa3cOHBMQKDn6mz+5gzaG7qkbVMXnBLWuVY/nDDuEJb0KR9uBHi9HriTH4BTqpYc4vGQAMhdhbAg+9XPiNUYzUayi8CHe6CrWMwgFv4MbUC0MXiC4GpMpruv8OUMb1qC5BGfu8FCis8+8F1BhPMyg1oZJ+1oYceWoRWR26WD6Bx0s4k8C/qPLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2P3iZ4L/Ux+dFe6YhFnfgrRwrjny62gbuuMADjhbYQ=;
 b=YdyrNH6azZULTvgzpVPH1Jy2dSQVPCp6JdjvMCrKJPaTxkLDPAqYvN9YsHkSQCgwyYnEK53sswBld6N/Dwz0DFcUlYyv+UytUnkxgW5E6nHbNgOWaBmDseZzS1WtQl8So10y8bIEy5lh0Nc7saiqeUTzbaZNAAP6VOw0N+A2E/b/WA2//tEZ5IofKzxYOCpkvYBb2HqJyCctI7v0WtQNP+hzM6udX/aS/PWJbY+yNZa29jnntrCG+VIGy7LyNMlZZdRKpZbVSSAYyd8aVUUWDShsDJykQa1T9g4bR770hVcd5CpYABEzv4qC5Fu0Qc6DGRw5etw4b1HpddFYW5en4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2P3iZ4L/Ux+dFe6YhFnfgrRwrjny62gbuuMADjhbYQ=;
 b=B9d5FTmxxFZLC6k8dgRtDosRnnRbJotkZ/VODC1weV2q3i8X9wdE3f6MrJzgBRh2H/Bar+bqVufJVdGzK/CBFjvwxPfJBvPlctp/+Vy8d+DeFUqNbXkFZFYM4etpswRSp50mGrsdB1ED2XkqnmxRH6wQn9vqS03GYDbkDVv40s0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA6PR02MB10589.eurprd02.prod.outlook.com (2603:10a6:102:3d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 17:55:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 17:55:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 ->
 2.03.24
Thread-Topic: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 ->
 2.03.24
Thread-Index: AQHasKFI4+MxwtnCO06vTRuZxaaeIrGr8ofggAJsDgCAACAy8A==
Date: Wed, 29 May 2024 17:55:32 +0000
Message-ID: 
 <DB5PR02MB10213AEEE0757282C79056BE5EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
 <1716860901-863-9-git-send-email-wangmy@fujitsu.com>
 <DB5PR02MB10213DE423CD73656BEC16800EFF12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1sp78ZV-LeA=gLkAC2cJF90PL296L6O+pg8ZgEbNnxrOPQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp78ZV-LeA=gLkAC2cJF90PL296L6O+pg8ZgEbNnxrOPQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA6PR02MB10589:EE_
x-ms-office365-filtering-correlation-id: d2622027-5539-4c46-8910-08dc800888f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SlBrazg1Uno5VzVPZytjZjRKWmp3QzQwY3NrU2FIUGsvclBNWWxSSDdEdDJn?=
 =?utf-8?B?K1JtZEgrTnJodkRNQURNZzV5OC9CUmN4ekZodFVsVDNaMGRVUndQZG03bitR?=
 =?utf-8?B?VE51d0JuT1ByUy9FVDBVR0ZYZWhEOGdUN0RxT0VESFQzVThpaWhHT3c5VStl?=
 =?utf-8?B?Tkxvalo4ZG5FZHppMFFSd1FOTWNzRnpRTk4yZ1ZQUzBTRHZhWHJYYnhVb0dF?=
 =?utf-8?B?bjZnR0RReXptd1lyNUFRa1J2RERuN3IyY0NSeVJiZjFCYW9pSzNiY1lEU2tI?=
 =?utf-8?B?WnpqdDN0YU91aFBnK1ovV1ljd0IrdUhqT0xoamo0ZVlyOVU5MldYdlhMdGJX?=
 =?utf-8?B?bG45MWRUa2F6c05JOXpWRnNmc1VkUjcwQ1lNKzJndnBXK08rbFBkWVdMWjZ2?=
 =?utf-8?B?T0NCMnNvOXVkSjhFL0pYZEgrSU8yQVZoemxQVUo3UU9OMDVRejQ4eE9qVzFI?=
 =?utf-8?B?KzkzK0l6cmN6S1dra045WCtJMklGcys0MiszZzZWa1VBbmRaYjFWc0czWjNo?=
 =?utf-8?B?MlE0emR4N0lmOGZnRUd3cjE2c0pXbDk5LzlqTXNNVHN6L2tYdDJOeE9GSzAy?=
 =?utf-8?B?MXhRVld1RlVrQVhDWDNsVGNMbk45QmFDR0NONHlpN2lQck1XM3R2RDNXVkt2?=
 =?utf-8?B?M3crTXRVaUxmZ3RGL1JCTmxmSmxVdTJlWHp4QjdLWWhkckphdXhneHJtN0No?=
 =?utf-8?B?N1pkK0xhbHBnajZyYXBraUszQWhoTzFHWXlOYitGbGg2VjVwR3dKYi9rOWll?=
 =?utf-8?B?eXpwSW55ZmVIWlpRT2kvMUFJanZzQ0Nyc0VYanMrVHNTWVVETCsrZHFjc0J3?=
 =?utf-8?B?UjJITDFaYUpGb01ZOWFINC9iL2lrWUh3K0k5NXNCekFjOXZEajFZeXo5cXdq?=
 =?utf-8?B?VW5kZmMxTGJ5ODQ2ZXVRTStBNG44dFAvbmJSWWhlVUY1bWg2bitvUy84TUVz?=
 =?utf-8?B?Q20wUitnSjZxVWdHT3BZeWRUOWliS3JmNEd5Smt5K1FQamR3SmJLVmlsUEc3?=
 =?utf-8?B?cHk1NTFPamtrV1FpNitVTFBWcFFYeldNNE1QSFplUXZJblpPMkg1TWNrd0JR?=
 =?utf-8?B?eHZSdGtYQUg4bnRRdm8xYXlIR0Q1THYxRUdjOUY1NlNGdzhpTkp2Sm9pRHdW?=
 =?utf-8?B?djgyN09nNklOd3huM3lVdlNIaThVTlRJb2NQd3VjcVFWQ1pnbjZDNEtvVWdL?=
 =?utf-8?B?aFYzK3dNNTVXU09zZ3pKbUlaUWhjVEhiZUlTdVBlbDFTQ2FNTnRGNHdqenhS?=
 =?utf-8?B?TjVxM3orUll4Tm95S1loNWdzcExYQlZkcS8vcWR0d1p5M2RXZW5OZUI0QzY0?=
 =?utf-8?B?b2FkUXpWVmRublZjK29GVEtKSm13VGM5VlNuWG1Rck0xMTE5bGcraitBaXk2?=
 =?utf-8?B?UG1EcTlRcTdsdzhLNUl1MXNzQzI3Yjg5enFNeTlYTkhKVjJIQmhWUXZ4VUF5?=
 =?utf-8?B?WXpWdlRoM3NuSFZlOXBqRkxrRnZKMVdDL1VrbHdBbXdGd2JVMGlrMjJ0QWdJ?=
 =?utf-8?B?UWZhSytrRWlNaUlBb0xQeXBNdFdiTkxzeEdZTmRkSmNwZ3pGeUVKbHNJRVVz?=
 =?utf-8?B?ZmM0WFBLZTVVL0FiY0JyN0ZldlFaSjhtc3F4YmtHeFI3WGdVREdQUG9TY05P?=
 =?utf-8?B?N24yM2p0cU5GaVVlenhSaFVRVGJmY2FWdHN2akk1ZW9YWnpMdlMvcktkcy9V?=
 =?utf-8?B?czBPL2dFUzNiWTFMNzFEMmlZZVpqaDZGWEJyRVhkU2FjaVZ0bnVxaURaK0xp?=
 =?utf-8?B?ZExBYlhsa2lqbTFnMkZQeXIrQWV0R05CTkZ4T0w4TVlyTlpHeUJwZ2RlT1B5?=
 =?utf-8?B?dXU3QTlsODZ2Mmc4QzNQUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0RMbmFwbXZsKzlacEVjWFdaMWpiRDRwZThnYmR1a3dXbEkxbWZWdFZmMENL?=
 =?utf-8?B?ZW10ZUZUbVQ1ZVVrTy9MZ3pTYk5GakgybFRWZGN0VWI0cFZHckh1VHdmclhG?=
 =?utf-8?B?VkUyRW5kZkkzZXRjbVFPaTJ0S3JhT3VSMWMweFVOUUtjMG1wdUI5MFN6Z01l?=
 =?utf-8?B?bldFRTRkblNldHFaZ3czby9RQ0NtaWhrUjk3RzFyd3NZUHhwVUR5QkR5bTJB?=
 =?utf-8?B?MU5yVmlVU1NML3hlSjBYYlB0bllyMEZ1YjlsWDZHWGpTdlF3ak1wc0JuY1Zi?=
 =?utf-8?B?cWZseFkrWnQvS3E2aHlxZ2c4allzakd2MWh0SVBhbW1uT09KZklDNHVTVm1u?=
 =?utf-8?B?MHVsZGtlS0lwUmZCNTdOTUpSMmh5WEZCNXFUSDFXNXowVWJVNittcUEwM3A0?=
 =?utf-8?B?UVVnbTFzdnhZWHpQMGpnejlSa2JaY2I0d0FEdHZZSFR3NWJ5OVlIT3E4a2o1?=
 =?utf-8?B?VG93S29WZDQ1cnVwenJEb0NsK1N5WmtXTzNQRytmWDJNN2dyOTJseHdXMmxH?=
 =?utf-8?B?MU5hSFpwdW5WNHVZSkd1WWZldXZ1RHBQUGVhaUZFWjV5OERvRDV4aksyUDdJ?=
 =?utf-8?B?c0tkbTEzUE10TExpalRaOXV4L0ZRbHdET3RXcFFtQlk4eHp2eEU5MWRyRUlK?=
 =?utf-8?B?WFhjQi9hc0V2Skd0TU9qdlRDVTYyTCs0MlBwMmFZc1ArbDFyN3NRUzltdkpJ?=
 =?utf-8?B?N3VVQVNFay9RUVRBZTNtdlhGMGR6ZUZNamxWUGU1RGtITFB4bzF0OEFZNXNw?=
 =?utf-8?B?N0hTZ0RuQVVDaTFsbTM0bjB4K05BL2dpb09jSE1ONVZBMVBJOXUzU1g0aC80?=
 =?utf-8?B?V0RwTGVnanBhU0wyRytIeGhRNzVQVWovS241aFMzZXhUS1JscFVmVFFWaE9R?=
 =?utf-8?B?SlJOdElpb25ta0dhekNKNHR6Nk02N3Q2RFFFdnc5c3JyR1ZyUnhKTlhZVU1F?=
 =?utf-8?B?TEZBaWRPaFRNZlN5WktHMUphaFdybEpnai9hUEZSV1gxR3U1ZGNqTzlCQ29W?=
 =?utf-8?B?RnhQWlY1cy9NNGJoVmxlM1dhczFrZnRZMTl3WGJ1RnAzNFFOY2hoeDVFaEFu?=
 =?utf-8?B?akNEZ0RrOCtzU2JMRmZPeXdHbmlESTV4aWlVNm9mQTZ1dmIwTkptbjQxK2Iz?=
 =?utf-8?B?YWcrbCtCejg4U0Y5aHI5eUdYWlNCcDZQRUZ3b3d5WU1pL1VHRFU4WmNMaGhn?=
 =?utf-8?B?U2pHdUtETHJkcXQ3UUVmczlSNlVjWFhWZEdEUzFwN1kzT2poS1k5UUZqOVQ3?=
 =?utf-8?B?cHZXTjVOZmVQRkdUQ1dmVjZCenUvNEd6UnZiT0plU2drZjdTWjBDK0I3eHp0?=
 =?utf-8?B?QUU3amlLYVUwRWNwR0swclVTdjlzdXBVWVU5bUlSWDhKOFJXcEh3Uk5jTEZu?=
 =?utf-8?B?SVdmZWFVaW8wVm9mUE85clFPbzJPK2FHZDVJQVlScGN0Sld5bGFsRHhwZ2Nw?=
 =?utf-8?B?MGxVc2VreVM3b09YUTF4RE5lWVArMHlwcytISWZLSjRlY1hmU292ZmFHSjRk?=
 =?utf-8?B?SXdBbXIyVldhYjhZYWQ2WkRUOGVWRUpyKzBzZm0reHQxMDdwUmRyOFlnVVpk?=
 =?utf-8?B?SlRWWitnVWp3am9WRVVUcTIyRW1iT3l0dVFWQytkU21lWHFFK04rdTYxQlJU?=
 =?utf-8?B?WmhubXNtcnhQVmRWWlJodjRTdnVVNGEwYmFmRVN0M0pIdzI5T2xaWnRmZlB6?=
 =?utf-8?B?SFkyVTRDbFRTRngyOGhXMndwVkZQdjJOUXljcE1ZUUNsZ3YyUnM5N2VuYkVm?=
 =?utf-8?B?dlVlUlp5Vmx4N1ROdC9Bc05GWitIMlJva3JJRkVCdVNzdEhSZHZYbjdIR012?=
 =?utf-8?B?enVrdW54STJ3QTdOU3VOWmlma1VmVm90U3g5cTl6S0dWNkN3dFJKUVJaRjRl?=
 =?utf-8?B?cFRGUzdHTXJ4ZXJUck9VZHNWbmZ4UjR5L3JhdlZwa1VZRmo1MVdMTVZGSENH?=
 =?utf-8?B?NXQ5OUZoYkZqNTJHeWJIUTVKaGNvcmxoQWswS2VuYlhxak1waXgvdDIxMFNQ?=
 =?utf-8?B?cEhKSFJWRjNLbjFvWHREd29hSDZPZFc3S1o1Y2hoZU8zR29NVFhvM1U3N2hD?=
 =?utf-8?B?ekNPaWJtTzM3ZHJzM1EyQkhURHlndlZZVmtLZW0yZXd3SjhGSlQ1YXZWWmho?=
 =?utf-8?Q?l3kU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2622027-5539-4c46-8910-08dc800888f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 17:55:32.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tfj987BkiGhywItBCK2tOcnecvBXgU8oy/cIySUdvlzIQ2QXmFKylQJBEQcLhDl3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10589
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 17:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110617

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMjkgbWFqIDIwMjQgMTc6NTANCj4gVG86IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogd2FuZ215QGZ1
aml0c3UuY29tOyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV0gW1BBVENIIDA5LzQwXSBsaWJkZXZtYXBwZXI6IHVw
Z3JhZGUgMi4wMy4yMiAtPiAyLjAzLjI0DQo+IA0KPiBPbiBNb24sIE1heSAyNywgMjAyNCBhdCA3
OjUz4oCvUE0gUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxw
ZXRlci5ramVsbGVyc3RlZHQ9YXhpcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiB3YW5nbXkgdmlhDQo+ID4gPiBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTZW50OiBkZW4gMjggbWFqIDIwMjQgMDM6NDgN
Cj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
ID4gQ2M6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gPiBTdWJqZWN0OiBb
b2VdIFttZXRhLW9lXSBbUEFUQ0ggMDkvNDBdIGxpYmRldm1hcHBlcjogdXBncmFkZSAyLjAzLjIy
IC0+IDIuMDMuMjQNCj4gPiA+DQo+ID4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0
c3UuY29tPg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vbHZtMi97bGliZGV2bWFwcGVyXzIu
MDMuMjIuYmIgPT4gbGliZGV2bWFwcGVyXzIuMDMuMjQuYmJ9ICAgfCAwDQo+ID4gPiAgbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0yLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQ0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gPiA+ICByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi97bGliZGV2
bWFwcGVyXzIuMDMuMjIuYmIgPT4gbGliZGV2bWFwcGVyXzIuMDMuMjQuYmJ9ICgxMDAlKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2xpYmRl
dm1hcHBlcl8yLjAzLjIyLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9saWJkZXZt
YXBwZXJfMi4wMy4yNC5iYg0KPiA+ID4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+ID4gPiByZW5h
bWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2xpYmRldm1hcHBlcl8yLjAzLjIy
LmJiDQo+ID4gPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9saWJkZXZt
YXBwZXJfMi4wMy4yNC5iYg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L2x2bTIvbHZtMi5pbmMgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9sdm0yL2x2bTIuaW5j
DQo+ID4gPiBpbmRleCBkOTUzNjZmOTcuLjAzNTFlYjZiMyAxMDA2NDQNCj4gPiA+IC0tLSBhL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMNCj4gPiA+ICsrKyBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMNCj4gPiA+IEBAIC0xOSw3ICsxOSw3IEBAIFNS
Q19VUkkgPSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L2x2bTIuZ2l0O2JyYW5jaD1tYWluIFwN
Cj4gPiA+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2Vu
YW1lLnBhdGNoIFwNCj4gPiA+ICAgICAgICAgICAgICINCj4gPiA+DQo+ID4gPiAtU1JDUkVWID0g
IjAxNmU0NjljYWY4NTZmMWViOGRkZTM5ZGYwZDFhYTJlNzQyMjVhZWQiDQo+ID4gPiArU1JDUkVW
ID0gIjkwZWMyY2Q5MmY2MzY3YzQzMWRkOGRhZTU1ZDBjYmU3ZTE5NjczNGYiDQo+ID4gPiAgUyA9
ICIke1dPUktESVJ9L2dpdCINCj4gPiA+DQo+ID4gPiAgVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAidig/UDxwdmVyPlxkKyhcX1xkKykrKSINCj4gPiA+IC0tDQo+ID4gPiAyLjM0LjENCj4g
Pg0KPiA+IGx2bTIuaW5jIGlzIHVzZWQgYnkgYm90aCBsdm0yIGFuZCBsaWJkZXZtYXBwZXIgc28g
Ym90aCByZWNpcGVzIG11c3QgYmUgDQo+ID4gdXBkYXRlZCBhdCB0aGUgc2FtZSB0aW1lLg0KPiAN
Cj4gTWFya3VzIGhhcyBwcm92aWRlZCBhIGZvbGxvd3VwLiBBbHRob3VnaCBpdCByZW5hbWVzIHRo
ZSByZWNpcGVzIHRvDQo+IGRyb3AgUFYgd2hpY2ggaXMgbGVzcyB0aGFuIGlkZWFsDQo+IGJ1dCBw
ZXJoYXBzIGl0cyBiZXR0ZXIgdGhhbiB3aGF0IHdlIGhhdmUgdG9kYXkNCj4gPg0KPiA+IC8vUGV0
ZXINCg0KV2hpbGUgSSB1c2UgdmVyc2lvbmVkIGJiYXBwZW5kcyBhIGxvdCBteXNlbGYgKHdoaWNo
IGlzIG5vdCBwb3NzaWJsZSB3aXRoIA0KcmVjaXBlcyB3aXRob3V0IGEgdmVyc2lvbiBpbiB0aGUg
ZmlsZSBuYW1lKSwgSSBkbyBzZWUgdGhlIG1haW50ZW5hbmNlIA0KYmVuZWZpdCBvZiBoYXZpbmcg
Ym90aCBQViBhbmQgU1JDUkVWIHNwZWNpZmllZCBpbiB0aGUgLmluYyBmaWxlLg0KDQovL1BldGVy
DQoNCg==

