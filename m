Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDE0C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 03:50:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2890.1642132221495999668
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 19:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Rze0Kx34;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8013922c5a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E3GkfN032491
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=P0jFTKlLysYv0BYUCbRbw1pEItNKM/uAOVQTsp7nIoU=;
 b=Rze0Kx346LPM+Bdp8mY+mHts823LabjowK0Q2YfDPvGor33nBZr9eXOR1ZWmYuygZo2b
 p1GNVXI0ten3BrAejDk0fBozkaeEGr4+cWKF7x8NvG7R85eOD4L9+43DALIrkAC4PsVz
 niMWJCnzA7TRakGGgwDcjDDFl3CMltcHfsn6eF4/Roy2EPgy2KODE/ujejkRYM6DEcPo
 NQlDMMFcjbtreESYKVEWHjYfoEidM9cVWebFPCCOg9grCAwtj2kOClNJr4vcVbVBwcxZ
 pkSjgz+TXTJLuRTPF1g266bsMYtfnV13qQceLbmFKN2z5/5MVm3uyF+BCptNp132G0ef WA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy7rsc5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIjfSiRfQ8wqRvt1wz6L6CtW+oCQz0eYeaeM6zjxE3yxOD8rsZH9b4dLFyXDYdvkJ4n2djg/XhL9pEa0CoAjRv6w5Rx8t8yXrWPynMNINq5/6ogMIk+u6ccCvh1LyBku+ChRNXRCjZ44SL7RyU4hgAbrgwK9t54/PzdecDv+xUGs30JXnKdkzfelliWVHDcMZQy/BeJBk4KHMmRajXmlJ9rJ/8HolWvjqxbJEtphGLnWURV0IV0JNi/nf0GPMGti30H10nNYSIJagZV3+APuzILi53PTlFMWsFFlxA9sklzmcqj/tOxxHPvdBSNJNUVpmgkTnnYQVxu6aRlNgNn5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0jFTKlLysYv0BYUCbRbw1pEItNKM/uAOVQTsp7nIoU=;
 b=I62kEXA9Y7+9oc4fuNCL/dTT86t/RbL2Ya1d4IwLVBH5ztNqaEkZrX0Dka5cCf0JbM9FPX9Td4ndKNil8AjKKpcXoHjZqBwZMC2EDFAC64YMN+vbJ/AJ0LYjsiXPg7a7ekJYoqLyjuTuw5dEmQoHaNcGKfJNL6zHkTXCOZ4AdtM1ni94cse8X+24TgWheX0aEl+nn0M+mYMgvjI6Aew9B712RCxaYPNVmXOLqFxE4Tqmej9nMJvWKJ6cPPel5t/XlqGbUeSmgn4X0UsA+S3UGFuT43nHRHIaMBMK/c8JDF8F0mTi8Cl608wyG5+g8F8/BqBtR/R6SJ8kYTGRBM7lhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB2858.namprd11.prod.outlook.com (2603:10b6:5:bd::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Fri, 14 Jan 2022 03:50:17 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4867.012; Fri, 14 Jan 2022
 03:50:17 +0000
Subject: Re: [oe] [hardknott][PATCH] go: upgrade 1.16.10 -> 1.16.13
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <16CA05C4EDED1AE3.687@lists.openembedded.org>
Message-ID: <96b52a62-0475-7fc4-25f5-1f7129415e69@windriver.com>
Date: Thu, 13 Jan 2022 22:50:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CA05C4EDED1AE3.687@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------A046F97D94416824D8B84540"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::9) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f08bbb9-b085-4967-313a-08d9d710fa47
X-MS-TrafficTypeDiagnostic: DM6PR11MB2858:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB285892D9B6D96D2F05B3249AF2549@DM6PR11MB2858.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K2Y58JdorzjFUqXBPopgV8s1O3hIh6MDdOlT5VMvFMjFrgfQIA4kmQx+xe7yS2V+glJLSbvYuvtIcQulQCqteJEK2SfufmHlFAnZY+ta+8Vx+2zgoaqmYAISUp38V1zgRq5myw2tvGhmmT3Fq5K8GHcItOBcO2Ho2Zzw4E8Nn9bPGLsp7stl34RIEHeO48tF6eDkP75WRYG873o25GiTUD/G6PNxmgHXkN6GAgsE7jcASqQUEWikurfwn+zUQuXOG/av25VG97vAXswFCRqoYpgiGpxdtm7cVrfYO/qrGCF88u14LtYG9aOm8Ttt8QXUK36wL+rMEumZfv/iOCUUrhUrN7uF157ScfaRJRLTu4tvv3CvM7JZOANv/qo0fAZ0DTrBCIGPKv7ATvqfEF6IKTRrh7wTYzg1XWKbrZpKaI1yiXiydOlJXLW7YaUgx8B440Ob/pt4ee8T/gqqSUUctx2LioIlyVOFvuiEecWV+oEFFwQ5tGI5FLRUE8+VSLzYrv0fds8oZ1G3UpjzBseZ4V2kr4dLk/v2pUjD6oDg19ggtnhSRPdAQ8cpzZKtMHdPlGsF7BC9miql7cic2irE48wdAX3XWIVEjmoLxIqLqzvx83Gf9Lrft2jKwe6Djal1B0+ZSuKRi6oa/4BHKQoCgI58XPr9W6Ab5UWAwbSYk7Mq5+adE/ZDe4mEYDZ0z4zfzCKcsUlfNrJ0/qttMGqZL5NJBrVFvw1DtU3fSo0Rs0gmcXTP3e3q4xBvmy5K8SdOQB4/b6OQhgHkFm8LNY8+xwv/hGv1Qluw56fi23/eg8vQtyeIkW3WvcDjbEZSn/JOnvg38R/MkjwlIF4/qpV3437ZuZus+ZjEgrvCy5Uyi0Xp+C+z4EjvCiG8dc8dRHeO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(86362001)(186003)(38100700002)(6666004)(6486002)(83380400001)(38350700002)(166002)(44832011)(66556008)(2616005)(6512007)(52116002)(316002)(6506007)(66946007)(966005)(53546011)(8936002)(66476007)(31686004)(33964004)(31696002)(36756003)(30864003)(508600001)(2906002)(5660300002)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVZ3cFgrYzVQbC9HNkFVUllKV0NjQzhtdHZNMDJLd0gvY1lpU1IrYU5CRmxH?=
 =?utf-8?B?RXFpNHNWNG9WZlRzeGNJZUxraWEyVkRVdUQyU0QwNHhvQ1ZjVDNwaHVLUEJG?=
 =?utf-8?B?dmc1NTBEVzBkRm5hTklOR0w2MGxodUNjeEdHVHZRc0p3UXJsQUlSWEU5b25K?=
 =?utf-8?B?dkVSTm1uUEw0M1lhclM5WE5IYXhhNXpsVGg4Yk91UTZYZi9WcGFZRnN2emtu?=
 =?utf-8?B?VHY1WEYwQkM1aFQ1b0ZOemFqVTAwVjdRd2c0czBpbDVOZEl5YnlSRjhlalFT?=
 =?utf-8?B?d01zRUxzRG9zRVFISVlzaGQrMWNnTlZwV2ttdWhqVHVkczY4NlU1WWJtWTFF?=
 =?utf-8?B?K2ErZVlSUkpuekJ3RHBOMFYzLzdTdk9hNWYxU2ZtN040ZE5VRU4ySGk2V3JP?=
 =?utf-8?B?bmM2WEk5SkVHUHJHSktlekhQL0s3bGNMcUVIbmZhN1oyNUhBcTRFaWpRODNY?=
 =?utf-8?B?SS9DN0ZxZkg0ZDN1OWJlYmpvNFA1YzZmbWhyUlRYSVpDVFFwN25qell2TGFI?=
 =?utf-8?B?SU15L1ZOTXVJa0pNSU9sb3NCdG1KUEFaVEhNUXpyTURuRVE1TEdsZDBZQURq?=
 =?utf-8?B?WkJLVThWaFJCazhud2l4NEN0VW5MU25IRllvVGx4dXRSelVnQkFTcUw1QTNi?=
 =?utf-8?B?ZnhBaXlNYUp4VkZYMklVOWVHQm9zSFQ3OHB2V2FDUnJFNWFtZDRoaFowMmcr?=
 =?utf-8?B?SVFFT21lMlFjV2RSNlVRUENGQ2JtbWlOcFRRTjAvZXh4LzN2ek9nTzVTZ0ox?=
 =?utf-8?B?eGdjTE1nSW9FVmg5T3pQZ1BteUJGaHVtcC84emFIMlloa2VDcTBzaDBiTzdJ?=
 =?utf-8?B?QzZQeVdjSjFqTlhUNGkvN2hFYS9JMCtZL0hnSjc4UDgyeTV0bytmNVhSL2Zo?=
 =?utf-8?B?eThsYWJDR251TEZXMGpzSys4dTEreG10a0xpa1BFREZaS0IzYlJpME5lUnhs?=
 =?utf-8?B?ZFJncCtRSVJWUnFNNzlHYVdGS09JZVlTUlFqdkZkcmVuQkl1ZHp3YVJUdXJN?=
 =?utf-8?B?SUY1ZWJ4S3J1L1lZVXJGbEh5QkdwK0xaZFFrOW84aGlSWC9ma2hLRHdzYUJT?=
 =?utf-8?B?US84UzhaMzZXc3NvZHFzL1EwRDdNZks0UlYzSjR0dVpFQk4wdW1qMmFLMkhM?=
 =?utf-8?B?aWYxU29ES2Y0ckp0RmhrcTNKOWwwOFlyR1Jac3p0VTdDRzk5L2pORVFYalM4?=
 =?utf-8?B?NHNSVnJIekpndGdwd0V3em82WW5QOVYwK0ZaZ3VhbjhTYkV0ajYydTZocXNJ?=
 =?utf-8?B?TnpVUERibG5vNzIwNVE4OG5xKzZOelcrdlJrZWhvQzgxTzI3a1ZoZFNpYXd3?=
 =?utf-8?B?UzNsdVEvVVBHb05EOFdkV2dOVlVJZjRCRzZyMkxCNGJ5c2Fac0FxeGF5a0pW?=
 =?utf-8?B?Z2FESkdMdERhYzE4anBtT2JsdWU3eStwRzNKRURsQWZhdFZ5NC9NUmlydjRz?=
 =?utf-8?B?Nzh2Q1VkNGFJSTQ0K0d0Y0s5WDRmTmlyQ0kvTURUUzRicHBjSVIrQUhYaHFF?=
 =?utf-8?B?UVNLVWZVd0o2KzM0ck9TVnYxTVNZSmtsK0xmY0tkNzNWSXpwdlp0ckNzVnhz?=
 =?utf-8?B?bTlBNlVCUkRxVUcwY3pFS21VWndvcFlpWWxTZGc3b2N1YXkzaWFDaWFJV3RQ?=
 =?utf-8?B?WEZTL1FZVTFqUWVtc3lvbHBNTWtTUW1RWEdiQTE4Ny9iVnRFNGlkaVNYV0lM?=
 =?utf-8?B?UUJFQS9pOWM1b1g4a3R2NkVHWVZkZEdVaWJTS0ZuTmVjN3BQQlQ1VVRWN1RN?=
 =?utf-8?B?WGNMSGk4NnVObmpULzhHN0RyazcyM1Vhbk96dlliUnh3b3BYWDJYOG1DdGV1?=
 =?utf-8?B?T1dUTlVOYnZ6SEhCTzExL2krc1B4R0FXRnJ2d1p4QlNQY1ZPMzNSQ2haWG5z?=
 =?utf-8?B?SCt0YWtxK3ZhLzJ1TEVEZjhQV2U2eEdrd0pZbFp3R1kzZ01VNXY5V3lsc2FL?=
 =?utf-8?B?TWlBVEVScWxNNEdzOGc4WVcwUzhSR3BRTDFUTS8yRjRiZEl4Tk1SeEo2QjUy?=
 =?utf-8?B?cm5zbWZXa2tYbWNQMS9kR0thLzdzYWwyREhTTy95VkhRcGZrUHhpb3UvN25P?=
 =?utf-8?B?eDA5a2tRcjl3RTdBSkNKRHdaaWM0Y3JhWnNEYmtuUkhVcmI2TlFDL3hxcW9n?=
 =?utf-8?B?QkRnaDRkM2dwc2lEQk05ckdLb0ZmYUhPeU1kZFFIL2hnZi9hWS8rKzNFM1Np?=
 =?utf-8?B?SlVxYXl6RnkyT3B5NmtFM3lqZytiNE4xVGxJTU5ZWWZ5dXpMcGxrM09HRlZC?=
 =?utf-8?Q?o+gJE+AscDGQ/Zxr6OtLd5+yXcZlC85LndYeUOMPd8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f08bbb9-b085-4967-313a-08d9d710fa47
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 03:50:17.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /J//kI2wW18805MvJpowoeWEKA0OdbpFVfL0kHRbLCkm6eEJEOEvlmWcEqFnp6EBrv7clVa06HYrCZSUOMeoBKh5hGOs/rxkTYxIjLAe4ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2858
X-Proofpoint-ORIG-GUID: jTHZs5oRjNEyWFMp-LINNVXKmm2bRlns
X-Proofpoint-GUID: jTHZs5oRjNEyWFMp-LINNVXKmm2bRlns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_01,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201140023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 03:50:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94824

--------------A046F97D94416824D8B84540
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

please disregard, sending this to oe-core

On 2022-01-13 10:35 p.m., Sakib Sajal wrote:
> Release 1.16.13 includes fixes for CVE-2021-44716 and CVE-2021-44717.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc}   | 4 ++--
>   ...o-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} | 4 ++--
>   ...cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} | 0
>   .../go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb}           | 0
>   .../go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb}     | 0
>   .../go/{go-native_1.16.10.bb => go-native_1.16.13.bb}         | 0
>   .../go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb}       | 0
>   meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb}     | 0
>   8 files changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-devtools/go/{go-1.16.10.inc => go-1.16.13.inc} (91%)
>   rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb => go-binary-native_1.16.13.bb} (83%)
>   rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb => go-cross-canadian_1.16.13.bb} (100%)
>   rename meta/recipes-devtools/go/{go-cross_1.16.10.bb => go-cross_1.16.13.bb} (100%)
>   rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb => go-crosssdk_1.16.13.bb} (100%)
>   rename meta/recipes-devtools/go/{go-native_1.16.10.bb => go-native_1.16.13.bb} (100%)
>   rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb => go-runtime_1.16.13.bb} (100%)
>   rename meta/recipes-devtools/go/{go_1.16.10.bb => go_1.16.13.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.16.10.inc b/meta/recipes-devtools/go/go-1.16.13.inc
> similarity index 91%
> rename from meta/recipes-devtools/go/go-1.16.10.inc
> rename to meta/recipes-devtools/go/go-1.16.13.inc
> index 08c85b275b..8675afc3bb 100644
> --- a/meta/recipes-devtools/go/go-1.16.10.inc
> +++ b/meta/recipes-devtools/go/go-1.16.13.inc
> @@ -1,7 +1,7 @@
>   require go-common.inc
>   
>   GO_BASEVERSION = "1.16"
> -PV = "1.16.10"
> +PV = "1.16.13"
>   FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -18,7 +18,7 @@ SRC_URI += "\
>       file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>       file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
>   "
> -SRC_URI[main.sha256sum] = "a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5"
> +SRC_URI[main.sha256sum] = "b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a"
>   
>   # Upstream don't believe it is a signifiant real world issue and will only
>   # fix in 1.17 onwards where we can drop this.
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.10.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.16.13.bb
> index 4866c9f847..6e498a17be 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>   PROVIDES = "go-native"
>   
>   SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf"
> -SRC_URI[go_linux_arm64.sha256sum] = "bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9"
> +SRC_URI[go_linux_amd64.sha256sum] = "275fc03c90c13b0bbff13125a43f1f7a9f9c00a0d5a9f2d5b16dbc2fa2c6e12a"
> +SRC_URI[go_linux_arm64.sha256sum] = "3dd8e14837105cbfedf7124c7f8c524ce492748c370036c7316ef99e18d116d7"
>   
>   UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>   UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.10.bb b/meta/recipes-devtools/go/go-cross_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.10.bb
> rename to meta/recipes-devtools/go/go-cross_1.16.13.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.10.bb b/meta/recipes-devtools/go/go-native_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.10.bb
> rename to meta/recipes-devtools/go/go-native_1.16.13.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.10.bb b/meta/recipes-devtools/go/go-runtime_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.10.bb
> rename to meta/recipes-devtools/go/go-runtime_1.16.13.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.10.bb b/meta/recipes-devtools/go/go_1.16.13.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.10.bb
> rename to meta/recipes-devtools/go/go_1.16.13.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94823): https://lists.openembedded.org/g/openembedded-devel/message/94823
> Mute This Topic: https://lists.openembedded.org/mt/88413957/4422444
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------A046F97D94416824D8B84540
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>please disregard, sending this to oe-core<br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-13 10:35 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CA05C4EDED1AE3.687@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Release 1.16.13 includes fixes for CVE-2021-44716 and CVE-2021-44717.

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/go/{go-1.16.10.inc =&gt; go-1.16.13.inc}   | 4 ++--
 ...o-binary-native_1.16.10.bb =&gt; go-binary-native_1.16.13.bb} | 4 ++--
 ...cross-canadian_1.16.10.bb =&gt; go-cross-canadian_1.16.13.bb} | 0
 .../go/{go-cross_1.16.10.bb =&gt; go-cross_1.16.13.bb}           | 0
 .../go/{go-crosssdk_1.16.10.bb =&gt; go-crosssdk_1.16.13.bb}     | 0
 .../go/{go-native_1.16.10.bb =&gt; go-native_1.16.13.bb}         | 0
 .../go/{go-runtime_1.16.10.bb =&gt; go-runtime_1.16.13.bb}       | 0
 meta/recipes-devtools/go/{go_1.16.10.bb =&gt; go_1.16.13.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.10.inc =&gt; go-1.16.13.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.10.bb =&gt; go-binary-native_1.16.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.10.bb =&gt; go-cross-canadian_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.10.bb =&gt; go-cross_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.10.bb =&gt; go-crosssdk_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.10.bb =&gt; go-native_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.10.bb =&gt; go-runtime_1.16.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.10.bb =&gt; go_1.16.13.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.10.inc b/meta/recipes-devtools/go/go-1.16.13.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.16.10.inc
rename to meta/recipes-devtools/go/go-1.16.13.inc
index 08c85b275b..8675afc3bb 100644
--- a/meta/recipes-devtools/go/go-1.16.10.inc
+++ b/meta/recipes-devtools/go/go-1.16.13.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = &quot;1.16&quot;
-PV = &quot;1.16.10&quot;
+PV = &quot;1.16.13&quot;
 FILESEXTRAPATHS:prepend := &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a>
@@ -18,7 +18,7 @@ SRC_URI += &quot;\
     <a class="moz-txt-link-freetext" href="file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch">file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch">file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch</a> \
 &quot;
-SRC_URI[main.sha256sum] = &quot;a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5&quot;
+SRC_URI[main.sha256sum] = &quot;b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a&quot;
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.13.bb
index 4866c9f847..6e498a17be 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707">&quot;file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;</a>
 PROVIDES = &quot;go-native&quot;
 
 SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}">&quot;https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}&quot;</a>
