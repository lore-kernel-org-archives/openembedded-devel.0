Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCF2C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 15:52:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36811.1685634724510020978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 08:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hYPRXYOL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55165c784c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351Du5SW008818
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 08:52:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=tK0iks8PnJp4N+XMmJRIXtC56wAjb3wwfdD5cpyk+FY=;
 b=hYPRXYOLL0D9+gtTG2Fs6SZqHHDwKJi2skIpzVDYu5SY09Bk3ULn2YJOvh/8cb1S5STQ
 pV80cikREFjRSaGPZMAzscbCfxoKMsPKLxzMSKUKr9/PBoXMOntWo9hUyIahaUMu7yVn
 5lYUqbQxIvt2fGGf7phuWx9srOpbtiyxQ02eVZhhLgqd0Vkx1dbx0/B04Yp6WMEUPxjK
 fH2gxFw0DEapNlRcEd2LQ2UHdpls4iQLKwyNo6VtKRUB3GasG2gI7HVjCeb5aSxMiOIn
 UcVEY1y1Wdgkd6XP5d3LHXKnEqoXpyOInYEWfRBbfPzquw+MZBH1PUU9RM6S25VXB0vK pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53ct9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 08:52:03 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 351Fq3c8022307
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 08:52:03 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53ct9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 08:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Swwwk7V9M7YtNqo6mp+ofvgeBXq5FzYo3FyHBA0SQNj+O36kI0pHWdYrRFcy8NS9CleY29RnQivWv5FeBtZzpwR2eruPkRuplGmRxZeyRmNkzBlnna6ByPPNn/FNZHE47++tTdBgnTJXYcrB/8ReLk0Q/zn+HB7neosrv2OtosWCyWozpdA8eVeih8/r36InMra7SAHFn3fKcU5Ny7A8eaJGaUWY9oNwv677OyVeFfjFyYPwCryiLp8Y05pP5ZJvabPU+5q7G/Mp3FgCbwb1NhHmOA0rlsVvTy5/wpYpiKj2vgnzmRyXCz8/FQ3gR3KGtcu7NPpEsZ5VsHeN9KXLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK0iks8PnJp4N+XMmJRIXtC56wAjb3wwfdD5cpyk+FY=;
 b=EYziHKgMjgKTCM8Qz4Kj3ep45ycWNcW+HKGquXOlTCPd8HKm0MgYVJ3+uZh+i9uvBp5VEyiN4yrHczXTpOyx4nbPIZGmlHNNPf9P7kjXhJ6VHkxKc/TW8F5cpSzVpxNOzD+QeYn/sMX5FO1nnIc1Iea+2UEF1Wi3fZXq2sYjY3SOutL8+v6kqyNtwlp8cOG4BjyQDLYP5DsmPxTSsojyUSioGYCSUP1B9YwVunvsIKKvnW8eprykHBusRn0P27JrMYFH0ZPJEtfu+EJ0G7mAPXhq8m4r7THOpFsuIMAzBO+pI8WCVm0U4s7cx7f1zkuFE3z1IjjloNp0GTZFxIKK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 15:52:00 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a2e6:a5d4:b628:fa7f%6]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 15:52:00 +0000
Content-Type: multipart/alternative;
 boundary="------------6xlnC7IlQfYqz0Cxv1aIRlxh"
Message-ID: <20054ea6-97a5-c28f-efbc-ffd862b82032@windriver.com>
Date: Thu, 1 Jun 2023 11:51:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade
 4.0.2 -> 4.2.1
