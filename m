Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871C3C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 06:31:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6806.1639636259389767813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 22:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CUGsazGl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79842123dc=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BG6PqH1017872
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 22:30:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OaZC0Z92Grru6T4AOsXHV0Lb4BRwGJI9h4goOJNQb4Y=;
 b=CUGsazGle7okE6Akph6JdAoPvoWuRVp+b+NHJxQ1GI4Gtt1riD6qtB9Ykc+4Fc+DxOoS
 aHWXRXS4rf1e0mbJUFSwzmOVkLSyYLEIpxnl2NjuNPyu93gd0FdNXyUZO6EiBJgQZfUn
 UM0VQuXuou2Eco3HBalz58wlB/XwsnWKb3WKWi2vs1cgcQ3W25ghtf73HHeDBLPtBPlV
 aD64SJ5wBZggBAAraPqDd4ldELKBNoJ1eG4Zdt9Oot+2WuaIzDJQHEWvEQ3eT5CFwC8I
 Su3dsh7PmTlh88QLgQKyf5Bgoc0Iu6IR86Gme2tWKS+ovRICYY7iRp7bdeDWMqj01Gwe EQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cypc1gd1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 22:30:58 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BG6Uvlx029989
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 22:30:57 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cypc1gd1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Dec 2021 22:30:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFAlyWf4hKmdgZCxXxRqMUUVuhK4qIQizAuvgbMhL+Gi/59J1AgwSO2Kcg3ayxgYe7tMXkptV9DwD8u+7IzJYDlUaZ5LVFbVSuuOmCMK4SeHl3x3S8Dh+p7VE/Oanq1iF+ofKmdx4VslIZs68tQ5Bars7wwx/LjYUvWgX1MghkJU16S7Sap/9AuZDtz2AO24frB4IYsChTIdEdYcMB/MhUssnHbhfa+Zs/Anf39X5TznHm7ph+otPMad2ofqLB3vey5PW3TZjTI2I+nIPLghZAEuXAkHWqiBusFc9Bbv5qWnNAyVG7zNxSaqzNTC7JBrWQ40isvL++jwBpsMbXx/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaZC0Z92Grru6T4AOsXHV0Lb4BRwGJI9h4goOJNQb4Y=;
 b=gCLz8qIcJ2gbtbv6PedspjnJEnnjEaBPXSdc7CDHxul+wBhc+6vbYUcmidcKWhWrGjl44clmVDV0dEHJlkBNed1irQddwVB7ebG5zT7hxGAq/sjFH5OzjwGrKaeTtJZX+R7d/xNKd7K+4vMgWvdONaJJoW8NLx2UgQsgTDmV4Fotq79+AJenWg+P54HmAByZmb3hNChd9nonh/AgIsN7s73mPcIIRLNJJqrao0zr1/YTTXNXLlLsiptfsqAzBDFpZ5snoYH97+F2V+LeSYrKyRb/raMvSNR0DuVvOvEOf7Ii1ox0ETMyMT+q3QnzLDMUM/2fkRWV8UTA3QsJVZqewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 06:30:55 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 06:30:54 +0000
Subject: Re: [oe] [meta-oe][PATCH] php: Upgrade to 8.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20211215072835.1371-1-mingli.yu@windriver.com>
 <CAMKF1srh301NbKARXz6SPYJccoy-kMzwFJXo7mi65snXEydskA@mail.gmail.com>
 <5aec92e0-43bc-8bf5-08a4-cce18fc61fcd@windriver.com>
 <CAMKF1sqJ49_xmqr88NSE8Fqtz=d7Lwh8eUUm8mkKrQbq62yTCw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <d0b1758c-e147-6a7d-3eb0-b4dfe49fdbc6@windriver.com>
