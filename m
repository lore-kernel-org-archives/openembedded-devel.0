Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D20C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:25:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6656.1690359899500767249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bp3q0+UD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6571062b1b=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q7V8P6029684
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 01:24:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=onBxzVnDfgPR/4a4iLia/3c7Jo2LF5kw02JEhOr/2k4=; b=
	bp3q0+UDt2cSGa5fI+z3uS6YacpVElYgQlLKMYcKvMngpm96cP2Y/wn9MeDuAgDI
	sIo1ilSs6O1QKp1kbHbZ+t7vlchrNsQupqafj4uGX9Tk2z27DIi+bns0u9QZVzWC
	BDuGEv2SVV5ZcjQ95M8ksXmpxWvMNzaVyGXaxcpPoSc/zvuUHorUy/faPE10AJ5f
	k43c17rF3TVATmS5hzdjc/aDNr5PDfksJ7MrRMTjc+963NX9gZPTeEQAFz8P+Cgp
	G1JUswtPsHr7nR0ixRXfwwQBnTVUI8iHGRFCsT+zkYqeQoRLBn0pk+vD7iSi/LQA
	HL4IjBddQ4FLW57Rg6tCTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad037h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 01:24:59 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36Q8Ow9a008955
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 01:24:58 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad037h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 01:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dvz9cOBQtfYji7OxBkh3rr4pHijrZqF7yFTLadXPco30Vec25X5ky9qe9NEb2lNcEHWqq9MX1V+VEcP3sQJFs33BI9YoepdEOGLY9klNlGFIL9XvZf1Ub4Nkoo5B/QWtdFz+uX0HMJHmUkpFmqZnfMKNT2COJFUJgwkRRTysh6H3GiTyvgaQpLKCATt0vujSa2Z42G/2fogfM20fvf2R1NHjElM9yL9uHSsD8bU7dKA1/cnWEjuZtSg3pni05OKZt/65+0jU8C52RnCWvj1fXa1uc1hzHiSNkkZg0XqGRc8beE/eirDEK79Rmlms815e/pM4yoJ928LPN4ndUKUFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onBxzVnDfgPR/4a4iLia/3c7Jo2LF5kw02JEhOr/2k4=;
 b=QOZ3eKxOD+0eJtOlhG6ui3J0auBluRFaID6E6PNN6LegpZaJFsTxOFGqtnpPKmePTo6Z1WCg4NCxhoc6DeRV9DW8i+gXH0nI33qUxU5nx49p4AFEfHFDM6A7Qnq9AfYU+xqna+CgHvJFoNVcE013R4Kzu/Dq5c6t8reaP3/ZJw5uk+zW2Luk5pG/dYnuxRuRtdDxiOsksG7WZma6RXFz/vwriXZKVC4JiDBzQG3v3XFPW2ribvXiR89QtlJ9Y5oEm4pR7RBbhDUd9nStVjY6NzxFOLR25CVxzaDVwNRNwuzXxQD9r/CYOw56tDr4zLstM6JFb+G2wyIZzS4DjnqWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 08:24:55 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:24:54 +0000
