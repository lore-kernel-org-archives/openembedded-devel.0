Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559F5C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:34:14 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.36])
 by mx.groups.io with SMTP id smtpd.web10.8418.1750516451508923261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=e3PHULIg;
 spf=pass (domain: axis.com, ip: 52.101.66.36, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RejgPX3Jh6Xz4IQjzP5giKoUNxBjcrS8PLVV3fxUuBZKiPiTKIaanrY62IsiTDn1HF67OJhnienzT9/02q5/9R2MWeEwA6ff7N/zqFtGYyhMYh2OTU3gbwcIDeWDpMRe5YWL8SzJ/PmPZTOmIWAGGqLQLvj95TM/lr743Z6+cPtfrjZ/XW2f6CkjroZB1SdmUkbzMbF9oK9eJNWOUy/KF/XAAdl8CJ4YwHEXqVmtcdUd1zlKBE9wR70ovH0y/rb0HCgiYSXhEelbE4wCXO243pJhlbzpt65pvXR5V+b7qXCSCfIJFieNOicfWOV+zM6OaTU/MkgVdpxyhUCVT0EZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fjqyHeT5afmgpeOw8YaMXHDnFp+XWUIahWGcffJFdE=;
 b=TcaFGwnbGtRu8wDm1VGX2njrFqdRsMtpa+mkvnx/GmfwqcRkIdtEVf05AXfvW43ufPEyIlSQe2wrje2MJu51yJtnnVX0uWUc5SxjUMRsmo6RYeIvq3XZWe45Um0Y4JfT/W2tMgANvnYEyfVgJVBPlqBoeTzMhArrBRlTeaIjezV+E/Zy7RSkvGU1UkzAGvkVpjMgyjqEwL5I4myx2CI1z8M9usVx95WfOUWNsueWyOGBthsr+KqSdoT3e73wMnkxePtHZcSKlUEYOELsAX9+LQQ24/deKoMf6laCXMQvlM8aBciFohB7vqU58yCc6Y3S8duvF1mOZZbyR3myE/Agzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fjqyHeT5afmgpeOw8YaMXHDnFp+XWUIahWGcffJFdE=;
 b=e3PHULIgCbKE0vBopSrf74AqHVm5XdJocoMtskU+2GKgFfPKMTuqRJMgvYt9eI4jHFKK5gayMXipgqFqlnZS4oCXY8WYVpj7JCT3P0tm9u0/LnNrZdvnbk0VOhME/NikQIP3Kg35jm0WjvxpmYpgkDS6H2/ZQvi4SdHn+dQcx/k=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAXPR02MB7197.eurprd02.prod.outlook.com (2603:10a6:102:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sat, 21 Jun
 2025 14:34:08 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 14:34:08 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>, "alperyasinak1@gmail.com"
	<alperyasinak1@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Christian Lindeberg <Christian.Lindeberg@axis.com>
Subject: RE: [oe] [meta-oe][PATCH] crucible: Allow network access during
 do_compile
Thread-Topic: [oe] [meta-oe][PATCH] crucible: Allow network access during
 do_compile
Thread-Index: AQHb4ow7QtrVCPGsSkCbC6JyiBXZqLQNd8WAgAAy3zA=
Date: Sat, 21 Jun 2025 14:34:07 +0000
Message-ID: 
 <DB5PR02MB102130D766B46F2608CF94B94EF7FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250621090926.1466318-1-alperyasinak1@gmail.com>
 <0123aa94-7e4d-46db-a7de-84af5cc7e407@gmail.com>
In-Reply-To: <0123aa94-7e4d-46db-a7de-84af5cc7e407@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAXPR02MB7197:EE_
x-ms-office365-filtering-correlation-id: 4dd437a5-b43c-477a-c901-08ddb0d0ae47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aE5XMEVrclZmS2hvNEc2VWZQVzNhL2M3eWI4SVlWQ2xXakZRYmFMdG0wblI2?=
 =?utf-8?B?Sk9qemhjSHphYmZnVkRmQUt0WlZpU2xOSW8yRjgwMzVpR3JNNXlXdnFBbnVk?=
 =?utf-8?B?dGtBbjhSUlZGTTZ3Y3MzTTV0Zy8xeXhtdkczdmJBM0ZhdDh4cGxqWnUvTTFm?=
 =?utf-8?B?aXhYUGh5L2VnVjhqZ3lib3JROFFtcFNsb004eGY5czQxbTQ4ZjJ6OGNJdTRl?=
 =?utf-8?B?UDNiOE5ORkJ0SXlsREkwTTB1aWlYcjhZZDEvcjd3L3hrOFhtaEZGQmw3NXVR?=
 =?utf-8?B?ZmVVM3d1RXBoVW9ZYWZoYTl2STZ3SjRTZ05ZNzRlNHZxa0Q1OUhhN1poTjZR?=
 =?utf-8?B?cXRuK3F6NjB6SURLcnVxSTZ2eDNDM0daUkM2Z0hjMUlxbmFqWEcxbm1hYTJo?=
 =?utf-8?B?RTlUdXBoZkM4YVNhZ1pEVDdVRVVSV2c5VXkrcHBVcDM3b0FOYnloV3lad2RX?=
 =?utf-8?B?bUJMLzNJYU9sNHhPREJzTHk2aGdyVXNUNjJkZlNuQ0pzY2I3MEQ0Nm9MMTBI?=
 =?utf-8?B?QTczdU0rRjkxZ0t0NFl5YVdrbkxhZHhFNVZhdmdzTHIyTXYzUUQ2aXJjSXBY?=
 =?utf-8?B?WmxIRVI3Mm16alZJT1UxeDJmeW9MQm93NlZxcndVMnBHdm9meW1PZ2ZRd0k5?=
 =?utf-8?B?S2xvOFo5WmJPWVlrOTJUd1dqb21OSXlsSkZ3dnUyVktYUzR4Ny9rUStOQWlT?=
 =?utf-8?B?RE8wa2ZQdmtCMXhaYlNZMzB0TFRvTVNuMGVSa2R4QmJCclpaWDV5NVdld2Jr?=
 =?utf-8?B?a0YrU1h2QXFMclA5STJ3ck0wMUdpMXJaUm9BbzVPNnZqaWdmdjdXSFlOVjVU?=
 =?utf-8?B?bU5KRkw0dkJqMmFScnhwSVd6enI3YzZnMitxVyt6TkMzODcyZk54ZE1xOEQy?=
 =?utf-8?B?UkZuWkxxcldMUlIwZkV2QncvV2c0UStkWFpobFozV2NGdEJQbkxINTNSQ21T?=
 =?utf-8?B?ODR1Z1NYMGtQRk5XaG44VGV5MzN2WDRsYXRoNUZLL1JpcFhJc2d3bm93ZGFC?=
 =?utf-8?B?ZW9pRjZyNmtWd1ZZalloYW9YUThhZnc3VDhISFNTTFM4d0NNOXByaDFHZ21m?=
 =?utf-8?B?U2VZeHllMWE1RzBBa0VFR25pdVJYdjQzU3FQdmFkQVM1VEJmMmoxUVZlOHVM?=
 =?utf-8?B?TklmY2FVeHRCekJGcmIvRHl1Vi8ybko3MUZGVGVzdWF5TlJESDJmL0xONDFG?=
 =?utf-8?B?M2J4NU5kREYyYjBqdWRXdndDdU5tdFBscENNdDV5NStLYUlpTXRSNlZTUnBJ?=
 =?utf-8?B?czRjNDBZMTNFeHMxekRtbEhoZzk5TGFkT0dJTVZEL1JJV0QrK1hTRFhOYnJC?=
 =?utf-8?B?Vzg5emsycUY0Um92VGhnOFVOQzNzTlM3MVlsMHhhY0pUdUhySEVRd25SWno5?=
 =?utf-8?B?QUlPL2lsSVByaitKV3JLZ0srN2ZzcGE3RVMxeDNvdHJCQnA0TW5IcGFmdlVw?=
 =?utf-8?B?YStrZGp4NGlNSVpQbnV5M09iM09mOVB5SzF3QnJ3S1dkZHprNTJXbU8xNUN5?=
 =?utf-8?B?N21DVlRNL1B1NGFycEhibk9BSDlNSmhHbE5hdFJBWlZXL0xDOVM0V1J4aTUr?=
 =?utf-8?B?NWVMRGoyRGszVEFTWWc5VldYTUp2V1NicmtBR2hyUnZyVFpBblpXODduSVlx?=
 =?utf-8?B?RmlMNnZOaUE3a3hSSE5SWUlhaFFBV0c3OXExOWZRY1JhdkxBNFFYc3cyTkZ1?=
 =?utf-8?B?ZGtjeDBQbXJBQVQrRWdEN29DenRCM1c0VGNBSThiZWVGV1FWcU5jZVRZQW1m?=
 =?utf-8?B?V2hMbnFLNE9aTkhrUk02Um5nY0JYU2MybjVpeDE1WDZDV1BGcm1hY2VhdHEv?=
 =?utf-8?B?NjdFRzJ4QnV4VHMvM2JGUUtVRml1UWFiSlB1VUxqOUFPRjRxbyszQ0toRXRo?=
 =?utf-8?B?UmZXNDVHR0pheFdla0RNMWRMMHUvMVhTaFk4dERqZHZmbVFXUWt4TnIzWUJL?=
 =?utf-8?Q?Kekw/e4J/fA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TldvNHhBKzh0U1hxMG5yZzdZS1JobXo1YXZBejhYWng0cjkxNGl2ZmJ0c3ZY?=
 =?utf-8?B?d2Z3aHR3cUlZL2dEQVBlSkNZZTZKbGFGZld4MEFLTFo4MWo4S1JIR1BYTnY3?=
 =?utf-8?B?cVUyL1p5blZZekNSNTQ3VDZSejl3aGxicHpLc2FUTk1xU3prTXlUZEpFOFZ5?=
 =?utf-8?B?eHZ4SFpmU1RubkZyelpzUjkwaXQ0UWROTTN3VmhNRVdlTy9QblhLb0NkcVNj?=
 =?utf-8?B?SzZyRm5XTU1PZG9iTlFmYnBzU0doUnlSYzRmUDFpb3dEeHpCQzhLVG9NRklN?=
 =?utf-8?B?OVNOcG9ucVhSQjFuSlVEQVZUR3pFc2p3Z0FqZWRPUFJjbXFrS3k1YUtpNWha?=
 =?utf-8?B?cGNYYkkyYnpEa2duT1QrN1EvaGRlOHVFS0ZiYkZTQVp1YVA5SllvWWZkL203?=
 =?utf-8?B?ODVucXlDdUE3SVhtYXF4ZDIrR0NFS1BOTy9SRTIrb3FKRmlKMmp5U2prVktI?=
 =?utf-8?B?RGF5OTFDY1cxL2FQbnFZNUlrUTdQQ0pHRHhPZ1psYnlDbUNuWGpFeVpxUWkz?=
 =?utf-8?B?bWRIalN6T2tYaC9xREYreTQyQnFZTmZHRjd6ZzJWcVpRYmNLam5DRktJb2Fa?=
 =?utf-8?B?MnZXNVB0azRmazZ1SVNCZzV2SUgxTkR6R2NrZkpPLzFkTUZqekVXRlNGZEdN?=
 =?utf-8?B?QktrM3RNckNpcDR1ak9wZklpMEVUaHQ5bXhzcnZoYXZSb0x3TlNTMm5uWEdr?=
 =?utf-8?B?cnFLQTZOczNZSnp5b1NPUVlxUElwd0VFZnFOR2NVbjJ0Y2loM0llTmp5REx4?=
 =?utf-8?B?Tzhjd01MQ1RDRnN0cXJnN3d0VElWTFhYSDRkb0xPNmU1K084K0ZyMWdrNFdF?=
 =?utf-8?B?M2JpR2t2T1JTMFhNcmJoU3BoeEpzTnJFRDNYYmw0Snp6R1VnV1NlbFd4cktN?=
 =?utf-8?B?KzJUSVBJVW1vdVNwSmZGdG10WW1ZYjNMbzI2WmZ4cGRTOWVKQUR6Z2lodmFn?=
 =?utf-8?B?cVhGNCtGM3YwRTNQMnlDTWpOYU90ekx3Sms0YVVkUTFhQzZ3YklWWDR5bEds?=
 =?utf-8?B?ZHRBcW1ZVE41QUJ5NjlFaDF2b1RERVJGZU9kamZIWTFncHlBaGg5QURXeXJ3?=
 =?utf-8?B?N2x5VTQxemVOaVdoclRURzRiWkt5b00ySHR3QVVKQnJCNVhkNE5sckwxbWox?=
 =?utf-8?B?ck5QRWVxT2p3OVl0RU9CV1JhbXFvbE5WRGNOYXlOOHUwck14eTMvVENsNVZU?=
 =?utf-8?B?ck1TZ3lPaUd1MXRHdCtjdHI1RXVIZGsyL2gxODhmdXFIUXZkZUZVeUhTM2xI?=
 =?utf-8?B?NHltWkFXSkpyK1pUVzM2ZzZnMG5LZUNUR3lYTExpaXh3cVNCVjFjcFVXZGE0?=
 =?utf-8?B?SVdneVc3YlRnUVFZbGRieUlnMVZnQ0prSVBnN0VTSkxjelNxTWNtbGJUUE1G?=
 =?utf-8?B?RGRTYjZxM1BBMm1QdkwySFN0dmNHa2dhT1BsMzdETWpqckRBZDU4R1RvdmFt?=
 =?utf-8?B?cFFEYmRYZ3ljQlJhejltV2hxazZZUkxFekVSSGdMVFFNL1ZiczZNWklrcHg3?=
 =?utf-8?B?TG1UMUhzK1ZMMVVtR1dmUUFqcVFpREc5QkxHS29JeGpzRGw1RnZSQldhbU1J?=
 =?utf-8?B?eWZvSWJtUTZVRjFmMzVCVUFFekFYbVdHOTBrRHRCcFdpWWZKcTk2UWJWcHpq?=
 =?utf-8?B?Q3dQYkZGaE1YTW5zS09GYWZyK0JTemk1OWRUSHF6TTlSWmxvTEtwYktVVzB4?=
 =?utf-8?B?RTU3WU4zNEpJR1VFaHdKaVY2S0hMSGNiVmMwUDRsZDNzQmUySXhvNjZpcDBZ?=
 =?utf-8?B?YjB2VjhIRm0xWEMzMk9XT1YzT1l6OFhvM2tJNUZ1Ym54VUVNSnRDUEpDVE5x?=
 =?utf-8?B?Zm9TZEVTSGg3V0VGdWIvZTZ6KzRqQjhDZjY0VU5wb0R4akdSa29SbE1weWVG?=
 =?utf-8?B?WE4yRzdqUUlPaWRXVDBHKzFobm1VLzVSeCtnelFLVEpNbHJsaEVJdHdoZnJQ?=
 =?utf-8?B?ZTVPbkthcS83cjJuZ2RQdEJSWUhydW9tU3A1NHNYZW5VVXdHUWlRWEZtQzJm?=
 =?utf-8?B?cUhGL0pHREg4aHFEOUtHTHYzRG5tbTNBc2FqNzZEN0JCdU5RdFg4dDV0ZUF2?=
 =?utf-8?B?cnNrQm5DSEpRRlhwN3o1eXVGZzU2MTZzSmJwclJFYlRIbGZFdDFTMFdIRGM5?=
 =?utf-8?Q?ciFU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd437a5-b43c-477a-c901-08ddb0d0ae47
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 14:34:07.9636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnC2xypMi9rnPYvLNFen0+BbWc3/zTpuLSeW9WW/c/YdT+Zv7uavzgIOPbWKwxx0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7197
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 14:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118010

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBHeW9yZ3kgU2FydmFyaSB2aWENCj4gbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTZW50OiBkZW4gMjEganVuaSAyMDI1IDEzOjIwDQo+IFRvOiBhbHBlcnlh
c2luYWsxQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBjcnVjaWJsZTogQWxsb3cg
bmV0d29yayBhY2Nlc3MgZHVyaW5nIGRvX2NvbXBpbGUNCj4gDQo+IE9uIDYvMjEvMjUgMTE6MDks
IEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEFsbG93IG5l
dHdvcmsgYWNjZXNzIGR1cmluZyBkb19jb21waWxlIHRvIGxldCBHbyBtb2R1bGVzIGJlIGZldGNo
ZWQgYXQgYnVpbGQgdGltZSBhbmQgYXZvaWQgbmV0d29yayB1bnJlYWNoYWJsZSBlcnJvcnMuDQo+
ID4gDQo+ID4gRVJST1I6IGNydWNpYmxlLTIwMjMuMTEuMDItcjAgZG9fY29tcGlsZTogRXhlY3V0
aW9uIG9mICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvbWV0YS1vZS9idWlsZC9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L2NydWNpYmxlLzIwMjMuMTEuMDIvdGVtcC9ydW4u
ZG9fY29tcGlsZS4xNDU0JyBmYWlsZWQgd2l0aCBleGl0IGNvZGUgMQ0KPiA+IA0KPiA+IHwgZnVz
ZW1hcC95YW1sLmdvOjE1OjI6IGdpdGh1Yi5jb20vZ2hvZHNzL3lhbWxAdjEuMC4wDQo6IEdldCAi
aHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnL2dpdGh1Yi5jb20vZ2hvZHNzL3lhbWwvQHYvdjEuMC4w
LnppcA0KIjogZGlhbCB0Y3A6IGxvb2t1cCBwcm94eS5nb2xhbmcub3JnIG9uIDc3Ljg4LjguMTo1
MzogZGlhbCB1ZHAgNzcuODguOC4xOjUzOiBjb25uZWN0OiBuZXR3b3JrIGlzIHVucmVhY2hhYmxl
DQo+ID4gfCBjbWQvaGFidG9vbC9oYWJ0b29sX2djcC5nbzoxNDoyOiBjbG91ZC5nb29nbGUuY29t
L2dvL2ttc0B2MS4xNS42OiBHZXQgImh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZy9jbG91ZC5nb29n
bGUuY29tL2dvL2ttcy9Adi92MS4xNS42LnppcCI6IGRpYWwgdGNwOiBsb29rdXAgcHJveHkuZ29s
YW5nLm9yZyBvbiA3Ny44OC44LjE6NTM6IGRpYWwgdWRwIDc3Ljg4LjguMTo1MzogY29ubmVjdDog
bmV0d29yayBpcyB1bnJlYWNoYWJsZQ0KPiA+IHwgY21kL2hhYnRvb2wvaGFidG9vbF9nY3AuZ286
MTU6MjogY2xvdWQuZ29vZ2xlLmNvbS9nby9rbXNAdjEuMTUuNjogR2V0ICJodHRwczovL3Byb3h5
LmdvbGFuZy5vcmcvY2xvdWQuZ29vZ2xlLmNvbS9nby9rbXMvQHYvdjEuMTUuNi56aXAiOiBkaWFs
IHRjcDogbG9va3VwIHByb3h5LmdvbGFuZy5vcmcgb24gNzcuODguOC4xOjUzOiBkaWFsIHVkcCA3
Ny44OC44LjE6NTM6IGNvbm5lY3Q6IG5ldHdvcmsgaXMgdW5yZWFjaGFibGUNCj4gPiB8IGNtZC9o
YWJ0b29sL2hhYnRvb2xfZ2NwLmdvOjE2OjI6IGNsb3VkLmdvb2dsZS5jb20vZ28vc2VjdXJpdHlA
djEuMTUuNTogR2V0ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcvY2xvdWQuZ29vZ2xlLmNvbS9n
by9zZWN1cml0eS9Adi92MS4xNS41LnppcCI6IGRpYWwgdGNwOiBsb29rdXAgcHJveHkuZ29sYW5n
Lm9yZyBvbiA3Ny44OC44LjE6NTM6IGRpYWwgdWRwIDc3Ljg4LjguMTo1MzogY29ubmVjdDogbmV0
d29yayBpcyB1bnJlYWNoYWJsZQ0KPiA+IHwgY21kL2hhYnRvb2wvaGFidG9vbF9nY3AuZ286MTc6
MjogY2xvdWQuZ29vZ2xlLmNvbS9nby9zZWN1cml0eUB2MS4xNS41OiBHZXQgImh0dHBzOi8vcHJv
eHkuZ29sYW5nLm9yZy9jbG91ZC5nb29nbGUuY29tL2dvL3NlY3VyaXR5L0B2L3YxLjE1LjUuemlw
IjogZGlhbCB0Y3A6IGxvb2t1cCBwcm94eS5nb2xhbmcub3JnIG9uIDc3Ljg4LjguMTo1MzogZGlh
bCB1ZHAgNzcuODguOC4xOjUzOiBjb25uZWN0OiBuZXR3b3JrIGlzIHVucmVhY2hhYmxlDQo+ID4g
fCBoYWIvY3J5cHRvLmdvOjIzOjI6IGdpdGh1Yi5jb20vc21hbGxzdGVwL3BrY3M3QHYwLjAuMC0y
MDIzMTEwNzA3NTYyNC0NCg0KYmUxODcwZDg3ZDEzOiBHZXQgImh0dHBzOi8vcHJveHkuZ29sYW5n
Lm9yZy9naXRodWIuY29tL3NtYWxsc3RlcC9wa2NzNy9Adi92MC4wLjAtMjAyMzExMDcwNzU2MjQt
YmUxODcwZDg3ZDEzLnppcCI6IGRpYWwgdGNwOiBsb29rdXAgcHJveHkuZ29sYW5nLm9yZyBvbiA3
Ny44OC44LjE6NTM6IGRpYWwgdWRwIDc3Ljg4LjguMTo1MzogY29ubmVjdDogbmV0d29yayBpcyB1
bnJlYWNoYWJsZQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFscGVyIEFrIDxhbHBlcnlhc2lu
YWsxQGdtYWlsLmNvbT4NCj4gDQo+IElzIHRoZSBuZXcgZ28tbW9kIGZldGNoZXIgbm90IHVzYWJs
ZSB3aXRoIHRoaXMgcmVjaXBlPw0KDQpUaGUgY3J1Y2libGUgcmVjaXBlIHdhcyB0aGUgZmlyc3Qg
dG8gYmUgbW9kaWZpZWQgdG8gdXNlIHRoZSBnby1tb2QgDQpmZXRjaGVyLCBhbmQgaXQgc2hvdWxk
IGRlZmluaXRlbHkgbm90IG5lZWQgdG8gdXNlIHRoZSBuZXR3b3JrIGR1cmluZyANCnRoZSBjb21w
aWxlIHRhc2suDQoNCi8vUGV0ZXINCg0K

