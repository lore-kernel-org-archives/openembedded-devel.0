Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217A6C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:39:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.79])
 by mx.groups.io with SMTP id smtpd.web11.19651.1756384791251267330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=I8VxbTfL;
 spf=pass (domain: topic.nl, ip: 52.101.65.79, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XahfXYDiaGOYzyOMxA0Z4D3kAGeTia/7tf8LykhM+wrW9fWp4sSPtoe6LIZIt4jO+XQRvl1Uzi10xNGdNnQX7ckdptcXC0DKqPyDIOxKdn5y/nOxs8Le4Iv801T5BU6oiEpgrdTH5iyE2twMTVjzXae93ymy+E9Gbr5kliD/Kn1t6faxsT0x3K/xZuIlXpt+3Ql66VyYn32HxL7pOX9V6u2UDYR60D+ahpIDPFy0XtdJXfUysr7oScfcLjfnUMPRQY8f+aM/TWWnC7Lu2AwJE3uW3s9cpmc6Cn/En6OSuIMlIvDNHO1kf13DDnlEIlWYpt/ylsu7dfKvZ0yjkrrBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG83HuLxoIJLjmWquqHYQV2W5o+I1TN1KiEOTptv2l4=;
 b=jCFcRfd844d3SyjQ2tyu09NGvbC029ByrT3RmnQsUOBCRFxE+/KSNQxScIjN5l/XBuNzw4j1AVY58n0xnXK+N5nRqyWyGdqwnvXeeS1yUx6sJo3CuwNarZov9zykhKeYqXG6b3LFbMxh8Jy3fLiEc07DtPPLLO1qlUASmlgfBY1hpboRemY6aIBr5+wYVX74q25ObHIa3JEKoQD8Ru/eTGr77nFRaXLCiw+Nh1M/t5PqsesNCdrYJx7T4q/al6laipPS9P/lbGRSYeY3kbWR+Ic6RJAkFw0r7A36okKilOE9Rk2KDlc/38zHBL/VW4XEEZ0k00LZecTuqDjhNGJ8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=t-online.de smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG83HuLxoIJLjmWquqHYQV2W5o+I1TN1KiEOTptv2l4=;
 b=I8VxbTfLaOLf0JZMA/BTsdHCxHm57z2sA9EVg++5pKoznbxAenNmJIfMhIs1W3LO/cNyK7FoEB+gU5kH729lUMCiIaLfAITyW5o5A+sqXOP9qH7D878TLNspltztXI+ZcaLaDAxnoIc5g35uDTUA/vuZ2kZ59/9Cyj54bjLnLUQrOdEX0L3TLy0CoQ0jRRUAkv+VtblIqa1Z89eUack+55vltQjqDftrxQkg4TnBrpYrQiR6SQq4mGC+IVwo15pjpT8wJhPRRPYSyYqtd1sl8ShYRaGSQCnZ0c2XuOFuXogkFtZn+2UvnHVeoBTvCkHCAuTxBB51AkoqKF6vR5MCiA==
Received: from DU7P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::32)
 by DU2PR04MB9017.eurprd04.prod.outlook.com (2603:10a6:10:2d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Thu, 28 Aug
 2025 12:39:48 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::d6) by DU7P250CA0005.outlook.office365.com
 (2603:10a6:10:54f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 12:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 12:39:47 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com (40.93.65.2) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 28 Aug 2025 12:39:46 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Thu, 28 Aug
 2025 12:39:45 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 12:39:45 +0000
Content-Type: multipart/alternative;
	boundary="------------0DS6Mz9a1xtCH9Jsunh3S6ub"
Message-ID: <76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
Date: Thu, 28 Aug 2025 14:39:44 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: Markus Volk <f_l_k@t-online.de>
CC: openembedded-devel@lists.openembedded.org,
 "Mike Looijmans via lists.openembedded.org"
 <mike.looijmans=topic.nl@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
 <AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
 <DCEO1T.WIMW7AB6YK7K3@t-online.de>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <DCEO1T.WIMW7AB6YK7K3@t-online.de>
X-ClientProxiedBy: AM8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::19) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM8PR04MB7779:EE_|DU2PR04MB9020:EE_|DU2PEPF00028CFF:EE_|DU2PR04MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9bc819-5b6f-49e5-5c14-08dde62ff95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?WDqsPbBu0ODQdu2qYxNXunDDMElK1Q+ChC6cdHxAmbS/zLTyK/8PXxnt8M9O?=
 =?us-ascii?Q?38+97JxFRgh/KfYR887t6RG0BzVW+byUXyoItqh1a4wF5bmUCJW/D/JuuC1f?=
 =?us-ascii?Q?Q/ZXEuykwvRtPv6JZTJnUUI5t3oZFcn/s/uNIenObM7ZGUuheek1jNU3KNSv?=
 =?us-ascii?Q?c9PGPFEnd5qDv6miAn3SwgPVXRoc14Xo+u60VBxq5OwwWXRla06iHGF7NQpW?=
 =?us-ascii?Q?fHhYZkXCTW7Q6fnkR3Ll0sBPobKzMiJ08pggrrkm7qPXOeTe5K1F6ZQoTrNh?=
 =?us-ascii?Q?aEIiRQfHS5zypdBqy8ztCODHkJEACQeWKT5ZYPmpBLb/e4xUJAJ1uSh0aokf?=
 =?us-ascii?Q?B03HUOO5bweW6UfMGjmlUzlYUSoUdpHuXLM4oVyEaPSFcqxetWzIbSharudp?=
 =?us-ascii?Q?yVeQg3B5eDuDYFnh44PEB2KAD4c9f+tmQq9ZbUq3Ux54WxWHBD6Slhn2jSv1?=
 =?us-ascii?Q?esbmJB0AAxOf7QE4VISPXw/jd37eK/8okbR7kte9TBpNCa3xHkBesnETzDlp?=
 =?us-ascii?Q?e3Clfk9549h1vP91v8+rTHWQe4wGicHE9JEIS8oBcxVX2QqeF/lwwPpjdPiI?=
 =?us-ascii?Q?bSXtnxbKfHqjqq9xHsDLdyDYbBdzRVTBaZPqS2erhzSj8t82EWkXRFGXz3Aj?=
 =?us-ascii?Q?AAiHq7PetiIsTFDjeTMDqWwEokCDZ5LDuTn6T0xC7jDTfdKJbEk+GpeTMAES?=
 =?us-ascii?Q?rx8iiNWOMcPt0Rv5qjPaVMMO8qkvAsbsc2UpRAzxzgy5AsRxR39AizDMsp/f?=
 =?us-ascii?Q?DIiLOMdNh4aI9Q4aR6FC6WviyvRUKFar2GsC+KU5or2qXQ9kAvLRSBhUh2Xn?=
 =?us-ascii?Q?/z80z7zuWmqsPbmjpIS7UxqI/G6gEofNROADs9CqPDCYPwtqbrJCN9noOFl2?=
 =?us-ascii?Q?/90Vri9OyL/AHBo/6vkh0LyqBCHIJvfu5Sk9U5VszrM0T+8fQdP2kovhfwWI?=
 =?us-ascii?Q?eT6H0+h9IrcQkYJXyPy1FO+HWm8QTwkPDhFoGohjeoJgwVNwpyUT5rwv7ZWe?=
 =?us-ascii?Q?mi0xtW3NWnE9fn1PkCNvo7+0xcw4MjK6iSDoexwxxjp/DH55SJRDyo0ldYpO?=
 =?us-ascii?Q?BFooAqpS/V/+4kJge7NpPMNVrL+6imhiCn1JM/P5xYv8j5s0eUOrc3Jgwp8A?=
 =?us-ascii?Q?J3MnjS1Itt9xDvKbATzENNshuCtKMwznh988Wxx+4oA9zir8fIQtqO1ig/Wg?=
 =?us-ascii?Q?/W0fD7UaCffke/BgybC7xCwrnCO2qRNVj1E77ozot4xBTaMa3wBXg1hxs5cL?=
 =?us-ascii?Q?2HlhH25LcvGAODwtbrpvBIryJOD8NCBb3ZIbpEhbO+kNyCW0kLY6j3MXdeXg?=
 =?us-ascii?Q?ydt9a6LCghhrg8oocFypE6S6I4Y25tyjgP9R3UGgdTTUb5tYBE0HrlJ9GAE7?=
 =?us-ascii?Q?BZsAsQCkTo6A2U3MNh6m6AhINqHgmMh2zEvHdAMhFVppqfD2oCebbEX1X/2i?=
 =?us-ascii?Q?D3i00tbWVEs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9020
