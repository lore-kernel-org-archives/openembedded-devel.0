Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B51FC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 18:15:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.109642.1680632093869546874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 11:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=VY1dkwCs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3458e00b55=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334FTdU1021364
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Apr 2023 11:14:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Oqq/BWb8l2AzGw1/CnheSKJ2avQ27h8bWCrq73PljX4=;
 b=VY1dkwCsE9F/q4nW4UCiWvdbmSQknc1WmnmdsTj7ai3xLgB0UEtvAMmViCNzG7t8ltAv
 +j6NX9RQIOQ+D5mO7rJJXavSDbMt21cPn2rtioa9phsdgkGbX0w7GpRS9lLWjZBCk9eq
 f+d5XpVQl9co0reWqyqyHHpJJZoSv9vtAS4Ja2W5VGp9dokGsfK8RmymXMEf5tpOdrw2
 ZDRAsDRaEUmfjUkguJa3GBGFmugjS4QOMUCFiVeuwWdjH/2ixIzqAtCZ23ihMN4kWAtm
 el12P0uWIGVM/CXBebzYozkMkT36owmVUdgP5SfoGkngDAojN5PVNT4kZmOzD44EGf7A rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppfw6ue43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 11:14:52 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 334IEqvf025244
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Apr 2023 11:14:52 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppfw6ue40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 11:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5mmOqB4Nsfl1C8dRrAp+vGGooV2a+KgBGlkuXJu/ZOrxaSZyNAvePOo6MvgyewPCqaSVR7z0rq2yZ1U77fWA7rfZ1UXBrj+SDIW/y4iY+iTSNXBgfvq/BjZb4OS9HaDgzcsOwV92zQ/eMa52vCSiaNwHpx3gyyYxjs/8nUsHCNKZLhT+nH/Wjeu515+I0nuC/Db2cNqGkon8Go83wl6e/guZCk+605vFRzbc+j+ZVrc5zGsbrVzJm+UDjnYdhWzREO5s+WEhMe5egW6kfKU/y/jGjiusNNKlmU8CBbprahaaSYFD1lcqFa1/W2q6Bqx0AO4OlGoS2ZXOzvWf9UWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oqq/BWb8l2AzGw1/CnheSKJ2avQ27h8bWCrq73PljX4=;
 b=JVDvyFFSbgp1vuYbAo0+TltuJ4UaQZFiTFiwttdjm6PpPI/U8ArRD8aQoILFAhvNgcV5tugdUTruo8ZwXm1C07rL1PB5CXtdhWUCUr4Sd/r0DjpYJVh7BOL3qOM6jNtV6JLgL5Ikc2IKDPBJJgEd/jeNfcNfS5ssGEwXxR1WWQkdNVRG7szE3PUmB1x/foMdc1ECc95xQplVcXn8utHex57QUGYthRzf1oNyy6PiQVDcSrVE/YkZwL+xwPukeoKWs+i6T/qiDlFFpWq4xcEtgl0+EmZxlo6iBXlzvfUDJ1a+3+EHH0dBkAVipS/ob+6xo45S+a+3dlQAMHkQxc1U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:14:47 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%4]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:14:47 +0000
Content-Type: multipart/alternative;
 boundary="------------ahS9nSiOpBKy0z1lIX7gbBsQ"
Message-ID: <ba850f5a-5094-0826-ee66-a5b989509376@windriver.com>
Date: Tue, 4 Apr 2023 14:14:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] syslog-ng: fix CVE-2022-38725
Content-Language: en-CA
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <20230403104249.167098-1-yogita.urade@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230403104249.167098-1-yogita.urade@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f26b1dd-cf28-4c42-5d1f-08db35387918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ye3yY8Kseo7tuwW1nzPslZmNcCMbE8SMZX8+z19Z7Z3btVxEFLRy2yW1X2ckkHSoNJLg/4NS/DBUik0HoZa9aNWhzD6N9exmNFfYvun6vTX+M4vg5S1cFyMqoXcpUMwUppC0NGw90Db4e8Me/1yKab1SlxEul8vlEnTVdVlX+FeFOiZd+xdKc8uy7iXyTf3LezbqFyHyJv9Vqpbk25DNFDV40Zd0C3BUsgcnuh8J+utWfaVw0ziJdPxMSx8DV4Mu22czYs0Bc2P/9wHtroJ8gk4y6fP1CbBLFmCZtbQKucIgCxUxRcywtAS2ZK7I5OIrfg4Qb1akjoN/+7OOsFZSqe9EF6Ke92PuoSZjc8KAjkb9ztJ9pRtsoiT71NnHgD0nswzvCW1va7ZnX94czsX7kUMBc5zCqg8wlC1RHTlcyz68DTXdORYB330m2S954U84NCNNN7EQmVASwwy7a0LNMKqj7LpHfQIBTplJz/pMSGl15XWr/xEsXuo5njxCYhxAzACLIoIlqsr/EyHfB9qiRqd+kyGtS3hiwSGZ+Bf+mAiDwHscq9OQU7xp2xL5b6dJYFolHJa+SlxB/esduwkBpybx4/uLoTYSW4ePn6AUwc+hQD73+LNPvmywfMKleHyIC2s0sJHtxt1LxE7rtYc0b8l+RXPQmjCHx8cD0JhSxBXDaJiN9c0/xx3nqGlTd5DK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(451199021)(6666004)(107886003)(6486002)(966005)(66574015)(36756003)(2616005)(83380400001)(166002)(31696002)(86362001)(38100700002)(53546011)(6512007)(26005)(33964004)(6506007)(186003)(316002)(2906002)(5660300002)(31686004)(8936002)(41300700001)(66946007)(6916009)(30864003)(4326008)(66476007)(66556008)(8676002)(66899021)(478600001)(2004002)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDJndmJHaEtjbUJSbWJkb2c5UjBNNi9VcUg3eSs0eTVJWmpVQzE1NHZwWUNS?=
 =?utf-8?B?MXBsZTVaaTA0RFpiSHorMDJ5YTZvN05JNzdQSXM2U0pmSDJ1MkVjekIwTFN2?=
 =?utf-8?B?TlkyNFhocnJNc013V3RtL0F1VTl1ZStXQXBRWUJHb0xiSWxpaUgwdU9ZVm1K?=
 =?utf-8?B?Z0FmQ0R1MEVIdlBhdEI4M1B4SFhlOW9jWmtYekJWejM4UktFVTlISWFVMzU4?=
 =?utf-8?B?cXdLcnFENy9VcjlVK25IVEM0MWZoaU40UWtSSXJyamk0T2oxNkRGb2s0SlRT?=
 =?utf-8?B?MG1ZZjR1YmFyeWdFOGE5VmxOdkpqaGpsQ21qdmR5bVpqbGlRdS9aQ0pBRVh3?=
 =?utf-8?B?Wld6Sk0xMHVjekFsNHNTUGZFaDh6U0NOS3grcVI0akhIOGp1b3hUZHlQdm9R?=
 =?utf-8?B?a3lwbTc1UVZReHFhVFpQd2haZVdYY0dxRS8yTDVoa29FQzFlTmwzUCtWRlRQ?=
 =?utf-8?B?M3FQZVJHTTlsS1ZielJiOVRDY2tZMTNpVzdHeWd4M1BBVytLZHFvV21rYWhy?=
 =?utf-8?B?U3VZMHFJaWNUOU1qVGduWmVucExVWXd4OExDQ1lHbC9UOGZpa0tYdkQ2ckF1?=
 =?utf-8?B?UHJ5cTl5c3lKKzJUT0lDUWp4UXBwVWxJeksycUpFV3REcXZkTmJBVGRqMkQy?=
 =?utf-8?B?NXk2VG9FNGtXczk0a0lNZFJYb1lNYjBGdDlmQ2FvUVBWc3N6aWJtekdOSFdt?=
 =?utf-8?B?REtxYXlEcG01YTVQZGh5cDZoZDNzSUQyYnErSlBxQy81aDR6L3lDMGNocnBI?=
 =?utf-8?B?SG4vYjVNcE4yekZ2S0lpUzFMRHc3aDJjVFg3MDc3d1BUaW1LREJ3MFBOcXlw?=
 =?utf-8?B?UFJZbzIxWUt0WUVRMWx3TzNDSGduR0NYdmZ1MGkrTVRWUktxaTZFU3FwdmdX?=
 =?utf-8?B?L1hQZlBORmRoNEp3K3lhVmFMZDM1NWNwaVYzRFZHYkpMb2g4aitCTHNNKy96?=
 =?utf-8?B?MSt2Q25EZ2l5R3JpYjBUMmFBdkwraEdnZTVjL25FdnJFMktRNTlUdHhndXdS?=
 =?utf-8?B?NUQvZjhDT1pJeW1obWxQY2hwRXdsczBHcUxLY280WEpPVnl3eXhDRHArdXZK?=
 =?utf-8?B?VjhuQ09vdmtjU2MwNlQyV0w0VlRHMHlqM2E1UnhtdEVaMk4ydHU4QkptTzVj?=
 =?utf-8?B?WUNUeGsxcEtJMWZNMjlpMFNQOTM3YTVHMzJLTkNWbjJ1SC9OQ1Z2a2loUE1k?=
 =?utf-8?B?VG15S0xiLzllaVd1N3VaMDZYS2JOVU03OUdtRzZWZllsMVhXRXd0VzIxOVQy?=
 =?utf-8?B?QXFLdjlyZlhZN1NMWWxZdlBUeUh2QThqTFZKOXR0YSthMUsrbVZ3eG5pMVJN?=
 =?utf-8?B?M1lNR1VmdEFLdUNHekxHM2Nacm5XcTQ1TzR4Q3VZSE5UVjlsRlFOUFcrU3Bh?=
 =?utf-8?B?eXZobUlmSXAwQ1A2eHdTbm1FekdxcHFkUXo0bTVFSGpGZjcxZ0FXcFlpVmRU?=
 =?utf-8?B?eE9BQnoxMU1OTDgyVDVLQktubVJHd0Qya2MrWGJmYjk4dElaa2ZONlpKczRV?=
 =?utf-8?B?MzNQN0tyZmw1VjhYQ0U3eGh1R3I3bmlnWUFEUjVDa2NnUy92M0NCdHE4Y0VC?=
 =?utf-8?B?L1RXQTh2VHVTQVZLeGY1USs1OEEwcjNOMUVVenZ6OVNsUzE2OXlKcXovQUFy?=
 =?utf-8?B?eVlqZlVhVHpqV1B0TU1sZUlkNDU2dUlHTytPT1d5MEdab0xTMWJiYkU1anZo?=
 =?utf-8?B?bkwxMFRQUmVzempXbm85ZFdMMXVyQ3B5UVo1c2g3b1hWSG1kNHBOaUtOZlZo?=
 =?utf-8?B?RG91RlZmSzRNTWtyZ0lVS1NIS0haazF5VzJRNjN2aFpmR0tmalRiUEd5VEtL?=
 =?utf-8?B?dG44NHh1eWxxcWpFZ2NGZmYxb1R0TlZvTzdiQnRxcVN1M3AyQVBmWVZNTytq?=
 =?utf-8?B?a0R1Z2tLcGN4NFJSZ3lqcTBiVHV2UER2QjRQQmVGV1NGdXh4WXY2MFNrZkh0?=
 =?utf-8?B?dmIvN2hzKzB1ek4vQUNGRXdaRXBPQ2tkQ1NIRlR3QVlpc3FQOFROTTdXcVJJ?=
 =?utf-8?B?QjVWUzludng0eWw4ZE1SRTlXVXlNQXV0RXYwVmtrNTJyQTFRVFc1L3FReUwz?=
 =?utf-8?B?UW4vNjJXWndOYWhlaXhuTmkxR01ZamdodVBkY3cxaVIzaU5ZZzJ1YUk3QUtQ?=
 =?utf-8?B?S1BadDU1WUViZkJWclRQV0Rad2loNWw3K0pOWHA1NnJZZUlOd0lrcXJKaldO?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f26b1dd-cf28-4c42-5d1f-08db35387918
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:14:47.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK480Gp9qL6lG2FV5IHEVCrl3ZC9fJ8fSvC4+iihswCxrnu+D9YDOPDNvt8RamIYYNXuJaFpWBSOSCcamJXAaoo+Ap4k2syi4raAeFX1M1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
X-Proofpoint-ORIG-GUID: o6tT_YQPujmZuw0WG_se3oMmwzqcOtgr
X-Proofpoint-GUID: ECisfRE3PvMwlc3zXm0Phku2zyYVbiUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_10,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040165
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 18:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101947

