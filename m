Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC57C00140
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 01:26:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3578.1659490005791636419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 18:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PRGphF0m;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52147a0915=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2730monQ012047
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Aug 2022 01:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nJj0N4C3GkVDGGsCrQQDqlz+w6ztxJWnhXFJKu6ZuOc=;
 b=PRGphF0moO8sWQ1IhgVeB9m6hocP3mXNt2auG3d2oznnMVrZqUPvWdDfvvX41/J6Obl5
 rzwI6E6h+xPzfrnmwd+sc59G6DlNaaDgKIlfDhokhOzzTSBGgdirE6nGpQ4fktD7YGhx
 emMzeHzbSdj/fw+HFQy4RJN7L/2A1OguVjAqIaynkFZCnPTbaTTVQgwgfOGMl+gaCBFF
 V4bCZG/pKiWkyZSsUst53trTZYfUDUQ1wiHA92QzJvJgJp5N6o5iRCuXFLAJKs6tJF3S
 pHoB9+4t01up9EMs7MjnJzAl6AR3oheE5mzhAwdxMRPuecVN0b7EnFXbkBVaCIenDtOH aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hqdbvr26u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:26:44 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2731QirC024198
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Aug 2022 01:26:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hqdbvr26t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 01:26:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqS/zWTX9HBlH+htCzx+eH9K+uNnr838mEfKaiosco6YdklT8+5Z1v9LLvD+qFvI1LLnf1rsEgGZCptZq+fS3PFv0bWBxQyCnRUvFoo5xvGl1PjoMtyQzyySVq+FMaXR8wAkMsc/8OqRAEgpk0Rdzg6bMmkwhwio0GvNK9aafOVsMXhGHJKyZgK7rQ2+YXiY1+gnPaf/q9wGDeD+B5GjgxKFUPUfdGZFuuzn3FzI8+WJZcti48opJecQn/asJJ3a1eNxRQHJT0cHN3MYn22wMtgJXJafk4tDy3DmNeoeXOzIUig3DJmIUF7ZxEA8e8QBx6uDyFvROp6fa5OD3tuG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJj0N4C3GkVDGGsCrQQDqlz+w6ztxJWnhXFJKu6ZuOc=;
 b=USHWArzSRhMZcNLG92hkNj7mIG9z3O7h2HAb4+5BNerdtqjE7YHUG1BewHrRN7EtyjNhceaEJSAbCXjHXNfIjKWtFQbsUscRXPS5E+T0V3qV3vjA0kjPALJFQucdxj93kHgY4i4UAVpt4ks4Gpkh5qRvsGX6TGUo+1VnK6hAGeDFetps17pczz9aPkkD6CMBIRzPgPO6Nlktacmh5HxXSRNVtf+db5mRPaQxZ4cBmSmybG+W9shALqLr61ZG0GWPBc4m0BtIDF8yTxjgFRMkh5+xEcKYrjV4+tHpADujZB/7ZXCTQSBDBHANgnClQqbbcmq0+3+lUq6n2FdcYhXlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM5PR11MB1356.namprd11.prod.outlook.com (2603:10b6:3:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 01:26:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16%8]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 01:26:42 +0000