Date: Thu, 16 Dec 2021 14:30:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CAMKF1sqJ49_xmqr88NSE8Fqtz=d7Lwh8eUUm8mkKrQbq62yTCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b38a5107-48f2-4c2a-74f2-08d9c05d9cd5
X-MS-TrafficTypeDiagnostic: MW3PR11MB4601:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4601CC67F03C3C5674FEC631F1779@MW3PR11MB4601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s6U7wMbxPuGlaxvQudxgvWPxaYzcwnGbmiR/usY0czjpIwM0TsAfbfsHixVS8UBwPjXupLuP5BYD/LRUEJMr/xFBIhE7/Lql+MNyBWk0QZ2CaD2Hsw3f71kRRMZSSs8rljTGdjAwt3/ZS1Cop/d8GijMQb0pEGS9LJhNo2bUVjRQiUA8wtzvLyEi/avHI2ezSL7zsi0byZjbiR3UCVHJe7AdiTgx+UCbt2fZallwdtS0GWY3xT1KYkSmD5vZqy8UhK4yytZhC3y9E4gbjAumyR9Ulxk/yB7iQI7JGSCu6ImX8GWigvK1Rn5D7Yqk94Ke2ce3LZRbUxdrhalT2cIKKgED1X3KV3pjTO3gy1DPcOdNKhZ1B938OBj/fk0WiDJLtBSNxlOd3hJFwRRZt7t704BwVrYQok7w7t2nEZfyCJ4jkTYzFeEbU/lQNAWF4AQHragpCTyxmhA9xjKOak2cQH8Tw69pAxWR39bI+fGoPN8Kmgir8J8FcLjXNgAnMLXamNnCcsvKdnmtDT+FnfgxxhZzOHfkIN9AUvu1qVFZe+jL9/1mlY6BHDdlQHiYboh+HYlJlMFrCfvYiE/kllv/pUGiYZOTJHAvkOtF0Eul/FfLOSuKI2Fhcr5hpos01OltaMX3OZ3XsU6jwagdVT8sKsIyBDVT7FIm7IgvkSmlUrTYphSltNSgSmSjeiBopWVTwoNk2BfoIIigU+BgPsbMILPdfGKdIQhX+ZcC9nCL0jdpdUxd3Bf7/9wdUtQp5B0eiMUs0umlH+/Auc7jJ8IBwqDZTeE51l64JXS8+NNpDpJt/tiuc0gx2Nd0VyZdOD9X/0yI7a2U2we/boRIGZjUjXBeNIPQjNJYZdFv6kW1SHb5OIW99nPIlqBenqHrcCeYMN6PNlKfyI3W4hwLoivERg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(4326008)(53546011)(8676002)(316002)(6506007)(8936002)(36756003)(966005)(186003)(31686004)(6666004)(4001150100001)(6916009)(6486002)(52116002)(508600001)(83380400001)(6512007)(30864003)(86362001)(5660300002)(2906002)(66946007)(66556008)(38350700002)(2616005)(31696002)(66476007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGxqeDIwQmxiWEZtb01va2tici9NUFpJVTNRMkowQTZlbXR5M3lReGNjU3Qr?=
 =?utf-8?B?aVV6OGZxeGpUUUlFYnhKaFBLdUNWZkpMcmMvUVhPVkZVbFJjZkhKMW4xNEE2?=
 =?utf-8?B?ZVNJWStjMnBMVjE2YTRZS1dUbUphQzkzS2EwWTYrTHUvM1pvdDF4UkFUMmRs?=
 =?utf-8?B?QTc2cTBEeDZsN3NNYUtjVjNMRUY0RVEyZ1VocVgwUmV6OFZYWDhQbkNoamxI?=
 =?utf-8?B?SWRicGtnMCsxUERhamJwYU1RUlVUdVVUekFYZW1YRjkwN0w4N1lXRldDaFFV?=
 =?utf-8?B?TmZtdy9BdHJ0dnRCWWU0dzVHRXYzVDE5aG5VVGRQZ3Q1ajJydUJwZWZ4R0lu?=
 =?utf-8?B?NXd4Mm04KzhzRTJQK0NWaDhhcytLeitqNWxOZnBrZFN3ekhDaXUyaGF1Z04z?=
 =?utf-8?B?eEhGZFYyVjA5VG8vRHZJdWFMZGZwVGJRc0VmSTFMYTIraE8rV05RYVdxL2pB?=
 =?utf-8?B?bldQdVdCLzZlUFNrdHp2U09oRDUvdnN2cStRc2Ixc1MyUW5jM3RXZTFyS3Vh?=
 =?utf-8?B?N2J5UnFwYzZCcTFzMGpFOVNhQjRGK1hrSk5yYXA5OTM4NUROc29jZFVTeVAw?=
 =?utf-8?B?cERmTnhwL2cxaFdhVnRFcERNK1haNGh4M1VSVDFmdHVPdEt1bUtQSDRlcE04?=
 =?utf-8?B?dmY1dXM3TW9mYVRaR0JWQTdZeHlZajh4ZFg3dEsxQ1hoRUJlSEpScnRMTmdr?=
 =?utf-8?B?bXFwSTB3VjYxNC80c0IvMTV2M2pGOERjbjdqaWZXOFE1SEUxSmFIdjNJRTZv?=
 =?utf-8?B?cUlOeC82SndQbEphZFlqTE5XWVN0TXVMM2JTSTFkVnhpa0h2WkVTcGtnTDNQ?=
 =?utf-8?B?UWxFc0VwbUdKOHg0bVhBaGtiVld4SExpV2dUWWhUT2IwUmUyNWRZaUdxVFFM?=
 =?utf-8?B?YlJ3dTA1S3dRMnhvV3o4eUFjU0tUaWhFUCt4aFB2QStJYkZOaTRmbUx5MHRn?=
 =?utf-8?B?M0sxenZ2VjFrS0pxTU9ZMzZnSW1tOEVrSUpLb1ZmZSs2Z1BIVnd0WE0yaVQ3?=
 =?utf-8?B?ZkYwMmdubzlkRTg1UU5RYks1czI1SnVWV2R6ZlZ3clFKanlMRjk1S3dmc0t0?=
 =?utf-8?B?YXl1L0pKR2V2ZmRYcVByK1JKdDVJbjd4ZVFYbWxFdjQ4UDZMWjdnSVMrcDFC?=
 =?utf-8?B?NUhLemdZRDR2SEx4S3RLMXMrOS9IU24xRFFqdmxJckxIQUIzNFVibGdwUG5y?=
 =?utf-8?B?enhHSnFmNmlxeEVYVWdQZ0ZycHlvZTFkeFA5ZGJHWWtmTllScklQRnFOV2Jj?=
 =?utf-8?B?Qmd3Y3lBQzQxQUVBdTFDay9NM0I2THU5YzVpSzkvcGRoa0pXdElXbE9XVndC?=
 =?utf-8?B?ajVraXBKZUlvTVU3Y0FFVFo2LzNuUWpvS245c0VobnJjZG9NS3Z5Y3lGcTUr?=
 =?utf-8?B?dTZqOXViL0pPc0plak9xaU5WZWpQRy9jOSt6NVoxN2NPYUNjYW10M2RCTUVh?=
 =?utf-8?B?NkcwNS9mZlZtUWY1REFINnZLWThjSlQ1WVhNeGVCSVZDZlAybmdKRXlsZ0U3?=
 =?utf-8?B?dGRpU3dRSUpsTFFBeTNWQVRST01BOSthSExValdqblhjYW84MVJTM0pINnFx?=
 =?utf-8?B?bm1VUmdjSVVJcTJYcUVURVJ0d1JzVThNVGpPTGJVVXlVQUpCVkZYWjUyeEJ1?=
 =?utf-8?B?SEZZM0p2M0hxYUIxbHRuUk4zM1YwU0dsNzgzZ3BJYkgrY1lxUFlJeEppVDRT?=
 =?utf-8?B?VXlXUzB2S0xVeXlGb25XNE9FYXA5WFdRL0J1NXcxQXhZSTYzRnlxcFlKOHF1?=
 =?utf-8?B?dGxPVlY3RUEvL2hFZDFGa3NLWkFVRjVGbU1JUjZoa3BCMTluYTl6QjViMUVU?=
 =?utf-8?B?M3JDbXdOOWo2UTVydmZBNzgrMzhZamFkdTlPRjUrUTBwMG5JZ3NhbGF2cGlv?=
 =?utf-8?B?VUh6WnNINjZPV3RPOUMvRTJ6bzNjQVhSNTVuUjRoeS9OOEp2ejNZSjNFNnA1?=
 =?utf-8?B?clpWTDVFQmt4R0REUDRQWnBncmJNWGM4REVIaTJCUTJEMUkySkoyZnF5OVln?=
 =?utf-8?B?RW41aE11N0lJVlBJbDBNeTV2Y1FMdGFLSXdIai9iQkxNOFlMVVl1T2Q2Vnpz?=
 =?utf-8?B?RXNoZXRCVlRqSWwvbmFDQndkd0xVRDhqbzY1QnhSTERXT1R3QTZaNjhtWm84?=
 =?utf-8?B?VjNtd2xZbTlpdEVYMkJnTmcxUnI2aUlaWkZsSkRVV1lUdHVWcXBtUWMxeWVD?=
 =?utf-8?Q?umwS92T9gYl06Tp3k8Ww56M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b38a5107-48f2-4c2a-74f2-08d9c05d9cd5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 06:30:54.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 An9KCWK4Az1vsL6DQP7xwXu+Wjy268LG6AidPJ/KIUAW9/do7i2qPyKrR8qHaHkYDoLrQiiQ9mMZSYq4wFZLwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
X-Proofpoint-GUID: lxGvhlHtEMgc2o6brPthYelCCqeE0Oce
X-Proofpoint-ORIG-GUID: HJreGfu8fIqTuDW7XfVlg2fY4W1QPEJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_02,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 06:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94379



On 12/16/21 11:51 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Dec 15, 2021 at 6:34 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 12/16/21 2:05 AM, Khem Raj wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> Fails on x86_64
>>>
>>> | /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/php-8.1.0/qemuwrapper:
>>> line 2: 21613 Segmentation fault      (core dumped) PSEUDO_UNLOAD=1
>>> qemu-x86_64 -r 3.2.0 -cpu core2duo -L
>>> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot
>>> -E LD_LIBRARY_PATH=/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/usr/lib:/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/lib
>>> "$@"
>>> | make: *** [Makefile:383: ext/opcache/jit/zend_jit_x86.c] Error 139
>>
>> I didn't reproduce the issue locally, anyway I will look into this.
> 
> I can see it fail on all different kind of builders and architectures
> here is musl+qemuarm64 on ubuntu 18.04
> 
> https://errors.yoctoproject.org/Errors/Details/619373/
> 
> TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/qemuwrapper
> ext/opcache/minilua
> TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/ext/opcache/jit/dynasm/dynasm.lua
>   -D ARM64=1 -o ext/opcache/jit/zend_jit_arm64.c
> TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/ext/opcache/jit/zend_jit_arm64.dasc
> qemu-aarch64: ext/opcache/minilua: Invalid ELF image for this architecture
> Makefile:383: recipe for target 'ext/opcache/jit/zend_jit_arm64.c' failed
> make: *** [ext/opcache/jit/zend_jit_arm64.c] Error 255
> make: *** Waiting for unfinished jobs....
> ERROR: oe_runmake failed

Hi Khem,

I can reproduce the issue you mentioned on qemuarm64, but cannot 
reproduce the failure on x86_64.
For arm64, it's because the jit support added for arm64 in php 8.1.0 as 
https://github.com/php/php-src/commit/0de9494464f17379db73817458db047eab378238, 
but it seems the previous fix 
https://git.openembedded.org/meta-openembedded/commit/?id=265bab83c9acbfa97117103dd5c35bbd8a9814d6 
only works on x86.

As a workaround, could we just pass "--disable-opcache-jit" to disable 
jit support right now and turn it on if someone need it or find out the 
solution?

Thanks,

> 
> 
>>
>> Thanks,
>>
>>>
>>> see
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1797
>>>
>>> On Tue, Dec 14, 2021 at 11:28 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> Rebase 2 patches to new version and enable openssl PACKAGECONFIG
>>>> as OpenSSL 3.0 is now supported in the new version [1].
>>>>
>>>> [1] https://github.com/php/php-src/commit/7b34db0659dda933b1146a0ff249f25acca1d669
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    ...ext-opcache-config.m4-enable-opcache.patch | 50 +++++++++++--------
>>>>    .../0011-use-qemuwrapper-for-minilua.patch    | 33 +++++++++---
>>>>    .../php/{php_8.0.12.bb => php_8.1.0.bb}       |  4 +-
>>>>    3 files changed, 57 insertions(+), 30 deletions(-)
>>>>    rename meta-oe/recipes-devtools/php/{php_8.0.12.bb => php_8.1.0.bb} (98%)
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>>>> index 44534cc06..a967d6412 100644
>>>> --- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>>>> +++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>>>> @@ -1,6 +1,6 @@
>>>> -From 8cabcf1043953a0fe48107204a2212609b8e6516 Mon Sep 17 00:00:00 2001
>>>> -From: Claude Bing <cbing@cybernetics.com>
>>>> -Date: Tue, 9 Nov 2021 12:59:15 -0500
>>>> +From ca9b419f2c146061f73ee045cb0a069c18b40cd0 Mon Sep 17 00:00:00 2001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Wed, 15 Dec 2021 14:00:08 +0800
>>>>    Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
>>>>
>>>>    We can't use AC_TRY_RUN to run programs in a cross compile
>>>> @@ -17,15 +17,18 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>    update patch to version 8.0.12
>>>>    fix issue linking with librt
>>>>    Signed-off-by: Claude Bing <cbing@cybernetics.com>
>>>> +
>>>> +update patch to version 8.1.0
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>    ---
>>>> - ext/opcache/config.m4 | 197 ++----------------------------------------
>>>> - 1 file changed, 8 insertions(+), 189 deletions(-)
>>>> + ext/opcache/config.m4 | 204 ++----------------------------------------
>>>> + 1 file changed, 8 insertions(+), 196 deletions(-)
>>>>
>>>>    diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
>>>> -index 5492fd920c..95158ccfd9 100644
>>>> +index 2a83fa2..9471b5d 100644
>>>>    --- a/ext/opcache/config.m4
>>>>    +++ b/ext/opcache/config.m4
>>>> -@@ -101,202 +101,21 @@ if test "$PHP_OPCACHE" != "no"; then
>>>> +@@ -108,209 +108,21 @@ if test "$PHP_OPCACHE" != "no"; then
>>>>       AC_CHECK_FUNCS([mprotect])
>>>>
>>>>       AC_MSG_CHECKING(for sysvipc shared memory support)
>>>> @@ -93,9 +96,10 @@ index 5492fd920c..95158ccfd9 100644
>>>>    -  }
>>>>    -  return 0;
>>>>    -}
>>>> --]])],[dnl
>>>> +-]])],[have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
>>>> +-  if test "$have_shm_ipc" = "yes"; then
>>>>    -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>>>> --    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
>>>> +-  fi
>>>>    +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>>>>    +  have_shm_ipc=yes
>>>>       AC_MSG_RESULT([$have_shm_ipc])
>>>> @@ -147,9 +151,19 @@ index 5492fd920c..95158ccfd9 100644
>>>>    -  }
>>>>    -  return 0;
>>>>    -}
>>>> --]])],[dnl
>>>> +-]])],[have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[
>>>> +-  case $host_alias in
>>>> +-    *linux*)
>>>> +-      have_shm_mmap_anon=yes
>>>> +-      ;;
>>>> +-    *)
>>>> +-      have_shm_mmap_anon=no
>>>> +-      ;;
>>>> +-  esac
>>>> +-])
>>>> +-  if test "$have_shm_mmap_anon" = "yes"; then
>>>>    -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>>>> --    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
>>>> +-  fi
>>>>    +  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>>>>    +  have_shm_mmap_anon=yes
>>>>       AC_MSG_RESULT([$have_shm_mmap_anon])
>>>> @@ -219,16 +233,12 @@ index 5492fd920c..95158ccfd9 100644
>>>>    -  }
>>>>    -  return 0;
>>>>    -}
>>>> --]])],[dnl
>>>> +-]])],[have_shm_mmap_posix=yes],[have_shm_mmap_posix=no],[have_shm_mmap_posix=no])
>>>> +-  if test "$have_shm_mmap_posix" = "yes"; then
>>>>    -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>>>> --    AC_MSG_RESULT([yes])
>>>> --    have_shm_mmap_posix=yes
>>>>    -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>>>> --  ],[
>>>> --    AC_MSG_RESULT([no])
>>>> --  ],[
>>>> --    AC_MSG_RESULT([no])
>>>> --  ])
>>>> +-  fi
>>>> +-  AC_MSG_RESULT([$have_shm_mmap_posix])
>>>>    +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>>>>    +  AC_MSG_RESULT([yes])
>>>>    +  have_shm_mmap_posix=yes
>>>> @@ -237,5 +247,5 @@ index 5492fd920c..95158ccfd9 100644
>>>>       PHP_NEW_EXTENSION(opcache,
>>>>           ZendAccelerator.c \
>>>>    --
>>>> -2.25.1
>>>> +2.17.1
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>>>> index 892a0460c..52d5c6696 100644
>>>> --- a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>>>> +++ b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>>>> @@ -1,11 +1,28 @@
>>>> ---- a/ext/opcache/jit/Makefile.frag    2021-10-19 06:34:32.000000000 -0400
>>>> -+++ b/ext/opcache/jit/Makefile.frag    2021-11-15 15:10:41.437289836 -0500
>>>> -@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynas
>>>> -       $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>>>> +From 0f7b9264c5130b3ca0a20d326fb13ca8fc0a9969 Mon Sep 17 00:00:00 2001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Wed, 15 Dec 2021 14:43:45 +0800
>>>> +Subject: [PATCH] use qemuwrapper for minilua
>>>> +
>>>> +update to 8.1.0
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + ext/opcache/jit/Makefile.frag | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
>>>> +index 98c5cda..fb0e6f0 100644
>>>> +--- a/ext/opcache/jit/Makefile.frag
>>>> ++++ b/ext/opcache/jit/Makefile.frag
>>>> +@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
>>>> +       $(BUILD_CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>>>>
>>>> - $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>>>> --      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
>>>> -+      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
>>>> + $(builddir)/jit/zend_jit_$(DASM_ARCH).c: $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>>>> +-      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
>>>> ++      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
>>>>
>>>>     $(builddir)/jit/zend_jit.lo: \
>>>> -       $(builddir)/jit/zend_jit_x86.c \
>>>> +       $(builddir)/jit/zend_jit_$(DASM_ARCH).c \
>>>> +--
>>>> +2.17.1
>>>> +
>>>> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>>>> similarity index 98%
>>>> rename from meta-oe/recipes-devtools/php/php_8.0.12.bb
>>>> rename to meta-oe/recipes-devtools/php/php_8.1.0.bb
>>>> index 38771948f..29e124acf 100644
>>>> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
>>>> +++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>>>> @@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
>>>>              "
>>>>
>>>>    S = "${WORKDIR}/php-${PV}"
>>>> -SRC_URI[sha256sum] = "b4886db1df322dc8fb128d8b34ae7e94f6fc682ecb29ff4f5a591d4de9feadbf"
>>>> +SRC_URI[sha256sum] = "0725ed2baea125496a898455d501a77460218b2a0cfad773fa9322f491b82b61"
>>>>
>>>>
>>>>    inherit autotools pkgconfig python3native gettext qemu
>>>> @@ -77,7 +77,7 @@ EXTRA_OECONF:class-native = " \
>>>>                    ${COMMON_EXTRA_OECONF} \
>>>>    "
>>>>
>>>> -PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
>>>> +PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>>>>                       ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
>>>>    "
>>>>    PACKAGECONFIG:class-native = ""
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#94363): https://lists.openembedded.org/g/openembedded-devel/message/94363
>>>> Mute This Topic: https://lists.openembedded.org/mt/87739886/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

