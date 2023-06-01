Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BEEC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 17:49:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1191.1685641738618316311
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 10:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ieyDFU3J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55165c784c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351ApNZN027095
	for <Openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 10:48:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=qLWq5olPaUhZo6NCJea8lnu5ak5grzKHJIZyXEa2+eo=;
 b=ieyDFU3JvslL1y6S1dX+fOdsyNZsMKgv1tydmRvQyx6ZmkdV6NZXkX4bWfNhOvzcQs2A
 dppzGlFxk7by8JeiflKz/0r/Jf1ikZruPUAQymrt3vN8I9DgDaucnUYXIlrm5Gf5XRAp
 erPCS3fBs07/Y6H3UJFFoC8UreVCp/1JdMBh1wagefGP88iNC4xzqzzL9UZSI8sUoola
 fMmfwzdCuISUIfGtd4oJ1+LUXIphpZ+p41HzEI/5iQ3pLwAkMFFswsCDJFNLa3R9nko+
 EH6qGyT6mYPjEB08WqTQpRx5UCcyyrkZX6p8fxq/8V7qbnCC4tquSLjgrzcrGs+lP89K WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjcs9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <Openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 10:48:57 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 351HmvvA015066
	for <Openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 10:48:57 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjcs9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:48:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt2M9+ZRaPREgNc7E76jIBMNqWNZ369h0icZWGggMGI8TxsHk3ERHFvyMYBDnpGgFjmraiHxA4sPzGeeynbhCVV9fjEF0+ssMBradLl1XxYucleeb9XJXBXPT6EO7CTdee9/nfZqBai91p869wXvV8AMdBkLJI9Vift5JMSmAVv6cedYdFGayqbq4B4HYQxmRTKjTh6m0dygLJ+k9uo1kYTw7SlEhn+XroKWz7cehHSqU59FoJbBpxe31WooB2wsBuCNGtKL7BXmmJa8pELwAEdqke15x+x6CVFAd5fTVOzcXp4oNns0TiBckfnGC8dOcwJdBB11mtg+LIqd8Jfu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLWq5olPaUhZo6NCJea8lnu5ak5grzKHJIZyXEa2+eo=;
 b=GAesoJy0qCa9gjj7Jk/rPfazFZBlDF3/Dgy+do1pcr+dpQCULyMCzpjHDNpxk9BmZ/CtOquds5bz8s5IjR1sETXCCDUKDnlCMfniGV9Ftw3qdZTmSJUT7+f8/Pjp/Y71XWgtiEZxIw4oYAPVjiPLLJLQbDCSRM390VgZx1ZmsP8rUzSDcTEws7hJHYb7rdARIx76uZuxYSq2x1TGbi8n+UIkT1LaRwfBab9is0lYDh4sgCUKVvhdA/wSMlEu6MgSKfVFkZz3/R/kC981qnCjtDehG/Icb1Psp9avpa9PIqBC6ys+rODX2z6MDgP3GiywdGfoRrCdx5ZILDnxRvJyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY5PR11MB6284.namprd11.prod.outlook.com (2603:10b6:930:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 17:48:54 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 17:48:54 +0000
Content-Type: multipart/alternative;
 boundary="------------QFhgjKaakrQo78Fwi20cxna2"
Message-ID: <5f4b92d0-7d69-541c-c383-a1c70596887f@windriver.com>
Date: Thu, 1 Jun 2023 13:48:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-oe][PATCH] libyang: backport a fix for CVE-2023-26916 ->
 For kirkstone !
