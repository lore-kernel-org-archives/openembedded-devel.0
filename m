Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3328FCCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 13:35:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.web11.15554.1761917708524164263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 06:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qg6cb6s+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qg6cb6s+;
 spf=pass (domain: arm.com, ip: 40.107.162.18, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yEChW2YQdMnz/NG007wW1pWbCIIfKx9PkoL9BbyMz2dpU1GH2vtOzYtj3YdBMChlA/H2klxWHCs/y3sbhWC57bzhyLzyjTCoguENC3/BFKmzIOlXWsOssG3WNzo1p/MzXktSCQBuYDQK+SnkfqZDlbDEeLsK8QYtJP3XBMRjvVsZ7tl6DB8PE+t0f5/ClWyHEDyKjqF6JFeLZGXwyq56rW4ujxxhNA5q6hGnh+4FclXWEkcwgxVcBLR39iG3BRsFPmq102+nWM0fXcFLLxKIliMfTnBdpFOLFGPq1hxP9g2Q6cBBIIS/PwuwCYjLb3V+zqlD6+e3Zj5ZMm4VvHWLnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/3Fqb8PW6TKkiEcNbkb6iTNhs7yx6o6Jpd2wMq7po8=;
 b=lYAt9tERw2GHQA4z/2SvUYekYpZj1ACMDKi3qkniyBatJNZHmjRtqntddiwuqivLsbIOvd/RRX7i53uLl2peZTyZCvX7uEKgmwIcmjIbQT/vHmu3RzaACRiluH6CPFcGyhgCqi7L2Pw43jPpMsUr09mjNhBmqoB41U2fO33ORtXeumvNM1HcfDXQQrzI0FCEQvO1lPcPrDKyzmPwUSSxbsLmJ1TBq8N5EArf/9Jveh7YQat+aYWmZZGGcCtyjFff/muPZ6GJUsGxAsyIfkJkBnBeSOWmB7Y/ZTKeE49P5fhKuavE2HHuaCjYYOrZGV2Jsq4PUiquzGpWjORZCNIF6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/3Fqb8PW6TKkiEcNbkb6iTNhs7yx6o6Jpd2wMq7po8=;
 b=Qg6cb6s+q8okPTqBLWsY1gRBleARE3jv858cBONbJBtPU1HDu2sYbbdz4Jn36+HROlbDCK2XwkXlrLe3s4a6EtRpvuyGnJX4TnJBOVLAmJH8dSRHZdU1ack0T+D4BGKPTTV7n/CInEtRfwL1V682Ba4xrvXjF0xmktxjSzujqNo=
Received: from AS9PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:20b:530::7)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:35:04 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:530:cafe::82) by AS9PR04CA0161.outlook.office365.com
 (2603:10a6:20b:530::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 13:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 13:35:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBCWDcMiC1wiI84rgy1N1QU+FQL2QNYpwXlJKAdGULExk4UHpYF0yskY3TcnR1a6lWculJcI98bONPj0T96LRTccppKxGrIAoxXqfy7pkhT9qIv2wwg6GPj6cQGLSIN9DH7uIJk+SqrkHEt2v/R3kaRqYFnJUj4tqWGMX05cbbe6Ho3Gj9+cPpjXRVG7NZwbwk97LRUJIsfr8t0N2ma8yPspBArTTniBBc/rUhpUWschCpHaMrQhQG6uWuaFSd3N5ADM+kTQ88NukMHO3M9oYnYlGUHlGW8JFb764LWgndGB4WJVa4zT8DrNUbaYl/fnVskhzNCa4tC8IlrvZ+eZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/3Fqb8PW6TKkiEcNbkb6iTNhs7yx6o6Jpd2wMq7po8=;
 b=WxqKZW8o8xJMwA5pu0pEHd/iYLx6A0QA9iFmhhz6StGJmNudM4ZbVR68QeScpva0laCySApjNBzffa/bA/5hCeu/GI4p8KLZfNieE/QhsUigcphMZoKda1mYPeXgCx+QCMh+zZ1y67DGqXC7IGcn13Na9mNdfOhtuDwxk8Ftjb9txbKo0ZiUXALrej17CGLev9bHolCHq/PtDj7rtZlMgJTydiPgqzBZSQYeReXFb9PUJ8DHYu9H0XcQ/QpyqRqnl8/8l3cjbMYVpatIiI8ZCls1iY6KFk+OGS4fg7ZnD1aslsUn8aqLtOVVXMemLj7HAZ2rhJmKhJUv6ogGkSalsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/3Fqb8PW6TKkiEcNbkb6iTNhs7yx6o6Jpd2wMq7po8=;
 b=Qg6cb6s+q8okPTqBLWsY1gRBleARE3jv858cBONbJBtPU1HDu2sYbbdz4Jn36+HROlbDCK2XwkXlrLe3s4a6EtRpvuyGnJX4TnJBOVLAmJH8dSRHZdU1ack0T+D4BGKPTTV7n/CInEtRfwL1V682Ba4xrvXjF0xmktxjSzujqNo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5645.eurprd08.prod.outlook.com (2603:10a6:800:1a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:34:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 13:34:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 ->
 17.00.0006
Thread-Topic: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 ->
 17.00.0006
Thread-Index: AQHcRCt+2NvoNToeqUiEOPVOx6BaobTcTcKA
Date: Fri, 31 Oct 2025 13:34:26 +0000
Message-ID: <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
References: <20251023144351.264756-1-skandigraun@gmail.com>
In-Reply-To: <20251023144351.264756-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5645:EE_|AM4PEPF00027A5E:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0f3b26-62f6-4cad-9a9e-08de18824be8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RmZ1T3g4Kyt4NnduWUM4eTFvNkF6WWF4WW5wK3p0TlNVQUNjUEt6NFBsdVJp?=
 =?utf-8?B?TDI0Zkk1NVhURVlRVTJZVXJxZ1VWdUNXenpQYlYvMmh6VlYvL2RDY0hBMkJ3?=
 =?utf-8?B?bE9XU2Exb21idmJ0SzB4YSthcXF0eTNOOG1RZmFvRDdtUWdlbWZwVnBBUGsy?=
 =?utf-8?B?QjJsTkFsQm1pQllVRTNqUG0vYjZyZXJSSEFCWkQxeWVjcnQzSGgybXJ4TC9p?=
 =?utf-8?B?VU9PQ1ZVTVhCdVdFTE8xVVFhdnBLM3MvbVh4RGlRMlpMQU1wOXVRbUFwK2Zu?=
 =?utf-8?B?N3BhRkgrQy9qWnV2d1d2OE10Y1N5K0pkYlRZWW82RmhjODFoTUZnc3ZONWVs?=
 =?utf-8?B?NGVaNFc0ZXBKdnJOVDkybTUvWVNqbWNHNkM1aGRSQkNCVVcwYkRaS0k4U2Fz?=
 =?utf-8?B?TW9WcVZ0WWpDalF4YndUWml2TGhzbWZOTnBhaGZBM0RpZG91eXZwSm50djJB?=
 =?utf-8?B?ZDRXc1JxbDU3eDk1aHAzTXNjQkZDN2wwblkyQllRMitXdTR5L3pWZ1JJanpN?=
 =?utf-8?B?T1lCTTJGTDgzMGwwRFg0bXZVbWFlV1dYbFRhNG8rN2ZUTmJFa0RnbERreCsr?=
 =?utf-8?B?Mnd2SzNtdEpLeVU5NmFMTFk2bk83cmdxbWFYQnNmcGtUUkpnYytXUGg5Z2s1?=
 =?utf-8?B?VXRRZ3lzK25PN3o4WjI0dVMrSVdaT21qZlFGS0tpWGp3MDNidVQ1ZThROHl3?=
 =?utf-8?B?SUo3L0x6alM1STlpYW9hQ0MxNGFyRUNQSjY4cjRreWVoWUc4MDVZZjN3dWpZ?=
 =?utf-8?B?MnRMUFp0SFZtdUJMdGV0YzI1QjhVR2V0c0VUMU5TT3pMSWZCcWo1TlRDUzZu?=
 =?utf-8?B?Vit5K2tPSWpxcWFoQ1dGZnhJODM5R2lpcWtzYUpvNlJDaytCc25SUVQ0ZC9n?=
 =?utf-8?B?RGpWT0pIK3RaN3Z5THljamFmTkwwcFBHNTVkRG1LTW9IQk9GK2JuZXNkdDN4?=
 =?utf-8?B?Y3lxb056VzFHdTBrQlhTNEt0TXowSGgvRDIrcXdtT2UyYmxsbnFiRDg4QVow?=
 =?utf-8?B?U05iUjZZR083aVNhWkhQemdIVWdKd1BKb2JEdkJFd3JqSFcxaU9zZkxXY2Rk?=
 =?utf-8?B?MUtaSGZIK3ZoNnJNS2pIMktyQzVrSWhPd0grN24vMHlhSTdBTUdCQ0dlZWlr?=
 =?utf-8?B?Smx1NFhyb0MvWkhyMnJwaEozSnFTbjZtSkluQ1RmaEM4dFE5N1ZubXFIZkJs?=
 =?utf-8?B?YWg3T0g3bjkxd3IwaHNvcVIrWEltUk1ybStkaUI3K3FKNk1EU1NPeGlBcVJZ?=
 =?utf-8?B?bGFibDNDVGJOVTNkdnVwUnFJWjE0WUtTR0JoNDYrUiszOHJTWS9FN0FaYWVa?=
 =?utf-8?B?cllJQW9SeWRac3pmbkpxWDJJeENrWG9NZ2lNQW9aTjNxTXZrVXhDdnhBMGpU?=
 =?utf-8?B?bjdjRFFvL0Z6eTVBZi9uKzgvd21GeG1tZDJhZHVUVnB6cFg1S1RtejdmSGhU?=
 =?utf-8?B?L2MvNnI2aWtsQ2lYT2ZDdDRDTytaTDF3ekhkN081ZmxTZFpIb0gxUkUrY3Z6?=
 =?utf-8?B?ZklRRnFMajVRWkVCclpXNjcwTC9qMmJaMlNrZklGOXlRTW03VjNicTN4M3R1?=
 =?utf-8?B?SCs2a09HYUt1Qi9qRG1lZ3RVVEdreEloV0Q4ekd0K1pZREVzT2o4RUJPdmpu?=
 =?utf-8?B?SnN2cXB2bFJrZTBISXA4dU13YWJYTlJOb3ZCaUgzRUZDbFhaUzN4aVlPOTZF?=
 =?utf-8?B?Ty9Ec29pQ0phWm5paGRUSnJqYmlBKzhDU1kxNGJsZTZxS3VjdFN2Uk5PZ1Z1?=
 =?utf-8?B?QXpQdFZieEdIc3o5VXZsV0xiWEw0UzIwNStHRWxqR3lHbGhZb1RoZEdqVWY1?=
 =?utf-8?B?dFBKZnB3V2hYbUNzR3JWdmsvUW1JV3JEMHN4ZnEyVDBQOTFVN3dOL0tuRVBI?=
 =?utf-8?B?NTVqbzdrS3RDQmNEVkZDNDdBMHV0RExuSk42UXloWk9SaEFMSXk4SkhMbmdY?=
 =?utf-8?B?WnlCVXFSUUt2MnVwcEdIVm0rK3hONElDNDZHMnVUYlZ5U0xBSWpYeGZhUGlP?=
 =?utf-8?B?a1BzWVg3eFBGaHFiUG1BQlMxUnVKV2lXeXM5dUR5YVlUL29tZlg2TmxMQzJh?=
 =?utf-8?Q?SOwC2n?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <833852E144BC6945869104432161968E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5645
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f569f17-332d-4d5e-17c1-08de188235d7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?alJQQzd4NXc1dVFYRFZLZGR4dkdEdEVxZDFPTy9JYXppc01SdVZJV3lwNEt0?=
 =?utf-8?B?QW1sNlJrYnNIcGJmQ3VyMG9aZ1hkL2t1cUM4YnlLY095QW9tb1ZNR0JxWSt0?=
 =?utf-8?B?d0x0aGpGamZHbkNnL0ZTOGx3enp0UGYxcEZPbnZQV1NienR0L2F1cjN6RDVP?=
 =?utf-8?B?ZEF1ZzBjSVFEWlRmT2FyRFlKNVVjTUZmbTV0VEFRMlpPZ0dxb1lQNGFJcnFY?=
 =?utf-8?B?YWdUM1oybWJuaXhJdEU0aVRxUFpmMTFodVlGbDZId3Irc3JPK0wxTjRjUVIx?=
 =?utf-8?B?SW1QNXcvbFV4MFJOTEVQZ0V4V0VRNXhZbkV2anpFWE9IbUk1UmUyOFMrT2Fv?=
 =?utf-8?B?MlZGYVNabStyM0FLMzFnTzJXTUlIcFV0cHh3emlEYXZ6dDlSbmxGSnZwUTRn?=
 =?utf-8?B?cFgwYUZ3eWNpclpxMUUzbnA1MHhPT2Y5ekdiRGJXVm9yaVdjcHZ1WEg0Y01V?=
 =?utf-8?B?NzNUTFpsT0g0NFhyUjFSWXZubFpqc2pOUHhOSi93S1BnM3ByM25DNHdRN3Va?=
 =?utf-8?B?WVdhckJMU2ZITlhMNVV3ekxpdXVXSEN0VGNVWlpWTE1Dcis3R0VYd05yZXRO?=
 =?utf-8?B?enNEazJvZnVDZjBYbHJpTThmd1pNQTlhai9KV21DQXhDekJieHBFN0pHeHhH?=
 =?utf-8?B?aU9xaDVkVnYrV1FTNjJvYlczU0tUNzVUakQ1Q2xreVVzRWxabkhWKzg4U3VT?=
 =?utf-8?B?QWRBd1lYY0x0R3Uyd1VrVVpyb1ZvU3NveTJHdkZiamZsZUgzVnQ0ZUVUN1ph?=
 =?utf-8?B?WWIrejFwMStMTk5vQ3J4YkUvakhrdjNVYytTbG5PUm1ZdERKSHRHT2JVNDRH?=
 =?utf-8?B?UFlVT2NGam5XcCtvU0tHSTJYTTJNNnZQOXl4Y3N6ODgwMHZJQ1NEdlpaUmxY?=
 =?utf-8?B?Qy9kQmdhRFJuZUxkbFRpSFpRcUN6Y25CdS9CZlh0eGhnRWhCWE9wMnVCMEdm?=
 =?utf-8?B?Q3hnVWtCVjBBTEhKMktENjhDYWE5Mno1R21DVlYvVStKYXQrTjQxR1gySGFD?=
 =?utf-8?B?WHRTdjRQbVFRK1FqNzkrYkdQamRkSTgrWnVDRTQrSGZySGE1NEFVYVVIU1N0?=
 =?utf-8?B?WjFqVzAxZ0xGY3RUTzhseXVBS3B6emdaZFdkL21MRFBUekZIVk04M3R5ZDdV?=
 =?utf-8?B?bzFQcVpuQjAwb1lYOWRXUGFxdTNqcEFTYlc3d3dUMnc1TDBuVzZoNUtpL2hT?=
 =?utf-8?B?VFJGYUFtL08ydjk2OFp2RXZRcFd2YzdFNUsvUUg0S2tJdDdRb202emcxSC8v?=
 =?utf-8?B?NmZaV0syR1hRU0xVTDRQb2paU1hwZjdmNUEvTUFmZWovUFpXN3Q4YWVHemM2?=
 =?utf-8?B?Q1h2Q1NRMnU1anNhTnE5TkxiaThZZXJjWVJNcGdCbDNkQXlpSUh6bDhkeGg3?=
 =?utf-8?B?bnorbFNuNU8rNkJKRUMzS2s4UnUrL1BmZEplUFlITHNhckYzREZESEFCTXpN?=
 =?utf-8?B?L1JDSVNnbDkvbnRpdGVBVml6OVpzbURocFBseURwMDA5M3NvdCtIQW13ZEln?=
 =?utf-8?B?cUF6amFEZ21Gd3AzeDJJZFZZU245MHQwaGdlTzhTVlp6NXdVWHNGUGdZZXJV?=
 =?utf-8?B?YW5SV0NOOGh1aW1nQVFIam9CSndZQld4V1liY1I4TFNCV0UwSERBMGJRUC82?=
 =?utf-8?B?dmY3OTdKVlJEcmxpR3NORlBDUElxc05BWlZ6M0tUdS9XbVc0WUl3dmVrYmJY?=
 =?utf-8?B?RVppTEdzVEg3eUl6WkJpWDYvNXI4TFc1TnpFTkVJRWc4NklLSWhwYzhMTXZ4?=
 =?utf-8?B?Qm9ZVW1iTlFSTUtUeXduSlZqOFFhVnJyNk9BMEVuQkFoWmc5TlQvd2hqSkhW?=
 =?utf-8?B?MWhzaS9OWUpTcStqKzdlTTNvQ1NFU1VhQW40VXpqZ01yb0o1RmRKQWdXTVVp?=
 =?utf-8?B?c3k3RTF5TlBxb1hFWnhWRmt0aFRhck1Ca2VZYmpFRFJvZnNXRHIzam9jaW85?=
 =?utf-8?B?R1NIWU5ZeFBObnI3QnV4T29DSEpDSDZUaTc3QjNMRFM1YUpVVDRSMUZHRHNy?=
 =?utf-8?B?dE1FTlc3UUVWVlRuUHRQZ1FGK2psT1ZoL0lxREJkc2NScFhpTm1aUTE5YUFB?=
 =?utf-8?B?c2RXQ1RYcWhZZnl4MmlCTTk1aTFqL1p2c1VYdW5WeTNhWGlZd2Frd0EwZHNw?=
 =?utf-8?Q?V8bY=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:35:03.1088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0f3b26-62f6-4cad-9a9e-08de18824be8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 13:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121232

T24gMjMgT2N0IDIwMjUsIGF0IDE1OjQzLCBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2thbmRpZ3JhdW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gLVNSQ19VUkkgPSAiaHR0cDovL2Z0cC5wb3N0Z3Jlc3FsLm9yZy9wdWIv
b2RiYy92ZXJzaW9ucy5vbGQvc3JjLyR7QlBOfS0ke1BWfS50YXIuZ3ogXA0KPiArUFZfV0lUSF9V
U0NPUkUgPSAiJHtAZC5nZXRWYXIoJ1BWJykucmVwbGFjZSgnLicsICdfJyl9Ig0KPiArU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL3Bvc3RncmVzcWwtaW50ZXJmYWNlcy9wc3Fsb2RiYy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPVJFTC0ke1BWX1dJVEhfVVNDT1JFfSBcDQoN
Ck5vdGUgdGhhdCB0aGlzIHJlY2lwZSBkb2VzbuKAmXQgc2V0IFNSQ1JFViwgc28gdGhpcyBpcyBu
b3cgZG9pbmcgYSByZW1vdGUgdGFnIGxvb2t1cCBvbiBldmVyeSBwYXJzZS4NCg0KUm9zcw==