--------------ahS9nSiOpBKy0z1lIX7gbBsQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 334FTdU1021364

Armin, Yogita

Is it just me or is this patch not well-formed?

I save it from Thunderbird and:

meta-oe.git on kirkstone [$]
=E2=9D=AF git am /tmp/syslog-ng-april-4-a.eml
error: cannot convert from y to UTF-8
fatal: could not parse patch
=E2=9D=AF git am --abort

I also tried copying the text of the patch but that failed with:
meta-oe.git on kirkstone [$]
=E2=9D=AF git am /tmp/jj-syslog
Patch format detection failed.
=E2=9D=AF git am --abort

Am I missing some magic maintainer workflow?

../Randy


On 2023-04-03 06:42, Urade, Yogita via lists.openembedded.org wrote:
> Fix buffer handling of syslog and timestamp parsers.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-38725
> https://github.com/syslog-ng/syslog-ng/releases
> https://github.com/syslog-ng/syslog-ng/pull/4110
>
> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> ---
>   .../syslog-ng/files/CVE-2022-38725-0001.patch |  65 ++++++
>   .../syslog-ng/files/CVE-2022-38725-0002.patch | 150 +++++++++++++
>   .../syslog-ng/files/CVE-2022-38725-0003.patch |  77 +++++++
>   .../syslog-ng/files/CVE-2022-38725-0004.patch |  37 +++
>   .../syslog-ng/files/CVE-2022-38725-0005.patch | 211 +++++++++++++++++=
+
>   .../syslog-ng/files/CVE-2022-38725-0006.patch | 180 +++++++++++++++
>   .../syslog-ng/files/CVE-2022-38725-0007.patch |  81 +++++++
>   .../syslog-ng/files/CVE-2022-38725-0008.patch |  45 ++++
>   .../syslog-ng/syslog-ng_3.36.1.bb             |   8 +
>   9 files changed, 854 insertions(+)
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0001.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0002.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0003.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0004.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0005.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0006.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0007.patch
>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0008.patch
>
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
1.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pat=
ch
> new file mode 100644
> index 000000000..7d1dd6582
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
> @@ -0,0 +1,65 @@
> +From b5a060f2ebb8d794f508436a12e4d4163f94b1b8 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:26:05 +0200
> +Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data b=
uffer
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436=
a12e4d4163f94b1b8]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + modules/syslogformat/syslog-format.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogform=
at/syslog-format.c
> +index aacb525b3..872cc1d71 100644
> +--- a/modules/syslogformat/syslog-format.c
> ++++ b/modules/syslogformat/syslog-format.c
> +@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessag=
e *self, const guchar **data,
> +   const guchar *src =3D *data;
> +   gint left =3D *length;
> +
> ++  if (!left)
> ++    return;
> ++
> +   /* Cisco timestamp extensions, the first '*' indicates that the clo=
ck is
> +    * unsynced, '.' if it is known to be synced */
> +   if (G_UNLIKELY(src[0] =3D=3D '*'))
> +@@ -562,7 +565,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **=
data, gint *length, const MsgF
> +       open_sd++;
> +       do
> +         {
> +-          if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' =
|| *src =3D=3D ']' || *src =3D=3D '"')
> ++          if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=
=3D ' ' || *src =3D=3D ']' || *src =3D=3D '"')
> +             goto error;
> +           /* read sd_id */
> +           pos =3D 0;
> +@@ -595,7 +598,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **=
data, gint *length, const MsgF
> +           sd_id_len =3D pos;
> +           strcpy(sd_value_name, logmsg_sd_prefix);
> +           strncpy(sd_value_name + logmsg_sd_prefix_len, sd_id_name, s=
izeof(sd_value_name) - logmsg_sd_prefix_len);
> +-          if (*src =3D=3D ']')
> ++
> ++          if (left && *src =3D=3D ']')
> +             {
> +               log_msg_set_value_by_name(self, sd_value_name, "", 0);
> +             }
> +@@ -612,7 +616,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **=
data, gint *length, const MsgF
> +               else
> +                 goto error;
> +
> +-              if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D =
' ' || *src =3D=3D ']' || *src =3D=3D '"')
> ++              if (!left || !isascii(*src) || *src =3D=3D '=3D' || *sr=
c =3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '"')
> +                 goto error;
> +
> +               /* read sd-param */
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
2.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pat=
ch
> new file mode 100644
> index 000000000..9ccb24dde
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
> @@ -0,0 +1,150 @@
> +From 81a07263f1e522a376d3a30f96f51df3f2879f8a Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:22:44 +0200
> +Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zer=
o terminated
> + input
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30=
f96f51df3f2879f8a]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + modules/syslogformat/CMakeLists.txt           |  1 +
> + modules/syslogformat/Makefile.am              |  2 +
> + modules/syslogformat/tests/CMakeLists.txt     |  1 +
> + modules/syslogformat/tests/Makefile.am        |  9 +++
> + .../syslogformat/tests/test_syslog_format.c   | 72 ++++++++++++++++++=
+
> + 5 files changed, 85 insertions(+)
> + create mode 100644 modules/syslogformat/tests/CMakeLists.txt
> + create mode 100644 modules/syslogformat/tests/Makefile.am
> + create mode 100644 modules/syslogformat/tests/test_syslog_format.c
> +
> +diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogforma=
t/CMakeLists.txt
> +index 94ee01aa2..64848efee 100644
> +--- a/modules/syslogformat/CMakeLists.txt
> ++++ b/modules/syslogformat/CMakeLists.txt
> +@@ -14,3 +14,4 @@ add_module(
> +   SOURCES ${SYSLOGFORMAT_SOURCES}
> + )
> +
> ++add_test_subdirectory(tests)
> +diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/M=
akefile.am
> +index f13f88c1b..14cdf589d 100644
> +--- a/modules/syslogformat/Makefile.am
> ++++ b/modules/syslogformat/Makefile.am
> +@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES=
 =3D	\