-SRC_URI[go_linux_amd64.sha256sum] = &quot;414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf&quot;
-SRC_URI[go_linux_arm64.sha256sum] = &quot;bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9&quot;
+SRC_URI[go_linux_amd64.sha256sum] = &quot;275fc03c90c13b0bbff13125a43f1f7a9f9c00a0d5a9f2d5b16dbc2fa2c6e12a&quot;
+SRC_URI[go_linux_arm64.sha256sum] = &quot;3dd8e14837105cbfedf7124c7f8c524ce492748c370036c7316ef99e18d116d7&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://golang.org/dl/">&quot;https://golang.org/dl/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&quot;
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.10.bb b/meta/recipes-devtools/go/go-cross_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.10.bb
rename to meta/recipes-devtools/go/go-cross_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.10.bb b/meta/recipes-devtools/go/go-native_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.10.bb
rename to meta/recipes-devtools/go/go-native_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.10.bb b/meta/recipes-devtools/go/go-runtime_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.13.bb
diff --git a/meta/recipes-devtools/go/go_1.16.10.bb b/meta/recipes-devtools/go/go_1.16.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.10.bb
rename to meta/recipes-devtools/go/go_1.16.13.bb
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#94823): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/94823">https://lists.openembedded.org/g/openembedded-devel/message/94823</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88413957/4422444">https://lists.openembedded.org/mt/88413957/4422444</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------A046F97D94416824D8B84540--

