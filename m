Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C6AC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 13:55:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5256.1647006928579380695
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jdsusd/J;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0069805b99=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22BDrsls018272
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:55:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=lpPsy4Q6jrTQ4vG0KfTNHoQ3uNQ8dFQ7Fbf0jhcsh8o=;
 b=Jdsusd/Jhp72VyJ+/XLRpFARtS4ehNGNFYJlT46L52UcZ7NrlhJCt+MnpB41RRnigSaL
 pQJIZ4oPsG4kFcR4aGIrQpOty9ijQNLScg23hI+ogoHLKzfulzkE7lsJW+FM8A1qobO1
 yiVhUZ924uLvQn4bYTfS4AMcee+e9kuVIHp8pRWTveYyWdZ+ix8E+8Nmr6yH+iwLzRMF
 ds4Y8iDIlUpvrOgulsH1fyGD34/aOiNpAcHuzk6IM11pZTePxZ1/U6m7+JmRBXCEdM58
 MH+Zwama8mwygSz9lmA7dm4ole/5ncloHqe58LABi8To4a8Snc7LgcyFdcBuAL18Hsix ew==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3enew6uy3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:55:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+bqQ6gytCrQ0vJNgkx9Au/ggB92g7X7ztEFZORykc4WHJhvqZBVkCfoHY2zMT2LIs+EJN0gs+W/ATRPq1PWii/wqDcsJwElO2m5rx00nZubzaxTLsIHXNcPjH2VzybW2KfpWEyVKoGy0i3yW8zxSsadTLZNPh6BGFQMafoBo2KonZmCb+yi4o+9GLfqQE6q2du3lRXMe2f9UtaTz6Lljz57RSEcFcPO3zdmNdcJqJUdJ1cQ9emoUap833WzlbTZGFriEmmWlYM+veBzfP4kbHUkxfscQdQB+jN9g+5XvM5qh9xFWFrqbPOmxzKhSdOfhEug03E8gVik83NRFr9MDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpPsy4Q6jrTQ4vG0KfTNHoQ3uNQ8dFQ7Fbf0jhcsh8o=;
 b=Qxb+DhYkpWv5dd8WXn2xqdSnfB1bFoJeYn4rtH9z5ksiB9WKx0zPoh5/OzzYRfrfAMiVE8XyNCeE0OZyiSL1LS6Ga/PGLsqke4ZuljDYfsph4BAvZJmYjMquO1vuoJd6aj7gWDGfN4mELpCIMmhR7sM41faS5SJPasMxtcydx6KaCM28uxNJG8I6ixv0a1HjAK8rbKAAi1lbTogNyrlkMW4aIu+800L5qrVKS6K+3eBYHRPSBQMr/fesHu/83HPKl4bP8wWlxCxcw2AjXtMzR0GBrHZCY8MQNlj1Sss9Z/y6Jd22SSv+7f/k1KXRoQBJBHdQtsOA/6lTOvqk6rSbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:17f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 13:55:24 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::5d2f:3638:aae8:1f80%7]) with mapi id 15.20.5061.021; Fri, 11 Mar 2022
 13:55:24 +0000
Subject: Re: [oe] [hardknott][PATCH 2/2] expat: fix CVE-2022-25236
From: Kai <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20220311134659.2413-1-kai.kang@windriver.com>
 <16DB579EC5E8403D.30380@lists.openembedded.org>