Message-ID: <7a24793c-b315-96c5-0a16-5c6e324cdcea@windriver.com>
Date: Wed, 26 Jul 2023 13:52:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 1/1] frr: fix for
 CVE-2023-31490
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <1771578B38F95F27.30314@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1771578B38F95F27.30314@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH7PR11MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a63232-d9af-47d3-d6e7-08db8db1ca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vuPQFbm3Ll2gxtfuZCle+TEv+hx+KYUst5gkCKqh3E+kb8ZJWEeyahH/nDwG7shvFc7EoGFV9eCDtHK6i6rJ7J3cm3hb51bn86iv1UzhTsZOahDWwmm4B4qN8vQyJ6dzwoyVG5kjFV8ZsC9leUgNIT8LSZaY+jTxDXwkc9OGjbUAlK7J0bxxl2f0T/leM9WcM9CHIaLzFRmj+2XQ63ah7kIGN0bNKbAZDynu+bUv8z2XwGeipFOA4ohAp1hodAzZKTLiM4mRSQIgYAew3l8gpdx5OvQyWGWEE9ncnjvvXVnIF91ORE/3U5W6meE97mMM+AKcE5N0XiV/7xd2qZI/AzQmTQlpehcSyNf9pHPV1Jn1A0ZLFhc+aTddzKDwFaMV8uJ/SHPNkSpYs67lFGATrQhFZmnl6JntbeOviDy5BthjfcT0Z+/osA0K+SaUwy2SsOZO5GVDzexqdlQY5D/asy7+Ft+jBu+AJQMdXR674rqvAw0Pocb8mehrX3Urv5JP4V3fJnXc4LwTm4JJlBWN6mLcBR2oCz1w3LE9m1uEqHMvaBHR845RJMjnqFys2Qydq4V19ch9tw614T6i6h9mNgABs6C+nebl2EG1YHrA20Tu7Pq6on/VdZL/5a4zDdEUMmkA+v/KSJ6p/+jUv4m2TWJ7vZpQOGrooKQRBh2OKor9cjIBq4z80KSdhmRGOFai
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(136003)(376002)(366004)(396003)(451199021)(186003)(2616005)(107886003)(55236004)(6506007)(26005)(53546011)(83380400001)(478600001)(86362001)(31696002)(6666004)(36756003)(6486002)(316002)(66946007)(66476007)(66556008)(6916009)(8936002)(2906002)(4326008)(8676002)(38100700002)(5660300002)(41300700001)(6512007)(31686004)(966005)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGdtKzEyd2VHbGZ6SmM2dXQrNEVmVWVobDZQTjlFZ2l0MG43MFdsaXVwekxa?=
 =?utf-8?B?eVptWGNaaDMvdFB5cW4xNTVPVEZ1V05CZjJlZWNkc3JTK3MzK3VHeEZxNGVU?=
 =?utf-8?B?OCtFSldxdTc4ekYwYjc1ZDJBQUNwWlU4MlpKYlNUR1k2Y2hSa1NnUGlGWmtK?=
 =?utf-8?B?Ukxjc0QwZDdpNWRKbnZDR0RtSG9nZXhxWlhEWlloRmp1aHdkQ3JxZ3M0TzJp?=
 =?utf-8?B?M3lPNjcrV1ByVDVleHV6TjRQR0lybWl0V1VtQkMrVlVCRTdWdVE2MWdwemZy?=
 =?utf-8?B?N2pZeCsxUThmWStnTWVkZFY4c2ZwTU40Y0FUZE41OHY0RDcxMXg1R1RYdHNJ?=
 =?utf-8?B?aWMvSXNjQnZHODJuM2phUmtHcVR1d09OOHZXYWd3M2RRcVJsMUgzTHE3d2FD?=
 =?utf-8?B?N3ptMHhrWWlsTHBTWU40eGowNVRUMWRCMHA5TTdBaXczcTdXSTJnbXg5YVZ4?=
 =?utf-8?B?YklJMkNyMzlKRUVBUkM0VkljNDVocWlyMlcxejZaRlIrR3g1ckVyc1dNVDY4?=
 =?utf-8?B?WU1BbnpmYnFXK29HMkxCcmNNcFAwOE5SbnpBSVhyN3psWHRtZDdnaDhmMVYx?=
 =?utf-8?B?TXdJNHd2TENrZEFHQjMzUEx2Qm0yekRicXhCNjE5eUxpTGNOUEZuWHIwOW81?=
 =?utf-8?B?S1VUR2EzN3Z2Y3gwY0ltSUZLN2xkWlE0azg5M0sveFBaQWFhcjhuQUZMS1dw?=
 =?utf-8?B?WGQ3SDBMTHNjYmxOQllrTWthQ2wxL1M3eFFpQlV4cG03UTdNSW5CMWJaOFh0?=
 =?utf-8?B?ZjV4cS9tTEdkTk1SYTc4cUx4RTlMU1RaVkF6TnoyZ1JkK0ZpSVgzRkx5YVN5?=
 =?utf-8?B?Z2wvV2RLblQzc2JvcWxKQ1pJSUFvREc5L2pjeVRtd01PTFFtcktvS2lXNHc4?=
 =?utf-8?B?NG9KYTZtUVpPQUs4bXdTZTVrVHVlT3FUR2J3MnNnRnlISjUrTlFXeHhoNkZo?=
 =?utf-8?B?MnRIT3dIUWVuVjEzdmFGckJmOXBMRHpYazZMWG5PZk1VK3h4VWcyUTZPaG9S?=
 =?utf-8?B?VW5uTWNraUNjOTBveTNzQ0YrQTFESWJQdUJDSlExeURWTk9WcGdVLzdkVFdm?=
 =?utf-8?B?ZG9rd0kwa2ZqSGRtZFlwTHNTSndiUEpPN0lab2MzellOclczT2FQTkVhOWdP?=
 =?utf-8?B?ZDFLVFA4ZTMyQ3JFK1o5STRvS2FOSVBzZFp6UkRMWFZwL3gvTnp0STlzYW8z?=
 =?utf-8?B?dnNhT05jTGtPZDVPNmtrL01INjJNZkk3WVZSQ3hnL0ZvNDJwWXJSU1hZYU5M?=
 =?utf-8?B?OEx1dTZZZHZ6eWJKMW9oQW11TU45YjczcnlrT1dRbVhDRURUVFZhSUc1VVVj?=
 =?utf-8?B?d2dhNHFpVnRnU3lTZzVGcU85T09mczlvM3h3ZFZObXlIRzhxRjJ1eFFUUmpO?=
 =?utf-8?B?OGtUNGhBVzlyOTlITnMvZWRMYjBhVzFWMEU2N3F0aWVWTUhpWU0xVTNNOXJz?=
 =?utf-8?B?T0dFa1pyUXVHUnlzT2NCK2E1TXdZaGxGN2p2ZnZjTTRpSnN4QXFQdkRCbmx5?=
 =?utf-8?B?dDhtVlJad3drT1NBdmxhRHdqWnJjako5T1JwNXJubWJSeFVpa0E2R3dUck9l?=
 =?utf-8?B?Z0tRZXE1MWI5RG02cDhZeWppUUgyUDA3L3RpTksydzJBWWVITjkybXFQOU0r?=
 =?utf-8?B?Q25OSFFPb1V1WUR2b0NCdW45MmtiUUFyNmtJcE0yWEowb3Q3UDhXYlM1a2J5?=
 =?utf-8?B?d1ZXV0kxQ3hPMEhSSC9GM3ZPZHdNYXJwOVRrUnJlVGtTNlJEeFJxZkVJNDNG?=
 =?utf-8?B?OUVibm93ejVuTk9rY3NHalg3OGNsbjNXVTFob2NMcG5JUGc1Wkd1ekpEaEdp?=
 =?utf-8?B?QkE1bDc3UHRGc2VqUUFVUEExdWp4NDR1WUhzQkUrYXkyVDhqV3hBbzU4QVNh?=
 =?utf-8?B?RkFnaC9KRnViOSs1Z0p5NHdEUXE0TFpwMHJqRmpKYTAwbUdIM3pxV0QrVlBC?=
 =?utf-8?B?ZDd0VzE3UTdtZzRuTmFWZzErUlRGR0FiWHhrN1ZhTnZnMlNnMnBvWXplQURu?=
 =?utf-8?B?cUdlYXZiZ3lXWGxYdkcxTk93bTVaLzljMEhhMGc5RlVBRVJjNlQ0bVZCNzJh?=
 =?utf-8?B?WmRzMUlsbis4TWliTXhnelRDditoTWk3WFVpNlNjVUNlb1BrODkxY3psRk1D?=
 =?utf-8?B?bUc4QW9COXdESlRLT21VZXhRUlRGeHJROFN0Y2RIYWhCUHlZOXpQVTBnbTZU?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a63232-d9af-47d3-d6e7-08db8db1ca35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 08:24:54.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c986vdAvxfGMWLO0LAGCuHRFU5qe/y5Ah6mND2BB/02mAkdJPqwjJMToZs9asySNjQ2aK9X9TDFUFtiEk6jU+QQBHK1KmhsTP87amvMhBqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7643
