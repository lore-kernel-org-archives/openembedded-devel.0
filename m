Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8645BE7109A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:20:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19720.1695385231910240531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eMoS4VSr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4ac35=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38M9Nkmi031817
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:20:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=BNuY6JrVCNOT1//jO9Y7SI7RJLYl22vnwHSJWdMzpYU=; b=
	eMoS4VSrTDDhaZOj6s/bKUKQDX5rReBE5rtriMhgAtcUG8fiT+WR/LzIjtkFdYPA
	WLus1586NNEn9zQFEqBEN1dyvx6n43CgoTfZ0GLUue5QOu0UkPItF94Far39ifFK
	3uTdyZRIsqip5kga+YHQB79GlCiJRJD+vkDTAiztdjdiELJoQc33n2Kc+kItvmhT
	MQih+W+I5j++URdxm4A5GpYE48F3lylMsk23y03QITOCsEbPSkjExiDPTYYLXk4a
	TLvYF/eLAqsA5f4ZchxS58O6OCi7WVubEkjvxXLRg5Fyo4EP+Bo/yNXKcGr6hCgn
	B4l1cfvoKh6fx3eHQo5JOw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr1rs8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:20:31 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38MCKC45008082
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 05:20:31 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr1rs8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 05:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCv9GSpeFdJHg0BcxI7XhSa+4OBZNVPt05aH+t38fpsRRwR3kX8MeTAYE5cQ/SWLrNQ3pu1ZUJlXWzJUqwf/8VGUw0hViPk+N8a3X3NqhY7zbCAukxNtRRTCeIXs25sctc2FNiKZ//5jYW8jEjcakQ4+GaNsgQmVLu7r5SpT/aIw74p7qMqVqTx1Udz8bRJYWptDqenTblvpt/cgqQdt+G4KO6pu86D5H3qZcNnnNR3Z4fhHmEY9Z7J32CASJxR6diN7SoYBBjbaooYz+tZHUgYraZrlt/5uWOXOy7qnLj/SIpUNXi4iCzwUAfX6zKpeLU7BH98k3OMPFdZMJ1m4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNuY6JrVCNOT1//jO9Y7SI7RJLYl22vnwHSJWdMzpYU=;
 b=oKVWCZT+j92aGaRGL7meXidF/hNYSWrp9PhjcYvNOnpFxUbyrbXthhJxIfhZ6V1U8Xf14t7JXarBK2mbO1Sx3yC4UenPRVV8fc6G1GqoQrw4cwLitZdrdPda/6j7zlg47/TLI5ejVM+WlyFS1la0+oetXM8Uid4iYkwCTOEdcJX8ZMyaAnwpB0BIq4XPt5hR8wGtpHeAoDP1uhr2MMjyVYlrin7iW8l6j1w1LpRvveRuIHuSrhaDqCXY8VuGo8B12yKhgUu9Q/O4fQ8adn2mVGONNCN0xiisu+dagoKkNAZ3MU2T6tIpLTzJlNxQBEmQfixsneRWaAibEvpaDacojA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 12:20:29 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 12:20:29 +0000
