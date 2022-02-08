Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F643C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 07:57:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8509.1644307071160534494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 23:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Cilkh2hb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9038664318=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2187s8c7023014
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 7 Feb 2022 23:57:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=LolwJA6EzbH2cLKt+5sFH7wYz/YGvOzo4h1mYLbB4Mo=;
 b=Cilkh2hbFCM+POlt1sO4U25F85W1cZsL+8Ti4n33e3CJceBvR7O/wq6xM/+sFuleezxN
 SpyKATeYIkW0MHtZTEHbPOw8igrynL1qk1hwvgN8ORQQ2uTo7qMJEYC/9WhX606GEyBt
 Owvgm0s0wkhI90KeB3ZhNq17i4p10hu2mJYfeEekQjd3W6OJSe3O3KW4qYoyVWMH8WZh
 amExkri0g7g+fPZXxGqnubeOp+TIIvry9eL4UC1jSqumldalnqhJwxCN1TFe/VdgyCnf
 ApYNXxlwimegCI8bIAiwhPOVVZvrgpDSp34cvW8P3LoEGtM5PPStG1qASeTVT4gltE4M Rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e39a70dhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 23:57:49 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2187vnp0032354
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 7 Feb 2022 23:57:49 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e39a70dhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Feb 2022 23:57:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf5IeOeMk7k9KfITmqhN2NpKP5ieFDfwCdmqRJUdb9vIw+39MbKiO4HsaVwjfAUldi1DJYHZPgzq8sJQmtpS8UVPpeG6pDFD11W9duEafjDQQSjoMMpzqVfu3JhJiH3ZNuBc1HGulGzc7WCCWJcmp3zxurOI4Xm9DdHqVoPG097QTDJx7j/56hkcUU+Szy2vtD4FDOkBZFFMRfbUPUba2Th6NX4A4VI1cETokWa/GCG35uTxleY1hZwbhKL0bHaVq+kHewnScONWCAg+33+fcnGUY52FzDGPcZjIPBbmd9lPl87w/GLDVrm5mfMgIBbv4ESOvcavaJ/0rmtcx140+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LolwJA6EzbH2cLKt+5sFH7wYz/YGvOzo4h1mYLbB4Mo=;
 b=eUBXP8dC1BVLGx98Zu3z0k/3QOHNwcFo+CKr/37rn2Tb+jVjydVJNqICidg8r73Fm5A04m9CSjxDEOhRyvnudVMbJEOVy41ZReHtBMi1ioCNcSfyDb4ug7rgf+6kfN5SYEK+YRtRWaq4Z4hMWKUulCRhJVZX6A+2lpyT4I52nfXHBt1BYDSr93cjXTie/mvR2BaZMH2+j7rgxH9LSBJoFYHvXo5jWtyQkU31w+nd8m53EesDvRA0Vy2NMSQzB7i5Rd6i2kaDIESw4Dn6n2mGGLDLIovEjxxDd6FQCLTDNHDA6TWq7kSEwv2h050PKbdqEb+EHS+V1ACVq3U8DsnWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 07:57:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%8]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:57:46 +0000
Message-ID: <48a2f8fb-9ef6-81ab-57d6-6fc9e8eec471@windriver.com>
Date: Tue, 8 Feb 2022 15:57:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.4 -> 5.9.5
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
 <1644279908-4266-4-git-send-email-wangmy@fujitsu.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <1644279908-4266-4-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 982dd5eb-21c0-464b-86a2-08d9ead8b135
