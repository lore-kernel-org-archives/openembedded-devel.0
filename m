Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B97C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 20:31:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2217.1665606704397808092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 13:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eFj8gNyj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7284059a10=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29CHTYnh018140
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 13:31:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=weP8Pg+q9xAU5bgC7eil6ZuWpSJmPOi/A1fQIvJ/+yQ=;
 b=eFj8gNyjTZTlirG+kTONEBmFylBrU1Uscf7SzPVjTvfUuE/BQAKiNMgzSgCvD1Wysjb8
 rXMLidMDYBkI0M40M9V9njaskK3c+HJoES0JnFJq75uqs4J852kHU10x995ok2fxc/1w
 LPdMXg9QJTgXQGUYEzTEj3krf/PE0qzT3h6azmyAj5XA3vYYFrthH0Gdl3yi78wtdEwa
 NbfUDoskwGqyLHChBGPZiVMxBV59AYLM0wDRYmpsmFsGpPhUziWzCailJWdLdZiqQ2NI
 8VzXweZiXhvagYGdKKLugLqVFFofjAe8Jy00Xpht/vLDl+ucNFWBKG8Kf/IR5y0N+0xO Hg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjbd7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 13:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9knmzr82FtEJjwYoYp67mcxhnrRIR5b2Q9fhjPh+g2OQPH9Lk2vTvsHmYaoci5LB/Q293Yb5eklygY0f5EaNPe+ioUdvL+FFPA5RK+k0WjwA9dY2v4MWNydXajhylvqPsFDyhJJZa7oQPSsNgOPyRtj2xAVchvARp7gWF5fNPIcXQ5Le0znWfLB/fmmsuSvejlDxpehjDQjqoMgfob2YZfTmzZteY/FuQfW614zGLu530myP9LJXLmnsbeooD0SzsMPZ+zVOUbJofDkISroWrh2iaZGBjZ8Fwo6bAVKKDW4s3ayl+jo6DHKWKZx4gzJ+H/xnNY1z309UJ3qsWOVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weP8Pg+q9xAU5bgC7eil6ZuWpSJmPOi/A1fQIvJ/+yQ=;
 b=RZWhwvmtVCsbTlrFXrooYmggc9JEAG0cq0xMIfE3uGCYvOlCTuQQ+yMESjQFTcbGBJin4IEBvZYdUKFARKXmhfi7VQGfnaEakeP+WogCPWMAxMuFew3Ug4o3c+OIqiRQn7PPMOwY1btlOHiMUXsLZiYLZRCel4CTxKqrluyY8C3CeyRQRWLEC3ppDCfOQH4UvPl4HKIe+57widxVlfaxz2iNRFBJCFkAF2VBQtAGzP9T4YoLlhuf2bJSePukVdXMCZh/U6VqAQcgwqxv2iO6YP/H2E8+f8RkdQTFK+QiwHxucA4GlJTN96C5yYkko6IQwEJ7SpNmAiQwkwTJhwUy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 20:31:40 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336%2]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 20:31:40 +0000
Message-ID: <d5971712-ac32-3aa3-6a55-ac1065f4107e@windriver.com>
Date: Wed, 12 Oct 2022 16:31:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] minicoredumper: retry elf
 parsing as long as needed
