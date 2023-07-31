Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2B8C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 06:45:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2046.1690785951724667161
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 23:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LUZ6XEH6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75762f10d7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36V4pNG6007097
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 06:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Fbq/tP/FP6Emv0rwFPCO1ZpEACLQlaIJhxftenjsAWs=; b=
	LUZ6XEH6cufIM3uxit8UyA2i14ggxvBuml+COhaAQioVqfpeSuwaNYGEGwNTZrgx
	HHkO7fnVkEDwr7Ir+GBNH3JVmxmjyOqxFzuKBASMK/8IMhQ8qGpDbR6Ood62gLFl
	SVCdC6hz9NtIvtQhxXPo8M0PZHUeGJATUFKOAL2fVWLCuKiS4ZawjSxVNmsa+qAA
	tWPISYjHsctmDSx0UZMo/fX9xASqSqF51Nr6yNkujmBZ54Yi8qKt+J49/axVUnpc
	G8OdsVviyC1P9/lo/Xqv1L5Ep2eNVZYxPHt6la5V8z/Axs3jeLpvnuz63QEyaNJV
	7EFDG76vZSyiQQnYiH0xmg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx1f7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 06:45:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuNwS3KcVL5452ShyCPByWCyVbm9lpPV5KldbKHbyjiOol0y6NNrYXjbKQnGyHr4bDAxjYZq1VUiW8bH7TtcwIP+dlhqDNC5jZAkCJ+JMniZiI6s092fExzWWGgkahoZYTpgzjf3/DXUgFtU5dxLSdQXrPLX8VbZgly/bI6L9ZQa3EMX0gGdYdK3+SGdRe+bVN51bMg1vHf+oj82ZoT9Qn9P4SquOftypjyqcm1RCIsrK/QT7ex2Qtcahz4/Zjynfc1Srkjr9wPRSsauyumQi7iCl7RXBb1k1NjA3FjEzu2aepxHmFaM/SbWGheVUAaM0lVaTwS/yjVL37pU49L3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fbq/tP/FP6Emv0rwFPCO1ZpEACLQlaIJhxftenjsAWs=;
 b=f2HA25umz2GPOIfvdY8A3v2Ijjlj83Z6bY/by9o92TEXXpWytfCrykPsvo+ZKElDbgtLaQe0lzsBcaK9ty5nltPmWLkD+Gdf/ezcXMgEzByvcQ2JklJwKcJjbLjK82rZQ8AboLaSNXHXfXJGM6pZB+DG8ITVl9EA/BIHYtyYP6qKXeKYZNcpzjEySaNiMO5YDCpFAXpRpyVRHF7VuIzSciIXQ8WKRQ26ZwzI4pYFZkQb0jqA9sqg7GWpIwthSWFTRQilVKFc16jWrFW733zdMXT9tNaOV8MgMl/NE66F8NfA0l0UmyI8oXEYsWtAhQH2Wwg5AxIoWS7r4SPMM60FEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by SN7PR11MB7668.namprd11.prod.outlook.com (2603:10b6:806:341::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 06:45:29 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::1172:5f0b:ee28:da90]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::1172:5f0b:ee28:da90%4]) with mapi id 15.20.6631.039; Mon, 31 Jul 2023
 06:45:28 +0000
