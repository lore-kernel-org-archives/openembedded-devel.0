Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F105ACCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 05:02:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.23])
 by mx.groups.io with SMTP id smtpd.web10.362.1761368538492991374
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 22:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bequPCc/;
 spf=pass (domain: axis.com, ip: 52.101.66.23, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd0Shjd3O/zzf+Ba5NiDRJxWqmnhiDvgSsOH9WLFJiEkvwoIH5eycfYNWaH3rbRdOIDNrlXPNKmkzeFsRSUvhnHgRDN+/Ai49YziGaUFLAATTBfEJecNq5tzb1Buv3FHocZwq+acgJe+MlIj3AoKW82MnwwFnvJz7TW3QODb+LvVfwts/y1RrfyM1Cxdg2QzGOX0Gki8auqMxk2oBJY6llyEk7pBG8kQwMLiOoRGrPZhzTPRzrFhUmV7I6H/Knux1nrJu896N/nXLPKam79EdP1671MLazvkmm8RJuuI6pTf8gaMa0jYaUG2INJLTy0QOAw8Ue6GKWddWQgVnYsuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNch4J6kGSp5EL4bE2lmKLpLxiDVI68pljdNQwvMC9o=;
 b=btn9Y6++DusuFhr+bcAD+ypXMGFa774iafRYlXigHJW0ZpMtYkJHnWWayX0EmU/VB/c2IDuqoux0H+iSAN+Ey9E74LgnEniN1IdsO5XY9+IUfjYELWaxx0VyHE1Mc1rcnZ5z2sq99ZnbmQpY6ojbGMENRgDUyWNVFiY5hIR+gJ9lvILiYFqiqOjUXuiKyfJUWbSe6GMp2/UqmDewcGsNw86zNR/gZRjvn1c0AsvYKF/aj0CWspQt9i09l0vqJuRkEouGl8PJ7aSkywNKyYpGyW4vPNpYZ7FBc6ZtX6fX/S1yS40t6nu90mxkzayBqKnr0gSPnE6Nn1sLWYDii1xXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNch4J6kGSp5EL4bE2lmKLpLxiDVI68pljdNQwvMC9o=;
 b=bequPCc/b4Eau6B4QBsYVzOFF/15VHARMavLlVXutrN7K2Sn3qq7zY3sxAGzwdo/gw6vpgxaxJH5DbngsQNcEHZ5rUJlO97yIRVH+h2OyWbjZkHgZagVbay4WA/v6S+OC1DCo9g9AmjDJjgdpXKd02u6etYnC86C4jroZWXNcOM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB11041.eurprd02.prod.outlook.com (2603:10a6:800:25a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 05:02:14 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 05:02:13 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 7/9] lvgl: Add support for modifying the
 configuration using menuconfig
Thread-Topic: [oe] [meta-oe][PATCH 7/9] lvgl: Add support for modifying the
 configuration using menuconfig
Thread-Index: AQHcRWrwi6OpGSDpZk2rGuZ6jxs46LTSTXVQ
Date: Sat, 25 Oct 2025 05:02:13 +0000
Message-ID: 
 <DB5PR02MB10213DE70F085D9C2610F9757EFFEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251025031748.2728416-1-pkj@axis.com>
 <20251025031748.2728416-7-pkj@axis.com>
 <CAMKF1spn_SCNtggcC7g1hBRGWnYCYEmqD8FABUVg=q7t77Y+Fw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spn_SCNtggcC7g1hBRGWnYCYEmqD8FABUVg=q7t77Y+Fw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB11041:EE_
x-ms-office365-filtering-correlation-id: 5a62f6b0-6769-4220-6e01-08de1383a94d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d1ZFNkZ1Zm0xV2x1SUM4YnNBVGdmanRQU3k0dnVMbkYrUzFRZ0F2YzNGc2hz?=
 =?utf-8?B?OHF0b3J1WWhqUjhiZEE0c2FLUEkzRTJXR0syVmlmMmJ6bXFDNlFPc2JHZjky?=
 =?utf-8?B?bEppTHRncHpXSVFuanZGdElSUEgwNnhYUVlNSXUrNVNkWEhlb3Jsb0EwTkNr?=
 =?utf-8?B?OC9peGRtc0w2b3ZxVlR5bGcxVHVFZnY0ZkJJbExsdHBrRytWdGZVWEUzdjJq?=
 =?utf-8?B?S3l1SSt4NTdtcHBZUjlqVkc3TkRnUUNxZGpIcktuMEk4RXd0RnhzVXJJRGJD?=
 =?utf-8?B?Q0UzL3g2WGI3R2JxVGZTWndxMW1ua2hockU2cHFCYUY2MzJoNWhXbHF6YnN2?=
 =?utf-8?B?eDRqRFZHek9JSUt4eE1aRkNVSlVDRFpoalhQSklmU2dVVTN4TjE4bVNPck1D?=
 =?utf-8?B?QmlQT0RaNXkzYUhIc2NPZEk2Q2RYaXdHeG94VHNiVWdMT2RsVmdkbWxLcDJz?=
 =?utf-8?B?MUdJVjREZ0MrbUd1TVg1dHhnbC9WZGMwK2FIbDN2YnZ1cmRhbmJ1QytYQlJI?=
 =?utf-8?B?WnE3WFJuWC9xbXlwVHpKeFgrcmo3T1NrTzhTb3M1VVNRSmc0OVNSVG1VeVRM?=
 =?utf-8?B?TmM0cGQxOEFzYlVBRzNnNDJ1dzhhVEZyREhUZ2Urc1NIYWZxanZNNFo0U3lm?=
 =?utf-8?B?SG1BY253WGM1aVdVc3lFcEgxZXFUbWFPcWFTVUZDMEg2Zm81OXR1VE9Lb1V3?=
 =?utf-8?B?N2tKZkJzU3RNUXEzVStTY0hXQnI3SUhwTmx0V1lQRWJldlNZSWxXU1RHSUhz?=
 =?utf-8?B?WFcwZDUxNnhuMEhiZWZNdmhMb3lvWE1sVEZDVFB1MkhVOXhRVnpWTC9URXpB?=
 =?utf-8?B?cXphK0F2dUNRMUJYcDVjeEt2UzUrR1ZBWng3Q0ZEKzVqWUxqWVNPMVF4SHBu?=
 =?utf-8?B?SmI2WWFjYlhwbDRJV3RtZWo4dGRWQkxDZU1ZWGg0anp6cmpuWTJEWnJWVkRE?=
 =?utf-8?B?Mkg4V3c1Z25rNG9Lbm9vejRkTkpJejVraStSWmF1RC9POWRIQVRib25FVE9K?=
 =?utf-8?B?NlVST2VXbnpkdVNCY0lWTmNUZEZjbW10RWtKRURqRVNNVUxMMCtwa2twUTJM?=
 =?utf-8?B?cEJabk9raGlrMEdzS05CMllHaGNHMlNKZkFMTFMzOXBKdTJVQUdUMUZvMlJG?=
 =?utf-8?B?Nmx0NUtUR2VsS056Mk9yem90YVE4c1d1VHZmVm41OVV4MWNFVGt5cmRBeXZK?=
 =?utf-8?B?U2pYUWNLcDBPNlkra3hpaFFTM2tlOEttVE5VQjVEZHg1cWpFeHlqbUsrVDda?=
 =?utf-8?B?M0l2a2M5R2MzWHNFNk5QVUtxRkF3UDVVMUhGdlBHR0FhUEtJSEtFazZNYTFG?=
 =?utf-8?B?ZUhzejNHVUNyZkNhQVJKQzdTNkkrSmhObmRLUzlVT1RmYlVPOHZLQ2hZbTNQ?=
 =?utf-8?B?OHRkQkJoV1JvWld6aVdiR2tDeDViNU8yYjM4V0FXc0k0N3JoeDdLYjRMZG5T?=
 =?utf-8?B?UmtMU3U2UDQ1bHFGNUwxZzZDcjl4UllBdXI0NFl5ZFY5WWVLaEt5UG02RnhY?=
 =?utf-8?B?R21ROVRKaXFLbno3NktvQ08rK3lGR3BjcGgrVG5BVk1CRnJ0R09xWUs5UW9W?=
 =?utf-8?B?YnpXVGY4eFpzTlkwelVodkRvSGdwaVlRMk5hZGdoWXpDQnZNNWJpMzVYaWhi?=
 =?utf-8?B?MEtJYmZ3TGZLYXUrejZBZmYvclBaTjBpVzd1em5pVHN0QnNVL1lzaVNwdEtI?=
 =?utf-8?B?OEliQnJzQmxYREdQVFB5NXc0ZEd1aHlyTlJCYUFjM3poS3RoZGZNS1hvdzNW?=
 =?utf-8?B?M3lvQWtLSUM5cmdQSHJ3RjROQ2VNUHAvTlpac1JlV0pOdVJYK1ZFc1hBWlZt?=
 =?utf-8?B?a2ZydzE3ZTduZmV1SHZpV01ELzROVFlXV0swdTU1N1g3djR3RWdROHhWd1d4?=
 =?utf-8?B?TlhyQjhtY3RhckN2UVJMbjB4NDZxQWpLb3YybklqY2Mwb3FQWXhUSnppM3BY?=
 =?utf-8?B?K0tKcnhaaG1wMzZOdWJrVjJWblVucTRXZFFsVGtXaUxyWmRXZ1lURURPbnBH?=
 =?utf-8?B?SGtaNTdsR0prVWU0dGJEdnI4OGk2R3VYUWc4L0JzV1pKd3JkNEdTb0c2ay9E?=
 =?utf-8?Q?TbCSpJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Ykh5ODh2WkEyaFM0QTVERStkRnUzNW9vNW9Fd2l3QTVDaXUxbElpU0t3ZzFO?=
 =?utf-8?B?R2tiSDNMUHpRY3J1S2dQb3kwN0R5c25UNEdlTTZUaDdIQTBDUEFiRU5sQWhE?=
 =?utf-8?B?UzNISzFueGVRaDdNQkQ2Z2J4bzhMVmFYVmRTY0JpN3grbUtRMFJyTlNHOGs3?=
 =?utf-8?B?cWQ4L0p5bHNUamFLQUdscUdJL2p5M2txSUd1TGxXOUhzcytZVitmNnlSVFMx?=
 =?utf-8?B?cGEreVNLTlhyUWZwUjBGY1h0c3dkajFIV2ZyRm4vcXhqa3gzc0hvWG04c3Y0?=
 =?utf-8?B?bWpya2FwTEVYWkVlVkozS3Vkb2FicXh1ZWpjSU53djFtQmZSUStEdHhhME94?=
 =?utf-8?B?K1lGNTJYenpkSU52dHhPcmVkZE5wdUxtbTRyb21iRkFOL2JaOW9HdzV3Yyth?=
 =?utf-8?B?MWpNWE9OWlJ6NzlnK3JOTkJEazNseGhjMGVXb2ZkVUJGam50V1IvYTBueEhK?=
 =?utf-8?B?dzhHQlZnSUNQUlpxbFhvbGxJWXRsK1Rkd01vS2dacFNxL3AxRFhuL0hYWmdO?=
 =?utf-8?B?WS9YUVl0YUtyTnh1N1N1alNvVHIvaHl2MVFMNDYyNXVJRmtYUG1GMm8vdEsr?=
 =?utf-8?B?NXV4VkNEU3lRL3Iyem84YWlHd05MaEtrOURMYmtPUFlOVmhoRmFicFJCaUll?=
 =?utf-8?B?c0h3a0dRZitvcE02dVpKYk4rS0o2SFh5cE9VS3dwcDRHV2RIRHMrTzBQNWdv?=
 =?utf-8?B?TFp5Mk1MODk1cFNqOUdXTGlUU3ZZNWt5Zk5WVHRTZlZObWhKRWxvVHV3SDY1?=
 =?utf-8?B?SXdyTlZXUXBjY0xtUEFoVjhmWHhlalhHQk9BVFRrZzVqYmtYUEJJQUlNQXF0?=
 =?utf-8?B?M0FXZGFtZWgzRXpnOUtFSVc1eGJRTDVHSDFwV0VycEJvL3d0WEtFWEw3TFJE?=
 =?utf-8?B?MHp0ZGttVnA2QWMxNVJ0am9UQnFvMHZ6ek94K3FqSEhHLytpUFZFWi9xVXhI?=
 =?utf-8?B?d0kzaVpGcEJaYk5keHpYTUZkUGh6eUxSM0ZwRFFHcnFBVklSN1FYcUMwa3RR?=
 =?utf-8?B?cU56RFZJNzFtQy9mamVDWTlJbmNQekw2dmQ4RS92blNqSHJsZFBmZFNjM3dY?=
 =?utf-8?B?YjFSa0tZdHRsNTRWZE5SV0VLd052NXhpbGVIVXVDc2tVb1NLWTNPb25rN1E0?=
 =?utf-8?B?NUZBR0VEdnJDRlFoUTYvWDBwMU5BeUZuS1FzS3VKeStLemxhVmpvaGVSelVM?=
 =?utf-8?B?Qk9DSnhFWDdGdU9UMkZwdmRtT0pOVXFONVZsa0ZORTF1VWlhbnY0THJpOXQ4?=
 =?utf-8?B?TGxMVlZ4dHI0S0dRcVhvNDN3cHJ5WkJJVEhFNVhYYzhhMlVqQXc0bmttSFVN?=
 =?utf-8?B?ZFcwK3MxVEZvZnhnektHYkdEMGsxenR1N1psLzNsaklxTFJkRjE0U0ExV2pB?=
 =?utf-8?B?b1BzY1Ywa0E4Z3M1R2ZZVlh5TlJDVWlLU25Zd0JXZzdzcmc5OXVvM3lub1d6?=
 =?utf-8?B?MmxqVTh0TWo4Y29iQks0VndmOVhzTmdEeFhmY0tZRWwreEhzQjN6TFNybnh5?=
 =?utf-8?B?eUpoanZXR0pJZGpEMno2TmduMUFKKzNuZWx5cnNId0IrR2dIN1MrbEFXa1lN?=
 =?utf-8?B?OUZPVzNjYUNWRkhrSytWZUZiRHR3ZXlON3IyQ2pZekljRThnOW5wMklNKzZS?=
 =?utf-8?B?UjZsTXR3bmc1WVJSejAvOUsrYUFVV3d3M3d5bVd2Z3BNajhTWGc3eVkzUndC?=
 =?utf-8?B?TTl6bmhaV0ZzNXF6ZktZRytTUWtzcC9nNWt4R2ViK2FqcVBZN29RWEs4R0pp?=
 =?utf-8?B?UXlhQnN5NGtxUHoyQjJiZmxaVmgwUTlld0RhMFFyNkJ6MjNaY01xUG5MVGpS?=
 =?utf-8?B?YWRLUEVWVWtwVnNlWVZLdWt4UHVycWhvcnpZWmhXOUtoZDJFYjRvN01CeUwv?=
 =?utf-8?B?OEVMNXI3ZlJjZjBES2FWZEorYTlBVXB5dzdleUJ1Q0lXUlB2NlZkUitKQnlQ?=
 =?utf-8?B?LzhQRDNXVUNzb3RsRkZHT0lUeFVvSk5icTg3QStzMHpETU9iTzhFMzQrK2Iw?=
 =?utf-8?B?NXE3TmIwek1BUVpCWnNaanhoVzcyVU0vWTJEYnFOUFc0NFYzSi9kMldGUWVn?=
 =?utf-8?B?NXBjTTVNUzdsOTlNVEZOWHFKcitFZHVXUzVRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a62f6b0-6769-4220-6e01-08de1383a94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2025 05:02:13.4634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBUD+GV4bZnH80hKXJ/UJ6Ap0yxJYw+kBMRlhtQFj8slScMZ/GL2JoBCHaw02TDE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120997

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMjUgb2t0b2JlciAyMDI1IDA2OjUxDQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2Vd
IFttZXRhLW9lXVtQQVRDSCA3LzldIGx2Z2w6IEFkZCBzdXBwb3J0IGZvciBtb2RpZnlpbmcgdGhl
IGNvbmZpZ3VyYXRpb24gdXNpbmcgbWVudWNvbmZpZw0KPiANCj4gT24gRnJpLCBPY3QgMjQsIDIw
MjUgYXQgODoxOOKAr1BNIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiA+DQo+ID4gR2VuZXJhdGluZyBhIGNvbmZpZ3VyYXRpb24gZnJhZ21lbnQgZm9y
IGEgZmVhdHVyZSBjYW4gbm93IGJlIGRvbmUgdXNpbmc6DQo+ID4NCj4gPiAgIGJpdGJha2UgbHZn
bCAtYyBtZW51Y29uZmlnICYmIGJpdGJha2UgbHZnbCAtYyBkaWZmY29uZmlnDQo+ID4NCj4gPiBX
aGlsZSB0aGlzIHVzZXMgdGhlIHN0YW5kYXJkIGNtbDEuYmJjbGFzcywgaXQgZXhwZWN0cyB0aGF0
ICJtYWtlIiBpcw0KPiA+IHVzZWQgdG8gcnVuIG1lbnVjb25maWcgZXRjLiBUaGlzIGlzIG5vdCB0
cnVlIGZvciBsdmdsLCBzbyB1bmZvcnR1bmF0ZWx5DQo+ID4gdGhlIHdob2xlIGRvX21lbnVjb25m
aWcoKSBmdW5jdGlvbiBoYWQgdG8gYmUgY29waWVkIHRvIGJlIGFibGUgdG8gcmVtb3ZlDQo+ID4g
dGhlIHVzZSBvZiAibWFrZSIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+IEkg
cGxhbiBvbiB1cGRhdGluZyBjbWwxLmJiY2xhc3Mgc28gdGhhdCBpdCBiZXR0ZXIgc3VwcG9ydHMg
Y29kZSB0aGF0DQo+ID4gZG9lcyBub3QgdXNlICJtYWtlIiB0byBydW4gbWVudWNvbmZpZywgbWF5
YmUgZXZlbiBnaXZpbmcgaXQgbmF0aXZlDQo+ID4gc3VwcG9ydCBmb3Iga2NvbmZpZ2xpYi4gSG93
ZXZlciwgZHVlIHRvIHRoZSBjdXJyZW50IHNpdHVhdGlvbiwgSSBkbyBub3QNCj4gPiBleHBlY3Qg
YW55IHN1Y2ggY2hhbmdlcyB0byBiZSBhY2NlcHRlZCB1bnRpbCBhZnRlciBXaGlubGF0dGVyIGlz
IG91dCBvZg0KPiA+IHRoZSBkb29yLiBUaHVzLCB0aGUgY29waWVkIGRvX21lbnVjb25maWcgaW4g
dGhpcyByZWNpcGUgd2lsbCBoYXZlIHRvIGRvDQo+ID4gYXMgYW4gaW50ZXJpbSBzb2x1dGlvbi4N
Cj4gPg0KPiA+ICBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbHZnbC9sdi1jb25mLmluYyB8IDQ4
ICsrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWdyYXBoaWNzL2x2Z2wvbHYtY29uZi5pbmMgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3Mv
bHZnbC9sdi1jb25mLmluYw0KPiA+IGluZGV4IGFiM2FkMDFhNWEuLmNjOGEyYTE2ZDkgMTAwNjQ0
DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2x2Z2wvbHYtY29uZi5pbmMNCj4g
PiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvbHZnbC9sdi1jb25mLmluYw0KPiA+IEBA
IC0yMSw3ICsyMSw3IEBAIFBBQ0tBR0VDT05GSUdbZ3JpZG5hdl0gPSAiLCwiDQo+ID4gIFBBQ0tB
R0VDT05GSUdbdGhvcnZnXSA9ICIsLCINCj4gPiAgUEFDS0FHRUNPTkZJR1tzZGxdID0gIiwsdmly
dHVhbC9saWJzZGwyIGxpYnNkbDItaW1hZ2UiDQo+ID4NCj4gPiAtaW5oZXJpdCBweXRob24zbmF0
aXZlDQo+ID4gK2luaGVyaXQgY21sMSBweXRob24zbmF0aXZlDQo+ID4NCj4gPiAgRVhUUkFfT0VD
TUFLRSArPSAiLURMVl9CVUlMRF9VU0VfS0NPTkZJRz1PTiINCj4gPg0KPiA+IEBAIC0zNSw2ICsz
NSw3IEBAIENYWEZMQUdTICs9ICIke0xWR0xfRkxBR1N9Ig0KPiA+ICBLQ09ORklHX0NPTkZJR19S
T09URElSID89ICIke1N9Ig0KPiA+ICBLQ09ORklHX0ZJTEUgPz0gIiR7S0NPTkZJR19DT05GSUdf
Uk9PVERJUn0vS2NvbmZpZyINCj4gPiAgZXhwb3J0IEtDT05GSUdfQ09ORklHID89ICIke0tDT05G
SUdfQ09ORklHX1JPT1RESVJ9Ly5jb25maWciDQo+ID4gK0tDT05GSUdfQ09ORklHX0NPTU1BTkQg
Pz0gIm1lbnVjb25maWcgJHtLQ09ORklHX0ZJTEV9Ig0KPiA+DQo+ID4gIGRvX2NvbmZpZ3VyZSgp
IHsNCj4gPiAgICAgIGNhdCAke1VOUEFDS0RJUn0vZGVmY29uZmlnICR7QCIgIi5qb2luKGZpbmRf
Y2ZncyhkKSl9ID4gJHtCfS9kZWZjb25maWcNCj4gPiBAQCAtNDIsMyArNDMsNDggQEAgZG9fY29u
ZmlndXJlKCkgew0KPiA+DQo+ID4gICAgICBjbWFrZV9kb19jb25maWd1cmUNCj4gPiAgfQ0KPiA+
ICsNCj4gPiArIyBDb3BpZWQgZnJvbSBjbWwxLmJiY2xhc3MuIFRoZSBvbmx5IG1vZGlmaWNhdGlv
biBpcyB0aGF0DQo+ID4gKyMgJHtLQ09ORklHX0NPTkZJR19DT01NQU5EfSBpcyBub3QgcHJlZml4
ZWQgd2l0aCAibWFrZSIgd2hlbiBjYWxsZWQgYnkNCj4gPiArIyBvZV90ZXJtaW5hbC4NCj4gDQo+
IEkgd29uZGVyIGlmIHdlIGNhbiBhZGQgdGhpcyBmbGV4aWJpbGl0eSB0byBjbWwxLmJiY2xhc3Mg
YW5kIHVzZSB0aGUNCj4gY2xhc3MgZGlyZWN0bHkgdGhlbiBoZXJlLg0KDQpZZXMsIHRoYXQgaXMg
bXkgcGxhbi4gU2VlIG15IGNvbW1lbnQgYWJvdmUuDQoNCj4gPiArcHl0aG9uIGRvX21lbnVjb25m
aWcoKSB7DQo+ID4gKyAgICBpbXBvcnQgc2h1dGlsDQo+ID4gKw0KPiA+ICsgICAgaWYgbm90IGJi
LnV0aWxzLnRvX2Jvb2xlYW4oZC5nZXRWYXIoIktDT05GSUdfQ09ORklHX0VOQUJMRV9NRU5VQ09O
RklHIikpOg0KPiA+ICsgICAgICAgIGJiLmZhdGFsKCJkb19tZW51Y29uZmlnIGlzIGRpc2FibGVk
LCBwbGVhc2UgY2hlY2sgS0NPTkZJR19DT05GSUdfRU5BQkxFX01FTlVDT05GSUcgdmFyaWFibGUu
IikNCj4gPiArICAgICAgICByZXR1cm4NCj4gPiArDQo+ID4gKyAgICBjb25maWcgPSBvcy5wYXRo
LmpvaW4oZC5nZXRWYXIoJ0tDT05GSUdfQ09ORklHX1JPT1RESVInKSwgIi5jb25maWciKQ0KPiA+
ICsgICAgY29uZmlnb3JpZyA9IG9zLnBhdGguam9pbihkLmdldFZhcignS0NPTkZJR19DT05GSUdf
Uk9PVERJUicpLCAiLmNvbmZpZy5vcmlnIikNCj4gPiArDQo+ID4gKyAgICB0cnk6DQo+ID4gKyAg
ICAgICAgbXRpbWUgPSBvcy5wYXRoLmdldG10aW1lKGNvbmZpZykNCj4gPiArICAgICAgICBzaHV0
aWwuY29weShjb25maWcsIGNvbmZpZ29yaWcpDQo+ID4gKyAgICBleGNlcHQgT1NFcnJvcjoNCj4g
PiArICAgICAgICBtdGltZSA9IDANCj4gPiArDQo+ID4gKyAgICAjIHNldHVwIG5hdGl2ZSBwa2ct
Y29uZmlnIHZhcmlhYmxlcyAoa2NvbmZpZyBzY3JpcHRzIGNhbGwgcGtnLWNvbmZpZyBkaXJlY3Rs
eSwgY2Fubm90IGdlbmVyaWNhbGx5IGJlIG92ZXJyaWRlbiB0byBwa2ctY29uZmlnLW5hdGl2ZSkN
Cj4gPiArICAgIGQuc2V0VmFyKCJQS0dfQ09ORklHX0RJUiIsICIke1NUQUdJTkdfRElSX05BVElW
RX0ke2xpYmRpcl9uYXRpdmV9L3BrZ2NvbmZpZyIpDQo+ID4gKyAgICBkLnNldFZhcigiUEtHX0NP
TkZJR19QQVRIIiwgIiR7UEtHX0NPTkZJR19ESVJ9OiR7U1RBR0lOR19EQVRBRElSX05BVElWRX0v
cGtnY29uZmlnIikNCj4gPiArICAgIGQuc2V0VmFyKCJQS0dfQ09ORklHX0xJQkRJUiIsICIke1BL
R19DT05GSUdfRElSfSIpDQo+ID4gKyAgICBkLnNldFZhckZsYWcoIlBLR19DT05GSUdfU1lTUk9P
VF9ESVIiLCAidW5leHBvcnQiLCAiMSIpDQo+ID4gKyAgICAjIGVuc3VyZSB0aGF0IGVudmlyb25t
ZW50IHZhcmlhYmxlcyBhcmUgb3ZlcndyaXR0ZW4gd2l0aCB0aGlzIHRhc2tzICdkJyB2YWx1ZXMN
Cj4gPiArICAgIGQuYXBwZW5kVmFyKCJPRV9URVJNSU5BTF9FWFBPUlRTIiwgIiBQS0dfQ09ORklH
X0RJUiBQS0dfQ09ORklHX1BBVEggUEtHX0NPTkZJR19MSUJESVIgUEtHX0NPTkZJR19TWVNST09U
X0RJUiIpDQo+ID4gKw0KPiA+ICsgICAgb2VfdGVybWluYWwoInNoIC1jICclczsgaWYgWyAkPyAt
bmUgMCBdOyB0aGVuIGVjaG8gXCJDb21tYW5kIGZhaWxlZC5cIjsgcHJpbnRmIFwiUHJlc3MgYW55
IGtleSB0byBjb250aW51ZS4uLiBcIjsgcmVhZCByOyBmaSciICUgZC5nZXRWYXIoJ0tDT05GSUdf
Q09ORklHX0NPTU1BTkQnKSwNCj4gPiArICAgICAgICAgICAgICAgIGQuZ2V0VmFyKCdQTicpICsg
JyBDb25maWd1cmF0aW9uJywgZCkNCj4gPiArDQo+ID4gKyAgICB0cnk6DQo+ID4gKyAgICAgICAg
bmV3bXRpbWUgPSBvcy5wYXRoLmdldG10aW1lKGNvbmZpZykNCj4gPiArICAgIGV4Y2VwdCBPU0Vy
cm9yOg0KPiA+ICsgICAgICAgIG5ld210aW1lID0gMA0KPiA+ICsNCj4gPiArICAgIGlmIG5ld210
aW1lID4gbXRpbWU6DQo+ID4gKyAgICAgICAgYmIucGxhaW4oIkNoYW5nZWQgY29uZmlndXJhdGlv
biBzYXZlZCBhdDpcbiAlc1xuUmVjb21waWxlIHdpbGwgYmUgZm9yY2VkIiAlIGNvbmZpZykNCj4g
PiArICAgICAgICBiYi5idWlsZC53cml0ZV90YWludCgnZG9fY29tcGlsZScsIGQpDQo+ID4gK30N
Cj4gPiArDQo+ID4gK2RvX3NhdmVkZWZjb25maWcoKSB7DQo+ID4gKyAgICBiYnBsYWluICJTYXZp
bmcgZGVmY29uZmlnIHRvOlxuJHtCfS9kZWZjb25maWciDQo+ID4gKyAgICBzYXZlZGVmY29uZmln
IC0ta2NvbmZpZyAke0tDT05GSUdfRklMRX0gLS1vdXQgJHtCfS9kZWZjb25maWcNCj4gPiArfQ0K
DQovL1BldGVyDQo=

