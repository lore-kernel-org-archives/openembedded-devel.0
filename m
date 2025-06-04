Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D3C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 12:29:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.123])
 by mx.groups.io with SMTP id smtpd.web11.15346.1749040177809253843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 05:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=CNm1AUaK;
 spf=pass (domain: phytec.de, ip: 40.107.22.123, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDdbb6XK4sPKbV4rTLN7YvkCjronQ8WmrI89IiHQSqHTBPk3LGU0QtPNFutqDsAIZ5mf3iY4YDQXj/OP2E6RHTgySQTEEQ+wJfRU2vqWewlF04Sf8XigAWWSJ16zhGMlrdGE0Naq1QKwMijWhHXcygAkI/WArZ269ppwa2GLmLUTJE1M6Zox4ZCY2DjMlFRg+EjxAwekdHE1MvUzIrvAtQZa//N6T6L9zyjtKw1d+1GyizRDDkySMVYb0jdAJwlahmmVJ/rSJODmePKe6qvVgYUD+jjNPZ1pLybDw6a8nRIRG053eQCWRQDlqzUorCTwp/Kz5vuvGqQxBqM5QmhU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/7Kae90WmZLQ9kvDBrcwp2dmFNcQR/wYbYIpo1UFls=;
 b=zLIJL/+GseZBG142TYdRtp2z4qB8Q49ZMoeS46R1Ellzx9RziAOJJxLjGAeREpprj7w+dg9DPQEw7xzHp8sIZ40ciQ+lSB6oBGAKLkBmA4UHyz5Y7Zn9Roe4VN29qMA1Mdm3AMoOkNyY4vluHHq6kJxyTcvmwM6fl1rvjoLysTSimblMZ5wyLJcb3d0kZjzmJKqY8WppQhhYswZD+tQJcVimz3tX7XEZVLALRs4Jmg3x7zvw5n9Frhqcg43FdYacYhQThF9IhVIfdSw1+gXiBoU0vAD2tBBiIw1/bpyUo025UW5HbW7ck2V5ZWg+9uvO/vtD+lpIq7m2uK9R0xsjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/7Kae90WmZLQ9kvDBrcwp2dmFNcQR/wYbYIpo1UFls=;
 b=CNm1AUaKZfHleSc5J/D15VIMAUuYIfSbR4wF+B3neTmUAgJnE0k/mSPlM7ei/MVYozVx9+3+bmsJcBnSugxBTsfERVN9EJnMrhmRPy1B/XpGuCZEnUA4sC35E5kImyEln0cUVtFexbf2IeWKLZUoIM637g1b0st9iWdY5P+JpvHk9zsss3XLieSZAukS3cXUECecKa1vEFl7YvhVIlwAvszQIg1MMni99KG6F3ePDErCk5E6SxZt36xRdeRwGy6q88b8OWE4ngdggkqq/NPhl8jkTeaFMaYGzvWtw7rdAB2eJZz075VYwkZiqAL1idywS+lbfXYCFRotU5s6pZDi/A==
Received: from PAWP195MB2176.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:330::14)
 by PA2P195MB2568.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Wed, 4 Jun
 2025 12:29:34 +0000
