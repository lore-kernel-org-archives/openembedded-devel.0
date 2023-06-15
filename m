Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29E5EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:07:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20949.1686841625155934400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DffUFyFJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55300b703e=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FAvA4B027711
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 08:07:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=LG6D9KIUNMQ1+nuIsWMaYS1JHTWOkQ3dDaJUfxjvHps=;
 b=DffUFyFJ6LIrsJAtX0Z7qpmYKbjGluZ+o7fSRZrPBskezR7EAb9ScCQ/0ohy553b/eN1
 724+js2B0tGNDkXAIvns3IBdT4/QK7SYcAulQ40G6H+KiVwW8k6MJ/c+6taKgVPIxTze
 TzGnunSJmtnpDHsXhrvC5uY45tGj8QzuR2nwcGgqkYQwEmkqjc6H1ZybgobX+Cwl9RYo
 De3hKXUfRlCozPx1nvTag0GL+eXqRQEG1Eu5rQnFebhWqT3XJANQlQ0t3XtoNOU6HAla
 mp2NIVrsvBy1qpQVmoMbNl++9+RUvEPQI6+GtI03+FC0upiZVcDkYoxRerG7Uypx5j+6 SA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf34vag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 08:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxbZ4eWnzyEw0AlToiZquu0AVLxz4S3GjLliDFCo2GsIoUbjk0MT1M2KH29L9S0snPpdDpL6zha3u4dlXKHN28APl6LvIndvARHEQVPhUXBDPSs6PHybHZwe7KrG4qKazKziR8Eo5E3qJyTFSlal2Qx8RjaMsYhf89oW7e8mqdmbja6ey5jziDyrV0VxCAvn78mxMRjrWeY2UcT4SJ23y64dVjH7fpcSiB1qzN4K+d80eEtAy2tRBFOXfDtdIBDOOSt+8bhQ5BYyAU6oO40wzOdbGcIQT4MxxaRDIvZZbiEnCg0ZthYgjYZvE4Rh+ceQ1CCkUENZitMKdJm91KnGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG6D9KIUNMQ1+nuIsWMaYS1JHTWOkQ3dDaJUfxjvHps=;
 b=b3FSogFtpXg4RWbolO+JnZfanUdRI9K6jkC+t6stP6aZKYYonNzG1TA2pS1CBsb5WApZuc2nRWj8fo4r3qFMLfS2rPrr51CbCQP2eP/rsfUQjF6Bl0M+F9SMRj6/Huhu6SAkX3J/OywV3XLd8bPcLcA0BXAhjWWapv59SkV4v22+nzB8BccfeiRY8qngLCdJ2jcgYtG8mgGoyQCXMfJnwKPsVTCDBvffd4xDDFP0CSrJNnGp5W7sYXWrVlJ9aWdlxjXS4o33tNGu5CwKa0qXSOeJkiPdCpEP9I14SsieoktqH/ft6YjzQDKa+E43ksmZn7Zvi2llnri2fhCg83KIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 15:06:59 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 15:06:59 +0000