To: openembedded-devel@lists.openembedded.org
References: <1717494B1CA56C80.8072@lists.openembedded.org>
Content-Language: en-US
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <1717494B1CA56C80.8072@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::23) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: adb70deb-3eca-4b67-f224-08daac90c439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqpQ0bQGYMfVsUeGQ2eHQXc2YM3f1CaFSJOOnmy4ZhdLx1gj5HATWxss2N0sDSTWDINy3Xw0CfGwoWlqSzcxdXNj4tW0cxyr4E50gE7PYKWFgF88kzzEoanlAKi1gIJRImQw7sn89zj7HUYZh9vMDpFt2BRQgkZK28X33+Kp4y0zaODS17EWd5HG/Pmzmo1eDXwas3EZP61vGu3ObDU54mCyjCrb1auzdbKyWNisp7Utf0Xvkk7cRMmiYGnX7OFewq9iB0NQZkgYMi05iEQ0gL5Vc2wHKqBaYGm6hF3u39jU7ntlM2VBkERipgyfOHF0dkM8FcCBdCsnoGrL1ztLI3szj5mzRhPySfD/+cjc/DIe9iiVmrY5A/hCckN8iZfzy2KT5jsdXmSdYylThbbABVBYvXXbVDDNbp+TAMBRGQWaOJL2B0WtejRwbN9HEooXxcWgys9yHcbf36L3YCvdGOOPPResfpvMvw8yCRVVcRlhUw7rYXQ+oJ3UCwkGirgpKTc4n1LcyZzk9acBAl+BfIuUsd0kI65CHogdcMNRAdN2Jc+LQQWuwVTXyA+blVQ8m63ajB70QDMZgTjWjE3REED/mGb3I4/CogBzWxQNRkbWYztJryZK3ul/yFDuzQuFJQxgdcjIpakTTFjuRSqGZ3HdRnJ3LkiGP1uoTfpJDc65RmGr9zMYLYYJynmXVI6O7canAbbyBhKIH3l2eXxOgtk6ebhLwInVAzZVcSoliF+sjlHvi+FsLfsNSjjb8fsz2rUifjM8UFpBvAsi7wXil30orKbdzf5RFLbNizi19dh8SNIFLEdrWNkpC0KcverndNMAuWjLCGYxbOlvXaECBwwzmW2lDeoNCEV76kewbTw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(451199015)(2616005)(186003)(83380400001)(8676002)(5660300002)(38100700002)(41300700001)(44832011)(6512007)(966005)(26005)(6666004)(6506007)(316002)(53546011)(6486002)(6916009)(478600001)(66476007)(66556008)(66946007)(8936002)(2906002)(31686004)(86362001)(36756003)(31696002)(84970400001)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTAzQ3Vpd0twS3g2d2JrdnJPNmxOQzNLMWhEY0NobS93UzZmVVF0NGd2bmFL?=
 =?utf-8?B?RmxFeFp5OEY5UGIyL2pRZUlxQWE5TmhhOTFycUlNYldmd1VRa2JnT0RwQTZU?=
 =?utf-8?B?U3ZQbElWQ1cwVWJhL29senVQR2lDVzJIOU5xMHY0aG9UZENTMDBiVnIybUlN?=
 =?utf-8?B?VVpVQ3VJRTdhSnR0V1BoWW9mc3RMY3ZWL3NwNTVqakg1R0NnUmdjYXROKzNq?=
 =?utf-8?B?WWorTjNYYThOUXFINjMrL2x6Z2xXSmxxVHhPNHJ5YUFadEdUbnVoODc1ZlNa?=
 =?utf-8?B?VXlyUTMrSkcxNEpnZVF3a0JzWlFoSjhRRUliT2lvc2d4eVYzZWVsZHpqNzVE?=
 =?utf-8?B?ejd3bmlDR2tIdGJLY3M0OVpoWlVLakpMbk8xOWtydWQ0bUNCZnd1VVBoS2Nt?=
 =?utf-8?B?TWZMMGRUdkM2MWFreS9LQUNiL0t6Y0Z6MXVrcVJxRndZUmRwNXZ3T1Z6SFZQ?=
 =?utf-8?B?NGVuR0tWR0YrbFIzMnkvTGwwT0g2ZWRMSDBRaG1xSXdybmJUcDYzR3BKM3dZ?=
 =?utf-8?B?OGpmcnhJS2MvVHdOblVSRHFieUlRTnJFMDZER0Z5azRBN2tXSkQrUHU4TWk5?=
 =?utf-8?B?UmNiWTFZL0lKbWRqK2FoS2dxclpTRlBGcC9oTU1qUEl6TGQrclBkZ1NGT0lP?=
 =?utf-8?B?Y3ZxUUdxQ1ZXcEd5MnM5VG9hQWNiNjRleGZFSHBVbndrK2RYT3padjFEam9i?=
 =?utf-8?B?MFZHcThyY3ZTbEtiZEx3anVyWStzWmIxcGRNWFpUMjVWYndsaWsveU9QTHBa?=
 =?utf-8?B?eGpCVnljQkZtSlVLU3JvUTh0bmQvNUFuNlRKNkk5ZEpPNG1BRzBOWU01L3hC?=
 =?utf-8?B?UWpMOGwwRUlLeWg1UnlZUXFFZ2FXbkRYa3FYWjhvUlNrTTgvd1N1Ynk4eCsr?=
 =?utf-8?B?dGltb2d5ZXlqLzl4Tlk3NjAyNVlsOXVBbnVVdkVJUDdyUjNGOXdvTm9YS0Yv?=
 =?utf-8?B?QmRaVUF1SktUWVp6VDlFTmx6VGZyZmVpbjY1QTdiZ3lsUDNEeEFPZHlMYnE5?=
 =?utf-8?B?OTg2a1FmTHJObWJkM0JYbTlHMW9vdm5HMHFQcFRiR2lUTTJ1amZtaWk2Y1dz?=
 =?utf-8?B?blZWVlJlVGdJTXp2V2IxYWQ5UVFNZm84cXpiTFRjTDQ4UWEvMjRWN0o4OXB2?=
 =?utf-8?B?L0lBdExUMGkramwxTjJoR29aaE5xSUpLSUQ4V2VyZUxxOGFQd1E2Ni8xOGxx?=
 =?utf-8?B?eTFnVG8veEtreUdUMXpQS0hLazZmN2EvR3k0K0FxK0FmZ21jVUtZSjhKbDR3?=
 =?utf-8?B?MHNHOE1ZYWNxT0ZOMXpROFV3dXlyN1JIc1FWY1JRbzdyTGVBR0dnYk5ZVXpj?=
 =?utf-8?B?bmU2Q0ZwS1dqM0MwalA1bDRLR1cxY2FXS3ZlWWZWdUMxTEpxNU1Kck85QzA4?=
 =?utf-8?B?cWg0clhmdGhuOC9DT2o2ZDlaaWZmUWY1ZW1oaitZYlprN3pZQVRvT3BXOGRI?=
 =?utf-8?B?Qkd6eTdyUTFra1UvY0RENG4xbFU5MXVQRWxzR012dUdEVUhDMFpLcG1FY0Nx?=
 =?utf-8?B?TWVvU2N2NXkyZk9nN3NCK2NzZ1BVcEowa0FJWE5ING5QbHhYQ3lzMkN6enlw?=
 =?utf-8?B?NmljL1VVcW1sVlNvWjZSZFoxOU4rV0R5QlRGQmZwcmNDVXFpZFVWaWJXdU44?=
 =?utf-8?B?NG1DK3lFbWNZVGtCUlc2UmtRQVpiWFZIMlhEU3ltSStSYXlhVU4zeFpaV3RF?=
 =?utf-8?B?alc3TDJIQkYzUXUzRnBSVXZzQkdadVVOYU9DMlAyQUpNSWg3Q3J4SEc5MS9a?=
 =?utf-8?B?RnhYWHFIblBHNDFTVmlEdldCbkRxMkFpVFdVWml5MEcwNlNTZzlmY284eVdn?=
 =?utf-8?B?WW1JVWh6bGNxWG1MWWdOeE83UHZqRDlsdjhBUDgyWWVmbUplSzJKbGVNbXFN?=
 =?utf-8?B?cEFUMm1SVjRnYjNYKzF5OVM1dCt4elZRVVJSSXpTdUlIeXBmMFQ2YlpUd1hQ?=
 =?utf-8?B?SjZENnZPQVdmc2dmYk5STG8zbW15SFJSMHl3aFNtdjV1WVdXU2t4REVDRDVp?=
 =?utf-8?B?RGZpUExwS2wvK2htdlg0dXJSNlZuY2F4Q1ZEcW5JMU9sUm1zRE02ZVN5TlEv?=
 =?utf-8?B?NG5oQ0RLZjgvU1dWajBqNVNOVFd6U2tqSmJla0tMd0ZIMmtHS0JTclBUeE1z?=
 =?utf-8?B?R0RiVjhncXNqZkJlMDVYWnVMUFJsWGpML0Fmek1aZ1ZLVE9LWmwzMVNIWUZz?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb70deb-3eca-4b67-f224-08daac90c439
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 20:31:40.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvTYo0dzv/7+QVm1V/f+ix3J9P+WH1CxyjxaGckUniWUoe0Cw85sJ59K/B+q3DDNibBzVcen1obp+vQ878uBA5ISeZPoo0u6H0uuFex2Uww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
X-Proofpoint-ORIG-GUID: 16rJyjLR7iTdbdRKpEFSADwVcfVIQa1f
X-Proofpoint-GUID: 16rJyjLR7iTdbdRKpEFSADwVcfVIQa1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_10,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 20:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99149

