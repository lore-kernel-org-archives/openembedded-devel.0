Return-Path: <jhofstee@victronenergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1070C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:16:14 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.77])
 by mx.groups.io with SMTP id smtpd.web11.17808.1752657366037268215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@victronenergy.com header.s=selector2 header.b=MSa7/HBO;
 spf=pass (domain: victronenergy.com, ip: 52.101.66.77, mailfrom: jhofstee@victronenergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouXn8XYpq+ZXtntFPiY++iRk/yf/bXv8wpe0L5+Ms01XXHRxyVsBR5dHpC8zg/52APR9rMPuLjWg2kpxNRISOLWCiNuxHUPkP5vX/79HwQh8vR4Y8wnHWZMtWpjs175EsEt7Xkmd6cyd1uuEQJKGre6AvEsQyB8uU8yRuLtX+gwu0Xi0AjO+SwZhQuevX8lrL6fI3ck7cfuODVnL4wjSWCrdlwLkimFbJ7x6CmywDrJb1QdLcjCnhDMMNkoViZhRQtsYMwPetonGufPXs6Y07FZzB/nPrxqdeUEngMV6J+v913Ra4zjbyntLgQYDOwQ/5BtWC1aHA3k4PFYdz5DDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APLF5u/ee2RQrmdUlmLJXU/aHIVkuJ6VZQV4s/StNxc=;
 b=KCP7gw/zcpqzSXdwKEqNmN2BzcUI+ZCApMPl69H55taAbBn3pdOnNlfcs1xbbhz/2ZgKpX054E4ZSKIMepEw8eWk2YkgPcYYeKB5Vh1lyKkGYoj4NbWNAMRG+bpv5ATfRXMaiC/ISHih4cxMqunGPcEOFyEC/Jg6xVNl0EJ54enP675cykpw3OdGkjoqRcRM+usM6YKdMVmjyecAnVy3y6HW0J2hxlAjI8NYW5Z0UX2532nXtlksfvKzbeIeIi+E3d0ulEy0U1e18Nqvo/TxwiEDo+EzXhHLpJL7LvUEj8YClSN3k5ECEEqkW83KRuf5O/6z5+p0MMYOtZtyMF9DwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=victronenergy.com; dmarc=pass action=none
 header.from=victronenergy.com; dkim=pass header.d=victronenergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APLF5u/ee2RQrmdUlmLJXU/aHIVkuJ6VZQV4s/StNxc=;
 b=MSa7/HBOE/BSbFKVRv0IUOSB/HNT7bROJlI1y+iuHqe9tqhgslKzMuvvW2gU0ZNwcaBjLRVGjPrO/UGfAuqXnlfprppnHCegnEQ+YvC9LyBw12r/ZLW9WIZdgHVJ6iAu0mLNLNzjhX7VEI7Jd6kggocoEh/TPT9q5OU/4xDjshE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=victronenergy.com;
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com (2603:10a6:10:30e::14)
 by AMBPR07MB10645.eurprd07.prod.outlook.com (2603:10a6:20b:6ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 09:16:02 +0000
Received: from DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6]) by DB9PR07MB8679.eurprd07.prod.outlook.com
 ([fe80::5b79:28d3:a16b:4fd6%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 09:16:02 +0000
Message-ID: <78b2e967-97a1-4f99-9243-82fbfcaf1cd3@victronenergy.com>
Date: Wed, 16 Jul 2025 11:16:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] tailscale: add initial recipe for
 v1.84.3
To: Jeroen Hofstee <jeroen@myspectrum.nl>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>, Mark Bath <mark@baggywrinkle.co.uk>
References: <20250714202915.902593-1-jeroen@myspectrum.nl>
 <CAMKF1srjbOv7ysURM-DmArgCWWsTUeMGbn9aMZmmtR0LEPOTJg@mail.gmail.com>
 <12cb4783-4aee-420a-85b9-a29b43fb737a@myspectrum.nl>
Content-Language: en-US
From: Jeroen Hofstee <jhofstee@victronenergy.com>
In-Reply-To: <12cb4783-4aee-420a-85b9-a29b43fb737a@myspectrum.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::9) To DB9PR07MB8679.eurprd07.prod.outlook.com
 (2603:10a6:10:30e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR07MB8679:EE_|AMBPR07MB10645:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b857b5-b6fc-4703-0c2d-08ddc44962a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aU43d21BeEgva0ZNYWZ4eXd6cXQ1NjZ6ZElLcUVBcWtUdWUvK2ZoQnJlWnNu?=
 =?utf-8?B?SnVRRS9QcnM2bG9PVDh1d1poRGZZdW9IWkorR2Z3MEVpZCs5Z0lvK0pjK3JB?=
 =?utf-8?B?M3N5UENaV3kxZ3hKZkV0d1d1aHIwUE5MU2E4K1VyMVgreDUwMGZFZEhDd3pY?=
 =?utf-8?B?dENoTVl1SlF5Y280N0hTRlhzV2ZuaFkvc3QzMEpvYVVNQW83RE8rNmUyL3I0?=
 =?utf-8?B?enR0bWU0WXFkMzVuN1U3ZUhOQmc4TFVMRkw2L0xqTUVEU2FqTHE5d052aXNt?=
 =?utf-8?B?NzBBTm1zc3JmcjFNc0VYVUloT0lUcjJxdTlLeGREZTlnRjQ4M0xUNXppaTk0?=
 =?utf-8?B?L0lRaVFnTTFCWGIxLzRJM0s4MCtMZmNPckV1am13SVBZWmtUd3BNTUJIZDBk?=
 =?utf-8?B?VzJqSS9RbGdKa2VGOXBCUzNVaUNmYWdUQ2pVV1RmdE1McjdhOE9wT2ZpKzZL?=
 =?utf-8?B?RHJnaWtTb2hTeXBUZngrQm95clpwbzVMYkIvOUJ2WHJyeGJIclVOL0g3VkZ5?=
 =?utf-8?B?WXlja1YrbGFHdmt1Qk9FYSsva1o1QzN6dFo0djk4ZjRhc0pzSTBaYitvRmor?=
 =?utf-8?B?eG9sRjJ5bE13YmxVdng1V3JuSTdpRzZqcmdXZCtLY0pnRzlCNk1jVUwvc0xN?=
 =?utf-8?B?RzZVeWVBZFBOWDlid2M4TGtQemloSmNCWkxvWjFtMGN3Zmp2cStnR3B0R2Zw?=
 =?utf-8?B?YmpVRUF5Zks5STVDRkgrTHpwZ0V1WktWRVYyQnladkd4Ynl5V0VJd2pGUSt0?=
 =?utf-8?B?allzU29PVzNMSTM0REtMK1F1cHNqWVpqZ0xWZ1Jtc1NlS1BibXNuVXVQcFEy?=
 =?utf-8?B?djZOcHo5TDVubVlhQXpadk1pNDI1ZU8vSTFQVGd2YUMzd0MzWjI4MVlpZmRN?=
 =?utf-8?B?Z0dwdlpOdThjTExabGlRckZmd3FyRWk0RFNsQmtXYmNXNVdqMjhXN1M1bHJO?=
 =?utf-8?B?Y3FLRGp4UlJEMlkxM1pJR20rK2xkYW81RmpCcEgwc2VCMytuTktyb1I2ZnhJ?=
 =?utf-8?B?M2gvTVVlSDd6eGdaYSt5NW1zRFNBeHBIajRsY3VyL2tPRGdUK0NQcFZaUkFK?=
 =?utf-8?B?WWZWd1dkZmRCOHlMV2ZudWZ5TTR2aW0yVHQxK0xQQmttQ0pnMy9XRXZFdzR4?=
 =?utf-8?B?NGl2cFZhdVI4R216bGlGWGs1S1Z3WkhER3pLZ0pqdDNVdk9pNUpSTUcxTktT?=
 =?utf-8?B?T3g3N3ZRMjBLdzk4S3B2dk9sYUhCdHNXd0FSNll3ZG12TFlhanRqS3hMSC9w?=
 =?utf-8?B?YVNwTXdJMHVwRFZ0R2RsZEpwb0dBcUhTMXRYRy84UFpYYVJ4cGIxSHllZmRk?=
 =?utf-8?B?cFBIN2wyaE5XZUNVVVpaU3VLSEpwckFRWGNtcWVZL3lXTVhsdm9HTGVTZEly?=
 =?utf-8?B?MDI0Q1grZ2gva0FQV1dxVlF5MjBXOEE4NGFJdXNmZUoyY0tpZ2srUVNwTDVl?=
 =?utf-8?B?blRnN0tkMjAxNk9qMW5uMnhYOHBYV0tDWG10NVN2SU1yZFd4MXpZNzNtb0pV?=
 =?utf-8?B?ZFkzK3ROSWtZRTJ1UG9UZkVXNFhTaU83Szg4TkJWalpySlBBdHYrV2JCcDE4?=
 =?utf-8?B?SzB5UDBFK1c5ekdlcVp6NU9oVC8yMXVYWjJ2NVJhY3hoTE84M1k1Vi9IOW5V?=
 =?utf-8?B?SE93d2dMWUlMSHEvWFo5dTdKdXpUbHNlVVlScEZhd2RKcXFaN1Z6YU1JMVdy?=
 =?utf-8?B?ZllxaVY5UEVpekVTQXBlcUJ6UExNRVdXeTlYVW5pTzZDRTgwTElHK1k5cWlT?=
 =?utf-8?B?M1Qzdm1oSmMvNVV1eWkrTlN0YU53SUdjNjNvVTRGTzh4VUZEcWVka0FhOVc1?=
 =?utf-8?Q?Gjq5G2JCHCMR9YncEtD0LXcdENcf1ThFaeJQs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR07MB8679.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWxCendnVXErR1lSMEdlcmhFbkFNQk1QaDJQYmMzZmVYR01KMWNpby9kQUtH?=
 =?utf-8?B?R0h1R1hvYXh2emMvME0vZ1g1dFgzQ1cveldBaVFFMzlPcUM3UUErN2pqeitz?=
 =?utf-8?B?YlFUOHFSVlQ5L1VwQ2NmMnZLdkNVVUk1SXJ4bjEzRFZFSU5UbG1uZ0FnWVl2?=
 =?utf-8?B?Mkk2Ylh6cWhzd2dJQTUwUDkrT0h1NmpxUmZXZSsyTjU0ZEdXa0h3d24yN1Bn?=
 =?utf-8?B?dEt0dHpONk1UTHFqbmh2blhlNXNlbUtxQWE2QTVLbjdyOHVwcHhWNGpiMzlp?=
 =?utf-8?B?OFFGTEJrMDZRSEExTmlkZjE4Q0w0SWlVS2J4Vi9rZFFialhoN2hxeG1yMFZJ?=
 =?utf-8?B?K3R2V1NJOFBESTNZRlUyU2k0SFV4c29aTFc5MjQxclNSL09ORUhNZExJc0tk?=
 =?utf-8?B?Y1l5eTBtOTRDVU5QWHhyc244NTB2ek1ZemtpR1k2cWFOM0FKMm9RVjFySVhF?=
 =?utf-8?B?SmtqeGhkcWdpWUtYdlZ0cjdIQW9TeGVBdUdKWm4wUEw2N2RGdk1GUWRLU2tY?=
 =?utf-8?B?djRXT1RNS3BSeVVneU1EQStnbnJnK0diSHZ3R0N5M1NuaWNvcHJrdFJ5K0c2?=
 =?utf-8?B?SU10VjFQc2Zuc0YrbXJWVnRpSkNSUU1iM0lUU29JTDFPMEtpY3craUFBVHdD?=
 =?utf-8?B?RkZUYi9IVnZlQjdGUmVSU3dLSytVL2wrbml6dGFZYTdxZ1FkS2dYOFk1cm00?=
 =?utf-8?B?VzkvNlM2cnBXczkyaWVNSmZVYzdsc2tRRk5ybXdyWURZS3BhTU85U0pxeXdD?=
 =?utf-8?B?SG5tWmMxeloveHZEcVRwSUV1aUhwV1o4NXRjSEE0eWZUSmVHZHBKQTB2SnEr?=
 =?utf-8?B?Z2RtcmVMR3V6dzhhREtxM1VpdGd0TVR2Uk01SG9IbENObDE2dSt6WGVodW5X?=
 =?utf-8?B?aUJFWTQvaUlRbzRmajlLcmx3OHBVclZXMGZwbDZLaTNUTk9jbzBNVjkwMmhq?=
 =?utf-8?B?aGpuSzJJNXJJcFhLbWhVSTVSNjJzMHJ3SFZyK29yVzJWTGtqeFArOUpmRHhV?=
 =?utf-8?B?b2RRaHJJV0lGejlackxyNEdGVXJUb1BhaXBUclMvZWJSN0VqbllQVjhIZ0Fs?=
 =?utf-8?B?UzBSTFdtSTlkN29MM2dtSDlBaFZKUXdtc2JpNERkMnFVRE1yWHlneXZCUzds?=
 =?utf-8?B?eUExZHVTQUVTdUtnUWxIVE9pV29SR2xPLzdWK1BBU0NBc1JnQ3FKRTdRa1Rp?=
 =?utf-8?B?YVpaMGVtcjBWZWFoNE8yakpUSk5WVUdmb1MwNXlqa3ROWWpMS3BjOTdXdE1Q?=
 =?utf-8?B?NU5Ya3FjUGo2SUhKTXdZdFNQb2IwY2I1YnZVLzhkYjNJMm4yNkJYY0txVmd5?=
 =?utf-8?B?V01vZ3pSMjFFK3Nacm5RWm04UjNZSTZkRmQ3Tm9RcDc3R3dpZ2Zqam5wSWpV?=
 =?utf-8?B?b0Vmcy8rcjZ3UWkvN0E3N3R1bHZSeGczRm5wS1lvMDQvM0lXRkc4d0s5R3JG?=
 =?utf-8?B?d3A4UFpLNmVkQ0taUjNXMWV4UFVyMURjTENnZ2w5SkhkbW9HQ1NERGRucjkv?=
 =?utf-8?B?VUhWVXVlalRCS2UwdU9KSkx1TUt3YjlSQkNBa1RaWk9mZWg4bnRxdlhXcEtU?=
 =?utf-8?B?OXRWMmc1YjdVdHVJMGdtb28rZVpTYVNJZnZOdzk0c0RvRW0rVlp1ZVRlUFFE?=
 =?utf-8?B?eDQxdlVYSVVhOEk4bFpyR3h1OGhGaVNYS1Y4ekNHSFRxMWtsRFVpZlpaNWlv?=
 =?utf-8?B?L2ZYTGdQcHlVN0E0WHpvSm5ERU9yT2VPOUlxS25reGEvS3pwL0Y1bE9xbzRD?=
 =?utf-8?B?UjZiWVo1VEJnUmMyUnRkWUExT0dtbVF0ZFRZQWhYbTYvN3ZIN2FrelB2Zm03?=
 =?utf-8?B?ZndjRDRPME02MWRPNnU4L0gvRVIzblZGazgxT3ZIcEk2d2VYM0hPTGZFd0hq?=
 =?utf-8?B?U05XcHQzOWNqMndzZllPaUl4TlVMQlQ0VE5rNlJPWlBwS21RQmVuSERRbHdZ?=
 =?utf-8?B?NmVuVHBrVDlpT2FFL1BETGZNWVlSZDM5VnpmWGpXd3Nyc1ZwejRmckdXRnd2?=
 =?utf-8?B?MUlMQktqZTRld0pKODR5TmZIT2dPTlZnVmg0QU9lTkRRTnl6NWJ3T2NaNFZF?=
 =?utf-8?B?dW9hdE5oT1BrS1U1S1QveVRvWUNVVlhCK0JhdDhXUUIwbWJwQklTZWJtbDE0?=
 =?utf-8?B?bWV4aHlwU2FUWFBLRzhUUzFkd0kzNGhpMkF1SVdrQ2prODU5UmVhM0paYWJ4?=
 =?utf-8?B?UXM2bnNPR0ltL2RLdTZEV3RseGhQSmJ0SWtWOEltVU9sQ1VlZXY2SENiSHRT?=
 =?utf-8?B?eERYR09SR1pVNTd3MW92a0xIVlJ3PT0=?=
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b857b5-b6fc-4703-0c2d-08ddc44962a0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR07MB8679.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 09:16:02.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB8fbrnL73dEx+NRtKj3S1v7iQlBTkOVfBR2Iwch1h0qsymBft/FQbSdZXhMJ6cTFmPurgQP1gYuhYvwvVA2EfLhv1mOhblPtDVvaJwF1xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB10645
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 09:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118594

Hi Khem,

On 7/15/25 17:46, Jeroen Hofstee wrote:
> Hi Khem,
>
> On 7/15/25 16:48, Khem Raj wrote:
>> one of musl/qemuarm64 builds fail in do_compile, it seems to be trying
>> to access network to fetch some modules see
>>
>> https://errors.yoctoproject.org/Errors/Details/872189/
>
> [...]
>
> Thanks, I was already surprised that that worked. It does work
> here locally, as in, cleanall, fetch, disconnect network, compile.
> aws is a direct requirement of tailscale though, dropping that is
> actually new since whinlatter, it used to be there before.
>

Turns out to be that my build disables aws, when not explicitly enabled,
so I change the PACKAGECONFIG options in v2 to also enable them
when set. So now the aws dependencies are back.

Regards,
Jeroen