> + modules/syslogformat modules/syslogformat/ mod-syslogformat: \
> + 	modules/syslogformat/libsyslogformat.la
> + .PHONY: modules/syslogformat/ mod-syslogformat
> ++
> ++include modules/syslogformat/tests/Makefile.am
> +diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslo=
gformat/tests/CMakeLists.txt
> +new file mode 100644
> +index 000000000..2e45b7194
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/CMakeLists.txt
> +@@ -0,0 +1 @@
> ++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogforma=
t)
> +diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogfo=
rmat/tests/Makefile.am
> +new file mode 100644
> +index 000000000..7ee66a59c
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/Makefile.am
> +@@ -0,0 +1,9 @@
> ++modules_syslogformat_tests_TESTS =3D \
> ++    modules/syslogformat/tests/test_syslog_format
> ++
> ++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}
> ++
> ++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt
> ++
> ++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAG=
S) -I$(top_srcdir)/modules/syslogformat
> ++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD)=
 $(PREOPEN_SYSLOGFORMAT)
> +diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules=
/syslogformat/tests/test_syslog_format.c
> +new file mode 100644
> +index 000000000..b247fe3c5
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/test_syslog_format.c
> +@@ -0,0 +1,72 @@
> ++/*
> ++ * Copyright (c) 2022 One Identity
> ++ * Copyright (c) 2022 L=C3=A1szl=C3=B3 V=C3=A1rady
> ++ *
> ++ * This program is free software; you can redistribute it and/or modi=
fy it
> ++ * under the terms of the GNU General Public License version 2 as pub=
lished
> ++ * by the Free Software Foundation, or (at your option) any later ver=
sion.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ * GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1=
301  USA
> ++ *
> ++ * As an additional exemption you are allowed to compile & link again=
st the
> ++ * OpenSSL libraries as published by the OpenSSL project. See the fil=
e
> ++ * COPYING for details.
> ++ *
> ++ */
> ++
> ++#include <criterion/criterion.h>
> ++
> ++#include "apphook.h"
> ++#include "cfg.h"
> ++#include "syslog-format.h"
> ++#include "logmsg/logmsg.h"
> ++#include "msg-format.h"
> ++#include "scratch-buffers.h"
> ++
> ++#include <string.h>
> ++
> ++GlobalConfig *cfg;
> ++MsgFormatOptions parse_options;
> ++
> ++static void
> ++setup(void)
> ++{
> ++  app_startup();
> ++  syslog_format_init();
> ++
> ++  cfg =3D cfg_new_snippet();
> ++  msg_format_options_defaults(&parse_options);
> ++}
> ++
> ++static void
> ++teardown(void)
> ++{
> ++  scratch_buffers_explicit_gc();
> ++  app_shutdown();
> ++  cfg_free(cfg);
> ++}
> ++
> ++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);
> ++
> ++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_inp=
ut, .timeout =3D 10)
> ++{
> ++  const gchar *data =3D "<182>2022-08-17T05:02:28.217 mymachine su: '=
su root' failed for lonvick on /dev/pts/8";
> ++  /* chosen carefully to reproduce a bug */
> ++  gsize data_length =3D 27;
> ++
> ++  msg_format_options_init(&parse_options, cfg);
> ++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (c=
onst guchar *) data, data_length);
> ++
> ++  gsize problem_position;
> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar =
*) data, data_length, &problem_position));
> ++
> ++  msg_format_options_destroy(&parse_options);
> ++  log_msg_unref(msg);
> ++}
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
3.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pat=
ch
> new file mode 100644
> index 000000000..580116504
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
> @@ -0,0 +1,77 @@
> +From 4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sun, 21 Aug 2022 18:44:28 +0200
> +Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out o=
f bounds
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a3=
05eb7eeefab8dc89d]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + modules/syslogformat/syslog-format.c          |  2 +-
> + .../syslogformat/tests/test_syslog_format.c   | 32 ++++++++++++++++++=
+
> + 2 files changed, 33 insertions(+), 1 deletion(-)
> +
> +diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogform=
at/syslog-format.c
> +index 872cc1d71..a3d48d6f2 100644
> +--- a/modules/syslogformat/syslog-format.c
> ++++ b/modules/syslogformat/syslog-format.c
> +@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, =
const guchar **data, gint *len
> +
> +   /* if the next char is not space, then we may try to read a date */
> +
> +-  if (*src !=3D ' ')
> ++  if (!left || *src !=3D ' ')
> +     return;
> +
> +   log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data, *leng=
th - left - 1);
> +diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules=
/syslogformat/tests/test_syslog_format.c
> +index b247fe3c5..d0f5b4043 100644
> +--- a/modules/syslogformat/tests/test_syslog_format.c
> ++++ b/modules/syslogformat/tests/test_syslog_format.c
> +@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_z=
ero_terminated_input, .timeou
> +   msg_format_options_destroy(&parse_options);
> +   log_msg_unref(msg);
> + }
> ++
> ++Test(syslog_format, cisco_sequence_id_non_zero_termination)
> ++{
> ++  const gchar *data =3D "<189>65536: ";
> ++  gsize data_length =3D strlen(data);
> ++
> ++  msg_format_options_init(&parse_options, cfg);
> ++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (c=
onst guchar *) data, data_length);
> ++
> ++  gsize problem_position;
> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar =
*) data, data_length, &problem_position));
> ++  cr_assert_str_eq(log_msg_get_value_by_name(msg, ".SDATA.meta.sequen=
ceId", NULL), "65536");
> ++
> ++  msg_format_options_destroy(&parse_options);
> ++  log_msg_unref(msg);
> ++}
> ++
> ++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_pa=
rsed_as_program_name)
> ++{
> ++  const gchar *data =3D "<189>65536";
> ++  gsize data_length =3D strlen(data);
> ++
> ++  msg_format_options_init(&parse_options, cfg);
> ++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (c=
onst guchar *) data, data_length);
> ++
> ++  gsize problem_position;
> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar =
*) data, data_length, &problem_position));
> ++  cr_assert_str_eq(log_msg_get_value_by_name(msg, "PROGRAM", NULL), "=
65536");
> ++
> ++  msg_format_options_destroy(&parse_options);
> ++  log_msg_unref(msg);
> ++}
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
4.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pat=
ch
> new file mode 100644
> index 000000000..cb81b1c12
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
> @@ -0,0 +1,37 @@
> +From 73b5c300b8fde5e7a4824baa83a04931279abb37 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:42:38 +0200
> +Subject: [PATCH 4/8] timeutils: fix iterating out of the range of time=
stamp buffer
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824ba=
a83a04931279abb37]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +Signed-off-by: Balazs Scheidler<bazsi77@gmail.com>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-times=
tamp.c
> +index 304a57673..4fbe94a36 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -332,7 +332,7 @@ __parse_usec(const guchar **data, gint *length)
> +           src++;
> +           (*length)--;
> +         }
> +-      while (isdigit(*src))
> ++      while (*length > 0 && isdigit(*src))
> +         {
> +           src++;
> +           (*length)--;
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
5.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pat=
ch
> new file mode 100644
> index 000000000..70964b328
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
> @@ -0,0 +1,211 @@
> +From 45f051239312e43bd4f92b9339fe67c6798a0321 Mon Sep 17 00:00:00 2001
> +From: Balazs Scheidler<bazsi77@gmail.com>
> +Date: Sat, 20 Aug 2022 12:43:42 +0200
> +Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inpu=
ts
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9=
339fe67c6798a0321]
> +
> +Signed-off-by: Balazs Scheidler<bazsi77@gmail.com>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++--=
-
> + 1 file changed, 113 insertions(+), 13 deletions(-)
> +
> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils=
/tests/test_scan-timestamp.c
> +index 27b76f12d..468bbf779 100644
> +--- a/lib/timeutils/tests/test_scan-timestamp.c
> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
> +@@ -50,17 +50,21 @@ fake_time_add(time_t diff)
> + }
> +
> + static gboolean
> +-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
> ++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
> + {
> +   UnixTime stamp;
> +-  const guchar *data =3D (const guchar *) ts;
> +-  gint length =3D strlen(ts);
> ++  const guchar *tsu =3D (const guchar *) ts;
> ++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
> +   GString *result =3D g_string_new("");
> +   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
> +
> +-
> ++  const guchar *data =3D tsu;
> ++  gint length =3D tsu_len;
> +   gboolean success =3D scan_rfc3164_timestamp(&data, &length, &wct);
> +
> ++  cr_assert(length >=3D 0);
> ++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
> ++
> +   unix_time_unset(&stamp);
> +   convert_wall_clock_time_to_unix_time(&wct, &stamp);
> +
> +@@ -71,16 +75,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp=
[32])
> + }
> +
> + static gboolean
> +-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
> ++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
> + {
> +   UnixTime stamp;
> +-  const guchar *data =3D (const guchar *) ts;
> +-  gint length =3D strlen(ts);
> ++  const guchar *tsu =3D (const guchar *) ts;
> ++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
> +   GString *result =3D g_string_new("");
> +   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
> +
> ++  const guchar *data =3D tsu;
> ++  gint length =3D tsu_len;
> +   gboolean success =3D scan_rfc5424_timestamp(&data, &length, &wct);
> +
> ++  cr_assert(length >=3D 0);
> ++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
> ++
> +   unix_time_unset(&stamp);
> +   convert_wall_clock_time_to_unix_time(&wct, &stamp);
> +
> +@@ -91,31 +100,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestam=
p[32])
> + }
> +
> + static gboolean
> +-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar c=
onverted[32])
> ++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expecte=
d, gchar converted[32])
> + {
> +-  cr_assert(_parse_rfc3164(ts, converted));
> ++  cr_assert(_parse_rfc3164(ts, len, converted));
> +   return strcmp(converted, expected) =3D=3D 0;
> + }
> +
> + static gboolean
> +-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar c=
onverted[32])
> ++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expecte=
d, gchar converted[32])
> + {
> +-  cr_assert(_parse_rfc5424(ts, converted));
> ++  cr_assert(_parse_rfc5424(ts, len, converted));
> +   return strcmp(converted, expected) =3D=3D 0;
> + }
> +
> + #define _expect_rfc3164_timestamp_eq(ts, expected) \
> +   ({ \
> +     gchar converted[32]; \
> +-    cr_expect(_rfc3164_timestamp_eq(ts, expected, converted), "Parsed=
 RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expe=
cted=3D%s", ts, converted, expected); \
> ++    cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, converted), "Pa=
rsed RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, =
expected=3D%s", ts, converted, expected); \
> ++  })
> ++
> ++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
> ++  ({ \
> ++    gchar converted[32]; \
> ++    cr_expect(_rfc3164_timestamp_eq(ts, len, expected, converted), "P=
arsed RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s,=
 expected=3D%s", ts, converted, expected); \
> ++  })
> ++
> ++#define _expect_rfc3164_fails(ts, len) \
> ++  ({  \
> ++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
> ++    const guchar *data =3D (guchar *) ts; \
> ++    gint length =3D len < 0 ? strlen(ts) : len; \
> ++    cr_assert_not(scan_rfc3164_timestamp(&data, &length, &wct)); \
> +   })
> +
> + #define _expect_rfc5424_timestamp_eq(ts, expected) \
> +   ({ \
> +     gchar converted[32]; \
> +-    cr_expect(_rfc5424_timestamp_eq(ts, expected, converted), "Parsed=
 RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expe=
cted=3D%s", ts, converted, expected); \
> ++    cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, converted), "Pa=
rsed RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, =
expected=3D%s", ts, converted, expected); \
> ++  })
> ++
> ++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
> ++  ({ \
> ++    gchar converted[32]; \
> ++    cr_expect(_rfc5424_timestamp_eq(ts, len, expected, converted), "P=
arsed RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s,=
 expected=3D%s", ts, converted, expected); \
> ++  })
> ++
> ++#define _expect_rfc5424_fails(ts, len) \
> ++  ({  \
> ++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
> ++    const guchar *data =3D (guchar *) ts; \
> ++    gint length =3D len < 0 ? strlen(ts) : len; \
> ++    cr_assert_not(scan_rfc5424_timestamp(&data, &length, &wct)); \
> +   })
> +
> ++
> + Test(parse_timestamp, standard_bsd_format)
> + {
> +   _expect_rfc3164_timestamp_eq("Oct  1 17:46:12", "2017-10-01T17:46:1=
2.000+02:00");
> +@@ -164,6 +202,68 @@ Test(parse_timestamp, standard_bsd_format_year_in=
_the_past)
> +   _expect_rfc3164_timestamp_eq("Dec 31 17:46:12", "2017-12-31T17:46:1=
2.000+01:00");
> + }
> +
> ++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handle=
d_properly)
> ++{
> ++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
> ++  gint ts_len =3D 24;
> ++
> ++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:=
28.417+00:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:=
28.417+00:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.4=
17+00:00");
> ++
> ++  /* no "Z" parsed, timezone defaults to local, forced CET */
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:=
28.417+02:00");
> ++
> ++  /* msec is partially parsed as we trim the string from the right */
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:=
28.410+02:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:=
28.400+02:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:=
28.000+02:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:=
28.000+02:00");
> ++
> ++  for (gint i =3D 6; i < ts_len; i++)
> ++    _expect_rfc3164_fails(ts, ts_len - i);
> ++
> ++}
> ++
> ++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_inpu=
t_is_handled_properly)
> ++{
> ++  gchar *ts =3D "Aug 17 2022 05:02:28: whatever";
> ++  gint ts_len =3D 21;
> ++
> ++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:=
28.000+02:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:=
28.000+02:00");
> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.0=
00+02:00");
> ++
> ++  /* no ":" at the end, that's a problem, unrecognized */
> ++  _expect_rfc3164_fails(ts, ts_len - 1);
> ++
> ++  for (gint i =3D 1; i < ts_len; i++)
> ++    _expect_rfc3164_fails(ts, ts_len - i);
> ++}
> ++
> ++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_pr=
operly)
> ++{
> ++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
> ++  gint ts_len =3D 24;
> ++
> ++  _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:=
28.417+00:00");
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:=
28.417+00:00");
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.4=
17+00:00");
> ++
> ++  /* no "Z" parsed, timezone defaults to local, forced CET */
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:=
28.417+02:00");
> ++
> ++  /* msec is partially parsed as we trim the string from the right */
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:=
28.410+02:00");
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:=
28.400+02:00");
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:=
28.000+02:00");
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:=
28.000+02:00");
> ++
> ++  for (gint i =3D 6; i < ts_len; i++)
> ++    _expect_rfc5424_fails(ts, ts_len - i);
> ++
> ++}
> ++
> +
> + Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explici=
t_timezones)
> + {
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
6.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pat=
ch
> new file mode 100644
> index 000000000..81e36c650
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
> @@ -0,0 +1,180 @@
> +From 09f489c89c826293ff8cbd282cfc866ab56054c4 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:29:43 +0200
> +Subject: [PATCH 6/8] timeutils: name repeating constant
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd2=
82cfc866ab56054c4]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++---------------=
-
> + 1 file changed, 29 insertions(+), 25 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-times=
tamp.c
> +index 4fbe94a36..d22d50973 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gin=
t *wday)
> + {
> +   *wday =3D -1;
> +
> +-  if (*left < 3)
> ++  const gsize abbrev_length =3D 3;
> ++
> ++  if (*left < abbrev_length)
> +     return FALSE;
> +
> +   switch (**buf)
> +     {
> +     case 'S':
> +-      if (strncasecmp(*buf, "Sun", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Sun", abbrev_length) =3D=3D 0)
> +         *wday =3D 0;
> +-      else if (strncasecmp(*buf, "Sat", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "Sat", abbrev_length) =3D=3D 0)
> +         *wday =3D 6;
> +       else
> +         return FALSE;
> +       break;
> +     case 'M':
> +-      if (strncasecmp(*buf, "Mon", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Mon", abbrev_length) =3D=3D 0)
> +         *wday =3D 1;
> +       else
> +         return FALSE;
> +       break;
> +     case 'T':
> +-      if (strncasecmp(*buf, "Tue", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Tue", abbrev_length) =3D=3D 0)
> +         *wday =3D 2;
> +-      else if (strncasecmp(*buf, "Thu", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "Thu", abbrev_length) =3D=3D 0)
> +         *wday =3D 4;
> +       else
> +         return FALSE;
> +       break;
> +     case 'W':
> +-      if (strncasecmp(*buf, "Wed", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Wed", abbrev_length) =3D=3D 0)
> +         *wday =3D 3;
> +       else
> +         return FALSE;
> +       break;
> +     case 'F':
> +-      if (strncasecmp(*buf, "Fri", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Fri", abbrev_length) =3D=3D 0)
> +         *wday =3D 5;
> +       else
> +         return FALSE;
> +@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint =
*wday)
> +       return FALSE;
> +     }
> +
> +-  (*buf) +=3D 3;
> +-  (*left) -=3D 3;
> ++  (*buf) +=3D abbrev_length;
> ++  (*left) -=3D abbrev_length;
> +   return TRUE;
> + }
> +
> +@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, g=
int *mon)
> + {
> +   *mon =3D -1;
> +
> +-  if (*left < 3)
> ++  const gsize abbrev_length =3D 3;
> ++
> ++  if (*left < abbrev_length)
> +     return FALSE;
> +
> +   switch (**buf)
> +     {
> +     case 'J':
> +-      if (strncasecmp(*buf, "Jan", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Jan", abbrev_length) =3D=3D 0)
> +         *mon =3D 0;
> +-      else if (strncasecmp(*buf, "Jun", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "Jun", abbrev_length) =3D=3D 0)
> +         *mon =3D 5;
> +-      else if (strncasecmp(*buf, "Jul", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "Jul", abbrev_length) =3D=3D 0)
> +         *mon =3D 6;
> +       else
> +         return FALSE;
> +       break;
> +     case 'F':
> +-      if (strncasecmp(*buf, "Feb", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Feb", abbrev_length) =3D=3D 0)
> +         *mon =3D 1;
> +       else
> +         return FALSE;
> +       break;
> +     case 'M':
> +-      if (strncasecmp(*buf, "Mar", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Mar", abbrev_length) =3D=3D 0)
> +         *mon =3D 2;
> +-      else if (strncasecmp(*buf, "May", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "May", abbrev_length) =3D=3D 0)
> +         *mon =3D 4;
> +       else
> +         return FALSE;
> +       break;
> +     case 'A':
> +-      if (strncasecmp(*buf, "Apr", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Apr", abbrev_length) =3D=3D 0)
> +         *mon =3D 3;
> +-      else if (strncasecmp(*buf, "Aug", 3) =3D=3D 0)
> ++      else if (strncasecmp(*buf, "Aug", abbrev_length) =3D=3D 0)
> +         *mon =3D 7;
> +       else
> +         return FALSE;
> +       break;
> +     case 'S':
> +-      if (strncasecmp(*buf, "Sep", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Sep", abbrev_length) =3D=3D 0)
> +         *mon =3D 8;
> +       else
> +         return FALSE;
> +       break;
> +     case 'O':
> +-      if (strncasecmp(*buf, "Oct", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Oct", abbrev_length) =3D=3D 0)
> +         *mon =3D 9;
> +       else
> +         return FALSE;
> +       break;
> +     case 'N':
> +-      if (strncasecmp(*buf, "Nov", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Nov", abbrev_length) =3D=3D 0)
> +         *mon =3D 10;
> +       else
> +         return FALSE;
> +       break;
> +     case 'D':
> +-      if (strncasecmp(*buf, "Dec", 3) =3D=3D 0)
> ++      if (strncasecmp(*buf, "Dec", abbrev_length) =3D=3D 0)
> +         *mon =3D 11;
> +       else
> +         return FALSE;
> +@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, g=
int *mon)
> +       return FALSE;
> +     }
> +
> +-  (*buf) +=3D 3;
> +-  (*left) -=3D 3;
> ++  (*buf) +=3D abbrev_length;
> ++  (*left) -=3D abbrev_length;
> +   return TRUE;
> + }
> +
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
7.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pat=
ch
> new file mode 100644
> index 000000000..abb36fdf5
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
> @@ -0,0 +1,81 @@
> +From 8c6e2c1c41b0fcc5fbd464c35f4dac7102235396 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:30:22 +0200
> +Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timesta=
mp length
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c=
35f4dac7102235396]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c            | 8 ++++++--
> + lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
> + 2 files changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-times=
tamp.c
> +index d22d50973..125264677 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -350,19 +350,21 @@ __parse_usec(const guchar **data, gint *length)
> + static gboolean
> + __has_iso_timezone(const guchar *src, gint length)
> + {
> +-  return (length >=3D 5) &&
> ++  return (length >=3D 6) &&
> +          (*src =3D=3D '+' || *src =3D=3D '-') &&
> +          isdigit(*(src+1)) &&
> +          isdigit(*(src+2)) &&
> +          *(src+3) =3D=3D ':' &&
> +          isdigit(*(src+4)) &&
> +          isdigit(*(src+5)) &&
> +-         !isdigit(*(src+6));
> ++         (length < 7 || !isdigit(*(src+6)));
> + }
> +
> + static guint32
> + __parse_iso_timezone(const guchar **data, gint *length)
> + {
> ++  g_assert(*length >=3D 6);
> ++
> +   gint hours, mins;
> +   const guchar *src =3D *data;
> +   guint32 tz =3D 0;
> +@@ -372,8 +374,10 @@ __parse_iso_timezone(const guchar **data, gint *l=
ength)
> +   hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';
> +   mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';
> +   tz =3D sign * (hours * 3600 + mins * 60);
> ++
> +   src +=3D 6;
> +   (*length) -=3D 6;
> ++
> +   *data =3D src;
> +   return tz;
> + }
> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils=
/tests/test_scan-timestamp.c
> +index 468bbf779..d18bdc65d 100644
> +--- a/lib/timeutils/tests/test_scan-timestamp.c
> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
> +@@ -264,6 +264,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424=
_input_is_handled_properly)
> +
> + }
> +
> ++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
> ++{
> ++  const gchar *ts =3D "2022-08-17T05:02:28.417+03:00";
> ++  gint ts_len =3D strlen(ts);
> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
> ++}
> ++
> +
> + Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explici=
t_timezones)
> + {
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-000=
8.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pat=
ch
> new file mode 100644
> index 000000000..56c71e8a2
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
> @@ -0,0 +1,45 @@
> +From 56f881c5eaa3d8c02c96607c4b9e4eaf959a044d Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady<laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:30:51 +0200
> +Subject: [PATCH 8/8/] timeutils: fix out-of-bounds reading of data buf=
fer
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2022-38725
> +
> +Upstream-Status: Backport
> +[https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607=
c4b9e4eaf959a044d]
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady<laszlo.varady@protonmail.c=
om>
> +
> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-times=
tamp.c
> +index 125264677..c00d8e6a9 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -431,7 +431,7 @@ __parse_bsd_timestamp(const guchar **data, gint *l=
ength, WallClockTime *wct)
> +       if (!scan_pix_timestamp((const gchar **) &src, &left, wct))
> +         return FALSE;
> +
> +-      if (*src =3D=3D ':')
> ++      if (left && *src =3D=3D ':')
> +         {
> +           src++;
> +           left--;
> +@@ -482,7 +482,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *=
length, WallClockTime *wct)
> +    * looking at you, skip that as well, so we can reliably detect IPv=
6
> +    * addresses as hostnames, which would be using ":" as well. */
> +
> +-  if (*src =3D=3D ':')
> ++  if (left && *src =3D=3D ':')
> +     {
> +       ++src;
> +       --left;
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/me=
ta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> index 40bbfe495..045b9b71c 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> @@ -22,6 +22,14 @@ SRC_URI =3D"https://github.com/balabit/syslog-ng/rel=
eases/download/${BP}/${BP}.ta=20
> file://volatiles.03_syslog-ng \ file://syslog-ng-tmp.conf \=20
> file://syslog-ng.service-the-syslog-ng-service.patch \ +=20
> file://CVE-2022-38725-0001.patch \ + file://CVE-2022-38725-0002.patch=20
> \ + file://CVE-2022-38725-0003.patch \ +=20
> file://CVE-2022-38725-0004.patch \ + file://CVE-2022-38725-0005.patch=20
> \ + file://CVE-2022-38725-0006.patch \ +=20
> file://CVE-2022-38725-0007.patch \ + file://CVE-2022-38725-0008.patch \=
 "
>  =20
>   SRC_URI[sha256sum] =3D "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5=
ad4f11ff5eea049e60b"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101935):https://lists.openembedded.org/g/openembedd=
ed-devel/message/101935
> Mute This Topic:https://lists.openembedded.org/mt/98032111/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------ahS9nSiOpBKy0z1lIX7gbBsQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 334FTdU1021364

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Armin, Yogita<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Is it just me or is this patch not
      well-formed?</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I save it from Thunderbird and:<br>
      <br>
      meta-oe.git on kirkstone [$] <br>
      =E2=9D=AF git am /tmp/syslog-ng-april-4-a.eml <br>
      error: cannot convert from y to UTF-8<br>
      fatal: could not parse patch</div>
    <div class=3D"moz-cite-prefix">=E2=9D=AF git am --abort<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I also tried copying the text of the
      patch but that failed with:<br>
    </div>
    <div class=3D"moz-cite-prefix">meta-oe.git on kirkstone [$] <br>
      =E2=9D=AF git am /tmp/jj-syslog <br>
      Patch format detection failed.<br>
      =E2=9D=AF git am --abort</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Am I missing some magic maintainer
      workflow?<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">../Randy</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-04-03 06:42, Urade, Yogita via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230403104249.167098-1-yogita.=
urade@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Fix buffer handling of syslo=
g and timestamp parsers.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2022-38725">https://nvd.nist.gov/vuln/detail/CVE-2022-38725</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng/s=
yslog-ng/releases">https://github.com/syslog-ng/syslog-ng/releases</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng/s=
yslog-ng/pull/4110">https://github.com/syslog-ng/syslog-ng/pull/4110</a>

Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 .../syslog-ng/files/CVE-2022-38725-0001.patch |  65 ++++++
 .../syslog-ng/files/CVE-2022-38725-0002.patch | 150 +++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0003.patch |  77 +++++++
 .../syslog-ng/files/CVE-2022-38725-0004.patch |  37 +++
 .../syslog-ng/files/CVE-2022-38725-0005.patch | 211 ++++++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0006.patch | 180 +++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0007.patch |  81 +++++++
 .../syslog-ng/files/CVE-2022-38725-0008.patch |  45 ++++
 .../syslog-ng/syslog-ng_3.36.1.bb             |   8 +
 9 files changed, 854 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0001.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0002.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0003.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0004.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0005.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0006.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0007.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3872=
5-0008.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
new file mode 100644
index 000000000..7d1dd6582
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
@@ -0,0 +1,65 @@
+From b5a060f2ebb8d794f508436a12e4d4163f94b1b8 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 12:26:05 +0200
+Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buf=
fer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4d4163f94b1b8">https://githu=
b.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4d4163f94b1b8=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ modules/syslogformat/syslog-format.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat=
/syslog-format.c
+index aacb525b3..872cc1d71 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage =
*self, const guchar **data,
+   const guchar *src =3D *data;
+   gint left =3D *length;
+=20
++  if (!left)
++    return;
++
+   /* Cisco timestamp extensions, the first '*' indicates that the clock=
 is
+    * unsynced, '.' if it is known to be synced */
+   if (G_UNLIKELY(src[0] =3D=3D '*'))
+@@ -562,7 +565,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **da=
ta, gint *length, const MsgF
+       open_sd++;
+       do
+         {
+-          if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' ||=
 *src =3D=3D ']' || *src =3D=3D '&quot;')
++          if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D=
 ' ' || *src =3D=3D ']' || *src =3D=3D '&quot;')
+             goto error;
+           /* read sd_id */
+           pos =3D 0;
+@@ -595,7 +598,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **da=
ta, gint *length, const MsgF
+           sd_id_len =3D pos;
+           strcpy(sd_value_name, logmsg_sd_prefix);
+           strncpy(sd_value_name + logmsg_sd_prefix_len, sd_id_name, siz=
eof(sd_value_name) - logmsg_sd_prefix_len);
+-          if (*src =3D=3D ']')
++
++          if (left &amp;&amp; *src =3D=3D ']')
+             {
+               log_msg_set_value_by_name(self, sd_value_name, &quot;&quo=
t;, 0);
+             }
+@@ -612,7 +616,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **da=
ta, gint *length, const MsgF
+               else
+                 goto error;
+=20
+-              if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' =
' || *src =3D=3D ']' || *src =3D=3D '&quot;')
++              if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =
=3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '&quot;')
+                 goto error;
+=20
+               /* read sd-param */
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
new file mode 100644
index 000000000..9ccb24dde
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
@@ -0,0 +1,150 @@
+From 81a07263f1e522a376d3a30f96f51df3f2879f8a Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 12:22:44 +0200
+Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero =
terminated
+ input
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/81a07263f1e522a376d3a30f96f51df3f2879f8a">https://githu=
b.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f51df3f2879f8a=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ modules/syslogformat/CMakeLists.txt           |  1 +
+ modules/syslogformat/Makefile.am              |  2 +
+ modules/syslogformat/tests/CMakeLists.txt     |  1 +
+ modules/syslogformat/tests/Makefile.am        |  9 +++
+ .../syslogformat/tests/test_syslog_format.c   | 72 +++++++++++++++++++
+ 5 files changed, 85 insertions(+)
+ create mode 100644 modules/syslogformat/tests/CMakeLists.txt
+ create mode 100644 modules/syslogformat/tests/Makefile.am
+ create mode 100644 modules/syslogformat/tests/test_syslog_format.c
+
+diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/=
CMakeLists.txt
+index 94ee01aa2..64848efee 100644
+--- a/modules/syslogformat/CMakeLists.txt
++++ b/modules/syslogformat/CMakeLists.txt
+@@ -14,3 +14,4 @@ add_module(
+   SOURCES ${SYSLOGFORMAT_SOURCES}
+ )
+=20
++add_test_subdirectory(tests)
+diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Mak=
efile.am
+index f13f88c1b..14cdf589d 100644
+--- a/modules/syslogformat/Makefile.am
++++ b/modules/syslogformat/Makefile.am
+@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=
	\
+ modules/syslogformat modules/syslogformat/ mod-syslogformat: \
+ 	modules/syslogformat/libsyslogformat.la
+ .PHONY: modules/syslogformat/ mod-syslogformat
++
++include modules/syslogformat/tests/Makefile.am
+diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogf=
ormat/tests/CMakeLists.txt
+new file mode 100644
+index 000000000..2e45b7194
+--- /dev/null
++++ b/modules/syslogformat/tests/CMakeLists.txt
+@@ -0,0 +1 @@
++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)
+diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogform=
at/tests/Makefile.am
+new file mode 100644
+index 000000000..7ee66a59c
+--- /dev/null
++++ b/modules/syslogformat/tests/Makefile.am
+@@ -0,0 +1,9 @@
++modules_syslogformat_tests_TESTS =3D \
++    modules/syslogformat/tests/test_syslog_format
++
++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}
++
++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt
++
++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAGS)=
 -I$(top_srcdir)/modules/syslogformat
++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD) $=
(PREOPEN_SYSLOGFORMAT)
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/s=
yslogformat/tests/test_syslog_format.c
+new file mode 100644
+index 000000000..b247fe3c5
+--- /dev/null
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -0,0 +1,72 @@
++/*
++ * Copyright (c) 2022 One Identity
++ * Copyright (c) 2022 L=C3=A1szl=C3=B3 V=C3=A1rady
++ *
++ * This program is free software; you can redistribute it and/or modify=
 it
++ * under the terms of the GNU General Public License version 2 as publi=
shed
++ * by the Free Software Foundation, or (at your option) any later versi=
on.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-130=
1  USA
++ *
++ * As an additional exemption you are allowed to compile &amp; link aga=
inst the
++ * OpenSSL libraries as published by the OpenSSL project. See the file
++ * COPYING for details.
++ *
++ */
++
++#include &lt;criterion/criterion.h&gt;
++
++#include &quot;apphook.h&quot;
++#include &quot;cfg.h&quot;
++#include &quot;syslog-format.h&quot;
++#include &quot;logmsg/logmsg.h&quot;
++#include &quot;msg-format.h&quot;
++#include &quot;scratch-buffers.h&quot;
++
++#include &lt;string.h&gt;
++
++GlobalConfig *cfg;
++MsgFormatOptions parse_options;
++
++static void
++setup(void)
++{
++  app_startup();
++  syslog_format_init();
++
++  cfg =3D cfg_new_snippet();
++  msg_format_options_defaults(&amp;parse_options);
++}
++
++static void
++teardown(void)
++{
++  scratch_buffers_explicit_gc();
++  app_shutdown();
++  cfg_free(cfg);
++}
++
++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);
++
++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input=
, .timeout =3D 10)
++{
++  const gchar *data =3D &quot;&lt;182&gt;2022-08-17T05:02:28.217 mymach=
ine su: 'su root' failed for lonvick on /dev/pts/8&quot;;
++  /* chosen carefully to reproduce a bug */
++  gsize data_length =3D 27;
++
++  msg_format_options_init(&amp;parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&amp;parse_options, =
(const guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gucha=
r *) data, data_length, &amp;problem_position));
++
++  msg_format_options_destroy(&amp;parse_options);
++  log_msg_unref(msg);
++}
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
new file mode 100644
index 000000000..580116504
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
@@ -0,0 +1,77 @@
+From 4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sun, 21 Aug 2022 18:44:28 +0200
+Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of =
bounds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d">https://githu=
b.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ modules/syslogformat/syslog-format.c          |  2 +-
+ .../syslogformat/tests/test_syslog_format.c   | 32 +++++++++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat=
/syslog-format.c
+index 872cc1d71..a3d48d6f2 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, co=
nst guchar **data, gint *len
+=20
+   /* if the next char is not space, then we may try to read a date */
+=20
+-  if (*src !=3D ' ')
++  if (!left || *src !=3D ' ')
+     return;
+=20
+   log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data, *length=
 - left - 1);
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/s=
yslogformat/tests/test_syslog_format.c
+index b247fe3c5..d0f5b4043 100644
+--- a/modules/syslogformat/tests/test_syslog_format.c
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zer=
o_terminated_input, .timeou
+   msg_format_options_destroy(&amp;parse_options);
+   log_msg_unref(msg);
+ }
++
++Test(syslog_format, cisco_sequence_id_non_zero_termination)
++{
++  const gchar *data =3D &quot;&lt;189&gt;65536: &quot;;
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&amp;parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&amp;parse_options, =
(const guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gucha=
r *) data, data_length, &amp;problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;.SDATA.meta.seq=
uenceId&quot;, NULL), &quot;65536&quot;);
++
++  msg_format_options_destroy(&amp;parse_options);
++  log_msg_unref(msg);
++}
++
++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_pars=
ed_as_program_name)
++{
++  const gchar *data =3D &quot;&lt;189&gt;65536&quot;;
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&amp;parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&amp;parse_options, =
(const guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gucha=
r *) data, data_length, &amp;problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;PROGRAM&quot;, =
NULL), &quot;65536&quot;);
++
++  msg_format_options_destroy(&amp;parse_options);
++  log_msg_unref(msg);
++}
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
new file mode 100644
index 000000000..cb81b1c12
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
@@ -0,0 +1,37 @@
+From 73b5c300b8fde5e7a4824baa83a04931279abb37 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 12:42:38 +0200
+Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timest=
amp buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a04931279abb37">https://githu=
b.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a04931279abb37=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+Signed-off-by: Balazs Scheidler <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ lib/timeutils/scan-timestamp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timesta=
mp.c
+index 304a57673..4fbe94a36 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -332,7 +332,7 @@ __parse_usec(const guchar **data, gint *length)
+           src++;
+           (*length)--;
+         }
+-      while (isdigit(*src))
++      while (*length &gt; 0 &amp;&amp; isdigit(*src))
+         {
+           src++;
+           (*length)--;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
new file mode 100644
index 000000000..70964b328
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
@@ -0,0 +1,211 @@
+From 45f051239312e43bd4f92b9339fe67c6798a0321 Mon Sep 17 00:00:00 2001
+From: Balazs Scheidler <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 12:43:42 +0200
+Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/45f051239312e43bd4f92b9339fe67c6798a0321">https://githu=
b.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe67c6798a0321=
</a>]
+
+Signed-off-by: Balazs Scheidler <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---
+ 1 file changed, 113 insertions(+), 13 deletions(-)
+
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/t=
ests/test_scan-timestamp.c
+index 27b76f12d..468bbf779 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -50,17 +50,21 @@ fake_time_add(time_t diff)
+ }
+=20
+ static gboolean
+-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new(&quot;&quot;);
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+=20
+-
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc3164_timestamp(&amp;data, &amp;length, &=
amp;wct);
+=20
++  cr_assert(length &gt;=3D 0);
++  cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);
++
+   unix_time_unset(&amp;stamp);
+   convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);
+=20
+@@ -71,16 +75,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[3=
2])
+ }
+=20
+ static gboolean
+-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new(&quot;&quot;);
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+=20
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc5424_timestamp(&amp;data, &amp;length, &=
amp;wct);
+=20
++  cr_assert(length &gt;=3D 0);
++  cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);
++
+   unix_time_unset(&amp;stamp);
+   convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);
+=20
+@@ -91,31 +100,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[=
32])
+ }
+=20
+ static gboolean
+-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar con=
verted[32])
++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected,=
 gchar converted[32])
