Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924BDC7EE30
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:12:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.4])
 by mx.groups.io with SMTP id smtpd.web10.15526.1750669955486388096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OR+pmiUi;
 spf=pass (domain: axis.com, ip: 52.101.65.4, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOmYiIjqRyrmAjxzn5GjR0iANGC+wc5IqzdHvAwA4iEHwOgEPRKcnxeG/4pjSVISTazgT4Ztg3s9jR+A+9Msad4LPunaquDdLFcijH20fJUnf/PiImGAaCC+px0nVgXJ5W4m4uxlJCFO1AsC4uCdmzWFn+U2Y9LUg1qxzJAMMO+fRZZCOwGgnCCX+wZLX/b1PjhenD1EQ8oMx3hxNcQGs9kMk/L7MDM9QnPIf51gAg57C5uQiyZVgpKbtZkDAE/P77z9vOnmWN0mpllZhFAL5aDyFpurJstPTeakNrY0skni6vO++ueDWJVll/DDtVdSuny/muFsVBD+VSRZwFZxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqhtayOuQs/vgWksz4J6ATYYyI2930R2BkmGl9JaRyk=;
 b=kGSJa2gIBOtqlhn7EvzfZFADcX5oZc0/4QIVxrj6WEXdbOZjkwudcEV5+VDaSJRdGM/0edkGE8lsemDIqFUhI3tLnzfDstx8BI6Bf9N5gDp6sghML1F3bH76pAxRWXxOjV7T/UYdBPz+0a/sB9Z1/WXREiHzq/Isji2bVunhUhDczuUE/BwabwfWdJ6gWQSrV9DiSEnR0R5b63i4KP4b67DMCZvs3Sxix0TrrjD4z7e4I4LgDWSfZUZdQt6Q81mx5xBUcnxLEgu009m2iZTT3gNIaHLHs5p0kLB5w7ERPR1gb3ZriNaCZbWWHj1oHfYIO7D4+Lm9vZYwRXuFZT+z3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqhtayOuQs/vgWksz4J6ATYYyI2930R2BkmGl9JaRyk=;
 b=OR+pmiUiwSDIlEb4rUQXoK5biDazFnbQfEPbyJzqX00dnIDOU0aVURPYdBrSRlVAV/cXKbHAX3BMF9oA62JEaqIKZS3SaHTX4dyXTItHzPV5ADwaII8eDsYSyaEMlrJqf2/BZ5O6qq4TAte/VQqgpxpzJIqdulNJwsqsPO7jysw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by DB4PR02MB8702.eurprd02.prod.outlook.com (2603:10a6:10:382::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 09:12:32 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.8857.022; Mon, 23 Jun 2025
 09:12:32 +0000
Message-ID: <f655ada2-c3a3-45dd-80df-4601d7fa8147@axis.com>
Date: Mon, 23 Jun 2025 11:12:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] influxdb: remove S in recipes that fetch
 from git via setting BB_GIT_DEFAULT_DESTSUFFIX
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250621094915.1474527-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <20250621094915.1474527-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::17) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|DB4PR02MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9d9e9f-7104-4bc2-032b-08ddb2361594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXdlVTU4cS9maHl5OERvRlloTWJKbDNDNjdzcEROQXI4MGI5WkdpT2ZJeUEy?=
 =?utf-8?B?ZVNQQ1JzLzVjcUtaVHhmVzFDQSthWWNkS1h0empYcm43YzAwcXRYYm9Dd2xk?=
 =?utf-8?B?VmgwUzhBZVBERkZkZlZMbjhCaE0yWnFwa3MvcUx6UlJabzNHRUw2V0RYWUN2?=
 =?utf-8?B?LzNSV3N3ZHJ1N0RvU1NTRVRiRzA0amlrVGVIQ0dQTGhNL3NHTE5qeXhMRWo3?=
 =?utf-8?B?WmtDQ3pSK3JTRjd6eWkzRWdROFB6SElIU05oQjVRZGd1Y2p2bXJ5c2U5TXg3?=
 =?utf-8?B?eWJVekFiTVBuUHc3ZDJxRXlvUzlqV1NpTUFvTzhjRDhseWlsM1RNR1NGMUNy?=
 =?utf-8?B?eGs4NnFvbkZMTElFaWFIWC90MmlzREt3cml5aXBaU1M5SkVaemV5MU5JRGc1?=
 =?utf-8?B?TUFFNTdkbDNsZUh1WFNRRjE4dkFlRzZUOUZBWXhubmkvdDhIbHhPVm1Sc1Fi?=
 =?utf-8?B?SEdyem4vVi9VaXRDM3oxSDdYdUNvNWM3eU5xb3p5cGM4UmlVMDY3U1c1dllv?=
 =?utf-8?B?TUFCOWU2Nys3VVlVVmYvNFk5WGYyaW5aSHh0d3JxZ3kzV25tdFlZQmw3VDRy?=
 =?utf-8?B?QUsxOXhKOWpaSmZoTTdLNlRxcVBXK0ZpbGtMU2prYm40ZjIvTHZoUGJIb25Y?=
 =?utf-8?B?QWlsZDd4OEprR0QwOU9WclgzK3ZSN29KRUEzZnZVVzY2czlCL1g0V2F3VlhC?=
 =?utf-8?B?aTRFS2JLSEZ5Y292UmVaQm0wT3hrVDI2RHdGTXBMNXk0UTVHb0RZMC9NUTNl?=
 =?utf-8?B?ckhMa3BBaWxhN0lWYU1zK1RHLzhXNnhlVVVSN3NDeXhzVVhMQ1FUeDNPZWtr?=
 =?utf-8?B?L0ZVT2d5dS8wUG9hUVBxK3dpK0djekZTTHpsZDBVYjFxWnFxeHAxWHI3Yld6?=
 =?utf-8?B?ak1veG9jeDNmNnduQzlvYkhhY3g5Q2xGMFRNanBxRlZZSGIvVS9UUlA4N2Rp?=
 =?utf-8?B?T3pEdG1yT2RFVjEwVmUvZnFoYUhwUWliTEVOMTMxZGJLS0dwSnB6SVAycGlK?=
 =?utf-8?B?UWtNWWF5dGhYaU9rOVFTRjhiWDFXbDM5aWlBZ1FxNjVsT3lKMjhzVUVCaEtD?=
 =?utf-8?B?Tlg3TmptaVo4eFNpZTY4QkR4NHR3Vy9nZnpvbklOcTkyMUhQTkxPWC9FZ1FP?=
 =?utf-8?B?MnFTa1ZlWVpKMnEzaTk4UitUb3FmOEFXVG1sOGNlVGx3d25tdm9pQVUrUkc1?=
 =?utf-8?B?YUtBeks5L1hPLzUwckU4dFR0RUwrUlpDamxBMkFTN1Nwa3hZU3ArZWhSODVn?=
 =?utf-8?B?eURGdm0xeHcvclNWaEJQKzdralQ4V3JSZktieVRzYnVhU3oxV1pvMzg1aTNx?=
 =?utf-8?B?eUhRNWwyMW1xRmdqMDhMajNXN0ZDVWFJSVJEczZ4UUVrWFRRaWZ1bUJRSEZX?=
 =?utf-8?B?bDZSeDBzdk9jOTdnNmJHd0JBc3ByVVR6NExPWFdLRzJueUVob3c2eUNZOFh1?=
 =?utf-8?B?aU02NURXM3g0UHJsY0xHV2ZtWElXWTVpTVM5OVNxRmQxYVREdk9JQkJKOVFG?=
 =?utf-8?B?Q0pqTWh2Q20wL3F2Uk1vMjMxb3d1VUF3Q3JlMWJzcnZna016TW5NUVNiZmZq?=
 =?utf-8?B?NEpMQkRRZzB5UnpiRFFqWlpZMWpBUStsaTJGS1RHaGVLT1dlbmRpY3hPZGpt?=
 =?utf-8?B?N2h0RTR4MDY1RnVTVU1RSVQ2TnNGU3RFZmZZTE5TYkd5eFJUWXBVR2diSW5Z?=
 =?utf-8?B?NDhpV0MwWkNmdTZUUTBJUmFmWkQ2c2pMdHFmdmdFREtzdnQ0aEttTlpnanFi?=
 =?utf-8?B?cjlTUUlxM25NQzhuMld6R0laU2JLWjRCYU1wQ0c5YjV4TU5aY09XcWFhaTNo?=
 =?utf-8?B?ZHI1dEVxcDRuOWVBV3FLWkd1cnVHbVNJRjlxOW8wOExnMUgxUlh6RENoL2Rx?=
 =?utf-8?B?bElPMFAwY24xa1Y0bWVtbHpqSUJZMDc2MCtSN201K2ZPQS95VlRMYTd3Q1pE?=
 =?utf-8?Q?YIb3lobRrcU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHovTUNlcE5pWEdBNVYxcVQwcjU5QnNXVUo2ZXV3TDUzdkJSdjBZSlo5WVdZ?=
 =?utf-8?B?djVFOUYxejFwZVVDcklML3BFRnRtNmFDTmFJVGd0NDdMKy96RmF5NnBydTZ3?=
 =?utf-8?B?cUlDSitjcEc0SmcrQkpEZUE5NWc4d2pubjJRRXFoZCtoVTJnZG5HWEtBdStV?=
 =?utf-8?B?M1drZHpHcU1qRFRmYnFKTnBwaGtJVXU3alBtQWk5M3p0RHlDaUtkQlR3TUZK?=
 =?utf-8?B?b1kwalJ6S210NG1lZ2VHYW1jKzdzWlZQYUljSzFYeFdpbk1kWEFOakdub0w0?=
 =?utf-8?B?bVpnaHVjbkV2Rk1QNU5SOEwzbUNNMGZORERhRFVjNm9lR2lOVEZNd3RUOFVa?=
 =?utf-8?B?eVdxcGVGbWlIOFNrbXNwVjhSWTV5TVJ4UjFnNFJRYzFkUkZLakhqUy9tRW1q?=
 =?utf-8?B?cWdGWVlDVGFFblh2c0VxWlNoNEpma0tEYmFubkpGODFhTFFyMnRCZUJZKzVp?=
 =?utf-8?B?RVlMcjAycjc1dUdlQ3NCKzJPZjVBMUFNaWZYMzJQdzZtRFZBb0FlQVNkVDNY?=
 =?utf-8?B?Q0hJM2VWeEdIS09uNDVYK0dUV2RlbHU4UHNlZGVFMUFqNG84MWI0ODhMQlkz?=
 =?utf-8?B?Y3lyUE5UYUN3ZFZKR2pGRVpDSTY5UHFJZWZzWUhuWTAxcGtyQUZXNVVVZWVq?=
 =?utf-8?B?aENOSlRLZS9ka0QvNzY2aXVmQ1BwZzFJMWFBM1JkZTNEWGE4WitPZm9LeDRp?=
 =?utf-8?B?V2JLeDQ0U0lKckgxbzMvVEVCcnVQaDNjb1p4cW1ZRmR6cmxsaWRTakVwbDNa?=
 =?utf-8?B?QWc3RUNUZkd1YkVuSDNjc09waHc0NEQyNk44elRBUG1OWldFaUV0a05qaUlk?=
 =?utf-8?B?Yzg2VEpBZlhBTkJ1TUw5L1NsemYvWE9qczdGa1JQNWp4d2JpOWY3QXNBaFdR?=
 =?utf-8?B?dkRlRmZ3L3VCWXF3TE8wbmp6Q3FrR1VZYnhUTUZETG81Sml0K2dkZzJiVC9U?=
 =?utf-8?B?ZjY0aTB0NitzR2dqZGNGSDZRbVNjWGR6Q2dYOXp6NXArOHZpWHlpMGFTOWRJ?=
 =?utf-8?B?MHhYU3d0eFk2RG5pZTkyOXNYMDBEMjhPUVN2dGVLZmxMYkhoeDQ2VEFoc294?=
 =?utf-8?B?RWNjdTlWYUttR0NyTUJ2Q1Brc1lBeG1nb1J5cEpwVjNqNXdZTHp6REIrTnZk?=
 =?utf-8?B?UWJpckszcXVIUmpraVFtL1lDemlaTlcra0o3bTVhVythQjVwQ1VLZis5RU13?=
 =?utf-8?B?aDlyL1pVNkJNV2RzdFZIZFFYTG5NZ2VkTUs0eElYdHdEQVhSdENWc2JPdlVt?=
 =?utf-8?B?UlhYeEpVVEZsQTcyK21LK3hkaThVTzZWY1RRcEh4d3ovWUdMSlJxM0F2SHdt?=
 =?utf-8?B?ZmE0WktFckZNSmpUMm9yWFBrUWlDSHVrSGdvd1hZYUdkbGdzelE3YUJsOU5P?=
 =?utf-8?B?cDMwcUxONjNjQWNBZFFZQWt1SmVLQ0tYRk9pa2UzVk11M3hnTnFjVitKYkQw?=
 =?utf-8?B?dTZNTjVDOHZtK3VSY1lqU2hNbHYxVjZocDdhRnVSUVVNdkFVMzJpNDBpR2ly?=
 =?utf-8?B?ZU4xMnJqNnVXbjIvS2hyVSt5NjBxNHZqV3R1bEZmT3RIZmZobWRGeGNwcWpw?=
 =?utf-8?B?VFBlY2dRejQwalhVeWJ4UFlzYng4WkVEWjdqQ3kzeFZIOVo4WTFmWEdmUUhu?=
 =?utf-8?B?ZjBwL3dZMWVLVDhGQXNlb3gxSUtQVEQwcFNYR0gyN3BYYllhaE5HdFJuZUVP?=
 =?utf-8?B?UXZoOWxqT2hIRXArU1dVSmhLNlo3VEtqOXhLOS92VWl5UWJsSHJLWXBBODky?=
 =?utf-8?B?MldUNnBmWmdGUTc5dTYrSlRyV0kwRDliL1l5RjZxRG9jSWlIWVZ3RkxQZmow?=
 =?utf-8?B?RjZHNGxHV2o5ejQwQnhXczhVMmpKVUZaeC92MjdZdlV0blpBUk5HNXlOeDNv?=
 =?utf-8?B?VnNHRzZ2Z0FjWDdKazM5YjNpUjVrTGk2Ty9tSW1DUGFnTkpkQjJIbFhUU1dX?=
 =?utf-8?B?eTdZVlhYMkY4blVXSlhLOXVNK1h4L0gwbjVhay8yYTNUZCtVRGNDNFg3WjlW?=
 =?utf-8?B?RG5DcFNISUdQUWRNMm9DWSt5akttQ1pWTXNVcHhtejA2WHZxdjdGSWdLTEt5?=
 =?utf-8?B?RlV6SlpiYmFCYTIxSmRvakY2UnpnVjBHblhLNWQzTElMY3ByMTkxVHUvbmhl?=
 =?utf-8?Q?56nynp0O4OlLIyPh+CsHlX3HV?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9d9e9f-7104-4bc2-032b-08ddb2361594
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:12:32.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJT4YcEILbZPuqnmyqc0ldIhM1xyVfctyFoGb2sqwyALcJIzgAl28El46LyTMcqyUA6Utb5Y1BdvLHbDQfjHfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8702
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118065



On 21/06/2025 11:49, Alper Ak via lists.openembedded.org wrote:
> Removing all the S = ${WORKDIR}/git assignments works because BB_GIT_DEFAULT_DESTSUFFIX
> is set to match S from bitbake.conf (which itself is set to match typical tarball
> releases).
Oh, I should have used GO_SRCURI_DESTSUFFIX instead as in crucible even 
though
the explicit value kind of made sense at the moment together with the patch
git URIs below.

Christian