Content-Language: en-CA
To: narpat.mali@windriver.com, openembedded-devel@lists.openembedded.org,
        "Reyna, David" <david.reyna@windriver.com>,
        Armin Kuster <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <20230531100257.3467702-1-narpat.mali@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230531100257.3467702-1-narpat.mali@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 7736368d-785c-4c85-f3ff-08db62b822f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AGDl0tglELkde4yC84PZDO8xXDXrwg5pv7FrjkXexl37IVIPGZAcEq4WIFWB9oKBsPAEdkt822BbN5CsF2H1To7P3iqukMcEMK/f60H1eIrEWsb9ghJAL8YO0iKB/X4diP5n83ItfbJFmSpVsmLpX7mJ3QnmSVvr1JsFcW1cuMkx0BmAdqM5SStdJCKLr+oXS2D2wSYVYCNMM1vtTRIwsFO+1cvS/Uh8QPDGvuxxJAGrV2CXe0nyCTR4D2AIKx8f/bM1audcIHZfIX6wL7U8/VcZ+pzROPx2gIlOKClaf+1xVPOOA3gEikKzXl/jS73Feg63ymiysDrBthinFkIuPH+YABjOx2w3tjKDuSIeWjLGWhGwPYOnPWU4m3Nz7PRdlRCpDv5V+2wDA9q/8+xbjHYo4R7togThKZflunRZuU4IUTkjzWvgxyUgfxt8RPynpNEDTZeLm5BJIcx1insLP71cSM3bI7oYnUd4Di/iqJcIZMHHHEFhKWJbX4vjGsTRNz9Ct5mtTOz7uI+4FupNa+COSynocBJPwcV1XdnlQEnTxDkBjUz2/WYWGgtvUt8QLSRT+hcOzG+4iBEsTzVxZxAx82D3PmhcuZdvzFlNa7p9NZ5bfvQvqc2wjHanmTHSRvnKCejwVvSj0syfKPEYPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(451199021)(31696002)(66476007)(66946007)(66556008)(186003)(4326008)(2906002)(36756003)(6512007)(26005)(166002)(6506007)(53546011)(83380400001)(2616005)(86362001)(31686004)(8676002)(8936002)(5660300002)(107886003)(38100700002)(66899021)(6486002)(478600001)(41300700001)(6666004)(33964004)(316002)(966005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFMwZ09pZGNHbXZTakswNVF3a2FyUFFCbmc3R3J6aEtFVE93TUVhUEJCM3lT?=
 =?utf-8?B?dWlKdnpBUVA4Sjd6VVI4dW5tdHJ4cHY0NDBza2NsUDZYeDdGMThocVI3VStr?=
 =?utf-8?B?RmdXdzVlQmJMQ212S3UwMU8zQ0hibzQwbnBQdEYzY0MxanpDTFNtZnJFYUts?=
 =?utf-8?B?aEIyN2VaaDhLa2FkS2c5SmcxTHAzd1VIOVV2QUI0V2ZvTHRjeVQ0QWxKWnIv?=
 =?utf-8?B?Vm4xclg2MG5YWU1qc1lRM2JwS3VyY2pGWjdhRjJnREd4LysrMmhXVGpCK3lh?=
 =?utf-8?B?ejVBcWQ4TVFKQmk2R0l2SGgvd3hrY012eFJvYzROS0JCNE0zTUJhRUdQWFE1?=
 =?utf-8?B?YTBYTHEyRWVteDVaeEFRTkhJNVZEWjFYOUFJNlFKR0h0TU42L0prQWdMbDBD?=
 =?utf-8?B?OGhyWGxyVlEwUUNlSlhRZVo0c1EwTGtZNFYvRmI0QUp6ZEk2TmNpejMwZ1kr?=
 =?utf-8?B?ZTErR2pHUXBLeUFGWmR0Nm9zR1ozbXFsTVNkbVo5QXI1b01Bbm1FUmxBQ09y?=
 =?utf-8?B?ZGxpVGRTWDUzN3VGUFpiSXU3T2FqeWNwRGVEcU5PY2VBSURGb2U3bDVXcWtK?=
 =?utf-8?B?UjdZL1Q4L0Z0b25nVGorYU5nT1dCY0JxY3RVZE9ibDVZL0JuWFUrZU9aOU9G?=
 =?utf-8?B?alRGc3FIS3lZZTFGUWcyVmp3aEhjY0VJS1FaeTNNS0tjZTUrRmk3NjlGUFc1?=
 =?utf-8?B?SlNwV3UrV0JldzhybjZxVlBGQmRSajZ6Mk13SFJEc1VzbmhKTXJxWUN5anpU?=
 =?utf-8?B?QlpzYmFsR2J3eXFjU0FJSWpuemdPNDFnNkdLSFVEQzRSdlFyQzhoR1JOcGpE?=
 =?utf-8?B?MXNaR2ZPenZhT3UvamlwVUh1TjlzK0V5OGhZRjhpR1lEc1pCWjFlWm8vWDlw?=
 =?utf-8?B?QWdnZXQyYzJiSERlQnpDTnhrcVVkQlpSMFJJTUhndTFOa1lHNmdKYU50WE9a?=
 =?utf-8?B?b3ZzYXl1bVF1V1lpM05OTldGYXBMN0NCOXRPL2YzOUpLdC8wM3hXZDRRems0?=
 =?utf-8?B?SGo5SWF4cmdCNlZNQVplL2graEhndUh4cnEvTU5FRjhjeXJST1c0QmEwTTV4?=
 =?utf-8?B?aytBT2hleE01S01YN2NTelgzVGRxUkVPL05RZG8wYVRrZFhpY1I5RXZ4MG1Z?=
 =?utf-8?B?LzhxeXA4V3dOdW42Y3ZwaFJ5R0x3Zlh6QXl3TGJZOTJlWE82TWZZTHV1RllT?=
 =?utf-8?B?ZXIxMlJpMHJsdHNCM0w1elNJRG0yWHExOXJtOEQ3VGJuTm9OaktJL0ZWbEtT?=
 =?utf-8?B?aE9OeTJlcVIwUm5zVUhFOGpweEI5NjVTcUhVd3htd3kwRHRUYVNvWTdYR0NV?=
 =?utf-8?B?MmY1ZVptM1JpTVdJbU9oTWV1V1RRdzBKR0U3STJuTDJiZGtSL2h3TnZYM0xw?=
 =?utf-8?B?SVJnWklRUHo5ZjkrOXAxMENZR3lPdWl4dVNTRzZxM2NaaVdOSEV3U1NPOGI5?=
 =?utf-8?B?cThnOU5oemFhM0N4L3FReUF6SjRuUVZaRks2R2VwNzZ6c1NMbzcyK2xiUUE2?=
 =?utf-8?B?VDE5KytuMFMyVENiMEt3bnpDb1hGdy9mVTlGb0k2cjc5dXMyOVp5SFkzRXpI?=
 =?utf-8?B?LzZCUW56K2dHOEFodmxqckYxdi9UQ3djbzh3NkZyNlRQQzY0ODExWXNyQ2dF?=
 =?utf-8?B?TnhOY3llL3ZUY24zWWozWEgyc0NXTndMelpabXBlUkNKWkJMNDhKWDJMNTRK?=
 =?utf-8?B?UDdXRURLS0FtWXBVRksxM2didTlZR3k5T1JDZzQ1d2k5bWJhUEdMWjFmYThr?=
 =?utf-8?B?U2xySUsxZW0rZzFNWE52U3BTU3N0bmRIWmV6K0FJQ3NFdGQwcTdLS25SUTYw?=
 =?utf-8?B?RjB6MzhlU0xIQ0djV0NoQXRyTWVNUm1xYU5samJtTmsvVDc5UGhmZnV2NEkw?=
 =?utf-8?B?Q2JMc1VqRWh4WURDYWYrQS9hdjVLTzV3YkpYSUNQL0dCdXh1YjFzK3htTXMw?=
 =?utf-8?B?QVBrdjFua1M0QjJjOW1JVlljajhQcTExOWt0eUxyRFVISWxyT1F3YjJ0b2Jq?=
 =?utf-8?B?QktYeGV4VkY1eWxlUGh2cWVSSTJHTkFjYUxueGJoeDZ4RlRUU1lVcWFCelBl?=
 =?utf-8?B?elFDSnoxOHliQVVubHVxbGxyMVQ4YUp6MDZVVDhPTlNxR1lFL2xRdk0rbEpx?=
 =?utf-8?B?blMrODZNVnFyVjZkWVJZL04wZnpLUWt4SE1NL3JxbFJZeGJQemQ5bWRtWVBa?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7736368d-785c-4c85-f3ff-08db62b822f4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:52:00.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inbDACoDMJmICAQ2UAF6HR9HMo+0fawEBNDDy2ONIvKCdzCY5oogWmZMkgRzWroRahYu3uoWlUAlHiGMxF4tqDQFFn2dbZRVlVVrNhCA09M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-GUID: CGCBIizgW0mkA5U8MoHZaPaWyiroy3SQ
X-Proofpoint-ORIG-GUID: 2dyQYDIjuya0ECSD3D8gLmqOhG1QML_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 15:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103080

--------------6xlnC7IlQfYqz0Cxv1aIRlxh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-31 06:02, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali<narpat.mali@windriver.com>
>
> Django 4.2* is designated as a long-term support release. It will receive
> security updates for at least three years after its release.
>
> The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
> bugfixes.

Thanks Narpat.

Also I spoke with David Reyna about this and he suggested that
the 4.x version was added mainly for Toaster support. David
agreed that updating to 4.2 LTS would work for me.

Right David?

../Randy

>
> Release Notes:https://docs.djangoproject.com/en/dev/releases/
>
> Signed-off-by: Narpat Mali<narpat.mali@windriver.com>
> ---
>   .../python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> index 690b9809dc..4daca65eb5 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
> @@ -1,7 +1,7 @@
>   require python-django.inc
>   inherit setuptools3
>   
> -SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
> +SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
>   
>   RDEPENDS:${PN} += "\
>       ${PYTHON_PN}-sqlparse \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103029):https://lists.openembedded.org/g/openembedded-devel/message/103029
> Mute This Topic:https://lists.openembedded.org/mt/99238868/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------6xlnC7IlQfYqz0Cxv1aIRlxh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-31 06:02, Narpat Mali via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230531100257.3467702-1-narpat.mali@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>

Django 4.2* is designated as a long-term support release. It will receive
security updates for at least three years after its release.

The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
bugfixes.</pre>
    </blockquote>
    <p>Thanks Narpat.<br>
    </p>
    <p>Also I spoke with David Reyna about this and he suggested that<br>
      the 4.x version was added mainly for Toaster support. David<br>
      agreed that updating to 4.2 LTS would work for me.<br>
    </p>
    <p>Right David?</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20230531100257.3467702-1-narpat.mali@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Release Notes: <a class="moz-txt-link-freetext" href="https://docs.djangoproject.com/en/dev/releases/">https://docs.djangoproject.com/en/dev/releases/</a>

Signed-off-by: Narpat Mali <a class="moz-txt-link-rfc2396E" href="mailto:narpat.mali@windriver.com">&lt;narpat.mali@windriver.com&gt;</a>
---
 .../python/{python3-django_4.0.2.bb =&gt; python3-django_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb =&gt; python3-django_4.2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
index 690b9809dc..4daca65eb5 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = &quot;110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a&quot;
+SRC_URI[sha256sum] = &quot;7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c&quot;
 
 RDEPENDS:${PN} += &quot;\
     ${PYTHON_PN}-sqlparse \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#103029): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/103029">https://lists.openembedded.org/g/openembedded-devel/message/103029</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/99238868/3616765">https://lists.openembedded.org/mt/99238868/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------6xlnC7IlQfYqz0Cxv1aIRlxh--