Message-ID: <5d2fda9c-c993-1d26-f36e-e75a42571a37@windriver.com>
Date: Thu, 15 Jun 2023 20:34:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] opencv: fix for
 CVE-2023-2618
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <17621A69EF96117F.8048@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <17621A69EF96117F.8048@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: d94b6cba-7618-4700-b9b4-08db6db22af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Y42DGiiY79PhTHejMUOvioV90ll65+ZffuobH1tJcnGwwm86GodvbgJSV1tlA2WfTwEo0Ez9vMh+35W68UvLz5++OSDxs+2lyKbxodKhxDHSSeAI3o5v5KZvlKOFmojp5DMeCCqnc+oZ3udEieKfZmaOJF/wyyWK4c7fTCE2fcIKqZPlzzFLtXvfQD/S5VX8v7aajoSb0yoaNc2JGJ+DVydRThxKxppvAPuwOnHkCAjaGtuVm42eK/2n8y8qX7IYna68jWq1Cei0aUqxgnQmt2mLRfd/ow/hhgngrC4lBOPWQrn51lUllRN9+TvXk8dkvcXF2fH37DXbN3yMGH7LhM3YPruE60wRz19fhOAZ4cl9QzU/jq6TQj5h8k7aowb3bAOv6bTOcG+/oUSn7X20+uieGck0LZ+C3PHug9GFlhr2hmVgVti/IRCvBtMelEtJZsXhvOmPkSFfOaV3eNUJFQ3ySQrP9Dbbb/+A8HLBJKgRjXtlUJIinAaPyLRJsaoRGyMsBGC7aizzNnVy3UkKx/sBLiopd+6iiBFT6KT84p7WTEDF9oKapXKBosh6mM1vAsN7G6r+EpaYGVSbBLg0q+fhBIHpJOl5XvJUxM6x4tC51x7EfHmPiWfwJhkC01i
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(5660300002)(478600001)(31686004)(8936002)(41300700001)(966005)(107886003)(316002)(8676002)(6486002)(66899021)(6506007)(186003)(4326008)(6916009)(66946007)(66556008)(66476007)(6666004)(53546011)(6512007)(26005)(2616005)(2906002)(83380400001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0lVQzhuclplODN0S3BVdXJTSW5oTWlVWkRBK2VBeXhrZ0VoYndVcEZuM2NT?=
 =?utf-8?B?d00zNmlzckZweXpKOTVINVA0UTNhT1liVEl0aWx5U0hlY2dleWU0UmNoeThz?=
 =?utf-8?B?WFhVSjVTR0l5dXZFYlRXVjZBNjQzYlh5Qm4yT2ZMOUUrdDFKWll3QTlWLzdS?=
 =?utf-8?B?Q0hZTlBaN1hDQ3hicjJkM0tPQWxGcTlhTHZtd2tYdEpjS1VCLzhlZmxITFB4?=
 =?utf-8?B?NEFuSnc0MmF2UTNFd05MOXdoYnpUcmljcnh3YU95dFpxUjRheDhMTTFiVmR2?=
 =?utf-8?B?b2drbm5ycUZjdzYxR0FRMXQ3SUNzUDBDWnVpYmkwMkRUWmYzbnZRKzRCTDNp?=
 =?utf-8?B?MEYyWUsvMWJ4cEtFaElWd0VKaU1GWmw3dXpOMHB4ckdLNkplSytXRUkwVDVw?=
 =?utf-8?B?M0ZjY3l1ZTg2b1MvL2NWVXlXUmNmVVg5WEdpOWRlcDd6M3hRVTg5VVYwYXJ5?=
 =?utf-8?B?QmVxQ0dXS0RVcFI3SU8yRUd1TnpHSnpOMnhuU1lqdURvYks5Z28rdGZvbTlx?=
 =?utf-8?B?aTMwNDlLWVNRMDg3YnFIR2Z4QzB1eHBXcEFnWE1pOW1ibjJMdjVTbE0vNVNM?=
 =?utf-8?B?V0JKV1V4SkVKUHNPWTg3bllYemVNSXZMMmhDRy9hdktYejZEeVVWL3NSRHM1?=
 =?utf-8?B?Q0RQVk1LRWF0cS9KVUFjMS9DRGNuWHVyS0JQMzBuUzdyVmU0QTNKaWgzOCty?=
 =?utf-8?B?UmZRUzNmK281MngrVHpBNmNGTk5BTnhsa3ByWFdXNkpyclhmWndRejlUaDRS?=
 =?utf-8?B?M0RtQ0RyVDk0WHhxb285cXlraWk0U0hzeGVWNjZKaW81QkFxb3IvWTJTM1Vk?=
 =?utf-8?B?OTdOWWJyQnNmaHdPM3Qvd0xiRjMyZ01FaEhXeWduV3owL0lFRjIvK2tvZnk4?=
 =?utf-8?B?YWZQdWE2M0JpWjRqN1R2d3gvclp4S0QzYlhJVFV4V1p3MUF4M1BpZWZRbEJK?=
 =?utf-8?B?UHNpSGwzWDVsNzZYcXVpbnhwYjM0N3h2dzJXUnZSQS9KMW9KandmNU15Zzdw?=
 =?utf-8?B?Qytnd0lLNmhGZ2lwNDJCVTc3RVprQjNXTHFSK3ozNDE0RU1YVnJNelIxL1dm?=
 =?utf-8?B?L2t3V05hNm5DMUNMVWpJQTI4V3RhSHBmVENGMkdJMml3WHIvMzJYSDNBbFFh?=
 =?utf-8?B?bDZmbHhkaDZqTnVKOCt3ZUlUMEpna1JnRWNDalBtSUVqczBuK2VRUEdsOWRJ?=
 =?utf-8?B?ZzVoUGpWQ0VZQ1J5U05CUCsxeElUYU1EZi8ybEZCaGt4Nit2dmYxbDhkNmk0?=
 =?utf-8?B?RHNNTVlrKzZUOXk3VmdkWlR6V2psdzZ1QnVXTjNDOHdLWG9sdGgzc3J6cXVx?=
 =?utf-8?B?OFNhMDVhRndQWGhqRUFsRkUvQ215NWd4ZjdEb2tpWlJZdXA0YkN3TnVIeGZV?=
 =?utf-8?B?V3VaeVNHQmYxTFF4b2dqbGFxMDVOYmZ0Smh0QW91YllHYS9uOFJjVmhEY2tC?=
 =?utf-8?B?aWY5cFhPVFVwajg2YU9QcnlMS0xiVG5OaGNSTURpMkFpbkl1SGVqNHlEbjli?=
 =?utf-8?B?YzlGRTlWKzQwN0xDci9IR3V1eGk3bDN6R0tNNmgxakRGZ0kyTkhUcG9QcHl1?=
 =?utf-8?B?dDBwcFNnelZRMjlML3N4Q1IycmJtb3MwS1o2Z2UyQ3RmOUY5WVZNRDhuQTUr?=
 =?utf-8?B?eGsvd0lyclppK0YzQ3JTby9YU05sV1RPeE1YV1FCQ3hrcnRHc3FHK2xxSXpO?=
 =?utf-8?B?MEZyWHdmR2xOQzhNZnRvaEp1NXZHdUkwTnc3NVQ1bU9YN1RIOTVVRzlRVFE3?=
 =?utf-8?B?bTFUZko4bFRJaFJWQTlOWS8rME9UaGR0NnBTUTY4eFBTNGwvejVzazJ0blBs?=
 =?utf-8?B?YitPLzR2ZWMzUVlreXNSWmRaeVJuNjJZdXRXYndIeWtFRWlra3JiMHlNdTVq?=
 =?utf-8?B?TyttR2V5YmpWa1Fad2svWldjSWJRWnZYTGcwWkhCTWI0RFAyN21mQUFGV2Np?=
 =?utf-8?B?dVVRS1hTa3U0TzZkUkVFRitaeUVLVzFzMm5KcnJ0SE9JeEI3cGwwaVJaVFZM?=
 =?utf-8?B?NXBGRFB5bC9KcVdBZWMvU2RETHRxaXh0RXNqeW9YTHVTMDVzRUJ1QUszWGpD?=
 =?utf-8?B?RUdCeHJLU2hxQlJkY0FZK1Z3NEFNbFpxQlEvV0gxU1dSNXVYTVN4eFhId1Vp?=
 =?utf-8?B?WU9WWUQreEdKZWMvcDlRY1V3SlZYTGI4bTlEcjI1ZmZLVlR2cDhneEhYWXM4?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94b6cba-7618-4700-b9b4-08db6db22af3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:06:59.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjbMC6/sGTlbjudNHzCqhELeugEjwClSbZfXVQ/QyaBdWIZ7uKqTQlT5kChKohuWbpE48G3E5cbPHYkJO2NaB2jEiBhjKPra9+n9XtPhxEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-Proofpoint-ORIG-GUID: ICa2BHdIctMZHSCuu66-XbK-0yFcaPqf
X-Proofpoint-GUID: ICa2BHdIctMZHSCuu66-XbK-0yFcaPqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103313

Reminder.

On 24-05-2023 19:53, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> A vulnerability, which was classified as problematic, has been found
> in OpenCV wechat_qrcode Module up to 4.7.0. Affected by this issue is
> the function DecodedBitStreamParser::decodeHanziSegment of the file
> qrcode/decoder/decoded_bit_stream_parser.cpp. The manipulation leads
> to memory leak. The attack may be launched remotely. The name of the
> patch is 2b62ff6181163eea029ed1cab11363b4996e9cd6. It is recommended
> to apply a patch to fix this issue. The identifier of this vulnerability
> is VDB-228548.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../opencv/opencv/CVE-2023-2618.patch         | 32 +++++++++++++++++++
>   .../recipes-support/opencv/opencv_4.5.5.bb    |  1 +
>   2 files changed, 33 insertions(+)
>   create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
> new file mode 100644
> index 0000000000..4cd3003e3c
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
> @@ -0,0 +1,32 @@
> +From 2b62ff6181163eea029ed1cab11363b4996e9cd6 Mon Sep 17 00:00:00 2001
> +From: Nano <nanoapezlk@gmail.com>
> +Date: Thu, 27 Apr 2023 17:38:35 +0800
> +Subject: [PATCH] fix(wechat_qrcode): fixed memory leaks
> +
> +CVE: CVE-2023-2618
> +
> +Upstream-Status: Backport [https://github.com/opencv/opencv_contrib/pull/3484/commits/2b62ff6181163eea029ed1cab11363b4996e9cd6]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + .../src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp   | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
> +index b3a0a69c..f02435d5 100644
> +--- a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
> ++++ b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp
> +@@ -127,7 +127,10 @@ void DecodedBitStreamParser::decodeHanziSegment(Ref<BitSource> bits_, string& re
> +     while (count > 0) {
> +         // Each 13 bits encodes a 2-byte character
> +         int twoBytes = bits.readBits(13, err_handler);
> +-        if (err_handler.ErrCode()) return;
> ++        if (err_handler.ErrCode()) {
> ++            delete[] buffer;
> ++            return;
> ++        }
> +         int assembledTwoBytes = ((twoBytes / 0x060) << 8) | (twoBytes % 0x060);
> +         if (assembledTwoBytes < 0x003BF) {
> +             // In the 0xA1A1 to 0xAAFE range
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
> index e4fb676f7e..f98fec72b1 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
> @@ -52,6 +52,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
>              file://download.patch \
>              file://0001-Make-ts-module-external.patch \
>              file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
> +           file://CVE-2023-2618.patch;patchdir=../contrib \
>              "
>   SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=../contrib"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102780): https://lists.openembedded.org/g/openembedded-devel/message/102780
> Mute This Topic: https://lists.openembedded.org/mt/99109738/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

