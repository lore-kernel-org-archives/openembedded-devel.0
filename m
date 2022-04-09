Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54B7C63686
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4347.1649492950368310034
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 01:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RwvJjsGg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1098c8ded6=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2398S3Dp009600
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Apr 2022 08:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XfSpIuwrr7gC3EV50xWDmiyJrsWZLOSD0wsm7W6T66A=;
 b=RwvJjsGgJg8AxWrqzrjjwNPrb8gBoS2q3dCwaSwR17mxgkX2JGf4CGRxjF12kbhTgiTD
 feIjy5kfip/ffCzxCzlhHmPakgpFtDd6jxnDHig8tEMp6JOqn0nunPvtYCw0Hw+JoT5m
 PxxnKluWMWNX4/ymGLNt8fsK9IUzwj8mOPKLLphLUwts0QrovJfCQsBH0fJGJf1SpDuF
 mwhDqZveAYXMjiTDz/GnB+Pl6389rgV55xJz0jRvSyTINbqx3cr50R6v9+4U+dtoNllt
 v1HNwjdjifS3enFPvE1TXfsFXuLkr2939niNeALbrhpL2UyVUICaVw6ccscY8YF/xuQW Rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb66er0fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 08:29:09 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2398T9JP010243
	for <openembedded-devel@lists.openembedded.org>; Sat, 9 Apr 2022 08:29:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb66er0ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Apr 2022 08:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFNJ/A4vJjRfSJIMie/bM8FSnyuBcbh4Co4evowwD5Y3e9hFMEIMo+iQuTMVX4NTl5JEnoyB84QpMAI8zv8/NZimVVs5Al0+NsDkEyF8kavgdGZd5vdGJIPrzGAfCy3gG8jHpdpkoKr0xV3KN6F8RrtjoTi51RWpKj0K76c7aHvixeWKJ5xe9hjcMbzGTnUBXPphgk1IqZZv8Av18cNOfP74OTB5vLHkMeRY4R8sH/S7k7dRy/IWYnQpYwROUZA12lf0n+Fu55GwfCDMWCOj2vgHbvAk6/8fxuZmZSE3HhPIe2UFyh3G8l1WUcZE4CJAihPiis2OaR5wWmyhkJ+loA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfSpIuwrr7gC3EV50xWDmiyJrsWZLOSD0wsm7W6T66A=;
 b=mYD0mXmyjG1Btu3/iQFDrwIe50j0GngTSMIYXuI3C+Dzl16qfQt+2fw4+rB6zT0dJCmh/BiZJAji6aIr9SakLoaVh7OvUpQlaVTSPVBIxeHeLiD4xbjaEPNdPdCCqOHHAmCZ+xHiRe93XIAJuwmYXHFgRGU1aXIAA2C1viHtkxgZ2Ab7fThlf0bMDXqTqi87zE4ZTdal+BjmN/4EVI6lLXqPPfFyn4+SvfeyR6TztwBkjy9mfh5BZ7p1kU7Rr7J4cR1wUXtF/f5OfoJtckZp2m1jxu1QEuUaeF1D9aXUmZLuB91GCykR4oSJAK/FEreQ0f68bFMxK8O7U9p7gn2sBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2800.namprd11.prod.outlook.com (2603:10b6:805:5b::15)
 by CY4PR11MB1319.namprd11.prod.outlook.com (2603:10b6:903:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.27; Sat, 9 Apr
 2022 08:29:06 +0000
Received: from SN6PR11MB2800.namprd11.prod.outlook.com
 ([fe80::30c4:12d9:c133:e6e1]) by SN6PR11MB2800.namprd11.prod.outlook.com
 ([fe80::30c4:12d9:c133:e6e1%5]) with mapi id 15.20.5144.026; Sat, 9 Apr 2022
 08:29:06 +0000
Message-ID: <58f7d5a5-567f-6738-0b16-4db79929e01e@windriver.com>
Date: Sat, 9 Apr 2022 16:28:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-python][PATCH] python3-wxgtk4: add distro feature
 check to match dependency
