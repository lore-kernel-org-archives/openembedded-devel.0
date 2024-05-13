Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91E8C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 10:03:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web11.56663.1715594608393993306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 03:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=SCgM5ziy;
 spf=pass (domain: axis.com, ip: 40.107.8.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYtFrwxofxquCwYN/xUE6JVLOtBpwJ6YVhpDIx784ieX1nZ7QcMxE5XiwGSvQUDb/JZ3NizY3rwwZgXpVht51L2G4Mv6oCr/cmocF77JYDboC40vGjrwFeSvW1runbJoLPDzRrL51OrOLyzqEGgpjLKt8BnkpzZ28kPujhbpSu67AuvUEXtuiXVGiNModBTulSAUpclis8VGutckEG8qjmvYVjonTLgw3Aqw3Wb5rmXbFoaHuGNgRlXpkEI40duHSua/qS6xevH2abb99VdpMurbkMWw4+uoqbhMuLe6D5brPRdEEAfz5nzeyvoxOW9BCTCSnFiAhFRqmeKUy2gyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2TmzRIW3DVZX3XtCJcJGj7WFJ1tgW5r1fCuyxKhvXc=;
 b=AQlW1gRG/fqf10aGq/ff5yLkx/jBsWh4OJKr0f+ONqmbM9c09kZRuj2fVNGdBs08ZNlhy5Jot1iH23GV1SPAqH2UAMGC0ZLjq4x1rhU07NSI2wUvwm5AxiWtP7S+rUKoSPtfeB/IPI6ufKHKH6bvnhF2xF2Nb6IXJXx0WZLU4dUqL35sKvmF7IkZ5XiQKdnfK+Nhj9FKcq+DBG2rI6wzSvLDEV8JIu4+duCP2yeR9CLvjtlqI2y7qOTqYy5+UeRVaceYcyLkS32ZXdZfUuT+w5du+vHH6qmZvrlhUXHB7AGhCkPgQjIGrZtmCyQiTQfSJ17XgtnXSlq7H+YHNjq1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2TmzRIW3DVZX3XtCJcJGj7WFJ1tgW5r1fCuyxKhvXc=;
 b=SCgM5ziyTmjt5hE9mrqMvAf8/EHsXyi0j9bEVXYyfzAJYbqAw0dAcZ73OA9s0QESUNtPEKE4U/godCUdhFDnWJMvRFbXceUlLw/Cd/JVY9awEyu++M1GY0SYrufRnmmPgoQI85IQFXsGhCzJsxmMZ1f81k0MJJCaHvBcNlHjzXs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB10144.eurprd02.prod.outlook.com (2603:10a6:102:360::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:03:24 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6ec:207d:1515:2996%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 10:03:24 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Kai <kai.kang@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [PATCH v3 1/1] apache2: fix multilib file conflicts
Thread-Topic: [PATCH v3 1/1] apache2: fix multilib file conflicts
Thread-Index: AQHaoRZURdMa/IXteUuGr0dytZN61rGToWuggADn2gCAAGcRoA==
Date: Mon, 13 May 2024 10:03:24 +0000
Message-ID: 
 <DB5PR02MB10213E03D862E6062165BDECDEFE22@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17CD719EC1248206.5708@lists.openembedded.org>
 <20240508070649.1657864-1-kai.kang@windriver.com>
 <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
In-Reply-To: <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB10144:EE_
x-ms-office365-filtering-correlation-id: 828fe1a4-919f-4bea-4c9b-08dc7333ed41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZkpZNktMUW5RNjE0OURCTEhNK2JqejF3N0UwSlhJTDNFRFoycDRUTTcrVHNU?=
 =?utf-8?B?blRIUjdhOGhadUJlRTNXSHVCUm9aS1VKR3VzNnJYTXJlNVBEQWFLY2d4bWsw?=
 =?utf-8?B?TVgwVEMyckx1bndLcVVqWncyd2dUNFZybUtwMDVoYm9MQnBERXQxb29XM0o2?=
 =?utf-8?B?ZlplL2dPM2V2Yk5memZ2VzdONVUxUktKQWhWRzdLeVBGa3VEN2dkc1NtU2RG?=
 =?utf-8?B?SXZQcnhWbjI4U3RqQ1lpTDl1Y2dveVk3UlFkZVJOWDNXdlFvdnB5bVVaT2VB?=
 =?utf-8?B?cmJBV01aWTdHVk5HejZ1WU1yaGVMUm1tSDc4bkE5OFQxQm5XQ0NpQURxbFUw?=
 =?utf-8?B?WDRJdlNwVnN4NkdyQnUvSkRTMEcrM1I3eVYvbnJoQlZkUlptbjJLUWl3VFRZ?=
 =?utf-8?B?US9vdTBzeUc3QUdqMWFrZjBOUlBsamNzWndYdnM0djdGWVYxaXR4K0xRbFpn?=
 =?utf-8?B?STBpcWJWQmRzblJWcEJSa04vSDVucVJaTDlwOTVHZWdIRy9MLys2d3FCQUxS?=
 =?utf-8?B?Ky9aSThad3BpclZlZFVZSkRLNGlNQVJKVGdNZlVLWVZTNHNlQnk1Y0VsN1Jp?=
 =?utf-8?B?SUx0YldNMnZ4S3FESTJleHFRZnh6SER6aTREZ0E0WTdhUStyODNvVjU3SU55?=
 =?utf-8?B?aTF5QUdCWlhma2RkRENZRHk1NHFGalhnWmErcyswSGNVSFdQbXVHa0YyWDdr?=
 =?utf-8?B?V0hSMmFMaFR0dGhTVVN3aW1OdzBiSTIyejZGdU9OOThFN2ZqNERGQzdHa3B0?=
 =?utf-8?B?YVoxTHZoL1l2U2JzN293MFV4MjFnbVIxZkg0S0VVVW0vMVB2MGZGaWtWcWQ1?=
 =?utf-8?B?UGNGUkU3Rk9mY3Z6UjdFcUJzUFh4eFg2K2pacWpEbWFZMDl6T3NyQWpLdlZV?=
 =?utf-8?B?c2MvenVueE03UWNhUUh0ZVVUK2FPcER1VTFYRjZQUFBkMGQwMXZoY29aWGFZ?=
 =?utf-8?B?V1gzQ3o4ZWZCYkw1bTJMcGE3NTBOcWdJSGM1R2pqMTlhTEVzTXN3SnY1WUhs?=
 =?utf-8?B?WkZRQWthR0tlTXJTa2xCL3FpQW9EYmg1S3BhVCtqam5xbDBIbjVLdHM5RDAw?=
 =?utf-8?B?cXk0bmJ1VmJuZG1HNFlZR1NSZHlBNEY2R1ZBbjRnWU9lQjcra0JjYUQwa1p0?=
 =?utf-8?B?MFgvb2ZGb3lVb1JaNVl6cnk3RlRMYllxMmxVWEpXTmRzdnJrTk1yRUtybi8x?=
 =?utf-8?B?amlNZjZoVU5KMVI5RW1PZnRCanYrb25zVTUyR055M291NW41TmMxbUFaamZC?=
 =?utf-8?B?L0xsdlJ4eEk4Ry9uT0ZOQkpyTk4xSVdTaEFLbSt4bytVRVp5YUJ5S0hhemlt?=
 =?utf-8?B?QzRFZ2wrMG1FcVkwdHFlTWdObEVzbEdkcjI3N3BYUjBPUWlXaEhzNjRMdm1i?=
 =?utf-8?B?WW0vSEtGd0p1MGdyU0Yra3VLSUROMzhWTHhIOTBQN1FGZFlLYWRIdnRDVEtl?=
 =?utf-8?B?Y1ltRFp4NFNHaTdkMTRlMlFnRWZ3SGRGRHo4OFprZ3UrY25yckdVb002Z2pw?=
 =?utf-8?B?MFJVbjFabjRYY2RkZlJ5cWEzTWpNN2Vld3BGakMwcWFKZTVRR3VxeDZmcVQ2?=
 =?utf-8?B?TGQ0TjZCaW1OTkloRUJKbk9oNlhKMnBybEFtcTJLbFRiRkZHZGNISnp2ZnlI?=
 =?utf-8?B?SlVnb0piamJydnRsRTI1Q1RuWUJwVlVPU3V4WWdYWDQ2a0VIWG5FaWswOEg2?=
 =?utf-8?B?K3FiMjFycjVwRWJQMktadjFxVTVpOERRbDRrWmgzZDlZSVdOK2VSY1ZWSEhr?=
 =?utf-8?B?dHlLbkFTOExIMkF3THZiRy9OTWNHRWNFcFgzV25FM21CY3hqYVhpdXNCMHFH?=
 =?utf-8?B?THZ4d0VYbVlIQVozVkpqUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUJsdCtqejJoZCs4aTF3cm5kZkZqUnQ2SGRKalBnTzViYlZXeE9LcHRVOWR4?=
 =?utf-8?B?NWU3SnI0N1BvRko0dzQ0YXVHT09ESGFaa3kvZS9vMkJLdjNCMFd3RFlJNmJx?=
 =?utf-8?B?ZjN0MDhBVmtSUDQ5UjM4YWhyRmN2RENmenFBY1AyZnBHbFVoQW50SklkaW1N?=
 =?utf-8?B?c2lYdXlzbnZ0bGNmd0JSZWhmcHZFeFE5UWx3TEZsNHhXa2NBckkvMkZmS1Zm?=
 =?utf-8?B?dkdpdi9RYnVkYTgvOUthR1JEb3FlWklReGgxMG5WZXNHMjNCdmlqWWRsNmlN?=
 =?utf-8?B?ZnVJSVJBajFVd1BGN2EvakFvN1RwaXlqK291Nms5V0h3Z0traEkzTU5GdGZK?=
 =?utf-8?B?Ty9ZOUJ1QWQ0RHE5Wnp2dTkzLzJsZ29VZ2d1Z0FHZDNHUHUyNHlyOVl2eXYv?=
 =?utf-8?B?YzRQUEJuaEZJczZwWU9xRUJFQlBXRVhZODFyZDJpYTRqbUMzUlFmVStmNGVK?=
 =?utf-8?B?U1FnblVwdHR1ZGFxdjhJTjZJVE16Y2RhMFJxck5tUXhlc1NKTXZWNmRqUXk4?=
 =?utf-8?B?OU1LVmxXQVZreHdyK0dCaGV5dmx6OFVlVDJsblJ6S2Q4Mi83Z3NpVDBYUTl0?=
 =?utf-8?B?M3R1M3E5M094NS9hM3Vka1l5dmlqQzZUTWtoQXV4UlFnZ3ZneHNFM2x5Tzhy?=
 =?utf-8?B?QWJkOWJBNlQ2aklNNEpkb0tSdXdUK05FcWxlV2NZNjlpWlFzc1VIK3VaUmtz?=
 =?utf-8?B?ZFI5SkZOL2s1ZzBMYlJiWDYrWkpENEdWS1pXMWFaNElTMW9RSUwxSzMxZFZ6?=
 =?utf-8?B?VEh0V1Q0ZnhlZkZILzUwRVA5dkF3bEJyazRvcFlRK1l5bExzWUthMXBhVmsv?=
 =?utf-8?B?Q1RTQVJRYU1ZZS9ycm5VZTVhb21jRFA3ZnAxZjh4NTNScEc4TzB2K2FEd0JC?=
 =?utf-8?B?dnZJV3E5dmNjNHgrZkNRVUVqTUsxOWEwNy9JVXI4cDkrTk9BWWw0emdJQi9p?=
 =?utf-8?B?UWcvb3VxSEpkcmZPcTQyWk9BZXZwM1F0cmlTNTI4eWJUc0Uzc1B6WnVTOHZ2?=
 =?utf-8?B?L2s3TFNUS1JmNkt5cEZwRGVJWE13ZXZQallBZjdZM0cvSTFHQVVJSXlzNkxw?=
 =?utf-8?B?N082NzFNcGJlQUFvV0hURFUyNWd1ZDJMV1g3L1lvMGpLZkN4STk1R21zSHI1?=
 =?utf-8?B?R2JwVHp4ODB4aUtQOS9GYWNGWjRNOEphSEhDUWVOVFpWT0t5NFNWNFBZTXBj?=
 =?utf-8?B?VFliOXJYR1ZVQ0dkRFdqMHZObmFFVm9QK0VkTFcvc0ZwVlBNM2hpREt5WkNV?=
 =?utf-8?B?dnk4NmU5SE1xallUbHZ5Q1RrT0MzSlg4bTdSUW4zdU84NFRiUVFZSmpOM2Jp?=
 =?utf-8?B?L3hOQS83d1FjaXhNckc1M1BnM1JVYlNQRFJRSTFXVWZuZ0EwTVc0bWRDeXRT?=
 =?utf-8?B?Sk90RXU5YW53Mi9icTFuYVhVUWRnZXFpQ2JNcDdxSTNHazVqK1NQakV5NkQ2?=
 =?utf-8?B?bmpEWkU0c2Qwa29TUnNVN0hZbzl2UmFvT244aFhhdkk4WUVNWTg3MXZZbTJ4?=
 =?utf-8?B?TGIxdnhVbVBiN0haN1Njd0kxNmhiNWxnNWlJQUVKTHZZS2NRZHhaZ09lL3Rv?=
 =?utf-8?B?SjcwbW90RmxmcjhXaDlha0JQZkJuT3E0Tno0c05lY01BbEM5ZWZvb0pjKzNG?=
 =?utf-8?B?Qzh2QXc0Z0dsOCsvYWt1Sis3dlI2ek5NZTNZdW1WcXUwTFd4UG5NRzB4QXNG?=
 =?utf-8?B?MG56ZVE3QWwxbllaTHliSFp5MTl2a2JrVkVhVWs5MklQQlFvSWRyWEVHZHlI?=
 =?utf-8?B?YUxBUk5wbUZWNVhXTHpSeUpvY2hCUFcxZXdTZ3ZKaGU0Z2RuVGVrV3BMR3A2?=
 =?utf-8?B?VVFNQURlbTRUaGNyWTZIL2xwNW9jWjVXa0ZUaG9VUmtYNmRNbVdQQ0tHVm5l?=
 =?utf-8?B?ME9oRDlUMXJoc2lCYXgrR05LL0h5dEJiUGtoK3U5RG4xbGVNdkp0TWRIU2Z0?=
 =?utf-8?B?dEZpcXZwK21nMmY4STRPMlBOUG1OanpndVZYRnJJZTRZWkNRMlRjQklIWjVW?=
 =?utf-8?B?UGI0MTAvcHZwVHhzVmFCWXpwbzc4d05Ub3BsV0U0Sk1SSzU4VE9Ydk5WaW8r?=
 =?utf-8?B?WlllSnFobUl6WHIra0RJNC9EYUowV2NpV2tCRUFYTmgvN3YzWnZPQmtSelpy?=
 =?utf-8?Q?VtWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828fe1a4-919f-4bea-4c9b-08dc7333ed41
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:03:24.0259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJZNT4s0Fz7/toyscVJLwu/BtxZqmuJhxznqelG2phLlorlMaBR8cl4NSyILD3iz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10144
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 10:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110337

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYWkgPGthaS5rYW5nQHdpbmRy
aXZlci5jb20+IA0KPiBTZW50OiBkZW4gMTMgbWFqIDIwMjQgMDU6MjkNCj4gVG86IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MyAxLzFdIGFwYWNoZTI6IGZpeCBtdWx0aWxpYiBmaWxlIGNvbmZsaWN0cw0KPiANCj4gT24gNS8x
Mi8yNCAyMTo1OSwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogbWFpbHRvOmthaS5rYW5nQHdpbmRyaXZlci5jb20gbWFp
bHRvOmthaS5rYW5nQHdpbmRyaXZlci5jb20NCj4gPiBTZW50OiBkZW4gOCBtYWogMjAyNCAwOTow
Nw0KPiA+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgbWFpbHRvOnBldGVyLmtqZWxsZXJzdGVkdEBh
eGlzLmNvbQ0KPiA+IENjOiBtYWlsdG86b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMS8xXSBhcGFjaGUyOiBmaXggbXVsdGls
aWIgZmlsZSBjb25mbGljdHMNCj4gPiANCj4gPiA+IEZyb206IEthaSBLYW5nIG1haWx0bzprYWku
a2FuZ0B3aW5kcml2ZXIuY29tDQo+ID4gPiANCj4gPiA+IFRoZXJlIGFyZSBmaWxlIGNvbmZsaWN0
cyBvZiBhcGFjaGUyIHdoZW4gbXVsdGlsaWIgZW5hYmxlZDoNCg0KW3NuaXBdDQoNCj4gPiA+IEBA
IC04MCw3ICs4MCw5IEBAIEVYVFJBX09FQ09ORjpjbGFzcy1uYXRpdmUgPSAiXA0KPiA+ID4gICAg
ICAiDQo+ID4gPiANCj4gPiA+ICBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsNCj4gPiA+IC0gICAg
c2VkIC1pIC1lICdzOiQnJ3twcmVmaXh9L3Vzci9saWIvY2dpLWJpbjokJyd7bGliZXhlY2Rpcn0v
Y2dpLWJpbjpnJyAke1N9L2NvbmZpZy5sYXlvdXQNCj4gPiA+ICsgICAgc2VkIC1pIC1lICdzI1wo
Y2dpZGlyOlxzKlwpLiojXDEke2xpYmV4ZWNkaXJ9L2NnaS1iaW4jJyBcDQo+ID4gDQo+ID4gSSBk
byBub3Qga25vdyBpZiB0aGlzIHdhcyBpbnRlbnRpb25hbCBvciBub3QsIGJ1dCB0aGUgYWJvdmUg
Y2hhbmdlcyB0aGUgDQo+ID4gbG9jYXRpb24gb2YgdGhlIENHSSBkaXJlY3RvcnkgZm9yIGFsbCBs
YXlvdXRzLCB3aGVyZSBpdCBwcmV2aW91c2x5IG9ubHkgDQo+ID4gY2hhbmdlZCB0aGUgcGF0aCB1
c2VkIGJ5IHRoZSBEZWJpYW4gbGF5b3V0Lg0KPiA+IA0KPiA+IEl0IGlzIG5vdCBhIHByb2JsZW0g
Zm9yIHVzIGFzIHdlIGRvIG5vdCB1c2UgaXQgYW55d2F5ICh3ZSBhY3R1YWxseSANCj4gPiByZW1v
dmUgaXQgaW4gb3VyIGJiYXBwZW5kKSwgYnV0IGlmIGl0IHdhcyBpbnRlbnRpb25hbCwgaXQgc2hv
dWxkIGJlIA0KPiA+IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIGFuZCBpZiBpdCB3
YXMgbm90IGludGVudGlvbmFsLCB0aGVuIA0KPiA+IGl0IHNob3VsZCBiZSByZXZlcnRlZC4NCj4g
DQo+IEl0IGlzIGluZGVlZCB0byBjaGFuZ2UgYHRoZSBDR0kgZGlyZWN0b3J5YCBhbmQgaXQgaGFz
IGJlZW4gZG9uZSBhIGxvbmcgdGltZSBhZ28gZm9yIGFsbCBsYXlvdXRzLg0KDQpJdCBtYXkgaGF2
ZSBiZWVuIHRoZSBpbnRlbnRpb24sIGJ1dCB1bnRpbCBub3csIHRoZSBwYXRoIHdhcyBvbmx5IGNo
YW5nZWQgDQpmb3IgbGF5b3V0cyB0aGF0IHVzZSBgJHtwcmVmaXh9L3Vzci9saWIvY2dpLWJpbmAg
YXMgY2dpZGlyLCB3aGljaCBvbmx5IHRoZSANCkRlYmlhbiBsYXlvdXQgZG9lcy4gU28gaXQgZGVm
aW5pdGVseSBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGFzIGEgY2hhbmdlLg0KDQo+IEl0IGlzIGp1
c3QgdXBkYXRlIHRoZSBzZWQgcGF0dGVybiB0byBtYWtlIGl0IG1vcmUgY2xlYXIgdGhpcyB0aW1l
Lg0KDQpZb3UgYWxzbyBjaGFuZ2UgYCQnJ3tsaWJleGVjZGlyfS9jZ2ktYmluYCB0byBgJHtsaWJl
eGVjZGlyfS9jZ2ktYmluYC4gVGhpcyBtZWFucyANCnRoYXQgdGhlIG1vZGlmaWVkIGZpbGUgbm93
IGNvbnRhaW5zIHRoZSBleHBhbmRlZCB2YWx1ZSBvZiAke2xpYmV4ZWNkaXJ9IHJhdGhlciANCnRo
YW4gdGhlIHVuZXhwYW5kZWQgc3RyaW5nIGFzIGl0IGRpZCBiZWZvcmUuIEkgZG8gbm90IHRoaW5r
IHRoaXMgaXMgYSBwcm9ibGVtICANCnBlciBzZSwgYnV0IHlvdSBtYXkgYXMgd2VsbCBjb250aW51
ZSB0byB1c2UgJCcne2xpYmV4ZWNkaXJ9IGFib3ZlIGFuZCBiZWxvdyB0byANCm1haW50YWluIHRo
ZSBmb3JtYXR0aW5nIG9mIHRoZSBmaWxlLg0KDQo+IA0KPiA+ID4gKyAgICAgICAgICAgLWUgJ3Mj
XChpbnN0YWxsYnVpbGRkaXI6XHMqXCkuKiNcMSR7bGliZXhlY2Rpcn0vJHtQTn0vYnVpbGQjJyBc
DQo+ID4gDQo+ID4gVGhpcyBub3cgd29ya3MgZm9yIHVzIHdoaWxlIHVzaW5nIHRoZSBSZWRIYXQg
bGF5b3V0Lg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KPiANCj4gUmVnYXJkcywN
Cj4gS2FpDQoNCi8vUGV0ZXINCg0K