Message-ID: <eb04e1df-45be-14da-6303-e793e8f08ec2@windriver.com>
Date: Fri, 11 Mar 2022 21:55:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <16DB579EC5E8403D.30380@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------8C29846967500AC20C7564A8"
Content-Language: en-US
X-ClientProxiedBy: SL2P216CA0142.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::21) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed4d397-ee5e-44be-6e96-08da0366ca2e
X-MS-TrafficTypeDiagnostic: LV2PR11MB5973:EE_
X-Microsoft-Antispam-PRVS: 
	<LV2PR11MB5973191F57EC75BB5EC26855950C9@LV2PR11MB5973.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M74EmApokIlHwC7LyPM6dDXc35W2uLK58qI03UcvibspdjimBaGexN1b7Nr5AC3RRy5EtIBJvzjS6mG2B+OatzqUm5lDZMz4/MHkW4crMhaee5u4Rgm7fyttU+rwarwuBR4G3oMCwMKe+ULMF6yw0iVuvYbVOr9kaYBpJx2NKJCgJRzCCnkG95zYWYMF1InAKkQnpnwh4lb/szlSo3/MVjKBG/zDvdB6iAiD3x8adl41HYu7WTLDhQIhIgsPvTi8rueZiLvKqOgUcQ6JO+KKR7HobsCd1Q4lAKKk0FfHPDcEfLROZYpKCrDgcgRIMUlZeygb25d/Yhi25W4U8GL8J5XCP1v322yVqA1TBLWItb57PRq/07f0Bp7Royng8Y9Id7G4nE2Pxh9U7r4cMYoWIqdtkQ/pZoS2q4k86URxFc3+13ourMO9jCt0offRuMJeTC0Wv1LuVndHHv8tAFPsQSRfT8motQGTfAaLzZIq9tDjemJuvcNjnCPKG4318kewLlByDwB6Mw7Q65wTLMXLkbOMB8cdjPMC7uTGxPp79HBcUyyGjaRfihGdcMcldEOzNm7FDduMdiZCIfYdHf8kSFhaIr+aUN8TSoBKDWIC4dEC8b+qbEpFFSvhBO0m0GBxBi4T0wLRZuoVlNFhthhT+dSG1FC53/3USlLzwnR0dCeroUHaWPkxKsf0zJVbffwzX2iP93a/nHKg12Ccl4LyZ/DEgk0iOxpvnFsjLbvtlikrXV3GVqggVb550ChMgTE/cd0rP2PFQ9/FsSIiXl0Po7AcQm2FkzoOa8+EQ2QaAc12gtm09g3j28mjaIFVIDgkgvaC9hvzRG+v0d/QwF+tg473HSdtOk8sv2NTEDivo1EFW6QQZ8zFrAhExpCNWFOG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(508600001)(66556008)(38350700002)(966005)(31686004)(36756003)(166002)(6486002)(26005)(186003)(8936002)(66476007)(86362001)(31696002)(83380400001)(53546011)(52116002)(66946007)(316002)(6506007)(6916009)(33964004)(6512007)(6666004)(2616005)(8676002)(30864003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDJqb3BaQzVVbXBMeWp6QldiMTc4YWlXaDdsNXJzcHBNdVUrSjJianh0K3lH?=
 =?utf-8?B?YTBDVHpkclAzeW5ZdVBEMEhMbTNYT08vWWJnOE0rOGViR2wwU1VMRkgvQ1lx?=
 =?utf-8?B?M2plVHgxSWpnYjQvbC9mWTdSUEptWGgrVTdCSW9hL0ZJVEdQcjJNZ0ZQMUZi?=
 =?utf-8?B?d2EvdFVzTHUwR05kelA3ZGZYUnZCVVhmTjIxUER3ZjZZclV0K0F4YkJuSHJs?=
 =?utf-8?B?Uk42L0x3NUVYTFJtSHRVTjB0V3pXRDJrb0FTTGFLSHNpRU96RG9ucXVONG1T?=
 =?utf-8?B?SVFVeVQ2ZVhlbHRJekpuR0x0SElxUG5hYS9reVZUNGdRek0vKzVsUi8xUGR5?=
 =?utf-8?B?VS9ERjRZeDlySmIxNnV6U0diNUVQM2htcmFIazdhb2hBdGl2RjErR1RCbEk1?=
 =?utf-8?B?RUx6VWxGeFUrcWd3Q21TaXhsZWF6Qk5jMXJQMndKWC9kOUQ5NGNjcU9PME0x?=
 =?utf-8?B?bUJLYkl5MlNGVmVCckxBRnhBbVBKQ3JLQlJUaWV2VFhwNzdXY3pWS0U3QmJQ?=
 =?utf-8?B?YlhkVXQram9kcFdpMWUzdjdwTVgvZGpOa3JpR1BGTGNoMGFpWnBuY2Zzam40?=
 =?utf-8?B?MzYrcFVDRFNYUDE0L0FMOFkxVkNCdjV1aHh3R3BONmpsbHFERTZTV2pHWGg5?=
 =?utf-8?B?aU1rK0FSaG4vQUdJSVd3N1JQZG1DQkRKVmVBdUwxTWcyYUFDZEJONUNhcFEr?=
 =?utf-8?B?b0d0UlIrTE5RV1lDR1dLMlJ6RzZuVkRRZTFGNnRKaXRqTktmU2ZkbUNHRFp2?=
 =?utf-8?B?bld4TlhPbmwvTkxOSlU1V3JjSTNheEtETHdYdlVyL2V1cUp4L1BMdUZRSkp4?=
 =?utf-8?B?bjhyeUtlNXhxMVlWcDc1Mk5YQTRMZ1lnWmljeFE5ZkgwUHRhaGd4OU5uZlZt?=
 =?utf-8?B?V2dHVGpXZVlwbGlST1UxVk54V3U3SXlsNks3SGZJRGRsUDJFSlYxdGJzbzd3?=
 =?utf-8?B?U1F3WE5UZUJxZ2pHVEQzUWE1NzJ6c0F3VnhLMU1Zc2tnUDdxa0o2WGxMTGhE?=
 =?utf-8?B?MjFOVGhiWTRqODNJd0NibjNuUUd3a3NHUFJSVmQ5REU2UyszNytwL08xT0pz?=
 =?utf-8?B?QjYzUFU3SGoxemFtdk9YZjdFRUF2M0NTL3pEUUxFTWtOUXVZVFNGZHNZYzVi?=
 =?utf-8?B?S1RUZy9VVHcrdGFmd2hLNE1wbTF3eDBZQnVUOGYwK1oreFQyLy9LNzQvbkRP?=
 =?utf-8?B?a0VrYitZb0xDMnk2bjQxT1E1SDF4dGdNZ1VibHdWWE12Mnh0TGRUc2hML2lq?=
 =?utf-8?B?WUZJdEhMZlhQNEh5SzNISldpOTRzdmI5OTE1N2F3clBZU1BOZHhEdVd5WEJx?=
 =?utf-8?B?R0lLREpVOU5mQ1JyZFVUV3pTL2NLYmw1aWUxdS94azNYcmlIaUQ0ZXNXUnQz?=
 =?utf-8?B?N1ZodHIzcmFxdGtxQVlYYU1ydWcza3MvTlZ0Ym90QkdWM25kbzkrdHI0Z1NT?=
 =?utf-8?B?d1AvZkZUME4wOU92UjNaWDgyWE8wNk5mNnJXakNoZG9WMVVlVUVoWTM3RDBX?=
 =?utf-8?B?cmdsLzZOVTU4NEMxNndXTDNTVFpMSnowdW9oSXE4YUsxbUZIcFMzUSt2T0Z5?=
 =?utf-8?B?cUhYTEVBR1JyKzFjSEhGRGxzYzAyenFWU3lIclN0Vk9YSmxQOVZjbHoxZm84?=
 =?utf-8?B?YUFCbjJtNW05UWxCUmttRGRZbVlyeGFmMVRGV3o3bVl5YkQvR2p0cXdOcGZt?=
 =?utf-8?B?eXg2VWFQRGJheUdlekhsQjdsUUZDUXFLTDVLczh6Rm9hUFZSL2kxdlkyVllN?=
 =?utf-8?B?aVNHSWNrck45b2ZkS2JHZzU3WGQvZW1UNUQzT2kzYkJiUjFVK0tWQTROemM2?=
 =?utf-8?B?M3hHWmY0bThOcENrenpVWXVsN1lRN2ZPTVBlcFRCRjhLeWo0OVUydDJtQUJW?=
 =?utf-8?B?c20wSFRNZ2FwQi80bXpZT3QybFd1Qk1KSUs4aTZ5VCtuR0UzOWNtY0laRnRH?=
 =?utf-8?B?SUNPTTZtUDQxQWxCWmdvcnlTZ3g3RVNTaHI1N28yRms4Y2dQQlFsU2VQSHpF?=
 =?utf-8?B?RXBOU0U3YUFhemV6c29pTjB5L2p5ZE9ibUZDZnZYZFNYeHF2aHhQVndMdGU4?=
 =?utf-8?B?ZkJ3Q3pBVkg4UXhDTEtQY1B5WmJMWHRHQ1RzZS8vRnNRT0Nqandjc1FTV2Ju?=
 =?utf-8?B?WStROWM2eHhQb09zT2llYm1kc0VGenMrR0VHRjEreStsbWNHaS9pb01oTzkr?=
 =?utf-8?Q?2nFJFyCIoScGhpXm5HRwVqM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ed4d397-ee5e-44be-6e96-08da0366ca2e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 13:55:24.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g7fbiz21RCzW2jxT4ykYstURZo/xbAH4yDByPVww1hm3vM5L1btFxeE7emRvIzplAsfC7y5oY1Hta4nhYpXSeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
X-Proofpoint-ORIG-GUID: nSvN0tr-rVSzINSOPmRPsE8yfVkGSDg8
X-Proofpoint-GUID: nSvN0tr-rVSzINSOPmRPsE8yfVkGSDg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_06,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 13:55:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95951

--------------8C29846967500AC20C7564A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/22 9:46 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patches to fix CVE-2022-25236 for expat.
>
> CVE: CVE-2022-25236
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Ooooops. Wrong mailllist.

Sorry for inconvenience.

Kai

> ---
>   .../expat/expat/CVE-2022-25236-1.patch        | 116 +++++++++
>   .../expat/expat/CVE-2022-25236-2.patch        | 232 ++++++++++++++++++
>   meta/recipes-core/expat/expat_2.2.10.bb       |   2 +
>   3 files changed, 350 insertions(+)
>   create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
>   create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
> new file mode 100644
> index 0000000000..ab53d99c8f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
> @@ -0,0 +1,116 @@
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2cc97e87]
> +CVE: CVE-2022-25236
> +
> +The commit is a merge commit, and this patch is created by:
> +
> +$ git diff -p --stat 2cc97e87~ 2cc97e87
> +
> +Remove modification for expat/Changes which fails to be applied.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +commit 2cc97e875ef84da4bcf55156c83599116f7523b4 (from d477fdd284468f2ab822024e75702f2c1b254f42)
> +Merge: d477fdd2 e4d7e497
> +Author: Sebastian Pipping <sebastian@pipping.org>
> +Date:   Fri Feb 18 18:01:27 2022 +0100
> +
> +    Merge pull request #561 from libexpat/namesep-security
> +
> +    [CVE-2022-25236] lib: Protect against insertion of namesep characters into namespace URIs
> +
> +---
> + expat/Changes          | 16 ++++++++++++++++
> + expat/lib/xmlparse.c   | 17 +++++++++++++----
> + expat/tests/runtests.c | 30 ++++++++++++++++++++++++++++++
> + 3 files changed, 59 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 7376aab1..c98e2e9f 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -718,8 +718,7 @@ XML_ParserCreate(const XML_Char *encodingName) {
> +
> + XML_Parser XMLCALL
> + XML_ParserCreateNS(const XML_Char *encodingName, XML_Char nsSep) {
> +-  XML_Char tmp[2];
> +-  *tmp = nsSep;
> ++  XML_Char tmp[2] = {nsSep, 0};
> +   return XML_ParserCreate_MM(encodingName, NULL, tmp);
> + }
> +
> +@@ -1344,8 +1343,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
> +      would be otherwise.
> +   */
> +   if (parser->m_ns) {
> +-    XML_Char tmp[2];
> +-    *tmp = parser->m_namespaceSeparator;
> ++    XML_Char tmp[2] = {parser->m_namespaceSeparator, 0};
> +     parser = parserCreate(encodingName, &parser->m_mem, tmp, newDtd);
> +   } else {
> +     parser = parserCreate(encodingName, &parser->m_mem, NULL, newDtd);
> +@@ -3761,6 +3759,17 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
> +     if (! mustBeXML && isXMLNS
> +         && (len > xmlnsLen || uri[len] != xmlnsNamespace[len]))
> +       isXMLNS = XML_FALSE;
> ++
> ++    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
> ++    //       we have to at least make sure that the XML processor on top of
> ++    //       Expat (that is splitting tag names by namespace separator into
> ++    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
> ++    //       by an attacker putting additional namespace separator characters
> ++    //       into namespace declarations.  That would be ambiguous and not to
> ++    //       be expected.
> ++    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)) {
> ++      return XML_ERROR_SYNTAX;
> ++    }
> +   }
> +   isXML = isXML && len == xmlLen;
> +   isXMLNS = isXMLNS && len == xmlnsLen;
> +diff --git a/tests/runtests.c b/tests/runtests.c
> +index d07203f2..bc5344b1 100644
> +--- a/tests/runtests.c
> ++++ b/tests/runtests.c
> +@@ -7220,6 +7220,35 @@ START_TEST(test_ns_double_colon_doctype) {
> + }
> + END_TEST
> +
> ++START_TEST(test_ns_separator_in_uri) {
> ++  struct test_case {
> ++    enum XML_Status expectedStatus;
> ++    const char *doc;
> ++  };
> ++  struct test_case cases[] = {
> ++      {XML_STATUS_OK, "<doc xmlns='one_two' />"},
> ++      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />"},
> ++  };
> ++
> ++  size_t i = 0;
> ++  size_t failCount = 0;
> ++  for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
> ++    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
> ++    XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
> ++    if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
> ++                  /*isFinal*/ XML_TRUE)
> ++        != cases[i].expectedStatus) {
> ++      failCount++;
> ++    }
> ++    XML_ParserFree(parser);
> ++  }
> ++
> ++  if (failCount) {
> ++    fail("Namespace separator handling is broken");
> ++  }
> ++}
> ++END_TEST
> ++
> + /* Control variable; the number of times duff_allocator() will successfully
> +  * allocate */
> + #define ALLOC_ALWAYS_SUCCEED (-1)
> +@@ -11905,6 +11934,7 @@ make_suite(void) {
> +   tcase_add_test(tc_namespace, test_ns_utf16_doctype);
> +   tcase_add_test(tc_namespace, test_ns_invalid_doctype);
> +   tcase_add_test(tc_namespace, test_ns_double_colon_doctype);
> ++  tcase_add_test(tc_namespace, test_ns_separator_in_uri);
> +
> +   suite_add_tcase(s, tc_misc);
> +   tcase_add_checked_fixture(tc_misc, NULL, basic_teardown);
> diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
> new file mode 100644
> index 0000000000..0f14c9631b
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
> @@ -0,0 +1,232 @@
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f178826b]
> +CVE: CVE-2022-25236
> +
> +The commit is a merge commit, and this patch is created by:
> +
> +$ git show -m -p --stat f178826b
> +
> +Remove changes for expat/Changes and reference.html which fail to be applied.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +commit f178826bb1e9c8ee23202f1be55ad4ac7b649e84 (from c99e0e7f2b15b48848038992ecbb4480f957cfe9)
> +Merge: c99e0e7f 9579f7ea
> +Author: Sebastian Pipping <sebastian@pipping.org>
> +Date:   Fri Mar 4 18:43:39 2022 +0100
> +
> +    Merge pull request #577 from libexpat/namesep
> +
> +    lib: Relax fix to CVE-2022-25236 with regard to RFC 3986 URI characters (fixes #572)
> +---
> + expat/Changes            |  16 ++++++
> + expat/doc/reference.html |   8 +++
> + expat/lib/expat.h        |  11 ++++
> + expat/lib/xmlparse.c     | 139 ++++++++++++++++++++++++++++++++++++++++++++---
> + expat/tests/runtests.c   |   8 ++-
> + 5 files changed, 171 insertions(+), 11 deletions(-)
> +
> +diff --git a/lib/expat.h b/lib/expat.h
> +index 5ab493f7..181fc960 100644
> +--- a/lib/expat.h
> ++++ b/lib/expat.h
> +@@ -239,6 +239,17 @@ XML_ParserCreate(const XML_Char *encoding);
> +    and the local part will be concatenated without any separator.
> +    It is a programming error to use the separator '\0' with namespace
> +    triplets (see XML_SetReturnNSTriplet).
> ++   If a namespace separator is chosen that can be part of a URI or
> ++   part of an XML name, splitting an expanded name back into its
> ++   1, 2 or 3 original parts on application level in the element handler
> ++   may end up vulnerable, so these are advised against;  sane choices for
> ++   a namespace separator are e.g. '\n' (line feed) and '|' (pipe).
> ++
> ++   Note that Expat does not validate namespace URIs (beyond encoding)
> ++   against RFC 3986 today (and is not required to do so with regard to
> ++   the XML 1.0 namespaces specification) but it may start doing that
> ++   in future releases.  Before that, an application using Expat must
> ++   be ready to receive namespace URIs containing non-URI characters.
> + */
> + XMLPARSEAPI(XML_Parser)
> + XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator);
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 59da19c8..6fe2cf1e 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3705,6 +3705,117 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
> +   return XML_ERROR_NONE;
> + }
> +
> ++static XML_Bool
> ++is_rfc3986_uri_char(XML_Char candidate) {
> ++  // For the RFC 3986 ANBF grammar see
> ++  // https://datatracker.ietf.org/doc/html/rfc3986#appendix-A
> ++
> ++  switch (candidate) {
> ++  // From rule "ALPHA" (uppercase half)
> ++  case 'A':
> ++  case 'B':
> ++  case 'C':
> ++  case 'D':
> ++  case 'E':
> ++  case 'F':
> ++  case 'G':
> ++  case 'H':
> ++  case 'I':
> ++  case 'J':
> ++  case 'K':
> ++  case 'L':
> ++  case 'M':
> ++  case 'N':
> ++  case 'O':
> ++  case 'P':
> ++  case 'Q':
> ++  case 'R':
> ++  case 'S':
> ++  case 'T':
> ++  case 'U':
> ++  case 'V':
> ++  case 'W':
> ++  case 'X':
> ++  case 'Y':
> ++  case 'Z':
> ++
> ++  // From rule "ALPHA" (lowercase half)
> ++  case 'a':
> ++  case 'b':
> ++  case 'c':
> ++  case 'd':
> ++  case 'e':
> ++  case 'f':
> ++  case 'g':
> ++  case 'h':
> ++  case 'i':
> ++  case 'j':
> ++  case 'k':
> ++  case 'l':
> ++  case 'm':
> ++  case 'n':
> ++  case 'o':
> ++  case 'p':
> ++  case 'q':
> ++  case 'r':
> ++  case 's':
> ++  case 't':
> ++  case 'u':
> ++  case 'v':
> ++  case 'w':
> ++  case 'x':
> ++  case 'y':
> ++  case 'z':
> ++
> ++  // From rule "DIGIT"
> ++  case '0':
> ++  case '1':
> ++  case '2':
> ++  case '3':
> ++  case '4':
> ++  case '5':
> ++  case '6':
> ++  case '7':
> ++  case '8':
> ++  case '9':
> ++
> ++  // From rule "pct-encoded"
> ++  case '%':
> ++
> ++  // From rule "unreserved"
> ++  case '-':
> ++  case '.':
> ++  case '_':
> ++  case '~':
> ++
> ++  // From rule "gen-delims"
> ++  case ':':
> ++  case '/':
> ++  case '?':
> ++  case '#':
> ++  case '[':
> ++  case ']':
> ++  case '@':
> ++
> ++  // From rule "sub-delims"
> ++  case '!':
> ++  case '$':
> ++  case '&':
> ++  case '\'':
> ++  case '(':
> ++  case ')':
> ++  case '*':
> ++  case '+':
> ++  case ',':
> ++  case ';':
> ++  case '=':
> ++    return XML_TRUE;
> ++
> ++  default:
> ++    return XML_FALSE;
> ++  }
> ++}
> ++
> + /* addBinding() overwrites the value of prefix->binding without checking.
> +    Therefore one must keep track of the old value outside of addBinding().
> + */
> +@@ -3763,14 +3874,26 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
> +         && (len > xmlnsLen || uri[len] != xmlnsNamespace[len]))
> +       isXMLNS = XML_FALSE;
> +
> +-    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
> +-    //       we have to at least make sure that the XML processor on top of
> +-    //       Expat (that is splitting tag names by namespace separator into
> +-    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
> +-    //       by an attacker putting additional namespace separator characters
> +-    //       into namespace declarations.  That would be ambiguous and not to
> +-    //       be expected.
> +-    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)) {
> ++    // NOTE: While Expat does not validate namespace URIs against RFC 3986
> ++    //       today (and is not REQUIRED to do so with regard to the XML 1.0
> ++    //       namespaces specification) we have to at least make sure, that
> ++    //       the application on top of Expat (that is likely splitting expanded
> ++    //       element names ("qualified names") of form
> ++    //       "[uri sep] local [sep prefix] '\0'" back into 1, 2 or 3 pieces
> ++    //       in its element handler code) cannot be confused by an attacker
> ++    //       putting additional namespace separator characters into namespace
> ++    //       declarations.  That would be ambiguous and not to be expected.
> ++    //
> ++    //       While the HTML API docs of function XML_ParserCreateNS have been
> ++    //       advising against use of a namespace separator character that can
> ++    //       appear in a URI for >20 years now, some widespread applications
> ++    //       are using URI characters (':' (colon) in particular) for a
> ++    //       namespace separator, in practice.  To keep these applications
> ++    //       functional, we only reject namespaces URIs containing the
> ++    //       application-chosen namespace separator if the chosen separator
> ++    //       is a non-URI character with regard to RFC 3986.
> ++    if (parser->m_ns && (uri[len] == parser->m_namespaceSeparator)
> ++        && ! is_rfc3986_uri_char(uri[len])) {
> +       return XML_ERROR_SYNTAX;
> +     }
> +   }
> +diff --git a/tests/runtests.c b/tests/runtests.c
> +index 60da868e..712706c4 100644
> +--- a/tests/runtests.c
> ++++ b/tests/runtests.c
> +@@ -7406,16 +7406,18 @@ START_TEST(test_ns_separator_in_uri) {
> +   struct test_case {
> +     enum XML_Status expectedStatus;
> +     const char *doc;
> ++    XML_Char namesep;
> +   };
> +   struct test_case cases[] = {
> +-      {XML_STATUS_OK, "<doc xmlns='one_two' />"},
> +-      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />"},
> ++      {XML_STATUS_OK, "<doc xmlns='one_two' />", XCS('\n')},
> ++      {XML_STATUS_ERROR, "<doc xmlns='one&#x0A;two' />", XCS('\n')},
> ++      {XML_STATUS_OK, "<doc xmlns='one:two' />", XCS(':')},
> +   };
> +
> +   size_t i = 0;
> +   size_t failCount = 0;
> +   for (; i < sizeof(cases) / sizeof(cases[0]); i++) {
> +-    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
> ++    XML_Parser parser = XML_ParserCreateNS(NULL, cases[i].namesep);
> +     XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
> +     if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
> +                   /*isFinal*/ XML_TRUE)
> diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
> index 0b3331981c..f99fa7edb6 100644
> --- a/meta/recipes-core/expat/expat_2.2.10.bb
> +++ b/meta/recipes-core/expat/expat_2.2.10.bb
> @@ -18,6 +18,8 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
>              file://CVE-2022-23852.patch \
>              file://CVE-2022-23990.patch \
>              file://CVE-2022-25235.patch \
> +           file://CVE-2022-25236-1.patch \
> +           file://CVE-2022-25236-2.patch \
>              "
>   
>   UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95950): https://lists.openembedded.org/g/openembedded-devel/message/95950
> Mute This Topic: https://lists.openembedded.org/mt/89710285/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


