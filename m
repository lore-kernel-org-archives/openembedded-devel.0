Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1BBCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:12:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.web11.22792.1758741131856518671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sEevAK/Z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=sEevAK/Z;
 spf=pass (domain: arm.com, ip: 52.101.69.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e4PEc8rvS5/QoBkFzM4zNidbWrzVmZpU74hZG0tOZ+eGaFt0Dpq8x/AOW5O78+tYY5mqYCE4VSpw/lzqSkE0O/mzPeKkw6M5SgGlnZB6KzBYiMsWH4mSouqhZeCtkEa4GYaiiHkVjZauqmKZs8r0IVcjo0ktusPzgGum6FArh0Ia1RKLPvTX1Ng1akinAw5ogwqyfFPn/SxU9X1ICUTjc3LRlQ6A8+os8GrnP40d89qR4Fa90Wamb3xRIZPV6Yjax6BBwBdkil+PFzS56Q/1eKNVmGUlUjZ2spnrEKwUfrC+dgDTlStAayzM/aU2YWskP/ezsysUW9kaQ5Y0lk3RZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmT5EY0tyFbIAqSbTwcayoJVB7CFr3iSkQOLloZ79Q0=;
 b=kIvXr6KfjCJr6q8LLfQ6fHtVIXWV+EJaU7ju9P+ZTbYFELAR2HLydHdDSJblH0nKma0C6qwz5+X9fpvzUzST+KzYRnTOB6RPlGPF4BzjV//VVPSRGzb3UEa7vQbH68GNJqq/m8n2kt5v6uSQYZoPmblowhzeyf9S1cPQQG/mGcadZUhQNH5X4iBmSscrnlYixDGB8ZidB2i9+aeRHek1uMVfgdGq1fHUoJEVOoaWjpXrEvFAy9PzWjxjyp54qGSPEQZN/bF1ZnT9a85t4VlWxASeiiUjqwIRcpdhzGc9HKZY2F5q19J5BwF31polqQSD7Evt2UZK5avu2jtC1uPzZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmT5EY0tyFbIAqSbTwcayoJVB7CFr3iSkQOLloZ79Q0=;
 b=sEevAK/ZTQW5Ml13gZMu1MDfQcOGV7+fz6othJp7NeAH19QwmYIwmyQ00naCBhA5lPpb8WKixUGYKzGOpz2i3a3Hh+s4wruYU4h5OKCiUU92+g5cPhu3Wkrm7LcUmSI3No5UGOJojYPxPcTs/edX1fQvAVN6MJxl8N+TeQsm6h8=
Received: from AS4P189CA0035.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::14)
 by DU0PR08MB9750.eurprd08.prod.outlook.com (2603:10a6:10:446::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 19:12:06 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::6d) by AS4P189CA0035.outlook.office365.com
 (2603:10a6:20b:5dd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Wed,
 24 Sep 2025 19:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Wed, 24 Sep 2025 19:12:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkOVGJzXepixQk0y5l+VLvBGIERfQ8AX0kKBXErvTxh0rpe0Z7Q93yyD1X/qeQViLEnMZBbeT12gLbRvjlcrBEAxjqP6zrM8Cw8nxVb9kjlrfkDcYx3ViHhRZDsQz+MlJM4pQ7ytDmomHLag5TtCsxNNH/ALt6taOTXGxpsobPaMbIBED+AC2J421xdKGZjjqEG88eCyMKoXerY939GWo3eMixFqyR64xEq65mPIOLPJg1Oi+UzP7RmJP6RtxP1A2SkSU9PlcjkxsQ0zN3XbO6ytCU+x77k+RuKP1rTwra1RTkW3jfMnVhoS1w2nVbmUQYo+yxEcGbOGBhfasMvUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmT5EY0tyFbIAqSbTwcayoJVB7CFr3iSkQOLloZ79Q0=;
 b=tvGBR4+fA2NJYBAgx+aM1Z8DGZTz5N3Q39RMGV39mE5/hraPJescsnFhIXdF73vyRG1dHDMOnTtYZEPWS+1JsSQYmAwgOg2Tp+u6gxthC4Jn2KYRQsardh+Q+FQC3AU0yMGepB48ZRYANPHIkLxHO0yVXJy1Nywshsm315DeNQWjXffbhiLY0nnVJ2ZlFX93AGtuvBY3YqWX/QbV9E10+LmJRKJToNp4Eh7UxwlHKKTOKCGs51fjCnlnYjoMtS6c4gYCA1oQwhfN1UcelAh0IUYtxHaC2UoDtq+I0MYLeDtkeZa6qxHggf1DqZts+OsArT225TG+PAD0uo+3W98+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmT5EY0tyFbIAqSbTwcayoJVB7CFr3iSkQOLloZ79Q0=;
 b=sEevAK/ZTQW5Ml13gZMu1MDfQcOGV7+fz6othJp7NeAH19QwmYIwmyQ00naCBhA5lPpb8WKixUGYKzGOpz2i3a3Hh+s4wruYU4h5OKCiUU92+g5cPhu3Wkrm7LcUmSI3No5UGOJojYPxPcTs/edX1fQvAVN6MJxl8N+TeQsm6h8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9020.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 19:11:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 19:11:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: jan vermaete <jan.vermaete@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native +
 nativesdk
Thread-Topic: [oe] [meta-python][PATCH] python3-pyproj: added native +
 nativesdk
Thread-Index: AQHcLYRAz4NC/MHdBE21+s5SMg4yf7SirhYAgAACmwCAAAJLAA==
Date: Wed, 24 Sep 2025 19:11:30 +0000
Message-ID: <AB025FE6-65EB-4765-BA1D-C972F34AB346@arm.com>
References: <20250924185113.40093-1-jan.vermaete@gmail.com>
 <45A18B2C-FA43-4EA4-8E79-102E11E5C092@arm.com>
 <CABF_=yiLOVcWmOiSYUTvLkUCDD_SYsjCifnAvvvQGo5h2AiSCQ@mail.gmail.com>
In-Reply-To: 
 <CABF_=yiLOVcWmOiSYUTvLkUCDD_SYsjCifnAvvvQGo5h2AiSCQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9020:EE_|AM1PEPF000252DC:EE_|DU0PR08MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 440f5990-81e3-4022-d2e2-08ddfb9e3f8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UHBKMWFsSlZvd2VacWZxRk13TW0yWWlDeXN3OXQwaEFpcjI4REppVS9lZXd1?=
 =?utf-8?B?ei9vMHJYcUJ4eDRIK1daL1UxdE5OOEFWSTl2Z0o3akVXRHM1M1JzMm5GOExX?=
 =?utf-8?B?cW1JMG5BVGVNVkg1Mm42bytOQVhGUk5QMFRtdWRTYVNQSWJjcGlpT3RkTDNw?=
 =?utf-8?B?eS9VM0pzZmpqb3lldFVxbzI4UWYwa3p6SEljd1lFZmhHczFoa0xnSEVHT0k1?=
 =?utf-8?B?RjMxMzEyU2Fvb3RobXY4RWFRUDNISU9GaWVPSkRxbk4zbFdiTTJucHRWd1JZ?=
 =?utf-8?B?MzA1S0VFNXpmVFF6NUoxTEt0Rmx4VWhhNDFvMTRPNi8wcnZQcEJEQm5KdExF?=
 =?utf-8?B?b2lzNHlzSXRVejhDekFQN0hWODkvOG14Y3ZvVFJxTlM4c2pJSGdaRlZ5T0xp?=
 =?utf-8?B?RzlMUENqcDhkLzhlUHVNYS9MdTVYWE9UMjlGS0tnOXhrdUh3aG5GUnVDczVB?=
 =?utf-8?B?M3gxSTk5blcxNjVjNHJZWWdNV3pJRDNSZXVtczJwL1FTLzNSdE8vNmVlK2ZS?=
 =?utf-8?B?eEh0cTZGSXdKbVBxSUpubGc5ajYvaitCQUdrdlhvOUIxeU9vZVRvaERDQkYv?=
 =?utf-8?B?Mm9Za2g4cGR5N1plQ3dsd3YwTDZsWjh0S1l0REwzUkVtVFNXbGJQSjBQTjJG?=
 =?utf-8?B?QkpldDk5bG9DSHRwZVo5Z3pDbE1SdHdWRW0zN1RmNnc0Q3g3YXNIQXNUVmlI?=
 =?utf-8?B?SVBvT2xJZEhTZWtiS0ZVWDhJYSswQWtnck5FZy9iUGlIa0ZFRzdnWXlmNnls?=
 =?utf-8?B?NXJHUmtZeE9jSTRUdTMwRFpYbzl0R2J1QURYd2l3NjRYaVFidW1aenpBMmZk?=
 =?utf-8?B?ajNlS1ZwRDNjR3MvbnZHeHVqMXprSEJOUEhKb2ZHMUdFN1ZSRjY4RVVQeU1I?=
 =?utf-8?B?TTU2SUYrellFbkIxc1BlUkdYa1dSMU0raDZpbVhNOFdVa0VvYjRSRnZQVVhJ?=
 =?utf-8?B?K0l0eUJHdkZkWnZ3VXB3cGFJc2J6OGd4UVhCUmhLcGFwNkx0UVJQK3orM2Fy?=
 =?utf-8?B?WWFFOXl0ZGM5UTl6YkxqTmpIUFBsZWFkOXBwYVppOW5wWnFqOS9QZi93UUtC?=
 =?utf-8?B?TDVBcW8rMkFXK0pLS1R4R1Z1cEYvNUV3Z2RZeWJGWmlXNUlwS0U4WVV1cXdh?=
 =?utf-8?B?ZE1jOWxRYUdlMDUvSWxibU15VVkzeW9DMXhDbVJsK3BadTdYS2xwVzJhS0Q2?=
 =?utf-8?B?OXE5Rm9WQUY0WjI2djFJbVRPbVJXdEJpa0dVSUFhdG1kQzVHY0J3MWE2NjVn?=
 =?utf-8?B?SjdrNDdBVGpKMXpGNTBDR2lFQVdUTzJPbkNXU1RPUDJOYmRkeHF1eURDamVN?=
 =?utf-8?B?ek4zLy81dlhXWXk0amdKTEEvZ3pTZXlhQng2UnJlcmRJNkVBbGNLbVNqR2V4?=
 =?utf-8?B?blQwMnZ4Tkw1QlJ4OUZISmYwUStwdE1NUitSRG9QMmVSNi80eHVJZ2ZRZm0v?=
 =?utf-8?B?NDhqQW5qMG5rSzJCalpIcWtma3FoMkgrdUhzalJmNlhwS1NFOGY5b0hYenRm?=
 =?utf-8?B?Vy9xRjIrQU81cE5PQnBxekd3SXBWYk5VUlFmaEptenpIdmVaS3dWY2JKMm91?=
 =?utf-8?B?R29SOTZud2ZJT2piSXN0TmtxY3NjMUNDcGlGS1FzdDIyTm9LSWxlREt2MGtW?=
 =?utf-8?B?cFlxdktmb3ZJblFISzQybDAra3NUNGNQZFNGZXVPYjJRZ1NYdEdxb25lWFY3?=
 =?utf-8?B?dnQ2aC9zUGlIVU9tWm1jbjh0T2tJa0lZMXBTaldPSUtaNXN3K0hNUUYwOEVq?=
 =?utf-8?B?c0s2LzU3TXA1VXJ2TW9OajZmUlBWYm0zWndPVFI1ckR0Mlo4amJqS2hGRFVJ?=
 =?utf-8?B?ZTNpV0VPRTRPQmlkZXJ4Sm9HQmVCall5dmRYTnkva0tTSlBFeUVVYU8rY3VV?=
 =?utf-8?B?SHY5b3lvdCtBTmxIWFZHZFdKU2ZPelFCT3EwT2lTMGdBNEtwOUp4a0U4ODhq?=
 =?utf-8?B?MW0vNGhHK1diZjZvbTZYbkZJbDZaSVROVXU4T3dMRkVKemxXSi9YYnZJMnly?=
 =?utf-8?B?R3JMU0JFb2VRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D04910C51BD68149AE6F58A53BEAE361@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9020
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	781a990e-8362-43de-fa28-08ddfb9e2b56
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|14060799003|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3pRcGgrZ2FFc3M0REwybURuWURYVXlsZHR3cThZMkJHelVXZUVCRnUvbnFz?=
 =?utf-8?B?UzRKU2xpcGNPQlpYbXNMQk0xZWlZeXVvTVpVRWxWaVN1QklRV0RKUEt0TTVM?=
 =?utf-8?B?SjJ2Q1BWb2ZBdzAwYlp2WlN0aEpqTURmWHlBOC9LV2o0U1MxLzZZNzBIZ3lv?=
 =?utf-8?B?NFRBb01mWTlENE5pS1ZFelBRQUEwN21ady93bGQzZ0FTY2ZpeHhUcjRUbnBX?=
 =?utf-8?B?cW9uRXVrNzNCT3VabVUvMlE5Y0xMUXc2QkQrMXZCWjZhR0FyM3o5czBkSUto?=
 =?utf-8?B?cjFCSnoxb1lheGtRMmk4V3A0ckdBb0NjVHNxQklkbDZ6VHVxY1FwMTVjVGty?=
 =?utf-8?B?V01vQlBvbzU5MVhEaHVwenVKNVhHTG11UDJlOWZmTHJxaFBERnZNeStUcHJv?=
 =?utf-8?B?ektZT1czdXZOeEx3ZTBQV3R1NjNvbDZ1YmxiTzJ6c1VEZTJXdFc2UFcrbHBr?=
 =?utf-8?B?aXF3ZGxnZHdJV0RiNmlQb1NIVW05RVhNVVpHbmhIbjRjVFhtR3Rpc0pKYXlw?=
 =?utf-8?B?UWVERTd2OVcrYWY5M2VjeUhDR05CN3N6elRrT0I0YVhnN0dYT05RaG5lMnln?=
 =?utf-8?B?NEJiY3pZYjIvZmhGVUN6ckxsdUVNYVZNWHhXV2tvTW1rL21UdVI4dHFsKzZU?=
 =?utf-8?B?Wm9DOUNNRjU3SXhYK0NLcUtYSFplWHdyaFV6UWlkYTNZVWwrTTlwTzlUSC8v?=
 =?utf-8?B?RVRudmFuajJGSmdJbDhxQi92RkREd1JxZnlscVgyR1BFQ01uaGNPZDc3SWRP?=
 =?utf-8?B?b0dvNVBBN2VRazBjU2d2UlhKMGR3WnltN0xoN0ZteVFYZUt1RXJtVHRlWXRK?=
 =?utf-8?B?MTFMa2pKcXVqYjRGQnRiWHNMVWdDZUUzYzR5c1BJY2R4UkRsSC9lUk5CaTcz?=
 =?utf-8?B?SUdMQVZtd2F3OGttSUZLNWp0eERhT0g1RlFmWnhuRjZpdU8rYVFmUXlzQXh5?=
 =?utf-8?B?a2tsVVRDQkNEalVaajNDU2c2Qm0rMGJjS2VjL0JHMGRGZW81SW5Rem0xZi80?=
 =?utf-8?B?dkU2cDU2QWFrUUhwWU52K0VjblZYWWdDT3NqZmZEcGhTaVBWZndicnVvSWZ1?=
 =?utf-8?B?dXZVdm9KOGE1dVNORjFQSU1KRGRWcXI3N3htbzVRL1lBWkh4TUJodWpSR3Zn?=
 =?utf-8?B?c2Vra2NjMXptQ1BoNVJCSDZrd3JQcVp3Ny82MlpKRWV2U0dGeUF0aXdzZSt1?=
 =?utf-8?B?bHFLREtXOXBLa1QxUkRqcHlVY1FpdEFKeTltV09QTUYzd0RFZUp4eEtiQ2x0?=
 =?utf-8?B?eXVyYTg0VWs4VkhyQU9scVJDMDdLZU9ialV6bjlnOTRyV0JBN0VoQkQreWZa?=
 =?utf-8?B?Z29rMWdSNWpJejYzVkZBSFRwcjVHLzNtcVRrYkpNWllqdXJLNHdCaUNWWnBn?=
 =?utf-8?B?b3hpT3VzQkFMb0kzWDFpRXRyVG5lTFRDckdLbDJkN0x5VncyVkNrWXkvSjlu?=
 =?utf-8?B?Q3MrZTRjeFdsd1dYNGVpYm9EdWRqQ1lSamFGbGhvdDgwUjdxNkcvYktKb1Mr?=
 =?utf-8?B?Rk1lRzZGeTJmMGFBY0xFam9BTEhXeFQwRVBzNVZoZ1Z6R21MSHRwa1FKbm00?=
 =?utf-8?B?NXFCUENjSkEwSVQrR2duenAyd3pPYW9QOFFTdnBHcDZJUCtVL0ZIOWN3YjN1?=
 =?utf-8?B?K3B3bXdpYkY5QlFCeWFiRGF0U3AzVVRZcEk3aFk3ZFA4eDB2cGFrNXdWQmVG?=
 =?utf-8?B?VzV6WTFkb1kxd0JsTlpWcDBmci9hamNTSlo4S3dFRmZhVm4vem9BaldJZi83?=
 =?utf-8?B?eEMwNVVZc29GdFVwamVxVmRhMjVaTURJbmc5QmpsRWo1Nm10b0dRQXZtcW5U?=
 =?utf-8?B?UXNPWDVGZURFUmNlZ1BGRWFNWEh5QkZMbnBoTTZrckdNL3pXZjRwOHNETXMr?=
 =?utf-8?B?SjFrRW5ranFiN2lvK24xZG9Tc2hqSEE1T1NXTVR5YW5mTEd0L2NwQ2ZjNkZG?=
 =?utf-8?B?TTh0UFJUTGoza281SUUvejBlNEVPRGRoTEJWL09iTzhwVnh4dVlLeTU1cDlY?=
 =?utf-8?B?cmtEK3lqN2dRTTUyRjUwanZKMmZib3VZNTBUc3JiTFpOZS9sbmhHT2ZqMDVn?=
 =?utf-8?Q?dGQwcA?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(14060799003)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:12:04.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440f5990-81e3-4022-d2e2-08ddfb9e3f8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9750
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119835

T24gMjQgU2VwIDIwMjUsIGF0IDIwOjAzLCBqYW4gdmVybWFldGUgPGphbi52ZXJtYWV0ZUBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gSSBkaWQgYnVpbGQgdGhlIC1uYXRpdmUgd2l0aGluIGEgcHJv
amVjdCB3aXRoIG1ldGEtcm9zLg0KDQpTbyBub3QgdGhlIG5hdGl2ZXNkaz8gSWYgaXTigJlzIG5v
dCB0ZXN0ZWQsIGRvbuKAmXQgZW5hYmxlIGl0Lg0KDQpJ4oCZbSBwdXNoaW5nIGJhY2sgb24gdGhp
cyBiZWNhdXNlIG9mdGVuIHBlb3BsZSBhZGQgbmF0aXZlIGFuZCBuYXRpdmVzZGsgYnV0IG5ldmVy
IHRlc3QgdGhlIG5hdGl2ZXNkaywgd2hpY2ggdGhlbiBwcm9tcHRseSBicmVha3MgYW55b25lIGRv
aW5nIGEgd29ybGQgYnVpbGQuDQoNClJvc3M=

