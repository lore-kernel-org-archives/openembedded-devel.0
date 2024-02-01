Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889A0C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 12:07:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13902.1706789257884629475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 04:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MylUui33;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2761b6e633=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4119UOeJ011319
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Feb 2024 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=pFaXsXITc+vsWDdEJAXSLHa60WR2jvrYEY8PUMFgK98=; b=
	MylUui33WWjHe07NI8hMRbVX3141SpUjCtnqGFvuj95qbjIz7xSABa3mTodG2wLT
	FNaYhUSIiU0eUr+XibAFH00OwEXoJY91Pl+9p/4/J7lgQO8Fm7PVdNPY6og+vB48
	YznXyjRMtYP2a1Z4u0EuWaBKiv9CqC44QFVITr/KR9FPsFhjOG92xe26duRa4QiR
	s48eay51Jtur1X/qnFNVOsfNDImy/AQABB4BTbDutElyiAHKkGL1brokYJ0h8eoF
	9p1ce8fjvbbEaa1E2FfNshWYZ84FvFNMDjhxuAmWVTZvocRbePmtiO9KyTVVuHfC
	nZk9w5hwgPzXZziFN8jEKA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w027hrdtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 12:07:36 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 411C7awV002586
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Feb 2024 12:07:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w027hrdtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 12:07:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISwDXb2JkZf5/6bYUkuZDPKkQC5Kp13lpU9b4IL45/VxntHU7okc+vEazEuaMAG3VAJuhxex/p/fh/L2w3P6iuOGn5aHNe9mXjHrTzhtR1uG1sGqp57O1z7SL2I3cfHoJuI6nLn02k+8Y+Hfpdl4NV5qD5Chx68TEf6QZIqJ6iPhZbwSyKrKVogSEwzclwOZNioyWXLx4x40nP/Zy9RMCX4n7B1U/ckToeKS6q9NYvmx7BuGp2bO3gJG/+8b0YwoPNXXRdsgsM3e6iR6eB5PbO6J8RkiS1FgvMJNJPyfMGNbV6mSjD9uB97MDIkq+yYcEUrYA24O8TSYOJmWPVHhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFaXsXITc+vsWDdEJAXSLHa60WR2jvrYEY8PUMFgK98=;
 b=W88XWfvL+2B7CKLQkSg/8hUVO7r3yhWz7Q9VfQJihdhaOb1CNVUvRnF4ndCDL3QsXQxDyuoC2ldvQiyU0xnbmaHztW/z8hLTDSV/9kpEsyltRWUZc4HrqnpzBzNrAiVsqTTWwc99r9Ugpw51rErMyaGsQT/XbALw00bkJMrA1UX5xnBiKvvoZkiZV58gWrQUjd7BwCV/5RCFIRG/taSdfN3j/yHRsX/yquC8Dpd5eww8+HN/3nQKJr16JzB3//IYLPuBQyaeIg2aAt3OC/fNzOH5DQUjPj4B94SeWk1LeazlQIEQuMg20qm5G1dytDUQP1or6jZ0W800BHm+IL3/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 12:07:32 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::bfb4:29e1:7a38:491a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::bfb4:29e1:7a38:491a%5]) with mapi id 15.20.7249.024; Thu, 1 Feb 2024
 12:07:32 +0000
