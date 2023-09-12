Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3DECA0EC9
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 05:51:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19039.1694497881108106636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Sep 2023 22:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZPAU7RHM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76197c91ce=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38C5fExn008390
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 05:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3Q+uPUinbrvXDP4coZR2bW8Hmcyz0iLBYYh/O3rV8/E=; b=
	ZPAU7RHMzAVtsT2Bjm+JKGlsyuHNztRsjviN1g0rVfs8p/uRj+LTUxoPzGB3dpFr
	//yLxUb1V7wr7nVIsU6j2AI0+PFVgv4GWBCkRJcU6KFoJHKtgSqdqItohUwjvguk
	BHH4TaJRhRtwrdSezA2gO/Go+cnnH5rsV/2HSDQJVTav3CQsy+rd8gIEuYvlsCRs
	r/BnHoPKgU3869h10iAxnvISrGG5uZrqdJdrDVqrrHN/DDURyljliq6kA5RBCVi6
	sc1gf4y7LixVRh6KdaCFBHBPQpFhz0M5rQjYWc+Phy8edGhfLMIQae4JZ83P35nR
	xbstsiZYdyEe3MzJzVIeMA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0fp62at0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 05:51:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q51MaeF8nFMX9RryOI+vg+Z7F46oM5Hi9Lv6FDauttT2vP47MIMiZ4xSBSRf82ja/K6tHswsJpCMV+wZFKKRrCK9L8qXy7JAwsT5jUpf9hw9JftgYNSd0LR+VuNdD4QXpx/qF2rZwM11geCBRwq9uDsVzUPh7otXSNtWzFHa+pNAMgUZzxURPj4t5NCpY1c/khEWtDt33TEB+zBTf/7jfONIxOdNjynML6llrLOZMax0Ce4jHJB588sRvl2Wjv6mhAm4rUj9hroewlPCa8EJv3WUe6rnhlBWvDR+tMpK+y+Q/DXlLLKvY1Bmy0+Y8Pgt514LAqWl48m7XgH2D5t7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q+uPUinbrvXDP4coZR2bW8Hmcyz0iLBYYh/O3rV8/E=;
 b=ciY4rdj1Q9lmszOBPUxTZ7CdOYSB05llI3P3FxHeOVr6+WbdiIAURDNYzgnA2cxoNSzZdNFMdvAKf0/dHYzn9Xs4XQGtS937nevjh3gJ7N1dndqcVyh3EC77ABxDLRvXtXAgo9q6Rtl7Lt83dC+0f3hsxhVtbDih2wBimsFFSlfYXG7b0BkgK2OVZRNNeLyV8agUOCHw/d0lEopz9k3jRI9+Vv1ySw7MWXRhyw8P+O77eXf2hHWAzdY8SzegxLWtrdCIup/aTa31H6d18LxU2vRDEZBw28E8v6cf1jJlSdLh8P+itcYKlj2zedMwJCabghK4QEwHmsPQiTPr/rgrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 05:51:17 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5bff:5ad8:a03:d92d]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5bff:5ad8:a03:d92d%3]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 05:51:16 +0000
