Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDAAC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 09:50:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.22919.1659347408287672383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lfT7YMV/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=521241569c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2719RWmx031007
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Aug 2022 09:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=WqIeUinnEfWB4cb5fKVsriu8sjAsGp2X75B2s+6Bdhk=;
 b=lfT7YMV/nsW6s5zK4mHWt+fxnudTeXbdIbIzcUV/hKy8K14Sn2ZCw6Hl//hFE6zIrDaK
 47i/O0E8b5z7fbzIc9UatgXrh1XLsKDlBI/koZec+io3nE9BO0prlZjApZgMWHnusA/T
 +hVVx5DwKZLHst6QL9p9vSawuJDxu41uYc5Moh6YKu5iEaIRibX9jAy7oDdGCyvpUFAa
 ZPCT+JXQQHD7FUeb1MwHiowAEdVbDr7Gv1iG5WXo6GlC+b8w8kE8M7Gbs6xypT+d4xkg
 2yxIE2fTOIt0kzMGYYiPSht+Z+kSHEEILEcgnf+EWXVjaqLPjdovDxydKPGh11Eece+t Aw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmum91ckt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 09:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8YAO3mOgNTcN87+GO69lmVavN3mYtEQ72V0TOAnlGPjJnNXvAzCPCwho5MgRBS14+kCrjvwLPgb51BcdYNhle1iN107utwl3U227deetPwp2v6shGrXnUUvkt6lVK2nw7pLegtcsKdKxNWBtxmQL0WYovN1HnNDAsr3I3Rb8Ar387i9NlMADf+QIV3xw8eShh8l87A8W5a2Bs2ETaUP9DU0fNkmhFw2IACDKUPFYc0jmmJ9LL56MI9ReZxZfcLD4Uj1kitn2QiPGBIDvHLixwJY+OEkHUSObRivHSAycc0XspmIw/G0idaIOeNCVjiEVMPmAsSZ8OOgsXhNGHjOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqIeUinnEfWB4cb5fKVsriu8sjAsGp2X75B2s+6Bdhk=;
 b=RMxu5RV/EmGK3HEbHb9bNebgRZBaIcPe+OzkbPxmOQ0T2CTr3313QvQHrwM5q6PiHKgV+VRlgrOd3EVN6/yMutp5ObgE8elc4rvbi1raKBm18LPV7EwEG3XKuVwhuKfr0eIpUWNZdm2e8Ml8fzbR2t9h+XoS9W35CFqp0YG6roFxgBgn9b1HphuNckv1qfeO4haLqzAaal7z81Y0KZnkN+KIOMdmL7/j9P+1oIh0yba9wPGsmKQFX1gUW+0xWMI2gy6n2W1lmce9mn3ZrN9LcpOdULe26ormUjLncKkZKtWEr6vUgVUMl4IrT8gNCdwU9nMf0lh3GkcqDA/InOkY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM6PR11MB3946.namprd11.prod.outlook.com (2603:10b6:5:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Mon, 1 Aug
 2022 09:50:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16%7]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 09:50:03 +0000
