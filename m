Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73464C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 10:10:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3519.1660385428722678849
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SxoX+myd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5224afc6e8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27DAAStb003190
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:10:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XfCWIHxMNW8hpVxFQ1YOVHswzzfMAto2h2tWj34SYG4=;
 b=SxoX+myd1L2c9V03EADjKQPbiKL3ON6DYeUjbiCAJuvdTd8cYabsryZrbs3bE9NJgNwo
 QbQ7kszrr2aqNu1Zf6tNOgp2I2bniBinZqxELwdeqQgpxqIuYEToH+E40lmpm1INmOLv
 TSnczty/n285+sohz+pI5ayvP9fh4le0QZXp+qqn058d4hI0wXWEiDLdp3RbMPer3zHr
 OG96wFKmYrHGqOwfAGDzD+sgQi0SNLcp42QaQIyAuQbj2pycndGRXqkwqWIVZ8wjZh7w
 RTO0y/DTaxjWj8TOtWDv21NHsWMxpeuR+PeP1IePETIuqX6DlNHo4aGTrnMWiQIGKy/B Og==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqhs9y1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUh+bC8ytpq2j02duRd8ugjf9XTru4olR29UdhHVok5rZE0bY0XEDGBe7Q/66pUwEpRLupY+GahwLSAvJTYX+JUzBG9sE3FSQYamWsM550BQ0kwAWxnQGXqT33h22vm0bLbLgpQtxm1tNoVHslmxDsjFqjmKFeTZap5wfGG+yeffuUGLYL6UBApJay/3atdbi+Tw0Z5iKQE8wRwLJNsEkfz/xO4FqCBlIBjax4xU8lBDXU33LIuCsFt1MuO8bZ322n7KPzukuB8DX+GaoeY5CQ6WDbvu/yZT0Kvb09ZBikLdEKtdg6w56DulbTDw7wPoo6Mqf4JyLUhzVja9CrQPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfCWIHxMNW8hpVxFQ1YOVHswzzfMAto2h2tWj34SYG4=;
 b=TRhi3Xie+x3Xcm3us43oKEkR5rvMJ7/hFbUGstRr7AaEypL4XUY1NMRoin9L1OfohBfZjv7JdxE48VxUZzMc5VS68e3ytVuUT++zwplnQFexgPGUtvkoLJtPS+A5lBfyl2nIP3FqPwAeDPHQs4TcCyLV+1jsRVcgxpdalXhUVJSF+2bT9d2OdhMntiq67FWzzA9MneZgD9sMZcSECi5hoJUrrCmXmwPxNGu9C4KGfQ+JIBpFmwIl/KgII8uwjlX14H9JHprPINF0/5fqClA8ab3lC9sb6/GpaPVVjaHEFM6RtGrxIuW9KKxOYCjZ+G26GsWhkdXKStzPTCY9Q2nzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Sat, 13 Aug
 2022 10:10:25 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::c517:5e:d3d8:d408]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::c517:5e:d3d8:d408%7]) with mapi id 15.20.5504.025; Sat, 13 Aug 2022
 10:10:24 +0000
Message-ID: <b0229209-e6c6-0c14-298e-b173532e6409@windriver.com>
Date: Sat, 13 Aug 2022 18:10:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [kirtstone][master][meta-oe][PATCH] redis: fix do_patch fuzz
 warning
Content-Language: en-US
To: Changqing Li <changqing.li@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20220812091458.1395202-1-changqing.li@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20220812091458.1395202-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0093.apcprd03.prod.outlook.com
 (2603:1096:4:7c::21) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a27d096-2eef-40ab-1de7-08da7d1409b3
