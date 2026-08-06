Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBF6C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:37:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17473.1786015140047126150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=pQANtom+;
 spf=pass (domain: est.tech, ip: 52.101.66.46, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+OoihkLtI4WqPnwnhcLreSoIQHCOpKG7MMByscSnXAWZpiJQnTrJ2mLuq1g41NFKNm2XUUYD0cGa2XV5xcUBCQe+RW4czY948Wwcjh/y93pT9J2uoVXe6HELYhL+QtqISIaqsbwVOfXcjgh7iRqGKj7Zw7O7LMUkthNBr4SHFNEu/EYaIa1eQaK6daeKAfKUEiRiwCrvboD1oLiHyslaDDXVzCpIkNltCXkm5zL4xLVmPKf+1tc20FJXzbPglrtU6cnA3TbJSfe+d8nlgdTTMV7qFP8Yv61PtCGil/ht4Lqi50PcyPZnpt/Pjh7wjnM43Gyz0waVr/bUhkbDlD3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9QLbzxTeoDL92AHPXcN4bNNht9Y6QAMCoNfUrdWnbM=;
 b=PynPod8BKJ6r3tyYud3VWhT/Pinc03wYpg57JnMCKDVGb7CFhiI8udxLTph94GdnYE8NSb9zE06zVBNb8Om+pE/HoY/9DuRmArqhB+JUqHXWwcYYb2FQM7JIfAwQkVg15onujtX6nJOIjQS17BHQC/9gN/kCRVhMS/EZU+eCqoepAJdzgtQc+gbyFUzeoTetZFf4o6OZ5DywXUfWbZLYoJOW9QXv6l7+PQRsOISbA2HHcWqepQ3MC0Xz99z9/bU+ifa0Dp3mQd0pw8KjK2qZvN++KAnL4iE7sikwqs+3fOrOG/+D+eMgc5IqgNODPx2vsjNub2Rczh1tBbRKgTiTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9QLbzxTeoDL92AHPXcN4bNNht9Y6QAMCoNfUrdWnbM=;
 b=pQANtom+T5RMOpgdAvd+bjaQuNRQKm8pbewkAZUmBRkZkd2Ojk8nOb0exCGVk/3L2X83gWV3krzutIOIPxXp96XAVUq4BoJsnxdIY+51t88rd23ppB/JjwjTNjSF9jICOw5wxphPIbRCAbXO6dA7WSV3lM9VC3Il5N3/ZUQ41MLCyaUIKfvn56jZ0WD4L3mxkX3ou+Y0hCytHBLtcTEAO/yvTB+I5ett9Y2x1OPxTvFfeZ18hVHq+3XBU52BHeMrsApOT/6d6fc4v0gPW+9gAZU7H//VXVAnqUlLxzfgVlBrtMsTueNHET0Ylhwxn/4S4WMl9sHf/4Iaaiij0vU2eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM8P189MB1219.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:240::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.5; Thu, 6 Aug 2026
 11:18:55 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 11:18:55 +0000
Message-ID: <18c1b71a-2d5f-41f7-9f0a-0afda11eea31@est.tech>
Date: Thu, 6 Aug 2026 13:18:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [ELIN-upstream] [meta-oe][wrynose][PATCH] thrift: fix CVE-2026-55969
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: elin-upstream@mailman.lmera.ericsson.se,
 openembedded-devel@lists.openembedded.org
References: <20260806110406.1153318-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260806110406.1153318-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: LO4P123CA0522.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::8) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM8P189MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7d4c91-5576-4f7c-e49d-08def3ac80a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|10067099003|6133799003|12006099003|20052099010|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	QG4+zs9+Zoa7v3ySl/peZSP3piRe1wM4KoLWGx3ppOcJrfDqdLnJ8giLM8G6IZEeY+I1no2ocYs9GRTfVjkFBGMbw8oSR5D0aXBYvL+aM8tTFKPASewBSJqEfgiuh5MsgP/g7budU9TU89OyRgw00Wfyk8O3Ft+miVCXc5TxXjI6TLV3NILI93GNOTyjD5Uo6GsSTQsIBsfhj3au7ohDaUgVe3yDe2prwd1LQCXLY5NL51L/iaiJbKULqIqIb+wAGqDxpFGdPonEijjDzN2clcWkff4CjWy9Ggp3qhkv/5CyWqKsdfRfDVLWtDhgGtW/9+UAkknrE12t3DPk11zBHtFzzbmIA1oivF1srl13p+2HXbc6mdrc//fl0JA6yx7FEkc2VkP9cPhBcUB8iVSTkS4TIKnoGvfz6MJbHNjyZYc8BJ+lhlcX9LLaGKAjDphYKaFE1lqNPWxqpDOQwDhTOt6tw1OutipA0oim88ji+9MnkxgKpqvKlk1B+7qYs1+0nn052GyU60dayQmHh+QHN7lOcSx88ax1b1EPHGjp3vKxsqbFvsyIeWl7/szljMR5cGGI+wCjur7AHh6Ocx5/7G92WYPud9ebootcarhtqDraSBPK52LQLmK3lwwve7eIZ3wui9BEucYjiIOrTGwySvoQqivxB7jZDvd4/M1MSjA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(12006099003)(20052099010)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUZzUnYrR0Y4WW9iWFo1Tk5SVzhzZnVUMzhoZGdLSC9wMkp4bUNEMnFDSjNu?=
 =?utf-8?B?dHNDcXMxdXZacVgwVllZVlkxRTFtWmVWb3NhSDRPMElFYk5sUzF6aThNdlNN?=
 =?utf-8?B?aTIxS1p2SDdNSGtydm1FQmxZUkJ1ZDNmUGlydUFaZ2t3VlVqMitJQlBKajgx?=
 =?utf-8?B?Y2pkeVJoZDFGQmZBdmlDdmVadENzL3FUNlFMNHdIYTRaaE1BT3haclRzaWJC?=
 =?utf-8?B?UFdOL3UzWjhyUnkwN0Q5OU5oMGIyUzJGTWZOeWxtdDlwbmdUT21aUEhqL2ZZ?=
 =?utf-8?B?NVJ5QmpmZmNsdXJxeFgyZWpub1dwUWpPdlVscitkd1ZRYUVxallrbGNQQTZl?=
 =?utf-8?B?dDdKV1BmTGNyTmdzS0RjN1o0SHY3OFpwUituZGVGNmkzQlVlcUZHbG1TM2RV?=
 =?utf-8?B?M3dXM2FFTWdSbVZDZ0pReFcxL3pEU1Uzenl4UUYydmlLdTVnQk9NRnRnUjlw?=
 =?utf-8?B?bEhodjdPcjdqU1ZlSlpSRStCMCttL3BZa2VkcXFuWTVBTEZpVVRZRVpwc0JL?=
 =?utf-8?B?NWNnVTRMZE9PbXlvTHV0RUthWWd5MTBjSUltTTlZc2pLNSsyeGppSnRmcEtM?=
 =?utf-8?B?bGw5a2Y0a2pjRkE2VjN0S0FCTklINHU5YjlhOXNmQjJsMWdyaFRISG9GMmxL?=
 =?utf-8?B?R2VHVjhTbXllZXRONjk1SVVQcVVPR09iZzJhQVhWV0VvREppRWVIZXdBTFNZ?=
 =?utf-8?B?ZUdYSTQ0NW9JZG9jSmtKWFVFQW1adVJMektVMEtVVDk0dEZTbFlCV1ZIaC9o?=
 =?utf-8?B?d3U3a1BjMFo5NG1MdFp5bFRwMWE5MmdmRjBvcmhzVmhsZTIxQlNYbEQ2UmFV?=
 =?utf-8?B?UzlnMEZUQkh4VWRZWjR5OHZLUHEzRDZ2MW4ycVNLTjBXQ1kyQlNKN1NLcjN2?=
 =?utf-8?B?ZjRHcTloSWlvQnBMQW8xdm5EQ0dZdVhDR2V2U2Q4RjhmaWRSU1FFVGJiaUVN?=
 =?utf-8?B?cUhLOTE5WmNxWW9TMHJjRlFGOHhZQlhEcVl6djN5d3hkREt6T21sOUFEd1Zn?=
 =?utf-8?B?SUNZbExYeGxmckd1d1BiSlZ6NXlyZldrMUU5U29jelQvSHhWVG4vKzZCN0FL?=
 =?utf-8?B?WHVGZno1dks4L0x4d1FUZkpEeTY5eitYRCs2aUVZY0RCTEhBSHFzaWpZUytj?=
 =?utf-8?B?YUJJTDRUcGNYMm05SG9uZDVMa3pVUUpraXh5bFIrZ0ZzaXlabDNPVVNsQnFL?=
 =?utf-8?B?U0dGeUl0UUVnc2FYZ3FHaHZDd3ZCUG1IbHNHeEtpeTNvYTBCTW84M0ZDTEVQ?=
 =?utf-8?B?VTZEODRzcHpDQ2tEOFpxN3ZnWFBuNDlrY2o5R0M4VE1NOXUxcHZHaUxUdHA2?=
 =?utf-8?B?czFJbDU3SHE4R1RyTzhNK1Z6TC9pdk1BQUphUTJmbFo4am1rd0FTcWQ3TldP?=
 =?utf-8?B?SmVzeHZMa2F0S3ZiVVY4OVVXK2Z2cVpTYXVzMS9Zd01kMHdLd1JCQmJFOXc2?=
 =?utf-8?B?dFVaa2s2TmNFTytwcHZ3SkFGdGM3TGcxOWRQRU5ETlVBd0ZpYjU4R2NKOEpa?=
 =?utf-8?B?K21MT0RISEpHTElwc2drSXoyV1luS2VpQnFxaWFpWW1mNUh3MUZzMmV6RG5Y?=
 =?utf-8?B?TUZ0ODlyZDdzR0RTb2dUNEkzT1RoVkI4Z1p4TXErWjZlV2kwK0QrZkJuN1Fz?=
 =?utf-8?B?MWJWUU9LTWNMYzhxSTJKVi9xcVFadzdOcS83QXZsMERLVkhpSDdSYVRSTmVy?=
 =?utf-8?B?cEdydUp6L1REb1haWHRMYTdCTFoyTHBHbGV6NDY1OGlYTmYyZytBQ2JiK3VP?=
 =?utf-8?B?ZHl5Rkl3U3hVRnlPbW5ldWFLTkVxNWlsTVdQME1FL2E5OFQ4amxSRnE3Z2sy?=
 =?utf-8?B?Z2FhU3EwbjVMMnNkVTlVbFFudTFVRUNueFVpWUpEVERqYmdnOXU1VmJQUWJu?=
 =?utf-8?B?S05YaDVldzZZTU81UVN2SDFES3pDZC9pdFhtZmIvRUxiZGpqa0JpMmhSTTJN?=
 =?utf-8?B?Q1ZxUFFvdisxOUVUT2QvbmRpNHNyVTlVNXV5ZTFRb0tLMmE2OEY3M2wzMERI?=
 =?utf-8?B?bW9Femg2SVB1UDh1NWpoZzFGc2YvZ0lmZzJxczdzYW9jUzNIUDhOc2ZYRXhD?=
 =?utf-8?B?YURlU1prU1NUcU1PSkh1Vm9IK0k4SFhETUtidWtsaDFsaDRYeVV3bTF5bnJj?=
 =?utf-8?B?Q3pKTGRheXp4MlROaWZIZ24vaEtqNExEcE4zb1BCZGJqY3lKOUFGU3ZIclZC?=
 =?utf-8?B?eDcyKzJBSnZybFFGa3ZHMzduOVkxZllrQndzYUFnaStMRVkvWmFud2xGUnN1?=
 =?utf-8?B?dDd1dEY4Nit4bXhpVmc5aURJM2lnVDlGY1hFRVFRZTVTZjlXTVNMSEkzSUlZ?=
 =?utf-8?B?Wk1aMVg1R0JEa0lXRUxLYk9UeFJKZE1VWVRLRXRZbGNoRUs0VTJwVGllSXJl?=
 =?utf-8?Q?oaW/1YGgiLzJ5eS8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7d4c91-5576-4f7c-e49d-08def3ac80a6
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:18:55.2306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBQgI7ecSus3vvG09yaQ3XZiM0OzY1OGjQAoE5TsnZyZ6qoWgudn1c3cdlFSRDe7GNuDwMwoyA2BlOR7g2Xh6VrbsHkUeNChKCpRaQj89BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1219
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128846