Received: from PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
 ([fe80::ea1e:17ff:23ca:3c0]) by PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
 ([fe80::ea1e:17ff:23ca:3c0%2]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 12:29:33 +0000
From: Leonard Anderweit <L.Anderweit@phytec.de>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
CC: "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"jonas.gorski@bisdn.de" <jonas.gorski@bisdn.de>
Subject: Re: [oe] kirkstone merge request: June 4th
Thread-Topic: [oe] kirkstone merge request: June 4th
Thread-Index: AQHb1UQMOgsqWBy18Uqn8saoasEXsbPy7h6A
Date: Wed, 4 Jun 2025 12:29:33 +0000
Message-ID: <fd6798872e4bec754126cb5972bb20148e5c900b.camel@phytec.de>
References: <54a40e2b-8aa2-4cca-84b2-cf1b3ccbec49@gmail.com>
In-Reply-To: <54a40e2b-8aa2-4cca-84b2-cf1b3ccbec49@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWP195MB2176:EE_|PA2P195MB2568:EE_
x-ms-office365-filtering-correlation-id: bdf94df4-6e2c-4f82-97be-08dda3637656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dHhHaXBodjVxam1aVWs1aEFDREJkbk5DU1Z5TEgrbTZ4UEp6emx2cklwMVFr?=
 =?utf-8?B?cDQ0dEtxaVo0NGxKa0x2Wit2aGNNWFpzVnB6bE9RU3hURUg5STJOVEVmOEhl?=
 =?utf-8?B?ZWVCRitCTUdRVHNnOCtPTUlWUjNYVW9zYzdVZ1FEaEdvRHh2UXgxK2lESmpU?=
 =?utf-8?B?eExzMnZFVGJ0b1BhU2xZZUtGTXA0Z1ovbjdBUmxMaGNITjBSaFl4V0EwWVNi?=
 =?utf-8?B?R2h6N0Z0M0d0SDZkeGJ0ZTFKUE84TEsrMThUeHF3NlpRT3hYUGZpUVlKSHgr?=
 =?utf-8?B?RTNxdUNYRTlMQzJ5YVRsZkI2NU1pVDlNL2Nlc3pTM0NMY3JTdGQxV2ZCSVRv?=
 =?utf-8?B?WmNyeE9YelUrMk1Ebi91OCtLay9tcnBkL20zd1VpVE5BSlJXSkZIYm1HMlNC?=
 =?utf-8?B?ckxDblkva3hIUFBILzRWT3hkV3lpVE5QVWpwNGF4NHNEb0tnYStGc2FSYThC?=
 =?utf-8?B?NCtuZFFMeE5lU3c4dDJHNDFWdHFYMG9uUHFyQ0FQRHkyUHdzVEZpeFNYU0ts?=
 =?utf-8?B?OEZNSEcyMjd0WWxPZlI2MmtpbUdsTE1HYlIreWhWNEhXMS9NMXNWTUgraGJB?=
 =?utf-8?B?NklxWEtvRFQxV2RBVk5HaHlZNTVoVm1PbnROWWNWRTE0YVBtR3VVaGt5RjhU?=
 =?utf-8?B?alNDeW05OWNuVURrcnZMWWpBUU1VMUxUQytNZlk4NVN1Nk1ySUR0S3FvVzZF?=
 =?utf-8?B?SU9Na2pVLzdzeVVKaUZpZDBNUDJvVVY4elI1TDhtSU5kdUpncnhHWDlPUEFZ?=
 =?utf-8?B?Y2p3ZUlZbVVpcFVmNm11Y1ZBTVVZQkxHc25WMFVNQWxLRE1QVDBSNWZxK2FB?=
 =?utf-8?B?OTNVUnpTQTI5VndZL2svSmovb3pKd3BXUkowb0lYcWFSOEY5TDFZV3pwUjQ2?=
 =?utf-8?B?UVV1SGp3RmdSc3BKUC9zWkRsNThsTjYvRzZlQU0rSCtxRHRuZjJBY0gya2V4?=
 =?utf-8?B?UUFNR285cElENkxNTk1ubCs3N2w0NHdkT0dhWUhZaXI5Y1RqQmhoMyt6VFo1?=
 =?utf-8?B?YWQwNmVhZmVsTkxQdkpYZUxMR0pEc3YrekdyZE0zMlVHNVBJbzYvSkd4OFcz?=
 =?utf-8?B?RW1NTjBPMVFrVTBJQ3NaWnUwR0trTmJGZ25yc3p6cGZsZGtsWmM5SGFYeWMy?=
 =?utf-8?B?eEIweFVCSzQrNk9KdnkvaUlSVmVjc2RXOU1GdnEzNGkzWFF2YzNYS0lNblo2?=
 =?utf-8?B?RG5qK2l2Qk5JbCtKY2F2dktrS1YvL2dUSW0rT0FBRlFVZFRkRDZ5MVR2Z2Nh?=
 =?utf-8?B?N2lYUHFiQy9DUkhqelZ3czk4Q3I1QlZSZC9WMFIyWndoTEpsS3F4ZXpKZ0x0?=
 =?utf-8?B?SFJLY3FlOUdJNU4wMUY2RmxYNDdZd016TTRZYkUyOTY2NkpaYnVZL1BYZzg4?=
 =?utf-8?B?aSt1eU1nbHRyanhHSjN3MVJxRldtdGZielJhNytVMEN1ZVVvck5rd1M3R3VT?=
 =?utf-8?B?aG8wOUt1YWViU0xSalFqdFo5REJJQlZyS2lJc240Qnp3ZHRZUHJ3ZC9PK3Jw?=
 =?utf-8?B?WGNrVXptUThXU3BGMFY3eHJTMkxBMlhRS0pWQlVtTmtnMlMyZldFc215Z0Fr?=
 =?utf-8?B?d1BRRzEwbmhiYXRKTXI4dnBLc0YzVVdVdTBiQnhNakpoWkhEZVQrK3pvVUdQ?=
 =?utf-8?B?UjM5MGxMZnRVc1NOdGprOC9VTEcyWHlZQlp5Y0ZTcGFLZjZocmVyNUtmVzRE?=
 =?utf-8?B?L28wYi9hd0ZNcGs3M2dyeXpzaGNvNzRXZ0xGSnllT2lwM2JnM3FhbzR4S3Nj?=
 =?utf-8?B?TlhYUkxnUUl2bDZpTU1meURwTnpsb0lPRVprSENNcHh6d0p3WjZ4T2hkK1li?=
 =?utf-8?B?TjNESWNXZWdYRTBLVWMyandNMzQxL3BPdVNFSm05aWdqUk5Md2prM2NxbUg2?=
 =?utf-8?B?Zkh6UGZHOVkxSVR1dmI5U0Y4TU9XeTRub1YwY2xLN1hMV1IxREU0QnNHVERP?=
 =?utf-8?Q?mgvcEisINeUyQeWLhGFFieMuSTYjvtAE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP195MB2176.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzAxdWJldWNXcG5RbUkzUmI3UVFiaXJJU3hjbjdORHkrL005TFJld3FqeUZs?=
 =?utf-8?B?K2pjdnhlVHJoWnNxMy9wdVJzaHoxN2JGSFIzMjNaMjFVOGJKNlVKZm5PR2h2?=
 =?utf-8?B?cnNOTHlNUmcrZTlsV2diNjVocTRMRCtQRlpublVYdnI0Wll5Qkkrc1gyenZw?=
 =?utf-8?B?eTFma05aeXl0djdoWXFaOXhuS2xpT2NjeEFoTGpnVTBQMDhaNWthNTBvS0h6?=
 =?utf-8?B?TEFFOENzVktkOC96ZjB0bmlPYldXaWZoNC9POXIvT2t1V3BEdFRrTXBMck9U?=
 =?utf-8?B?ZWllUnI2NjNrcGt2YWF2cDgxTUdHTnd2WTBicktLREVTSXlHSFVEMWRQMGc2?=
 =?utf-8?B?K2JJcmZ3SjI3Yy9XQ3l6STh1OE4rUUJCNk1SYmRpaEJPQkRmdEpmdFN0MHBz?=
 =?utf-8?B?aGordStNZ3MrNVZjUGJSQlYvMDBzUWNYUGhOOTZZbE9DMm9DVDRhT3ZlQUJL?=
 =?utf-8?B?VXYrMHlGMVlJcWY3dlorZ3lZZitTaDFsYjJ5RStxRTEyMU5zY09Xb1oxRjlr?=
 =?utf-8?B?RWRBdklmRVNCcHhEMmM0N2NBNG9tS1FjZGhHTmowZVBCQ3JLNmJhRDRoZHRl?=
 =?utf-8?B?MHpjaEZlK3dmQ0cyMmFoWjlJU2lOQktkR0xuVVU1YitGL01FZjR5QkVRSXpi?=
 =?utf-8?B?eFJVaGd4bjlSZUJpTWRNaDZUbm85MGVvTjk2VXBXdHA5MVROOVROWjhqQ2ZW?=
 =?utf-8?B?TlZ1ZERnTEN5UnZpbXN2TGpRVW90RnpxSzd1Y1JoTWk5dnRwMWI2WGpPbmEv?=
 =?utf-8?B?ZnBIM20vV3lPVHVFbEppR0Y3OXI4OGZkaW8xaEdicTFPNkZXS1FsWnpPQ2Rx?=
 =?utf-8?B?a3dEa0NKT1ZZOWRmcGpjalJFaHMwdWpDMytpTW5CeHlaY0pmUkhpcEMyR291?=
 =?utf-8?B?N3BDb1ArUllYWnlKb01nUXk2Um1TcFRmRThBTkVzK3E5RTh2RFlOT3ZMN2Zp?=
 =?utf-8?B?aE1NaHR0RU8vQkJYc3hMdnUvbnJScHFza054SXBmNWJKeVF6b2ZNZXI1dU5K?=
 =?utf-8?B?WWpBV0JyY29IMzYyMmI3T2pVT3dIYVNxV25GMlZOSmFqWWx0VzlxRHB1bHNQ?=
 =?utf-8?B?RjhGRWhvNU9uc1h0WUx4aGk2bkltWjhMY0w2bHpFcVFvTVRVd0FXMFlKNFVH?=
 =?utf-8?B?NXYrVkJVVW1Ha0JXVE5Zb0RudzhUUVdQSm8wL0RWK1Z5L1V2Y2oyZk9BSkhE?=
 =?utf-8?B?d1VlMlZ1VlB0OGFGL2V5Q1JoS0wwTFZPSDVWR3ZyL2hqUzlHREhySVFweTlm?=
 =?utf-8?B?VDdSNnhzUVFJZ0xxbCtHZ0dHVVhMYXJkMzJkK1pPREFBclBBTXE0QjA1ZWlG?=
 =?utf-8?B?MWlYVERlMjNYN2wvamE3VHNEY2c5TXc1RUkreHM0bHJKNlowbzgyWFQzWTEw?=
 =?utf-8?B?bjlWeTZlZWovQzVGcm1ra1BnaWpHbFdnRkQvcjhoY2RLd3Rod1hPb3N2QWE4?=
 =?utf-8?B?V2E4RFRpd05GNzFxVG5EU09CcFlCWnR6T3JwZklyUXFqWTNsYTA2bitUejdR?=
 =?utf-8?B?WFBLL3lBemVCY0Yra1BTK2ZncmhFdnI5K3ExSWY2d0lqdy9uRWNLdXk3bGhl?=
 =?utf-8?B?OG1UMUpTcjJhZXVoMTJiRUFxd0dmcnV3TEovQ1ZqSGNjcmdURnNselM2SU52?=
 =?utf-8?B?Z05QdGhJVGZrSnZpSHgxci9MemE0QnEzSHJQS1ZGZ1dQTTNpVStrQlRzWkU0?=
 =?utf-8?B?ekV2dzBBLzJVRCtOQjBJSFNMTWdTRnA1blo5Ky94N2dURitxVjFKVEd4S2xB?=
 =?utf-8?B?MGVTanp6aHJaMVFMNHJlOWVCbzhNSDhWS1RCM3ZyTmp6Tll0UW51S0hzK0l6?=
 =?utf-8?B?RjlNK1paRllHVWJocVhWN2xQd0lWWTVTN1BZYlQzUnl3aEdOV1dqL1ZGaU9J?=
 =?utf-8?B?VG93SzhHZ2tEbjdIdGhsY2kwbFhaOGVhZTBDeGtMRWNhTFFodkh2bWNBT0Jx?=
 =?utf-8?B?MlJ6UEdRdlRETFZJYWRyVjI3Q2tIQnFGczZLRkJ6SzZWQ2hDSGVvbVoxOGZ3?=
 =?utf-8?B?SEdMbFdVOXlDVnlodk5veUViMGlzckMxemQ2eFdPS01ZbW5ubFJHSDNpT1Fv?=
 =?utf-8?B?OWpnVGMzQndXeHdQaDJObFgwdUlRekd2MkJlV3ZCV2h0SDcrVFVUL0NET0Rv?=
 =?utf-8?B?eWtoNDNXa1RUcFcrMXdhZ0tqWk9KNHU0azRqYTMrOHJHeWdxNVRmMmFjLzNL?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00C474DD015D44E9FF28840E9F4BB46@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf94df4-6e2c-4f82-97be-08dda3637656
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 12:29:33.8270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaEkH9igN9O2B2kHTuwvhCiCazqUIVYnoXVog44ZGU63bYFvIz+ijw8cpIRd2+W+bgbC4VPCvf+vqIZqEH46vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 12:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117738

SGkgQXJtaW4sDQoNCm15IHJlY2VudCBmaXggZm9yIGxtc2Vuc29ycyAoZmM4OGM5NmM0ZTQwIGxt
c2Vuc29yczogRml4IGJ1aWxkIHdpdGhvdXQNCnNlbnNvcmQpIGlzIG1pc3NpbmcgZnJvbSBraXJr
c3RvbmUtbmV4dCBhbmQgc2NhcnRoZ2FwLW5leHQuIElzIHRoZXJlDQphbnkgcmVhc29uIGZvciB0
aGUgYmFja3BvcnQgbm90IGJlaW5nIGFjY2VwdGVkPw0KDQpMZW9uYXJkDQoNCkFtIE1pdHR3b2No
LCBkZW0gMDQuMDYuMjAyNSB1bSAwNzozMCAtMDQwMCBzY2hyaWViIEFybWluIEt1c3RlciB2aWEN
Cmxpc3RzLm9wZW5lbWJlZGRlZC5vcmc6DQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQNCj4gZTQyNTQ5Y2VmMzY0YWUwOWIzYjdjOGI2NGJiZWFiMzJlNTBmMWJiMDoNCj4gDQo+
IMKgwqAgbmV0LXNubXA6IGZpeCBtZW1vcnkgbGVhayAoMjAyNS0wNC0yMCAxMzo0Mzo1NSAtMDQw
MCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4g
wqDCoCBnaXQ6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZCBraXJrc3Rv
bmUtbmV4dA0KPiANCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IDQ1YmRkZDI1
OGEzZDFkZWQ5MjVmYWY4Mzg5ZTAxYmI5NDhkYzdmNWI6DQo+IA0KPiDCoMKgIHBvcHBsZXI6IGZp
eCBDVkUtMjAyNS00MzkwMyAoMjAyNS0wNS0yNSAxNDo0ODo0NCAtMDQwMCkNCj4gDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gU291bXlhIFNhbWJ1ICgxKToNCj4gwqDCoMKgwqDCoMKgIHB5dGhvbjMtdHdpc3RlZDog
Rml4IENWRS0yMDI0LTQxNjcxDQo+IA0KPiBZb2dpdGEgVXJhZGUgKDMpOg0KPiDCoMKgwqDCoMKg
wqAgcG9wcGxlcjogZml4IENWRS0yMDI1LTMyMzY0DQo+IMKgwqDCoMKgwqDCoCBwb3BwbGVyOiBm
aXggQ1ZFLTIwMjUtMzIzNjUNCj4gwqDCoMKgwqDCoMKgIHBvcHBsZXI6IGZpeCBDVkUtMjAyNS00
MzkwMw0KPiANCj4gWmhhbmcgUGVuZyAoMSk6DQo+IMKgwqDCoMKgwqDCoCBmcnI6IGZpeCBDVkUt
MjAyNC01NTU1Mw0KPiANCj4gwqDCoG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXByb3RvY29scy9m
cnIvZnJyL0NWRS0yMDI0LTU1NTUzLnBhdGNowqAgfA0KPiAzMDQgDQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gwqDCoG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXByb3RvY29scy9m
cnIvZnJyXzguMi4yLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxDQo+ICsNCj4gwqDC
oG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3BvcHBsZXIvcG9wcGxlci9DVkUtMjAyNS0zMjM2NC5w
YXRjaMKgwqDCoCB8DQo+IDI4ICsrKw0KPiDCoMKgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvcG9w
cGxlci9wb3BwbGVyL0NWRS0yMDI1LTMyMzY1LnBhdGNowqDCoMKgIHwNCj4gNDEgKysrKw0KPiDC
oMKgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvcG9wcGxlci9wb3BwbGVyL0NWRS0yMDI1LTQzOTAz
LnBhdGNowqDCoMKgIHwNCj4gNTQgKysrKysNCj4gwqDCoG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L3BvcHBsZXIvcG9wcGxlcl8yMi4wNC4wLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
DQo+ICsNCj4gwqDCoC4uLi9weXRob24vcHl0aG9uMy10d2lzdGVkL0NWRS0yMDI0LTQxNjcxLTAw
MDEucGF0Y2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gMzMgKysrDQo+IMKgwqAuLi4vcHl0
aG9uL3B5dGhvbjMtdHdpc3RlZC9DVkUtMjAyNC00MTY3MS0wMDAyLnBhdGNowqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8DQo+IDE5NiANCj4gKysrKysrKysrKysrKysrKysrDQo+IMKgwqBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR3aXN0ZWRfMjIuMi4wLmJiwqDC
oCB8IDMNCj4gKw0KPiDCoMKgOSBmaWxlcyBjaGFuZ2VkLCA2NjMgaW5zZXJ0aW9ucygrKQ0KPiDC
oMKgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1wcm90b2Nv
bHMvZnJyL2Zyci9DVkUtMjAyNC01NTU1My5wYXRjaA0KPiDCoMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IA0KPiBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9wb3BwbGVyL3BvcHBsZXIvQ1ZFLTIwMjUtMzIz
NjQucGF0Y2gNCj4gwqDCoGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gbWV0YS1vZS9yZWNpcGVzLXN1
cHBvcnQvcG9wcGxlci9wb3BwbGVyL0NWRS0yMDI1LTMyMzY1LnBhdGNoDQo+IMKgwqBjcmVhdGUg
bW9kZSAxMDA2NDQgDQo+IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3BvcHBsZXIvcG9wcGxlci9D
VkUtMjAyNS00MzkwMy5wYXRjaA0KPiDCoMKgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBtZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXR3aXN0ZWQvQ1ZFLTIwMjQtNDE2
NzEtDQo+IDAwMDEucGF0Y2gNCj4gwqDCoGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10d2lzdGVkL0NWRS0yMDI0LTQxNjcx
LQ0KPiAwMDAyLnBhdGNoDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMTE3NzM3KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTE3NzM3DQo+IE11dGUgVGhpcyBUb3BpYzog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMzQ2NDIxNS83MjcwMjY2DQo+IEdy
b3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWRldmVsL3Vuc3ViwqBbDQo+IEwuQW5kZXJ3ZWl0QHBoeXRlYy5kZV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

