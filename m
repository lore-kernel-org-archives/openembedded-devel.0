Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07087E91292
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 08:48:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16612.1770281291563423143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 00:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=A9iNWF4H;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.95, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpuaktFi9IMjRZ7ITFPsc02iy/rWyPweTaSZnvyvF6ZJRZ/ZGuNzRkd9brAe+eu/HVvIKSsNzeD2HIYs/bvfOJoTnJlmWniCTdS0A7jx5rr6NjzvNtgUhtTUkaPzhTd4p+3Qo3PyVJNV1jh94ubxswYhzx/NSvCZYfLTKAtkbzYs4YyeoGamDTlhqR1ticFqtPrzsBYtvHjOnArz4vHwzB5l3XNbyi13n99qIZTD5SJyPZIMer8CZDpr0aEcfqKTZtzb2YtCjZGkZyWyq2ZAC5UmJxaR9W2a/bO5injzjbRsBwccjNTmVD84yb1aGlD5IFZ78aTWm9QomkMfjHNOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUOimH7YBa5Q8F0DCDeSadn2KwPteFNP2BrZ4BGMu4U=;
 b=DfYCBF6+95OFpZqDAA3gEe2N9UbHT+gem/2//KrTtSgNwjc92OyylSbrIyWD2impn814sJtspOdzZngIaycSloqAk2oYkjYCQlsynwIVSxJ9S42gjJi/VrQazFHcWU5kM/CsNCP3jPlVFXd7PFZZa7GtpkcIHfLIXy8fcFWoRFqmoQQ99IpKwiqTP05NVm0/K/dMqirGU8JDamY2TXkIw8UxSdt/6oYLqh5uYlRWPk0ckaCzmU3t4M7v6NV5eqcvDJGCvh5rJIRSOilNmkO82TCegybNpgrWrMHc+tidgMoPtO9W3oZhGzLvIYycUyBH+KnE/cCur7/XwSUiEgSvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUOimH7YBa5Q8F0DCDeSadn2KwPteFNP2BrZ4BGMu4U=;
 b=A9iNWF4H4AVZwtUmieIHBDVSSVOQ8CscHjO/GhreL2kTlDq8YIrRO1AaI1rjX90lUGzObI8DCn9dS+GNagnZ/+xmP5cXKMaS89ighqUQ6Q0QfFyxvU0CkqQlLVAkuDGl9FcWB1uNHS41b1LmLjvYcF6pO60XhjxH0/j8ksCbtANz9Os6Tp8rLbpghZn8EjhS5RAEBKcit2eX7TRPpQlf0+Fq60L/zL0BvOl06xtsB1ph+up1apzgOAs6D8XnuXvRxBhlIWQIMlaDwrb+RytXirrWhTkIpmeUMjPkk8rVZd998QKyHxThz+A0kq8let97EtQTa4CI2LoPYZz3kf/ZBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8783.eurprd06.prod.outlook.com (2603:10a6:800:1dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 08:48:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 08:48:06 +0000
Message-ID: <9c9c6b36-6e25-43ac-9a9a-b209ac27ada9@vaisala.com>
Date: Thu, 5 Feb 2026 10:49:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-watchdog: Remove
 obsolete dependencies
To: openembedded-devel@lists.openembedded.org
Cc: tero.kinnunen@vaisala.com, Khem Raj <raj.khem@gmail.com>
References: <188D031AC06B5E57.3547823@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <188D031AC06B5E57.3547823@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0001DC0A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::278) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c03e85-a1ed-4111-038a-08de649347c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDJvNU9WVitOQ2FqU1pGclJrdUJrRTBRbGNxUm1hM1ZlNzVncVJPQlZxTHJh?=
 =?utf-8?B?MkRpTzBGMmE4WWQzbmRFN0F5U2dVaG9CcTNySTFIR2RlQmtrdGRiVUN2dDVR?=
 =?utf-8?B?K2dFdXh1Rk0vbGpaTnUzbWRNT3dxSGJuVnYvSjR2VWRvWUhSRUN4R0J6eXg0?=
 =?utf-8?B?NVJnQU9GR3p1ci85d0cwUlRuM0hFUUNvc0Z2MUJGZEZkWDJDNzgycjlLYVpy?=
 =?utf-8?B?cTM0TDJDeS84UmJuaXNaVENZWnpPZmVSczRQbzV6ZEsrdVlPNmJWMnJKUjhN?=
 =?utf-8?B?N0VLV0h2QWFySzN3bG93QzNHQ2ptNVgxYkhHMS90TGZseFc5aFJiTkd6WWRx?=
 =?utf-8?B?WmcrbUVFUldWRklLVDM0T1VGcXF1bnFVQXdhcVVNbm0zejk1b3VyN0g0ZUpD?=
 =?utf-8?B?dUhWSTd3NTVLb2tzK21DenZwZXdDZ3QwOW9kUCsremZGV1JIa0dmSTV4RnBD?=
 =?utf-8?B?aUNKMUpGZmFXMHU1TTBicU1sUTlMMXlrWERqZG55RzZWTDkxdUJZWXF6N1l0?=
 =?utf-8?B?dG9SSVEzVXhsemxKMUhvbm1qd0kzbDkzdmhwS29qTkt1RnNOQldWMXFGTTda?=
 =?utf-8?B?clk4YXJMd3IvWGZMQ3N5V0dYWWRYOHdHeUJqdWNxbWd3Z1BCMG9nQzlwU2E2?=
 =?utf-8?B?KzJ3Ujh4a0FSTEJlVHUyUnFFYjNnUm5aSVRZckJoLzRXV3lneVFlRlFQamlZ?=
 =?utf-8?B?bnVjTmZXMjR5VnJTYnE2MllYNzFnWXE2QU0wanVJd24ybmlEdG5FUDNkaFdM?=
 =?utf-8?B?RzY1VlhYWmNEQVhnVm5PdlhjRkdmV1NwQ2hFd0Y5cVVmMys5bHNSZERWUG8y?=
 =?utf-8?B?UkxFWEVESCtNSXQzUVdaSmpnWEdvZkNmMUhwTXJNdEk4S3U4M0l6T250Q3U5?=
 =?utf-8?B?YmhtMnZ1cWhadHlwRmNXeUdmN0pKTGo4YkZkZDRxTXdzMnJ1MENncWliN3pP?=
 =?utf-8?B?YkRmTXRTMFN1dGxHbG13WUM5Q1lHNnY3aGdiNHl6Zkdtekg0NlI1bG9zdXFr?=
 =?utf-8?B?VUFQL3lVZ216UDRJYWpSakdMc2dGTU03OFRraW1IUVFUVEhkZ1FwQ2xDZnJi?=
 =?utf-8?B?Q3F2YXBpa2svVm94VVR0c2JkdDlvMHFjUUg3NEZnWkxJRStoVXFqT0o1QVRs?=
 =?utf-8?B?aXhIbWxwMEVYbEpIbERvcDR5WnNUZXNlZUptU3JKbTMzelh5RmMwbnJSaDhL?=
 =?utf-8?B?QkwwQ3huUXJNT0NFbzU2R2tJZk9ySVhmV29yd21PdUdkNEhUUS9CWk56S1ls?=
 =?utf-8?B?ZnF6MlBJZXhaYlRsOFdIalpyVGZvQUlxUTg3Q3hDd0hVZTRVMXJUV3RSVXN2?=
 =?utf-8?B?bk9EOHp0S0Izd0dpMUExS0U4eGVxcXBEM1lhSWVIeUlXOVZjcEFNUnRkQWdv?=
 =?utf-8?B?YStGOGN6T1ZpbzFCZHNQeEpvVkN0d2pGWWdSaEQyb1NMRW9tQk96ZSt5VEtU?=
 =?utf-8?B?bytUSndkajl3WHphY3VZZWZ1ZlpNN05odDdFTE9XeEJncFdFMTc0ZSs3L2FV?=
 =?utf-8?B?anR2N1U5OXpDQTYwUUFpNXlCZGtqU25WM1pqRUxkbDVrNjFSai9ENkoyNm4v?=
 =?utf-8?B?U0hiZzcwRDByNG5VWDAyNkYxV2hlMjhxU3lOcXVLMzRDVHJWR3JyZ1dmdTUy?=
 =?utf-8?B?US9UcDFUU0o3K2w4eWhVcHl3aGlYajI0RkVOenJSeXlkMUtiSkJFN1ZWaXph?=
 =?utf-8?B?ZnA0YmpJTU10YTN2d2tOeDlzV3dHejUvYWJXdTBuVCtWVUZOTTJLbkZHMGJq?=
 =?utf-8?B?MWZYSng3a2JrVnMrRDJIQzIyQ01pVmdhQkdtM3NDTUdpT2R6M1VsMy9ETzE3?=
 =?utf-8?B?Y3piOWI3bWhBUEVsZGN2Y29QZ0ZkMm9oRlorL1NoVnd4bzZCNzhSa0xKTk1Q?=
 =?utf-8?B?Q2sveE8xdVl5dy9JNjBGM2M1eTNSSG9hTVFSZ29aM0xHcjBHU3NCeHhzUWVr?=
 =?utf-8?B?ditsZThNY2ZNNXhNMHp5aU5rU3JyNXpDNS81OTJISDh4SmNiajNVWmxDN0k4?=
 =?utf-8?B?MXpySVlncE5XRmtkZ09hRWx2UzIyRkVaTHJBczhkZ2dmRFZXMjhxQkMvNzdB?=
 =?utf-8?Q?ozxACE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzRTT3JjaklEOGJxcjZIMHNNU2NjZllzM0ZQcTdQU1IxNWNkaFdHYk9MRW1P?=
 =?utf-8?B?ZlNQRWdLZjAxLzZodUxQbkpRVkxMSjZWbVRkcThwQ21XemJQOFB2WXl6aTJB?=
 =?utf-8?B?VExBMElCcEgyWFV6THlaL3hGYW5JUm5CcUNIb2trd2tlbE1yMkR5U3YwL1Vv?=
 =?utf-8?B?bmljM3BQS1pUbWlrYm9CTitEWmgwaThKRUNuaXcvR1pzdzVQL0crMUlialAw?=
 =?utf-8?B?Y2ZDQkNUbW4vZ2hSVXMvMUNKejRTRnI3Uy9jTTQydXJMMG0yN3FXd2tObDRa?=
 =?utf-8?B?R1ZaQ1U0RHdGbW81ZnM1TTE3YU12dU5rVGFkV2prcUd6TjZPQnh5dTV5dlRl?=
 =?utf-8?B?TkRKQVBjWERGZThVNUpIYTB0STlvZ0hLcWNPdlBjRGNtc0w0MGFJZ3Bzc2hX?=
 =?utf-8?B?dWlwVXM2N2Z6Q0ZUVXIrcTlOc3lBWWJwV3Yvb1VVRkNXUlo3YWs1OHAydjMv?=
 =?utf-8?B?TmRCYi9QdC9pZjRIaXZIdGVlV2R2TVhlQWg5Sm5uYmdOazFWaVR5ZEF4WVBB?=
 =?utf-8?B?MXlKemtHMjlyd0NlbGxpWWs5NUFqUGJEa1pHb3NESHE3SVlFNGJFY3lxaUVD?=
 =?utf-8?B?L1l2WUZNejB1OWdRQ1FyWUszVk1EOWxnazNxVUdXK2FjSFBrREw3ZUljWDNH?=
 =?utf-8?B?QzJjaGF4R2NKM3NuamhwT09GVnRpSXNXQ2lCTU0vS3JWdjVGRlc0ejluc2Mw?=
 =?utf-8?B?Z2dDNSs1MTc0b1p2RXBzalVIZUFQMTgyOCsyZUpMZWIwRGJuRW92VFhZMGl3?=
 =?utf-8?B?L2VlamdnclNTSVVYUUdEV1RkZFVvaU1BcUtFU2tOd2N5OE5ZeXMrK3BKVkZk?=
 =?utf-8?B?UjhuaDc0ZkpmZHFueExHeDR2aFovT3RIY095ZGJNbUQ4Y3VRMVFPeWJKUnFM?=
 =?utf-8?B?ekZ1bGFPRlFmcUVsWENvRzh1S2tWcVlqSDVkdkhFSjNNMlVOYTNVYzNUK1k4?=
 =?utf-8?B?Sm4vMW1TS2V0TW9mNU5TUHNxaEZyVXB1WkJMU1RUWmwzc3V1WDhacUVCMFJM?=
 =?utf-8?B?NWZ2b3FaK3RlNnMza25KQmVKZGdYKzRNOVlGU1IzS3hEcDJDUkYzOGltc0V4?=
 =?utf-8?B?YXJUeksvdm5WOG40VzdvamU3L3VuRnRVU0V0MndpTFYydGFLM1pISFdBSVdX?=
 =?utf-8?B?VlZwa0pRdzAvMkYxOXdqZTh6QnZQSURtb0ltYXB6WTJma0IrOGtZY2xKRTZm?=
 =?utf-8?B?T3p4WHVreC9Pd0NUQWtUM3FQUTA1K25FTDR2Uy9pUmVWNjYvM0hpVkxvVGQ0?=
 =?utf-8?B?MmF0NFpXK1JlbmxWcE5lNTd5QzhkQkw4aXkzTGt0dVNodWZVTUVURlpvcVlJ?=
 =?utf-8?B?NmJWcWMrdnlMalllYUFLZzZBUFhQTkd2d2lwYXRpRXY4VnJZdVdnckFRYlB4?=
 =?utf-8?B?V2dJbzJoQkwyVmZWdU9BMWVlYjFLd0Q3OUViZlNhMHp6T1VHeksxOHU1Wm9C?=
 =?utf-8?B?V1B3aU1NbmgxQm9RUGplVFh2UGt3aVNaSHVVNzNaV3l3azlSSThzY2ZyT2dx?=
 =?utf-8?B?NHlmM1pacDVBbEZaS0F4dHBxc1lPcFY1eG5jRmNENUh0TlZReVEvNVVJalZH?=
 =?utf-8?B?KzNDRGl1cW9RVlg5bWVjb2dPTE5BYm9ieHRaTWdTcGdneXQrVUxPZ3ZidUtp?=
 =?utf-8?B?VG9LdEFzUHE1SkJXZlRkZExDQ3FWN01ROGE1Z1hrdTVoR1hDNW9rc3QvTEU0?=
 =?utf-8?B?TTZxQnJ2U1BHYmNXUWlNK0FKb01ENGU1R2c1VTJKK3FucUpvMW5FcmFKdnho?=
 =?utf-8?B?Slk2WWVOeG5MWFZNSWRDZytaNjA4L1NRd2NLa1FFTGlLK2wwV25mNXZtUzE5?=
 =?utf-8?B?WHhkMGFsK2oyNSt3UG9WLzhWditpcDZObTZTNkMxUlFHY01pa1JoNDIrc2JY?=
 =?utf-8?B?UXNETmM5WWMxbW9nQXFjZ3RWZ1lTN2hOMTNlYTFnbUU3T1M0K0N4NnpaMzRF?=
 =?utf-8?B?K0NrZnV6RUhrVDJpS2dxNTgzaWc5SWxLaW5LWDhoSCsvSHVBMzlmVWpvZ3lT?=
 =?utf-8?B?Vk9DV3JjT3NzNXNVdFB0RUlaM2cyR3RaMVJuazltNTR5cHN5VW1SUGZQTWN5?=
 =?utf-8?B?d2VYQ3JwWjhZQ2UxODNSeUNMdkxoOTFSVUR3QUNmdm84OGpYOWtrc0dmaW11?=
 =?utf-8?B?TW5xV0lKRHhJdkNpMjYyd2xUZFR0a2xXeTM3aVkxYlpTeFQvV3o0KzdBSEZM?=
 =?utf-8?B?OUZEMHh6VnhRc2sxSVBaVUlaS042TGh3NTdibDk2VEhOZ0d4QmRkTEFUQkFw?=
 =?utf-8?B?d2dKR0dGd25hcnl2OU1oSzV3ODEvcDlNWEJoamgzQVdwZFM1UEp6SVF0aE9y?=
 =?utf-8?B?OVo5d3l6bDFDcVRJeGI2S2xHeDZRcERjbTVsVE9GbnF5b2VWOEVJRlZndTB6?=
 =?utf-8?Q?6FBvHAacdLMm7of4=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c03e85-a1ed-4111-038a-08de649347c4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:48:06.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNGJaoj6t0kc70bxY3shxIKLxMCEnWmWWV7mfUaZ0LANdg0KveDy1bli/qoirEtb/TOSDjJ/sQ2sB4xBq751qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8783
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 08:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124199