Content-Language: en-US
To: Davide Gardenal <davidegarde2000@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>,
        Khem Raj <raj.khem@gmail.com>
References: <20220404124425.42692-1-davide.gardenal@huawei.com>
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20220404124425.42692-1-davide.gardenal@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0220.apcprd02.prod.outlook.com
 (2603:1096:201:20::32) To SN6PR11MB2800.namprd11.prod.outlook.com
 (2603:10b6:805:5b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 819aac45-b0b7-4916-53da-08da1a0302ba
X-MS-TrafficTypeDiagnostic: CY4PR11MB1319:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1319957BDFB2B3552A57ABFFFFE89@CY4PR11MB1319.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	snlLxCFX3PeYvqQ3iYRSFMjVDB2XSdSFiftL8shX7lKvN49Va28MmZjEZLXxlB6s7rIYPwXPBDHMJYoVwJULCpYVbpRti8B+pe++/z9tSJvdeiYCX1aeSUBav/mzSGcMIKX/4zKnMZ78PrGKFgm7r1yJVyqn/zDsh5bHFIYGqsIYaDUHnnNWf64cbNVZDSvtrbkSlyvv7H+pPp0onDbNP9kPGqB8ClZjmKVTKDTfpJkh7QcFtq+djqmwDgGYfxS3Ssm+mH6DnCHW+34ecq75bvM7fVVzWjYkdUbG32/dczDowO7mwyOrjbVpGYrEvhD1B2sz04VfiPQcreET/I4QjvVvfmOTdpE4e5mYTgt3WhVvIXs6q9kQi8CvOlhIY1PbNuUHk//yWB64DrrfjsqTmeANExyYuVRU0NTRcVa9jNM9bjhunsF0vqsQyDP+wNLIZoZJdmpQPgVbxuvixmmtP9JtcGQS+YGmglgkGLsROZvbrAc5YqGzc4LdjD3u4+OlY1qQK8i6xpzDG1s0trJEi2RAwQ6786fywjH/P9vfoQsFfMd/N8M/cl2DpzTC6JF3f8R+kto9oi9o6ZEzM7jD/XbIayWlVLShtxfHDlBnju8icsa1zDDL2vBpVSZ1wtBmZwE9Dye4rRXmSigAR+v2hd5OwtxS9BdTi/TMti+smhIYnPTmzJzY90nMYILZ/wC+aHhnoPPGohDXCqQM5g32m/9RFvOyiI2hHF7ldcMjsW4CT7oW5MEAIkQ2oIc7U8oqf+nUf77NbzpRCKwDGOf+tthOJ/qwjIOb/g8s4ueuy1Tf+zjDN0xl7A+u5xyxjdesk8LYrt6ZtzeIcCuHrZwL9Jd6gpPYVIEAOAFPf8xoVhTRqffeYoATMJ08f8HHkwG6UkoCkKMfEjd7apCfjx61aQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2800.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38350700002)(38100700002)(54906003)(966005)(508600001)(6486002)(6666004)(36756003)(31696002)(31686004)(86362001)(2616005)(6506007)(52116002)(6512007)(53546011)(83380400001)(2906002)(5660300002)(26005)(186003)(4326008)(8676002)(66556008)(66476007)(66946007)(8936002)(9126006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzk0RUgySHRTK2dSUmdXdXFFS1pQbjdoTnpDYWlvZExRMmhMNzRaaEN3QXRr?=
 =?utf-8?B?WE4zTkp1NjJCN0FBQmE3UkJic1NBT2huRHZrSzN3dWx6Y0FaSzdCOC9UR3dD?=
 =?utf-8?B?dkNOeW9pdHBEa1UzT21LWDVHUTB1cUZNeU9NZWo3bDdJSDZoZi9XaVczZWR2?=
 =?utf-8?B?c200MityOER5cmYwTThWRFp6TmxHeU9DQVZIWVFwY3QrRTZxUHZoMlVhWDU2?=
 =?utf-8?B?WExBUmd1Y0lUTWV2Mk9LTlF3ZkJwbkRMc0ZGM2wvMnZuQytXRWVpWCtuV0R2?=
 =?utf-8?B?K2cvZXZXMEtOdVBDc3hqeEwvSTdYaDlsZ25yVTBkUzNpdlFxV051VWt5QlFy?=
 =?utf-8?B?MkMwT2dZbFZJSHIrTTNwL1RCWm11bldERU0vOE1LM2FONUg4aXBwS0xIM0sy?=
 =?utf-8?B?K2ZVMXNMYllMQTZUWVRJMEZIenFyaHNwNXpZT1VkcTkrVkg1WnRXT0hPb2lP?=
 =?utf-8?B?dlpyNUxnWTU1OUY1YlJZR25ienJpMHZ5RHA0RnV6NnRrSjNCUHB6YlNlWjZJ?=
 =?utf-8?B?NERPamRpQW84YmFmLzZkSCtrM1lRYTQ4bnV6QTRHa2Fud0pjdGgxbUN6a2FZ?=
 =?utf-8?B?K0ZtYzRPR1dvT1pITDU1RkpVNXFDbTBpMDRkaWt4U3hmTlBBZFVUd3ZkNEs2?=
 =?utf-8?B?enZPVkNLaGdkVWFNTTl1ZlpLRlhhcVI4aHdNU1BrU3FXMXBIRk1yZ284SlZB?=
 =?utf-8?B?UDdTL0VDUTJhTE0zM1RCa3NwNTlMVTF0VUJoVGZJUmZxZEErbVdvUnZNZncx?=
 =?utf-8?B?TW5SRnlYU3M3d2J0eWpWazFZMmpiODZQTjlzYU1zT05OamJkaTVPS0hWYTNY?=
 =?utf-8?B?c3pKUDVyRHJ3K3NmclMxRmNsNHhwR0d0NTQ3Y2xCSjJEV1laRXBoSUU5aWwz?=
 =?utf-8?B?R1FINUlBNlpXMzNSaytmTVZmQ3J5WGp3T1FXd3ZhdlNYY3BZNVBnL2VtMVNs?=
 =?utf-8?B?SVdIUzA4bmtoQkJDdHZpUkp5cWtWNHU3YkZTYlR6Vk55a0JDYStYQ3N4RzZX?=
 =?utf-8?B?UkdrZmgxdDlnL3hNSGcrRXJHZWhlejJRM2JwWnA5Y1VNTFBCMFI3RjFsMW41?=
 =?utf-8?B?WDlHTzVYR2hEUnFZLzBXVVR5QnliM281aDBYa3hRUmV5K2x3anpTZW1YK1d3?=
 =?utf-8?B?R0luUEd0dkUwREZnQmNqQythQkRCckpnYUd0YUtQbTM5VXZ2SkF5anBFQ1Ay?=
 =?utf-8?B?T0NHOHA1NVozeS9rbFpLRUM1dGdNQlpRcmloS3BJYWJWZGNOQkc1N2ZFZStH?=
 =?utf-8?B?aGM2bEpIbURhWHNKY2JtN1MwMmVnY2ZqWWhzSnREUEdSbzBuY3Fua0kzcXNB?=
 =?utf-8?B?UFlheEtBRzE2dkg3QTJYTEZmQ3l6Ri95SGVBL1Z3RTRLVHpwM25rSkVsMlhQ?=
 =?utf-8?B?aTdJdjg0TW50dm90VzBLOEhNeGZjbnF3bnZIeDdCRllsd1Y5cWhseEpZQUhx?=
 =?utf-8?B?YzJ3eVFoS3dIdThvV3lEcnRNNGxQWWZYNmhiNEhxTGE2d0xBZWdCaGVHUlpS?=
 =?utf-8?B?NSswSE10a3M1WVJINFpyampFSzNVZEJjOWlSbHNuMjZ1cDFWRTVmNUcwZWZI?=
 =?utf-8?B?L0tNQmZ4T296ZEl0VndDdlBXeU9Ic21ERFVlNWR0VUVnR1BaT25nOVk0cUYy?=
 =?utf-8?B?Rkhxd0RFRS8rNktqSWsyRG14OTU4bzc5eHdMSmxTSjM3cXZ6TGNjcVVnc2Nh?=
 =?utf-8?B?N3JuVWFEYlZmd21JZFVpajNpbjNDa3J1VzZnbXI3ekpjc20wSkpnN0NHdHpN?=
 =?utf-8?B?bGJEY0FPdXZJMFJMMytuem85QnhPUkdJUG1MWmRoQ2N5ZmsxSFd1ZksxN1ht?=
 =?utf-8?B?d1hjWUNScGR5S3p1SEFmR3NvT3orZWtITklWWU9HOEhWa2h2SzB3TEJVbU9n?=
 =?utf-8?B?ZXFDdE9xdmorMmJUOTJYL2VUYVhSNE16VHE0K3NWSTV1OFBNb0xtelBvMXdZ?=
 =?utf-8?B?NFpMdGFhWjBqdDR1QklGRUFXQ1hpMzhRbE1iRGJ3ZlR1S3kvZEJHb0VXSm85?=
 =?utf-8?B?WGlEbUV5dEZGamhmT0V1Y3Fjd0NJUDcxSWt3MmRkUzMrVFNzbzdaNXBJKzRv?=
 =?utf-8?B?YzV6bFdpNkNGZ3ZtdWlDV0VzTkxPUnRoTUhpQ29RUGVFSS9WbS9Qc3B2N0xR?=
 =?utf-8?B?ckJ6aXFsTklzOTZCMGNnbWYvSEpVb0lCTDVscUZRenYydnYxTG1SRWgvZDZM?=
 =?utf-8?B?dThVT2dueElJSXNqY1cyQlpUYm1Xa05QMWwycHE2clNQL2Exc3RTaU9sOGNn?=
 =?utf-8?B?TkhvUGRvb1VjK3JUM25qcEJ2YnFNVEpsSWRVZ1ZGVWJ1Y2tBdDBkZ0daWUJ6?=
 =?utf-8?B?UTBqVnR0NWVQRGZNMnBabDdwQm94MEtSL1pObzB6ZENMTXVXb2lNSnM5NW5w?=
 =?utf-8?Q?bBHDtnySOdmvNv5w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 819aac45-b0b7-4916-53da-08da1a0302ba
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2800.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 08:29:06.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +9R9HpziA2dhXwvdRKAKakQG4+8wCSrnVnyujvkDXKOHDA/yqHS5D8/sm306irzsXh05NpywzuCLfyCIQCG7CM90rjRbxzQvfflFllDchw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1319
X-Proofpoint-GUID: IuZxHhhq1CDDC0Iah9xq2rkS28CitRGL
X-Proofpoint-ORIG-GUID: v1KB3_YhKW7YXIH8smcSZp-eYOuWLo56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=936 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96494

Hello,

On 4/4/22 20:44, Davide Gardenal wrote:
> Add REQUIRED_DISTRO_FEATURE to match wxwidgets,
> this fix build error (not buildable target) when x11 is not supported
> 
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>   .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb   | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> index e61b00efa..dcb373a1f 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
> @@ -4,6 +4,10 @@ HOMEPAGE = "http://www.wxpython.org"
>   LICENSE = "WXwindows"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
>   
> +inherit features_check
> +
> +REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'no_gui', '', 'x11', d)}"

The fix isn't correct enough since there is no PACKAGECONFIG for python3-wxgtk4, 
I will send another patch based on this.

// Robert


> +
>   DEPENDS = "wxwidgets-native wxwidgets"
>   
>   PYPI_PACKAGE = "wxPython"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96377): https://lists.openembedded.org/g/openembedded-devel/message/96377
> Mute This Topic: https://lists.openembedded.org/mt/90240535/3616940
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [liezhi.yang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

