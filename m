Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A112CE7D18
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:00:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.web11.79803.1727784001552955906
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oPRnIDRB;
 spf=pass (domain: axis.com, ip: 52.101.66.29, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slsqAinZtqGpFMYRHv9IXnQdqCtuecNl6qUA0vxxpSJakmOZXkStAxmncW8PX9vQ5nh6dM5NqAWPJJZN1nMpdHxtwC8NM33qnCU7wLtf6oyW3culV/weNcTXovdj8Y/2kQBthw48/69KdJI+EJcOfVBmYlgA0jW2uFlWno0WtQDnhL+lD4HGSs0co2feJsZc4J8fBErIk0OKyw9KD7Asm6XpjF1NAHACl3x0si99KUUNCBJr5VZA03HSk5cotU9dw04qkSfpfUFCymayniH1kTZFB+SBMO5gAwjXVfyK9ly+oXCQ7iN61JmplsMycWsMsXzEGI/WO7nPv/CXu3tG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRlOew6lYe2EASByDgoIiF6l0EgOXMUqyy92VDqfu34=;
 b=by3Osw2AhevdsuNHt2KWUPa+DCJLd/p2OjEY6rUsIvyDOXO7/1VzrE7EtmpHYrJ1t6JAn4NKLkCdVnsTUTAK4vHAH/tAeaAba1Wn5hSlmdTBw6A/zvQqP9U1LGTxEuHqVJ3nh9g8BV66dtrtBeFT0zTb0nqIK90ZHihbe9l3Jj4o+dCd0fedguzbqu0cswMC0sU7AxHndj+LeG4eSOzz20M30KlMWZd1a2/ROQJr0xd+SdTksLnaPDx7oRAiJTyS4RDPBdluzM5H9FUYH/TnpWHn1jU3z/LL4ybH3F8/0wjPjHFUqB6YkU0im0p4XEBffKMZ8XZIow//mjI18ArZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRlOew6lYe2EASByDgoIiF6l0EgOXMUqyy92VDqfu34=;
 b=oPRnIDRBkD+g9HblqM4YkhnaDHZVhWPpzfKLX12EYB86vnacku1Rf2MLvVy6ZXR5TWJNv8T1q2XMWBkqHuvw6LwElHV/POdowqm3jfY8yGeaeW1K8FpO3y0kBjEUqyRDS3mvo1CjU/LlgM6WjAXTRpDhpE3nUKocO2FfItKZA+E=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB3PR0202MB9274.eurprd02.prod.outlook.com (2603:10a6:10:430::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 11:59:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 11:59:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@eng.windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: AQHbDMIrdnc2MU/Dx0qg4q2/DYsKrbJludqQgAIOpQCACg1yoA==
Date: Tue, 1 Oct 2024 11:59:56 +0000
Message-ID: 
 <DB5PR02MB1021337FE7EFF0AE0B9BC1CB7EF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
In-Reply-To: <202aa218-94f5-46bb-a514-6118ad457078@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB3PR0202MB9274:EE_
x-ms-office365-filtering-correlation-id: cbbf04f4-4f75-441a-fa97-08dce2109191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VU5ZRGU4c29XM1RxNWtyYi9ydHhycnBTVk1IUmV0ckIrbkhmU3U0VGFic1ZG?=
 =?utf-8?B?Wks3REJVYTVzQXpCUzZGT2ZhUU43RG9TUjlWdk1TRVZYRUt1MGJGU1lDYlEz?=
 =?utf-8?B?NUlVbzExcmJxNVJPVURFMFUrd0NTa1g4b3E5MEdZSkVIUEVYdk4wNUdiL0FJ?=
 =?utf-8?B?QzNnTFRKLzZWV2RFMG9GSTB4YTE2UnllNWIwN3RmOWFNS0w5K0ZRUzlPaXQx?=
 =?utf-8?B?dVlQeTI0cGlGeHlTUjlaZW9zblQrUGhZZFVFTFJRTFc3R2JCR1c5Mkg4eGly?=
 =?utf-8?B?U0hjNUNZbjczU0xlbm0wdEdNcVFXTlRtZXZaVldFZ2R2dmtDRUVJWTlKNmVJ?=
 =?utf-8?B?T1BUSXFZYkxKemozZDYwN2R5aWxSZUdQSFdKNlF4L2VTVTUrUThKTDhqTzU2?=
 =?utf-8?B?V2hVQm13T2syUVhjQ1lXTEYvUDNOTW1kSGNZV3JYUVNwWXU3RU1pbUhpdTA1?=
 =?utf-8?B?S2hXL0FobHkwTDYyanRQM0IwOEZFS2RNbHF6aktKR1VJaVM1V2FNQnN1Y1d2?=
 =?utf-8?B?dnhQeFRnV2lvdTgvSFQ2eEZTRm9IOXJQeEROUG93L3Z4Y04rbFhXa2ovbCtr?=
 =?utf-8?B?eGYxNkQ4MUk1T3AvZ29peVlmUUo4RFBQWU5MLys0QW9QNE5jdzhHVTZPYWVv?=
 =?utf-8?B?WXlNSmV3TnZaUlp0b0MrbExFZUZ3eVo0a09GWFFTSkgvOUIvZjhQRUhWaHYy?=
 =?utf-8?B?czl5ZHFDOTlIOEVxbUpybXJNTGVtcGYya1RhTC9lS2M1MmVSb1VlMk5kc0tU?=
 =?utf-8?B?S09oS1QyZUJjbDVBdEE4NEh5anJLTVo5aXlkM01TQ0VTOWp6U2U3TUF1RHNJ?=
 =?utf-8?B?TXZiR2dIbTFaOGNlT0U1dTV2T2JhcDBvYkMxQ0tWWjJ6Tm1kYWp3M1JQaDcy?=
 =?utf-8?B?NS8xeFcybkZzMFBaMVFpUktmR3VFanRvdWZ0anpuSnhzT0tWNEhJMG9ZdlY3?=
 =?utf-8?B?aS9TajhodGRIV3RBcncxbi95YTFIVnVXWThFWDFsT2tTdUh4VmNTdlBJZU5C?=
 =?utf-8?B?SFMwNDlBczdpby8xRFVZY2xDclVIYXVaUjh5ZDNkQ1lVRHJHRjAvWHJERWhu?=
 =?utf-8?B?d3FwdHIrMUZLSm4weXVIS0ZjM0pkOFdpQ0hwajk0eE1CVkl1RzBRYTduL3RS?=
 =?utf-8?B?YzN5Ty9kaFF3OGJZOEFkS1NLZ2NNemFIMWdpU01TRkx2R24vRlhZeUxoQ2Mz?=
 =?utf-8?B?dXprZVRUSytvajd2dzRERUk4bVk4TUZDR3E4RkUrQ2k2Z0h2MXdpeDhGajVM?=
 =?utf-8?B?QXRWSGxMak0wb0hGSGJaaVUwb1NyY0h2YVlHQ2oyQndtcjFBb3g4cWZVN1BJ?=
 =?utf-8?B?cCtpanhKaTYyaEJkdHBKNnR0ZFpuWmZQb3U5em5hSjBXV2R1Tkh6NTJvMFpD?=
 =?utf-8?B?bnIrT1RvNW13UFoyb0x2cWI0eEhUSzNUdHRPL2pzOFljTVBVeEVhcVNCV0k0?=
 =?utf-8?B?dUw2MDNlVmFTS3lLdUp3d0MrR09qUmcyZEkvUHAybGtLbmxwNmJMaHducFY3?=
 =?utf-8?B?di9iMnhXTCtpL1NLZ1VMMVVWVk5YSDhYMnNTZkxCbjVBZzlCaGUybVlpQXFG?=
 =?utf-8?B?eFlSWS93dkpmaldFRkR1ZlRLQktFNnBva3Bncnd1UWkvZW9hNy9IYnJteHF5?=
 =?utf-8?B?WUpBUVg4Q21vSEtkZjNIM2oreWl2Z0w5ZHBvYk1BaGxBTkZORjJ4RXdwVmNa?=
 =?utf-8?B?UTJEelFyZnpnUS9wc0c5TzZHSURtRkc4REtLUmV3bS9kdEJpK3V3a3BadTdr?=
 =?utf-8?B?QzJRWFpPMzVpQmFNL2NJSnBhczY1N2MzRWNCc2hxZ1N3ZmpSUGVWYVpKVWd3?=
 =?utf-8?B?SkJNZDlUTXFZWEhWZTdSQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3JVeENWV2tLQURhdWJmU3VMK29BdTd6NUNuRGdKOFZHZUhCVVVURnk3Vjl3?=
 =?utf-8?B?djk2emdGbHNIcURnVWVIZEJ5a01QQnhMRjNxQzVCQmEvU1R3RC9saWJ2V0o0?=
 =?utf-8?B?Nm1WT0dxQzFjY1ErWlZ4WEN6dEJxZXNkczg2cHc0emN5RXdWM1E5OEVPajNM?=
 =?utf-8?B?QXpRZVpFNHQ4TFNmdUlvZlc1V01NeURkWGZkclUzOWZRQmxlcWcxN1hxc0ts?=
 =?utf-8?B?RzYvWUFLMjFIbXZEU2VHR2ljYzY1MUNVYXQxYk40ajJZR3B3QTduWGh0dTFl?=
 =?utf-8?B?SDRpZTNodWZFZlEvYXVMV3hCVnBONThsN3BJRmFQZDg2L1ZManp2STd1Vi9R?=
 =?utf-8?B?OUQ3cFlzUzF5ZEkyU0pTN0F2RjFrWEtiOHhaUHpxUFdHdU5SVVBIVUR3cjda?=
 =?utf-8?B?RTQ2L1hubldIb2dGRm8wTDk1b05INGR6cWUyKzJIRmdVS1VVNWRwVFVMa0tz?=
 =?utf-8?B?aEZqUURsenhIZXVjcHhkRk9tYnhPVDArSm1EY1ZvSG9jT1hIbGVJQlo1b1pS?=
 =?utf-8?B?V0QrN3VGT3JOenJNeGk2cWcraW1BczFKeG9wRjNtQTAyREo3ZzRkMEhoT0JP?=
 =?utf-8?B?Nk1yZlFKcDExc1FxUVVSVDFaMHBhNkk0aW1TVzRPV0NrTEVOd21CTkFSTndK?=
 =?utf-8?B?Z3FIQ0JySUNoT2ZXRDllL2dycDdTZnpoZCt3b0VOOUZGNHM0NnY3NGk5TWkx?=
 =?utf-8?B?Lyt2cDhzYnhpZFlpV1pmMkdoY3d1aGFEM0FuWG16YmttTzNnTWNYTnVsSkNj?=
 =?utf-8?B?NllIZXZ6Y0FLdDdDNk9HQnVMM1pqTmUxV0FpTTl1OTcrRXpGM21uNjYwZDdI?=
 =?utf-8?B?UGdPeHFmaUJVZmtIT2xvVlRBVmxoSk5rRE5OOGRXaFV0Rlp1eFpVa0c4UVZq?=
 =?utf-8?B?Q0l1NE1KR2JMK0FqbHJlZkFqdzIwNGVQeU5UT0cwZXlCY1FYWVA3d1FEbyts?=
 =?utf-8?B?a2tOYWsxdHdGVHBHY3I5YXN1NUlyc1owb1prRGt3MFFxZURlejlFdElXU3U2?=
 =?utf-8?B?S2ZIbnl5djNab2I2czdxbXpOckh0K0VMeDZueEJ3RFBpdUM0L3RqUUY4VDJR?=
 =?utf-8?B?RDNSb2J1LzFUbXdBZFlqQUtDZEVKRk80R1VZc0crM3VvQVdra0J3eXRsbUtB?=
 =?utf-8?B?SnJ6Nkh0QzNHWENKNFh1K29qeENRZUxPRndmQjJEbHc3SGt2elVnVXFBNmRD?=
 =?utf-8?B?NjVmOGFFYnpIcnV4cm02Z3dKUjRnbTdTSzVER1IvRzQ0VlpzKzRrd0x2UldF?=
 =?utf-8?B?eVgrRkUwcVM3TG5Rbm5kdVlIL3ltTmhIZHlKc20vcVp1RWcybEVIWm12bUNL?=
 =?utf-8?B?TWhXaGJOaGp1c0N2QjZHWkVsejliOGU2YkhycDNJVVpDK05hZXhCYk9OVXFz?=
 =?utf-8?B?Z1llbndFOFlhZll3eU9YaTBmMUJLN1N6VEFLMnFVMW5RQnExZTNjdndZUmZj?=
 =?utf-8?B?aVdwdjBqRWZuOGlhQWsyaWNPMXcvTnp6ekwyeXlyMnR3eE9LSnc3djNDREJV?=
 =?utf-8?B?bzdGQmhDTzJSL3FhbFZkWDdBaEpKbVZKVS9ub3ZZVE9RcUdkMmhhWjNibm9O?=
 =?utf-8?B?U3pmSlREa0t5WlRsQldBbU5iVHB6b2J6b1NnR01CdzdtRHB2ZHFRYlpFVmZS?=
 =?utf-8?B?T1IwOThrbHliRmRDNW9QOUR1MnN5T1Q5eGxFTGVXOWU1TVMyekFsdjA3a0dh?=
 =?utf-8?B?U2RFdW1xTVhBTXBMUmJSdmNjdnI4NXpMbDdDRU92V1hrY3RYZlVTM3ZOdXR4?=
 =?utf-8?B?Ulp0WGNFeVNwTVhjU2phNkduMHEwanMrN3d6Vk9jQWpLVnI0L0lVVXFEdDYx?=
 =?utf-8?B?d2dzckM5Mjk3Um16MndsRWFrdzJUQ1luVGphZE13VUljVmVrbFZ3OHhqZUxn?=
 =?utf-8?B?cVJJVXc3c1NNQk94aWNDQ0NpeHdxUFZ4RExuWW5aK1RlbGxJeXFtL01melpB?=
 =?utf-8?B?SWJZSTk5TzJEeWVyVHJvdzNOdGtlOFdna00wczNLVXNxZ1o2WnNjWWJpWW9D?=
 =?utf-8?B?ZFZpUTgyYkJ6Zm10bjBGY0Mvb3laSXM5RSttb2I4ZTNaMWNwc2NmRC9IZGxq?=
 =?utf-8?B?dVVQR2taWkkyQUJEdTVjbHFMUk44OS94ODI1VEl3NkNaQjR0Vm4yTUhUWjNh?=
 =?utf-8?Q?VpQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbf04f4-4f75-441a-fa97-08dce2109191
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 11:59:56.8891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPyJsWNMIGmgdvLTyY7boE+7Z/Qcy39Pjim0EsssynpIvBHcZswBRBjg6W4VRp27
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9274
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 12:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112630

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZaSBaaGFvIDx5aS56aGFvQHdp
bmRyaXZlci5jb20+DQo+IFNlbnQ6IGRlbiAyNSBzZXB0ZW1iZXIgMjAyNCAwNDoxNw0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBZaSBaaGFv
IDx5aS56aGFvQGVuZy53aW5kcml2ZXIuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENI
IDEvMl0gcHJvdG9idWY6IGFkZCBhYnNlaWwtY3BwIHRvIFJERVBFTkRTDQo+IA0KPiANCj4gT24g
OS8yNC8yNCAwMzowMiwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IE9uIEJlaGFsZiBPZiBZaSBaaGFvDQo+ID4+IFNlbnQ6IGRlbiAyMiBzZXB0ZW1iZXIgMjAyNCAw
OTozNg0KPiA+PiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gPj4gU3ViamVjdDogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMS8yXSBwcm90b2J1ZjogYWRkIGFi
c2VpbC1jcHAgdG8gUkRFUEVORFMNCj4gPj4NCj4gPj4gU2luY2UgY29tbWl0WzFdLCB0aGUgbGli
cmFyaWVzIG9mIGFic2VpbC1jcHAgaGF2ZSBiZWVuIHNwbGl0dGVkIGludG8NCj4gPj4gc2VwYXJh
dGUgcGFja2FnZXMuIFdoZW4gcHJvdG9idWYgaXMgaW5zdGFsbGVkIGludG8gdGhlIGltYWdlLCBv
bmx5IDQ4DQo+ID4+IGFic2VpbCBsaWJyYXJpZXMgYXJlIGluc3RhbGxlZCBhcyBydW50aW1lIGRl
cGVuZGVuY2llcy4gQnV0IHRoZSBvdXRwdXQNCj4gPj4gb2YgJ3BrZy1jb25maWcgLS1saWJzIHBy
b3RvYnVmJyBsaXN0cyA2NiBhYnNlaWwtY3BwIGxpYnJhcmllcyBhcmUNCj4gPj4gcmVxdWlyZWQu
IEFkZCBhYnNlaWwtY3BwIHRvIFJERVBFTkRTIHRvIGVuc3VyZSB0aGF0IGFsbCByZXF1aXJlZA0K
PiA+PiBhYnNlaWwtY3BwIGxpYnJhcmllcyBhcmUgaW5zdGFsbGVkLg0KPiA+Pg0KPiA+PiBbMV0g
aHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQvP2lk
PWRkNjQyMWU2NWViNzVjMzVhOTA0ZjRiNDg3YmEwMjIwNzUwMzVlY2MNCj4gPj4NCj4gPj4gU2ln
bmVkLW9mZi1ieTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIuY29tPg0KPiA+PiAtLS0NCj4g
Pj4gICBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfNC4yNS40LmJi
IHwgMiArKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90b2J1
Zl80LjI1LjQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZf
NC4yNS40LmJiDQo+ID4+IGluZGV4IGNjNTIwNGRlNC4uMzU0YjMyMTNhIDEwMDY0NA0KPiA+PiAt
LS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHJvdG9idWYvcHJvdG9idWZfNC4yNS40LmJi
DQo+ID4+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90b2J1Zl80
LjI1LjQuYmINCj4gPj4gQEAgLTEwNiw2ICsxMDYsOCBAQCBGSUxFUzoke1BOfS1saXRlID0gIiR7
bGliZGlyfS9saWJwcm90b2J1Zi1saXRlJHtTT0xJQlN9Ig0KPiA+PiAgICMgQ01ha2UgcmVxdWly
ZXMgcHJvdG9jIGJpbmFyeSB0byBleGlzdCBpbiBzeXNyb290LCBldmVuIGlmIGl0IGhhcyB3cm9u
ZyBhcmNoaXRlY3R1cmUuDQo+ID4+ICAgU1lTUk9PVF9ESVJTICs9ICIke2JpbmRpcn0iDQo+ID4+
DQo+ID4+ICtSREVQRU5EUzoke1BOfSA9ICJhYnNlaWwtY3BwIg0KPiA+PiArUkRFUEVORFM6JHtQ
Tn0tbGl0ZSA9ICJhYnNlaWwtY3BwIg0KPiA+DQo+ID4gVGhpcyBkZWZlYXRzIHRoZSB3aG9sZSBw
dXJwb3NlIG9mIHNwbGl0dGluZyB1cCB0aGUgYWJzZWlsDQo+ID4gbGlicmFyaWVzLiBXaGF0IHRy
aWdnZXJlZCB0aGlzIGNoYW5nZT8gV2FzIGl0IGFuIGFjdHVhbA0KPiA+IHJ1bnRpbWUgZXJyb3Is
IG9yIHdlcmUgeW91IG9ubHkgbG9va2luZyBhdCB0aGUgb3V0cHV0DQo+ID4gZnJvbSBwa2ctY29u
ZmlnIC0tbGlicyBwcm90b2J1Zj8NCj4gPg0KPiA+IFNpbmNlIHRoZSAucGMgZmlsZXMgYXJlIGlu
IHRoZSBwcm90b2J1Zi1kZXYgcGFja2FnZSwgd2hpY2gNCj4gPiBkZXBlbmRzIG9uIHRoZSBhYnNl
aWwtY3BwLWRldiBwYWNrYWdlLCBhbGwgYWJzZWlsIGxpYnJhcmllcw0KPiA+IHNob3VsZCBiZSBh
dmFpbGFibGUgaWYgeW91IGFyZSBhY3R1YWxseSBidWlsZGluZyBvbiB0YXJnZXQNCj4gPiBvciB3
aXRoIGFuIFNESy4NCj4gDQo+IE91ciBjdXN0b21lciByZXBvcnRlZCB0aGlzIGlzc3VlLiBIZXJl
IGlzIGhpcyBkZXNjcmlwdGlvbjoNCj4gVGhlIGFic2VpbCBsaWJyYXJpZXMgd2lsbCBiZSBpbmNs
dWRlZCBpbiB0aGUgU0RLLCBidXQgbm90IG9uIHRoZSB0YXJnZXQuDQo+IFRoZSBhcHBsaWNhdGlv
biBpcyBidWlsZGluZyB3aXRoIFNESy4gVGhlIHlvY3RvIGJ1aWxkIGlzIGFkZGluZyBwcm90b2J1
Zg0KPiB0byB0aGUgaW1hZ2UgKG5vIGV4cGxpY2l0IGFic2VpbCBsaWJyYXJpZXMgYXJlIGFkZGVk
KS4gSWYgYW4gYXBwbGljYXRpb24NCj4gdGhlbiBhcmUgYnVpbHQgdXNpbmcgdGhlIFNESyBpdCBj
YW4gbm90IGJlIGV4ZWN1dGVkIG9uIHRhcmdldCBhcw0KPiBsaWJyYXJpZXMgYXJlIG1pc3Npbmcu
DQoNCkNhbiB3ZSBhdCBsZWFzdCBjaGFuZ2UgdGhlIGRlcGVuZGVuY3kgdG8gYSByZWNvbW1lbmRh
dGlvbiBzbyANCnRoYXQgaXQgY2FuIGJlIGF2b2lkZWQgdmlhIEJBRF9SRUNPTU1FTkRBVElPTlM/
IEJlY2F1c2UgYXMgaXQgDQppcywgaXQgcGVuYWxpemVzIGV2ZXJ5b25lIHRoYXQgdXNlIHByb3Rv
YnVmIGZvciB0aGUgY2FzZSB3aGVyZSANCm9uZSBwcm92aWRlcyBhbiBTREsgd2l0aCBwcm90b2J1
Zi4NCg0KTXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSB0byBjaGFuZ2UgaXQgdG86DQoNCiMgUmVjb21t
ZW5kIGFic2VpbC1jcHAgc28gdGhhdCBhbGwgaXRzIGxpYnJhcmllcyBhcmUgaW5zdGFsbGVkIGlu
IGNhc2UgDQojIHByb3RvYnVmIGlzIHByb3ZpZGVkIGFzIHBhcnQgb2YgYW4gU0RLLiBFdmVyeW9u
ZSBlbHNlIHNob3VsZCBhZGQNCiMgQkFEX1JFQ09NTUVOREFUSU9OUyArPSAiYWJzZWlsLWNwcCIg
dG8gdGhlaXIgY29uZmlndXJhdGlvbi4NClJSRUNPTU1FTkRTOiR7UE59ID0gImFic2VpbC1jcHAi
DQpSUkVDT01NRU5EUzoke1BOfS1saXRlID0gImFic2VpbC1jcHAiDQoNCj4gLy9ZaQ0KPiANCj4g
Pj4gICBSREVQRU5EUzoke1BOfS1jb21waWxlciA9ICIke1BOfSINCj4gPj4gICBSREVQRU5EUzok
e1BOfS1kZXYgKz0gIiR7UE59LWNvbXBpbGVyIg0KPiA+PiAgIFJERVBFTkRTOiR7UE59LXB0ZXN0
ID0gImJhc2ggJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncHl0aG9uJywg
J3B5dGhvbjMtcHJvdG9idWYnLCAnJywgZCl9Ig0KPiA+PiAtLQ0KPiA+PiAyLjI1LjENCj4gPiAv
L1BldGVyDQoNCi8vUGV0ZXINCg0K