Message-ID: <719bd714-75ee-d2dc-acd0-813c0e8b129b@windriver.com>
Date: Fri, 22 Sep 2023 17:47:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 1/1] frr: Fix
 CVE-2023-41909
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1782ECAD48B0AC42.9600@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1782ECAD48B0AC42.9600@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: e553edbd-2378-4834-e22b-08dbbb664ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hfqIPzUIMjFbGdyHhWc4Z3eNdM9f7M2s3NwtEYMzAwdJDvR3nROjfpJvuR3OFaTD6L0ZUGyyMEgFhBxcFZwnCemA9LEOkcitkAAAHFVFcXXc2MXOISXFerv4Ob5inGF8fFqgQxGtvKdw3ylffD+V8e5mRAKMK5Z8V/s8TT4QlXqu6BkrJlw5P3iTUJ3jJf64T3rGu/gETG//VCJThJnfsmeeLmi74/4ORb5ErWtHoFfti8j9vMkoCilFrOl3aOkGd9zmjuoWQk1+5A1W5E8u7YPFBOPxT250SiG1Fa+Lxpqx7yuv8wPprbsGnnZWmsihM2e0JQwECGAWUWOxVLmXnraTSf3f2FFkphePwqw6eLvTDoEwmFkSe77JGEAFvzgoBW8BjYphsEaSOgJOTK9mqy6CrEv7/6q7w9r1iHCZN+zE5zka7B8AEqVzSXcnie+KxBuZD17ZTKp1564y+7QNH/3Sfgn25/rxMviDdiBf6E0heOdUYRe6zEv5nb6jjgN2Ppt4AVf3tldNOnBJc9ljxPC+8WH+SaPdiZQX6TxG/zuXpPfjpJACqiUSnnov6AF48argZRv12G6sEYXJWAp03H4penrenxEww9Qm4GE1lggmOS5Cn4waddPgf1QlbS7B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39850400004)(186009)(1800799009)(451199024)(66899024)(6512007)(53546011)(55236004)(6506007)(6486002)(6666004)(26005)(2616005)(36756003)(41300700001)(316002)(66946007)(66556008)(66476007)(2906002)(86362001)(31696002)(31686004)(8676002)(8936002)(5660300002)(38100700002)(966005)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmczUkJaNzVldTJlLzE3VWMvRDlCeElEd1lmTWh6cGJoWDFXR0xJVUpOQWZS?=
 =?utf-8?B?MHFwYTZUcURLKzJJMWRNS3JWOExGdXNvcm1EbjY3L0VWdHZJSHhOazN4dm1y?=
 =?utf-8?B?U0RIL0s4RDFXOGhkaDRleGt1UzI4Z2VRUVJMQTJUVFV6N3BFeFArSjc4T1Vr?=
 =?utf-8?B?KzVaTHYzVWFKSkVZczZsT28rZXA2bXRmUUE2ZlpsTmVLeTB0M0d4NlhhL3Q2?=
 =?utf-8?B?N1hPOCt4TFBkVnN4R21kVmZZaHo0ajBxc09zRm1UZkJBUTUzZUJJT0djOWcw?=
 =?utf-8?B?Z2NlbVdqUlBEd1JuSDNjcXJ4aytWWUxCa052UVpGK2FtZXBUaHluZG5TQVNp?=
 =?utf-8?B?UDRISGFpU2M4YlVqMlA0aGRUSkFwRytBZ29uWSsrOVAwTUZ1L3k4Um9VUlRX?=
 =?utf-8?B?eGFTOEpWODR0Ri9rbXJwa1ArVGIvT3lNcHFRU0dIWjVkdEU5L2tHM2diWHg1?=
 =?utf-8?B?elI3R3NBQ0hobytvNUc1VTdXbHpSNWxUSVJWMzlhZ3dWbDVmbStvaWxjRWlD?=
 =?utf-8?B?NWIrYkFnL2ordDFVdGlZa2NPL1dQbmRvWGl2aWV4ZjgxNnU3YjRnNlYvNlFy?=
 =?utf-8?B?RE1KeHgweWZwWGNhZXVINTVPd1RBSzdMYkc0bzBHZUl0Z1RhTlV5N0gyNExB?=
 =?utf-8?B?QTR0N2YweDZwWlR0TDBOOVRpYW1qWkZHZ0xGQXVPRTU4SWFrOVZsQWtHcGdi?=
 =?utf-8?B?MUtNU0Q3Zm84WjZueDF0NE5EaG9WKzRRU1lXTVkvS1owcU1XbFV4d1MzeDdS?=
 =?utf-8?B?cDVQU3p6RjdHTnNKVWFsTmtLV3AycEtKYzEwRFh4bnBLZHZtUXZFalROTTE1?=
 =?utf-8?B?V0NoUjdxODEvMGtGTUNyUCtaVEpCa2dpUEM3cGg1c3BySlMrS2E1OXBHdUxo?=
 =?utf-8?B?MmZnUXFMekpTZ3NHK25XRm5ZZWVaTWhLNEJJWG5ETDVHUXlqMEx3RjFOV0hV?=
 =?utf-8?B?OXhwUVNQY2R3UDZXdmx6ejlXNTNBazVJa1ZBbURjWGptV2tYR1kzb28vQWJh?=
 =?utf-8?B?U1hjZHpaK24yY3FBL1prNHp2YzRwUWVTRmtTdk5qY3hjZFBjdzhtZk1yTHJN?=
 =?utf-8?B?U21XeEZnVFBweW5yMDlrYS93aFVtWkhWdjZxN0s4VHNDUkYzWVRLOUV4cWZV?=
 =?utf-8?B?eDBDSldBWTRGVDhNaU5uWURNaGJiWldpWnVtZXVxQ2xEdnNxNkRHWWpSaDY2?=
 =?utf-8?B?ZndmUHVwV1Vzc3hjN29qUURYelhzaDNwOE1sY1F0LzVRQ3RNcENwMWwza042?=
 =?utf-8?B?ZjRCSHdlNEl3dmlvM0VKR0xCWTJ3MEM2UHI5MWxHaEtLWXFjSDNvd0ZwaGlI?=
 =?utf-8?B?MUFFOFFLQXpicXZsU0M0eDdGVmRXNE9sU3pJSTNJazNPR3RNSGx4VDJ1ZkJm?=
 =?utf-8?B?YVNZQ3p6Z1lEUDVic2ZUS3Fycm5yOXRVcUczTjNJUDk2ZFpDdzg3RDloY0FB?=
 =?utf-8?B?STNBY3llazZlTi8wSGtaWXpzbzFKOWt2SmNmQlJ4NnBZTURPdkt6Mm9KQXR4?=
 =?utf-8?B?S002eDdhL09CVzlmeVVnM09xUUhUcHpBQXNpOHVackRnVmdnSEtCM3JuTnc5?=
 =?utf-8?B?bks1ZFpvRTBvUzdLUGxTUUpjUjRHalVlRWpSYkxzUEM1Z21aN1B4TlhOUFJU?=
 =?utf-8?B?eFBzL3BtSHdtK3BSQnVyUTZoYS83UVlGWVNGVktLY1ZlWnQ1Sk85MHFKc3cy?=
 =?utf-8?B?ZDRlYlVKdnBCV0NWTDlsQ2R1TGcvSU5MNk5xTzJvR1hwZ29tbU8vZysxcXRv?=
 =?utf-8?B?bldPZVk3bUdqMlZjMmREV3VLUy9MeHNpbGZGNzdrbk40NDQwaEJvc1JabzZa?=
 =?utf-8?B?YzJLVnphS3NXNmJnQmY5OW1iVVpNTG1lSHBkeFBEOUhUK2xlektabWx6bXVP?=
 =?utf-8?B?bWpTL0t0My81TE5FSFpVdG9oNkxFVDJaYUJDcTl2WStJcmdHa2NhRkluOEQ3?=
 =?utf-8?B?a0QzY3BQaDVCNVlUZDNUL1hQN3dmcGVpV3ZuR3hkU0R6cVBrUi80YTNkVUlP?=
 =?utf-8?B?TFdKNjlGbUh4a1paMzdUMGVjSFRabWFjZmRrOVJ6Ty8xTVptbUw1c3o2L3RV?=
 =?utf-8?B?Z01uL2dtU3ovRmJmenVVaDRRRUlmYy8zd2tlOXkwVlVOTXhTUWZnc3F6cmJ5?=
 =?utf-8?B?WTNkNHdSQ2pFdm5uRzhCak9zeWl5WjVzZU1YRCsrYnMrRmt1dERYMzFqdGU2?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e553edbd-2378-4834-e22b-08dbbb664ef6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 12:20:29.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCYrbf97fuQYz0M/DDLa0oJLtPu3r/kvnnF2ErWdmDJktowxXp57YLmq7hqlitoKFjPUHvXY4rCZc7VKl58yxGCeQR56IC/oBkMBqyoM+Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