Has this patch accidentally been skipped?

On 2022-09-22 16:38, Sakib Sajal wrote:
> Maximum number of tries, in rare cases, is insufficient for
> elf parse. Backport patch that fixes the issue.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit e231c86e282eefff0e8164551f75f8e01682abe6)
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   ...-retry-elf-parsing-as-long-as-needed.patch | 128 ++++++++++++++++++
>   .../minicoredumper/minicoredumper_2.0.1.bb    |   1 +
>   2 files changed, 129 insertions(+)
>   create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
>
> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
> new file mode 100644
> index 000000000..8d5b8b6cb
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
> @@ -0,0 +1,128 @@
> +From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
> +From: John Ogness <john.ogness@linutronix.de>
> +Date: Tue, 24 Aug 2021 21:10:43 +0200
> +Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
> +
> +As was reported in github issue #2 ("maximum number of tries
> +insufficient, in rare cases, for elf parse"), the number of retries
> +for parsing a process may be insufficient. Rather than setting an
> +upper limit on the maximum number of retries, track the number of
> +headers seen. As long as the number of seen headers is greater than
> +the previous try, try again.
> +
> +In order to avoid introducing any new issues, preserve the behavior
> +of retrying at least 10 times, even if no new headers are seen.
> +
> +Reported-by: github.com/ssajal-wr
> +Signed-off-by: John Ogness <john.ogness@linutronix.de>
> +
> +Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
> + 1 file changed, 23 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
> +index d96d1df..c96b350 100644
> +--- a/src/minicoredumper/corestripper.c
> ++++ b/src/minicoredumper/corestripper.c
> +@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
> + typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
> +
> + static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> +-			   elf_parse_cb *callback)
> ++			   elf_parse_cb *callback, size_t *phnum_found)
> + {
> + 	GElf_Ehdr ehdr_mem;
> + 	GElf_Ehdr *ehdr;
> +@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> + 	size_t phnum;
> + 	size_t cnt;
> +
> ++	if (phnum_found)
> ++		*phnum_found = 0;
> ++
> + 	/* start from beginning of core */
> + 	if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
> + 		info("lseek failed: %s", strerror(errno));
> +@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
> + 		goto out;
> + 	}
> +
> ++	if (phnum_found)
> ++		*phnum_found = phnum;
> ++
> + 	for (cnt = 0; cnt < phnum; cnt++) {
> + 		GElf_Phdr phdr_mem;
> + 		GElf_Phdr *phdr;
> +@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
> + /*
> +  * Tries to parse the found ELF headers and reads all vmas from it.
> +  */
> +-static int parse_vma_info(struct dump_info *di)
> ++static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
> + {
> + 	unsigned long min_off = ULONG_MAX;
> + 	unsigned long max_len = 0;
> +@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
> + 	memset(&type, 0, sizeof(type));
> + 	type.p_type = PT_LOAD;
> + 	type.p_flags = PF_R;
> +-	if (do_elf_ph_parse(di, &type, vma_cb) != 0)
> ++	if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
> + 		return -1;
> +
> + 	for (v = di->vma; v; v = v->next) {
> +@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
> +  */
> + static int init_src_core(struct dump_info *di, int src)
> + {
> ++	size_t last_phnum = 0;
> + 	int tries = 0;
> + 	int ret = -1;
> ++	size_t phnum;
> + 	size_t len;
> + 	char *buf;
> + 	long pos;
> +@@ -1642,7 +1650,7 @@ again:
> + 		goto out;
> +
> + 	/* try to elf-parse the core to read vma info */
> +-	ret = parse_vma_info(di);
> ++	ret = parse_vma_info(di, &phnum);
> +
> + 	/* restore our position */
> + 	if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
> +@@ -1653,9 +1661,17 @@ again:
> +
> + 		tries++;
> +
> +-		/* maybe try again */
> +-		if (tries < 10)
> ++		if (phnum > last_phnum) {
> ++			/* new headers found, keep trying */
> ++			last_phnum = phnum;
> + 			goto again;
> ++		} else if (tries < 10) {
> ++			/*
> ++			 * even if no new headers are found,
> ++			 * retry at least 10 times
> ++			 */
> ++			goto again;
> ++		}
> +
> + 		goto out;
> + 	}
> +@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
> + 		/* find and set the first task */
> + 		memset(&type, 0, sizeof(type));
> + 		type.p_type = PT_NOTE;
> +-		do_elf_ph_parse(di, &type, note_cb);
> ++		do_elf_ph_parse(di, &type, note_cb, NULL);
> + 	}
> +
> + 	if (di->first_pid)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> index bf9915294..0b934ee2d 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
>              file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
>              file://minicoredumper.service \
>              file://minicoredumper.init \
> +           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
>              "
>   
>   S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98930): https://lists.openembedded.org/g/openembedded-devel/message/98930
> Mute This Topic: https://lists.openembedded.org/mt/93857443/4422444
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

