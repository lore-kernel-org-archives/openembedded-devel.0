Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A5DC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:33:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7526.1664436804538399540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qChPew7g;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7271b02b47=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T5kk5J013220
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:33:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QoXTo4fdFIy11uLmXoofJZasI921OMv4KHYjmRuYvx4=;
 b=qChPew7gK4e6ScNIQHxCI7D7H7EbAZzYstcLtv6YXCBEsDgbNpWvohkCq9/blzQrJFfX
 T2wSTu3AOBTjMUDdS5pS02huGu7mz2m3Aw+5yZ9R/Pz0Re/N9kW64fGeb9jrEjCoprNN
 bm4zR9qTdbNp2CJJt2pLgD+Zk3rzQBpVduxYkiAy4hckiYYrcbxH9OhgslK2I7TrzByx
 saf4NmWILEPugW2AA5HyW8fwW1EwAcPLl4f/DYN6QcmiMpOFyVjOQh7ov82KqfGX+vAF
 49ZYGPv53y4kYzLOUSDeHwbEsW6IHqqC8InZSdGW1qQeA1XBIh3HLrM1jBUHtKQWuD54 kA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65m65c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXk2KZqxgZrWqhPt0O8Ee0p//xANR1d00Qj0p7MO8u3mPuyNanjOPRVtmWIlukAPpPDclWYe1BXfsCI8PW2yVl6phr/zsV/YCUOZm+W1RIYGxwni7h8+LX+hbTRETowjWhaWZgfySu4a69Z7x+oxDZ8h7OG9ljViWxJiyiayWObYT4N7/Lf3dEJmctkzKuvbDEn/MBUPEDR0MC+ZjqJivd3XMsDY6gehlCnl9Tva/sWKvtwcbwNYZE0XamKa3yXmn60l41FzOq0Rn9wzwtS3UjP2j6vzmexc6nGbb751+jXWXNjhTWhdKXQfc7qH3jOYQHVH02Wu/ZpccyTDYF4QDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoXTo4fdFIy11uLmXoofJZasI921OMv4KHYjmRuYvx4=;
 b=LIMz9TLQm6nMnHw+bSFem3xKC92QT6AiRTrOvKTVflIadRvH4BczD0iuFOdR3oZKL8Vn3KDWO6FC6ekc+5e3QTFPt0kXhlBnLG3DHoQ49Wbt66LybcVxdDPrqrXnpQXy2Pw02y2tI2NQnSUwI1NhrkZS2qTW4weo3zWULjIWZQUPwR5/zLdQ7JEUnS3/c1IJGTMWkdBSzRnsmEhe4JpuSZY/Q5OSK0WAkh5+jWZoCXI8zJv/togJVCitXwc0miWtkW+9GxxyJIE0ohumtAkWDWn809N12YWdsxtZlZSzMOST93tDTXKetdG+DhlibY1l3Q/KZ9Wllai7xYms5Zhb0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL1PR11MB5462.namprd11.prod.outlook.com (2603:10b6:208:31e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 07:33:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 07:33:19 +0000
Message-ID: <ad8a02d1-f85b-5bb4-2caa-f271eed7c34b@windriver.com>
Date: Thu, 29 Sep 2022 15:33:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][PATCH] frr: upgrade 8.2.2 -> 8.3.1
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <1717B8B001D99ED0.21421@lists.openembedded.org>
In-Reply-To: <1717B8B001D99ED0.21421@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BL1PR11MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 88839aeb-fb1c-4667-5cec-08daa1ece194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dYogtnwQXSjrF19XRieDtkmMsZHPpnwrGmEFt8sjUCvtgPp1+Pfimsd+QZAXQKYBsCs3R2AOeHGJpMazl7hGs84s0Ugcls9UuW2pO9fwdhbsU4Q/G3z3ATQQ5MRjwEkcYWektVBDo6b0vF6GJBHf9tIGoxlP4jHg9GSbI/aKtIlta6qdo1QSHGzS3Y5sk7AzBPsZokH20NY+31HdiGoOu5Y+uuHrOSdgTnPF5kUHCrQQg6Fa5oTyKkJGRAmOODtwOHAWeIMfHorrt3Utgf7VETwXZmiUciFzsEEcOVA/sFZBHWd2b1+Mq6wfFfaLDH+FuzfIVGGFbQsm2ccha6Ri4BVVz+yyRfSrlDkR+yyb4twnBQrfy4Y01c+O+rW4liYvHGV+65tq/r6i2yfG38d07WHMvYLgXRcSxsPz1TcKJkGFf1cqmJ40cQbztRk7T2M7Lixy8WUMcCN8Tk0GdjzJfWV9AoPaSu83J4PWDWSZ89bH5QjODVEt+YIWl4GssoLF1i0AlAkJw6GCr5YVB0Pf8qp2D1MvUvwV9z/DT1X6p4/93I2N5a56+ldE/EXH408tG0Lcmgqd1hhxJhJOxqQyiQ9u8qzb1De7nkxifCJEpHCmKaCiqhd+8/f8wdCWSLqywFr57/tH5OZdKggNZfmpC58p7X4rDBiPy1x8dNGSNNWBoxw/3SG7XsgaqhUw8bPeLxwzAbebM8Ggi3VcHKxAlz0TLpmDQB4iYrq3jUwhpb08dac9QrwVp6ClVnwhgSbPN9RioXLlsZyIM500f+pGS0QQi132vwBp/00uV2qsTrtOd1cGUbM21Yx63Ycv1WPjxwy3IJmKkku6a6t0P2rnitLYSurOTxF8tMXu/wg+hak=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(451199015)(31686004)(36756003)(66899015)(38100700002)(186003)(83380400001)(2616005)(31696002)(86362001)(478600001)(966005)(53546011)(6666004)(6486002)(8676002)(6512007)(26005)(6506007)(316002)(6916009)(44832011)(41300700001)(8936002)(5660300002)(30864003)(66946007)(66556008)(66476007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDNiaGRMTnNNOUYvL3RaT2pjeFBhQ0llb2txQWJ4dzNQVE9mUHRwanlsaHM4?=
 =?utf-8?B?b3VDN2VyMkNsQUp3M3lyYnRjNTFBU3lTU3dYV2U1eFJzTko5RU9IV2hsb1Vs?=
 =?utf-8?B?enVYbzhsSHBkR1dsT25hT3ZiVFoxVW9ZUUFzdUZKMkI2c2drQkI5TEVlUlJ5?=
 =?utf-8?B?UlN2c1hwOGZDOGM2QmpaY0xyalNMWnpKYk0vZ0E0bnRlb2hBZ2tnTHBlcGo4?=
 =?utf-8?B?TjVSdzR4ejA0ZjBZbTYxTDkvUWk1T2hKNW93QXM4T2xOWTdjNm1IOHRyTExR?=
 =?utf-8?B?aS9ydENNVHNvSjd2alA4RlhodG5HNWVrOG11UXBTZUdoRW9ELzhPLzE5VE9m?=
 =?utf-8?B?aW42KytZT3BEczQ2dzFXOVQyVTQ0UysyT0YxUStzaUVXQmp4UmRqUW9BTnZi?=
 =?utf-8?B?Q0hVWlNnbmZkZEtKOTh0c0pzSlpMU0RLZEhzOTlhVnlmRVFHUEZjNHRkT1JK?=
 =?utf-8?B?OXVtUDh1cTUzS2o5NkptWllDUUZnV2l4eUdnSG9vWVdGUm9yVktTZVgyTXp6?=
 =?utf-8?B?SmQwOHYveW43eFBCUStrVHZoL1RpNno1bjcreVBHUnJqSk1NcHB6V3hVQWNS?=
 =?utf-8?B?Nk1yaHhnUndlQVBFa1M0cU5XeWxEYmhGV0g2MGxhazFERHVEWExuVDVFbUlt?=
 =?utf-8?B?NGhJSkxVWjBKY3lYVlY0R0ZTeHF5b2svK1p5SzlycDBqUWlDNzlYNXRpRWsz?=
 =?utf-8?B?eGF3TzZiNDQ0bHBRb081czJDYWlhVm16ZU5xQ1JCdUFLZzBFUUE3OGkyN2FM?=
 =?utf-8?B?cDlvdUJ1TkpNWk5KSWpJKzFCbjBZU0ZQZmxXdkdCQklnMW42WGl2R1N3UklB?=
 =?utf-8?B?c2RlLzAxZ004Znp4R2kyai9nQ2ppR2JsMjNBZFJRL1pUVVB5aStMSFhvOW9q?=
 =?utf-8?B?VzNZVFZSekNxenZoRWhGSkdpVDNJcW40T3doL05nYWhyQTVXaEVZRVcrV1dZ?=
 =?utf-8?B?b2lwcWExQ3gzUjF1OWI4enNVVURhMWxBeG9SandzUDRSS1RoYWs5MzlqKzla?=
 =?utf-8?B?d2JCWEdLRGRvTnE3YktjZzVVbDZrZHpQZk81T2dtSTY5WTYrb0RRV2VTdnV5?=
 =?utf-8?B?cnc3UEJVY2xiczJRQTdtYjBZQm4ySVZ6bVV0bXVSQkxacmFzcExyU2gzOFZs?=
 =?utf-8?B?RStOVHNVQ3pFcloyT0tpNGVRclhHSEJrTDZDVXlkeFVRV09hTjF1b3VVaWds?=
 =?utf-8?B?Nmt3MHhqQnhUb01HUEI3anFsQWdneHpNS1JUajdwNU9pVi9zaXJJTDU1WWJw?=
 =?utf-8?B?dHUvaHRCRmI1aklDZzdkYTNwSTE5cCtjMTBsbWRKcVpOcys2YTNTME1DWUJ3?=
 =?utf-8?B?WE9TOEQrK3hmU3lQSlRST1piMTdLVkdCOE53azBNS2xzWnhjQ1FSUXJKZTI4?=
 =?utf-8?B?Ui95MmFpcDlvRlhiU1lDeVpmd3ZjWEVTREFobHVPMlVGUlMxTC8yeG5IVThs?=
 =?utf-8?B?SlJjV3VvMkxueVhRTUpQRGpsdUVqZUE4WWRiRk5OcmVoTGVXRUo5TUpWQkFp?=
 =?utf-8?B?ZWRFSlQ2YzNPYXQzZ2grREVVTjM1d3d3enJkUlpURUsySFVFNlNOejZTVEN5?=
 =?utf-8?B?MGxaSHFDTC9UNUhVMkwvdno0MXRFUEY3RWFXUndSYlhIVVdMN1NvVUx0ZVkr?=
 =?utf-8?B?cUh2Rjc4aUpzYnpiUXZhTWlNRjd5SjdBeFBpWmNqczNtVGw0eUNoWExOdVdT?=
 =?utf-8?B?SGsvNmtWT0Rsd1JUdlFBS3dTdVE0ZHQ2YmNsOGpvVnpZWEcwSFN2aG13ZEp4?=
 =?utf-8?B?OHYraXVMYytWRVVEeWtIZXl1R0dvUDlwY25xUnhrWUxFc1VuS21MSmswazVu?=
 =?utf-8?B?U0kwclllL2xJQVg4UDRIcjA2T0E3K1RGU0wwOUExRUVqd2JZQ3hJckFGMElS?=
 =?utf-8?B?czZqaFlPcVB6ejRBWmo5Y3NMRzhobzhwcXZQUXd1OE51czRqaFlTc3lmWmgv?=
 =?utf-8?B?SUhBUWwrd3ZzQWFZVkZLVExITDlTSGxaUlJUK0hIVW5qSEdoSnRONUVyUng4?=
 =?utf-8?B?UHVzMDE3RGY5dkRkY2RVR2E0cTNNL2NpeEpFbzg2NHNLVStkWjdjRnpSWURp?=
 =?utf-8?B?cERxSEpicVNYNTYzeDl1R2tseU4ydDh1a1QydDJNbmc4NGRLSmFNbkxRK0gx?=
 =?utf-8?Q?hSBXTvmZMYmn8fABjJT6xtUKD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88839aeb-fb1c-4667-5cec-08daa1ece194
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:33:19.7327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /X3KPsB2aSRiiapxn5UXssryua5UDwKTcg8BBRxTbFLZeLUNm4vWOskPQOpopyXg4aSmAHrf0t0LqcLVlYKm1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5462
X-Proofpoint-GUID: 2RrYcOY_F22N6a85iwCWMJ9ZWACgBw-i
X-Proofpoint-ORIG-GUID: 2RrYcOY_F22N6a85iwCWMJ9ZWACgBw-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209290043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 07:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99001

Ping ...

On 9/24/22 14:40, Yi Zhao wrote:
> Backport patches to fix build error with --disable-ospfapi and
> CVE-2022-37035.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...fy-race-between-io-and-main-pthreads.patch | 151 ++++++++++++++++++
>   ...for-readline-function-instead-of-mai.patch |   4 +-
>   ...UPPORT_OSPF_API-define-in-ospf_spf.c.patch |  48 ++++++
>   .../frr/{frr_8.2.2.bb => frr_8.3.1.bb}        |   6 +-
>   4 files changed, 206 insertions(+), 3 deletions(-)
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
>   create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
>   rename meta-networking/recipes-protocols/frr/{frr_8.2.2.bb => frr_8.3.1.bb} (95%)
>
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
> new file mode 100644
> index 000000000..40284d6f4
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch
> @@ -0,0 +1,151 @@
> +From 71ca5b09bc71e8cbe38177cf41e83fe164e52eee Mon Sep 17 00:00:00 2001
> +From: Mark Stapp <mstapp@nvidia.com>
> +Date: Thu, 8 Sep 2022 16:14:36 -0400
> +Subject: [PATCH] bgpd: avoid notify race between io and main pthreads
> +
> +The "bgp_notify_" apis in bgp_packet.c generate a notification
> +to a peer, usually during error handling. The io pthread wants
> +to send notifications in a couple of cases during early
> +received-packet validation - but the existing api interacts
> +with the peer struct itself, and that's not safe.
> +
> +Add a new api for use by the io pthread, and adjust the main
> +notify api so that it can avoid touching the peer struct.
> +
> +Signed-off-by: Mark Stapp <mstapp@nvidia.com>
> +
> +CVE: CVE-2022-37035
> +
> +Upstream-Status: Backport
> +[https://github.com/FRRouting/frr/commit/71ca5b09bc71e8cbe38177cf41e83fe164e52eee]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + bgpd/bgp_io.c     | 17 ++++++++---------
> + bgpd/bgp_packet.c | 32 ++++++++++++++++++++++++++++----
> + bgpd/bgp_packet.h |  2 ++
> + 3 files changed, 38 insertions(+), 13 deletions(-)
> +
> +diff --git a/bgpd/bgp_io.c b/bgpd/bgp_io.c
> +index 7af1fae28..f9bb8d518 100644
> +--- a/bgpd/bgp_io.c
> ++++ b/bgpd/bgp_io.c
> +@@ -37,7 +37,7 @@
> + #include "bgpd/bgp_debug.h"	// for bgp_debug_neighbor_events, bgp_type_str
> + #include "bgpd/bgp_errors.h"	// for expanded error reference information
> + #include "bgpd/bgp_fsm.h"	// for BGP_EVENT_ADD, bgp_event
> +-#include "bgpd/bgp_packet.h"	// for bgp_notify_send_with_data, bgp_notify...
> ++#include "bgpd/bgp_packet.h"	// for bgp_notify_io_invalid...
> + #include "bgpd/bgp_trace.h"	// for frrtraces
> + #include "bgpd/bgpd.h"		// for peer, BGP_MARKER_SIZE, bgp_master, bm
> + /* clang-format on */
> +@@ -526,8 +526,8 @@ static bool validate_header(struct peer *peer)
> + 		return false;
> +
> + 	if (memcmp(m_correct, m_rx, BGP_MARKER_SIZE) != 0) {
> +-		bgp_notify_send(peer, BGP_NOTIFY_HEADER_ERR,
> +-				BGP_NOTIFY_HEADER_NOT_SYNC);
> ++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
> ++				      BGP_NOTIFY_HEADER_NOT_SYNC, NULL, 0);
> + 		return false;
> + 	}
> +
> +@@ -547,9 +547,8 @@ static bool validate_header(struct peer *peer)
> + 			zlog_debug("%s unknown message type 0x%02x", peer->host,
> + 				   type);
> +
> +-		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
> +-					  BGP_NOTIFY_HEADER_BAD_MESTYPE, &type,
> +-					  1);
> ++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
> ++				      BGP_NOTIFY_HEADER_BAD_MESTYPE, &type, 1);
> + 		return false;
> + 	}
> +
> +@@ -574,9 +573,9 @@ static bool validate_header(struct peer *peer)
> +
> + 		uint16_t nsize = htons(size);
> +
> +-		bgp_notify_send_with_data(peer, BGP_NOTIFY_HEADER_ERR,
> +-					  BGP_NOTIFY_HEADER_BAD_MESLEN,
> +-					  (unsigned char *)&nsize, 2);
> ++		bgp_notify_io_invalid(peer, BGP_NOTIFY_HEADER_ERR,
> ++				      BGP_NOTIFY_HEADER_BAD_MESLEN,
> ++				      (unsigned char *)&nsize, 2);
> + 		return false;
> + 	}
> +
> +diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
> +index 7daac4494..90695219a 100644
> +--- a/bgpd/bgp_packet.c
> ++++ b/bgpd/bgp_packet.c
> +@@ -871,8 +871,9 @@ bool bgp_notify_received_hard_reset(struct peer *peer, uint8_t code,
> +  * @param data      Data portion
> +  * @param datalen   length of data portion
> +  */
> +-void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
> +-			       uint8_t sub_code, uint8_t *data, size_t datalen)
> ++static void bgp_notify_send_internal(struct peer *peer, uint8_t code,
> ++				     uint8_t sub_code, uint8_t *data,
> ++				     size_t datalen, bool use_curr)
> + {
> + 	struct stream *s;
> + 	bool hard_reset = bgp_notify_send_hard_reset(peer, code, sub_code);
> +@@ -917,8 +918,11 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
> + 	 * If possible, store last packet for debugging purposes. This check is
> + 	 * in place because we are sometimes called with a doppelganger peer,
> + 	 * who tends to have a plethora of fields nulled out.
> ++	 *
> ++	 * Some callers should not attempt this - the io pthread for example
> ++	 * should not touch internals of the peer struct.
> + 	 */
> +-	if (peer->curr) {
> ++	if (use_curr && peer->curr) {
> + 		size_t packetsize = stream_get_endp(peer->curr);
> + 		assert(packetsize <= peer->max_packet_size);
> + 		memcpy(peer->last_reset_cause, peer->curr->data, packetsize);
> +@@ -1001,7 +1005,27 @@ void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
> +  */
> + void bgp_notify_send(struct peer *peer, uint8_t code, uint8_t sub_code)
> + {
> +-	bgp_notify_send_with_data(peer, code, sub_code, NULL, 0);
> ++	bgp_notify_send_internal(peer, code, sub_code, NULL, 0, true);
> ++}
> ++
> ++/*
> ++ * Enqueue notification; called from the main pthread, peer object access is ok.
> ++ */
> ++void bgp_notify_send_with_data(struct peer *peer, uint8_t code,
> ++			       uint8_t sub_code, uint8_t *data, size_t datalen)
> ++{
> ++	bgp_notify_send_internal(peer, code, sub_code, data, datalen, true);
> ++}
> ++
> ++/*
> ++ * For use by the io pthread, queueing a notification but avoiding access to
> ++ * the peer object.
> ++ */
> ++void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
> ++			   uint8_t *data, size_t datalen)
> ++{
> ++	/* Avoid touching the peer object */
> ++	bgp_notify_send_internal(peer, code, sub_code, data, datalen, false);
> + }
> +
> + /*
> +diff --git a/bgpd/bgp_packet.h b/bgpd/bgp_packet.h
> +index a0eb579db..9f6d772bc 100644
> +--- a/bgpd/bgp_packet.h
> ++++ b/bgpd/bgp_packet.h
> +@@ -62,6 +62,8 @@ extern void bgp_open_send(struct peer *);
> + extern void bgp_notify_send(struct peer *, uint8_t, uint8_t);
> + extern void bgp_notify_send_with_data(struct peer *, uint8_t, uint8_t,
> + 				      uint8_t *, size_t);
> ++void bgp_notify_io_invalid(struct peer *peer, uint8_t code, uint8_t sub_code,
> ++			   uint8_t *data, size_t datalen);
> + extern void bgp_route_refresh_send(struct peer *peer, afi_t afi, safi_t safi,
> + 				   uint8_t orf_type, uint8_t when_to_refresh,
> + 				   int remove, uint8_t subtype);
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
> index 4b218a61e..20e847223 100644
> --- a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
> +++ b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
> @@ -6,7 +6,9 @@ Subject: [PATCH] configure: Check for readline() function instead of main
>   main is not a function found in libreadline, its better to check for a
>   function thats provided by it.
>   
> -Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/11893]
> +Upstream-Status: Backport
> +[https://github.com/FRRouting/frr/commit/9399d58c13257849179d3c2b3698a2b43bc1b2a0]
> +
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ---
>    configure.ac | 2 +-
> diff --git a/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch b/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
> new file mode 100644
> index 000000000..09988946b
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch
> @@ -0,0 +1,48 @@
> +From ec3bb054c331f9d928ac21a1747e0f921b51dfbc Mon Sep 17 00:00:00 2001
> +From: Michal Ruprich <michalruprich@gmail.com>
> +Date: Tue, 6 Sep 2022 12:25:01 +0200
> +Subject: [PATCH] ospfd: Adding SUPPORT_OSPF_API define in ospf_spf.c
> +
> +It is not possible to build ospf_spf.c file with --disable-ospfapi because
> +ospf_apiserver.c has SUPPORT_OSPF_API around all function definitions and
> +that results in an undefined reference to the ospf_apiserver_notify_reachable
> +function error while building.
> +
> +Signed-off-by: Michal Ruprich <mruprich@redhat.com>
> +
> +Upstream-Status: Backport
> +[https://github.com/FRRouting/frr/commit/ec3bb054c331f9d928ac21a1747e0f921b51dfbc]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + ospfd/ospf_spf.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/ospfd/ospf_spf.c b/ospfd/ospf_spf.c
> +index 46492ff6b..4edc1de81 100644
> +--- a/ospfd/ospf_spf.c
> ++++ b/ospfd/ospf_spf.c
> +@@ -48,7 +48,10 @@
> + #include "ospfd/ospf_sr.h"
> + #include "ospfd/ospf_ti_lfa.h"
> + #include "ospfd/ospf_errors.h"
> ++
> ++#ifdef SUPPORT_OSPF_API
> + #include "ospfd/ospf_apiserver.h"
> ++#endif
> +
> + /* Variables to ensure a SPF scheduled log message is printed only once */
> +
> +@@ -1895,7 +1898,9 @@ static void ospf_spf_calculate_schedule_worker(struct thread *thread)
> + 	/* Update all routers routing table */
> + 	ospf->oall_rtrs = ospf->all_rtrs;
> + 	ospf->all_rtrs = all_rtrs;
> ++#ifdef SUPPORT_OSPF_API
> + 	ospf_apiserver_notify_reachable(ospf->oall_rtrs, ospf->all_rtrs);
> ++#endif
> +
> + 	/* Free old ABR/ASBR routing table */
> + 	if (ospf->old_rtrs)
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
> similarity index 95%
> rename from meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> rename to meta-networking/recipes-protocols/frr/frr_8.3.1.bb
> index 607ed8b9d..c69720e6f 100644
> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
> +++ b/meta-networking/recipes-protocols/frr/frr_8.3.1.bb
> @@ -9,12 +9,14 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
> +SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.3 \
>              file://0001-configure-Check-for-readline-function-instead-of-mai.patch \
> +           file://0001-ospfd-Adding-SUPPORT_OSPF_API-define-in-ospf_spf.c.patch \
> +           file://0001-bgpd-avoid-notify-race-between-io-and-main-pthreads.patch \
>              file://frr.pam \
>   	      "
>   
> -SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
> +SRCREV = "a74f7a9ad9623e6f9654fe4a7177e5da0b194828"
>   
>   S = "${WORKDIR}/git"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98944): https://lists.openembedded.org/g/openembedded-devel/message/98944
> Mute This Topic: https://lists.openembedded.org/mt/93885940/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

