Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C3AD3C927
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 01:15:57 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.72])
 by mx.groups.io with SMTP id smtpd.web10.17406.1729386955038285304
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 18:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=oj5rq/La;
 spf=pass (domain: axis.com, ip: 40.107.241.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0KTXdpeUrOkzr6dYddAPOjLVULeEwQG02SHQ/JUvd1YcUXpVW6wiqVHP01S6JL6YSst/3d2P4pj7xmR0af9VbY9ebV5JzMJT4keHkncWPdf11G5JxrX2oxMivnrXr6dwvPzg+V/n/7YUlwdbanoFQd8B+Y//qgq4ibVy3BPZg2dtHjbCSnFwW5rQJ3h7NjoIBkES37Wle7SzJh2eBUCJg7zI2Ze4YlWwlKzfqpZ260EP5ibIVATWqNZx7UNS8TO634dkj5oBXLDut32Ju0byTCIc3DT7FgnVji41hIngq8Jpy/sQX4t+DT8xqF/tj3dKY/wzN1wgK0ur9jO8IBNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfnrAMKzHcRpRSkGPijAowHSGUxmua2gLefBkGSneLY=;
 b=Lj8pAaYiV46seAoh6qe7Ayjb9XFNTbytqfBst4ewHYh7bqLU7M6y7J+hxjZy2UWcYZn1uMjOAEluadkOcItiJvTHj1KG5ctZYu3YcZkwdfrbVjdm4UVPdY3oxULXNvOkx07bs6HzsnIWYlMW3Sp9g9gmcqb93W5DGX2n5zbpI3JtIJguiVLqew5V1EtJSpe+H3pRa+pNYibF2/bBkjfUWUPdBgtC1iN42sDOxkgfPsP82AyMykMnEbN3dwaJDlu2EaEri2koki+nREA4aSTVDHfKgzFxGVNvQ5BfVdhCcBLldpgYLeIc61TX44Na1mPJcu+gefAYuHHWRvjZQ/uTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfnrAMKzHcRpRSkGPijAowHSGUxmua2gLefBkGSneLY=;
 b=oj5rq/LajEVdvNZAPPNOm8SO5XaQ30vpTdfk+Jy/iTX8xPjnxFd4rI3NiRbF0uqId0x/MUs34L5MdAOvHXw9luadYRtUnof9ySoX+zr1tsKzg0l+E2ok4Mi/S+j7nH8N21fh9tMK06QqCXLHowLalDj6p15HpOucl/TsEI+Ogeg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6403.eurprd02.prod.outlook.com (2603:10a6:20b:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Sun, 20 Oct
 2024 01:15:50 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 01:15:44 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "sanakazi720@gmail.com"
	<sanakazi720@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH] configure: treat all openssl-3.x
 releases the same
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] configure: treat all
 openssl-3.x releases the same
Thread-Index: AQHbIkFxQHCyaOB9/ky70p9q5R5O6bKOQEIAgACVneA=
Date: Sun, 20 Oct 2024 01:15:44 +0000
Message-ID: 
 <DB5PR02MB10213E1EE7E1C25B27E7CBCBFEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241019153231.175637-1-sanakazi720@gmail.com>
 <CAMKF1sqjGTMz5Fg1BvCdi5q_w13Xwq+S8d-RQxCa1Nv_RMPwSg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqjGTMz5Fg1BvCdi5q_w13Xwq+S8d-RQxCa1Nv_RMPwSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6403:EE_