Message-ID: <2f1c5a7a-902b-16eb-90d5-90b05069e8aa@windriver.com>
Date: Wed, 3 Aug 2022 09:26:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.6 -> 5.9.7
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1659447854-24486-1-git-send-email-wangmy@fujitsu.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <1659447854-24486-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89949b1b-00ec-4bbf-fd9f-08da74ef3899
X-MS-TrafficTypeDiagnostic: DM5PR11MB1356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nWDKlhYZcYn0TChMnHVa/GELb76Mgv3Dzxdhj564AWV8IQiRROpDhnJRlCHHdHInymBAq54INY5cRoN2wZXFW/ZoIpeyUu3q+Ha6eDsFYhUYn78EJLd09IF9vNr3FqwajA+0qUKJ8TY9Rpduvnp2oCzQ3B/ibDBJHkfVAyQyewZb0YzQuvKqV7tUQ38GvX77JKDzTX1w3d0YP9uMgQUueYVqwPiGI2dgwMpATUv1M9lia0a2SiMBOb1KDCERq7Hfkj+alOmg/6lCBSjInALyIUN5eQ9F36/NedGSVGTHBT8CBpvOyMNHj6la7gbHWJZRF8gUV53erfGIZFH1xWZYjwiDlfg+ULY9liulfVOI583bHPlBz5CvTTiUverfdtipj8UoksoR6hAamZtLzcWBdgWvXJjx53abXjQApQWqs9z+zgc6gvWcWjCwfNSpIMvMmWyM92RE/Omi36UXALshVvyc/rHNSehUWrbl47ZXpme+gJCYz5mmPbdYU4vzdfdIEO0Uvs5C699UNJiOm//ufhN2zlA7lbXYKVqxYfKeQvKMoQOMDjQbrtIIi2d1pi+q35ZvFMndPSJBRdBiHkVryHEczEsPD9cOcGMv2k7zwtrsSZKdgSfgrPlhyuX3BsOqqg/fHZ5Q8Nz5H8fFxdRWYW/S8g8YKB0mJVobNtN7WeLQ94DEGOmc+L7NQIkSP5Od2pupRyXHKiyMDC1XX4i95gsE3RLBu30nezfnvRrR+SwZAAIV5QB4iNLRag6RTVEz9odVoZo1KGbMY/SMRjqCN3Fk+hfuPPNS9epXaCUFo/g14IbhVNuKZgHsYyZVG4LTUU7cHu1gFpFL5CpP1kc5Rfn1AGq1Z6WblWiroSuzIvyNcvWtofimpb7tYhBINMzvK7aGv38hP70hizQ9pszIqw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(83380400001)(8676002)(36756003)(8936002)(31696002)(5660300002)(86362001)(2906002)(2616005)(186003)(66946007)(316002)(31686004)(6486002)(966005)(44832011)(38100700002)(53546011)(66556008)(478600001)(66476007)(41300700001)(6512007)(26005)(6666004)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mi80TU1SLzI2RGljQkxRQWR1Y0J1c2d2QWZ3dVZuYzdLQWtUOWpHS0hDanpu?=
 =?utf-8?B?VnlhVGRWOHZqTjZuY0xxOVF2TzZtd3VKWXZST0JaZDBrN3NqNzkzRCtydmpI?=
 =?utf-8?B?NnlvUGdXMndqazRDcHl0RWhPUkdHeTZ1ejkwdG0vZTBORFJCY3BJdmVpSE5C?=
 =?utf-8?B?dXNFL2s5THh1bys0cythSzY4L0VicDBUcWpmU2orWlhDNlNqdGt5RUFDanRi?=
 =?utf-8?B?aDVDUHlNY3dXVzFHZk0wcWVOM2FXclBHajl5TytTdHhuNzhCaENYRFVPem5v?=
 =?utf-8?B?dGgra1p3VUtzRUNtWTc4MlJhdkhBQVp1U2hVZDU2K0JhTnA4ckwzUExybnNV?=
 =?utf-8?B?dDliV2kxVUJJY2QxYnBobHV4T0UwRC9jcWJ3ejdVeEY1ODZDcU11djhyTjR1?=
 =?utf-8?B?c1R1dlJhM1V1c1daWStGbkk4SnVNSWFzQnpLSVNGN00zU0dwN0pVdWJLSHNP?=
 =?utf-8?B?alZETEZqdFd0VWpFaVdrRjc0VWQ2UFNaOGF1QjlXWEdEYzVGaEk5VlJMWkxT?=
 =?utf-8?B?ek1CdlFRS2luQldoNGN2eGJNaFhvejFPYXc3YW1aVUtwaWI4T1hQRTBKZEpz?=
 =?utf-8?B?bUV1SUt5WGFSV21NaUFmVDAvZWhzMUFQT20yeWxPNkNUenZCQ09IdlpFUnVX?=
 =?utf-8?B?aVN4WG9USit0ZVI5emdzb25vSnNDUW5jeDJEMi85dWdnYm9PbFlEVGdoMlVZ?=
 =?utf-8?B?Q1p2ekRFQ0dySlg4UHRrNGZnRWREZDJ2RUNYZUR4dnZJUmREaVJWWjU5MlVt?=
 =?utf-8?B?ZnlmdmZiY1hwRGY0dm8vRVdJRUwxUTdseWs1TXNQOG12Q05mWGpGcG1FOU9l?=
 =?utf-8?B?dFRpdTZIM3EvRE05M2dmRkJobW5TRWY2M2w0bGV2Y3pQRWVVS1Zoa2RVZkNa?=
 =?utf-8?B?WEg2SGhMM2xpczI0cVA3RWt4RURHdzVVK3Z6Y3NIdnBEUWVGdTdOalBFVzhv?=
 =?utf-8?B?enQyeFBjZ09xUjJJMG5aTDd4M2tlMk1BdUMvZTFFei9hbTQxT0kxVTRFY1R3?=
 =?utf-8?B?aENVUEtkb3ZtTUNmVTZab1JibGxtQXFZNzRWTEVTKzh6dXlLTVdqNkp6a0Nx?=
 =?utf-8?B?anpXVktPSVNQN2Q3SmZIMFZVdUlDSzJXYnJxZ1ZpT0tRdlZ4NWlEMVNvVWZX?=
 =?utf-8?B?NXRIdjRncndBd1Q2RUFta1lncXJuZ21IUzBvUGlrcDRUTllKdkFPYklvaTBH?=
 =?utf-8?B?WE1Oang5NWMwd0IvQmNhM3ZQZEh0dVpYS2RqM05sNExZRVpqdll0WU1Eem5K?=
 =?utf-8?B?MmF2T3RhMjJIcnVPaXBKdk9kSkRQbk9jVE0zOVlrcDBKdEsxbVNrWGhuNFBH?=
 =?utf-8?B?ZGtVUWdWeVZqVHFqbjU3STRmN3Yxdy9mSmdwVU4wdUplMzZ0L0kyNmF1c3A2?=
 =?utf-8?B?YmRMUW1WRXp0cXRrR3RWVkVMRVdpUTVhR3RjSXZFbllMSXpqZVAxamhnOEVq?=
 =?utf-8?B?MXpvYmY3bENDQXQ3K293L0RIQWxMM21rY3AzcUxsTkIvK0Y2SjNOTmRFZEl4?=
 =?utf-8?B?b1V4bkJ0cTBLUEh0cmwxWGhtaXpqQlA0eEl2NjFxWEl6U3FIUjFoTGNzeGdG?=
 =?utf-8?B?OFhubnk2UzBacGllOVQyclZOSWFyZC9lTmoxOUo5cmIvRWFHa0NaU2hiV0Yv?=
 =?utf-8?B?Q0JNc3lUY3p2YktUSU0ranZRWjI3eTdtaDA0dDJ6ZW9vR0dOaXY2NUdYQ2dh?=
 =?utf-8?B?YUxhclZiekhCNWZEUFpzY2tBS2Vua3pVRDdwd2poV0EyalpJN3QwZkdvMzVN?=
 =?utf-8?B?SHZYS1d4QThZdHpRVXdNRWRrV0JraEdZLzlTNEpNek16WnZXclkvMFlsc29Y?=
 =?utf-8?B?Wjc3N2hjSHBBUWxXaGlNRnp0UmlUbVNLUVkzOHJUVHNEUjFmc1cxV0pGa2lX?=
 =?utf-8?B?djFSQ05WWjRucExEK2N3eUkzaVFSU24rSXQyUGhyQno5c0xSaDJJdEtQQWpx?=
 =?utf-8?B?TXlQa2VRY2hPWTFPTUdGZTFMcjlrYXUwNG9sZTJ2NkF0S2JqQVR3aFYrY1U1?=
 =?utf-8?B?UGFtR1BFRWFaQTlDQkkrVE5zUjI4ZHAxRVZ3N2JUVkJJZm85bVB5RDkxMjhu?=
 =?utf-8?B?a0ZiakZaWG5Cb3I4MzE0RGtCbWxtUVp3Y2pPV1BCL3N6ZWFwZ3daUmlnb0xR?=
 =?utf-8?Q?op7UFPTFW53heiXSoMHR8bUwe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89949b1b-00ec-4bbf-fd9f-08da74ef3899
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 01:26:42.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K5ESnC2cuRMbdk0n/3DwsCQfo51EJgEU852wjwwzB78YYmruyX+M320cje+et/Hn+ehuYr+9VtPXPKauR2h5XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1356
X-Proofpoint-ORIG-GUID: ilevuK9s2YBjlk7PubnI4FUY5fjQGh9r
X-Proofpoint-GUID: tyeC1cN6-kSzepjlkq9HomofaetSlhKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_15,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 01:26:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98103

Hi Mingyu,


There are some strongswan startup failures for this patch. I have sent V2.


//Yi


On 8/2/22 21:44, wangmy wrote:
> 0001-enum-Fix-compiler-warning.patch
> removed since it's included in 5.9.7.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../0001-enum-Fix-compiler-warning.patch      | 31 -------------------
>   ...trongswan_5.9.6.bb => strongswan_5.9.7.bb} |  6 ++--
>   2 files changed, 2 insertions(+), 35 deletions(-)
>   delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.6.bb => strongswan_5.9.7.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
> deleted file mode 100644
> index e730fe1cd0..0000000000
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
> index 1b82dceac2..67ab7c4110 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.7.bb
> @@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   DEPENDS = "flex-native flex bison-native"
>   DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
>   
> -SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
> -           file://0001-enum-Fix-compiler-warning.patch \
> -           "
> +SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
>   
> -SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
> +SRC_URI[sha256sum] = "9e64a2ba62efeac81abff1d962522404ebc6ed6c0d352a23ab7c0b2c639e3fcf"
>   
>   UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98098): https://lists.openembedded.org/g/openembedded-devel/message/98098
> Mute This Topic: https://lists.openembedded.org/mt/92770336/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