X-Proofpoint-ORIG-GUID: a-Ai6OAjV9cl2c12vBYs-MB80g1gkNSk
X-Proofpoint-GUID: oM0zT3pWlWr35OnXeJkj77CEW3ngYsqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_01,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307260073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 08:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104031

Gentle Reminder !!

../Narpat

On 13-07-2023 11:22, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> An issue found in Frrouting bgpd v.8.4.2 allows a remote attacker to
> cause a denial of service via the bgp_attr_psid_sub() function.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-31490
> https://github.com/FRRouting/frr/issues/13099
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../frr/frr/CVE-2023-31490.patch              | 160 ++++++++++++++++++
>   .../recipes-protocols/frr/frr_8.2.2.bb        |   1 +
>   2 files changed, 161 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
> new file mode 100644
> index 0000000000..893c856c66
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
> @@ -0,0 +1,160 @@
> +From 72c13aac2eb7c8f3a10ad806d80ab635c28f4c04 Mon Sep 17 00:00:00 2001
> +From: Donald Sharp <sharpd@nvidia.com>
> +Date: Wed, 21 Jun 2023 15:24:50 +0000
> +Subject: [PATCH] bgpd: Ensure stream received has enough data
> +
> +BGP_PREFIX_SID_SRV6_L3_SERVICE attributes must not
> +fully trust the length value specified in the nlri.
> +Always ensure that the amount of data we need to read
> +can be fullfilled.
> +
> +Reported-by: Iggy Frankovic <iggyfran@amazon.com>
> +Signed-off-by: Donald Sharp <sharpd@nvidia.com>
> +
> +CVE: CVE-2023-31490
> +
> +Upstream-Status: Backport [https://github.com/FRRouting/frr/pull/12454/commits/06431bfa7570f169637ebb5898f0b0cc3b010802]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + bgpd/bgp_attr.c | 79 ++++++++++++++++---------------------------------
> + 1 file changed, 25 insertions(+), 54 deletions(-)
> +
> +diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
> +index 2154baf4e..5d06991e2 100644
> +--- a/bgpd/bgp_attr.c
> ++++ b/bgpd/bgp_attr.c
> +@@ -2722,9 +2722,21 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +	uint8_t sid_type, sid_flags;
> +	char buf[BUFSIZ];
> +
> ++	/*
> ++	 * Check that we actually have at least as much data as
> ++	 * specified by the length field
> ++	 */
> ++	if (STREAM_READABLE(peer->curr) < length) {
> ++		flog_err(
> ++			EC_BGP_ATTR_LEN,
> ++			"Prefix SID specifies length %hu, but only %zu bytes remain",
> ++			length, STREAM_READABLE(peer->curr));
> ++		return bgp_attr_malformed(args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
> ++					  args->total);
> ++	}
> ++
> +	if (type == BGP_PREFIX_SID_LABEL_INDEX) {
> +-		if (STREAM_READABLE(peer->curr) < length
> +-		    || length != BGP_PREFIX_SID_LABEL_INDEX_LENGTH) {
> ++		if (length != BGP_PREFIX_SID_LABEL_INDEX_LENGTH) {
> +			flog_err(EC_BGP_ATTR_LEN,
> +				 "Prefix SID label index length is %hu instead of %u",
> +				 length, BGP_PREFIX_SID_LABEL_INDEX_LENGTH);
> +@@ -2746,12 +2758,8 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +		/* Store label index; subsequently, we'll check on
> +		 * address-family */
> +		attr->label_index = label_index;
> +-	}
> +-
> +-	/* Placeholder code for the IPv6 SID type */
> +-	else if (type == BGP_PREFIX_SID_IPV6) {
> +-		if (STREAM_READABLE(peer->curr) < length
> +-		    || length != BGP_PREFIX_SID_IPV6_LENGTH) {
> ++	} else if (type == BGP_PREFIX_SID_IPV6) {
> ++		if (length != BGP_PREFIX_SID_IPV6_LENGTH) {
> +			flog_err(EC_BGP_ATTR_LEN,
> +				 "Prefix SID IPv6 length is %hu instead of %u",
> +				 length, BGP_PREFIX_SID_IPV6_LENGTH);
> +@@ -2765,10 +2773,7 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +		stream_getw(peer->curr);
> +
> +		stream_get(&ipv6_sid, peer->curr, 16);
> +-	}
> +-
> +-	/* Placeholder code for the Originator SRGB type */
> +-	else if (type == BGP_PREFIX_SID_ORIGINATOR_SRGB) {
> ++	} else if (type == BGP_PREFIX_SID_ORIGINATOR_SRGB) {
> +		/*
> +		 * ietf-idr-bgp-prefix-sid-05:
> +		 *     Length is the total length of the value portion of the
> +@@ -2793,19 +2798,6 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +				args->total);
> +		}
> +
> +-		/*
> +-		 * Check that we actually have at least as much data as
> +-		 * specified by the length field
> +-		 */
> +-		if (STREAM_READABLE(peer->curr) < length) {
> +-			flog_err(EC_BGP_ATTR_LEN,
> +-				 "Prefix SID Originator SRGB specifies length %hu, but only %zu bytes remain",
> +-				 length, STREAM_READABLE(peer->curr));
> +-			return bgp_attr_malformed(
> +-				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
> +-				args->total);
> +-		}
> +-
> +		/*
> +		 * Check that the portion of the TLV containing the sequence of
> +		 * SRGBs corresponds to a multiple of the SRGB size; to get
> +@@ -2829,12 +2821,8 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +			stream_get(&srgb_base, peer->curr, 3);
> +			stream_get(&srgb_range, peer->curr, 3);
> +		}
> +-	}
> +-
> +-	/* Placeholder code for the VPN-SID Service type */
> +-	else if (type == BGP_PREFIX_SID_VPN_SID) {
> +-		if (STREAM_READABLE(peer->curr) < length
> +-		    || length != BGP_PREFIX_SID_VPN_SID_LENGTH) {
> ++	} else if (type == BGP_PREFIX_SID_VPN_SID) {
> ++		if (length != BGP_PREFIX_SID_VPN_SID_LENGTH) {
> +			flog_err(EC_BGP_ATTR_LEN,
> +				 "Prefix SID VPN SID length is %hu instead of %u",
> +				 length, BGP_PREFIX_SID_VPN_SID_LENGTH);
> +@@ -2870,39 +2858,22 @@ static bgp_attr_parse_ret_t bgp_attr_psid_sub(uint8_t type, uint16_t length,
> +		attr->srv6_vpn->sid_flags = sid_flags;
> +		sid_copy(&attr->srv6_vpn->sid, &ipv6_sid);
> +		attr->srv6_vpn = srv6_vpn_intern(attr->srv6_vpn);
> +-	}
> +-
> +-	/* Placeholder code for the SRv6 L3 Service type */
> +-	else if (type == BGP_PREFIX_SID_SRV6_L3_SERVICE) {
> +-		if (STREAM_READABLE(peer->curr) < length) {
> ++	} else if (type == BGP_PREFIX_SID_SRV6_L3_SERVICE) {
> ++		if (STREAM_READABLE(peer->curr) < 1) {
> +			flog_err(
> +				EC_BGP_ATTR_LEN,
> +-				"Prefix SID SRv6 L3-Service length is %hu, but only %zu bytes remain",
> +-				length, STREAM_READABLE(peer->curr));
> +-			return bgp_attr_malformed(args,
> +-				 BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
> +-				 args->total);
> ++				"Prefix SID SRV6 L3 Service not enough data left, it must be at least 1 byte");
> ++			return bgp_attr_malformed(
> ++				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
> ++				args->total);
> +		}
> +-
> +		/* ignore reserved */
> +		stream_getc(peer->curr);
> +
> +		return bgp_attr_srv6_service(args);
> +	}
> +-
> +	/* Placeholder code for Unsupported TLV */
> +	else {
> +-
> +-		if (STREAM_READABLE(peer->curr) < length) {
> +-			flog_err(
> +-				EC_BGP_ATTR_LEN,
> +-				"Prefix SID SRv6 length is %hu - too long, only %zu remaining in this UPDATE",
> +-				length, STREAM_READABLE(peer->curr));
> +-			return bgp_attr_malformed(
> +-				args, BGP_NOTIFY_UPDATE_ATTR_LENG_ERR,
> +-				args->total);
> +-		}
> +-
> +		if (bgp_debug_update(peer, NULL, NULL, 1))
> +			zlog_debug(
> +				"%s attr Prefix-SID sub-type=%u is not supported, skipped",
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> index 80f4729e1f..073657b652 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
>              file://CVE-2022-37035.patch \
>              file://CVE-2022-37032.patch \
>              file://CVE-2022-42917.patch \
> +           file://CVE-2023-31490.patch \
>              file://frr.pam \
>   	      "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103853): https://lists.openembedded.org/g/openembedded-devel/message/103853
> Mute This Topic: https://lists.openembedded.org/mt/100115488/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