X-Proofpoint-ORIG-GUID: IH630RhMAEdosMswJb83vvAT8Muj9U85
X-Proofpoint-GUID: hJZrr76fY1g1xySU-ZbPlVjt7aiTxfrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105062

Gentle Reminder !!

../Narpat

On 08-09-2023 18:06, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> An issue was discovered in FRRouting FRR through 9.0. bgp_nlri_parse_flowspec
> in bgpd/bgp_flowspec.c processes malformed requests with no attributes,
> leading to a NULL pointer dereference.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-41909
> https://security-tracker.debian.org/tracker/CVE-2023-41909
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../frr/frr/CVE-2023-41909.patch              | 42 +++++++++++++++++++
>   .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
> new file mode 100644
> index 0000000000..b27d7af166
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
> @@ -0,0 +1,42 @@
> +From 5966b6a1fc72d3698d08199922cc4f42ea7fc9eb Mon Sep 17 00:00:00 2001
> +From: Donald Sharp <sharpd@nvidia.com>
> +Date: Fri, 8 Sep 2023 11:46:12 +0000
> +Subject: [PATCH] bgpd: Limit flowspec to no attribute means a implicit
> + withdrawal
> +
> +All other parsing functions done from bgp_nlri_parse() assume
> +no attributes == an implicit withdrawal.  Let's move
> +bgp_nlri_parse_flowspec() into the same alignment.
> +
> +Reported-by: Matteo Memelli <mmemelli@amazon.it>
> +Signed-off-by: Donald Sharp <sharpd@nvidia.com>
> +
> +CVE: CVE-2023-41909
> +
> +Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/cfd04dcb3e689754a72507d086ba3b9709fc5ed8]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + bgpd/bgp_flowspec.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/bgpd/bgp_flowspec.c b/bgpd/bgp_flowspec.c
> +index 341cfe9d0..3e2b1ac49 100644
> +--- a/bgpd/bgp_flowspec.c
> ++++ b/bgpd/bgp_flowspec.c
> +@@ -112,6 +112,13 @@ int bgp_nlri_parse_flowspec(struct peer *peer, struct attr *attr,
> +	afi = packet->afi;
> +	safi = packet->safi;
> +
> ++	/*
> ++	 * All other AFI/SAFI's treat no attribute as a implicit
> ++	 * withdraw.  Flowspec should as well.
> ++	 */
> ++	if (!attr)
> ++		withdraw = 1;
> ++
> +	if (packet->length >= FLOWSPEC_NLRI_SIZELIMIT_EXTENDED) {
> +		flog_err(EC_BGP_FLOWSPEC_PACKET,
> +			 "BGP flowspec nlri length maximum reached (%u)",
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> index 1897eb2abd..d226d5411d 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> @@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
>              file://CVE-2022-43681.patch \
>              file://CVE-2023-31489.patch \
>              file://CVE-2023-31490.patch \
> +           file://CVE-2023-41909.patch \
>              file://frr.pam \
>   	      "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104805): https://lists.openembedded.org/g/openembedded-devel/message/104805
> Mute This Topic: https://lists.openembedded.org/mt/101235307/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

