Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F34C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 13:28:03 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.83])
 by mx.groups.io with SMTP id smtpd.web10.7835.1719494877022146089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 06:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=Ev3ErUvR;
 spf=pass (domain: de.bosch.com, ip: 40.107.103.83, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKd2Wni6p3qQbV+T1TxH230BjDmXei+CS8E+0fJ6dHt6nazZkKiemYxP1KCv/csblElhiDVG568g/HfCs7k1Us75Q492LHiZCcE2hPlEf02n11LOSbOYhP318afeRk4gnmE2lj2ax6AQLxfojA+q4lnTlXYh0avFk36tTO0qCBpGVezaGep8FTEmeCY7YtRt2o34VAXaR4bQy3E6dRVEQimE37Ngw3tPRzW8s8lvllLfWNi33wtZpcTfSrn9zNrRtnqq1ye1Ju1M6aD/pS3OFPL4ZjGyyThHC8mBsbryBgjIDOwwqfTa9MbqYAMn676/lU7gGE+bMpeYmCEvF55iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qyXTyXjiEGJzFNRDrVH+55q3OHZplCPUCCTDuRjGZc=;
 b=Fi57BQ4IzcKkbfFKvjjL2x1cfn55fozZ2AoSyqR5Z79CFmSz2Ivs27A68C1nELqdqOk44fw565Iy31IMvqOWp6wWDxywTtG8lggPrIO2mETwa5M+xQmnBuEotUJeGKrTCIew5j4+ubiX6frs2SWsq2zjboDDiPijelotTxry52ut48OR7+M1spGCtIVIH8qcU6p+FpINFk4FPLIu1dwl1anl77zCPbWq1O5N0nA5XJmcYD78z1wVojdG+Co+Xt7Xj6uNcResvdSR2edDAHNMIX/AW69JSRobFPGWpt/ITT7GjEzInV1Qd9/Nbe9VuyIizH9XWx2LlxHap3ocm+GM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qyXTyXjiEGJzFNRDrVH+55q3OHZplCPUCCTDuRjGZc=;
 b=Ev3ErUvReVuokwMJutR8okXRYFZLfGrrgK8/afQajBFb5AZpcxhaVSIUDKy4wXAR3s/zMoCLgvPNpuQUpdkcMEO7KvAuEz2EtNjtYDl9soi2aTlRcrNs1g+za2ne7V4QhJkZDsBk8x7Ee/1zMwXefuII/HVHxTWE02OhgHcjZuqiwx1JkfYBEwLmhxpMt1cGyq4Juf/kdb6kZFxMSGZpnAnpwi66XubuHDaiyyNTzoccP4bUkAhckbkNmmmfMehFXWbtCV7cpqfVaFT27alwTwnOzxAZLbvSFwE4wYWIewLuh9EOvkBFYVd8E4clnkUyWcA7vuZBQ/NheWn3k34Pyg==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by GV1PR10MB6123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 13:27:53 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 13:27:53 +0000
From: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
To: "randy.macleod@windriver.com" <randy.macleod@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Simoes Ricardo
 (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: [oe] [meta-oe][PATCH] libee: remove recipe since libee is
 obsolete -- join the layer clean-up?
Thread-Topic: [oe] [meta-oe][PATCH] libee: remove recipe since libee is
 obsolete -- join the layer clean-up?
Thread-Index: AQHayAwku8JuaNGHdkKhCoDHAJMHXbHblS1w
Date: Thu, 27 Jun 2024 13:27:53 +0000
Message-ID: 
 <DU0PR10MB7076A24E8702AE99938CEA8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8gMzQsg8dkOeUJh=tMF+g@mail.gmail.com>
 <c2ed1746-11e0-41ff-be93-19f0b00ed1d2@windriver.com>
In-Reply-To: <c2ed1746-11e0-41ff-be93-19f0b00ed1d2@windriver.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|GV1PR10MB6123:EE_
x-ms-office365-filtering-correlation-id: 1730b880-900d-4fd0-b0c4-08dc96acf2f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NmgrcWFiUm5JUy9NR3drM2trelNRYmowYmV6R2w0RU9qTWF5RUc3a1RSQ2ZY?=
 =?utf-8?B?RmNIb0xabHBiKzdCVDV5WUxET1lBU3p6RkxWUUc1RXFzRTk1bndOK3ZwNC93?=
 =?utf-8?B?NEErUyttMjNYZTRMQ2V1QVlJUlhsTXRJSU1BcitXVURYZDhVWUFPSnlmQ2I4?=
 =?utf-8?B?ZkowdFZrY3cvVXEyNEw2MnlDOUo4MkxXc09uaTVzN0hUSTNKdmtEY2t6RS9m?=
 =?utf-8?B?UGg2UC9jVHVUWTBmblA3bDhpSWRiMWJmK3NEcTZqTjFqME1HS1NVdlhnMnVn?=
 =?utf-8?B?RGwxSy9vUHZXUzdvaUNBRFRiT2R6L2hnRldDa0wyYVZiK0Yvd2QvMXVXeFYy?=
 =?utf-8?B?WURpMi9HcjR2bFV0N1NwYWdRd1FIb2xxU3NKSTBVYmxkbkZ3cUs2T09YVTBC?=
 =?utf-8?B?UWJ0MUZQQlVRVy9iVkUvL1doYXpCOGV4QTRSU0JRNXU3TTF5ZFRIa1VRdjdv?=
 =?utf-8?B?Nlo3NXdSTjZmc1luc2NGK3lEaVJMclNlb0Z2L1pCMkMrdEZuanA0c3dQOWZB?=
 =?utf-8?B?V1VxTEUydVpPMC92dTBkZFpTc0FtVGlQSFJocHNFOTVwZUNMaC9rUERPSUZS?=
 =?utf-8?B?WDJtbUE2bEFjN3RDeXRtK3Z0cW9sUnF4dW9VV1ZVS01wN1Z6RDI0N1RIeml3?=
 =?utf-8?B?RHFPYWlHNWdqTUI4ZXR2Q0dJaDcwZENHb213bHEzYkZrTG4wTWY4eHdJbGpP?=
 =?utf-8?B?Y2dxNXlKTGs5K0cvaExZSWpMSG5SelUwdDhzWkgrQmFJdWdWQ2JrTDBMNjMv?=
 =?utf-8?B?YnltZmlMR1d3OTZ1aTBBMmpEeTA2V1g1ZTdrZndJWE1vRll2c0NxNUcrY3Ns?=
 =?utf-8?B?UFBQNUJvV1VpS0dGS0lEekdKTXcvNGVXNjZiSU5xSytRVnhKWnlCaWtGVzM3?=
 =?utf-8?B?VDlhTmxVQmFoWFBocThpaVQrVnJFY0Q1YkVEUlpLWjBUdUQ4K091dEdiVzhv?=
 =?utf-8?B?bk56dGw1d1Jyak1OUTQzS3BvRnowak12V1ovRzFJaWFBN3VyNWwrQ0pqR0d1?=
 =?utf-8?B?Z1FERklBYTlaOExtcG9XVEVSYTlacG5VRGVVYUs1NFJtVnp1TnIzVkF4dVcy?=
 =?utf-8?B?dzhWTHI2NXhFZmhpTFNQWWxMWTRIS0tJczRRWU1PdW1BZjlJQ05wMnRPYmZm?=
 =?utf-8?B?QmdaaDNmSlpVUm1RWmdHYm1GSkdlamE0SDRISGxBeFNUT0tGTm5vR2hCQmdu?=
 =?utf-8?B?dVp1YnVGR0VqZ0lpNzJSVEZUUkN1ZkVwdm1JazFPbFRpdzJzb2hMbGRtUG82?=
 =?utf-8?B?MzJMUElTY0FZS0Q5OTkrWFJEK0xXQlczdGFvQnlWR3lEamlQbDRVME4xc2FO?=
 =?utf-8?B?a0lxN1dPNVJSNzhjd2JyS0F4T1dEcFFXRUluS0pJblZ3elQ5czJydFVVWWYr?=
 =?utf-8?B?am1FMzh3dExNd1FBSDl1K0FtcVRQdmdtZ2d1QUppRkMrb3JxMDZCWDdQWVBS?=
 =?utf-8?B?ekh5cm5JK0pIalhPeGZkWUUvRzVHSlVLV2dPdGhQNGFqZlI4em9jMFU1S1hu?=
 =?utf-8?B?dUQybGdQSjFLbVhlMG9VWmt0eXVvYWEvR29ZVzVzQ3BPWDBEMzBrQ2tuSEZq?=
 =?utf-8?B?VWVXdytYSHNkWDFleWUwZFdBMU5odWg4Q1hzcm04WWo5cDBOSWlLMTBoZUc4?=
 =?utf-8?B?bWpUc1VWaTNEZnBzbXRVYllPc2NDYXRyQmI3MDJ5RTdoS2tEYXBpdHZpenJL?=
 =?utf-8?B?S1JaejBaQWtRb0tUTkU2Y1dhaEMzYnhKVHRGbUkrb2JsajBLTVR2Mjh0U29U?=
 =?utf-8?B?M2FVM1JQMkJ1WXUyc0pjRUhsODFoNFoxWThRYXhhQ0VwZ3BYaTE2RGpabUJ0?=
 =?utf-8?Q?TuzfQq8uGYiSHDwabwDZzdfcDxAdoEVK39ib8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?am1TZUZBMTRsY1hYMjkxWE1kVUlKZGxmS3dCdk15Vk80UTBjZFVmWkFLM3Fy?=
 =?utf-8?B?K0lPdzlkdmZ0Y0tVOFVaZ0JwYWJ3VWYxM2xvOEhtS3pSaTUycFVWNUVXZC92?=
 =?utf-8?B?cGJRc0ZLdnpZZkpVZjk1ZkNZOFcrT1BvbWltbHlzTWluQXZlSXVqRzQ1SFpB?=
 =?utf-8?B?RDRXMDRBWlc2dE1ja0hub1ZNZXJ4S2NDWHg3cDIwS2EwUDYvQnVwY3FoR25B?=
 =?utf-8?B?UWZzcGNHbDhQR3ovckM0STZmZXlyUUhaRnZRejBQMHI2OFZsbzlBOVB5TkJL?=
 =?utf-8?B?NnNubjFVbFY0OUx6d251UWtoa21JR0NneGt4SlgzVEV5UnJSY3dWZFpGQjA0?=
 =?utf-8?B?UlBxMSt3RkQ3WXJqbDJoWFhJd2ZpcExxRkJhNmlVbUx3N2JuN0p2dHZxeVpT?=
 =?utf-8?B?YTJRZnhWYVNNVVJhbHlwaGF6UHVxL0VqUEgyL0VMdmhGUGRUZEttdmxDU2FY?=
 =?utf-8?B?dzIydlR6OVNjcDB1RUZmbXNad2lRK0Y2ZXVtb2hNRmxTemUvbFl4Rlc5bEJT?=
 =?utf-8?B?ckNhdSszODdGa0h2eE4wZ3BERVpkK2J1cnhERUhsQXBiWm5YOVdBTlZGeVhz?=
 =?utf-8?B?S3loaW9sb2dCRGhsckdFMndlYlBKTm9hSVVXZnVZS1Y4L2tBQ0hNZFowRW1r?=
 =?utf-8?B?UEc0MjRNKzU3UzFrRVY4dzdLQWxRRi9OWTE5czNHR0FjRm5IRm9RejhzNVRT?=
 =?utf-8?B?cGJ2YzIrb2l0VUFDRGlvaG5zLzI1ajVSak5zRzAxazUvbkMrcXl4NTlFd3N0?=
 =?utf-8?B?U2cvRHFHWmtQYUpzdHdCRjV5Rnc1UUxGQXRPdkc3QmRYMDc5ZmNmRkxQVTl5?=
 =?utf-8?B?WllxdGZxdlYxNi9LYlE0RUhkZlZNVm82THBMMTNQaVFNazRpWnNWZGRhbEgr?=
 =?utf-8?B?MCtGbWdXdEtmV29qTjRHWnpWdW9yaXMxRVpRUWpGaHpkU3dIVHhadG96dkNn?=
 =?utf-8?B?N1NScHNBZzh0UHlmQ0wxK29uZW9lU2J0SEUvUE9RcVc5aHRXaWRyaWxlU0Z0?=
 =?utf-8?B?VmI1WUx0L1A5RkprRXdzcG4yZFhRSlhLN2ZnNm9FUmNRWUJLaXZlSmlTNkxQ?=
 =?utf-8?B?Y0ZmNzI5elVjV3JxOXVjNnZLRWxNVjRuZC9YaXFLSUpYN1I5MGsxWW0rV05m?=
 =?utf-8?B?bUdBMzVjckk4OEpac2VXd05yb2xKRDcrbUFiVHVRZ3ZLUXFqd3JHR1I5a1dk?=
 =?utf-8?B?UXg5YkdkcERtNTNPS2lQSGhBam5KbmtLcUhlalQ0NnpkaEdWNXlualN1UG1a?=
 =?utf-8?B?eGkvaVdRcWFQY05LTUlPcVJqV1FzQ0lpQjEzTzdsK1hFa1RXL0ZNb2lYb0RU?=
 =?utf-8?B?c0ZWRmpLVXRmc2JsTy83OGF5U2ttYXZRMk5rR005QkFFWFkyY2VyMDErck1u?=
 =?utf-8?B?STZpUFMxSzVmUWtKOEVNNlo4SVBrWGk2T2hMdFNDQWhNVU1XMW1QR05YK3Bn?=
 =?utf-8?B?ejZrT3FKZzlsVnpBMVZsaUxzdk9wV2tlMTZRMWNZRE9NOWdNYkRibjZseHZt?=
 =?utf-8?B?ZExzNnd0cEJiL2dMeUlFU3hMUkdpL25LOWJ5SFBnQTdTZG1FUlBsbmhiM3VX?=
 =?utf-8?B?ZWRieTJsUjJUaGhWa0lOTDNaSnR0YWI3QkpMcUFDT0xSVXZUWjd6QktiYXcx?=
 =?utf-8?B?OURleGo0a2FLSnlBTWQ2WUxnZ1hGaUhxK3Z1R1NTTkVlbFNmWFZqRnZ5b2JP?=
 =?utf-8?B?Nkh4UklnZW1wTnNUZ1M0MnRseHUyMEJjS0ljSUUzT1dFazFGaVY4dHhJWTJI?=
 =?utf-8?B?QkVVc1NHekUvajBlaWMzQ1R0REsvZ2Z2QmxFTW15Q1FUUnV2by9QSjVGY0tx?=
 =?utf-8?B?czYrOEZkTld1MXF5NXlvcFVBekN2STQ2ZmtFajV4bExpSkxJVFc0WXRQTVZB?=
 =?utf-8?B?SmlQazgrS2FueEZIOTZDRUdrUTVWemgzdUJYektjT055WFRvTTdkLzlpTnN4?=
 =?utf-8?B?UUkzVWIzSk9waTdvSDNxOHZJQjBSQkIxVkZXWG9wV2R4U2tpWnE2OFpUb3Nz?=
 =?utf-8?B?ekFMK1ZTUVZMS2t5TGgrZCtTczV4elpZZWVNN25hajhpL2ZyVVVITXNTM2tB?=
 =?utf-8?B?ZEQ4VXkxbGtkQmNISlBCSUNvVDdqZVl4QVBQbEhiNHZsUkJYdExTSE9IdVlt?=
 =?utf-8?Q?dPwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1730b880-900d-4fd0-b0c4-08dc96acf2f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 13:27:53.3892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RX5nXIjhWmYInJ+UVrRfJlJZN7+uxAXUgXXKdGs4GVUUJcAyrxyxuLqNYo3HPV+Qhv43ufBFifpnSuD9s6vPNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 13:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111125

SGkgUmFuZHkgYW5kIEtoZW0sDQoNCj4gIyBrZWVwIHVwZGF0ZSBkaXJlY3RmYjIgPw0KPiAvdG1w
L21ldGEtb2UubG9nOjIwMTYgcmVjaXBlcy1ncmFwaGljcy9kaXJlY3RmYi9kaXJlY3RmYl8xLjcu
Ny5iYiAgDQoNClBsZWFzZSBkbyBub3QgZHJvcCBkaXJlY3RmYi4gV2UgYWN0aXZlbHkgdXNlIHRo
YXQgaW4gYSBsb25nIGxpZmV0aW1lIHByb2R1Y3Qgd2hpY2ggd2Ugd2lsbCBhY3RpdmVseSBtYWlu
dGFpbiBmb3IgdGhlIG5leHQgeWVhcnMgdG8gY29tZS4NCg0KV2hldGhlciBkaXJlY3RmYjIgd2ls
bCByZWFsbHkgdGFrZSBvZmYsIElNSE8sIG9ubHkgdGltZSB3aWxsIHNob3cuDQoNCkNoZWVycywN
Ck1hcmsNCg0KDQpCdWlsZGluZyBUZWNobm9sb2dpZXMsIFBhbmVsIFNvZnR3YXJlIEZpcmUgKEJU
LUZJUi9FTkcxLUdyYikNCkJvc2NoIFNpY2hlcmhlaXRzc3lzdGVtZSBHbWJIIHwgUG9zdGZhY2gg
MTEgMTEgfCA4NTYyNiBHcmFzYnJ1bm4gfCBHRVJNQU5ZIHwgd3d3LmJvc2Noc2VjdXJpdHkuY29t
DQoNClNpdHo6IFN0dXR0Z2FydCwgUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBTdHV0dGdh
cnQgSFJCIDIzMTE4DQpBdWZzaWNodHNyYXRzdm9yc2l0emVuZGVyOiBGcmFuayBNZXllcjsgR2Vz
Y2jDpGZ0c2bDvGhydW5nOiBUaG9tYXMgUXVhbnRlLCBQZXRlciBMw7ZmZmxlciwgSGVucmlrIFNp
ZWdsZSwgUGV0ZXIgdm9uIFdhcnRlbmJlcmcNCg==

