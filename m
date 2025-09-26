Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB48CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:12:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12486.1758874364505034465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 01:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IHUzgyxn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q7p6dM1049020
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 01:12:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wSyShks80Km7VSDvpBqak8W8rCqKP8lduKfNjEkURbg=; b=
	IHUzgyxnxGw0jcEzd1kG41Bxd8xTPMYcnwjDltYlFuTEuJY+VPfutwuWIjlmf7zb
	N8FK0Ms00skEhgDXuWR6IT9PBgJ49Q+8k5vtoJdUQZY6BIt/wsgxaFj6VF3o6aT7
	tro5bHga5X+86ikjSIzI6iDQBwMWE0FbrLWKtSltX2IM8tdYXE+/POqUEAy9RyZO
	tFbrP+LUYKZgj/EtoXltMKvthlwGn0jzBcDO1La39SF9eP7Bard5Mjg0YmEyJwRo
	i0gOKNOkZjCP01OPcNHmD8LjCN9ire1eKagHQu6i55Gohg9aT1O2w2dTcvDSLuGy
	1E14a8assZXSdpbYLdPguA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbse0j8y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 01:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erZvynuTjrQt2yYMRWs2dTAB+uoPWZrvBLYSw6T1vLXIwatSvN8FnEs/3t4G32x4byjpmX1hSVI88thm8bYuv8+J4nE/cwy93qFrg6L5TtYS4f3YsDA17IFVaP44iW4aGZVOY6V/za2+kJvL8sp1UtAQF24SE6UDBCFy5Xb/pGS/PKHzPeD2j8lJ96xwkjwDJbmOolNAkhUjjGnxZloh3TeCEZTRCHDdMnR+N3Ok/7KzYNjcjMmuRN9TSvpKOXay9UUQsESpIOzKXGMn8p86G2vsr09VEwsn/6lJXpdPhAu3Nl1diqmk2iyGy4kRCeaz3i/GFySrWdYFxH0npJirZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSyShks80Km7VSDvpBqak8W8rCqKP8lduKfNjEkURbg=;
 b=p23YdH8LEUenPmwhesHHxgKLdcpBzl7j2KR83NBilSjBSyORGlVXeSJnxYZ9DK5pGGIg9bDL1GCH0fmsC8DYttokTYKD/01cFlhSVLdMcyHTqSjiqzs7vScjxplUd41rGjC+65NKo6pV7CBUfVLFdaGWqjicYlrinJ3X7NUvL56kp5OrMudi8qQvUtvEKfbvzcd67ltWBLF6lTuJ7ILi5/nncQNU2KUsxtyOMgWW9s6VX27L8bavLuZ50p8ZyG70PPDZ3kZT2uxBU9cLZS+/0jw2KpgXPzgGkJQdcLfcW2lVRNEYHR5yWts98VMFxif2Z7sZN9IyLWodufskk2HNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA1PR11MB6896.namprd11.prod.outlook.com (2603:10b6:806:2bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 08:12:40 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 08:12:40 +0000
Message-ID: <bf536dfe-5e48-4ad7-be79-e8473cb32c5f@windriver.com>
Date: Fri, 26 Sep 2025 16:12:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v3 1/3] python3-frozenlist: support
 reproducibility
