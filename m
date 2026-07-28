Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAF5C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:39:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9408.1785238756762653062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=tqHkMSkj;
 spf=pass (domain: est.tech, ip: 52.101.70.22, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIwQ3cMj8kpWM/tAtpLvLXjyG7ZgU9YTHmAiozhkZAIo1qgA5dIi9RPsF6owZ6Ls/NINfijn++aFFZ1jerwXFeWB1O5MdwwTr+dE10fHMYWa/bCvi9+gFCLv1B91uTTz98x1uS3lFY0SfsQvKkRI5ivh/tQzfxgyH6r+Tu1aDbg1GsP5FTW5et9a1dsmsgPW9GK/EgcX+NpfI5fpM+FQcIIwnikF5GU4stWJqhWjx17oydUee9uHY625HcjBZvPicJDRmZSUrEmDXY97LT5olV/Nj7jcHNg2WnFAUIlDO3qW7kYsOTKzVf87cqS5XGJaUjeI6uHwnoDnFZSlvjVYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AIRAeZ9PbIizlHaxtXRZlRc4s4xA3N8ld1SDzC1fEU=;
 b=OM60fnezHEV5hts+Xy09AwEtrA1GbND+0jfPtHt6zmqlTerpKJ7ZffM/aFREx2luyfib5PPwujHyeBpKOvhJYDv7bgw4H54CBnuYXDh1rHVU50gi4MUn3sGDQCYNpcl0cUjqRqoUlHpBoPYYDpDcLZbLDPG4EXKb7n4kIt1tZle+pTwjU27vf7JJv/OzxdH9Vt9RT+FW1UhoXsna9ANfAg/1MyBdPKFi/sLZ0lb+cRk6BLUZ7ukFCbEl9xmUWe1vEi3nvTLWIeygQzqZO9u4Ko8i3O+bN40UTaWydvHrGNUw/C+VjFXE4Z5z2HjWnG1Ae7ecwcf7FjwX4EymN8QBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AIRAeZ9PbIizlHaxtXRZlRc4s4xA3N8ld1SDzC1fEU=;
 b=tqHkMSkjJnpZvEuc/0Q6WpXsgyiypGMobEfE8OMJZWzKfVWNK/aLE2OT0aqowmmUdWKVA05Hg9O+N8PXyfFHB4u2Qav7LCkgYtKtPkDVp/uxVbnu+1gX69IZkeBkEVtFnpCQk89atSIDDU83Zu0EUS+drjA8k9/ZhI8YsYNT2awlDUEhdEOgil2Wi4QXxjQntd0JJ+7nS/LsG1KxJmRNdsgcpT1RwBwBEtUVPdZSncZsQmdLMKMaycQj3oRzpz9oYF2eVeDGt4Hon52libgBijim/4jJQdQvzI+7ZEZe1lhQEcv1QRECKgmb56LfBSLRfQ1hFWDjeCwFeqcD8pEoXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 PA1P189MB3529.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:506::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Tue, 28 Jul 2026 11:39:12 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 11:39:12 +0000
Message-ID: <6840adf8-bf91-4ab2-b944-0a9623049ca2@est.tech>
Date: Tue, 28 Jul 2026 13:39:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] jq: fix infinite loop in CVE-2026-47770
 backport