On 8/6/26 13:04, Adarsh Jagadish Kamini wrote:
> Backport patch to fix CVE-2026-55969.
> 
> References:
>    https://nvd.nist.gov/vuln/detail/CVE-2026-55969
> 
> Upstream fix:
>    https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368beceaac2d0a
> 
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>   .../thrift/thrift/CVE-2026-55969.patch        | 307 ++++++++++++++++++
>   .../thrift/thrift_0.22.0.bb                   |   1 +
>   2 files changed, 308 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
> 
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
> new file mode 100644
> index 0000000000..736984d077
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
> @@ -0,0 +1,307 @@
> +From 09f72e9ba64c551602f69abb6ea161b7020948be Mon Sep 17 00:00:00 2001
> +From: dxbjavid <dxbjavid@gmail.com>
> +Date: Tue, 9 Jun 2026 16:35:58 +0530
> +Subject: [PATCH] Widen multiplication operands in container size prechecks to
> + prevent arithmetic overflow on LLP64 platforms Client: cpp,c_glib Patch:
> + Javid Khan
> +
> +This closes #3590
> +
> +Backport notes: applied only the container-size widening (gint64/int64_t
> +casts on the multiplication operands) onto thrift 0.22.0. Dropped the
> +unrelated string_limit/container_limit changes from thrift_binary_protocol.c,
> +which depend on infrastructure not present in 0.22.0.
> +
> +Assisted-by: kiro:claude-sonnet-5
> +
> +Changes from upstream commit 983c813c9a1a:
> +  - lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c: adapted from upstream
> +  - lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c: adapted from upstream
> +  - lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c: adapted from upstream
> +  - lib/cpp/src/thrift/protocol/TProtocol.h: adapted from upstream
> +  - lib/cpp/src/thrift/transport/TTransport.h: adapted from upstream
> +  - lib/cpp/test/ThrifttReadCheckTests.cpp: adapted from upstream
> +
> +CVE: CVE-2026-55969
> +Upstream-Status: Backport [https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368beceaac2d0a]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + .../c_glib/protocol/thrift_binary_protocol.c  | 10 ++--
> + .../c_glib/protocol/thrift_compact_protocol.c | 10 ++--
> + .../c_glib/transport/thrift_transport.c       |  2 +-
> + .../c_glib/transport/thrift_transport.h       |  2 +-
> + lib/cpp/src/thrift/protocol/TBinaryProtocol.h |  6 +--
> + .../src/thrift/protocol/TCompactProtocol.h    |  6 +--
> + lib/cpp/src/thrift/protocol/TJSONProtocol.h   |  6 +--
> + lib/cpp/src/thrift/protocol/TProtocol.h       |  6 +--
> + lib/cpp/src/thrift/transport/TTransport.h     |  3 +-
> + lib/cpp/test/ThrifttReadCheckTests.cpp        | 48 +++++++++++++++++++
> + 10 files changed, 74 insertions(+), 25 deletions(-)
> +
> +diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
> +index 9e80e107c..c3b00b028 100644
> +--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
> ++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
> +@@ -561,9 +561,9 @@ thrift_binary_protocol_read_map_begin (ThriftProtocol *protocol,
> +     return -1;
> +   }
> +
> +-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
> +-                                    sizei * thrift_binary_protocol_get_min_serialized_size(protocol, k, error) +
> +-                                    sizei * thrift_binary_protocol_get_min_serialized_size(protocol, v, error),
> ++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
> ++                                    (gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, k, error) +
> ++                                    (gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, v, error),
> +                                     error))
> +   {
> +     return -1;
> +@@ -618,8 +618,8 @@ thrift_binary_protocol_read_list_begin (ThriftProtocol *protocol,
> +     return -1;
> +   }
> +
> +-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
> +-                                    (sizei * thrift_binary_protocol_get_min_serialized_size(protocol, e, error)),
> ++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
> ++                                    ((gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, e, error)),
> +                                     error))
> +   {
> +     return -1;
> +diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
> +index 0aa9a6fe6..f6ad36b36 100644
> +--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
> ++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
> +@@ -1108,9 +1108,9 @@ thrift_compact_protocol_read_map_begin (ThriftProtocol *protocol,
> +     return -1;
> +   }
> +
> +-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
> +-                                    msize * thrift_protocol_get_min_serialized_size (protocol, *key_type, error) +
> +-                                    msize * thrift_protocol_get_min_serialized_size (protocol, *value_type, error),
> ++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
> ++                                    (gint64) msize * thrift_protocol_get_min_serialized_size (protocol, *key_type, error) +
> ++                                    (gint64) msize * thrift_protocol_get_min_serialized_size (protocol, *value_type, error),
> +                                     error))
> +   {
> +     return -1;
> +@@ -1183,8 +1183,8 @@ thrift_compact_protocol_read_list_begin (ThriftProtocol *protocol,
> +   *element_type = ret;
> +   *size = (guint32) lsize;
> +
> +-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
> +-                                    (lsize * thrift_protocol_get_min_serialized_size (protocol, *element_type, error)),
> ++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
> ++                                    ((gint64) lsize * thrift_protocol_get_min_serialized_size (protocol, *element_type, error)),
> +                                     error))
> +   {
> +     return -1;
> +diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
> +index 9d3f25e75..7e18f712a 100644
> +--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
> ++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
> +@@ -160,7 +160,7 @@ thrift_transport_updateKnownMessageSize(ThriftTransport *transport, glong size,
> + }
> +
> + gboolean
> +-thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, glong numBytes, GError **error)
> ++thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, gint64 numBytes, GError **error)
> + {
> +   gboolean boolean = TRUE;
> +   ThriftTransport *tt = THRIFT_TRANSPORT (transport);
> +diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
> +index 83fb5da19..01365ba7f 100644
> +--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
> ++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
> +@@ -83,7 +83,7 @@ struct _ThriftTransportClass
> +   gint32 (*read_all) (ThriftTransport *transport, gpointer buf,
> +                       guint32 len, GError **error);
> +   gboolean (*updateKnownMessageSize) (ThriftTransport *transport, glong size, GError **error);
> +-  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, glong numBytes, GError **error);
> ++  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, gint64 numBytes, GError **error);
> +   gboolean (*resetConsumedMessageSize) (ThriftTransport *transport, glong newSize, GError **error);
> +   gboolean (*countConsumedMessageBytes) (ThriftTransport *transport, glong numBytes, GError **error);
> + };
> +diff --git a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h b/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
> +index cba6e6948..1a7410c86 100644
> +--- a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
> ++++ b/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
> +@@ -174,18 +174,18 @@ public:
> +
> +   void checkReadBytesAvailable(TSet& set) override
> +   {
> +-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TList& list) override
> +   {
> +-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TMap& map) override
> +   {
> +       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
> +-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
> +   }
> +
> + protected:
> +diff --git a/lib/cpp/src/thrift/protocol/TCompactProtocol.h b/lib/cpp/src/thrift/protocol/TCompactProtocol.h
> +index c7d81eea6..97ca460a7 100644
> +--- a/lib/cpp/src/thrift/protocol/TCompactProtocol.h
> ++++ b/lib/cpp/src/thrift/protocol/TCompactProtocol.h
> +@@ -146,18 +146,18 @@ public:
> +
> +   void checkReadBytesAvailable(TSet& set) override
> +   {
> +-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TList& list) override
> +   {
> +-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TMap& map) override
> +   {
> +       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
> +-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
> +   }
> +
> +   /**
> +diff --git a/lib/cpp/src/thrift/protocol/TJSONProtocol.h b/lib/cpp/src/thrift/protocol/TJSONProtocol.h
> +index 09eb6eab1..265b33922 100644
> +--- a/lib/cpp/src/thrift/protocol/TJSONProtocol.h
> ++++ b/lib/cpp/src/thrift/protocol/TJSONProtocol.h
> +@@ -253,18 +253,18 @@ public:
> +
> +   void checkReadBytesAvailable(TSet& set) override
> +   {
> +-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TList& list) override
> +   {
> +-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
> +   }
> +
> +   void checkReadBytesAvailable(TMap& map) override
> +   {
> +       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
> +-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
> ++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
> +   }
> +
> +   class LookaheadReader {
> +diff --git a/lib/cpp/src/thrift/protocol/TProtocol.h b/lib/cpp/src/thrift/protocol/TProtocol.h
> +index 37b0db711..4eedc5e82 100644
> +--- a/lib/cpp/src/thrift/protocol/TProtocol.h
> ++++ b/lib/cpp/src/thrift/protocol/TProtocol.h
> +@@ -604,18 +604,18 @@ protected:
> +
> +   virtual void checkReadBytesAvailable(TSet& set)
> +   {
> +-      ptrans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
> ++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
> +   }
> +
> +   virtual void checkReadBytesAvailable(TList& list)
> +   {
> +-      ptrans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
> ++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
> +   }
> +
> +   virtual void checkReadBytesAvailable(TMap& map)
> +   {
> +       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
> +-      ptrans_->checkReadBytesAvailable(map.size_ * elmSize);
> ++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
> +   }
> +
> +   std::shared_ptr<TTransport> ptrans_;
> +diff --git a/lib/cpp/src/thrift/transport/TTransport.h b/lib/cpp/src/thrift/transport/TTransport.h
> +index 52b3a0a4d..1269593ac 100644
> +--- a/lib/cpp/src/thrift/transport/TTransport.h
> ++++ b/lib/cpp/src/thrift/transport/TTransport.h
> +@@ -23,6 +23,7 @@
> + #include <thrift/Thrift.h>
> + #include <thrift/TConfiguration.h>
> + #include <thrift/transport/TTransportException.h>
> ++#include <cstdint>
> + #include <memory>
> + #include <string>
> +
> +@@ -272,7 +273,7 @@ public:
> +    *
> +    * @param numBytes  numBytes bytes of data
> +    */
> +-  void checkReadBytesAvailable(long int numBytes)
> ++  void checkReadBytesAvailable(int64_t numBytes)
> +   {
> +     if (remainingMessageSize_ < numBytes)
> +       throw TTransportException(TTransportException::END_OF_FILE, "MaxMessageSize reached");
> +diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
> +index 963286100..72e798bc1 100644
> +--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
> ++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
> +@@ -243,6 +243,54 @@ BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_read_check_pass) {
> +   BOOST_CHECK_NO_THROW(protocol->readString(eleven));
> + }
> +
> ++BOOST_AUTO_TEST_CASE(test_tthriftbinaryprotocol_container_size_overflow) {
> ++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
> ++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
> ++  std::shared_ptr<TBinaryProtocol> protocol(new TBinaryProtocol(transport));
> ++
> ++  uint32_t val = 0;
> ++  TType elemType = apache::thrift::protocol::T_STOP;
> ++  // 0x40000000 elements of min size 4 require 4 GiB; the product wraps to 0 in
> ++  // 32-bit math and used to slip past the MaxMessageSize check.
> ++  TList list(T_I32, 0x40000000);
> ++  protocol->writeListBegin(list.elemType_, list.size_);
> ++  protocol->writeListEnd();
> ++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
> ++  protocol->readListEnd();
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_container_size_overflow) {
> ++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
> ++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
> ++  std::shared_ptr<TCompactProtocol> protocol(new TCompactProtocol(transport));
> ++
> ++  uint32_t val = 0;
> ++  TType elemType = apache::thrift::protocol::T_STOP;
> ++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product wraps
> ++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
> ++  TList list(T_UUID, 0x10000000);
> ++  protocol->writeListBegin(list.elemType_, list.size_);
> ++  protocol->writeListEnd();
> ++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
> ++  protocol->readListEnd();
> ++}
> ++
> ++BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_container_size_overflow) {
> ++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
> ++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
> ++  std::shared_ptr<TJSONProtocol> protocol(new TJSONProtocol(transport));
> ++
> ++  uint32_t val = 0;
> ++  TType elemType = apache::thrift::protocol::T_STOP;
> ++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product wraps
> ++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
> ++  TList list(T_UUID, 0x10000000);
> ++  protocol->writeListBegin(list.elemType_, list.size_);
> ++  protocol->writeListEnd();
> ++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
> ++  protocol->readListEnd();
> ++}
> ++
> + BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
> +   std::shared_ptr<TConfiguration> config (new TConfiguration(MAX_MESSAGE_SIZE));
> +   std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
> diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> index 0128de8519..3717302086 100644
> --- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
> @@ -17,6 +17,7 @@ SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
>              file://CVE-2026-58023.patch \
>              file://CVE-2026-48144.patch \
>              file://CVE-2026-58389.patch \
> +           file://CVE-2026-55969.patch \
>              "
>   SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
>   
Ignore this, I will send a v2 removing the bloated changes section : )