To: Khem Raj <raj.khem@gmail.com>, hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20250926015937.2916794-1-hongxu.jia@windriver.com>
 <CAMKF1sqfj7nxs53NS1=OgM8sM==GfzjmsKgcNG=WWRhF+6DOsw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1sqfj7nxs53NS1=OgM8sM==GfzjmsKgcNG=WWRhF+6DOsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA1PR11MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe716b7-393a-4246-0f91-08ddfcd47642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFZnNlBYOXhpV05idTk0U0IyYW1mZjZwT3RuWlhjL05vZlB2ZDhTWU4wNnV3?=
 =?utf-8?B?WDU0WnZvQkExenowRzlSaHlVTEdVL0FzY3B3eTZVZndPbVFlaTdxaGZBb2FG?=
 =?utf-8?B?KytXTUxUd0lvQUZDMzR0enBrWk4vZE1ReE1leHluM3huWTZ4aElmcWFWR25u?=
 =?utf-8?B?aFY1anp4NGg2Vi9DQmNkQTQ1TTB5b2hkTUx6MkdtdGpjNnBLWTJEU3ZIL1d3?=
 =?utf-8?B?VXZBNjVPOUYxZzFZVjZZQ09JWGYwNG9OcnlmNnBWYzNWWXhQc3NIUytqMXNa?=
 =?utf-8?B?bmljQ3ZxZFdlWmQxVmRodGxhMWd6eityc2ZvNGlUVmZvbXQwaURiZHNneHdZ?=
 =?utf-8?B?UllSRU5XNW5Fazl2VElrcjkyYVM5enc3TlJabDJGbHV3MHo2dnNvTXBtSDBS?=
 =?utf-8?B?aVdPclptald4R0lGRFBQVXlyRzZQREdFakF2S0lnUVN3QjlIY0tYOFRUTXJT?=
 =?utf-8?B?V2pVUEwxR25jSXVFUW1qUi8vZ2E5ZUFBcEw0bnordk9HakZqc3Nrd2ljNmVD?=
 =?utf-8?B?RVR5c1hTbS9LWXVGLzJrRjh6UjNtUEIvZEZMRW9xRmlSRFNpVE0wVU5jMFVD?=
 =?utf-8?B?dTNVT1ZGRVg5d21pUlhnU2tTalFCSXk4emh3TGVseVNxSUFOdXE3STdLK1pH?=
 =?utf-8?B?ZkI2QnI4VXBjVUJYNStTbUlrdHM2bFdIR3gxWk9mQStCWHA2WE8vblJDL2tr?=
 =?utf-8?B?M0pWcUFZVHdMVkpjVE1pNm1xTkwwa2ZGcHpOcjZraDRKNDFQWFZXc3RzMGNt?=
 =?utf-8?B?Y1BrL2srZGV5S3hFNERuVnZPTmUxTXlHU1FWMHZwcFJuUzg3WlVZQk02aVVX?=
 =?utf-8?B?ZkdCYVhSblVodm1mdHd1ZDQyOHJGL1BqRTFyZGEzSTRFWi9teURDdjhITTVR?=
 =?utf-8?B?Nk90akE2K3RzWUkvZ1c2KzRYYXdTaVNWNWFFd3ZqMUFwMFg2OFZtQmIrYzlY?=
 =?utf-8?B?N3JRR0ExTDFucW5VeXlxY2VIaW1uWnZYcmhnc1FOOXhvYWZRQ1JTQjYyQlAz?=
 =?utf-8?B?SjZhNXRZY2JLY1R1cGFuOWVWbUZHeHp6TzVOZE93TnhYYTYrSXR6MTdGYzVq?=
 =?utf-8?B?RHFoUGxNc0VNSTRySkZYNWd2UW9qYUt3RlNTVVp1SzRzN0RpdEJIZk96VzBz?=
 =?utf-8?B?RzVISEI5VjQrRy9qUHVwa1k2d0hRYmRXd1hycmNEWFhtYkJUSWk3UkVnUFI0?=
 =?utf-8?B?bitsMW52YlE4dTU5V2c1bXV5TzFVRWF5MnB4aHJrbWtOVVphTGR1K1RPV1JM?=
 =?utf-8?B?UU04aCt0eTE4TGZwUmY2b0NRSEJVNlZ4K0U0MGJnVTZCWmFYM2s1UE9xVWk4?=
 =?utf-8?B?dG5xbGxTK014Z1ovdWR0WmpZcGRCazlBMXJ3c05tdTg2M1U5a2wvZmczUlVr?=
 =?utf-8?B?SElQRUtDcENKSUJZR2VCeks1NzRPQmN5ZEVMREtpeGFFT3FCT21Bb3Vock1u?=
 =?utf-8?B?MVY3dHk1RlJMRUQxZHQ5UTAwVVVIalVLeDArUG5RbG1oOXBMZU5ORU96VERH?=
 =?utf-8?B?VDhlN20xNzZGeTJQeEEzRHE4S1ZlamZPVm5hNW9GY1VtT2xiOGFScUN5NXRz?=
 =?utf-8?B?NVVTd2NIZFRIQ2kxSzN4OHBaTmNoZ0pWK05PUHBKczBrYlJIYk1ZemE0YjlI?=
 =?utf-8?B?WXQ1V293WWtyT2VabXp2M3NmUXU3bCtLZHZiN0xIZHI2eDVFY2QyaVl3YlRn?=
 =?utf-8?B?allaei9hRTJXclRIV1JkcFpkUEJseWROdlNFQmcycHlrM1o2MWpNL1QxM1NF?=
 =?utf-8?B?ZEdkdFVXK2xtZGxNYWdCbDkxVGQyRG1NcUsza3FYSm1QZmZ6ZTV6aXZmU3JD?=
 =?utf-8?B?b2dndVJHdllDTWw2R2h5ZFdPaitaYkZoV3VLN2JEWUJySm9TWDQwSmJIT2dX?=
 =?utf-8?Q?RI7FY1ky4Ujcj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFFDMk1UT1ZHS3lDT2hLdnlHRE5ONzhIWjBLVXJ1dkFudVpMUFJkQ3RhOVh5?=
 =?utf-8?B?RTF3UGpmaUJzb2c4dWc5eVdyRVhvZ1pGTUtRKy9idUpZYVEwZCtQWWtSdXBQ?=
 =?utf-8?B?aUk2Y3k5NlB5ZElDZk8xNDlSS1ZqcnJsWEJsb2liUC9RTXB3WUdzeFFUb2F4?=
 =?utf-8?B?YndJakp1aEo0T1AzMXR4Q1FTaUlQclNqeU03YzNOdSsxT293dHYydUR1QWNE?=
 =?utf-8?B?d1dHUkx1ckFCa3YwbTg0QVc5eDg3czVvVTV0NlBTamtiaVhWTjJtVjQvZW1J?=
 =?utf-8?B?c29ja0pNY1BUeDVKOHQxR08vQXMwNFEvVGc5cGI5bHE4L1VjejZmWWhMR2Vw?=
 =?utf-8?B?U0NBRUJzSTg4cjRzQ2drbjJPOE8vSGNCcDBVaHk4akdkdFZTM1VkQSszMDhw?=
 =?utf-8?B?ZHV2WHZQaDdla2UyTU9LNFZFbDQ0bVp6TXdZUHdtWVJYNTRNclUrZkdoMHcy?=
 =?utf-8?B?dW80UWpEK1FDOCtoVEZXL2dtQlBINFR0ZEdyMk00U05HNlBwaUswTENIYnV1?=
 =?utf-8?B?bW90dVljSEVOVU5Nck01bXNjSTlNeWUzeUVTOElZbUsrelNUZm5aT2JCRFJm?=
 =?utf-8?B?aWc4UE5pMGpnUHZxUG1lVTQ2NG1RVzRxdDJianI0eE95YXNFV0FNKzNkQnBF?=
 =?utf-8?B?WkFESjY0cUtWOGxsMklLMmROK2I2d3BuUmVpL2ZuWXJtRnFTb2prOEdlSlFl?=
 =?utf-8?B?NmVpMUxSMUt6SUkvUmMrUVF4R01QL2NKNjRtQWRQTkFBMTI1Z3ZOdXAxaDRU?=
 =?utf-8?B?enYzVS9Da0xnVElHajJWUnJqWHd4ek5KbmJBbjhRZVhER2hZcTZuZlJUV3NT?=
 =?utf-8?B?UGpQU0FuWkVLakMvWHJqQnVjNTl0ZmZKZnJoZ3BCWDBlbW5BNEFiQVZKQ0M0?=
 =?utf-8?B?TWpZUVhiME8zREowSk9GaHJLR3VmM1BaTnRIVmVWaW5SQzFKazZYclJWaVlR?=
 =?utf-8?B?ZkQwL05vTndjVEx2WWFINmFmQVBveHA1elZtbnAxOXZFMk1kaSswRE4wdjF3?=
 =?utf-8?B?dkt5bWhUT0sycFZ2cVNiRjk0ajA2NWYxOXpFaWZoN2Y3UWpZb1VvQnZBRTlI?=
 =?utf-8?B?dVNYQmFVbFJiRDVVVThpaU84WjhEUktKQ3VMZWg5VDFtMk1UR2tTZS94R2VD?=
 =?utf-8?B?MWFEYjZESWhGVHZYa3JSSGFnSHZ0a2pIbXZHd3Jya0VidFdqOWZzVkVtVm9y?=
 =?utf-8?B?ZnYzcVRyais2MTZNUXM1bTZGak8rR0NxOVNXL3JocS9OSC90eXhuTkZVc2hw?=
 =?utf-8?B?Y3E5RWxscUhjY1Rlc21PRURXYnl6a0tPZGNiVitZMUk3em9oNHowY2V5c2RK?=
 =?utf-8?B?MFBkU2FPWDJSSmdXaEEyRGNkY1hCNjBXdDFpK09YdnFqQ1RXRThiamhjbWFw?=
 =?utf-8?B?Z29LVXhWZzBCNHl6SWoyMEVxcFF4VGg3WUJFaFQvbUlTUlBQczRsZkNkdGdY?=
 =?utf-8?B?UzBqZnFGR284MTRhamxyUkJnZmpNMEJtOFFsUHk2SUJyVjRubW1IOTBsL0Rh?=
 =?utf-8?B?UHpqNGEyWVIyTnpKZHdVb3FhZVJ0YXRoOGw5TzNIK2N0L0ZOWGhubWx3ZjMw?=
 =?utf-8?B?d3loTGRkblNGVlJJbHZtRU9aZ3hwZkVCQ2haVmpPTStZbStXSm5Sc0prQ1Jj?=
 =?utf-8?B?TDd4YnZTYjRKVWFwTndhTWVMQ2M4cGQ3cXF4R3V5U3ZSM2dEWTR1TkhrMy9u?=
 =?utf-8?B?SWI4TnlibzZxckxFb0x3Vk9Wd3NZcFUwbG9pemRvcVUxYmtCUnljdWpudERG?=
 =?utf-8?B?SmNjdE1OVjk3Mnp4ZWtJQTNEK2FWOXdObmg2U2U5MzBwMUE4T05EVjZCVmkx?=
 =?utf-8?B?dWUwQkRIZW5qK3RLWmZ6dmIvRG96MFg3WjJIaU5naXFYbXhDajZFamtMVStw?=
 =?utf-8?B?YkVzL3ZEakFRKzY3d0pQMHp3NkNVZk5EVXJEdlc1ai9WUzdIS2VqdHdkYzNU?=
 =?utf-8?B?aS9ENzBhNHFFSUNMaTd6cy9aZ2h5WGd2SlRLZkdFdEtwZFZ2a241MTYvd2dl?=
 =?utf-8?B?U2NQWEFrMGltZXBnNlROWFdERDhSUlc1VkgvYnA2UnQ1UVlhcGF5eUVwS0pY?=
 =?utf-8?B?d0hDOFhGRDlIZkR4RE9CTXRlSzRBMnplL1l5ZmFSbWc3eVkxSXdleFphTncx?=
 =?utf-8?B?RjNyNkFCOThPY3JOZlNVaHlEalN6T0ZUSERiKzlmSUpyQlNNejNCMWdKRWlY?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe716b7-393a-4246-0f91-08ddfcd47642
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 08:12:40.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD9EF4xri8XxkZ8GZzvCatTWnW23hNHjqdtdxCAMz0JKXB0xRaXFeXPtuweScnjUSJ69oUB/dVciTBKj1xiCO0dyNJgMNZRpIjWgDkBL2d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6896
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 7Mj6jYyN2qPT7QYqhzAtkZe2IqJvmXM7
X-Authority-Analysis: v=2.4 cv=NanrFmD4 c=1 sm=1 tr=0 ts=68d64afc cx=c_pps
 a=wszTalFPv2ofqEyTcV7qHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=slxbEa2ASCI5iDfBV_sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA3NCBTYWx0ZWRfXxrS8WvW5X9xw
 I2tFYDODnFw+5GPyJcg4ZG8FxJIcEkjP2bvi+bxdznr/ugeWqX7+NmYnYf6sAHM+SQt+g/by1Jy
 3aXoSoBLHturz8IvWdpE4b0itiy6dmKrI4jhjvlNBzF2cMt9D3yYqNEJBYj5uCFGRHhSU8GwyFU
 P6NKcc3yrMlyW8+iEJQwiM7sIVfR57e6zPic89jZy8aCfiCJNRAukyF5Jsmfr3RNuzHByS4f9QU
 Rol3DCMBa9Zph6Pa03in+J1wCVGvRKh3hdRqWFUdmeV03ehhl8tqClU8QW8kWcK7eXOrt374kc/
 EW/CN+YjGtYjA7MYlTnwQGAcyV/wlZYr4WKfZgKeK90V1lzpbGfgS9o2dORLA9vfnNMFE+cGYbA
 kMoIr/6DUmLHDmBNNKluyHTRpzYcBQ==
