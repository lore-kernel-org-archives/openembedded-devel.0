Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E99EC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:36:35 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17594.1786015680807502263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=bFe5XCGZ;
 spf=pass (domain: est.tech, ip: 40.107.159.4, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vuo2Zm96lZR15sCBnatjhpbvLX/x40mTtiM9mmxtHQqZlEWBQ0MU9lO/VYu+SNEGdywiOEs/rasBo95cQoFTUEpycJUZGuqVPxOOSBIBfP5Tj87+I+7kiNf89nETvLWeWbftn/k6K7qfdseuFMQbLScqfcUhNYzxT01Z7Tc2hHV7ih6ymgyD5zXD31Z3Hv9KkTbpgMKxb0n38ztgWje7jvmGxwyT1yiOBSUzQ3lsZpCjnPVZCAolhzH1MX88i+0HMEcHw+UlXZC50BLcKNSMVVPyaSOH1HJ6u2PRCy6cuNm9fGt7qvUaDFTC/Ki7O6eEsprP2xrYXti0+/+kvVFCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b3cZHOwKoStN27v+RBM9s8HV6d9YqExyUfusLj7IaM=;
 b=AQyyzRTcfjoPhUxo8GsW47rkCVKYQ8RtYD4oY/v8lokxEG2wd6Mr/yVn3HMmmPBtmGlKC1QIA/VDb1PucqyTbMJyS5ZM13PLb1xozE0LY/FzqbEgVRJlbiF0D7urjm52gqMcoM5g/Wfe5DSWxYVELzT6334mLsu8Eh1NJlcm5krOV2mj2BHx2uKF/pVbxGxauCTnWvIzONn8C//8plSFdnbOyRsx1hSDIw5Yir8cFYKYvWWJGLTDm96oS3nhtCVQqNTkv1QczcVVBLXib0x1R+yLKGiHbOPDVeoqXW4sTOSwLhrSdsUCS41TgOgo4dejDXZBkplPtzVVitE0n2GMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b3cZHOwKoStN27v+RBM9s8HV6d9YqExyUfusLj7IaM=;
 b=bFe5XCGZ7UAvHsZfJelMk8sTj/gMUWPL9CxnudZCA1tJf9V9+pXk/1qIFBYgr4uoqD/vU9cLMTTnOnEDK4pSh9Z0xnjZYT02ZvtEuLUwSyP2ChQVM3fp7iWAcDv+QgdGFTiISzpRkRrjgGxfYWolRSCw0GqxPVLDZ7yBnV06sEQuuLpgppVv2G06Z/2jsvrnQh2I1a3QPHRMSesv4V5h30n9gbLLvqxPhIvh+xvrBBHRfqtcrQ0DKbsRmsdgk1JPUji3SfbEV2qt9tNSXRsHrJz+0q+SvbH5j3vFmlTLYgEAOUNooMwpiE7Q/B3P2ljIOx0hjBLLWPndGoHhI1TEWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV2P189MB2912.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.7; Thu, 6 Aug 2026
 11:27:53 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 11:27:53 +0000
Message-ID: <0579bc97-7c93-4985-864a-d0232ad62d52@est.tech>
Date: Thu, 6 Aug 2026 13:27:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [ELIN-upstream] [meta-oe][wrynose][PATCH v2] thrift: fix CVE-2026-55969
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: elin-upstream@mailman.lmera.ericsson.se,
 openembedded-devel@lists.openembedded.org
References: <20260806112458.1159145-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260806112458.1159145-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: LO4P123CA0511.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV2P189MB2912:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f02056-a082-491b-ada7-08def3adc1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|6133799003|12006099003|56012099006|11063799006|10067099003|3023799007|20052099010|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Cs1j4EyuX1a2oHsFtlSDHXqGvA/pblN/xIwhnKq/gz5MhvUGAW9AasknRZjmwHxmDKnm6idu6flhN5W1KLQuMxE1ticqMHqfxXAha23zmeSWSyU6/GzBKeZ6/PgBIBk67huLGAuxPuwjLqaHWFqiQumrqDWSPLNj8RoU+y47feVFI+8AW9waLo/x2kmRV3MAQMyAHbKWHREWoua75DN4WYA/qLYmROmp3yACT+OOVCs95TZ+HJVRWbiwtPK1CpTG/b3c1jHXFMr4y75489ADANWfu7n1IwZ426qlRBioeQojezbh8hu13zh4jrtlTit4wpsFFzxPFvCFYXlaqVtNiOjWyIgkmBrtYlJs6h8z6CTvXnYybCvtuS7Ha0WmqyOctzSixb1TLyjPKkW/0xQcgAltaH09/wX1O3kPJqj022Px07Xf4qbcQd74nm3Ke5HYe+dXVrMlZOgWi8yDD7rrSHq0E37IElF/D1wr8tN42kNsYzz5aIZFsyOIgjVCPmrEjfwGFslWwGE23zqtmoece0c9fF/hjqTsBqlgqmJhx/OUCtwxxaoaw7PYzxg9deLNO36j8oU9E4cPOqi3hJ6y+T1KEncNqYGiMZFgdD3tFSBzjp2w8MYiRO3H6+Ptjf1YJjC0nNN5Evwr/5BTxkQaNMDk27SHKyOiDLAHsdtqtFw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(6133799003)(12006099003)(56012099006)(11063799006)(10067099003)(3023799007)(20052099010)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVluRGxsaVdqV3hsT2k5UGQrTE5xUkphd2JldHhFeDdYVmgwUlAydXZMOVZh?=
 =?utf-8?B?NjhodjNyTnMxRStXeFI1M3hWNlV1WUJlVzFTLzlCV3RLamI3andOMW5UQWZ1?=
 =?utf-8?B?NmVkc1FiUzdDWnhoanN2aVhML003aHh4N09qM2lIdkVLS3BxR3FyczZCN3pY?=
 =?utf-8?B?TThDUTVNOThqL0I3SGg1anVOZ08za3o1T1J3aTlUaGY3ZmVwRnFKS2lQdTdn?=
 =?utf-8?B?aEd6V2loLytreHFVdTIvbUYvZXdNTER6YzJhN21WRGxZcnd2OU45TFRYR0dX?=
 =?utf-8?B?RXZGTXZURU9FZDNsbTFqWHhhNjVEU2tMWVFHOHFqUkFTUUhhTGRHcGRZbGx6?=
 =?utf-8?B?MnJIRWpYcWpINlhGcmhwNXV0YSt1NFQ1NmRYOWV0Zm9Id0EvNVRGVENrbGJu?=
 =?utf-8?B?YUgxMDFvUnJEZHhWWGZyQTkzcFJIYWZHQkhqVEV2N0k2dEJyYjJhaXVxQkZK?=
 =?utf-8?B?bnpMNGlBb3FkTkpBUFphZklsaXhGR2tzbmlpLytnRW5IRFo5QUIwRlFsMVFp?=
 =?utf-8?B?RGhiSi9jZ3FSWW5pcUFjcUxqejVPSnBNY0twVGc2ZGpKd0N2dENtNXJGZTdo?=
 =?utf-8?B?Wm9KTDRDeEEwWU9FZE04N3I5ZGtnN200L0dKNTcrSTlmSE5HV0pBUE5meVBW?=
 =?utf-8?B?ejB5d1lCN0tyOS85TTlLM1JDclRvNUErTzdiUk9NOHdoMlZwS2hHTC81R3Z3?=
 =?utf-8?B?UEZrK2MyUTliMFVCUVdOczI2aEFwT0FNYlRuaVphcDFtbmpwTEF2L21sUjZk?=
 =?utf-8?B?dkdKTVdtZmovWHFGSmw3UWpScm9DaHlJbVdCaHBIU3gzT0FXakJUREtvaUJ3?=
 =?utf-8?B?RE5xSkpBcnpaOXdjTUJmU2dYRjZ6d1FEMm9IQzVUVVNaSzBTTmhmRGl2cGFo?=
 =?utf-8?B?enVMdHBjY2JpbjlIUXVUOHI3WDJSYW95ZVF0Q3BlQVdxZ2dtZGpNL3JmVHBL?=
 =?utf-8?B?OC8zbnhSZXFodE56aEFMZmg1b2NRQmRLSVkyU21KL2VOUkQ1TCtVRXh2Y20x?=
 =?utf-8?B?YXo5REluUndlMzZXUXlWQ3VqVjhibXE0RWc4UlVjTVhlOUI2bnBzT3ovYXVa?=
 =?utf-8?B?dStpNnAxUFI5MzVYNVAyMjB6cEVwN2xhWGNQSzF2cVRMTFZUUEdlRlJDejJ1?=
 =?utf-8?B?V1Z0M3JMWURMbnVZZEdWKzl6V0F2NzNJd2R1RVhGSjlCc3hCTWpDSHdRMGll?=
 =?utf-8?B?ZEJjMENGY0cxTjNwcUhEK2c0WE5UVjduMEJHSzBiOFZzQ1Vxd1BsRldlQjZo?=
 =?utf-8?B?alYxVU0vMU9WNWJMejdVcTAyelVVd3lLNHhaM2VjRi9iN2tMaWJoZ2hTRmpv?=
 =?utf-8?B?Y0ZyTm4wa3BBVVUxM3drNUlVaXlseWdhK3crUTFhUnZpdmtFTFRxWGFQWThF?=
 =?utf-8?B?TDB1MHgwbVZxM21sTGhCNVA0bStkbnZ3T3N6R3F0OW41RVVyQmlGR0xWdm9p?=
 =?utf-8?B?cWl5S0s1OERnb1pWOTJPY242ZEpDWVZIQ0tGb0IwSmw3bHQ3NFFIUDV4S0ZH?=
 =?utf-8?B?aWJuc0lJYUZZQ2k2K3hZbWdndENkNTJJTXNNR1F2Q3VwRGNMUXZtcXdNNzFO?=
 =?utf-8?B?cTVWZ1ZVNWNUN3dYbmdCaDhKaUZtMkUxSUZWUlZLVlRGMG9KWE1kNzRaMmlx?=
 =?utf-8?B?WWREZHByWGFvVWRXSnlrOTVMZTlJdENGYVZGVGI5QmhBN2xJd1ZCd0EyMkJx?=
 =?utf-8?B?S3NLVnlGTXk4UklhUGJXVnNUU3lpR3pjV21Nc1FEd3MzOHczM2RxcTl2WGFs?=
 =?utf-8?B?Z0RRMXpTcjdQb1AwSFRTRktGK3hwOUlhcGROYW50ZmN6N3VEWms4ZVlZcW1B?=
 =?utf-8?B?RVUya0xFS0pMZHRQM1dpU3NNamxmWjJvRVRSNjhIQVMrVE9aeklkNVQvM2Qv?=
 =?utf-8?B?WFgxVW80d25mQzlXMXo0eW1JODJvYnNZY0hiNlllbGpGeDZqbnhRUjV5UnNr?=
 =?utf-8?B?YTFQK1U1SlU1dnU3TTBWUlJheGpZc2J6enBRWjVHTmdnSTJyQVJOcS9Fb2pl?=
 =?utf-8?B?SWtJTGszc1kya2FWSWhWZVR1TG0rOFRVaU44L0U0UmN2d1RtdkNCRGV3RVJ6?=
 =?utf-8?B?T1BrVjZCVCtxZmFzNFU3VklJeTRRY2E5aE9iM3c3NnpmeXhMSFJIMzJDREhk?=
 =?utf-8?B?NUpSTW05aXhkcGN3SVVWZlltQ0d0MGpnUUlOdU0zbXZ3RS9BdWNvTWZhUHJS?=
 =?utf-8?B?a1g4clZCc2FnOUxUeEpqdURmbVp1MUVGMGp3d0FSMlIrSytiSXlySG1FNzB3?=
 =?utf-8?B?T1IwQk5Wb0F4dENTekZwQWhOajFhVmQwUUc5VEo3dktGd1NhOUxwL0owZnNp?=
 =?utf-8?B?cEhldG4vbG8vb1lXd2gydEprbDJzdGo1WS8zcWg2ZWxUWGZHa01yTFd6Q05E?=
 =?utf-8?Q?pIfjOHGwKhh6aylo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f02056-a082-491b-ada7-08def3adc1b4
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:27:53.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAb9w3FcKQQvtWZwy/BsXAOfjIcEtywlapoL7gyeAReMlM6HlRBtLo9OVI3k5GsHwT24LkCtkskEkW3gR05rmVKM/Kiu/AKZpk7RhpN32CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2912
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 11:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128844

On 8/6/26 13:24, Adarsh Jagadish Kamini wrote:
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
> v2->v3:
> - removed the bloated adaptation notes.
this should be v1->v2, let me know if there is anything else : )> ---
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


