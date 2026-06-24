Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3DACD4F26
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 00:15:07 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1673.1782260098066696915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 17:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=ibCVaTvB;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.33, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5mmO97wCC7CUbRWg0hUM1YCK21Cb3J/35OvShWmmjDFxRjkQmJ2A+qtyTS9QPlB0T0RVKewhggea8Iz4NDKFOVNu9If9VDGukpWbZrr1sPgKCblsQ2I1ThifyOfFcAZFpGSiVJVw9mzVIo4U4OuLp+cHEGrT8xXuxfNsx3aPWy6PInxYYeG5aDtHuPrv/I1E4b/q64rHWWEMxv7ylQagZJ2ZUyqVBCq+cIPiIF8PbytAY/OUpoFGEft/pQELfDuKqb8XaC0i49ozPZfSaEJxLTMJOTZVj3cLfUb2ShheGCd9/HN50jFPL6/GKzEL4IPDmCb2zfAvi3ju8oY1pnxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwzUg9q6/qUqMGtEn8fCMSWFUKp9NXU2D3jPmMuxvKo=;
 b=OSurvI6pCipTMEfj7Ok6/hT84d+nWI/2T+6dQ8kPCPRtDnNOoR+RwpmnAqQ4K7MKaR0GMYTsbMzoUDth2aaHek19KMqH8/IziZQPsIHqpW3V/VdS7LqrqEr2/PsYRj4zaJmSS3QYCYy4DFJDdL86v2odhfb8iVi23C6pei58CBtYPfjb0P6Q2qvOWM2/EK69IqlUWSlcIEBAJE/fuNpHM/JwGIwcZkUBufq+KdUAcE3O8EEfNjd604DPV3KeLwQjwlnthesIrhJ7lNPUzt4JI1L8b+fRKNZ9dS1wlMFqRCQJlJ8cgzZilZq74OXpqZJCwIO3S0kRjbLr2g7hpKLy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwzUg9q6/qUqMGtEn8fCMSWFUKp9NXU2D3jPmMuxvKo=;
 b=ibCVaTvBC4afDuWTcW4JirJA55ltPjm+8lVOpgC5Cp7LwwxLPgh+pXxHfMZwj5lr4SLnOt25AJwuenYACjd1gyP4xSbyO8Do21iiRoo7nfsk+KGdVgVl9+fEzahGmZc8wm7eKpgvl7+y8atEEQ02LF1zZEoioUQ+ErfIvDBZWVvZu8/b5iV1WtKjdvt5i9+6ILmXgiQQhg/8gUqnOfwYFg0aGXBFAKetNWMqAxWZkCbOROzobOeEGbxlYoHxH3vZqeKezSv7VVnfAm5QwghHuSLfOEInDA4vnBDNcXrQSS7qBdJIQ6IzX3qKiTouwBtp+XJWNaLepBqTNFj+PpnwpA==