X-Proofpoint-ORIG-GUID: WCaBDo__6zvlsw608OjmLQsUvhtai86F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q7p6dM1049020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119898

On 9/26/25 11:07, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> It would be better to have a per-recipe copy of the patch. I know it
> is the same patch today but it may not be the same tomorrow since
> these recipes are quite different.

Sure, I will resend the whole series including

[oe] [meta-python][PATCH 1/3] python3-mlcommons-loadgen: support=20
reproducibility

[oe] [meta-python][PATCH 2/3] python3-pandas: fix reproducibility issue

[oe] [meta-python][PATCH 3/3] meta-python/conf/layer.conf: update=20
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES

//Hongxu

>
> On Thu, Sep 25, 2025 at 7:00=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>> In order to make the generated library be reproducible, build wheel
>> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
>> option -fdebug-prefix-map could work as expected
>>
>> Note: To support reproducibility, it also requires oe-core commit [1] =
to be merged
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D61d98d=
12eca1c7bdf3b7387a820c83d3b8fad965
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../files/0001-build-wheel-in-place.patch     | 31 +++++++++++++++++=
++
>>   .../python/python3-frozenlist_1.7.0.bb        |  3 ++
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/files/0001-bu=
ild-wheel-in-place.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/files/0001-build-whee=
l-in-place.patch b/meta-python/recipes-devtools/python/files/0001-build-w=
heel-in-place.patch
>> new file mode 100644
>> index 0000000000..84f81da775
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/files/0001-build-wheel-in-pl=
ace.patch
>> @@ -0,0 +1,31 @@
>> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 200=
1
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Wed, 17 Sep 2025 15:41:09 +0800
>> +Subject: [PATCH] build wheel in place
>> +
>> +In order to make the generated library be reproducible, build wheel
>> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain'=
s
>> +option -fdebug-prefix-map could work as expected
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + packaging/pep517_backend/_backend.py | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_=
backend/_backend.py
>> +index 61cad34..d5d839e 100644
>> +--- a/packaging/pep517_backend/_backend.py
>> ++++ b/packaging/pep517_backend/_backend.py
>> +@@ -316,7 +316,7 @@ def build_wheel(
>> +     """
>> +     with maybe_prebuild_c_extensions(
>> +             line_trace_cython_when_unset=3DFalse,
>> +-            build_inplace=3DFalse,
>> ++            build_inplace=3DTrue,
>> +             config_settings=3Dconfig_settings,
>> +     ):
>> +         return _setuptools_build_wheel(
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.=
7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> index 7d813a026c..d832494c82 100644
>> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
>> @@ -7,6 +7,9 @@ SRC_URI[sha256sum] =3D "2e310d81923c2437ea8670467121cc=
3e9b0f76d3043cc1d2331d56c7fb
>>
>>   inherit pypi python_setuptools_build_meta cython
>>
>> +SRC_URI +=3D " \
>> +    file://0001-build-wheel-in-place.patch \
>> +"
>>   DEPENDS +=3D " \
>>       python3-expandvars-native \
>>   "
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119888): https://lists.openembedded.org/g/openembe=
dded-devel/message/119888
>> Mute This Topic: https://lists.openembedded.org/mt/115442281/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