Message-ID: <6e6c75ff-cedf-b3a7-a6a2-2ccbff92239b@windriver.com>
Date: Mon, 1 Aug 2022 17:49:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][PATCH] strongswan: upgrade 5.9.6 -> 5.9.7
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <170728B528208754.608@lists.openembedded.org>
In-Reply-To: <170728B528208754.608@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0152.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b0854e-95c9-4da9-ef2f-08da73a334cd
X-MS-TrafficTypeDiagnostic: DM6PR11MB3946:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jsf1Mt+Z+Rh/FUPgpFuuqabouPMrTbxxhSrPo+GO4/8WpnLRz8nvsZof3PS7HwEa+QpSxs8oLtHD1Knr3CPraUSLGUSYzw4H0ruck3FErx5OVk6drafVD/fAs3Y9abKTTRp+1DXqpguEzMs1NMrIn9482NojCokIzHzd4ciRFT8mjK65k76QCdOaDDYiGd7EIXpc6NaZ/Fqyhgc5WdNcwqqUy/IOJmzkk8cM5kPif/fQ6tRczusG1yVoC7kLyUz5kuGMIICv5oiC9lnKHXMRufcDP/USBYjAESCLYf9jd9cj4uhoPzQ2NOki6OqBhCwnfOPS+sQqjlk836vhPkv1dZNB4eUcRzZ85qCG37hmNzkoU6z1f8Gmexfl3PPQvEHLDeCgedMat+qROUOBbpewVdm4u7oVXij8+dka9aHS6e6K3RZHgkXtrNeJIDnyb0PCjRPSf9c2Qz/7nxDXY06P3pgHGL8ffa3A3xSxODvOVw9RLgw1oGt6Uv7ADy8VR7w/2ZUa2rVmGck+dtQJ8cCFHr+kruPIxvQvCK4FzdldJRHI7NifgbJeCOw7hyB+G7kxwpLZW+urW8pMLbW7BSh18BzQfbT9bSk3j2l2vRrR0jqaNinbxLLO27dzQW7vcD8IJNlge2Aa016Cr2xzVNMLMu3/Np7LvtvnbVJpDQz8NVGrV3ivkYvmaK6kQpvPuyVvuSBplIavIwxwTWoDpmbDexwqUPWJ3eQzx/scS1rGPTGQbubo1lTQeC2BicvOuTZNz9TSBgqEk0Wr6S7hPJOSfaPL7hh8TLqGJG/bV2r6nojD3B5B4oAgA6UaGrvw/cN24cfELf9Dxu+IsyD6NwxA9Al/3wTejopKhT+9PtANhhvPF5zCRcZN1J0RZdL9Sx4f3dAcUGBB1foRaGLEaKI7xQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(366004)(376002)(346002)(136003)(396003)(36756003)(2906002)(44832011)(5660300002)(66946007)(66556008)(66476007)(8676002)(8936002)(41300700001)(316002)(966005)(6666004)(478600001)(6916009)(6486002)(31686004)(6506007)(53546011)(38100700002)(186003)(26005)(2616005)(86362001)(31696002)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vm5PNXJpYXNUWGF1TVF0TUtaSDRoRFdWYWZwRDd2RHNzNk1YOFNpUS9NOTFZ?=
 =?utf-8?B?aW1MQmVxejBzY0RjWm9lVGVuVUdiYitFNDA5R25Nam5UZ2ZRdlIvNjFsM3Q2?=
 =?utf-8?B?bE13VEhnaFhPTkE5ZmUwYUJxWDlJbTdURGFiSVpDVHFaa24vbnhRd1pOM1Br?=
 =?utf-8?B?QSs3WEd1ZFlUdGhXeGVGTU9zVE8xUFFZdnFlVTlkY1VQYmVTa01YdSt1V212?=
 =?utf-8?B?TEdyL05vUVFPaVlUWVlienpKTTVoNlhNQVk2K2NnK1hrMjN3dTBVTjA4YlJC?=
 =?utf-8?B?RWZKczZ3bEtnUGRDNk5uK2hzTjlHWGhxM1Q1QWhOUkp4RnROVkt3aHV3K25t?=
 =?utf-8?B?SDJuNlo1dVk4aCtYbkt6YzJ6SndYNG9jVzdaY2hTOU5YNjB5S2FZZWR3NXU4?=
 =?utf-8?B?NXh5K0VWZDE3NW51YXByY0orOHBhSXNrNGd1M293VUhJT2NJaXRmb3NHMjl6?=
 =?utf-8?B?ck1LSG1XT2ZZdGFSV3M2NmNmMmdPeGNSdlZMaC82WUk4VW1HQnhjTkYwdnNv?=
 =?utf-8?B?TUpaVVRsTnUrMGxyTlB0RmYzNHNQVVdDQ2VoY2xMMDFNZHg4TVRRM2RkVnNR?=
 =?utf-8?B?aVlJR0xINmtYTUxUUm4vWmZTZXRyS1EvZDZOUGpSbXVQbHBrYmV5TTNGZ21j?=
 =?utf-8?B?ZFFJaEdsUWtMRWhiUHhBQmJQZVIyRG1pWWxuUkwwNldyU1RQZUhraSs0K2Jq?=
 =?utf-8?B?TkJsY0xNRWZzYXM1Tkg1V2pUNlk5b1EyNkswNmorbjNOYWVDNHBIM0RYOUk4?=
 =?utf-8?B?STZ3ZlkvbS9aQXZjT3EvTnVqa0FKWFJlTWxvbDRPRXNscjJTU2VmeGFseHdE?=
 =?utf-8?B?YW1kaGd6b2lFbG5BWTV4SkFDNTJmN1ExSjVtTkNkNTBkejVlQVYwN09yZnhk?=
 =?utf-8?B?SmRSREV1eFVHWHc0dTlrMkhjR3NKL2hDRXZ3NGora08wWWJEVjlwN3Zua3hP?=
 =?utf-8?B?NTlGejBMam9GeFRsOEFXd21BK2NQWGNrT09iL1dacldHZ3JtZU1uNVZ5QmpR?=
 =?utf-8?B?U0VIY3ZRaUg0TGJINThqV1k2VG9PSzkrcENMU0VoVm5qZEZkREVSSG5ZeVMv?=
 =?utf-8?B?M24rNnQ5Q1lvbTF4aG82aG02WldxeHlpbENTSk1yRWJTUFAxT08rRCthNVlT?=
 =?utf-8?B?d1cwVW5TeEhiTXA1Z0djbFlwUituaStsVks2WjBnMGg3NFRqQnJkMkdMSVVo?=
 =?utf-8?B?ajNCNGhockdqWEFtUlZtSTdSL2lyUFdqVXVJM2craVVsY2V0aCtUUmpVb0pY?=
 =?utf-8?B?QUVDRmwrbVF5Z3ZCTHBIOXF5UmUrcGdNSWdYZUZGTDFFUjdBRWJIUDU3d2NF?=
 =?utf-8?B?VE03ZXFNVWR2Tm1KYlo5UWpMaDdOQUJQV2VCbWRxUFIyS2IxN1R5WGR5Nisr?=
 =?utf-8?B?UThzdkNaSWpiZGRKTHRWTko0R29ybTRrRjlCUjNjMjlOd0IvVzNzaDhQU01T?=
 =?utf-8?B?Vjl1T2hhL1pCY3lkdU5KWXJPY013aUI4TlZqRVV4SjhHVkZoeEYwNEJUci9E?=
 =?utf-8?B?UUsvWVhXOWFnaEl0bVRJNWdHVmlhdVpNZ3ZCd3Y3bmNLdWZUU3BlY3FKWUx5?=
 =?utf-8?B?bTZXMmErNFUwYWFNMkRpMHJRZG1wa2JKSzhxUWtDbVl3Nkp2L2dNK2hISThC?=
 =?utf-8?B?Nno0bG1pOGxJSW5nOEFOMGJjNTllQkd2QVdKSGhGOUxYRmd0VzJlT0Q4NE9t?=
 =?utf-8?B?QVN4b3dmVzFCbXhId1J3dG1Ga3lOUjhrNU92WGl6aTBWbnlLWDFYNnNybkdr?=
 =?utf-8?B?MFdOdGhreWtBQWh2M3E2Z01CYlI0NjhUellqRTIrSkpiZ3c2dFUyMXoyWnZy?=
 =?utf-8?B?cGxLaStjREIyTVdtWm9QRTJyalRQUVhBSnF5bDBPOHhlcEdITkwrYytmMnpE?=
 =?utf-8?B?OTQ4U1NYdk8xTlppOFpMRDlYcHdVNFB3MDl0R2UxajB1bHJHYmo2RStHRXJq?=
 =?utf-8?B?SFFPREl5N0x5aFNKdERFelArRzVnblNQWjlBVnpaS2NvcVEwNmJjaVFzaEtK?=
 =?utf-8?B?RWhEbUxoU2hZbnBUeEFKYWhjeXpxMndrb21YZUc4SUhOay94QWs0MU9UMmg2?=
 =?utf-8?B?UHlablZmcUdvc0tFTzhwQXJ5TVpaTTNYWmJsTkIrdFhTSFVoUW5OakE1OUpI?=
 =?utf-8?Q?D0JGPwqYjRtOAKU5cWJyLdATG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5b0854e-95c9-4da9-ef2f-08da73a334cd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 09:50:03.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yrbbL1mzVFSbcrEnSVHdLqd+1C/zrLFwWHd94noYTT3W/UCWQXWeDuQEM/FmM4DocUUz6Co2YwObljMYUG927Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3946
