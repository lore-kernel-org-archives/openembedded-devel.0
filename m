Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63241EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 05:35:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2190.1689226514187940435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 22:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q75coniu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65586f084b=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36D4HLEN030186
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 22:35:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=A2SXvXrEuyMw9RjgKnQ56HMweMMY6WyzZlUkeol8yzo=; b=
	q75coniuyWc4/F04zshuu2vvtEAs4yG8Pp1qMEr9DEqkl10lwI+sfavWMOvBEeHu
	CFbwpO0N81sWTr2+1UTt0EqEcaFPAUFckO8EAYL6QUJ7DE1a5jZygFNEcckK83k7
	zHhAmV+URWgjY/V9ZDiFFIZCAWI/DvJboPVAUYozjM+sed3gXXXF58wVVFcuxbZZ
	CVXE3hD6BI6f+wZz0WuV9o3/P/vF7Rcb9+8vIVIXbinaLdF6cMcXtSBp65MbUXL0
	WI/N1zTTTEnJ6sMW7ECtfgC7sP5Ihn2rX/GBici0UO2U6RPuDhM6eRAmRB1ptwMh
	0R2E0RGp6sbC1dvSNlJ3qg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32ym6pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 22:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHAcZEfEXEFutwpnHt3aiEe3BUDxRPt0Dv1ceApS56IpQ0cVMsSOReHNy1q6kDniJdO8yXLfJBrN4QGZqLMh2JVem9MamwGEbtUZq24kqCr5JeU0HUUT3ySNhsqFRnzP4Zs+gbV1c87v4J1zfwhT1rFJir9/UNmfCNM5UlQ+LndhWQUg6d0BCo88M064Fv+FOfKazS2Rfv4lgE7Kup4t+wpD2sp7WtaIpG9gwdQY1cEOjdDDWlcsY2/X9EcguLvblTNEaqT03pHXCugool6wc8tXR4wSGbcZdCu/Ajo5d42uqd/7kWYjvMmIb8GB0RBhYSyUXh8HAjQUmBdRZwvgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2SXvXrEuyMw9RjgKnQ56HMweMMY6WyzZlUkeol8yzo=;
 b=C2PGbF0SDQuIwjvHt9GTPDR2mvSXGGTKDMc3iDEdQiFq4WwLn0+zudnivP30cdDSgGTgXynO0P5EarBBhiColuu921C7nAo4YQP8y81tuliQZxsmT/xOxcxoy0bv94ZQJ+uD24RbVYTQTW76mnprv+v1vbaGOL7qne/vVknkA4X8k5sOc1TMOOFPNWdIVMU6O4dDoImjItq/dB4G76PjpREFF4sjMdXMbpe4Qp+8jC1iglxWqObkneWdkhsl6NEuO4Dfp6kuh5JO2zbb0KKIbqaPBxwVid3l1QQOsYz3kp5wjf8g+3E7YFpNPeZjlbuPJEF4FPhiK0np6G6STEA90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 05:35:09 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::300e:dc33:6680:e494]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::300e:dc33:6680:e494%4]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 05:35:08 +0000