+ {
+-  cr_assert(_parse_rfc3164(ts, converted));
++  cr_assert(_parse_rfc3164(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+=20
+ static gboolean
+-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar con=
verted[32])
++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected,=
 gchar converted[32])
+ {
+-  cr_assert(_parse_rfc5424(ts, converted));
++  cr_assert(_parse_rfc5424(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+=20
+ #define _expect_rfc3164_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc3164_timestamp_eq(ts, expected, converted), &quot;Par=
sed RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, e=
xpected=3D%s&quot;, ts, converted, expected); \
++    cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, converted), &quot=
;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%=
s, expected=3D%s&quot;, ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc3164_timestamp_eq(ts, len, expected, converted), &quo=
t;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D=
%s, expected=3D%s&quot;, ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len &lt; 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc3164_timestamp(&amp;data, &amp;length, &amp;w=
ct)); \
+   })
+=20
+ #define _expect_rfc5424_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc5424_timestamp_eq(ts, expected, converted), &quot;Par=
sed RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, e=
xpected=3D%s&quot;, ts, converted, expected); \
++    cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, converted), &quot=
;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%=
s, expected=3D%s&quot;, ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc5424_timestamp_eq(ts, len, expected, converted), &quo=
t;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D=
%s, expected=3D%s&quot;, ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len &lt; 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc5424_timestamp(&amp;data, &amp;length, &amp;w=
ct)); \
+   })
+=20
++
+ Test(parse_timestamp, standard_bsd_format)
+ {
+   _expect_rfc3164_timestamp_eq(&quot;Oct  1 17:46:12&quot;, &quot;2017-=
10-01T17:46:12.000+02:00&quot;);
+@@ -164,6 +202,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_t=
he_past)
+   _expect_rfc3164_timestamp_eq(&quot;Dec 31 17:46:12&quot;, &quot;2017-=
12-31T17:46:12.000+01:00&quot;);
+ }
+=20
++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_=
properly)
++{
++  gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;
++  gint ts_len =3D 24;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T05:=
02:28.417+00:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T05:=
02:28.417+00:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:02:2=
8.417+00:00&quot;);
++
++  /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T05:=
02:28.417+02:00&quot;);
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T05:=
02:28.410+02:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T05:=
02:28.400+02:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++
++  for (gint i =3D 6; i &lt; ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_=
is_handled_properly)
++{
++  gchar *ts =3D &quot;Aug 17 2022 05:02:28: whatever&quot;;
++  gint ts_len =3D 21;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:02:2=
8.000+02:00&quot;);
++
++  /* no &quot;:&quot; at the end, that's a problem, unrecognized */
++  _expect_rfc3164_fails(ts, ts_len - 1);
++
++  for (gint i =3D 1; i &lt; ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_prop=
erly)
++{
++  gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;
++  gint ts_len =3D 24;
++
++  _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T05:=
02:28.417+00:00&quot;);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T05:=
02:28.417+00:00&quot;);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:02:2=
8.417+00:00&quot;);
++
++  /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T05:=
02:28.417+02:00&quot;);
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T05:=
02:28.410+02:00&quot;);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T05:=
02:28.400+02:00&quot;);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T05:=
02:28.000+02:00&quot;);
++
++  for (gint i =3D 6; i &lt; ts_len; i++)
++    _expect_rfc5424_fails(ts, ts_len - i);
++
++}
++
+=20
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_=
timezones)
+ {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
new file mode 100644
index 000000000..81e36c650
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
@@ -0,0 +1,180 @@
+From 09f489c89c826293ff8cbd282cfc866ab56054c4 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 14:29:43 +0200
+Subject: [PATCH 6/8] timeutils: name repeating constant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/09f489c89c826293ff8cbd282cfc866ab56054c4">https://githu=
b.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc866ab56054c4=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------
+ 1 file changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timesta=
mp.c
+index 4fbe94a36..d22d50973 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint =
*wday)
+ {
+   *wday =3D -1;
+=20
+-  if (*left &lt; 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left &lt; abbrev_length)
+     return FALSE;
+=20
+   switch (**buf)
+     {
+     case 'S':
+-      if (strncasecmp(*buf, &quot;Sun&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Sun&quot;, abbrev_length) =3D=3D 0)
+         *wday =3D 0;
+-      else if (strncasecmp(*buf, &quot;Sat&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;Sat&quot;, abbrev_length) =3D=3D=
 0)
+         *wday =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, &quot;Mon&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Mon&quot;, abbrev_length) =3D=3D 0)
+         *wday =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'T':
+-      if (strncasecmp(*buf, &quot;Tue&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Tue&quot;, abbrev_length) =3D=3D 0)
+         *wday =3D 2;
+-      else if (strncasecmp(*buf, &quot;Thu&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;Thu&quot;, abbrev_length) =3D=3D=
 0)