X-Proofpoint-ORIG-GUID: 9o9BCl2hWutZE3lLks-fD86aE3doG-ds
X-Proofpoint-GUID: 9o9BCl2hWutZE3lLks-fD86aE3doG-ds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 09:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98074

Please ignore this patch as there are some startup failures. I will send v2.


//Yi

On 8/1/22 15:42, Yi Zhao wrote:
> ChangeLog:
> https://github.com/strongswan/strongswan/releases/tag/5.9.7
>
> Drop backport patch 0001-enum-Fix-compiler-warning.patch.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../0001-enum-Fix-compiler-warning.patch      | 31 -------------------
>   ...trongswan_5.9.6.bb => strongswan_5.9.7.bb} |  3 +-
>   2 files changed, 1 insertion(+), 33 deletions(-)
>   delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.7.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
> deleted file mode 100644
> index e730fe1cd..000000000
> --- a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
> -From: Tobias Brunner <tobias@strongswan.org>
> -Date: Mon, 2 May 2022 09:31:49 +0200
> -Subject: [PATCH] enum: Fix compiler warning
> -
> -Closes strongswan/strongswan#1025
> -
> -Upstream-Status: Backport
> -[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - src/libstrongswan/utils/enum.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
> -index 79da450f0c..1e77489f6f 100644
> ---- a/src/libstrongswan/utils/enum.c
> -+++ b/src/libstrongswan/utils/enum.c
> -@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
> - 		return buf;
> - 	}
> -
> --	if (snprintf(buf, len, e->names[0]) >= len)
> -+	if (snprintf(buf, len, "%s", e->names[0]) >= len)
> - 	{
> - 		return NULL;
> - 	}
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
> similarity index 98%
> rename from meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
> rename to meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
> index 1b82dceac..349538620 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
> @@ -9,10 +9,9 @@ DEPENDS = "flex-native flex bison-native"
>   DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
>   
>   SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
> -           file://0001-enum-Fix-compiler-warning.patch \
>              "
>   
> -SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
> +SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
>   
>   UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98069): https://lists.openembedded.org/g/openembedded-devel/message/98069
> Mute This Topic: https://lists.openembedded.org/mt/92742585/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