To: openembedded-devel@lists.openembedded.org
References: <18C4E77C857C2754.2705241@lists.openembedded.org>
Content-Language: en-US
From: Tugrul Kukul <tugrul.kukul@est.tech>
In-Reply-To: <18C4E77C857C2754.2705241@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0168.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::23) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|PA1P189MB3529:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba72503-922f-4ffe-6bdf-08deec9cd852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|4022899009|1800799024|376014|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Zm9N+bBY9KdKFi4O24gYEYEXSuLakU6Rk7DS/nKTwKzd6cznwS4sPEcx+hkUh17YddrJFR/zrhHgEFSks5Kyk8lSfueEb/aI5UqBi/1p7CkOw1aL0xi+D1VkYcQSdqquuOZzm/Fx44F9GKlaRkqPOYWCAXS5b3vWV/hgAEjIq6zztesBCqTWC81vYflSG6YlJ5Y0xSPaWMnxg5+I1y5bS0LNFkyuuAVnOB8sM7gXoiPNvQ0Y2F/vrLrqypw5kxPukYX0Sj5+2MIHfODKu0441azpxtZXEelFJLYjNAkh66mxqwNmvXXw39WjtYZtgaU5xG+ckoMI1ncdDOUL+epjx7XdiR+ePQuzBn7xaPQU8UgVoH1Kdfo+bS2V/5ncQKBYSmQF2H441NPa4ceLDe3mvR72HQmHY2+NjJpyV4YJUF+XpKio5QvAYRUEbo9Lkv5Pk9RSctt/0W4f1Nr2wRR1w2pJOAuXJSU7tJ2r7N9WOQiPGSvWO+k3wHMfAfOJI1xce4MzSZEBRScpG9z0HTtVE2zUatz2pUQ/ZzwY5VrXFVGu8ETXhzsf6SkcLjgJNCvtr5jgC/1XVkhW2l4hH43RXjjh96+FAjA9oHcdE614TRwwT0kiZI+IC3QsXCapFa2950L8cGhZq1rkuj5KuKZ5erMIfnJddVvLTDopeltixRk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(4022899009)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVgzUmk3QmtXenMyLzBDU05HMUdOeUpjVXR5VGNvRE4vZ0t3SU9RRnpJOEtj?=
 =?utf-8?B?UTJVczZ1SEIxRCtiSDhqeU9XMEMvUTdVUmZZcCsrVjliMjdFQUcxb2lWRWFS?=
 =?utf-8?B?VXJxcFl2b3ozK2lqSnNhSFl5eE94VzRpdG9KQnh2b3JCQmJCRnM1R0NRVG4x?=
 =?utf-8?B?VjJONVAyN0dBbzJKQ3h6VEFNR1dnZVRETnVmejlmWUVuL3FZQVdudkFKeXYr?=
 =?utf-8?B?ODkyT2xoenR4U3FuMU5hTEY1U2FQTXB6alVobjRYZHRjMXlmQ2lKQVYrL3hR?=
 =?utf-8?B?STdIeHdPS2lmTmRkWitDUlBia1FEcitJYmVvaGJHa3ZuTHMxY3YySmlTV1hI?=
 =?utf-8?B?Q0xsb09aUHkramliOHRpM21YakhxMGQzKzhOb3hNTW1sMitRN09tN1hBTlZK?=
 =?utf-8?B?ZEZCcUtlRmEzaGtWWjFvbVlBbmxrRUxiSG1Ua3NQL2VFb083SnlIcHltV1pw?=
 =?utf-8?B?ZEhBditlYTdTbUo1eUZPVVVGdlY4b2J1aEVLWHByRmN6UFZPOWN3ZEJzdVY5?=
 =?utf-8?B?dklLR3h2TXN2cnVDU0tYUTRqOTZtdzZZNkE5THhScEN3dnNDd3ZlUGF0S1Av?=
 =?utf-8?B?L1Z6S0pYTUxQSjZWNjBDRUpldDAzQmZXMkpLOUN6RUtiOVIwbHpyMFI1M1Nl?=
 =?utf-8?B?MzVYRkwrSnJDUy9YRm9UdHg1bjlQSjNRdzAxc0lHZ0phd3pxdEdBemZTOEs2?=
 =?utf-8?B?UENRZTJWamFhWmZkQllBK0dRYnhuS3RvY0RyZHIrZjNuOHFyZlVvVCtBdlRs?=
 =?utf-8?B?NWZBclkvZERtaUdGZFdaWWY0UHg4Yno2a0tmSGtIN2cvY3lHaFhIckU4YXBM?=
 =?utf-8?B?dzg0cHdUZW9YYzMwVks0bWk4YlB5ZU5BU0tEbVFLc2ZpWFFNTFhDUU9Gb3ZT?=
 =?utf-8?B?NDh6UUNqWEdGRkhoakxmRm1tZU93YlZZOFY2Y0tkVkVYSEkvUE9pdkNEdVpu?=
 =?utf-8?B?OUdmQytDblhTcnNtRTd1SnVrRFQrMG10Rko2cXBYM0NucU5udWpmb0dNck9R?=
 =?utf-8?B?bVY1NklGTXNraVFpN2JITkRBS0ZjTUMvZ3ovL3FrQ2JjKzFFV1BtbTZwS2xi?=
 =?utf-8?B?SElWRUZnWDBsOElDQ1JobGY5dEFubkJnWWRzeUVxa29taGNQaXJlMlV1UXNB?=
 =?utf-8?B?TWFybVNoL2ZpdWZzbS9xWDArbXdWbFRDWkpJQmNmeVBnQUkzNktzaE9FbXBI?=
 =?utf-8?B?ZWh1azc5d3I2dmNwZXJlUzNNQWJ6aldnR28yS3R5eFZzNEp4NTZubGVDbFNJ?=
 =?utf-8?B?SHVVZGo3RXVvN2YwN1d1U0VCM0MwbGl0M3dmSlJRVmY2bTl4NmVCcm1FeDZm?=
 =?utf-8?B?UEdzdllVT3Q5ZE1rMGNQZ0h2c3JGd0VCMkl1M0lNOWJtc1FNTUJIcXAwRVRr?=
 =?utf-8?B?bkp6YUYzWVc5MUFMT0g4NHZjKzNkZXBvWTUxbmRjK3pqWGx3VStoWWNzSDg1?=
 =?utf-8?B?UlA4b2F1NVhkR1FuSGUrdk5pb1BFbzNmN2x3TjVkRzVXcUJPU1FYZlVxOFJE?=
 =?utf-8?B?YVFEZk0rSEJBa0tZeE8rbGN6WjRFVnVKYmdIRGpFVlRqSnJ0OTJUN0RzK09I?=
 =?utf-8?B?L2s3dUJBWmNVQXN5TEw3dEFmNUFGeUF2emZIa0p6aG1mVHpzWkxsVnJFR3hz?=
 =?utf-8?B?YU5aRFNpWlRuWUNwR1JIRVNxQlpJcVJTOElic1lCUUNib2k5bWVVejZLdWgz?=
 =?utf-8?B?ckdXc01wUytBWW9oUHFINXNJU0lYZk94U1AwWmtUU0QvNldrZVpQbzlOSTRp?=
 =?utf-8?B?Z1NvMkZ2aVRmZ0dSMzY2ZVNKZG5WekhxVW5UMng4R3h3NUcrVXJvWTV3QVAx?=
 =?utf-8?B?SkdIRVBZdS8veXZ5c1FBaWR2UHg5TEV1alloV1FqVFR1TCtRSHQ2V0o3WEx4?=
 =?utf-8?B?eThTYjNRMklGanV5eUVYV0svdVM1WlVhV0dCcEwxeHZtVEx2RzlSbHZueVJy?=
 =?utf-8?B?Y3pBa1I4RHNKUG9PN0xCdzIrREJnenNhTW9US0FjcVhET0tkQ0FsdlIxU29w?=
 =?utf-8?B?SUJtVkhDU2pqM1lZSjIxUWY2MFlEdDdGZ1F2L3JRZlBXcGFUL3Nsdys1cGt3?=
 =?utf-8?B?bkprL0EwM1J5ZXlzZngzM0N4Kzd6d1o4dUdzT1ZrUHRhV0pPZDRtd2FrU29N?=
 =?utf-8?B?Rk02QkRZeE0wQUw3aWFNWDV0OUJQaWhwbFhhVW9BZ2xpZkFMVUx2cWg0R0lO?=
 =?utf-8?B?TGhEMTJyUm9qMnVQOEI2Z0ZKc0EvaFZZMEhtRDF5bXVIYnRzNmdUQWplQUY2?=
 =?utf-8?B?MkFhWUNxa3ZsZWVxTm5MZ2ZvbWdvMWdkN0IrN2tkbnU0SHRCZ0dKdjZuMWpU?=
 =?utf-8?B?MHowWU9KV1N4TjNVR3JrNjhiVFhQYkVubzlNSjNUZFlwSTFwUlpIZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba72503-922f-4ffe-6bdf-08deec9cd852
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:39:12.2822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzoKDDJjrYyZpPe6S/VnLvueLS5xiQNp/utBOuI5wmz1HWLjkSEAMZh3ZfnFjooab2HIauF111vRZU7j41JIaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3529
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 11:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128507