Content-Language: en-CA
To: Nat Bailey <nat.bailey@windriver.com>,
        Openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20230531223435.2927651-1-nat.bailey@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230531223435.2927651-1-nat.bailey@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY5PR11MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 492ab4c6-39e2-48c9-f9ef-08db62c87782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rbmm8Oc2dfAmW3y188dQxcqQSmLCDzApOvdxgUvjJ/51XstZ/1F7COYdeWDZnskxMNDS9abVN72eA40bNrcBIR49x51FjZf18bjOF05k6QeJ2h/GPeeZxDJsnHiwk3/mjb755MBD/QhpxNp+QHsR7vwpqLLj4Hie1wvhANyPjg3zMlABmtRqrNnHac/HATGpUJm3MMguXPPVASNHE1OnPIi+Tc44pzbnnOuKNRu5/xYv/fT9v0jHBndploOyR/WypW+Z5oxXhmutmu40Y0NSoEeoTDBxtN3gRF9CE+oSpKnxKbHkO/TUqat7KuEpNBrjQBgvz2YRBY+xZgFKRxoby+Uw4gLUjNE7g/YDLLlf/oQIBLEkUtUG1gaKp8rNx5rKJjdhuWCd+MXjz05wyvnOUp1wyZ2uS9KwY+fixF8PjqZlUTcorwz3/ET9v+rag51EtNrLbsTgHTk0TKN69t3NQeihWKESzJ1MRP7ycX7G/RBLWYFpCCO2hppY8uBR62dnJkkXt1Bfu7YV/R1+TSNKJ2ce+bhqjpbB3kMqvmHCQD4DWnGRhSRTXIbtrcxAGxw1zrQZzaLlozw8fSz73dT3XaQCip7g0Mh/INHKXH+ykfPLv2JgizeYltRHeTxqGOOCj5GwrMDWlym59ryOFQFxvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(451199021)(83380400001)(186003)(2616005)(6666004)(33964004)(66946007)(6486002)(66476007)(66556008)(478600001)(316002)(110136005)(53546011)(6506007)(5660300002)(26005)(6512007)(41300700001)(8676002)(8936002)(2906002)(38100700002)(36756003)(166002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ym0ybDhSVjNCZzByRGV1Y2VPUjllT2g5T3dZdVlJRjFvWmsyOXdZNWp5T0lE?=
 =?utf-8?B?a05NWlBpMEczclNhbG81YkVIQXNkcjdlTVM3Y0NyZVVtand4dG4yYysrUEJS?=
 =?utf-8?B?ZUQ5ZG05bUFzTTUzbURJZ2Rhb0tCeFBQNzlhQ1NyNnpiQ2IvaU4wU1pkZVRM?=
 =?utf-8?B?ZnNJZUp0aHNiVEx2L3A2NzIwT1ZZNExoeEJKSk1pSVNEWnpzbnJuWGFHOHNv?=
 =?utf-8?B?aTc1N1REN1RraUdqRkFlZGlUNzN0MGlrUWJ5ZTBJWnBYYzFvdDQrSzZKN1hO?=
 =?utf-8?B?bE91dmcrQ0liQTBvRS8yV2NMSGUzaCtVVTdpNkpPcWdFdFptYVJuNlVzNS9r?=
 =?utf-8?B?aXhueWQwbDlQTWpqZ1hCa1NwWFBvQ1hsdDBCUW9qU3k1ckJsbVBPMzNPVDd6?=
 =?utf-8?B?OWFMRGs3Q1k1SlNzbU9aV255dnp2ZFM3TWRyZ0xQUGFIdHhvSHkxSGtkU3RE?=
 =?utf-8?B?Sm9HeVVjaTRFcVJNN2JUY29heE5YTG5CT1dnN2x0TE4yejMyWHFFd2QyZDlv?=
 =?utf-8?B?Y2NxeHhkYys3S0lmVjNCWlo4ODY0ZWF5OWpvckdBcTZ6T2w0Y0ZaVkNKdSsv?=
 =?utf-8?B?eWU5SkI5dVYyNXVtWFc1cXg4L0VMN29haldVZHRONzd4alh0WHFaMkJOc0Fy?=
 =?utf-8?B?MmZsVWZ2aWJKOW01VFFNZnh4RGZFZ1FJOXdzejlCYXcwbTE5MWRtQ3p6S2g5?=
 =?utf-8?B?dnZmWVZ0NSt4blNKbmEzR3dvOFQwK1hKMkE0dytrTlY1UTBwRklmUUZpemt3?=
 =?utf-8?B?OEhTTGt6d2xJZUcyWVZ0SkdrNkVHS3dDNzVyT1FxL09PdkNnYURycVYrSXhM?=
 =?utf-8?B?bWw3SmNncjBkNWo3SG9wRm9nZHFPeFpwdURtNGpsbCtiVGRyRnEraEx0M0V2?=
 =?utf-8?B?NWd4R3hWWkRCYnBRMThLTDZkMmRVdlhPUFlJSHBrbzR3dUZtZGdZQWhoN1Jl?=
 =?utf-8?B?emlJMnoyaTZGYmlqdTNTYkFKMnBsZnZkUlRyaHZXZ1N2WkE2S2YyN2tnbjQz?=
 =?utf-8?B?MWxDQXo2eW1HeEQ2MXhwaHNiUWhuOUxPeEdnbGUySEc0VDJHNmR1OVVBSmJ4?=
 =?utf-8?B?bUtQTVZrUFZBYW1sOU1oRUlwaGhxZTdHVDJPRENHNnovSVBVVlpRd09KcENr?=
 =?utf-8?B?KzlKYW5oVlF4WDA2dnJGRDEzYTNZdkhQN3M5NHdhVVZuWGR0b1l6Y1NJSEdh?=
 =?utf-8?B?SnM1VDFsbEIzVDlrbUxLZ2lrTVIvOWIzNGZFSmc3YTlveXNBMER2MXFSV0VH?=
 =?utf-8?B?M09BcmRFa0xQa09oZ0VGZnRPMXVHZXh6K3pPc2E5L1dVRGo2dDZyb25xaG9x?=
 =?utf-8?B?QXlZMEhRaXZRQTVKVXlhbmNESnhXRHM1cXZQcXpXQm5ZQ2ZBWE9GM3dTbzJ0?=
 =?utf-8?B?MFFNTE5HRHJUZUdMYTBIa1dyenpub0hsZStranFlSEV2ZHhTSVpablNZYXpO?=
 =?utf-8?B?cFZOYW8vaVBiOEkrcUx4eTRkSlpxY1pKS3JVbFBrUkJjQzNtWk5NWGRGRjl5?=
 =?utf-8?B?V1kxenpLcUorZWJwbXRxVmdwYzdZcG5wNSt1MTlwOE5LTFhMRGlzQ1pNZWdo?=
 =?utf-8?B?UkpmZVB6OXY5U0VsOVBmK1BCNTU1QTA1KzFUT0I5dmdkVGFBLzJ2YlRadEhY?=
 =?utf-8?B?bmlxOTdrS1g3SUJSTWIwTVZSZ051VW5mS0dwM0tZd0dEMWVFM1dhaHF4SFRR?=
 =?utf-8?B?NzIzRkEyc2drMGdDTFlQb2YvaHFkd1luMEUzSUlFU3VpQ3QrcmlHa3crVEtY?=
 =?utf-8?B?T1BSbkU1VGw3ZDFsQ3lBOFB2TjlzYkplSS9kbFNsQ2ZNTzNCZXdidktjeE9h?=
 =?utf-8?B?cnhWQ29vZXNqTytzYTRLV3pPM3dKdjRGN3ZobXE4bURoblpCd2Q5MTFPR2RL?=
 =?utf-8?B?UzhiL2t0dDJnUDQwOXlrVlgxVmFMT2tVZ0pjYUo2dkVaaWx3WUp5VWNLU25x?=
 =?utf-8?B?K05GcTI0MVJHcTl0VzdkNzA2cDJBL2kwK3VZbVk2OEdZV1hUeHVSYVRsYTI3?=
 =?utf-8?B?VS8wMnZ3eDl3VGJUd0FLZ2VQSHlSVVFKQkcyVU0rTHQ3NzRvOUtueHhpWG1S?=
 =?utf-8?B?RjVyZjFGaE5RNll1WXBORUtWRU1iL1NvQmtUZUNaMnVCMGRJMUJSOUdLbEs4?=
 =?utf-8?B?RXcwcHF3RlJLNmxKMElEZkN4VStvREdMYkhicWlWcHBlb0liNEh2N2tTNko5?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492ab4c6-39e2-48c9-f9ef-08db62c87782
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 17:48:54.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG4BjnAyiZ9IyiaeKBPwadRC3pZRHf4LbEUfcHjeTVz0uMmU361qwwZe1JoZYLSR0CaoQEvQx289KWmqJyqpgt12hLe7UK4havOPmnBEFEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6284
X-Proofpoint-GUID: AWfq_EsCTG3RI-_EL-LnTVJYjUC4AApZ
X-Proofpoint-ORIG-GUID: FSlr1mrvHaowhnxG0S6sxHlfNw3C3YCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 17:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103082

--------------QFhgjKaakrQo78Fwi20cxna2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Oops, Nat forgot the branch prefix.

Shall she re-send ?

../Randy

On 2023-05-31 18:34, Nat Bailey wrote:
> From: Natasha Bailey<nat.bailey@windriver.com>
>
> This patch fixes a bug in libyang which could cause a null
> pointer dereference from a call to strcmp.
>
> Since this recipe includes ptests, the tests were run twice
> (once before the patch and once after) with the same results:
> all tests passing except utest_types, which is skipped.
>
> Signed-off-by: Natasha Bailey<nat.bailey@windriver.com>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../libyang/libyang/CVE-2023-26916.patch      | 57 +++++++++++++++++++
>   .../libyang/libyang_2.0.164.bb                |  1 +
>   2 files changed, 58 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
> new file mode 100644
> index 000000000..f3af3dbff
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
> @@ -0,0 +1,57 @@
> +From dc668d296f9f05aeab6315d44cff3208641e3096 Mon Sep 17 00:00:00 2001
> +From: Michal Vasko<mvasko@cesnet.cz>
> +Date: Mon, 13 Feb 2023 10:23:13 +0100
> +Subject: [PATCH] schema compile UPDATE do not implement 2 same modules
> +
> +CVE: CVE-2023-26916
> +Upstream-Status: Backport [https://github.com/CESNET/libyang/commit/dc668d296f9f05aeab6315d44cff3208641e3096]
> +
> +Refs #1979
> +---
> + src/schema_compile.c | 20 +++++++-------------
> + 1 file changed, 7 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/schema_compile.c b/src/schema_compile.c
> +index ed768ba0..68c0d681 100644
> +--- a/src/schema_compile.c
> ++++ b/src/schema_compile.c
> +@@ -1748,7 +1748,7 @@ lys_has_compiled_import_r(struct lys_module *mod)
> + LY_ERR
> + lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unres *unres)
> + {
> +-    LY_ERR ret;
> ++    LY_ERR r;
> +     struct lys_module *m;
> +
> +     assert(!mod->implemented);
> +@@ -1757,21 +1757,15 @@ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unr
> +     m = ly_ctx_get_module_implemented(mod->ctx, mod->name);
> +     if (m) {
> +         assert(m != mod);
> +-        if (!strcmp(mod->name, "yang") && (strcmp(m->revision, mod->revision) > 0)) {
> +-            /* special case for newer internal module, continue */
> +-            LOGVRB("Internal module \"%s@%s\" is already implemented in revision \"%s\", using it instead.",
> +-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
> +-        } else {
> +-            LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
> +-                    mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
> +-            return LY_EDENIED;
> +-        }
> ++        LOGERR(mod->ctx, LY_EDENIED, "Module \"%s@%s\" is already implemented in revision \"%s\".",
> ++                mod->name, mod->revision ? mod->revision : "<none>", m->revision ? m->revision : "<none>");
> ++        return LY_EDENIED;
> +     }
> +
> +     /* set features */
> +-    ret = lys_set_features(mod->parsed, features);
> +-    if (ret && (ret != LY_EEXIST)) {
> +-        return ret;
> ++    r = lys_set_features(mod->parsed, features);
> ++    if (r && (r != LY_EEXIST)) {
> ++        return r;
> +     }
> +
> +     /*
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> index 2817be7c8..7875c1ef7 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> @@ -11,6 +11,7 @@ SRCREV = "a0cc89516ab5eca84d01c85309f320a94752a64c"
>   SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
>              file://libyang-add-stdint-h.patch  \
>              file://run-ptest  \
> +file://CVE-2023-26916.patch  \
>              "
>   
>   S = "${WORKDIR}/git"


-- 
# Randy MacLeod
# Wind River Linux

--------------QFhgjKaakrQo78Fwi20cxna2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Oops, Nat forgot the branch prefix.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Shall she re-send ?</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2023-05-31 18:34, Nat Bailey wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230531223435.2927651-1-nat.bailey@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Natasha Bailey <a class="moz-txt-link-rfc2396E" href="mailto:nat.bailey@windriver.com">&lt;nat.bailey@windriver.com&gt;</a>

This patch fixes a bug in libyang which could cause a null
pointer dereference from a call to strcmp.

Since this recipe includes ptests, the tests were run twice
(once before the patch and once after) with the same results:
all tests passing except utest_types, which is skipped.

Signed-off-by: Natasha Bailey <a class="moz-txt-link-rfc2396E" href="mailto:nat.bailey@windriver.com">&lt;nat.bailey@windriver.com&gt;</a>
Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../libyang/libyang/CVE-2023-26916.patch      | 57 +++++++++++++++++++
 .../libyang/libyang_2.0.164.bb                |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch

diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
new file mode 100644
index 000000000..f3af3dbff
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26916.patch
@@ -0,0 +1,57 @@
+From dc668d296f9f05aeab6315d44cff3208641e3096 Mon Sep 17 00:00:00 2001
+From: Michal Vasko <a class="moz-txt-link-rfc2396E" href="mailto:mvasko@cesnet.cz">&lt;mvasko@cesnet.cz&gt;</a>
+Date: Mon, 13 Feb 2023 10:23:13 +0100
+Subject: [PATCH] schema compile UPDATE do not implement 2 same modules
+
+CVE: CVE-2023-26916
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/CESNET/libyang/commit/dc668d296f9f05aeab6315d44cff3208641e3096">https://github.com/CESNET/libyang/commit/dc668d296f9f05aeab6315d44cff3208641e3096</a>]
+
+Refs #1979
+---
+ src/schema_compile.c | 20 +++++++-------------
+ 1 file changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/src/schema_compile.c b/src/schema_compile.c
+index ed768ba0..68c0d681 100644
+--- a/src/schema_compile.c
++++ b/src/schema_compile.c
+@@ -1748,7 +1748,7 @@ lys_has_compiled_import_r(struct lys_module *mod)
+ LY_ERR
+ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unres *unres)
+ {
+-    LY_ERR ret;
++    LY_ERR r;
+     struct lys_module *m;
+ 
+     assert(!mod-&gt;implemented);
+@@ -1757,21 +1757,15 @@ lys_implement(struct lys_module *mod, const char **features, struct lys_glob_unr
+     m = ly_ctx_get_module_implemented(mod-&gt;ctx, mod-&gt;name);
+     if (m) {
+         assert(m != mod);
+-        if (!strcmp(mod-&gt;name, &quot;yang&quot;) &amp;&amp; (strcmp(m-&gt;revision, mod-&gt;revision) &gt; 0)) {
+-            /* special case for newer internal module, continue */
+-            LOGVRB(&quot;Internal module \&quot;%s@%s\&quot; is already implemented in revision \&quot;%s\&quot;, using it instead.&quot;,
+-                    mod-&gt;name, mod-&gt;revision ? mod-&gt;revision : &quot;&lt;none&gt;&quot;, m-&gt;revision ? m-&gt;revision : &quot;&lt;none&gt;&quot;);
+-        } else {
+-            LOGERR(mod-&gt;ctx, LY_EDENIED, &quot;Module \&quot;%s@%s\&quot; is already implemented in revision \&quot;%s\&quot;.&quot;,
+-                    mod-&gt;name, mod-&gt;revision ? mod-&gt;revision : &quot;&lt;none&gt;&quot;, m-&gt;revision ? m-&gt;revision : &quot;&lt;none&gt;&quot;);
+-            return LY_EDENIED;
+-        }
++        LOGERR(mod-&gt;ctx, LY_EDENIED, &quot;Module \&quot;%s@%s\&quot; is already implemented in revision \&quot;%s\&quot;.&quot;,
++                mod-&gt;name, mod-&gt;revision ? mod-&gt;revision : &quot;&lt;none&gt;&quot;, m-&gt;revision ? m-&gt;revision : &quot;&lt;none&gt;&quot;);
++        return LY_EDENIED;
+     }
+ 
+     /* set features */
+-    ret = lys_set_features(mod-&gt;parsed, features);
+-    if (ret &amp;&amp; (ret != LY_EEXIST)) {
+-        return ret;
++    r = lys_set_features(mod-&gt;parsed, features);
++    if (r &amp;&amp; (r != LY_EEXIST)) {
++        return r;
+     }
+ 
+     /*
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
index 2817be7c8..7875c1ef7 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
@@ -11,6 +11,7 @@ SRCREV = &quot;a0cc89516ab5eca84d01c85309f320a94752a64c&quot;
 SRC_URI = &quot;git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            <a class="moz-txt-link-freetext" href="file://libyang-add-stdint-h.patch">file://libyang-add-stdint-h.patch</a> \
            <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2023-26916.patch">file://CVE-2023-26916.patch</a> \
            &quot;
 
 S = &quot;${WORKDIR}/git&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------QFhgjKaakrQo78Fwi20cxna2--