X-MS-TrafficTypeDiagnostic: SA1PR11MB5828:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UHE4TlNSOTRhNWE0RDliUm5QNmtDVmNjdnB0bUlKVUVNMGJrMGcvamU0dzVD?=
 =?utf-8?B?eU9FSHlDMmpZdVFHTmpocmJUcEI5UjJraWdibENGVkhQZE55Y2lidzNVUnB0?=
 =?utf-8?B?RmhCdEVQWW5LZkU1cUMxYWlCcFljY0VHY0ZMcHNSM1Q5aUZkbGt3b0YzT1c0?=
 =?utf-8?B?aVplRGlscS96c2o3MWNTUHljRUFyTjBHVC8wYU5ENWlOVkRMalJGWEp3SCtZ?=
 =?utf-8?B?MDladnkzT3BLUGFOVkp5ckVGYkdyZExScVhGV0ZaRDhCSGVRUnRSTStWbkp5?=
 =?utf-8?B?emI5OHlvNVdiek05c2lST0VoWXowMGk5RU01cEk5WEdhZ3RhbzhmRFk2ckVt?=
 =?utf-8?B?UStrUjROTHkxQ2tEbldaajlWQUF6Q09VWXo3ZnBqL0FVcUdwRjdxRnJQK3Zh?=
 =?utf-8?B?TXl0OXVQcnN2OTdEeWdOamtlbHJ2WktqdkpjVkdWdXNKelZ0ZFdrNzgvc0tN?=
 =?utf-8?B?Y1N4WVNRMWVaRm4vSnRQYXdyOUlhSDNZMGk3Tzl2L2N3NytaUmZ4MzNPL1NC?=
 =?utf-8?B?ZnB5ODBabVRyYlp5WDI1YUw1TUgrMzJCdC9TY0tKa0J6VDRJVmlsOXkrTFMw?=
 =?utf-8?B?ZnVBNHh0TE5CMWVQMVhTR3Z5RkoyUHpjMHd0Q0g2S2Q2Yis5R0ZMNjBjbnM5?=
 =?utf-8?B?YWxTNURFVi9ibkR6TlpsUnlQWVZuV0NpVDlsSzNvYkZtOGlPMHFxdjJIanVq?=
 =?utf-8?B?Vk9lREU1eTd3SHBYSnp0Q1NGSzZqTVkxcTIzQklaL0lhc3RPRWtJUzVLNUhz?=
 =?utf-8?B?M25pSGsrbldxMUdNdDFRVkc2NUduUGhLKzl2WWlnSHJXU2psVnJqekNMQng5?=
 =?utf-8?B?aXVSSjljZU4rUWk2QVdvdm5qSTV3aWhMR1orNFJBVDRuUmdXS05ZbHJvcnJB?=
 =?utf-8?B?cUltYWpTVnkxMXhhNlB1MHZYNVhNWDA2WXdHMC9ITStBeXY3UnI2N09vWWJ0?=
 =?utf-8?B?cDkyOUI5UVJScGkyVzl1OGg1MUZ1QTdSbktITDJ1aURISmc5aC93dWQvTUJC?=
 =?utf-8?B?WklYZXBnMjhQOFN3KzY1QlhZa1JoM0lCQjlXeFpIdnpNQlRVdUtMN1haWDlJ?=
 =?utf-8?B?MTBjOEFabmJGRmJraDd6SkN3Rnh4UkxxVSsxejdaK3Z5QUQzd2FNaTRzSE91?=
 =?utf-8?B?VEpBMTRObStVNWhrRmxrS1R1UWxma0dBZ3hFUWVpNCs2c0EvUXg0M1gzajRY?=
 =?utf-8?B?QXBJVVJ3R29zTHJPOG1UUTMwcEcxeDd1QlNRY05odnRYVHp6UlNaLzVuUmlw?=
 =?utf-8?B?QXNreTUwMU84TlJieVRzQk9HbG5KVHNNc3dkVDhHcGhxajY3dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(31696002)(86362001)(83380400001)(38350700002)(38100700002)(66476007)(66946007)(66556008)(8676002)(36756003)(316002)(2906002)(31686004)(5660300002)(8936002)(478600001)(6486002)(966005)(6512007)(6666004)(26005)(6506007)(53546011)(52116002)(2616005)(186003)(41300700001)(9126006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXhWQmlVckpTb3M4RG1SOWFRMWJIcVpOSGFPR0xkd3hHcVExNDlQbHdlR1NI?=
 =?utf-8?B?R3pHdHNpSFh4aVRFdFVLVzFwSEI3OUU5ZjlCZTFxWnVjWWdIUnVmVjZtUTNJ?=
 =?utf-8?B?M3pRWFd3WjZrSUlyRVlndnhuMXVoOVMzZ3VMVmJTV3RHbWlQVDdLS1Z0c29r?=
 =?utf-8?B?MFdkNUR3NEpSTlJOTXQ1U3dqakpIY0xWaXdta2FHWGw5ZUx5TkFzOENNZUhX?=
 =?utf-8?B?bE05MXBZK0JLYk5NZUZJdmFUbk9DWUZ6RzVSc3NYaHEzdWNuR2MrbWx4TjZu?=
 =?utf-8?B?eitZVUJzNEJ6cUx6K3V2eU1rblpwRit3YS94MndCUnRqUWJTdWVQcnV4TFN1?=
 =?utf-8?B?aUhHeS8yajhON0d6ampFL2ZDMVZLNjA2bk50VDBFRXZ2R09pM2x1bGlEZzRV?=
 =?utf-8?B?QlhhZWhOcmdmdld2Z09EYUZveEo4NmdyLzBqTE1vOSsycnB3WlJiR1RETHNv?=
 =?utf-8?B?TE1XSUF6N2pWSmFtODFDdE5Sb25OUklOU0RkZWZPTDRJd3NzTFpqbGxua2Ex?=
 =?utf-8?B?RmM4djFlZzloaDBscTlKTDB6ZE9JQkdPK0xrZUlDdEZDNUVrTU8rc1dSVXZ1?=
 =?utf-8?B?Ky9jNUduSDdUKzNoNStoekgyakxUYkV5a3hYSjBCTXNXU0JCcFZuZGg1SE5G?=
 =?utf-8?B?dXh6d2QxcFJQVzI4cWNkTTVySGU1a0FiU3hJTnJxQzhESGZZTy9kZENUc0Fi?=
 =?utf-8?B?aitsMjRZQVFKRlNCMDVrUVkxVWpwSFRkQlVmNlZaeXhjMVNabEtQUmpmWEMx?=
 =?utf-8?B?QksxTHZFQ3lKWTJnNWdWa0JSRFZ2SFdEcGd6TGE0a2hQRUEybXo0MzIxeVVO?=
 =?utf-8?B?dVRaRkJPSFl5aVEzb2xzTWFHaHZvcGNYOE5MeTFzbG4xYWlSL0RXOHZEbVdi?=
 =?utf-8?B?SzU2ZHh4Q0UvTUNjc3VKdjlSYW9JNkRTay9EUjdRZWxwTGJOakpwR1NUalNM?=
 =?utf-8?B?YmZ1SGV1c1B0YlhKRGVpRGpYc1gzVTZxNnNIajJ1SlhoanRNMzlYT3dyVXow?=
 =?utf-8?B?alZvZlNWU2pqdnAxQzJFUkVBakhjYi9nT2dZbGdncmZHQ0E5YytWS1VlYnow?=
 =?utf-8?B?VGhQK1RnbXNVM09pcW1jMXNjMzlTRG03RjRkMnBKMUo3RkVZYzJBaWpYOEZF?=
 =?utf-8?B?YWJxOGgyQ0NNQjJXOXoyeVVuVE9Dd2l5YnlHb3RyLytFTnVuWTUrU0FmZ2to?=
 =?utf-8?B?V3FrYUFxQU16SU5HWUZTeTFSYnI0b0tPZEpEeHl2NWlieFRlRjBESS9Ub29Y?=
 =?utf-8?B?andNRHM4RHdPcGVFcEtZdVl5MmlzNnEwdGlUWVJxOTUySXg3bVNjbjRReGda?=
 =?utf-8?B?MnpaMXdsbjMyNWxGL011VlhwRlpzNHB5TXREVW5xVGtkeUUzQ2V6QmVuNDkx?=
 =?utf-8?B?TDMzVnlUQnhlMmNsUkU5cFVSNTNHUjBZdmdFM2s0ckJDeFBMNXNka2krM1da?=
 =?utf-8?B?cncrS1JjR051T3pGR04xaVQxVjBMYU45amxkM2NPMU15SU9yS1BjdHcxVk9i?=
 =?utf-8?B?M0oxZDJoZmkyYmRMUzlxbStZVWZ3cER0NExLUlM5aTM3UURpdzJDSEpwWXI0?=
 =?utf-8?B?OWs0ZmVKdWdPRnNwb3pRb2UvemI1aHBRRGlDTE9vRytKYTZqbjVBaW41WThF?=
 =?utf-8?B?ZGJqY0R0RHRSQWpHeU1JSUxQQVp0YzkydnpueG4rN3NIMklNQ0k4N25COUVQ?=
 =?utf-8?B?OVpPOG1jSnFGd1Q2cVRjTC9nNEY2SWN2Tk1CL05VcHpJK0NRbUwxT2crU0ly?=
 =?utf-8?B?aEpoQ2ZPLzdhb0hJUnZ4QUI2QjdyRmxybGRRSVd5TUpmODlKVUhnZURucFVk?=
 =?utf-8?B?QVJhYlBZYUdXVEtpNlF0QklkeWhJeGpBN2IxN2laRnZMQkdUdXdaeGg0NFJM?=
 =?utf-8?B?aEh1cDdQTUZuYXBwdnhTVUErUzU1U1NjNFpOcDlxNnQ0c2NLc1JDY084L08v?=
 =?utf-8?B?ajJLdUdSaTl6YU45WUJCT3dtRmJqMWFlUHdKN3pHT0VBT0pLbW9ielFuNklS?=
 =?utf-8?B?dTBFaFpKbTl3WElnVTRxWEVqNUdNYmQ4ckhmNm1jUFVLcFNaSEt6andWckx6?=
 =?utf-8?B?WFA2eWlDNUwyeThQd2hRdzZwSkRlYzZJaW1EZ1ZxMnZJbTU3dENWQkxaN3U0?=
 =?utf-8?B?bE9IVTlXbkQrbGdESVRRWnplZHQrSWZRWDVSTTRneGtQM3VqbEQvb3Q3QzRn?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a27d096-2eef-40ab-1de7-08da7d1409b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2022 10:10:24.5803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c24WEEhMm+eRdOfswQ3qhTXiL+u+R4g3cNuO5QjrE1pWsQ0633XXVw8FmxzqImvAgW2bIVrm8hSk68HgCgd5H/lBcRn5rMMZxgBlZtExJ4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
X-Proofpoint-GUID: jaISFWnYrVwRIPyV7BG6wU72_hnweavI
X-Proofpoint-ORIG-GUID: jaISFWnYrVwRIPyV7BG6wU72_hnweavI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-13_01,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208130040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Aug 2022 10:10:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98227

Please hold on this patch, we need a V2 to fix the multilib do_fetch error.

// Robert

On 8/12/22 17:14, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Fix:
> WARNING: lib32-redis-7.0.4-r0 do_patch: Fuzz detected:
> Applying patch GNU_SOURCE.patch
> patching file src/zmalloc.c
> Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
> 
> There are two version of redis, and need different GNU_SOURCE.patch
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch}      | 0
>   meta-oe/recipes-extended/redis/redis_7.0.4.bb                   | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-extended/redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch} (100%)
> 
> diff --git a/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
> similarity index 100%
> rename from meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch
> rename to meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> index 993ff34b10..e292237097 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> @@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>              file://lua-update-Makefile-to-use-environment-build-setting.patch \
>              file://oe-use-libc-malloc.patch \
>              file://0001-src-Do-not-reset-FINAL_LIBS.patch \
> -           file://GNU_SOURCE.patch \
> +           file://GNU_SOURCE-7.patch \
>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>              "
>   SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98209): https://lists.openembedded.org/g/openembedded-devel/message/98209
> Mute This Topic: https://lists.openembedded.org/mt/92976372/3616940
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [liezhi.yang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