Message-ID: <2c639e39-0d0d-83ac-057f-386dce57187b@windriver.com>
Date: Mon, 31 Jul 2023 12:15:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] libyang: fix CVE-2023-26917
To: openembedded-devel@lists.openembedded.org
References: <17733928820082F3.32574@lists.openembedded.org>
Content-Language: en-US
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <17733928820082F3.32574@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::23) To BL0PR11MB3410.namprd11.prod.outlook.com
 (2603:10b6:208:33::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3410:EE_|SN7PR11MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a5d246-d206-46f2-4831-08db9191ba5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m3HuHfSB84m6ix0vZ/moiRT+516wC9cjePfbJfbHlnN5hZnjJ4Az4AJKW8pm55voA+BrLad1dGe6oHjABGzzmZJ9beTpZ7uH4sQHmc+yNzFp5Zo/hR527fC+4wCjzzgMNTqY7JZNgcu5s6/ODk0lJsJLrxqF2xac4zK3/Gw301o7t5JoG0UMgt6p0Z0JlDT5cGRPVrgILuNBpJP2eCqTwR2FxeS6eGHCqRtjiHa1BpkFkHcBiVL5i8VZQr6sNmILhklYN40kIn3hm7yqDh6O40HxNfKNVf6+kpRrFxsTXrzrSXodzlDI1h5hgPh/LDfrrZ2OQBKzFxgyYPDhPyfbIUbVkf2+NQEtMgwXBS3uye3qHvpsqYv84p6bEFrCrBnH6C3Mrct7PEJMDz3O1Wa7k1GYZ+x4DZW3Y90MzMgn9X66EfrAJffntTnhNypIZt7W/NcO2c6Pld+uWjGQo+Jjdc1ACQ/YOpE7bc77dcvzyiZO054BQmlEwJk8bgACWzS4mlQ2Kedt3I1ssNR96+Qfzvx6gI6Q1qFUlSnpBU9HquU+4Wf44+JJATByCRLiI6+5YNyZyrW4/w7ZT3GHtKdm8bNMLDlw+daf8TiouzEbYtAEatE9wJVgnfCK3ZBOdCih7/Pj+KYZCFLfx40c4MZf3gxLc2CQEhUZy75bgazLR9I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(451199021)(6512007)(966005)(6486002)(36756003)(53546011)(2616005)(6506007)(26005)(83380400001)(186003)(66946007)(66556008)(41300700001)(31696002)(86362001)(66476007)(316002)(5660300002)(6916009)(8936002)(8676002)(31686004)(38100700002)(2906002)(6666004)(66899021)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmRIZjAxMlZQTHBmOGxIUm9naWM5QkJvVy8rR1VCYnJoQzRTMmFhbmdDWDZw?=
 =?utf-8?B?K0NHWlh0MllTZTEzY0crQ0dVTzFOekZzUWRteFljbVc4cVBDbjRPQkR1TU5o?=
 =?utf-8?B?c2daZWNWQkk0NHZFZm5iWWoxTnVOblJSdTZJL0w3WXoxSkptckZkWkNYK3JV?=
 =?utf-8?B?UmQ2cHFuMTZjWmFwQlNCZm5aOTZITzlacnVlTWM2NHRjVUpReDQ5OEYwS2Vi?=
 =?utf-8?B?K2YrYURFTzhmNUpKMTJLS3pzaUFodW5PSGI4aThrQVhGNDBWd0l1ZTV2WXEz?=
 =?utf-8?B?M3l0L09WWWNOMkZ3a3pOTklwb1JyOWJJNUY5SjhwWmpMYW1vcU5yeHM1R2FD?=
 =?utf-8?B?NytYby9YbjBYazY5S2xqSUgyKy9MdkpXdXdzc0wrL3VUR09UVWdFN21Ja3FR?=
 =?utf-8?B?bXRpNWttNzFGeXVvVmZsdjZaeUY1bnJGNW1obTlqQ1J3Z0pBbHVaN0FmRVFh?=
 =?utf-8?B?R3ZwYm9ITkFXczVIbnJNR0hMOGplTDNlc0loRlAxSm8wZFRzSmxkSU1raGxQ?=
 =?utf-8?B?TDRZalhvMllTeGU3Wm9FNXpoZm05Y01NRWhwZUdTTjRsY1UyQWtHNnh3aEpt?=
 =?utf-8?B?SXROTGdpYmZlYUU3R0NNSWxWcWpoeGY5WXRhZnN3ZlhRQnZweVVlS3U5RnFY?=
 =?utf-8?B?ZjNFdTdnSWY3aUpvZVJJbmQ0WWJYbWFxbkFrTVBSdnYzcDF4YXJUNzM3eHlk?=
 =?utf-8?B?L2prOUZBUU02NGJCUGZWb0NNc1R0NkFrbTdGVzdxRGllY2RGM1pRNTEwRUZq?=
 =?utf-8?B?cGxmNXBmZ0pzN0dHUFF3NndtU3ZZUCtlemRSSkFVY2U5aU05WmFwdmgvVk93?=
 =?utf-8?B?UFhmZzhwWEtoT1R2dXZUMEdjNmZPOHRqelBZTmljTkNZVTBqV1V2VHdNaS8x?=
 =?utf-8?B?MTgvbHlkQW1aODZxYVhLS1hCam5lWnNRbDBJTWRsTVNwdHJTWFp0QzMzYmhm?=
 =?utf-8?B?NWp2SkV1WitkZVlMcEQxT05wNWxsMnN1b1hIN0N0amVmeGdNTjZMZWVoYmtP?=
 =?utf-8?B?bHZDdjlYbVIyd1hSdTQ2NUVIbzVvOUR5bEV0R3lDNjB5cHZEWC9pNUVKblg4?=
 =?utf-8?B?T2hLaDZzN0tFekVSTmNBWC9nZjJ4YlowTlA3K0tIZVV6enN1ZStIbnVqaDRV?=
 =?utf-8?B?V0hBd2tCb1lINXY5OWhpOWlPMGxES3pXWG14eTZyQ3lNMW02b1NSUFdvN0E4?=
 =?utf-8?B?aGpMTlkwKzFUcTZkTlB6eWRQOGQ2amhLTVBsbG5QL2FpcVRab2I1ZGpBRG1l?=
 =?utf-8?B?c3E4bXozTTY5UGY5bW5nMSt6QzFGVS9MdGZRRWRzeFVIMEdCNWlHc2I2c0xG?=
 =?utf-8?B?Ykh3aGh3aTJ6NlJmUkZveFBtMVB0NFQ0T3NBd1JUdU5iUFRVQkF5cmpsRHQx?=
 =?utf-8?B?SG4rRmNyK0VNTEdOZW9OTk10OGZ6NldBNmtsTTNWbEJCSUxhbHZjWlo3VVh0?=
 =?utf-8?B?bXVxTTViL0ZkazNMVlZSTjZ0WEhUL2Fob3N0TFdQWEQ0a3lka29kb05xQTNi?=
 =?utf-8?B?dTlROXNNQ2h0dlB6YVk3SVM3dytDaThoQ1pST0VYendVT1g5NitxR0FSSWth?=
 =?utf-8?B?U3VPRGlWenRvL1hGL0R4U01NQlhPVG5kUTh2WWtEOTY5VlNNOHNtZVdpVTdv?=
 =?utf-8?B?THVkVDd6bHdWRkpSMEhMUU5tckxJak8rZGg1ZHZQMERBb0JWYytQcTYySGFZ?=
 =?utf-8?B?UU1paE92ZTBXN1B1SmtnOU82S2hNeGRDU2gzUzYyWVBNUldUTmFhTDBuTjBL?=
 =?utf-8?B?NzVvTjZVTXU1VVR3U05mYmJiMmcvUFBzTUFQYkcxRDViMG5mbkZyek5FbUtn?=
 =?utf-8?B?M1JpeWdyUUtwc1hRMDRaOWtrbi9ERjBJSWRUTWg2cy8wd1hJOXhsdkVDcUJh?=
 =?utf-8?B?d0FmWjQzUStzMWhQZGNvblZ5a0ZzZ0YxdldvREdQSnVDeHZYWHhmMEtDbGxX?=
 =?utf-8?B?RXdVMnJNZTVwVWlIL1BtODZHY2pYZVl2M1krOUttYnRGbXI2T1paNlZBSk5Q?=
 =?utf-8?B?ZitObjc3TDN4QzBBVFRGRXNCcTQyS1RORDdvbnhsUE1IRGYycW13cFYvQUF1?=
 =?utf-8?B?TEluZUhscmtUVDdkbU81MEx1Vm1UYm04L1QzQ0FxZElpWkFXK1lJK2tjTnUv?=
 =?utf-8?B?cVJvNGVCbGFpM1E4emwwVDNXbHo2a3FUSVR2SnZzWEV4T0NEMnVNMlhoU3pW?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a5d246-d206-46f2-4831-08db9191ba5f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 06:45:28.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJ/oXAD0T52rSm6y/6/Jy5tH2hDPzIFIhed0VqdyYMC29h28ga2ze7feeo03epcWVBzcudJ6AKYm0Wf8AKl2d+QTAxgbHL9QIMpbegU3Rzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7668
X-Proofpoint-GUID: cm43HISvnd-t0yz-lE07VF57tmxA-rvE
X-Proofpoint-ORIG-GUID: cm43HISvnd-t0yz-lE07VF57tmxA-rvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=504 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307310060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 06:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104156

Hi Team,

Gentle Reminder for this patch review!

Regards,
Yogita

On 19-07-2023 14:28, Urade, Yogita via lists.openembedded.org wrote:
> libyang from v2.0.164 to v2.1.30 was discovered to contain a NULL
> pointer dereference via the function lysp_stmt_validate_value at
> lys_parse_mem.c.
>
> References:
> https://github.com/CESNET/libyang/issues/1987
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>   .../libyang/libyang/CVE-2023-26917.patch      | 40 +++++++++++++++++++
>   .../libyang/libyang_2.0.164.bb                |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
> new file mode 100644
> index 000000000..d7ba2fb9a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
> @@ -0,0 +1,40 @@
> +From cfa1a965a429e4bfc5ae1539a8e87a9cf71c3090 Mon Sep 17 00:00:00 2001
> +From: Michal Vasko <mvasko@cesnet.cz>
> +Date: Tue, 18 Jul 2023 10:41:21 +0000
> +Subject: [PATCH] parser common BUGFIX handle missing YANG strings
> +
> +Fixes #1987
> +
> +CVE: CVE-2023-26917
> +
> +Upstream-Status:
> +Backport[https://github.com/CESNET/libyang/commit/cfa1a965a429e4bfc5ae1539a8e87a9cf71c3090]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + src/parser_stmt.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/src/parser_stmt.c b/src/parser_stmt.c
> +index 81ccbfca6..2ebf822ab 100644
> +--- a/src/parser_stmt.c
> ++++ b/src/parser_stmt.c
> +@@ -52,6 +52,16 @@ lysp_stmt_validate_value(struct lys_parser_ctx *ctx, enum yang_arg val_type, con
> +     uint32_t c;
> +     size_t utf8_char_len;
> +
> ++    if (!val) {
> ++	    if (val_type == Y_MAYBE_STR_ARG) {
> ++		    /* fine */
> ++		    return LY_SUCCESS;
> ++	    }
> ++
> ++	    LOGVAL_PARSER(ctx, LYVE_SYNTAX, "Missing an expected string.");
> ++	    return LY_EVALID;
> ++    }
> ++
> +     while (*val) {
> +         LY_CHECK_ERR_RET(ly_getutf8(&val, &c, &utf8_char_len),
> +                 LOGVAL_PARSER(ctx, LY_VCODE_INCHAR, (val)[-utf8_char_len]), LY_EVALID);
> +--
> +2.35.5
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> index 7875c1ef7..eb3f32251 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.164.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
>              file://libyang-add-stdint-h.patch \
>              file://run-ptest \
>              file://CVE-2023-26916.patch \
> +	    file://CVE-2023-26917.patch \
>              "
>   
>   S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103958): https://lists.openembedded.org/g/openembedded-devel/message/103958
> Mute This Topic: https://lists.openembedded.org/mt/100231873/7312273
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