Message-ID: <89b0ef89-3300-c43c-b3d0-ff6bf01ce27a@windriver.com>
Date: Tue, 12 Sep 2023 11:21:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe][meta-oe][mickledore][PATCH 1/1] poppler: fix CVE-2023-34872
To: openembedded-devel@lists.openembedded.org
References: <177C76728498A7D7.30507@lists.openembedded.org>
Content-Language: en-US
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <177C76728498A7D7.30507@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To BL0PR11MB3410.namprd11.prod.outlook.com
 (2603:10b6:208:33::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3410:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 8741356c-ad2a-4136-63f8-08dbb3544724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JR8vgq9OCa/hqcMGQQV+oon6nYbKCmedCcbieA1gbOrAvqL1EP6MaIDc8/XysRB0JeR93Eehb5GFLRc+YKJ0Npv+34DEXzNwmbhTYspGoIvcIaAbvo6sa7BmwHAaxC1XWvKmqFOX++NaAHshkuafLp1/sLR9vRpvhEpnU+5hA5kPToS4nlZKOGb/2Pvc5DVc1aW/TolHlW3G+noGkR5YxrEMzTKA4q8++ChmojKuTHRH2FhlksytR96ADujyT7XsVVLMD/rgRxiTteDsRMbEtWMCKhALSVvpNCAnp5u++d9AG24iDV7ivNQbKtsOTp/dxH88+LqdkqoL2/IN7hApwcvjHjBuIfTujQsATcFR+D4v4tz1vdfeARYMlIGStQuTumSyR9VQWnhhtMlhLr1AxBb7I0ZBEbqA6N9rTR69ZhLkDmVY7HWb2hNgOcVJK4PVnAI9ozhghc3cSQ48IM7nwfuBbfadxz1RP5Rvl0y8KNd2LDVQ1OR4L0e7YEKZ/fjw1y269pjMLeEoYqdLdkbTWsMs5H8CBWZNrrfsEtNClsn7/4ULyNOImUDAUvuu9NwYqiOK1Yw+v5RaaZMf4FwuoBxJY1+rawrm+VgazavAH51w5LboPxtneAJOijoBYTQGMcqRNLsfAox5SW//Ly9b4/scfqoOgKbpLNSkX0/pgUg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39850400004)(136003)(376002)(186009)(1800799009)(451199024)(53546011)(6486002)(41300700001)(6506007)(6916009)(66899024)(316002)(966005)(2906002)(478600001)(36756003)(86362001)(31696002)(38100700002)(66556008)(66946007)(6666004)(66476007)(83380400001)(2616005)(5660300002)(8936002)(8676002)(26005)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmpIcDZ6VmkxMzZPZE9SbkpFWGZSSmN4bk4ySDdYSklGcFBoRjAwSGtlUnF4?=
 =?utf-8?B?NzdoOUxaTHk0S0RqNUZmYUhWb2pBTTNWN0ZMWWR4US9WSDNVOXplNlVHNENp?=
 =?utf-8?B?WjRwUUZFcXJOa3krZmRKeE5QbGhlTTJNK1hKK1JIWW1kNUJibmI0anlnQXFT?=
 =?utf-8?B?SjVmblQrYm9ZcDdubEFKSjJDME5LNVVXQ3hHdE5qcG5IMlVjcjYrdmtXSlRR?=
 =?utf-8?B?cmRKWDR5MllNTDFXeWJyc2UxVVdWOHJMRXVUTFpuUzJjb2JmUWRTMFJTc2NN?=
 =?utf-8?B?UHI3KzZQM3AxUUdtZ0JLRU9YZVVHeUFIVlA1TVpicldrQnJKbUo4MjZCbEZs?=
 =?utf-8?B?My9NaEMwUHFBZ204UUduYVlXUzk3WlljT2RiMVlaWDZWOE9ZM2JVUVh1R0xy?=
 =?utf-8?B?VDZmNm0vVWJsRUlJZzFxL2tUY3RYYldJaGhTUFBUMEY1RUh5WnBrNkwydGZ0?=
 =?utf-8?B?NkV1a3VpOWtkOUxheFlqdWdLNXVlQ2wxeWxHOWJaOHYyeG9XM21ZMmFJbU44?=
 =?utf-8?B?WU9ZWG1oR3RPdG1uSDJkSFpJYzBxdUU1NHZQR2dXT0NSN2xMQ3VPZmUvTnZw?=
 =?utf-8?B?c0NHdXlvaGNXRGhEU3FTZ1kxSGdNV1FlWHk0bG85QStRNG9sbXNyU0tNbmgv?=
 =?utf-8?B?QVdONWJhbEFlcitYYm5XZWlEOEZLdmpubnIraThxelByR3hsaDBCZ0RvNnRD?=
 =?utf-8?B?V3lwMmUxb3lVM3kydjhHWW9McndVSU5mNDUwK0swMzhocmNaVXJiNmZMV29w?=
 =?utf-8?B?NkZDdVBsMlJDQWlRYXV5cS9ZMy9uOEx3Ym1RdFJHS2tjc1lHeXdDZytPZS9I?=
 =?utf-8?B?dkU4NThMYml0eWsvNE9CSGM4OGxMdUtVb1RQWi93Mlhzazk5VUxKd2RhbmJx?=
 =?utf-8?B?WHRkZnFiODBlK0d5YnRJcGVtMGNqN1A2ekdkTzZzc2tNZGFJR1RvelIzZzZl?=
 =?utf-8?B?SENhRmxKZ1R0aUU3RERUeFNkUEhBWFFZOWludk1XcG5JWXlzMndEQ21EZG54?=
 =?utf-8?B?a3l2b0VBSWxFMTg5cDRzNHZrMzcvOXEvWDBnWXVHZ2lWdGJLT0RodS9YeDd2?=
 =?utf-8?B?bFU0RFl6d2VrMnNaamE5Q0lITmZObHNHWmRUa0l3WDB2N1QwTzUvYU1VMm5L?=
 =?utf-8?B?eDlteG96eklIdmpET0VCWGx4bmUvV2pTQXE2c1JOVDhtdXNsUmxmVWkzZWxn?=
 =?utf-8?B?eXlBeDJkMkloSnBRb2txRE5IQVZLNmsyNDFtcmR0NFRCVDVuV0NuWjJ6K2xL?=
 =?utf-8?B?THdxQThKZUlOZTBtVndzTjlGK3dQTDQ4UEJwUU1WYVN6YkdqMWUyY3B2cnU4?=
 =?utf-8?B?V2EvdnRGN3NjdVpSWDhTajVoeTZNemNwZUZWT0g4MitPWXk4bW5TaUYySG9C?=
 =?utf-8?B?WUFTa1dtL2EwZHNMbTN2ejZVbm5YWFpDUG9seUVjTEN6cnpRRzRwM2x5WXpZ?=
 =?utf-8?B?QVpBOGRiTTJOakNJUTY2ek96QXRvWjRWUzhBdVlGWklUM25NdjZXWGFmaUFh?=
 =?utf-8?B?SUlLd1FBcy83alZ4a0F4OWtCcWRwMkxTWlo2VkFVZ1dUQVhvUFFFbkxiYXJ0?=
 =?utf-8?B?TUF4QW82cy94YmNXVW9GK2tPSXg2ZFNwREZqN3dpVmR0VDdNYlJrcG4zMUNN?=
 =?utf-8?B?enBPVEd2TVN4OGRqZlpJVlpCb0ZVam80eDkvcUxOR3BvK295L0t1elhjVnVN?=
 =?utf-8?B?bDVGTUxwMmxraXllT2dXNC9qdEZLL1owTnYyU09vLytlTjFIMEVNNktyYXZN?=
 =?utf-8?B?aXJZejcya2k2MXd4K09ldG1RMW5jeUpiRjZtZGh5VHZvR3BWUWp1ZG5COWhy?=
 =?utf-8?B?Nkc0VTR1TlE2RmdzblladnJaQ2lOdUlxV1FJRjhpbzd5ZUNyRzlzT1lCY0l2?=
 =?utf-8?B?U0xkb0QwaXYveGtSanc0SXAvWkFpMXVSeVBEQzlOZmFvenRqMk1JK1FYTkNW?=
 =?utf-8?B?bnZWNEo1bjBEMXo5a0dqRWxYT0Q1YXk5SDVWV3AzeDJoSWplMm9aUE02dUlh?=
 =?utf-8?B?blBsWmYxUmxrYURydnlTWE1OOVlNbllkZnFSMk43MThsZEFUYTlJZUwvZ0JJ?=
 =?utf-8?B?SHkrUlRpN2ljUE4vcVlsNVRUS21TaUtjQ3VrcXc5TCs0cjlvYS9rWWN5NTF4?=
 =?utf-8?B?V3ovbGdVWkxxTnlTMkI0bDc3VnhSeUk3Mk9jWDVtdElWMEdKUFhzYkFJUis1?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8741356c-ad2a-4136-63f8-08dbb3544724
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 05:51:15.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx6qiBC5LUIIMwau2TBTpkoz4C+AkRAK4k8ENjK2p/F6HGg8wEMhlUj97qx+/rMF1UC10BgzxucSpFc39jdKDviwPi6DSSZK9BOxQB+Ys2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-Proofpoint-ORIG-GUID: lqKE6pmoi28srP91s5C0ixygmsgK7Oql
X-Proofpoint-GUID: lqKE6pmoi28srP91s5C0ixygmsgK7Oql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=895 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309120049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 05:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104841

Gentle Reminder !!

../Yogita

On 18-08-2023 16:52, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> A vulnerability in Outline.cc for Poppler prior to 23.06.0
> allows a remote attacker to cause a Denial of Service (DoS)
> (crash) via a crafted PDF file in OutlineItem::open.
>
> Reference:
> https://gitlab.freedesktop.org/poppler/poppler/-/issues/1399
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   .../poppler/poppler/CVE-2023-34872.patch      | 46 +++++++++++++++++++
>   .../poppler/poppler_23.03.0.bb                |  1 +
>   2 files changed, 47 insertions(+)
>   create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
>
> diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
> new file mode 100644
> index 0000000000..69f164de96
> --- /dev/null
> +++ b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
> @@ -0,0 +1,46 @@
> +From 591235c8b6c65a2eee88991b9ae73490fd9afdfe Sep 17 00:00:00 2001
> +From: Albert Astals Cid <aacid@kde.org>
> +Date: Fri, 18 Aug 2023 09:17:07 +0000
> +Subject: [PATCH] OutlineItem::open: Fix crash on malformed files
> +
> +Fixes #1399
> +
> +CVE: CVE-2023-34872
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + poppler/Outline.cc | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/poppler/Outline.cc b/poppler/Outline.cc
> +index cbb6cb4..4c68be9 100644
> +--- a/poppler/Outline.cc
> ++++ b/poppler/Outline.cc
> +@@ -14,7 +14,7 @@
> + // under GPL version 2 or later
> + //
> + // Copyright (C) 2005 Marco Pesenti Gritti <mpg@redhat.com>
> +-// Copyright (C) 2008, 2016-2019, 2021 Albert Astals Cid <aacid@kde.org>
> ++// Copyright (C) 2008, 2016-2019, 2021, 2023 Albert Astals Cid <aacid@kde.org>
> + // Copyright (C) 2009 Nick Jones <nick.jones@network-box.com>
> + // Copyright (C) 2016 Jason Crain <jason@aquaticape.us>
> + // Copyright (C) 2017 Adrian Johnson <ajohnson@redneon.com>
> +@@ -483,8 +483,12 @@ void OutlineItem::open()
> + {
> +     if (!kids) {
> +         Object itemDict = xref->fetch(ref);
> +-        const Object &firstRef = itemDict.dictLookupNF("First");
> +-        kids = readItemList(this, &firstRef, xref, doc);
> ++        if (itemDict.isDict()) {
> ++            const Object &firstRef = itemDict.dictLookupNF("First");
> ++            kids = readItemList(this, &firstRef, xref, doc);
> ++        } else {
> ++            kids = new std::vector<OutlineItem *>();
> ++        }
> +     }
> + }
> +
> +--
> +2.35.5
> diff --git a/meta-oe/recipes-support/poppler/poppler_23.03.0.bb b/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
> index 165e155ec9..81e776d8f6 100644
> --- a/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
> @@ -7,6 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
>              file://0001-Do-not-overwrite-all-our-build-flags.patch \
>              file://basename-include.patch \
>              file://0001-cmake-Do-not-use-isystem.patch \
> +           file://CVE-2023-34872.patch \
>              "
>   SRC_URI[sha256sum] = "b04148bf849c1965ada7eff6be4685130e3a18a84e0cce73bf9bc472ec32f2b4"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104486): https://lists.openembedded.org/g/openembedded-devel/message/104486
> Mute This Topic: https://lists.openembedded.org/mt/100818299/7312273
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