Message-ID: <f24546cb-3614-45e8-9bda-6220b42acb46@windriver.com>
Date: Thu, 1 Feb 2024 17:33:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-aiohttp: upgrade
 3.8.5 -> 3.8.6
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <17A8A59DEC3D9576.24350@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <17A8A59DEC3D9576.24350@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 156f0084-4700-43a4-bb92-08dc231e5e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kpBZLUHPOe/RGf2uQ4iONE/dZ6ezwJ31uFxJLzw24bqE6c1pcFk8HB8GJPyjj1OWarG9kJbfQWImJcIbUMkqdvI/2U4kDFCjGdr3bwM7YeJ4qr8DRLLidXLXbdifaR5JG1qqtC+rlpFFZ5WdBkVXWYquQXqqMsgqVl7C+RZPhYJP9hBtzZPP4gtwkm6ZEbj9gA3RdJBChkv/kWNPCAuvhh/eyTQ77UeMRpfVPyiKXgTmBxvLnS9dyvysysalH1RUZa1BZf3nXKn//JuEC9UIXsBcR39yoqHZ+myHHiVCv0mEolQKbxm54Ib4LGlLJk8ZkIaGEl2GUuP+w8xFglKrkRe8qwoTAf53ZGVOPFy4Ll9fZgxzozH33ayWwSNvR45ZLKmNvUfv1g6jdwAChcfbd/Zne044gl6KU/3tUpLUPuC6114CH2RbWhbvfIv73/Sw7B0ZHDrbcPnAgaeF8IkwqE7h4ujzfVfd40JU4C2kqMdbQxHwjrnwVzuCqeY5yHSN1T7TkW3vic21Vv/eT9xd4utA0mPjXHEiMo0AjH9zoONspSzj83q46rlnt7Bk0/b+Fkh5HMVojogbA6AXygul4ftP2Pg/rWbufOqZ8nfXwK3DkBSgN5LL4z1ojJOo66pDflVNFegJtU3dPRl1+8YLbjv0ddwbQCSF3kVY3LwVdfE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(8676002)(8936002)(31686004)(316002)(66476007)(66946007)(66556008)(2906002)(66899024)(966005)(6486002)(478600001)(6666004)(6506007)(53546011)(55236004)(6512007)(2616005)(36756003)(26005)(83380400001)(38100700002)(31696002)(86362001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STZNL2wzY1ZVZEY1SXdsWUtsMTZ0WGRKTXhMcFJJd1JYdDBIdk5BUkI1eEMw?=
 =?utf-8?B?aEhtSXc5NW9jZ0cxYXl1NmhqVlhUK3oza3FRS1hQUE5YQTBhNVd3TklGWkJt?=
 =?utf-8?B?TVhWYWU5QU85enN2YkY2VU9wTFJzQjc1eEx1bE5EbVVNT2xpQUZaWjdjNThP?=
 =?utf-8?B?ZUdZYzRDd01UWk9sM1BJVUZleUxQUnczbnZoZmx2bzFFK1lMZGo2YWdYZDNu?=
 =?utf-8?B?VldpN3QveGZzc0RhcmppQkdNRUQ2SXZ4djMwVTZZbUxMdEwyditDY1hPQ21o?=
 =?utf-8?B?cTNGWWV1TzZKRGlKV2pFQUVzQklXdXk2NUVaSUt6L1E2MjgzMWovNmlhMndx?=
 =?utf-8?B?bkExVlZ4ZkliNkd5SEtRS1BNY0I1ejdtd2hORWxVY3Zhei9jRWcwTXlEdXRK?=
 =?utf-8?B?MmFrb1o4YVgzVUdJYWZKQkREUXVCd3N1eUhmZjJBdUQ0bG1WTEdyemtpdjdN?=
 =?utf-8?B?ZmtLOGUyVWJQbmhBcko5MityU095eEU3LytXZnFtTzRsenU3Rkc0cTBhaHBV?=
 =?utf-8?B?blYyOVhsUVdrbXBVaGp5Um5zc2l6SjRVdDhpQXZ5eHJOSVRlU3pqc0ZuQXA4?=
 =?utf-8?B?Z2lHcTVIZjZMdkJKejMyaGNhb3RFUlZZSEE5QjArSzd6M2lXREZXZ3Ywc20v?=
 =?utf-8?B?MU5ZL01ydmRneHFaNVZnTnNHQzkvUmtxWUlIVEI4UkltVUNnMjgvMkk4ZTM4?=
 =?utf-8?B?elpyYjhpVEROMHk1eTc0YUV5NzNVbmZZbGc4MEtPRzcrWVovL1V0MXErOUVM?=
 =?utf-8?B?cnFKR3dJSm41Vi9meWJnUnFXQXg2bVJjWHg5ZVZPUlZiSjlyc0l1YWpmanV0?=
 =?utf-8?B?RVVSU09BVTFTUDRORVhIVmJ2dXMzdlRlQWY3dmJIZ0NQdFV3aktWUWgrak9l?=
 =?utf-8?B?VHdsN2RGT21sRVFXM2ptaFpVMHl0RnBUYkVKS2FEdG5POUdtYXRlMVJ2bGw2?=
 =?utf-8?B?cFJCMkZoc2JEaENidXF6bWZVT3ZlSzY3STQ3blZrWHZtTFA0dWhJY0xFaUN6?=
 =?utf-8?B?aGlMc1JDQVZwZDdkbW9ubGpxWlpBTGxQYnNQWVRXQVcrWFJ5ZlJYQlZqdnlj?=
 =?utf-8?B?VHI3d2MySnhBTzAwbENxVzVCSFkyUUxQa3gzaDFRK0IvUHl3aUYrYzJoLzBp?=
 =?utf-8?B?OFNOZ2hjekU0c0xYWDBUTU9lWk1JMXA2Smo0ODRDS3JKWWVqbkpldUdoWEFq?=
 =?utf-8?B?cnFsMUxIc3NxOUlJdi9Ma1NzZ0E1cUVHbFdId2EwTTJBUXdzY0kvNEt4N1Bx?=
 =?utf-8?B?VzQ5N29qZzN2emNZYzVYcGIrTk9xWnhKMkRRZVd2cEpLRlJPT2VrSGVtajYy?=
 =?utf-8?B?WXlNSWVNSzV0d1FtdVVpWUpTTzVtUFNyTTc5Q3l2eWg2OFFtTmNmcXU3c0Zx?=
 =?utf-8?B?dDhFVEtCNXZ4NnFDUkVVNVloZlZGOStMUnRQWW0zQzlHR3QrTDI3M2ZUb3d3?=
 =?utf-8?B?aitPZm8zSkhDMCtuMXpyUnJid0NZYU5pd0ZkTDFWeXVRNTNaUWpQVXgvQThw?=
 =?utf-8?B?Skh0ZzNpQmExbTJZSmZNZmR6L3d2Z2dXUHpiRnZtWmxXMXVYK2xWSlNVUzBQ?=
 =?utf-8?B?cUVkZkk5Q1FqYVFuTjZFVUNrWG5QM0JpYU5sVFVaRk1iZkZqajBPbmlKa0da?=
 =?utf-8?B?QTlTT3pKZ2pZM1lGRXRPbWlVL2VSeWJMRkRnT0xadlJtZnNiM1B4UjBGREZr?=
 =?utf-8?B?anFrWDd4L0xuK1Z1djFZZGovWWpQSGY4VytncE9kWVlnS3FOT1Y1emtJL0Nq?=
 =?utf-8?B?cjlQMzlLbUZvUzJxQ2dhM3F0RHpGV3M4T3cxb1U2QlhiM3lEclRZY29Rd2Zv?=
 =?utf-8?B?R2dUd2xvSVFsZU1hV0tOc3J0NkNQOVNtYml1RTZxV1NvWUdVOTVhZFg1bzZW?=
 =?utf-8?B?NXZVMjF6SGQwK1pDNHpPZjVpYzFDVXRVYWd5UHRzUy8zRDk0L0V0Q0IyaFpx?=
 =?utf-8?B?NHd2cldVWlRaMDNpOE54c1FHdElwNGFJRCttTjRyYzJqRGtncFRLVEs5WG9V?=
 =?utf-8?B?S09yMTVoRkFwVHpYdGF0dkdYZ3dkRTB4NTB2OFdyUk9JMUZ6YUNjbEV0SXdl?=
 =?utf-8?B?VFlhWFJwVlc4cHNvMkVKZFdhK2d2cHNPY2NrSnh1TGIyR1ZwWXV2S1JoTXR3?=
 =?utf-8?B?M2FtSWkzTFUramE3RmFOeWVaMFQ3cVM2Y3ptQkFxK04vWXBseUUrRHh2OVJp?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156f0084-4700-43a4-bb92-08dc231e5e62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 12:07:32.2004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnvVIoIvs/Q4A/2Wg/SQOQKrZuvFsvrM7zDxOICYZ0mE8Yn4c/aqJCgUL3+rVN1uH6qD5GSeL6YPHtWm1CztdLWWaXTn3yawOqG9oabKekI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