Message-ID: <78e604b2-8c5e-f684-6efe-b17d3503268c@windriver.com>
Date: Thu, 13 Jul 2023 11:02:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [PATCH] frr: fix for CVE-2023-31490
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <176AF427156A6329.20970@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <176AF427156A6329.20970@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:a03:333::28) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: ead4b6cd-56aa-4f77-e307-08db8362eb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0FTl+/LkXC5iWLqNOSCY2gMWpB9CrQL8tkbdIatY2xmupCVptM34UxMGDM3+kJ8Vad8ynaEMpHV7+hSLxH2gopqAD5NqouZed/IMVy100ovJeybD8w7nCRS7G3RvUNUOhqC2ALdMD67cr6Dv0mi0eupT0IZgDQtFX5r3eHz8UyBJYuBxnLiOjEijBDGWjTUYE83mBbQTSIZUGDo3tb7xQ7UeX2xMkXTZ7oYBMk7yZYHw2x/LAaj2p7y0l/KDzcX35jlK8eYqoOsTdvu6kAZT3nY9oJAOGh29ZmHqHmRrvwU40ruyAhRECqPmOTChwVQhP/NKCXp/wdbxTqNAuxaZa4LVdZ7RmJSLcmtHwUWRMpK01aB/rKTE87pWJPTnWcQAvB5zCODjbeAVxbw0SnenYFVG5bG1X+l3lpgvljlxd0H82k9LwNIprpwe8HFuHTPJ9WXimlhNMXqs5WG2n9FywTt5/Im5K+CNVfFejHgTmO8AcOxhbNOatnOjTCaWyoQAj67EYx2N7gBtcFKjX3yT8U3JNK6HQLXk6EN0RM6lwOscbR/xp8qJ1HVBkvQolZXrgG2uBciriZIjv7ewPpqUBXyLMaH9XCFav/PcRTps+Cq5edP60+OUYrETD9YFhsTpvmMULagxmyXwYuQq06/myo4PCTEKUmO/yF73QTs0C/8wcLR+mBuLJdp0xOiCGE8Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(451199021)(478600001)(6486002)(6666004)(186003)(26005)(55236004)(53546011)(6506007)(6512007)(966005)(107886003)(2906002)(41300700001)(6916009)(4326008)(66946007)(66476007)(66556008)(316002)(8676002)(5660300002)(8936002)(38100700002)(31696002)(86362001)(36756003)(2616005)(83380400001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUN0YkQrMnVnY1pOWlhFenpCa0Q0ZFlGWW1CTVd2TmdyajVqd081cGhSNlV1?=
 =?utf-8?B?YzlXQ21jOURXU2RpSS9BZzVIY0wvTnFCcDRnOG96VW9zUTJPVFMyOG1ZSWxO?=
 =?utf-8?B?cUFCRVBVdm1NOWdJaysydTlRaE5Mb1ErWDEzNUtXcm15NVZzNmtnWlAxYTEz?=
 =?utf-8?B?VnN6aFp4VnV1aU5PTWVLaDZsdVhrL1NjVWNiczV4VEZobEdkd21hSlN0SFpW?=
 =?utf-8?B?eWZxY2hIQ3RZUFUyK2M2NmJKeG5nSE1YWFpLNytXS29DTEZ0Ty8xZDdvYi9n?=
 =?utf-8?B?cjRUSDVkampDa2tLVjVUZXIvTHJoZ2I1NlhEZ3l4QmRzR1BueENpVHBGNXNy?=
 =?utf-8?B?TVRSNUVkOGU5TnZKT3habFRLcXpPdU5vT3A1aXBoT01pc3QwS3hmY3FWMC8r?=
 =?utf-8?B?RXVCeXhrTW83YzM2VUUrU3hCOVR2WUNNZFNQVzVrT01INlRaeDdFYWtCY3BF?=
 =?utf-8?B?RjJEb0xsZEZqODNxMlBWNDlKOWdVWXg4NnMxbm1GV1B1NGFOVE80b0h6SkJQ?=
 =?utf-8?B?TjlFTnJOOWc5NThOWGxpYWMzaUREN1JwLzhkMlVGRnE4cFdoUk1jMDBaUUhh?=
 =?utf-8?B?QkZyckdObkJRdTBvcG1mK2krMEZFNFdXL0RiTjFWWHhEUEU1cm1ZOEgzanlD?=
 =?utf-8?B?WDkxQ3RzazdXK3NmN2R1NWVqdUZGNmpjRmpMbmFUT3JWOGdQV1VobVc0NVhB?=
 =?utf-8?B?K3pqcnZ6amJlVkFWMTBCK1pOeVBkNGRXaGpwd3hWTVRSMzQrSWVsTUx2a3Fj?=
 =?utf-8?B?NW5hSC9UMUNiQWMrT1YwYTJHSXVObmJRYUhoa3RSSDFTWm9tWWFqOHlIY09z?=
 =?utf-8?B?eG5vL0g2cFBTWXhRTFdVRllXVHd2T2hLdmNEZEJsUi9DTU5FdHVkeWkwTjRo?=
 =?utf-8?B?UjBQdjVlV01MNVB3WDZHdmdnUEdnd2dUYmZuK05kMTV2YitBRkM5QksvcEha?=
 =?utf-8?B?YjBZMTBlcEw2Nm1nM0ZlUTRVRnp6S1VBMGxYNHd4YlM4dEQ2NXRkZjBVUWpT?=
 =?utf-8?B?QWdZS1BJMFlxOEZmVCtlV2RnTHZUSWJOK2FrcVV1ejdmQUQ5NjhMZjlRZjMx?=
 =?utf-8?B?WnRwb3JwNHkydkZKV0Fuc0k1ZVBNM3NMVkkxN2RjODJFZU1LN1JYS1I0U25B?=
 =?utf-8?B?TCthTzZtek5BdjVmRVFDZGdGRVhMeDIwYmg5VTdDMEFxS0lSNEhSNnZjSXBu?=
 =?utf-8?B?M0w3a1dUMTBtWURIREV3Ymg1TWlaRVBpZGZKME1FcDZ3WEZEVTRCQURKdnln?=
 =?utf-8?B?cGYxQUJOSWJkK2Y2d1NIdHdxZnBLblg3dUF1UmtRQWtwSU03QTA0ZktqaytJ?=
 =?utf-8?B?emhWT2FZL3Bobzdma3Brem0zcGduQVZSMnBNODkxVXk1TzlIdWJ1N01GTFhQ?=
 =?utf-8?B?czBFUUJPbmFNY0RWSXpaYmtWNC8zdzhDK1B2UktJd1dQWCs1bTZtUjdkVFVx?=
 =?utf-8?B?eGs5M2hQVU9ITldPS2tySkNVRGRuWXFZUmlLSEhXenZTeUhGSUY5RndnVlhj?=
 =?utf-8?B?NlZhTkVLTmpIMmU1bnNybnNKSjBFRThJTXhVL3VrMjY0THY3UHNCT2dxVE1R?=
 =?utf-8?B?bThKcHlqenZFOXhMZ3BWMGpjejRZb1BDTUJYRzNzcThrYm5idVZGbUZhMjNt?=
 =?utf-8?B?Z2Y3MjByWlJSNWpNWGpYL3pWcGJoR240TWo2SG8wUnpSUjhQeFc0OUg1Z0w2?=
 =?utf-8?B?SWpFbnJha1Fubm5NSG1KN0JRV0NnRWY4VjBmVGVXVSt0R25GU0F3ajFLRndq?=
 =?utf-8?B?bXJjdzZpTHBYcm9VUkQvVGx2Z2Z2ZGMwS2JmVlY3Y25UM3VTT1A0Nk1aWmJj?=
 =?utf-8?B?VW9EeWdCTUtkN2kyU01SRmUvdG9uQU9mK1ZxMHAvY0M3SmhGQXFhZGVzdGJC?=
 =?utf-8?B?ajJpaFU2b3hFUVRISjBpbFE0c1BWSG10a1IxZFRRVmFNMFFjYlRKTTA4RXhF?=
 =?utf-8?B?eGtOWDlZeWxjbjN6QWc3QVl0UzhtOFVnYmRaN2QycHhjcndFZGEzNm5ON1Nx?=
 =?utf-8?B?bElIUmtUcEZTQ3ZGZzVLZm5MQ2JPcytlbHdWUzRjL3BZd1lGRDRFUXhEVkV5?=
 =?utf-8?B?Mjl2Z25iVC9tMjBoZmlwMkM1WGtDQ0J2SlViaTNmM2x1dFozY0ZVTGhLWWFI?=
 =?utf-8?B?M1VsMm1kY2YyYk1iSEorWHl2bUJLRkVLa29yZ1JUZDV1WDFLQ0Z3dlJKZThE?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead4b6cd-56aa-4f77-e307-08db8362eb49
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 05:35:08.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cVrWdrQwqNKveqNz+Odln4u+PTXLnWR7BTOTxwtr4KOmvFBZ9Tb5rfqR463qYsOQrtckpDw+cKPMZdqDc/5erxLBNInB+hwL8WOFF+06HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
X-Proofpoint-GUID: Qh_1tSqc97dJY8qvLnrRCBLfFNfOcPLd
X-Proofpoint-ORIG-GUID: Qh_1tSqc97dJY8qvLnrRCBLfFNfOcPLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_02,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307130049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 05:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103852

Hi,

Please ignore this patch, I am sending the new patch with correct branch 
name mentioned.

Best Regards,

Narpat

On 22-06-2023 15:53, Narpat Mali via lists.openembedded.org wrote:
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
> index 0000000000..d7b341d769
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
> @@ -0,0 +1,160 @@
> +From 72c13aac2eb7c8f3a10ad806d80ab635c28f4c04 Mon Sep 17 00:00:00 2001
> +From: Narpat Mali <narpat.mali@windriver.com>
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
> View/Reply Online (#103485): https://lists.openembedded.org/g/openembedded-devel/message/103485
> Mute This Topic: https://lists.openembedded.org/mt/99694865/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

