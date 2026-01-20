Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127FED26294
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:16:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14560.1768936599437689688
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 11:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=j0FGkyYD;
 spf=pass (domain: axis.com, ip: 52.101.70.60, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV0JWaUGX10rbOfnsAu7PbRaYBkxpUzVh70plu5I5EKHIxoEd/lYVUwEwMgccuQpGIZsn29/GJhv08/PHQ/wjHVRZnWtSlUTfcKMTWb9jG9cddNXOPFxIz9UN1B10JVMZVslel2XCCilHvcKBT0DHLKVX3Qt4w1XWSTHJcEDAY+k+7+4ZTKbtV2EV/T23rweHBPSnyLS0tzKbKBaN6+OPaXztqnpurUhzcUD7UO+K2bsqJwZLpNrG5eHH2PCVrF0JtLH4adz+CqLit7Bk766fUoG+8//btW0CGIvQqtvO2uds1qIWePIFE0o0qA2HgXlQy/kF/EogI+ItiNSbGoWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXn1EmxDjcx4kfI8njlF+gl+6ZfUHiRtJca3k5QmsQA=;
 b=oBbfP43Ym3kZ8mfe2ggbgS+tSajamQfxVAVGFOzXEt9TnkURBhKK6r3rLGd1VTWWOItWqVAWW7mw5msiVEZqAjEOM/lwoID7Y13dE5IwfvfNmTAD71Vt8RGAAS8U74wngIimE6lVKqc3AH+ixBkvLG3b36OGJZ/B8OC1M8h2gH6A6i7qLY9+oaKcJFEzEsNPYGug+yhJ715Enw0GBTW+dmI3AipLdX1TOHdWpROpxbrcGXWCKFRqs0oWDjyvEIbQATcoxR9eLVmgtYSXQIuI/Hq+n3kOvUCxldXEdgyVcyhU/oxAH9Ezfc9roU728kCEk+uRDwQ0iOHmMR3zs6WZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXn1EmxDjcx4kfI8njlF+gl+6ZfUHiRtJca3k5QmsQA=;
 b=j0FGkyYDMs0Ir+0mE5z33cjZ3bBYaVYs8fh7hlf8zXaQvVITcvHgAb0tJIbgC0kV43Bqe6G9+/ki4bfMNodTOBSqbLECGma3rtjzivpgQMQJUzsbPVhMUsTriljL53WhjL7Syh7dTIyEv2RezbKMnrpxaux6KGZmgycDdLE6Jxc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB8512.eurprd02.prod.outlook.com (2603:10a6:10:38c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 19:16:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:16:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH v3] glaze: add recipe
Thread-Topic: [oe] [PATCH v3] glaze: add recipe
Thread-Index: AQHciT9k0iR0WAuLJkuSc+mHDdmr67VbFhjAgABPsQCAAAoCMA==
Date: Tue, 20 Jan 2026 19:16:35 +0000
Message-ID: 
 <DB5PR02MB102135796A87069606BA06C02EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
 <20260119122944.1111081-2-frederikbraendstrup@gmail.com>
 <DB5PR02MB10213684AAECDAE76758A53A8EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <DFTMWKW1O2OQ.1JPJSQMDFL3KM@gmail.com>
In-Reply-To: <DFTMWKW1O2OQ.1JPJSQMDFL3KM@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB8512:EE_
x-ms-office365-filtering-correlation-id: d94ed972-b3d7-4166-1247-08de58586d8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|19132099003|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NS9iTEM0STFWeGdmbzg5ZTY5REhmaE5mTXB4ZnZhOWYxaDM2OGJNclhhb0ds?=
 =?utf-8?B?RG1PZzJZVStJRDE4UkJteXB2emE5ekIvRmpxUFY0TEhOZUh1UkdzeVR3aldB?=
 =?utf-8?B?Ny9LYzdXSjJ4dmFTenR0NHFaMTlpVlFaQjFSb1VKMlNmYVRzZkdNN2I4L3Fh?=
 =?utf-8?B?UmJnWHRhbmtHaFB3bXlaNUhYMEFWbHV6MktzSGtkYndySkVRYlFUMG1SeWRF?=
 =?utf-8?B?QjJlYnZzeWQ2UUJ6bUxjVUxsbEFNSnlON1haR2Mxbyt5dFI3dkUydGVCVGdB?=
 =?utf-8?B?NnEvWTR2cHpOdlAvdVk1OGlsbThZWDYrdUpCUWpqZ2p6dDlDczVvTk81SHhl?=
 =?utf-8?B?SjBXZnFXdDN2RElvazVtVWp2SGVHQmYwcTl6eUZBQjJJOG5FanVHb09TQzZv?=
 =?utf-8?B?Zmwzb1lsQzBwMW1vbTJ1ZVZlbXQwWXBHR0Fsd2hiT0NmU2VEejg5VEZEdEtp?=
 =?utf-8?B?R0J3T2Y3dmNKWnp4eWpTdDB3S05xajEraVdNZ2RZMnFSUUhKMVJ4ZGNsOExr?=
 =?utf-8?B?enVzVDFJRkhLaTVBWFl0Mm15QzlWY241d2xaMnl1M2I2U1NMUURiaDU4Rmtv?=
 =?utf-8?B?QmZ5aEREMUpsR0ZZQmY5MzRFOXFyeThvZ3kyZWdzSGhFTFJYSXk4UGdWWS8v?=
 =?utf-8?B?UFhSbnJOK2VwYU1pMlRyYm1hUnVyR3NkUlM5a1NZVjhEckorUjRYN1BnUlU0?=
 =?utf-8?B?SUJQNjd6NkdIQzVIK1NIQ1o4alBQMS9PWFVkNVhqSGMzcUNNQXhjZTluaE1B?=
 =?utf-8?B?cDJmdStuazFGVVJmOUhlWmdXcmYyMXRDOHRNYVhacGxMdUlHeTRwYjVLaElG?=
 =?utf-8?B?czRPMHI1TStRR0Jqc0xWS0VHK3ZhTDN1aDQwUXAwMC9YTk8rYlAyQnc2OXVN?=
 =?utf-8?B?MUlvbEhibDNNRGRsWHZDS25iUkJicGs3cW0rNE9mSXh0NEY0UWpXVUpBRENT?=
 =?utf-8?B?blZRWjRkRVJHSzBRb3pkZUpmVisyb29jU0xCYkcrZ3kyZWN2NzFEdW00a2tu?=
 =?utf-8?B?d3VVRm9MSHJxbHcxMjE3SlI0aEp1OUdHRXBUd2VKK1NITUFvNU92TFZpL2VQ?=
 =?utf-8?B?SUlid05RTktnVEo1SFpuSzNtVlJvaVB3WHROUWdZdkROa0hhZjA5eXpZSXJn?=
 =?utf-8?B?c1N1WUtlaHR5aVpueURURHdQeWxNMDNQc2N2VGhUYVRYanJpNDZreXp4eTRU?=
 =?utf-8?B?b1lqbDNWV2JSalRISnRseFpOY3hFbE1oZjBoRGJHMmhHTGsyRDZUN0JFS3l5?=
 =?utf-8?B?d0Q0SDliYmYvNHJrT3pNWXVKclNpZStKMk1TYlNGWW91ZzdmTGMvcmo1MzFG?=
 =?utf-8?B?QXdDTnVZSERVdmJSeW51cXpFdHhRcnFiWHFZSElsMGpQVk1IOEJ3Y2lFTzlI?=
 =?utf-8?B?VUFNbWhQTzM5MVBuNWtPVUZhallwZkRSc3hTeWhIcGlnc2lmVTZXNDZjWW12?=
 =?utf-8?B?TmtUbzBoZmxKTW9SNVFsVkNUWWJ3MFhBc2c4em1TenV0ZXl3SENMTXV3VTR3?=
 =?utf-8?B?MVJXMGh2anREWFJnVWxLY05VKzhYcVNWRVZTdGdGNmxpQlorcE5TbEhrUExr?=
 =?utf-8?B?Vm5GV2dvU0s2WkF2V2x4cHRQdkxoQUxzdVI3ZzBLWWRNcmxnNWNNSTZVQ2h0?=
 =?utf-8?B?b2tRRWNyVHk0OGdCVHFid2pxVnAzZjNjbURhcVo3KytFMzFyYktVbGFWWTBr?=
 =?utf-8?B?VXhTc0lkTzNUTmx0UHNxWXh0SWJmb2R4Q2pNektxSkg2TFBOWFQrZFpkZFhk?=
 =?utf-8?B?dGdicCtSa0pBTFNzYkY3Uks4K3FrUU1mNkFhSWJEbzN0NGtHQUYrZFRWTG5I?=
 =?utf-8?B?RDFYMzk4cWlIQ29BRUVpbjVhVW1pMHNKUGNPandPcmZzYjdHYzlsUHRpSzBm?=
 =?utf-8?B?TmJRUXN4MmRpQlpvVFU2allmY3E1K045K294UE56SzZzbzNyRXN5MklzN2Vp?=
 =?utf-8?B?RkU3OHVYWWlNN1FqQXlZOFVHU0xDRzdaLzlrbkp6Uyt4WVloOThxY3JIREY5?=
 =?utf-8?B?RVdRU2x4K0dIeUNETmhpdVZ2UTArSnM1TlpRUXZlbjFVdUQyRHlzS1pZblJL?=
 =?utf-8?B?cnYvK0UrdU5sdElRMmRsUlBrZTYwamNZR0xyTkdjVGkwRDRxZWpqVmR3MHlM?=
 =?utf-8?Q?8di8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(19132099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0NWU0RsK1U5T2VKc3NYUXNyNlVIMWMxOFBGNVpNa2kwQndUdE56ZFd3SkJx?=
 =?utf-8?B?SGZ4clA4WU1IUldVcWRTd0tPRSsxZkE3TDNyNzUrRE5RZ3pEUVZFdWREUXln?=
 =?utf-8?B?RTZWdmd1TEtGZCtnVkJ3blQvZGpzQ1lkSHRsNkpnTmROd0FJcm10M0lRNGZC?=
 =?utf-8?B?Z1lwRG5CTkpXMjYwaTdRTktrQ3FYTlo5S0dtR0E2ZlFjUHlpV0FWNE5NMmVK?=
 =?utf-8?B?c2lrZWNCUHowMDVHanpNVVcvUGV0ZXBXbEJDNTl5bnVuNVFCNFlRZnFMMVln?=
 =?utf-8?B?cm1EZmFBMWdlRUZwSWVnaVhjWnZ5dVpsWHh4a1hyWUlneHdZak9QZUxXNDda?=
 =?utf-8?B?d1dmb2NsUnlhZTBEWXdqaUl5bTJmYms2MjErdXpDUjluYWFLL2JvbXp5NzFS?=
 =?utf-8?B?ZzdhRkd5MWJ6Rytld2dYUVI2WitBODl3akZNL3p0NC8rVnhyMlVFV29LbVIx?=
 =?utf-8?B?M0JtN1g2UzhsK2lsMVRkWkNwV092eERsTmJaT1NkczBLZlBRTDdiR2liZkFq?=
 =?utf-8?B?K1prZDZGcDBJdGVralQ3dWdiSElOYjNJNzNubnl0dzVoaG9BMHMxSDBya2xj?=
 =?utf-8?B?RkdzSzFaMlhQM0tsekJHSFYxUHZqekxHS0ZQclZxcWZJZS80dllxNWY5eVo1?=
 =?utf-8?B?OEk3cmZ2MGZSK3BIendvUDFOMlVlWlZNOUtkRmhTdWt3VUFGeTVJZ2I2Y2cy?=
 =?utf-8?B?azlGV2FtM3lVYkhndzdtQk1JeEorQWZaUmN6MUpKRkliK09rQWhmdXdxRDFY?=
 =?utf-8?B?QlBRbEZMWW5OY2lRbTdQQ1hVZWdZTnRZcFFHNzlQQTEzdllCbW94a2hMRVQz?=
 =?utf-8?B?eStCd1R2RE1oYTlZaHR3TDJKWU5kRmVjY2hwSkVhUjJEVUpMOGQ3N1Vpektw?=
 =?utf-8?B?Nmk0NnlHYUtZa1hqUHlMMlBNbHFNLzBCYjRLRUhYeUNnNkYvTXJ0MDNSMGxv?=
 =?utf-8?B?RStrTnhaNVdmVGlNNi9TSVhSTmsxcWtPV3Y1S1VFTnNNSXR0TXY2eGFiRkI1?=
 =?utf-8?B?bmdTcXNnejR2eGhzcjZjMmxTclFiSy9kVFRIWXBHRlFHYWVFVlBYeFIvWVJh?=
 =?utf-8?B?Z1ZlaEF6UkFRUlJYTlVTUEY5ZG5XOXl3c0hnMFJpVG5HKzgvaXhnWFJvbGhL?=
 =?utf-8?B?WGQ1d1MweDFMc1JXU2MxRFNXQm1IS2tabXpoS0ExeW5oS243UXowUWZPWWRD?=
 =?utf-8?B?ankzL0YwK3RuOHFBSzdSOGNtK0s1Y3pxYy83VmFEaVR4WitYdlpPTGFldjlV?=
 =?utf-8?B?ZEZNL3MxQUZCM0JFcmlVWUVKQnY5STBWcUpSNkl5d2lqdm1HbnFNNzNUUk5D?=
 =?utf-8?B?L3BjbWtESVBkY21yaWJYWTdFa0lQVnB5SEZwZkVJc2xkODFxZUlrMUNDejBo?=
 =?utf-8?B?WWY1cEtVTGlvMmo0TEpNUm12RWNORC9MbkJUL0kyU1RxaG5ON3pvdjJDUG9M?=
 =?utf-8?B?K1VSS3VUZjlwNUFUdS91emZYTWxVTFlNMWtyaVlMTkFXK1J6Q0UrbzRFYTFV?=
 =?utf-8?B?RDErUkN3SDZROTRaSlRJNWtzSDBNUGl6TUFaUkxOZ0hmTVFvVU1VZFBlWFlG?=
 =?utf-8?B?ZzFhSnY0Nzc0bHVRakdacnN6aFpxOS9GdjRvTmxyb2plYkNZL0pGbVBLNU5x?=
 =?utf-8?B?REJ2R0tON0NocjErbzdtaG5Ka1RtK0JzczM1ckZnSXdubDNrUnFDaGR2Y0xW?=
 =?utf-8?B?RnRPb1VUYXFHWERSYlZ6bUpYY2Vxb1JramlJekpOVmdqYWJLTzM4R3JHNmZJ?=
 =?utf-8?B?ODArNjQ5WlN6NlpWbVVKd3k2MWZUSmlyNUpYNDZhMmdVRzNhN2tRMy8wTFFa?=
 =?utf-8?B?b1U2QlN5UTdydG9zOFRURG1DYktMeVZvM0J3NWZ5WUJBVGw4bjZvRkpjbFJm?=
 =?utf-8?B?VzBqZTYzck01Ly85VnFlNnJ0WDd3YUx6dVROclN6SCt5YnBmSVFNMXhBNEM1?=
 =?utf-8?B?Syt2RjlGajVtME4rOXN0QkgvaStKTC9pZi82NzJCaW1VemdBNFlacTBqTk5r?=
 =?utf-8?B?NTcrZ1RDcElva1pEd1ZMV1puQy8wTjNZUzdkT29qbk1OanFFQW44TzByTzEy?=
 =?utf-8?B?M1ZRNHJxdGE4UTUvQ1hDWVIrOTJPZWFJRzVkVDNQOHh6OXZOQWpNMnY2SFZh?=
 =?utf-8?B?VktaVWhJYWhGMVVOOHY5UU5Dd2JKNEhoVmxnS29xclZGdFJybElVaVNBZ1Nx?=
 =?utf-8?B?VkpFUFVTZ0NZbG0xekp6b2d1SnU1U0tmb3J6QXNRQ3RiNHRldk1zbm9kamxE?=
 =?utf-8?Q?ecw7ZnhDUicDOiBQascOi2qebSH5TlORKaQ216PWk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94ed972-b3d7-4166-1247-08de58586d8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:16:35.1069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0HP9PhUyrwM+lDagCWz5DehBBe9VVWbw07iMw23yLGIRnOYFraGKgVTEYV7ZECw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8512
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123678

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmVkZSBIb2V5IEJyYWVuZHN0
cnVwIDxmcmVkZXJpa2JyYWVuZHN0cnVwQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDIwIGphbnVh
cmkgMjAyNiAxOTo0MA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyBmcmVkZXJpa2JyYWVuZHN0cnVwQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW1BBVENI
IHYzXSBnbGF6ZTogYWRkIHJlY2lwZQ0KPiANCj4gSGkgUGV0ZXINCj4gDQo+IFRoYW5rcyBmb3Ig
eW91ciBpbnB1dCENCj4gDQo+IFNvcnJ5IGZvciB0aGUgbm9pc2UgaW4gaW4gc2VuZGluZyBtdWx0
aXBsZSBtYWlscyBmb3IgdGhlIHNhbWUgaW5pdGFsDQo+IHJlY2lwZQ0KPiANCj4gT24gVHVlIEph
biAyMCwgMjAyNiBhdCAyOjU3IFBNIENFVCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBGcmVkZXJpayBCcsOmbmRzdHJ1cCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBTZW50OiBkZW4gMTkgamFudWFyaSAyMDI2IDEzOjMwDQo+
ID4+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBD
YzogRnJlZGUgSG9leSBCcmFlbmRzdHJ1cCA8ZnJlZGVyaWticmFlbmRzdHJ1cEBnbWFpbC5jb20+
DQo+ID4+IFN1YmplY3Q6IFtvZV0gW1BBVENIIHYzXSBnbGF6ZTogYWRkIHJlY2lwZQ0KPiA+Pg0K
PiA+PiAtLS0NCj4gPj4gIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2dsYXplL2dsYXplXzcuMC4x
LmJiIHwgMTMgKysrKysrKysrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykNCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9n
bGF6ZS9nbGF6ZV83LjAuMS5iYg0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvZ2xhemUvZ2xhemVfNy4wLjEuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9nbGF6ZS9nbGF6ZV83LjAuMS5iYg0KPiA+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiBp
bmRleCAwMDAwMDAwMDAwLi42NTI2YjFkOGEzDQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysr
IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvZ2xhemUvZ2xhemVfNy4wLjEuYmINCj4gPj4gQEAg
LTAsMCArMSwxMyBAQA0KPiA+PiArREVTQ1JJUFRJT04gPSAiRXh0cmVtZWx5IGZhc3QsIGluIG1l
bW9yeSwgSlNPTiBhbmQgcmVmbGVjdGlvbiBsaWJyYXJ5IGZvciBtb2Rlcm4gQysrLiBCRVZFLCBD
Qk9SLCBDU1YsIE1lc3NhZ2VQYWNrLCBUT01MLCBFRVRGICINCj4gPj4gK0hPTUVQQUdFID0gImh0
dHBzOi8vc3RlcGhlbmJlcnJ5LmdpdGh1Yi5pby9nbGF6ZS8iDQo+ID4+ICtMSUNFTlNFID0gIk1J
VCINCj4gPj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWVhNGQyOTg3
NWQ4M2ZiYmY1MDQ4NWM4NDZkYmJiZWQ4Ig0KPiA+PiArDQo+ID4+ICtTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vc3RlcGhlbmJlcnJ5L2dsYXplO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWlu
O3RhZz12JHtQVn0iDQo+ID4+ICsNCj4gPj4gK1NSQ1JFViA9ICJhNGFmOTUwNzAwYjhhZjI2NTlm
MGQ0YTM3YTE4YTFiOWM1MzAwNTkzIg0KPiA+PiArDQo+ID4+ICtpbmhlcml0IGNtYWtlDQo+ID4+
ICsNCj4gPj4gK0VYVFJBX09FQ01BS0UgPSAiLURnbGF6ZV9CVUlMRF9FWEFNUExFUz1PRkYgLURC
VUlMRF9URVNUSU5HPU9GRiAtRGdsYXplX0VOQUJMRV9GVVpaSU5HPU9GRiINCj4gPj4gKw0KPiA+
PiAtLQ0KPiA+DQo+ID4gV2UgdXNlIHRoZSBmb2xsb3dpbmcgcmVjaXBlIGZvciBnbGF6ZToNCj4g
Pg0KPiA+IFNVTU1BUlkgPSAiSGVhZGVyLW9ubHkgQysrMjMgSlNPTiBsaWJyYXJ5IHdpdGggY29t
cGlsZSB0aW1lIHJlZmxlY3Rpb24iDQo+ID4gSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29t
L3N0ZXBoZW5iZXJyeS9nbGF6ZSINCj4gPg0KPiA+IExJQ0VOU0UgPSAiTUlUIg0KPiA+IExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWVhNGQyOTg3NWQ4M2ZiYmY1MDQ4NWM4
NDZkYmJiZWQ4Ig0KPiA+DQo+ID4gU1JDUkVWID0gImE0YWY5NTA3MDBiOGFmMjY1OWYwZDRhMzdh
MThhMWI5YzUzMDA1OTMiDQo+ID4NCj4gPiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3Rl
cGhlbmJlcnJ5L2dsYXplO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIg0KPiANCj4gU2hvdWxk
IHdlIGFkZCB0aGUgYDt0YWc9diR7UFZ9YCBoZXJlPw0KDQpZZXMuDQoNCj4gDQo+ID4NCj4gPiBp
bmhlcml0IGNtYWtlDQo+ID4NCj4gPiBFWFRSQV9PRUNNQUtFICs9ICItRGdsYXplX0JVSUxEX0VY
QU1QTEVTPU9GRiAtRGdsYXplX0RFVkVMT1BFUl9NT0RFPU9GRiINCj4gPg0KPiA+IGRvX2luc3Rh
bGw6YXBwZW5kKCkgew0KPiA+ICAgICBpbnN0YWxsIC1kICR7RH0ke2RhdGFkaXJ9L2NtYWtlLyR7
QlBOfQ0KPiA+ICAgICBtdiAtZiAke0R9JHtkYXRhZGlyfS8ke0JQTn0vKi5jbWFrZSAke0R9JHtk
YXRhZGlyfS9jbWFrZS8ke0JQTn0NCj4gPiAgICAgcm1kaXIgLXAgLS1pZ25vcmUtZmFpbC1vbi1u
b24tZW1wdHkgJHtEfSR7ZGF0YWRpcn0vJHtCUE59DQo+ID4gfQ0KPiA+DQo+ID4gIyBHbGF6ZSBp
cyBhIGhlYWRlci1vbmx5IEMrKyBsaWJyYXJ5LCBzbyB0aGUgbWFpbiBwYWNrYWdlIHdpbGwgYmUg
ZW1wdHkuDQo+ID4gQUxMT1dfRU1QVFk6JHtQTn0gPSAiMSINCj4gPg0KPiA+IEJCQ0xBU1NFWFRF
TkQgPSAibmF0aXZlIg0KPiA+DQo+ID4gSSBiZWxpZXZlIHRoZXJlIGEgc29tZSBwaWVjZXMgdGhh
dCB5b3UgbWF5IHdhbnQgdG8gcGljayB1cC4NCj4gPg0KPiA+IC8vUGV0ZXINCj4gDQo+IC9GcmVk
ZQ0KDQovL1BldGVyDQoNCg==