+         *wday =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'W':
+-      if (strncasecmp(*buf, &quot;Wed&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Wed&quot;, abbrev_length) =3D=3D 0)
+         *wday =3D 3;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, &quot;Fri&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Fri&quot;, abbrev_length) =3D=3D 0)
+         *wday =3D 5;
+       else
+         return FALSE;
+@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *w=
day)
+       return FALSE;
+     }
+=20
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+=20
+@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gin=
t *mon)
+ {
+   *mon =3D -1;
+=20
+-  if (*left &lt; 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left &lt; abbrev_length)
+     return FALSE;
+=20
+   switch (**buf)
+     {
+     case 'J':
+-      if (strncasecmp(*buf, &quot;Jan&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Jan&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 0;
+-      else if (strncasecmp(*buf, &quot;Jun&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;Jun&quot;, abbrev_length) =3D=3D=
 0)
+         *mon =3D 5;
+-      else if (strncasecmp(*buf, &quot;Jul&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;Jul&quot;, abbrev_length) =3D=3D=
 0)
+         *mon =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, &quot;Feb&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Feb&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, &quot;Mar&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Mar&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 2;
+-      else if (strncasecmp(*buf, &quot;May&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;May&quot;, abbrev_length) =3D=3D=
 0)
+         *mon =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'A':
+-      if (strncasecmp(*buf, &quot;Apr&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Apr&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 3;
+-      else if (strncasecmp(*buf, &quot;Aug&quot;, 3) =3D=3D 0)
++      else if (strncasecmp(*buf, &quot;Aug&quot;, abbrev_length) =3D=3D=
 0)
+         *mon =3D 7;
+       else
+         return FALSE;
+       break;
+     case 'S':
+-      if (strncasecmp(*buf, &quot;Sep&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Sep&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 8;
+       else
+         return FALSE;
+       break;
+     case 'O':
+-      if (strncasecmp(*buf, &quot;Oct&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Oct&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 9;
+       else
+         return FALSE;
+       break;
+     case 'N':
+-      if (strncasecmp(*buf, &quot;Nov&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Nov&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 10;
+       else
+         return FALSE;
+       break;
+     case 'D':
+-      if (strncasecmp(*buf, &quot;Dec&quot;, 3) =3D=3D 0)
++      if (strncasecmp(*buf, &quot;Dec&quot;, abbrev_length) =3D=3D 0)
+         *mon =3D 11;
+       else
+         return FALSE;
+@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gin=
t *mon)
+       return FALSE;
+     }
+=20
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
new file mode 100644
index 000000000..abb36fdf5
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
@@ -0,0 +1,81 @@
+From 8c6e2c1c41b0fcc5fbd464c35f4dac7102235396 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 14:30:22 +0200
+Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp=
 length
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4dac7102235396">https://githu=
b.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4dac7102235396=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ lib/timeutils/scan-timestamp.c            | 8 ++++++--
+ lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timesta=
mp.c
+index d22d50973..125264677 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -350,19 +350,21 @@ __parse_usec(const guchar **data, gint *length)
+ static gboolean
+ __has_iso_timezone(const guchar *src, gint length)
+ {
+-  return (length &gt;=3D 5) &amp;&amp;
++  return (length &gt;=3D 6) &amp;&amp;
+          (*src =3D=3D '+' || *src =3D=3D '-') &amp;&amp;
+          isdigit(*(src+1)) &amp;&amp;
+          isdigit(*(src+2)) &amp;&amp;
+          *(src+3) =3D=3D ':' &amp;&amp;
+          isdigit(*(src+4)) &amp;&amp;
+          isdigit(*(src+5)) &amp;&amp;
+-         !isdigit(*(src+6));
++         (length &lt; 7 || !isdigit(*(src+6)));
+ }
+=20
+ static guint32
+ __parse_iso_timezone(const guchar **data, gint *length)
+ {
++  g_assert(*length &gt;=3D 6);
++
+   gint hours, mins;
+   const guchar *src =3D *data;
+   guint32 tz =3D 0;
+@@ -372,8 +374,10 @@ __parse_iso_timezone(const guchar **data, gint *len=
gth)
+   hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';
+   mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';
+   tz =3D sign * (hours * 3600 + mins * 60);
++
+   src +=3D 6;
+   (*length) -=3D 6;
++
+   *data =3D src;
+   return tz;
+ }
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/t=
ests/test_scan-timestamp.c
+index 468bbf779..d18bdc65d 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -264,6 +264,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_i=
nput_is_handled_properly)
+=20
+ }
+=20
++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
++{
++  const gchar *ts =3D &quot;2022-08-17T05:02:28.417+03:00&quot;;
++  gint ts_len =3D strlen(ts);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
++}
++
+=20
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_=
timezones)
+ {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.=
patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
new file mode 100644
index 000000000..56c71e8a2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
@@ -0,0 +1,45 @@
+From 56f881c5eaa3d8c02c96607c4b9e4eaf959a044d Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:la=
szlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a>
+Date: Sat, 20 Aug 2022 14:30:51 +0200
+Subject: [PATCH 8/8/] timeutils: fix out-of-bounds reading of data buffe=
r
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE: CVE-2022-38725
+
+Upstream-Status: Backport
+[<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/syslog-ng=
/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e4eaf959a044d">https://githu=
b.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e4eaf959a044d=
</a>]
+
+Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@pro=
tonmail.com&gt;</a>
+
+Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ lib/timeutils/scan-timestamp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timesta=
mp.c
+index 125264677..c00d8e6a9 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -431,7 +431,7 @@ __parse_bsd_timestamp(const guchar **data, gint *len=
gth, WallClockTime *wct)
+       if (!scan_pix_timestamp((const gchar **) &amp;src, &amp;left, wct=
))
+         return FALSE;
+=20
+-      if (*src =3D=3D ':')
++      if (left &amp;&amp; *src =3D=3D ':')
+         {
+           src++;
+           left--;
+@@ -482,7 +482,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *le=
ngth, WallClockTime *wct)
+    * looking at you, skip that as well, so we can reliably detect IPv6
+    * addresses as hostnames, which would be using &quot;:&quot; as well=
. */
+=20
+-  if (*src =3D=3D ':')
++  if (left &amp;&amp; *src =3D=3D ':')
+     {
+       ++src;
+       --left;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta=
-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
index 40bbfe495..045b9b71c 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
@@ -22,6 +22,14 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tafil=
e://volatiles.03_syslog-ng\file://syslog-ng-tmp.conf\file://syslog-ng.ser=
vice-the-syslog-ng-service.patch\+file://CVE-2022-38725-0001.patch\+file:=
//CVE-2022-38725-0002.patch\+file://CVE-2022-38725-0003.patch\+file://CVE=
-2022-38725-0004.patch\+file://CVE-2022-38725-0005.patch\+file://CVE-2022=
-38725-0006.patch\+file://CVE-2022-38725-0007.patch\+file://CVE-2022-3872=
5-0008.patch\">&quot;https://github.com/balabit/syslog-ng/releases/downlo=
ad/${BP}/${BP}.ta
            file://volatiles.03_syslog-ng \
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
+	   file://CVE-2022-38725-0001.patch \
+           file://CVE-2022-38725-0002.patch \
+           file://CVE-2022-38725-0003.patch \
+           file://CVE-2022-38725-0004.patch \
+           file://CVE-2022-38725-0005.patch \
+           file://CVE-2022-38725-0006.patch \
+           file://CVE-2022-38725-0007.patch \
+           file://CVE-2022-38725-0008.patch \
 &quot;</a>
=20
 SRC_URI[sha256sum] =3D &quot;90a25c9767fe749db50f118ddfc92ec71399763d2ec=
d5ad4f11ff5eea049e60b&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#101935): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/101935">https:=
//lists.openembedded.org/g/openembedded-devel/message/101935</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/98032111/3616765">https://lists.openembedded.org/mt/=
98032111/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ahS9nSiOpBKy0z1lIX7gbBsQ--