X-Proofpoint-ORIG-GUID: PHHsujLTDk73qpsfYYQryz-CuKnyZmcZ
X-Proofpoint-GUID: LABBa7puUNw0rdzNr3yzONcYRNLJUPJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 12:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108517

On 09-01-2024 15:32, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> The delta between 3.8.5 & 3.8.6 contains the CVE-2023-47627 fix and other bugfixes.
> https://github.com/aio-libs/aiohttp/security/advisories/GHSA-gfw2-4jvh-wgfg
>
> Changelog:
> ----------
> https://docs.aiohttp.org/en/stable/changes.html#id72
>
> The git log --oneline v3.8.5..v3.8.6 shows:
>
> 996de262 (tag: v3.8.6) Release v3.8.6 (#7668)
> 8c128d4f [PR #7651/45f98b7d backport][3.8] Fix BadStatusLine message (#7666)
> 89b7df15 Allow lax response parsing on Py parser (#7663) (#7664)
> d5c12ba8 [PR #7661/85713a48 backport][3.8] Update Python parser for RFCs 9110/9112 (#7662)
> 8a3977ac [PR #7272/b2a7983a backport][3.8] Fix Read The Docs config (#7650)
> bcc416e5 [PR #7647/1303350e backport][3.8] Upgrade to llhttp 9.1.3 (#7648)
> b30c0cd2 Remove chardet/charset-normalizer. (#7589)
> 5946c743 CookieJar - return 'best-match' and not LIFO (#7577) (#7588)
> 8c4ec62f [PR #7518/8bd42e74 backport][3.8] Fix GunicornWebWorker max_requests_jitter not work (#7519)
> a0d234df Use lenient headers for response parser (#7490) (#7492)
> f92b27b0 Update to LLHTTP 9 (#7485) (#7487)
> 8129d26f [PR #7480/1fb06bbc backport][3.8] Fix error pointer on linebreaks (#7482)
> 8d701c3d Fix PermissionError when loading .netrc (#7237) (#7378) (#7395)
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.5.bb => python3-aiohttp_3.8.6.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> index d04279ed97..f8ca9a4739 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.6.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
>   
> -SRC_URI[sha256sum] = "b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc"
> +SRC_URI[sha256sum] = "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
>   
>   PYPI_PACKAGE = "aiohttp"
>   inherit python_setuptools_build_meta pypi
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108185): https://lists.openembedded.org/g/openembedded-devel/message/108185
> Mute This Topic: https://lists.openembedded.org/mt/103617147/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
Gentle Reminder !!

../Narpat

