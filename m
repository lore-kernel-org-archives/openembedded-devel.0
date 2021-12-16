Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFD3C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 02:34:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.5096.1639622049657822103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 18:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cMDNGTpV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79842123dc=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BG2OEtX001327
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 18:34:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=j/mVmYJklX2eXuxNRZDJ/7g6HIcP7v9UKAryRnlH73U=;
 b=cMDNGTpVo+cYpUMpUk8uKa7GiNm0fVcYN4NFqS+ZqMBnm91ydsa/eUg1lcrlb52LhsQb
 7lDsehoi9wuNlOd+vuwj5XgBvVurycOrwneEuyYU3s7qst4ojloDvIu94bho+nMkonpP
 VxOPwqDw1oBExZtTo9PIdaON2ZT25DzYRAyy4Q9IWVY1TBtdZ40OSA6EV5w06v4Be59j
 2NbCkZxj5JMuzPy8jooOH1GkyhFGWj6lmAUElQJpx1J8qiUS0sitEuTv3N83XXO5kxL3
 NjQmkn7pdM5fJY1+ZHruDhJ5MAyVHhuC0SaTuI1IBEKqGF1I5AezlG7cEKsrEEFvzSag fA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cypc1g99t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 18:34:09 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BG2Y85H019815
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 18:34:08 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cypc1g99r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Dec 2021 18:34:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0UQFs40mK3wRBmbqDge+XKA1voic4BK9rNP8msHD6kJZWKNww0Lm8Si2gkjHukBeTfXhAmu8/J5YNwY27K9Qps1tGUIk8iy8oM5KHm5qnkUHUvC699D33ayJQ7i5PAGjeYUC4nJhx1mbICJ9xay6uxg4odlkbE8gQ8g3w/nDnbmuhTmI+Mcr+qV3qRCNL9DfRcRENTJuN1qJVd0ajixj6rWk6LVmKvQ2JF0v1j0C+qxRSbGT8n/08Qwv6R2ub3TBc43Z45RE3T25fvn3oEqt+kdMykfkSRPcuqmfLklXw5s/E2nJXhpiXf++QotdPv4FwY3N+mtWvvMKPRr6VXu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/mVmYJklX2eXuxNRZDJ/7g6HIcP7v9UKAryRnlH73U=;
 b=FiP+/dSThZfU5ixhJGG+NJrahHN6aUFDNTqIKT0AIMAX91Re2Wgakl2eVCHzbzqggJTUKYYlCmQSid2ppS9WuFyGcL8T1p08N0fG8RNqaF14A/qZ54xnCMOP9IN9nqZj9FGFVfBliEr8CBHzxi9T8GPTdF9ZzODbKqm46Bs6PP4OTu829SEMUixweYNC9bUSFQN5n8gyELok6ijas8bN3xRynm3IsSbBPNVTc+N1jeVCJ9UwKqiOA8+5YZ25MgZXEojMyWGvdx5/9ElOMIe7IcjlwwYhGw1N6TDTcTT4BzVBBhjmJr97ntdTP8Dq2GLXNFiuyi+iIgCyu/9ZfcamvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 16 Dec
 2021 02:34:06 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 02:34:06 +0000
Subject: Re: [oe] [meta-oe][PATCH] php: Upgrade to 8.1.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20211215072835.1371-1-mingli.yu@windriver.com>
 <CAMKF1srh301NbKARXz6SPYJccoy-kMzwFJXo7mi65snXEydskA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5aec92e0-43bc-8bf5-08a4-cce18fc61fcd@windriver.com>