On 2026-07-23 13:24, tugrul.kukul via lists.openembedded.org wrote:
> From: Tugrul Kukul <tugrul.kukul@est.tech>
> 
> The backport dropped the "j++" body of the delpaths_sorted() grouping
> loop while adding the "== 1" guard, turning "while (...) j++;" into an
> empty-bodied "while (...);". The index never advances, so any update
> that produces "empty" (which reaches _modify() -> delpaths()) hangs,
> e.g. "map_values(. // empty)" and ".a |= empty". This also hangs the jq
> ptest suite.
> 
> Restore the "j++" body while keeping the "== 1" guard.
> 
> Assisted-by: kiro:claude-opus-4.8
> Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
> ---
>   meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> index 1d6664e842..9865de86cb 100644
> --- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> @@ -13,6 +13,7 @@ Fixes CVE-2026-47770.
>   
>   Signed-off-by: Anton Skorup <antonsk@axis.com>
>   Upstream-Status: Backport [https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787831]
> +Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
>   ---
>    src/builtin.c |  36 +++++++++++++++--
>    src/jv.c      |  46 +++++++++++++++++-----
> @@ -237,13 +238,14 @@ index 594a21f..a39f1f1 100644
>    static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
>      // Array slices
>      jv start_jv = jv_object_get(jv_copy(slice), jv_string("start"));
> -@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int start) {
> +@@ -471,8 +489,8 @@ static jv delpaths_sorted(jv object, jv paths, int start) {
>        int delkey = jv_array_length(jv_array_get(jv_copy(paths), i)) == start + 1;
>        jv key = jv_array_get(jv_array_get(jv_copy(paths), i), start);
>        while (j < jv_array_length(jv_copy(paths)) &&
>   -           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)))
>   -      j++;
> -+           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)) == 1);
> ++           jv_equal(jv_copy(key), jv_array_get(jv_array_get(jv_copy(paths), j), start)) == 1)
> ++      j++;
>        // if i <= entry < j, then entry starts with key
>        if (delkey) {
>          // deleting this entire key, we don't care about any more specific deletions
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128417): https://lists.openembedded.org/g/openembedded-devel/message/128417
> Mute This Topic: https://lists.openembedded.org/mt/120408910/9950728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [tugrul.kukul@est.tech]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
Hi,

The master jq recipe was upgraded to 1.8.2 in commit 64a7f6443a
("jq: upgrade 1.8.1 -> 1.8.2"), which already includes the upstream
fix for CVE-2026-47770 (commit 7122866). This backport is therefore
no longer needed on master.

Please drop this patch.

Best,
\Tugrul