Received: from TYRPR01MB13423.jpnprd01.prod.outlook.com (2603:1096:405:1c7::8)
 by OS3PR01MB7407.jpnprd01.prod.outlook.com (2603:1096:604:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 00:14:53 +0000
Received: from TYRPR01MB13423.jpnprd01.prod.outlook.com
 ([fe80::3d11:d8ae:995f:1776]) by TYRPR01MB13423.jpnprd01.prod.outlook.com
 ([fe80::3d11:d8ae:995f:1776%3]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 00:14:53 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++17
Thread-Topic: [oe] [meta-oe] [PATCH] crash: build bundled GDB with GNU C++17
Thread-Index: AQHc/VzyqE2DuSbUmUWvwWFw53XZ+bZM4aYQ
Date: Wed, 24 Jun 2026 00:14:53 +0000
Message-ID: 
 <TYRPR01MB13423ED75D4D9C166432FD39ADCED2@TYRPR01MB13423.jpnprd01.prod.outlook.com>
References: <20260616065405.440-1-wangmy@fujitsu.com>
In-Reply-To: <20260616065405.440-1-wangmy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=63e668c8-f6fc-46ed-8018-d5ec4992fd3b;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-24T00:12:47Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB13423:EE_|OS3PR01MB7407:EE_
x-ms-office365-filtering-correlation-id: fbe8f138-09d5-4d21-86f1-08ded1859d43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|1580799027|22082099003|18002099003|38070700021|11063799006;
x-microsoft-antispam-message-info: 
 A5MiG6zouGrcvPp5vWXJlcREVLxElXF85IgWDJ8GFrAlGXGX2vYSrcj2gZgHGQ9F6t9a8rDcLhLceoObdLC5zPMj8NAulk+VXojAVAcBWS45MjHpAq/k2Te3yr3l/yP294QJUVTcHYE8EiDLTKcMlbD8G1SktvKSI2/MyEW2VtZ8kTNACXsUYiN2sN0avTO3znFNWE83DZr8FmOvlah9TEWIR+WeMwBGDSXK29ku4WIAcMegOyWHYSfcpeC+IKoZsuKtnA/PLyUSbxmGh9MpfNPdpIrygJ/I9uVUv1trILiLU3uGH3X8PeZXiu+hOsQShn2aEVkoI1Mv1zHe9UwF52N/izvWgl2RsVc4mZlAN56qFdFjDxp5WCMoOrTnYhZ30LjvlcRniLqyvLAaMWFfztwD1wjbpT20YDNyc9uV7hvtR699D4+uld8oQvEt+mc7HIjJwZ+veUdb9H1E+Ft5TfWfxvVftUtg3eaBwoU3cQ1n4+F/o6YVb8LiKyGAR8PAnL2BZUk7FGvaFmj25DLM6hZJLNqlYGFeHlYBc+KSBsp9GtCfEYmicPVV38PwLFS1BCk+pEh+vZeNHnodXhcXKGyw9oUDj/VcfduqT0C6bncMVvd6odqHGGwvLzlv+6YSepmo4r4qSNi/7ePGNdVRyAONL9jJekL06Cmt8qpcUgM1Vs0WgUjd0xdol9V64BMPMe4jwRyQlcWETbP0VOooYmrbk9/KchUI98la5uBCsxRgfEJzU3x5IY7VicUDvlLZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13423.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(1580799027)(22082099003)(18002099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?TXJFdzBMbSt4d1dPUVovcVB5KzgyS2xTUEs1TndMSzFhQlpIRTFmYm5aNEZv?=
 =?gb2312?B?UXk4MVZpU1pWRjUreUtsakNlZlUrK2oxNmVnK1dmd3ZDSXpwYjVjWURxQ2Q0?=
 =?gb2312?B?R1RFQ0dOUmdNWXhGMXFYalphejJRR1N6ZGk5dWF1d2JvRnV6QmtsVVRkSHRr?=
 =?gb2312?B?QVJRT3htK3pPZ0ZCbGYyVjhxb1Z2Mll2QkF0VGtVVzF2ZloyZ09pL3VxUmFJ?=
 =?gb2312?B?aUk5cG5Yam5WazBoaXpIUVc3MzRoVVZveVdiODVsakl4VklsSTNjeHhodnBP?=
 =?gb2312?B?dE5VTEN5eGIrS2FPaUplWjBQZVlucXBGUmsvZStrdU1sbDFFSFluSVZrdm54?=
 =?gb2312?B?WEE2L05Jd1BzenFia255amRMdXRvVk51YmdtL21URndMTXFBcklyUDgrWUFP?=
 =?gb2312?B?OS9FM05lZGpwR0NteHEzanZxLzgwaCtlYUhkcmR3SSs0UHJaMldlMWRTdUpP?=
 =?gb2312?B?WXZXSEtHVDZVcXFzS052R1JyQjFHZ2xMdUVBeVJjWHUxRXVMdVZXWjRLT2xn?=
 =?gb2312?B?dTU5TjNsU2xNZmltakVzUUEwYTFPdkhUN1ppc0NaTm1TTjR3RDBqaDIyb3ZO?=
 =?gb2312?B?NFNSWVdRSUpsNENmVmxvTk9CN216ZXpkd2hjNHI3dTZLMWJwV3BIVjBKTmtN?=
 =?gb2312?B?M3M1cXFibFN4NnQ2OEhCL0xqMXByc3czeXBXWDFIdThESmJsM3FmRkZubFVW?=
 =?gb2312?B?U2lwcWJjQml4QjkvYkpUWmxSOFJIeVl1elhVUjFTY28yejF0dnR2V2p5alla?=
 =?gb2312?B?b1lKY3crWko4VkRjVUFDTHFSblg2dmxiSGJrOThITnRLbk9yZkgyVVVwcTEv?=
 =?gb2312?B?Q2V4Q1Q2eTBRTlNJQnBkVWM2QmlSdlFWMk1oZXJiakgxd05EcFJ5RDl1RmlV?=
 =?gb2312?B?WFJtdmYranNuWDZHeTlvcWx0Wm84Tis4dXNyd1RxaFFpVE11TytGTmtKbzFM?=
 =?gb2312?B?ejhNQnVmeDI2RnhxWFJqYmoxTTl0UnVsRVZzS2JCMDY5T3RtV0x5MmJpKzN6?=
 =?gb2312?B?Vzl5YjNPT29KRTBHY3hXeTU5QjBsR2toQUlTR3o2VWRSdW5CSHhPR3FSMU80?=
 =?gb2312?B?L2hXYnI5SXdCM3JBRGgwNkJHUkYzcCtvUlhqdy9rYzd0ZldBS2xBQlpWYVZ0?=
 =?gb2312?B?VjRzeXNKNXNNa1JhNGFwREpmdHVmM25NU2JtdUdScjZVMXZPclRwSXZSMFZQ?=
 =?gb2312?B?cUh5M3RMZkJlTzBLem40c01DTTZPdGlPcFVIMGdodng3QTJObnc3QlFZWE4x?=
 =?gb2312?B?QVB5dDJzSVp1dFVnekwyM3ozOWpzcUZBSDRGUitMZk9ybDg0RVF3c2JlOWZI?=
 =?gb2312?B?KzBiSCsyd0RjMkFWYyt6UFhCcFc5eThLS3FqcmlUMVBHbDVJeG56RGhUQVFk?=
 =?gb2312?B?eml6UzZiNGxWTnZpT0hYS1V0NEpweDNLZVpDMWtvckF5S1pnalh3RlpGZkVK?=
 =?gb2312?B?eVhQUHEzc09XOE5vREdJRlVlM0JkcEhzbzlTYnlrcklBWjBSeDcwSzNHUGo0?=
 =?gb2312?B?MHJwY0VFZkQ2WkhMMnErTWRXMWJaMTJaRXVqcXJRaUREZWJNS1czSm9CbnFa?=
 =?gb2312?B?VGkxajg2andsNlJlZ3psWU1MeWZzRVlXV3dvMFh3QmwzZWR3azJZbTZYT3JX?=
 =?gb2312?B?VnhublJwekhSRGRZMFZZRU5oN3hrdjJFNTk2NEY3RHZFNURiMENZYWJCQWQx?=
 =?gb2312?B?K1g3Mk4ydlQzcUhsZmpuZ2xxN2l0UTZCbWxGNnVmREtoWnFSQkVxTTNzUlIw?=
 =?gb2312?B?QXl2ODF0MExuUmhYZUQ4Z3dORzFubHdHQW5rREJBYjh4R0RnZDFQaWdPN3c2?=
 =?gb2312?B?Z1VGUFBKaGt2MDdDQ1ZjTkRScXp3dFdlVDhXVUFZSmU1NjhZRTN1aEdiVkxG?=
 =?gb2312?B?N2lGZVpUMVJCSnZEUzlJWE5RZEkvU1V6b1BBWDNQdUx0YkJYMktzcnEwMzVT?=
 =?gb2312?B?QzF0Wi9WY2ViT1R4RVhhNEd6YzBGS0dZRFhSSmRMSEpwU2dzcGhJN2JEdEpm?=
 =?gb2312?B?aWJ1YVdOcGY0WnFSN25ZemdJS1F2TUdPeVVaTjJEdDhiMlhMdVlTVXA0UTZy?=
 =?gb2312?B?TnlqalRrTUFncjFaSDd6elczRlhsYTgva083Zi9yTU1GbWJ4T1JQRXZlRGU3?=
 =?gb2312?B?VUU2SUYvZk12aVN4WW02MThBRmwybzNSdVU0aHNYckRCb2hjT1hGVDB6T2FT?=
 =?gb2312?B?K0Z5Vzc5aGVCQ0kyNnBCdHVHeHBvSGVjOURXVmgwSlREd1hkRDR6cUVTb0Zw?=
 =?gb2312?B?SDVpSnZiVzBOaUFBU2liekNQYjFXMmE4Y2diZ0xtM3ZxWWw2VXpTYkJzY0Fi?=
 =?gb2312?Q?Mn7uM2RVENnDmIjKTh?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	OnL09G82hAHKPmsbhYWi8pjT2WR3OffOdaqa6sxL/1pzxoD2QY+dGwCW3gvyUzVjfkgzSrMj4C1ByXGn3/1iJycuLw4H1NjngeJXwOwoIUABpsR5JrjmskYxe2RrUschGre3G651IwE3czAyOCtNSCJwOWNc0NUQ2FVv416z7n9El8R1uAWSeWOCA2Xu3fX9gfz1Qg2ct2KiQHXDbx86wDWV7jv2A3/2ersJsqxUBydeHfUkmuqVjV5b3SNdZn6F2Q8f+Xg2wamOB8pwG2GQnxdsk2SnvSxapIsVxqVcttW9r4T/ktqe+b5ypZ6wkTg/jDLc4IykTT882NKpngBWYA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13423.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe8f138-09d5-4d21-86f1-08ded1859d43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 00:14:53.2195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfH28AYaSLslK9hTKpsgc/MaIDFHDzB/aOnv1KMlrUoT27vqkJk+MqkJdhJ4WYXqf6ebOCIoEYO3ePgS9Kg4YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7407
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 00:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127702

SSBzdWJtaXR0ZWQgYSBzbWFsbCBwYXRjaC4gDQpJIHdvdWxkIGdyZWF0bHkgYXBwcmVjaWF0ZSBp
dCBpZiBzb21lb25lIGNvdWxkIHRha2UgYSBxdWljayBsb29rIGFuZCBsZXQgbWUga25vdyBpZiB0
aGVyZSBpcyBhbnkgaXNzdWUgd2l0aCB0aGUgcGF0Y2gsIG9yIGlmIGl0IGNhbiBiZSBtZXJnZWQu
IEmhr20gaGFwcHkgdG8gcmV2aXNlIGl0IGlmIG5lZWRlZC4NCg0KICAtLQ0KQmVzdCBSZWdhcmRz
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldh
bmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4g
KEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUyjuis4
NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4
NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSnVuZSAxNiwgMjAyNiAyOjU0IFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogV2FuZywgTWluZ3l1L831IMP56KQgPHdhbmdteUBm
dWppdHN1LmNvbT4NCj4gU3ViamVjdDogW29lXSBbbWV0YS1vZV0gW1BBVENIXSBjcmFzaDogYnVp
bGQgYnVuZGxlZCBHREIgd2l0aCBHTlUgQysrMTcNCj4gDQo+IEZyb206IFdhbmcgTWluZ3l1IDx3
YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBUaGUgR0RCIDEwLjIgc291cmNlcyBzdGlsbCByZWx5
IG9uIHN0ZDo6YWxsb2NhdG9yOjpjb25zdHJ1Y3QsIHdoaWNoIHdhcyByZW1vdmVkDQo+IGluIEMr
KzIwLg0KPiANCj4gVGhpcyBjYXVzZXMgdGhlIGJ1aWxkIHRvIGZhaWwgd2l0aCBlcnJvcnMgc3Vj
aCBhczoNCj4gDQo+IGRlZmF1bHQtaW5pdC1hbGxvYy5oOjUyOjEyOiBlcnJvcjoNCj4gJ2NvbnN0
cnVjdCcgaGFzIG5vdCBiZWVuIGRlY2xhcmVkIGluICdjbGFzcyBzdGQ6OmFsbG9jYXRvcjwuLi4+
Jw0KPiANCj4gRXhwbGljaXRseSBidWlsZCB0aGUgQysrIHNvdXJjZXMgd2l0aCBHTlUgQysrMTcg
dG8gcmV0YWluIGNvbXBhdGliaWxpdHkgd2l0aCB0aGUNCj4gYnVuZGxlZCBHREIgc291cmNlcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+
IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9jcmFzaC9jcmFzaC5pbmMgfCAxICsNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1rZXJuZWwvY3Jhc2gvY3Jhc2guaW5jDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWtl
cm5lbC9jcmFzaC9jcmFzaC5pbmMNCj4gaW5kZXggM2M5YTk5YWU0YS4uY2Q0MGZmYjllMCAxMDA2
NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9jcmFzaC9jcmFzaC5pbmMNCj4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9jcmFzaC9jcmFzaC5pbmMNCj4gQEAgLTQ0LDYgKzQ0
LDcgQEAgQ09NUEFUSUJMRV9IT1NUOnJpc2N2MzIgPSAibnVsbCINCj4gIENPTVBBVElCTEVfSE9T
VDptaXBzYXJjaG42NCA9ICJudWxsIg0KPiAgQ09NUEFUSUJMRV9IT1NUOm1pcHNhcmNobjMyID0g
Im51bGwiDQo+IA0KPiArQ1hYRkxBR1MgKz0gIi1zdGQ9Z251KysxNyINCj4gDQo+ICBFWFRSQV9P
RU1BS0UgPSAnUlBNUEtHPSIke1BWfSIgXA0KPiAgICAgICAgICAgICAgICAgIEdEQl9UQVJHRVQ9
IiR7VEFSR0VUX1NZU30iIFwNCj4gLS0NCj4gMi40My4wDQoNCg==