X-CodeTwo-MessageID: 98ed17d9-3671-443e-881e-97a9bba93415.20250828123946@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b54ddd41-29ce-42ef-5e74-08dde62ff7af
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024|14060799003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2c2QkdqS2Q0ajVONENUcHJUZVBKYXBSaDRpQmc1c0d1a0l5V1l0NFlFaS9k?=
 =?utf-8?B?UUgzVjRaY1BVbktLN2ljVXZIaWdWUVBId2xPc21oOGFMU3BkRWY3dWNoZy90?=
 =?utf-8?B?OWZ3L2NrRmNRMi85VUN6UUNaZThPVTFlRnptdEd6UkVCVVdXK0dzWktmN3Jw?=
 =?utf-8?B?dHZtSW5EYXFrcnNxd2tRaGdtZ0FHYWxCWVRyMTQ5cXlhOFVQYjRCdVNERUlO?=
 =?utf-8?B?bCtISGxTUmZWOTdYeVZuM0FkRUltbktNQkJCeTc2VStZUEJNVWJEeENtMmpk?=
 =?utf-8?B?VUYzMWhYekRjVmtwNG4vMEtVTFU1NFd1b2dkMktmUVFpNHFGVi8yOUN2VjNW?=
 =?utf-8?B?TXJIbXN4UGlmcXNvZlZnVHRxdUlkKzJhd1pneDJMY1NNY2haQ1Q3T3JFMWhX?=
 =?utf-8?B?TDFmUWtNZm4vU0ZlN2dyWHhvUEM0TVVEb2VHZlA0WngxNnhzdDFzZzk1bjVC?=
 =?utf-8?B?QjR4azZBZUpWNnZRWUpCN2N6Y2l3Mlg4ZjFiQjEydnJtN3BuZldMdm8xWHd1?=
 =?utf-8?B?T1VmaHZwWU1GemtBZVJ3dVRNdUN5OXN2SGxPTjhlVHBQMU1icFpTREwvL0dj?=
 =?utf-8?B?d210TDd5VXV5RzdzaHBiTmVQd1ZrczVNSmpKUjV3M1NDbmx5THF1NjJ3c2t5?=
 =?utf-8?B?ekd2YjlXM3JLdmVQZGY0QjYzalJqVGFEYk9pZ0Y1T3R2QlVKUnpON0pHYUdn?=
 =?utf-8?B?WThkRFA3bGR0T2RONFJTdGZYbHI4NFNqTmR4Y1pickRWRzRJZXJRaFJBaGVx?=
 =?utf-8?B?OU1uYkdoQjloRkwvMTVjVndIY0JSZFlnL2Q5VTRETkR3OW54NW1qcDU1d2ZO?=
 =?utf-8?B?RjZpeml3MkM2bkk1MVNXUEtyWFhpcXFwSVpTUnYvdGxjc29JN2taamlMUEZX?=
 =?utf-8?B?WjR0M0dvL1pIYVlGcUROL3lWdG1NSXEwK1BIb2FzZWpqSDFWUkUyU1JPZWZG?=
 =?utf-8?B?K29ONGovQnJxTjNVUXdUUmJPRkhmRmJhcWxuaVlZYXBmQlRUb292NVlUZ3E5?=
 =?utf-8?B?c3BBVlluUklRditNdFFFekUxV3pLbnI4dmV1ZkdhMzI5blI5cDJmU1prRVM5?=
 =?utf-8?B?dStoSG94bGRIbGNpR3pnNmtXMWlMalBiNjFlY2xKWjN2ci9yRStDUzBGU2RN?=
 =?utf-8?B?OGFVREtmK3NnM0RTWEROT1p1MDBiUXREblYxZVVNaVo4Y2xWV21sUzlXaTFT?=
 =?utf-8?B?SWhoVHJ4ZnhGU0V2dmcrakxDVEdLVFhZWXBwZTh1c3RJUEVBSFdmZ2tUNlJo?=
 =?utf-8?B?ejN0YXV6RDMzREIxSlpYTnEwQkE1bFZVS0JxQXl1MzB0NVd3WkZVVXlETU1J?=
 =?utf-8?B?TFExODVEZURhdTNsWjdSU3Q5R0EvZFN6dC9Vbmc0K2llYTAxVSt2eGhVYmNU?=
 =?utf-8?B?WkMwT0NZT1VLODJBeVQ3dE9GNTE1SUF0V01TKzdNZGhqVC9ZNUtRdnV2UVA3?=
 =?utf-8?B?ekgyUlU1T3FxWVhMem5XK0hsUjU2RzVSeWpPOGVJRmVhT0Q1d3hUckRFNTU1?=
 =?utf-8?B?Rkp5bFRlRFFlNUZuMUpRdGJMQVBtVzcxM1dlVnRSb2VYZEw2UUVqNWJBKzg4?=
 =?utf-8?B?NXhkVE55MGc3ck4wYm9ZbkNGYUw3K3FPUTZyc2FUQlljbWZWR05saXhNUXUx?=
 =?utf-8?B?b2tJL1FGSWVkUldPbFVXQ1hvT3NyWVYvSDZXenZIcm52aTBxYnJOMGg0RUl2?=
 =?utf-8?B?RnBBdDBzZGhqWW1ibTR2Q3RMSzcxazAwc29mY1N1SnVOZWpTRnQ3aTl2WG1p?=
 =?utf-8?B?Y2txV0FVRFdyQzYyY2NFUXVMMEZDbmxTU1dSd25OK1Nsc3Boa2hwZE5Zc01G?=
 =?utf-8?B?aXNuZ2ZpeGQ4ME5MUlY4WDRZVUNBWW8wM1d0YXNVcnYwWTl4TURpT1MrK2ZM?=
 =?utf-8?B?MEkycExPWm90R0pxeTUzNFZQK2Z5eEF0T1QzMFI0MkhBZWwwNzlJdDJIZ0VN?=
 =?utf-8?B?bGsvNEp5Zysrck91bFFmWXJDdTRDTVR5QmVHQ2VOZkw1cXFGSXRSQUp2WFlY?=
 =?utf-8?B?Ny90VmRNZnZGdm5kRG8yOVVabUlHejlDYWtIZ3VNeVN0b1RUNmIzUWpYMysx?=
 =?utf-8?Q?BSYAqw?=
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 12:39:47.6859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9bc819-5b6f-49e5-5c14-08dde62ff95a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 12:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119128