X-MS-TrafficTypeDiagnostic: MW3PR11MB4763:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB47639171CD1602EFFE019A68F92D9@MW3PR11MB4763.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U7Qps/dENCXjYAY35hWf4fmSCmSpmywzP3/vdFhftrZb/zjU8rtTa3Gktffn/J/VSmxRGUNuiZV8wRFs6kG1rXTcPVTH1Um1UfuwSM5T443lyr+mLjKkmH0wnEkP/o0xgx6WZP24Cl0P56m98mb3bxxlEhCdHmcMIGbm5Iz8Jspgs3e87j9WI7T6l4Jp/fI6Xlarj1GP6EDus2vVjala9l1tI1jQaYpciW0163IwqJgQkOuEeFbiev5465BOKcgLX+fXNIRwCeedLcjSxyvqXJNDJNOfqtyPaNaRQyLUaXkk+7hGzaokxMGDYy6etyNPFTyLJtShzHQYmuVsGGWczylyk1CIlrGnemGioWT7HwlhU5OsMsWKtfJPN25USOTLVHYR314hf23Wq0bEWaoNtQFw5tal+BhXDRnyp6nYCzRGyifFsfNLShtgDCPqMmwuglY93wvVkrURIMHoEIqNloqUEfRfE175kfxVPkPMPtDfNzUx35Yfa35y12O+dT5cQyDHIBlqcp47wNOkEhng0NQVqcDtFZjlglYXn6hNpBhfIjk63huboVcJi6KJvs+ZeQbF8LtgnxqXSyEEhAqpGmtVHDw6IGXnqKWEgYlDmDhi6FdqMkzE7+7BekJ1j+wW5sC/Gw1IA9MCGkhabmVMuQmhqce2siOuykGSBJEhyyqv9lBh/XYN7K3gzdFJ4IZfcDo1ISn6aRJAw3qg1D4fStLVR+hGi2A79Adt2GkuZwdJc+tz7htQrrW7AS0Q5WtJToEGNUGWbAkbRAHNrFAKgK1w/FKZmlAYzutAT84uZSObteub0xCdUrwEK70rFow7qMOP+OsxgqD8+jrhrkK8OXp+ocuMBivS3R35GDfM7kvEWa+lyWrmxNQh+F1zirfSxGu72Ye4ZdzFl9d9eIwe5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(8936002)(26005)(6486002)(66476007)(38100700002)(31696002)(38350700002)(66946007)(966005)(5660300002)(44832011)(2616005)(8676002)(508600001)(316002)(52116002)(6512007)(36756003)(6506007)(6666004)(186003)(53546011)(2906002)(83380400001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3d6Y0lwTzhzNXlEMzVvZG5IZ2lKZnNFMVJDRC9UUUdydFQyY0dLeDhoLzVl?=
 =?utf-8?B?WEtRTjcvWU54RTU0QzZHQ2dJbk9SWkwxR1pKUTRjelc4NGt6RWQzRVI0enZm?=
 =?utf-8?B?ZkVOTkRXSFdyV0xKOUNRUHpzcnFTVi9rd2s2Q1JDbitHUlluT2xUbURGRHZG?=
 =?utf-8?B?SGI0OVNXd0U3ZTJua0FuckFUS0ZMZFNQSnRoNjRGVTFheFIyRGxMYTZlS2JQ?=
 =?utf-8?B?MTc3ZjdLT0FSR2FjcU1QMEt4aFQ1L294RVBLRTZWcmQ4MTdqdzhBNkF6QkxE?=
 =?utf-8?B?eFhkRFNPSEVEV3FlUEZScHc5YWpOaTh2dzZGcFNqRkFvOXNKdjdCQnZJZWdN?=
 =?utf-8?B?OUY0OG8xUGtjekFnSVRrTXJ2bnlNVHR1M2szYzFMYzlhZVJEcHNiRWhXMEdI?=
 =?utf-8?B?NlpiTkw1QmFiTjhyWE11emJxcW9vbS9oMTJVdEZZVng4SUpkTFZwMTFaSGJM?=
 =?utf-8?B?RnVpb2RKQlVIWTFVbXRpdUxVa0dPcDRHTlJndi9nc0pkMjFVM1pWLzJCM0tD?=
 =?utf-8?B?Y0tZb0w0TXRtQkZzaTl4ZDg0dVlIQ0FobWYwSWFhYWxhZjc2UkRVdk5zVk1a?=
 =?utf-8?B?SG55MjczdXhjb1lNQ2V5UnVIbHZ0NmZkY3ZDOW9wZEhEdnFSUmcwUWNmVmFO?=
 =?utf-8?B?ejdEN2s0QUJBTGFlVzFPNUNMLzR5OCs5V21uRG5Na21nSGJ1TW1CNkpaNytS?=
 =?utf-8?B?V0MwaVNmUkJhbWU4U2VGNW5WZVY1ZHRIRDdBTUFWbUdBSXEwa1RoQStLcVM3?=
 =?utf-8?B?eXZPTisySWRMNHQ2VnZQdmZlR1RvWDIvNS9FZUl4bVVwVGplNHR2THFGQ0Q4?=
 =?utf-8?B?N0hoaDVpdnd6cjNhM3lCMHVFYmZJazFHZzh0V2tGOFd6ZXB5TTFLRktEM3pY?=
 =?utf-8?B?aHhES05HZ2NXa3ZBL3RGbVpWUDVtK3NmaWI3NVdRV3BaZW1yWFJIQ1haQ2tm?=
 =?utf-8?B?NFo0d2FXMC9LbHQxcUxhWSttMDNNNEFma0R5MzY3S2hFS3NYQUQrUVg2YlR1?=
 =?utf-8?B?cVFQTEl4Y0ZpU2J1ZEpJWU43UDVUU3ZXcHc2NStibnYxaEZLUG5Kc1VvN2s1?=
 =?utf-8?B?WENGTlhUSXY2VWVFUkxOUGZxMWZTSGRsSFdLUUR5ekN2MVJubW1rRnRydlZZ?=
 =?utf-8?B?TzdXT3lzcisrWnVGNXI0dGNHbjdQRUJSa2FsMS9QTlJCTWswa2dBRmF5dGx2?=
 =?utf-8?B?cDBYUW5meFBJQm1xZGk5ejZnemtGT2QzVXhmakJ5S1NsWnRuejBCWHlZck1p?=
 =?utf-8?B?dFA2ZTU1NlBpWlFHRkpjZnUwajZ3VnhRanBPWHdpS0dwNHIxUDZHWXBVdm1J?=
 =?utf-8?B?TDJoRWk0WjNCd3ZwTnRqc0tMcDRPenhNS3BQQnVzVzJrQW1tZmhXayt6Qm1Y?=
 =?utf-8?B?QVhPTktSam4vakZkUlhDTDkydDBod2Z2bW51Uk1uL0lLYk1VSHFsaVZkYUht?=
 =?utf-8?B?ejJYaDdjNElUeWUyRlkyMXhCMnFMdzRJaUprQXVENk5YdFVEaGc0Qng5bEFV?=
 =?utf-8?B?bGdpcmQxdTB4NGhXZ1pMMC9LUjN4RmZSL21VeWNPRmVWZkFFZkkwT0ZIRFVD?=
 =?utf-8?B?elRsWmsyVG16LzcxVWlMLzBBSlpzWWt0MXljaHJOZWxkM245VGNOaFpqVUow?=
 =?utf-8?B?K3dkSE1BSE1yeis1amhMYTZPUnp1NVAwc0N0aTIrY0ViYUtCdUw3TVZySTRx?=
 =?utf-8?B?ZVRZRjRVVkhqS2tZVUlGcElHT2hSdmJNUUtNVW9PYVpzOUsrMy81WUxVT2hm?=
 =?utf-8?B?Y2VFQ0Foc29SRjh0RFViMnBuaHN5NlFqMlN6YVlZVTNPdGQwSjBJcCtHZzM4?=
 =?utf-8?B?c2huUjVrbVhuaThxZjZ3cktLY3hwajF4eFM1TkFBaStHOTBoak1mVEEvMGpo?=
 =?utf-8?B?UGp1T0VhUjVIZUVoTGhzZWN3b3ZrQW1DM1BJckhQRTQ1RW00Yk5pODRCbE1L?=
 =?utf-8?B?TE0yYzR4blIwYjJyZHJqQ3owOTkrT0UzQ2lrVTk0Z1czWk5hc1hvSjdValZS?=
 =?utf-8?B?aU5tSEtGNGFhTnRqT0Mvd3djQzB4OEFZa0VXM0M1TGh5N0l1cXlJUUJlQ1Vz?=
 =?utf-8?B?Y1VLWTVsVFZHb1lWSXQwdGRvdVlLNi9rYklGcm94bGVrdktzQk1qMTJIOTZ4?=
 =?utf-8?B?Zit0VGwyTUo2VWZ4ZkRQMSs3MzBLNDU0Vkk0NG9mdlEvMW53OStKSjRjeWwr?=
 =?utf-8?Q?7M9gJ7N7DZGA7nAgq5MV0eA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 982dd5eb-21c0-464b-86a2-08d9ead8b135
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:57:45.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VjGrWrHU7ypRwxUaCAr0KikKuv6inc2+qOyqwQaJidFqrUhEfnAEkcjdNvAFBV7mGNoChysmctUxkYmWSCdOiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-Proofpoint-GUID: 1oE5Bx4JuMDpliMgXUoDwnR9bK67k18R
X-Proofpoint-ORIG-GUID: 3_pIQYfBJTxYieblFiiSrrVK59gbsytY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 07:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95260

It failed to startup on my qemux86-64.

I got a segfault with swanctl:
$ /usr/sbin/charon-systemd &
$ /usr/sbin/swanctl --load-all --noprompt
no files found matching '/etc/swanctl/conf.d/*.conf'
no authorities found, 0 unloaded
no pools found, 0 unloaded
no connections found, 0 unloaded
Segmentation fault


//Yi


On 2/8/22 08:25, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.9.4.bb => strongswan_5.9.5.bb} (99%)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> similarity index 99%
> rename from meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> rename to meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> index 2b7a7a2410..dab2fd1497 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
> @@ -13,7 +13,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>              file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
>              "
>   
> -SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
> +SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
>   
>   UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95253): https://lists.openembedded.org/g/openembedded-devel/message/95253
> Mute This Topic: https://lists.openembedded.org/mt/88986556/3616783
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