x-ms-office365-filtering-correlation-id: 23ef93e6-ffff-4a6f-1ed7-08dcf0a4b8a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SXFwR0V0am5PMmJMditZaWRmYjk2cFFOWWY4MkNvUVpYYkxnNTlpQ3BoMVor?=
 =?utf-8?B?c05JRm9jSmJuQ0hVQWYvTXRzaTQzZzQvQ0JkckU3V2pDRWJ6eVA5M2FNVmRV?=
 =?utf-8?B?ZDBxSkgxQXRFaU9uM2huanREUlFGTThnTld3N2NudWYwRnYrNWpBa0RaendZ?=
 =?utf-8?B?SEs2SHV4ZkNPNUY5cC9McXRFS0wzR2QyQUJMZzlSVkZ0R1pRbFVLUllub3I5?=
 =?utf-8?B?eWxFcm9ueGtoV2U5WjMwNVgxOTZNNnR2R200LytZbGN0dmQ5NlVxQ2lINXQ5?=
 =?utf-8?B?L09qYXM4NWY3SXRqWGZQOVFtdWZ0cHJPMnYrR05hL0gvejMyd1BMeHZ6aTJV?=
 =?utf-8?B?dnRRM1A0WVoyUW9nTmUxNElBeWFnSU95b2FneHhLOEw0aHJqU3ZoWHR5YVov?=
 =?utf-8?B?NE1vYmcveVE3TXZmV3M3SDFUWGRMSVpEQ3pqRThBL2o0S2lkOENuNFVzMC9q?=
 =?utf-8?B?K0NoRGhIeWFRQWNGa2hhTWpFSitUNGlXZDVvVlFGS3dmeVVVaXdKT2hGSXVa?=
 =?utf-8?B?YjU3WXh0eE1NcWNIL2wyd2JOS1pUQ3hCczBhZjFkZjZ4K0s4V2RrZXMxc3FO?=
 =?utf-8?B?amxPQTk3VnVuNUw1M3pCelJFdFI3enpBaWRWTmwwZWwzYnpmYjljMkF6Lzd2?=
 =?utf-8?B?dVhkOWRCMmJpVHBVRlE0WTBaQ3kwelIyR3oxU0l5Mm5obnlxdWlSdzQvM21l?=
 =?utf-8?B?dW1BNjByalNxYng4cXVzWDAzcmZISGhhR2NQNUU2MVpTaEEwMm9PZ3lRcHdD?=
 =?utf-8?B?bHpIQUNIWExRVHRLSlFKa2lPRGpQcHM4TGw0bHRmbmtJZk1VT3pCZkhERUEz?=
 =?utf-8?B?WjZoZElnLzRkcWxCeW9UOUJyM2FjVms2OUtjWWU4R3NkdnRuZ3ppQXV1clp4?=
 =?utf-8?B?YnZkcE95R0M3akhPT3VGMmVTck1tQ2pVMFZENXpkcUJ6dlpFemJsbHB6dXQw?=
 =?utf-8?B?d1kvTitKRlNUOThja2lKd2xTdHhKYW1HVEs3eXFaWlVtRk55RFFXaTQ3UmpM?=
 =?utf-8?B?TklmUVpMaXI2WHlUUlcvUWFLcUFzdGNzU1U0RUpHZEc5V0kxY0pjeGNYb0VF?=
 =?utf-8?B?UW8rcS9lNk9YNDVDT0Y0OHlBUnhiOG1YeXRjY0xyVHFub2tLbUhzNXNDM2Nq?=
 =?utf-8?B?aDQvazlMZXNpOWlNK1dpeWNzQzcrUDV4UTduc3RIVGNid1pCNy9abmpKRldJ?=
 =?utf-8?B?SHhCUmFEbTMwc3JFejRZVUxINWVZb1IxNFNhV1NRcEdrMkZGYkdFZEhYVU5n?=
 =?utf-8?B?S3dGVzRTZklOZTZ6OEYzZDQwNTNhSTI0YndHOHE1R3hTSU5pZjZ3ZkFMUGNT?=
 =?utf-8?B?N01oSFRJRkZZYjhHUjVnNUpJZ1R6dGQyWEpYTzZOaW0xcHYydkwxaG8vWGdW?=
 =?utf-8?B?cHZEbHVhdW0vWWxRQnNYa09xNnJ1UG15b2plenZGaUpZdXFxd0VpOGJnUEJ5?=
 =?utf-8?B?RmhQYkZqcGZzWXVvK2crdXpXOXl1ZmRvT05ZQzdwdnVQQk5YM0R6UEhyNUJV?=
 =?utf-8?B?bkxWNWVja3QyUTdUSXIwU2pBYUpNejlxdlA5NTJ2L0FGRjZLZUF2enRtSzRi?=
 =?utf-8?B?N3pjaTVZRExUbXJRYis3VWo5SlRUQ3ZOOVFzUlhqNTQyeW9Tbm9EeG11Slps?=
 =?utf-8?B?NGsxL2tVd3pBSkZST2xZN2R4WUhzbjFLQmdnVWQrSmxrZlRkVzFOMWp0dzBx?=
 =?utf-8?B?ZTdWOVJZRWIvVG5tRkphY2Rzb3g2VDBJKzVzcFNGRTBmb0pYMVFUM2hyZUJi?=
 =?utf-8?Q?vHZic0wjHyiBM/JNICg8c0OZkg1I/H0i4TYlU62?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SjVYS0lzRUwyTjFQMzhyYXRjem5CODdscU5xZU9NVng1bUk0UDFhaUU0VU5v?=
 =?utf-8?B?MHhoVkRHTjhZZTlIbDlXd0gxZUthVGM2NExGd2pFQVE0VmNKcjc4dy9Ra0Y5?=
 =?utf-8?B?MUNvdXZMSGgvbi9WMHBxWTBWbnNLa2dKZERRWnE1V0RiQzFmY0NRb0FpTkE3?=
 =?utf-8?B?Uys1VzUwdU5mRmhZaDdTL3YwV05uWGV1REl1TEVIRmpEWlNmU09YUTBsRC9J?=
 =?utf-8?B?VVV5NGx3ZXVZZENSKzZvZ2NCdXdWanR0NWVlZzkzQldIeGt4RnliVUtOU0x5?=
 =?utf-8?B?WjRzWWp0U3JYNERoOU52U3YvTjkyUjRHZHI3eU85WitDQzIyM2VqSHAvM01E?=
 =?utf-8?B?dzBHVkdzYStTVGdjTjFleW9VSTJmaGRza0tpK0c4MUZOTDR4TWljR1FMRC9C?=
 =?utf-8?B?Y3RwTWJwdDN1K0drbjdjRnRWOXJuQWwzMXlrem9GUUFrazBBRE56L25uUTJ6?=
 =?utf-8?B?c3ZkTEpvelY5U0Z6VUQyTUVoSEIwanRMQ3drblFuNmU5c1hkVkQyVitWdEtT?=
 =?utf-8?B?TURpRkJxb1hLakx1Wm1KaDJkTDJ1T2ltdWxwR0VzK0lyanlSZ1ZqWHFOQUpv?=
 =?utf-8?B?K0daNFlMb2tTVUxkb0Z3ZFltTnl6RVVHQzlxMFlHNWdkcldkYWZLM0RqYTNk?=
 =?utf-8?B?bUs0SEpaVXpiUCszZUMvd0RKZGgwbDJmb1dPcGptcWQwVi9ESnhDZGxhTFVD?=
 =?utf-8?B?aVF3VkVHajdQUGoxVGJyalprSk5IT0JQU2hRYjRhSDlyQ21Pcmw1cnNvRFp1?=
 =?utf-8?B?TFlJM0NHQnpMaWE5aHRLRExCTENLZVFhdlZmR04wK3ZUWGlSY0ZncHhGTndu?=
 =?utf-8?B?dWxXbVBBSHRlVzk1alByQzFyMmUxR1lnTkhJZDREcmlia05uUUx5L1pMMHQ2?=
 =?utf-8?B?c0tROHd5cmJuSytzaUpFazRqU29jL0NhcVlRK2MvOTk4Z0taaFdVL2NRZXI0?=
 =?utf-8?B?eHBUbnQ1eXdwV0sxb2VubGVEOVFualRwQjRUSjJXck1SRnozaEhkQy9rOUYz?=
 =?utf-8?B?eG1zSUJ0TE5ZOXR5b2dvQjQrY1FKUXlSZm92bGZhWi9DMnA0SFdSWVRzOTNW?=
 =?utf-8?B?bmVhcDFldTJ5NSsrbW1PQXFMYXhQUW93anRadDA2NzRFVjUxeVczTG9DdzRX?=
 =?utf-8?B?b3RkTHQ3dWY1RXVOT3pUczJRUXQvQmZoY3lDQjNoTTF1ZXlwQ05hNjRoZEo2?=
 =?utf-8?B?Zko0Y1VNSGVCU1pUb3EwZW5BMFdhRE1GOHFkeTZRL0p0UWlEcjNoOEI0Vmwy?=
 =?utf-8?B?amhIZzc2R2dNWmlpY3ROWG5Qcnk3T2kyQjlVNW5RZ2xnVDNDRlVrRDlMdWFF?=
 =?utf-8?B?RmswS1RnZkVkdmpoaWlwOEVvTTBscEJ5cDZtRnZUL2Y3Y2FHVktPL09LcDRQ?=
 =?utf-8?B?V3ZtWkp2RVZtT29lK0FzNHI1ZlJyaGRHWUgybUc2KzlDUzZEbEJqaGpGQ1dG?=
 =?utf-8?B?Q0Z2ektiSDAyNExQdWRQZStNQzdlUWlXaFBkbWdaOXJuMlhSemZDMVV2eEE1?=
 =?utf-8?B?YU9zZmZtakZsLzM5aHpGaHYrb3V0dnRzUnBLNVppcGd0ZW8yeHE3SHBQYTlu?=
 =?utf-8?B?bkJIN0V2dmRCQTU2MUhpak5jbXVqdzJyOTZhR2VaOVMwY1NxZG1Pa3FkVUVu?=
 =?utf-8?B?STI4dFdWaDNOR1RLT2lwZ1owZGIvVWw5MVhjd1hQNVd4MVBJUkZPU1o3MDY5?=
 =?utf-8?B?WFB0eVpBZnFkNmZVSktXbVJXcHJzaW83Qm1SYkpmVFZDNlZNbGlhaEVmSXh4?=
 =?utf-8?B?Y1J6Tk1XT21RZ2xhaVVoeW5kL3MxY2JEa2F2ZkVJcVVVZlN0QkY2dy8xUkZs?=
 =?utf-8?B?R2FaekRKSXp1cXg3OEFKUFdmYnI0VWp0MTMwTVlXY3JrUVlYNG4vcGd3clhy?=
 =?utf-8?B?U2dFR3doTEx5UEcvOTNPK1RoRlB6ODJXcUtWNkVoNi9Od2RiVmsweHJOV25F?=
 =?utf-8?B?ckxLT09DTmU2VDgxUzdYMWxCTzVvTUxoQ1UwZlAxQXNIWXVOYVdtVzFobEdG?=
 =?utf-8?B?N2pMS1daY2NoRklLOUcrVUVkYVQvS1FENXI4K2JVVEJxKzhFdWZjeGhJS0hm?=
 =?utf-8?B?SUNidjhRQVBjK1l4ZHYwQVI1Si9mTDhVQWhVeUEvdThpRUhaZitoL1ZmUVQ5?=
 =?utf-8?Q?g3Q8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ef93e6-ffff-4a6f-1ed7-08dcf0a4b8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2024 01:15:44.2579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1zib3wJKdV4i7DmXMAcFPvN8HCFhwlic1Ejcqg560Lmw9crT8ui5NHBoDMKbq0U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6403
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 01:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113062

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhag0KPiBTZW50OiBkZW4gMTkgb2t0b2JlciAy
MDI0IDE4OjE3DQo+IFRvOiBzYW5ha2F6aTcyMEBnbWFpbC5jb20NCj4gQ2M6IG9wZW5lbWJlZGRl
ZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRh
LW9lXVtzY2FydGhnYXBdW1BBVENIXSBjb25maWd1cmU6IHRyZWF0IGFsbCBvcGVuc3NsLTMueCBy
ZWxlYXNlcyB0aGUgc2FtZQ0KDQpUaGUgc3ViamVjdCBwcmVmaXggc2hvdWxkIGJlICJsaWJwMTEi
IHJhdGhlciB0aGFuICJjb25maWd1cmUiLg0KDQovL1BldGVyDQoNCj4gDQo+IFRoYW5rcyBmb3Ig
Zml4aW5nIGl0LiBJIHdvdWxkIGxpa2UgdG8gc3VnZ2VzdCBjb3VwbGUgb2YgdGhpbmdzDQo+IA0K
PiAxLiBVc2UgcGF0Y2ggdmVyc2lvbiBudW1iZXIgd2hlbiBpdHMgcmV3b3JrZWQgYW5kIHNlbnQg
YWdhaW4gdjEsIHYyLCB2Mw0KPiANCj4gYW5kIGluIHRoZSB0cmFpbGVyIGRvY3VtZW50IGNoYW5n
ZXMgYmV0d2VlbiB2ZXJzaW9ucywgaXQgaGVscHMNCj4gcmV2aWV3ZXJzIHdpdGggY29udGV4dCBi
ZXR3ZWVuIHR3byBwYXRjaCB2ZXJzaW9ucy4NCj4gZWcuIHNlZSBodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL3Y0LjE0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjdGhlLWNh
bm9uaWNhbC1wYXRjaC1mb3JtYXQNCj4gDQo+IE9uIFNhdCwgT2N0IDE5LCAyMDI0IGF0IDk6MTDi
gK9BTSBTYW5hIEthemkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHNhbmFrYXppNzIwPWdt
YWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IE9wZW5TU0wn
cyBzb3ZlcnNpb24gd2lsbCBub3QgY2hhbmdlIGZvciBhbnkgMy54IG1pbm9yIHJlbGVhc2UuDQo+
ID4NCj4gPiBodHRwczovL3d3dy5vcGVuc3NsLm9yZy9wb2xpY2llcy9nZW5lcmFsL3ZlcnNpb25p
bmctcG9saWN5Lmh0bWwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmEgPHNhbmFrYXppNzIw
QGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uLzAwMDItZGV0ZWN0LWNvcnJlY3Qtb3BlbnNz
bC0zLngucGF0Y2ggICAgIHwgMjggKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vcmVjaXBl
cy1zdXBwb3J0L2xpYnAxMS9saWJwMTFfMC40LjEyLmJiICAgfCAgNCArKy0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJwMTEvZmlsZXMvMDAwMi1kZXRl
Y3QtY29ycmVjdC1vcGVuc3NsLTMueC5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L2xpYnAxMS9maWxlcy8wMDAyLWRldGVjdC1jb3JyZWN0LW9wZW5z
c2wtMy54LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicDExL2ZpbGVzLzAwMDIt
ZGV0ZWN0LWNvcnJlY3Qtb3BlbnNzbC0zLngucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAwMC4uYjU2ZTI2MDJkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnAxMS9maWxlcy8wMDAyLWRldGVjdC1j
b3JyZWN0LW9wZW5zc2wtMy54LnBhdGNoDQo+ID4gQEAgLTAsMCArMSwyOCBAQA0KPiA+ICtGcm9t
IDc0NDk3ZTBmYTViNjliMTU3OTBkNjY5N2UxZWJjZTEzYWY4NDJkNGMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxDQo+ID4gK0Zyb206IE1pa2UgR2lsYmVydCA8ZmxvcHB5bUBnZW50b28ub3JnPg0K
PiA+ICtEYXRlOiBUaHUsIDEzIEp1bCAyMDIzIDEzOjUyOjU0IC0wNDAwDQo+ID4gK1N1YmplY3Q6
IFtQQVRDSF0gY29uZmlndXJlOiB0cmVhdCBhbGwgb3BlbnNzbC0zLnggcmVsZWFzZXMgdGhlIHNh
bWUNCj4gPiArDQo+ID4gK09wZW5TU0wncyBzb3ZlcnNpb24gd2lsbCBub3QgY2hhbmdlIGZvciBh
bnkgMy54IG1pbm9yIHJlbGVhc2UuDQo+ID4gKw0KPiA+ICtodHRwczovL3d3dy5vcGVuc3NsLm9y
Zy9wb2xpY2llcy9nZW5lcmFsL3ZlcnNpb25pbmctcG9saWN5Lmh0bWwNCj4gPiArLS0tDQo+ID4g
KyBjb25maWd1cmUuYWMgfCAyICstDQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
W2h0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0MvbGlicDExL2NvbW1pdC83NDQ5N2UwZmE1YjY5YjE1
NzkwZDY2OTdlMWViY2UxM2FmODQyZDRjLnBhdGNoXQ0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBTYW5h
IEthemkgc2FuYS5rYXppQGtwaXQuY29tDQo+ID4gKw0KPiA+ICtkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjDQo+ID4gK2luZGV4IGI5Njk3OWQ5Li5jMzQ0ZTg0YSAxMDA2
NDQNCj4gPiArLS0tIGEvY29uZmlndXJlLmFjDQo+ID4gKysrKyBiL2NvbmZpZ3VyZS5hYw0KPiA+
ICtAQCAtMzMsNyArMzMsNyBAQCBBQ19DX0JJR0VORElBTg0KPiA+ICsgIyBpc3N1ZXMgd2l0aCBh
cHBsaWNhdGlvbnMgbGlua2luZyB0byBuZXcgb3BlbnNzbCwgb2xkIGxpYnAxMSwgYW5kIHZpY2Ug
dmVyc2ENCj4gPiArIGNhc2UgImAkUEtHX0NPTkZJRyAtLW1vZHZlcnNpb24gLS1zaWxlbmNlLWVy
cm9ycyBsaWJjcnlwdG8gfHwgXA0KPiA+ICsgICAgICAgICRQS0dfQ09ORklHIC0tbW9kdmVyc2lv
biBvcGVuc3NsYCIgaW4NCj4gPiArLSAgICAgICAzLjAuKikgIyBQcmVkaWN0ZWQgZW5naW5lcyBk
aXJlY3RvcnkgcHJlZml4IGZvciBPcGVuU1NMIDMueA0KPiA+ICsrICAgICAgIDMuKikgIyBQcmVk
aWN0ZWQgZW5naW5lcyBkaXJlY3RvcnkgcHJlZml4IGZvciBPcGVuU1NMIDMueA0KPiA+ICsgICAg
ICAgICAgICBMSUJQMTFfTFRfT0xERVNUPSIzIg0KPiA+ICsgICAgICAgICAgICBkZWJpYW5fc3Ns
X3ByZWZpeD0ib3BlbnNzbC0zLjAuMCI7Ow0KPiA+ICsgICAgICAgIDEuMS4qKSAjIFByZWRpY3Rl
ZCBlbmdpbmVzIGRpcmVjdG9yeSBwcmVmaXggZm9yIE9wZW5TU0wgMS4xLngNCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlicDExL2xpYnAxMV8wLjQuMTIuYmIgYi9t
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saWJwMTEvbGlicDExXzAuNC4xMi5iYg0KPiA+IGluZGV4
IDIyMzc3ODIwMC4uODdiMjZiZjAxIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L2xpYnAxMS9saWJwMTFfMC40LjEyLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvbGlicDExL2xpYnAxMV8wLjQuMTIuYmINCj4gPiBAQCAtOSw3ICs5LDkgQEAgTElD
RU5TRSA9ICJMR1BMLTIuMC1vci1sYXRlciINCj4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9ZmFkOWIzMzMyYmU4OTRiYWI5YmM1MDE1NzI4NjRiMjkiDQo+ID4gIERF
UEVORFMgPSAibGlidG9vbCBvcGVuc3NsIg0KPiA+DQo+ID4gLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9PcGVuU0MvbGlicDExLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIg0K
PiA+ICtTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vT3BlblNDL2xpYnAxMS5naXQ7YnJhbmNo
PW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcDQo+ID4gKyAgICBmaWxlOi8vMDAwMi1kZXRlY3QtY29y
cmVjdC1vcGVuc3NsLTMueC5wYXRjaCBcDQo+ID4gKyINCj4gPiAgU1JDUkVWID0gIjUzZDY1ZGM0
OGNmNDM2Njk0ZjdlZGNmYzgwNTQxNGU2MDhlOGEyYmYiDQo+ID4NCj4gPiAgVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAibGlicDExLSg/UDxwdmVyPlxkKyhcLlxkKykrKSINCj4gPiAtLQ0K
PiA+IDIuMjUuMQ0KDQo=