--------------0DS6Mz9a1xtCH9Jsunh3S6ub
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Part of the puzzle maybe, but still don't know how to start a gnome desktop=
.

There's some "glue" missing I guess between x11 or wayland (I support both)=
 and the gnome things, but I can't find what that is.

Is there a "gnome desktop" image recipe out there somewhere that I could us=
e as a reference?

I now just end up with an image that has tons of "gnome" things installed, =
but nothing really gets started and there's no clue as to what should be ru=
nning...

M.

On 28-08-2025 01:24, Markus Volk wrote:
Hi,
packagegroup-gnome-desktop should install enough to eventually run 'gnome-s=
hell' from a login-shell (if using systemd and wayland)
I've seen that gdm is not installed in packagegroup-gnome-desktop, so that =
might be the part of the puzzle that you're missing.

On Wed, Aug 27 2025 at 05:54:54 +00:00:00, Mike Looijmans via lists.openemb=
edded.org <mike.looijmans=3Dtopic.nl@lists.openembedded.org><mailto:mike.lo=
oijmans=3Dtopic.nl@lists.openembedded.org> wrote:
As an alternative to XFCE, I wanted to try and create a Gnome desktop envir=
onment. I ignorantly assumed that "packagegroup-gnome-desktop" (what's in a=
 name) would create some basic desktop, much like packagegroup-xfce-extende=