Date: Thu, 16 Dec 2021 10:34:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CAMKF1srh301NbKARXz6SPYJccoy-kMzwFJXo7mi65snXEydskA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0180.apcprd02.prod.outlook.com
 (2603:1096:201:21::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37de53ca-2661-44c7-6774-08d9c03c880f
X-MS-TrafficTypeDiagnostic: MW5PR11MB5932:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5932A3463E04BD0F22B34D50F1779@MW5PR11MB5932.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JXPRz0lNCFai8uqDsvI1dyp/MaPkmo+/zEN70ULNaPzbi50LnKp5fV3luFokab4QQPEM+RKtLWGoU/n1QWn3vXj8q3abaZsqpMkNJbiEx5BKHAJOnhPXMEYlpC31zSeM4WrVvkBNKNcbvtmKhPAjV5JcBVd+Jaw8zGXAaQKu91fK5BOIORk7CCb8TBYo7rB+xB8nQVeuyEcYL5YnTaHUHRcEv4+amh4T8jKcIwLWSjFWxa91VaLkQ3+zzv+az7FY8QB4g41znlUgK1oNYnp2g1jGFbFMfzenPBQEbU5Fs3RpCq6frJiKHVIPy0Q57OwjDltFmP3+c42PUhRMyynuL2y1Vb3Q3RX8kGI0plbdQ+XnpR+NP9ubpyUtJw05cve0xYVdchNaVIL+4s9Ar3lDvWWS+qUvtbGfpU9LQB1tFGF1q3ZRAGGhDibF5T5ZbbgMi3w465srRB+e40wNtJWzQYkEMjDYwzVDFPCsCJzoI2UfUoUHuyYBgfOEY3mhTDpoSicLk3TRYZ4VWjciWLK41BbXlR1rP73WNik1E3nHUjLx8hlWhoa7SXuSwVbkQkwQoWLLO8vX1gFFQUxWoBfwH43V3dshNKq2PsX7FwecxI//ex+kz7ZG7MHLX+c5aR9wfr11BvjCybvCDGVUvvkemEHzRFbdMM5yWtSEahRJucN+QlPZ2QOOKA4Z8yx25W2HsWj0ttD/dE1tCsFXtlFTH5Le5/PKWmtBngWJS3P6aHZ9aqpfFiVclt69qog+SGP9wiL2P9cIC1YlaGbWzdZpxv6GXkPqBolsppSYdgwWjHKhIgIt10nYpnLg0aJ8KbL3JBaqftGdjUB6SwgLci4LuprWavp4wVIw6nzxWh4jq8OjkpLCF2xBYxUi84a6Y/VTPhKnQ8EVbqqKpXdEc6q6ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(4001150100001)(186003)(86362001)(508600001)(6506007)(966005)(316002)(6916009)(26005)(52116002)(6486002)(83380400001)(8676002)(2616005)(6666004)(2906002)(6512007)(8936002)(66556008)(53546011)(4326008)(36756003)(5660300002)(31686004)(66946007)(66476007)(38350700002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2tpZ0lZWFNaOFBZSlUxZUozRDFpaVFHUDJucFRGTExpUVhyeTl3bVRCSDNi?=
 =?utf-8?B?YW14Y0g1a08veGdUU0Y3WnBqNnNjSEJIUGorOVBZTnNLRkJtUmZlczdpK3ZM?=
 =?utf-8?B?OVJyVlJKQW1LZU9uNUo1ckZHY0tJeFlxUDFzYlFlZ1BqR3pPN2FyQ1cvQXlX?=
 =?utf-8?B?L3UxaUpQTDVlSTFZNXIyU09WV2R3dmNQYURtUElaZHZqYzN5dEVuMVRLSjVv?=
 =?utf-8?B?ZlJRZkFkRURxWnF3K2VYSlljQWRvQlZFUTFSSHRMaXBHeGsyUENjTjRTVzNh?=
 =?utf-8?B?Y0ljbi85cWk4S3cyNFU5SkZXSy9sUGpVTFprbzNYaWtlNFA4ZGltNmhsa2RI?=
 =?utf-8?B?YlZtang1aU0ySGZ0S0xSQ1g0STc4cjlqN011aUZDbWw2YjZsWnlSb2h3Vk1i?=
 =?utf-8?B?WnptWHZGMzJkT1JZaFh5Q3JTWElDS25yQnRTOFFzVHNXbGtjRm9WbXNtN0xv?=
 =?utf-8?B?NUZVMGxrSUU5dlUrVnpkTDZLOE0vcFNQQ1dyNVZOYUNFLzljS2RYS1ZTTzR5?=
 =?utf-8?B?QlhQMm5ZUkhRWnBCNVlJSjBqMVZQNHh5cjVUNk1qVVhxZkthTWVXWk5nNlNs?=
 =?utf-8?B?a2tnOTdGcVdzYUN2aTV6cFJleG93VTZRdSttYmQrQUVlazNkODVyTzFYeTZp?=
 =?utf-8?B?WVczK2xlYXFvMzhMSzVra0FYN1pIU1RFczFBQnJaYW9zR3NoeEZWdGFuejFO?=
 =?utf-8?B?cDJDQmxOOG8wcDJBdkowd1BLZGdzY1h5dUpod1NsS25icDlQZmhzRXA3Ukoz?=
 =?utf-8?B?NDlMa1A4dk9QRUNhR0xlY3lzbEp3UWx5OGp4WnFUOWdRR3QwMzhlY1NKY3dL?=
 =?utf-8?B?Z3c1WUYwMXgzSDY3bEMyVlZwYy9PSWw2OGd1emQ0a3B6My9aNjJUSHVvUk9i?=
 =?utf-8?B?ZW9jb0p4b0F0aEtCZUJ0T1BHeld3NnFneFEwby95azFjT2EyZFJiSUlmOGQ0?=
 =?utf-8?B?dXhIdnZmeUU3bWljUjR5L0d3ZXZpN0gxblNIeEhmWHp6d29jRHBsUWhvNnZI?=
 =?utf-8?B?OWVXYVYyT3ZzZjUvWGp6YVFCRHQ5VjJGTUtZZ1g3dXNscGlzVTF5dGZvRk1I?=
 =?utf-8?B?MGxmSjQxTlRYSUE2cmY4OUs0bTkwRFF0WXdkZmtRN3FWcitVU2JIOU84R3Qx?=
 =?utf-8?B?bXFBcXFiRUpiTExUUVhJWVJoa1Nic0ppa2JsWUhybDBqeUxrVEdJYUhVY3FL?=
 =?utf-8?B?ellSdS82WWNiTDc2cCtJaC9IVWMvUGduY2VlQjRraTl1WG5NQkJpMzE3eSsy?=
 =?utf-8?B?cmluRGRRdGJDV2cvY0xVdGE4WVpKRk9LTWI4RThseEkrdFJZVy9MT2tWUzlJ?=
 =?utf-8?B?MGRHL1I1N0srdEN3Uzc2Uy96Y1pDY3RITEpUOVZmZEp5T0hEM21NaG1ZNGIw?=
 =?utf-8?B?R0xMSWp2ekVtUndwb1VqeFA1UldPUjgwNzYwNzlvNDNXa3pMSGZ6WHAxalpE?=
 =?utf-8?B?ZmltNTQyZWN0dkNmNHJlQWpEY2FmMkU4ZUF3OE1wd0MzSlVlQWIwRU1OemJI?=
 =?utf-8?B?aEJGdEc2VExReUpUOHd2TDBYNHB2bXM1alBNaTlZeHI3b2xvUHhKSHczRTF5?=
 =?utf-8?B?R2VOVFZrYlUrdmRIb0tmVjk4eXVXc0F0cEVaT3BTR2F3cU1BYkpMU0VMOURM?=
 =?utf-8?B?b2UyWjQrQ3Bpd0ZSU0gyWW80WXNNbDA0RVU5anNxbzZTQ2UrT28vRzNNdE1N?=
 =?utf-8?B?a3hsLzZoQk1Ib1NLYXRvT0FsNWFZZDRvaStCS1JiWGlvVTBwcFpzRTRmZHNs?=
 =?utf-8?B?Y0dMeWxTbjE2VFpLakJYWlp3N0NiVHd4aGFUR0VKemdZR0g4SUNvSHFaNHJ0?=
 =?utf-8?B?WG1ZdDhtVEJacDZKQnlDcDdzc0pMRHdvVHFjc3Jic2xIZUZqSXZRbDlLdG80?=
 =?utf-8?B?OEVRQXBwMDd3THpZSlpEdkRlZ213Z2QwWTUxaUpmdFdqQVJCYWQwTXhzTDhC?=
 =?utf-8?B?SVZySWFSSXhRc1drYlUwTFhtN05MYnZrci9IclYvV0dYWmJvcHJHUTFJcUpu?=
 =?utf-8?B?dC9DU2JMZjU5UjFQaCtKd2M2NDVQUzNsSFdHaHRCN3ZuTW5velR3T05HaTNO?=
 =?utf-8?B?blo4T3owSG5peFpYQXl2b0EyZUtXZlFIR1AzMUFGRjRZMmZSbmg3SkNFT0Yy?=
 =?utf-8?B?em9paGZTV1ltME45bWlHUzErNzJ3bkNzd2tBd2JpM0UvV09ZVy9vMGx3WC9T?=
 =?utf-8?Q?8YKA7CaIxK6T7+NjnYiAW7Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 37de53ca-2661-44c7-6774-08d9c03c880f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 02:34:06.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OnTKS7V7lrUDUBRp6ROgT/Ku/2pYzcBKbwzVKfLk0MRuCoLEF8IpK1steqHDalaAd07kvO4GyhK1pGTcrdkb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-Proofpoint-GUID: 2OjH6bFS7Sk8oSc7E_k05h5ay-XRJpv7
X-Proofpoint-ORIG-GUID: GVLFlf8jiYJv6JYKeZlae41Zig2inPmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 clxscore=1011 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 02:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94376



On 12/16/21 2:05 AM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Fails on x86_64
> 
> | /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/php-8.1.0/qemuwrapper:
> line 2: 21613 Segmentation fault      (core dumped) PSEUDO_UNLOAD=1
> qemu-x86_64 -r 3.2.0 -cpu core2duo -L
> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot
> -E LD_LIBRARY_PATH=/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/usr/lib:/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/lib
> "$@"
> | make: *** [Makefile:383: ext/opcache/jit/zend_jit_x86.c] Error 139

I didn't reproduce the issue locally, anyway I will look into this.

Thanks,

> 
> see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1797
> 
> On Tue, Dec 14, 2021 at 11:28 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Rebase 2 patches to new version and enable openssl PACKAGECONFIG
>> as OpenSSL 3.0 is now supported in the new version [1].
>>
>> [1] https://github.com/php/php-src/commit/7b34db0659dda933b1146a0ff249f25acca1d669
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...ext-opcache-config.m4-enable-opcache.patch | 50 +++++++++++--------
>>   .../0011-use-qemuwrapper-for-minilua.patch    | 33 +++++++++---
>>   .../php/{php_8.0.12.bb => php_8.1.0.bb}       |  4 +-
>>   3 files changed, 57 insertions(+), 30 deletions(-)
>>   rename meta-oe/recipes-devtools/php/{php_8.0.12.bb => php_8.1.0.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>> index 44534cc06..a967d6412 100644
>> --- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>> +++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
>> @@ -1,6 +1,6 @@
>> -From 8cabcf1043953a0fe48107204a2212609b8e6516 Mon Sep 17 00:00:00 2001
>> -From: Claude Bing <cbing@cybernetics.com>
>> -Date: Tue, 9 Nov 2021 12:59:15 -0500
>> +From ca9b419f2c146061f73ee045cb0a069c18b40cd0 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Wed, 15 Dec 2021 14:00:08 +0800
>>   Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
>>
>>   We can't use AC_TRY_RUN to run programs in a cross compile
>> @@ -17,15 +17,18 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>   update patch to version 8.0.12
>>   fix issue linking with librt
>>   Signed-off-by: Claude Bing <cbing@cybernetics.com>
>> +
>> +update patch to version 8.1.0
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>   ---
>> - ext/opcache/config.m4 | 197 ++----------------------------------------
>> - 1 file changed, 8 insertions(+), 189 deletions(-)
>> + ext/opcache/config.m4 | 204 ++----------------------------------------
>> + 1 file changed, 8 insertions(+), 196 deletions(-)
>>
>>   diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
>> -index 5492fd920c..95158ccfd9 100644
>> +index 2a83fa2..9471b5d 100644
>>   --- a/ext/opcache/config.m4
>>   +++ b/ext/opcache/config.m4
>> -@@ -101,202 +101,21 @@ if test "$PHP_OPCACHE" != "no"; then
>> +@@ -108,209 +108,21 @@ if test "$PHP_OPCACHE" != "no"; then
>>      AC_CHECK_FUNCS([mprotect])
>>
>>      AC_MSG_CHECKING(for sysvipc shared memory support)
>> @@ -93,9 +96,10 @@ index 5492fd920c..95158ccfd9 100644
>>   -  }
>>   -  return 0;
>>   -}
>> --]])],[dnl
>> +-]])],[have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
>> +-  if test "$have_shm_ipc" = "yes"; then
>>   -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>> --    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
>> +-  fi
>>   +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
>>   +  have_shm_ipc=yes
>>      AC_MSG_RESULT([$have_shm_ipc])
>> @@ -147,9 +151,19 @@ index 5492fd920c..95158ccfd9 100644
>>   -  }
>>   -  return 0;
>>   -}
>> --]])],[dnl
>> +-]])],[have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[
>> +-  case $host_alias in
>> +-    *linux*)
>> +-      have_shm_mmap_anon=yes
>> +-      ;;
>> +-    *)
>> +-      have_shm_mmap_anon=no
>> +-      ;;
>> +-  esac
>> +-])
>> +-  if test "$have_shm_mmap_anon" = "yes"; then
>>   -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>> --    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
>> +-  fi
>>   +  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
>>   +  have_shm_mmap_anon=yes
>>      AC_MSG_RESULT([$have_shm_mmap_anon])
>> @@ -219,16 +233,12 @@ index 5492fd920c..95158ccfd9 100644
>>   -  }
>>   -  return 0;
>>   -}
>> --]])],[dnl
>> +-]])],[have_shm_mmap_posix=yes],[have_shm_mmap_posix=no],[have_shm_mmap_posix=no])
>> +-  if test "$have_shm_mmap_posix" = "yes"; then
>>   -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>> --    AC_MSG_RESULT([yes])
>> --    have_shm_mmap_posix=yes
>>   -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
>> --  ],[
>> --    AC_MSG_RESULT([no])
>> --  ],[
>> --    AC_MSG_RESULT([no])
>> --  ])
>> +-  fi
>> +-  AC_MSG_RESULT([$have_shm_mmap_posix])
>>   +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
>>   +  AC_MSG_RESULT([yes])
>>   +  have_shm_mmap_posix=yes
>> @@ -237,5 +247,5 @@ index 5492fd920c..95158ccfd9 100644
>>      PHP_NEW_EXTENSION(opcache,
>>          ZendAccelerator.c \
>>   --
>> -2.25.1
>> +2.17.1
>>
>> diff --git a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>> index 892a0460c..52d5c6696 100644
>> --- a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>> +++ b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
>> @@ -1,11 +1,28 @@
>> ---- a/ext/opcache/jit/Makefile.frag    2021-10-19 06:34:32.000000000 -0400
>> -+++ b/ext/opcache/jit/Makefile.frag    2021-11-15 15:10:41.437289836 -0500
>> -@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynas
>> -       $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>> +From 0f7b9264c5130b3ca0a20d326fb13ca8fc0a9969 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Wed, 15 Dec 2021 14:43:45 +0800
>> +Subject: [PATCH] use qemuwrapper for minilua
>> +
>> +update to 8.1.0
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + ext/opcache/jit/Makefile.frag | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
>> +index 98c5cda..fb0e6f0 100644
>> +--- a/ext/opcache/jit/Makefile.frag
>> ++++ b/ext/opcache/jit/Makefile.frag
>> +@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
>> +       $(BUILD_CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
>>
>> - $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>> --      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
>> -+      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
>> + $(builddir)/jit/zend_jit_$(DASM_ARCH).c: $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
>> +-      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
>> ++      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
>>
>>    $(builddir)/jit/zend_jit.lo: \
>> -       $(builddir)/jit/zend_jit_x86.c \
>> +       $(builddir)/jit/zend_jit_$(DASM_ARCH).c \
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>> similarity index 98%
>> rename from meta-oe/recipes-devtools/php/php_8.0.12.bb
>> rename to meta-oe/recipes-devtools/php/php_8.1.0.bb
>> index 38771948f..29e124acf 100644
>> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
>> +++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
>> @@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
>>             "
>>
>>   S = "${WORKDIR}/php-${PV}"
>> -SRC_URI[sha256sum] = "b4886db1df322dc8fb128d8b34ae7e94f6fc682ecb29ff4f5a591d4de9feadbf"
>> +SRC_URI[sha256sum] = "0725ed2baea125496a898455d501a77460218b2a0cfad773fa9322f491b82b61"
>>
>>
>>   inherit autotools pkgconfig python3native gettext qemu
>> @@ -77,7 +77,7 @@ EXTRA_OECONF:class-native = " \
>>                   ${COMMON_EXTRA_OECONF} \
>>   "
>>
>> -PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
>> +PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>>                      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
>>   "
>>   PACKAGECONFIG:class-native = ""
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94363): https://lists.openembedded.org/g/openembedded-devel/message/94363
>> Mute This Topic: https://lists.openembedded.org/mt/87739886/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