What the commit message failed to mention, is that this commit removes the unnecessary runtime dependency to package which has LGPL3.0+ license: https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python3-argh_0.31.2.bb?h=scarthgap#n13 which we believe is a relevant fix also for the LTS Scarthgap branch.
-Niko

On 1/22/26 11:20 AM, Niko Mauno via lists.openembedded.org wrote:
> From: Tero Kinnunen <tero.kinnunen@vaisala.com>
> 
> Python watchdog has removed all dependencies except optional `pyyaml`
> dependency for `watchmedo` utility, like follows [1]:
> 
> * pathtools dependency was removed in 1.0.0
> * python-argh dependency removed in 2.1.6
> * requests was never a dependency
> * pyyaml only needed for extras (`watchmedo`) and may not be strictly necessary
> 
> [1] https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst
> 
> Signed-off-by: Tero Kinnunen <tero.kinnunen@vaisala.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-devtools/python/python3-watchdog_4.0.0.bb    | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> index 9e36264d62..a272e25bda 100644
> --- a/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-watchdog_4.0.0.bb
> @@ -1,5 +1,4 @@
>   SUMMARY = "Filesystem events monitoring"
> -DEPENDS = "python3-argh"
>   
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> @@ -8,11 +7,7 @@ SRC_URI[sha256sum] = "e3e7065cbdabe6183ab82199d7a4f6b3ba0a438c5a512a68559846ccb7
>   
>   inherit pypi setuptools3
>   
> -RDEPENDS:${PN} = " \
> -    python3-argh \
> -    python3-pathtools3 \
> -    python3-pyyaml \
> -    python3-requests \
> -"
> +PACKAGECONFIG ??= "watchmedo"
> +PACKAGECONFIG[watchmedo] = ",,,python3-pyyaml"
>   
>   BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123733): https://lists.openembedded.org/g/openembedded-devel/message/123733
> Mute This Topic: https://lists.openembedded.org/mt/117397268/3618471
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [niko.mauno@vaisala.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