d does. However, adding that to my image results in all screens remaining b=
lack, even though it creates a 700MB image, it doesn't appear to have a dis=
play manager. What am I missing? Met vriendelijke groet / kind regards, Mik=
e Looijmans


--------------0DS6Mz9a1xtCH9Jsunh3S6ub
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Part of the puzzle maybe, but still
      don't know how to start a gnome desktop.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">There's some &quot;glue&quot; missing I =
guess
      between x11 or wayland (I support both) and the gnome things, but
      I can't find what that is.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Is there a &quot;gnome desktop&quot; ima=
ge recipe
      out there somewhere that I could use as a reference?</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I now just end up with an image that
      has tons of &quot;gnome&quot; things installed, but nothing really ge=
ts
      started and there's no clue as to what should be running... <br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">M.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 28-08-2025 01:24, Markus Volk wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DCEO1T.WIMW7AB6YK7K3@t-online.de"=
>
     =20
      <div id=3D"geary-body" dir=3D"auto">
        <div>Hi,</div>
        <div><span style=3D"white-space: break-spaces;">packagegroup-gnome-=
desktop should</span>&nbsp;install
          enough to eventually run 'gnome-shell' from a login-shell (if
          using systemd and wayland)</div>
        <div>I've seen that gdm is not installed in&nbsp;<span style=3D"whi=
te-space: break-spaces;">packagegroup-gnome-desktop, so that might be the p=
art of the puzzle that you're missing.</span></div>
      </div>
      <div id=3D"geary-quote" dir=3D"auto"><br>
        On Wed, Aug 27 2025 at 05:54:54 +00:00:00, Mike Looijmans via
        lists.openembedded.org
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mike.looijmans=3D=
topic.nl@lists.openembedded.org">&lt;mike.looijmans=3Dtopic.nl@lists.openem=
bedded.org&gt;</a> wrote:<br>
        <blockquote type=3D"cite">
          <div class=3D"plaintext" style=3D"white-space: break-spaces;">As =
an alternative to XFCE, I wanted to try and create a Gnome desktop environm=
ent. I ignorantly assumed that &quot;packagegroup-gnome-desktop&quot; (what=
's in a name) would create some basic desktop, much like packagegroup-xfce-=
extended does.

However, adding that to my image results in all screens remaining black, ev=
en though it creates a 700MB image, it doesn't appear to have a display man=
ager.

What am I missing?
Met vriendelijke groet / kind regards,

Mike Looijmans

</div>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0DS6Mz9a1xtCH9Jsunh3S6ub--