--------------8C29846967500AC20C7564A8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/11/22 9:46 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16DB579EC5E8403D.30380@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Backport patches to fix CVE-2022-25236 for expat.

CVE: CVE-2022-25236

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    <p>Ooooops. Wrong mailllist.</p>
    <p>Sorry for inconvenience.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:16DB579EC5E8403D.30380@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
---
 .../expat/expat/CVE-2022-25236-1.patch        | 116 +++++++++
 .../expat/expat/CVE-2022-25236-2.patch        | 232 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   2 +
 3 files changed, 350 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236-2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
new file mode 100644
index 0000000000..ab53d99c8f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25236-1.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/libexpat/libexpat/commit/2cc97e87">https://github.com/libexpat/libexpat/commit/2cc97e87</a>]
+CVE: CVE-2022-25236
+
+The commit is a merge commit, and this patch is created by:
+
+$ git diff -p --stat 2cc97e87~ 2cc97e87
+
+Remove modification for expat/Changes which fails to be applied.
+
+Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
+
+commit 2cc97e875ef84da4bcf55156c83599116f7523b4 (from d477fdd284468f2ab822024e75702f2c1b254f42)
+Merge: d477fdd2 e4d7e497
+Author: Sebastian Pipping <a class="moz-txt-link-rfc2396E" href="mailto:sebastian@pipping.org">&lt;sebastian@pipping.org&gt;</a>
+Date:   Fri Feb 18 18:01:27 2022 +0100
+
+    Merge pull request #561 from libexpat/namesep-security
+    
+    [CVE-2022-25236] lib: Protect against insertion of namesep characters into namespace URIs
+
+---
+ expat/Changes          | 16 ++++++++++++++++
+ expat/lib/xmlparse.c   | 17 +++++++++++++----
+ expat/tests/runtests.c | 30 ++++++++++++++++++++++++++++++
+ 3 files changed, 59 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7376aab1..c98e2e9f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -718,8 +718,7 @@ XML_ParserCreate(const XML_Char *encodingName) {
+ 
+ XML_Parser XMLCALL
+ XML_ParserCreateNS(const XML_Char *encodingName, XML_Char nsSep) {
+-  XML_Char tmp[2];
+-  *tmp = nsSep;
++  XML_Char tmp[2] = {nsSep, 0};
+   return XML_ParserCreate_MM(encodingName, NULL, tmp);
+ }
+ 
+@@ -1344,8 +1343,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser, const XML_Char *context,
+      would be otherwise.
+   */
+   if (parser-&gt;m_ns) {
+-    XML_Char tmp[2];
+-    *tmp = parser-&gt;m_namespaceSeparator;
++    XML_Char tmp[2] = {parser-&gt;m_namespaceSeparator, 0};
+     parser = parserCreate(encodingName, &amp;parser-&gt;m_mem, tmp, newDtd);
+   } else {
+     parser = parserCreate(encodingName, &amp;parser-&gt;m_mem, NULL, newDtd);
+@@ -3761,6 +3759,17 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     if (! mustBeXML &amp;&amp; isXMLNS
+         &amp;&amp; (len &gt; xmlnsLen || uri[len] != xmlnsNamespace[len]))
+       isXMLNS = XML_FALSE;
++
++    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
++    //       we have to at least make sure that the XML processor on top of
++    //       Expat (that is splitting tag names by namespace separator into
++    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
++    //       by an attacker putting additional namespace separator characters
++    //       into namespace declarations.  That would be ambiguous and not to
++    //       be expected.
++    if (parser-&gt;m_ns &amp;&amp; (uri[len] == parser-&gt;m_namespaceSeparator)) {
++      return XML_ERROR_SYNTAX;
++    }
+   }
+   isXML = isXML &amp;&amp; len == xmlLen;
+   isXMLNS = isXMLNS &amp;&amp; len == xmlnsLen;
+diff --git a/tests/runtests.c b/tests/runtests.c
+index d07203f2..bc5344b1 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -7220,6 +7220,35 @@ START_TEST(test_ns_double_colon_doctype) {
+ }
+ END_TEST
+ 
++START_TEST(test_ns_separator_in_uri) {
++  struct test_case {
++    enum XML_Status expectedStatus;
++    const char *doc;
++  };
++  struct test_case cases[] = {
++      {XML_STATUS_OK, &quot;&lt;doc xmlns='one_two' /&gt;&quot;},
++      {XML_STATUS_ERROR, &quot;&lt;doc xmlns='one&amp;#x0A;two' /&gt;&quot;},
++  };
++
++  size_t i = 0;
++  size_t failCount = 0;
++  for (; i &lt; sizeof(cases) / sizeof(cases[0]); i++) {
++    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
++    XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
++    if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
++                  /*isFinal*/ XML_TRUE)
++        != cases[i].expectedStatus) {
++      failCount++;
++    }
++    XML_ParserFree(parser);
++  }
++
++  if (failCount) {
++    fail(&quot;Namespace separator handling is broken&quot;);
++  }
++}
++END_TEST
++
+ /* Control variable; the number of times duff_allocator() will successfully
+  * allocate */
+ #define ALLOC_ALWAYS_SUCCEED (-1)
+@@ -11905,6 +11934,7 @@ make_suite(void) {
+   tcase_add_test(tc_namespace, test_ns_utf16_doctype);
+   tcase_add_test(tc_namespace, test_ns_invalid_doctype);
+   tcase_add_test(tc_namespace, test_ns_double_colon_doctype);
++  tcase_add_test(tc_namespace, test_ns_separator_in_uri);
+ 
+   suite_add_tcase(s, tc_misc);
+   tcase_add_checked_fixture(tc_misc, NULL, basic_teardown);
diff --git a/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
new file mode 100644
index 0000000000..0f14c9631b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-25236-2.patch
@@ -0,0 +1,232 @@
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/libexpat/libexpat/commit/f178826b">https://github.com/libexpat/libexpat/commit/f178826b</a>]
+CVE: CVE-2022-25236
+
+The commit is a merge commit, and this patch is created by:
+
+$ git show -m -p --stat f178826b
+
+Remove changes for expat/Changes and reference.html which fail to be applied.
+
+Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
+
+commit f178826bb1e9c8ee23202f1be55ad4ac7b649e84 (from c99e0e7f2b15b48848038992ecbb4480f957cfe9)
+Merge: c99e0e7f 9579f7ea
+Author: Sebastian Pipping <a class="moz-txt-link-rfc2396E" href="mailto:sebastian@pipping.org">&lt;sebastian@pipping.org&gt;</a>
+Date:   Fri Mar 4 18:43:39 2022 +0100
+
+    Merge pull request #577 from libexpat/namesep
+    
+    lib: Relax fix to CVE-2022-25236 with regard to RFC 3986 URI characters (fixes #572)
+---
+ expat/Changes            |  16 ++++++
+ expat/doc/reference.html |   8 +++
+ expat/lib/expat.h        |  11 ++++
+ expat/lib/xmlparse.c     | 139 ++++++++++++++++++++++++++++++++++++++++++++---
+ expat/tests/runtests.c   |   8 ++-
+ 5 files changed, 171 insertions(+), 11 deletions(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index 5ab493f7..181fc960 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -239,6 +239,17 @@ XML_ParserCreate(const XML_Char *encoding);
+    and the local part will be concatenated without any separator.
+    It is a programming error to use the separator '\0' with namespace
+    triplets (see XML_SetReturnNSTriplet).
++   If a namespace separator is chosen that can be part of a URI or
++   part of an XML name, splitting an expanded name back into its
++   1, 2 or 3 original parts on application level in the element handler
++   may end up vulnerable, so these are advised against;  sane choices for
++   a namespace separator are e.g. '\n' (line feed) and '|' (pipe).
++
++   Note that Expat does not validate namespace URIs (beyond encoding)
++   against RFC 3986 today (and is not required to do so with regard to
++   the XML 1.0 namespaces specification) but it may start doing that
++   in future releases.  Before that, an application using Expat must
++   be ready to receive namespace URIs containing non-URI characters.
+ */
+ XMLPARSEAPI(XML_Parser)
+ XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator);
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 59da19c8..6fe2cf1e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3705,6 +3705,117 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   return XML_ERROR_NONE;
+ }
+ 
++static XML_Bool
++is_rfc3986_uri_char(XML_Char candidate) {
++  // For the RFC 3986 ANBF grammar see
++  // <a class="moz-txt-link-freetext" href="https://datatracker.ietf.org/doc/html/rfc3986#appendix-A">https://datatracker.ietf.org/doc/html/rfc3986#appendix-A</a>
++
++  switch (candidate) {
++  // From rule &quot;ALPHA&quot; (uppercase half)
++  case 'A':
++  case 'B':
++  case 'C':
++  case 'D':
++  case 'E':
++  case 'F':
++  case 'G':
++  case 'H':
++  case 'I':
++  case 'J':
++  case 'K':
++  case 'L':
++  case 'M':
++  case 'N':
++  case 'O':
++  case 'P':
++  case 'Q':
++  case 'R':
++  case 'S':
++  case 'T':
++  case 'U':
++  case 'V':
++  case 'W':
++  case 'X':
++  case 'Y':
++  case 'Z':
++
++  // From rule &quot;ALPHA&quot; (lowercase half)
++  case 'a':
++  case 'b':
++  case 'c':
++  case 'd':
++  case 'e':
++  case 'f':
++  case 'g':
++  case 'h':
++  case 'i':
++  case 'j':
++  case 'k':
++  case 'l':
++  case 'm':
++  case 'n':
++  case 'o':
++  case 'p':
++  case 'q':
++  case 'r':
++  case 's':
++  case 't':
++  case 'u':
++  case 'v':
++  case 'w':
++  case 'x':
++  case 'y':
++  case 'z':
++
++  // From rule &quot;DIGIT&quot;
++  case '0':
++  case '1':
++  case '2':
++  case '3':
++  case '4':
++  case '5':
++  case '6':
++  case '7':
++  case '8':
++  case '9':
++
++  // From rule &quot;pct-encoded&quot;
++  case '%':
++
++  // From rule &quot;unreserved&quot;
++  case '-':
++  case '.':
++  case '_':
++  case '~':
++
++  // From rule &quot;gen-delims&quot;
++  case ':':
++  case '/':
++  case '?':
++  case '#':
++  case '[':
++  case ']':
++  case '@':
++
++  // From rule &quot;sub-delims&quot;
++  case '!':
++  case '$':
++  case '&amp;':
++  case '\'':
++  case '(':
++  case ')':
++  case '*':
++  case '+':
++  case ',':
++  case ';':
++  case '=':
++    return XML_TRUE;
++
++  default:
++    return XML_FALSE;
++  }
++}
++
+ /* addBinding() overwrites the value of prefix-&gt;binding without checking.
+    Therefore one must keep track of the old value outside of addBinding().
+ */
+@@ -3763,14 +3874,26 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+         &amp;&amp; (len &gt; xmlnsLen || uri[len] != xmlnsNamespace[len]))
+       isXMLNS = XML_FALSE;
+ 
+-    // NOTE: While Expat does not validate namespace URIs against RFC 3986,
+-    //       we have to at least make sure that the XML processor on top of
+-    //       Expat (that is splitting tag names by namespace separator into
+-    //       2- or 3-tuples (uri-local or uri-local-prefix)) cannot be confused
+-    //       by an attacker putting additional namespace separator characters
+-    //       into namespace declarations.  That would be ambiguous and not to
+-    //       be expected.
+-    if (parser-&gt;m_ns &amp;&amp; (uri[len] == parser-&gt;m_namespaceSeparator)) {
++    // NOTE: While Expat does not validate namespace URIs against RFC 3986
++    //       today (and is not REQUIRED to do so with regard to the XML 1.0
++    //       namespaces specification) we have to at least make sure, that
++    //       the application on top of Expat (that is likely splitting expanded
++    //       element names (&quot;qualified names&quot;) of form
++    //       &quot;[uri sep] local [sep prefix] '\0'&quot; back into 1, 2 or 3 pieces
++    //       in its element handler code) cannot be confused by an attacker
++    //       putting additional namespace separator characters into namespace
++    //       declarations.  That would be ambiguous and not to be expected.
++    //
++    //       While the HTML API docs of function XML_ParserCreateNS have been
++    //       advising against use of a namespace separator character that can
++    //       appear in a URI for &gt;20 years now, some widespread applications
++    //       are using URI characters (':' (colon) in particular) for a
++    //       namespace separator, in practice.  To keep these applications
++    //       functional, we only reject namespaces URIs containing the
++    //       application-chosen namespace separator if the chosen separator
++    //       is a non-URI character with regard to RFC 3986.
++    if (parser-&gt;m_ns &amp;&amp; (uri[len] == parser-&gt;m_namespaceSeparator)
++        &amp;&amp; ! is_rfc3986_uri_char(uri[len])) {
+       return XML_ERROR_SYNTAX;
+     }
+   }
+diff --git a/tests/runtests.c b/tests/runtests.c
+index 60da868e..712706c4 100644
+--- a/tests/runtests.c
++++ b/tests/runtests.c
+@@ -7406,16 +7406,18 @@ START_TEST(test_ns_separator_in_uri) {
+   struct test_case {
+     enum XML_Status expectedStatus;
+     const char *doc;
++    XML_Char namesep;
+   };
+   struct test_case cases[] = {
+-      {XML_STATUS_OK, &quot;&lt;doc xmlns='one_two' /&gt;&quot;},
+-      {XML_STATUS_ERROR, &quot;&lt;doc xmlns='one&amp;#x0A;two' /&gt;&quot;},
++      {XML_STATUS_OK, &quot;&lt;doc xmlns='one_two' /&gt;&quot;, XCS('\n')},
++      {XML_STATUS_ERROR, &quot;&lt;doc xmlns='one&amp;#x0A;two' /&gt;&quot;, XCS('\n')},
++      {XML_STATUS_OK, &quot;&lt;doc xmlns='one:two' /&gt;&quot;, XCS(':')},
+   };
+ 
+   size_t i = 0;
+   size_t failCount = 0;
+   for (; i &lt; sizeof(cases) / sizeof(cases[0]); i++) {
+-    XML_Parser parser = XML_ParserCreateNS(NULL, '\n');
++    XML_Parser parser = XML_ParserCreateNS(NULL, cases[i].namesep);
+     XML_SetElementHandler(parser, dummy_start_element, dummy_end_element);
+     if (XML_Parse(parser, cases[i].doc, (int)strlen(cases[i].doc),
+                   /*isFinal*/ XML_TRUE)
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 0b3331981c..f99fa7edb6 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -18,6 +18,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAfile://CVE-2022-23852.patch\file://CVE-2022-23990.patch\file://CVE-2022-25235.patch\+file://CVE-2022-25236-1.patch\+file://CVE-2022-25236-2.patch\">&quot;https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2022-23852.patch \
            file://CVE-2022-23990.patch \
            file://CVE-2022-25235.patch \
+           file://CVE-2022-25236-1.patch \
+           file://CVE-2022-25236-2.patch \
            &quot;</a>
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/libexpat/libexpat/releases/">&quot;https://github.com/libexpat/libexpat/releases/&quot;</a>
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95950): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/95950">https://lists.openembedded.org/g/openembedded-devel/message/95950</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/89710285/3616933">https://lists.openembedded.org/mt/89710285/3616933</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------8C29846967500AC20C7564A8--

