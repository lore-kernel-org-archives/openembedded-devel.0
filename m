Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92560C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 19:37:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2243.1642016222544317333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I/B/WWMj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80118c6748=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CJGJKe022860
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zqRyJCBmOGO2Vwicq09wpw+N09HZ6ZT7dvFFjPHug44=;
 b=I/B/WWMjMJCfiy18bd3nM5xIA/Nml9L84XfX4zO+lihOlYGLC+Y8aYNF5pfHjIkaKZRN
 Qi+cPqzr33GSYWKHBpLgtMy3RuvF+VDHCagjj3VePZmnRFqgv60dNx4DlmruirJSsHZd
 X3bExJaBSCHhg4SHhzSCdikBd+c/J7k03nERcSJHBepE0BTfhsZqAM3NFZUVhSDBiG2w
 pvKu1U4YHvQbT7x0l/4p2QmkKgjNfhy2KaJlrbrQ24M5VCfHgBhwFDzU79nwgGbdOHN9
 P79/CNfLa7cLfS9/cb1Wxp94C9BGlYmRpyknqNkzTuJ8UtAe/AhOi95n/Ssx1/+X5B1u 9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf00enj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:37:01 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CJb0Ht006774
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:37:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf00eng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 19:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtqMgV0Xp2CFvwlY8ZoSauWbX/Oc13fx0b3iiympbzkNNHZ61vKdnSH+oBbOLP+2siq0H5TmNh0hJCXkGPDPS8ChrBDFjJBmVNUqgIRviHze62WfXhksxSw+1kkDpuA/XWyCn54jI/uKLE7nDraY7JDWkSHrrJ9/2Geqr0NR9EpvckmX84GnOpSIakf7lLost7hbwEPzrRr7a73G9l1jQ0D21bo9g7AI04SmBx+Brti7pYrYFeLJzxDc1v/skoZGGSyWXYzAAucqAqSMkHur8mWg1YjmMggaddLlsa5adTqgo4/7O0TLsWLYgmEDvvKUpoAOqaqiMmKBUcENdx6faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqRyJCBmOGO2Vwicq09wpw+N09HZ6ZT7dvFFjPHug44=;
 b=mJMeLLR92JjJ4P6ZFTUc9gGp+oJF8okJ9cv7giHzQMpN47zhe2GIFroxAK5f/Olw5Qxlu2IYv+OGEmEJR8KA4fo/w9PVeq0jioIVgbnRnQVqeDgCeTZv8305INavMqqeAz1KcqjL4ySQUVfC7KXqwbUi/r6VkQVt8nO3WMNdIIQnRd5Bct7mXdZYPJx7h9gyC1U4a1nV70Y282RzchI1VNuAERdlj/YiD9lljmlukYlumQfMqKExRCt5YwE7/UYYRXUdUI02NZ3SQqBtDG6vh+2lXxPbAmRRLWYyJMTMM0CZ92SMz18NsXDXK0mDgZKPEiWpDAgwCo58SG/NnsQcJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 19:36:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37%5]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 19:36:57 +0000
Message-ID: <f831104a-7f38-8e70-673d-0eb0dc43a1e3@windriver.com>
Date: Wed, 12 Jan 2022 14:36:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [oe] python3-cryptography "success"
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: 
 <CANx9H-CHGrSzA=vZUAs=5Gg=5xw4W2MUKnvANv-a7xxQvJq5qA@mail.gmail.com>
 <CAAnfSTs7Uu5OHb3n6AikSHHr6b-t=fJyqbGBbVnSDaEdg_ttNQ@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
In-Reply-To: 
 <CAAnfSTs7Uu5OHb3n6AikSHHr6b-t=fJyqbGBbVnSDaEdg_ttNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6149bb21-14e2-4d5c-a408-08d9d602e4f7
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3625B451FF062BE796F361B09F529@DM6PR11MB3625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TU4WoYKTdOzrPooHdE3lX5iJJRbHLdDQwl7+DimSFEMhYWrhD1htU9WGOGWbuB3GxCIIIpp8SEp2jCdFEy3s14QFzNhlbDoDTsHPQ6M6d7CkbdGrEfcgSiKwsXKkG/BWxOdM2yhd9mMR4g2hlDhnyPROhB+tS7aO0SDeOa02rXp7+L2kYxVuidvmROOrxDCF96o/GWz2RxxejXqH942+j7abRltKNx29hJr9zosLgEn24S2qwFxIjDo3wIdyi2lS/VyR4tH/5VhtQtBhX0lvK3Uogqx/3aeWO2RDwIecFVxhrWZIOlSihUewfY5F/5DmHpPRHUC7xwNjifdMv7+/r6ghTgiNDn0tFwyQIacuDQvKriQQnqdh0Lo2dDfn3WK9ZZu2p+OJuoxuItq94yb0DwqpcOa93xGVnqC7FQK75KevsRfUW/DRh2uoAdMjYjy4dauqgrWNAJxQlyr8OZlLVIzXX8kJP1KWPLPv/Lf/Zi+ka1WyL0MV4cgWfabnJpEpg3p2gL0URRzIgI60/nA0c6wOP22CPzsJGez9UxiWpLEYFGORgv4ecs3CqRcUJrjYlA0IBIfvt+NFESwB98WaPWiDfN/btfaigTZLFwpCuN9CDJcUEDDLZsrlUPMnoJwK83O9kCHKcDysHt+Vk5sIyrBblGwG8rKPPebQbTq1c5bbuFCMoI/pqLMEKanWDHbQceXhDZCW7SuLX3fMVPWKzTOIiEKqfmq5rp8AVbLkvNm87aYnC4QN6WZH0PMG+wML0TVPixtTi+hgWfR9hMGJW+7ztW1lSM7DUIgnnDJIbZH2Y+MWKlxEWbJkvQv1KeABG2MYdagY1FfZKEivt0oif1qWmEX5Rc6WeaM0RL1NEdA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(31686004)(508600001)(8676002)(36756003)(86362001)(6506007)(31696002)(8936002)(186003)(66476007)(44832011)(2616005)(66556008)(53546011)(66946007)(83380400001)(38100700002)(316002)(2906002)(6486002)(4326008)(6512007)(110136005)(6666004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkdKR3FUenZweEgwL1YxRDVmVDZuc2xMemlPclBYMDlCb09XNTF1VngzVTRs?=
 =?utf-8?B?b1hpS3dUNUVOSXV2TnJUOU9FVGlBbFRiRDJhVWFqTzlTTHFIS0FlM3RacWpF?=
 =?utf-8?B?czNJUnJLSVlBMXFUQWg1aUlqeG1pbVNBZUFMUmRTTGJjQjlDbm9ORHBJYkpz?=
 =?utf-8?B?Wk5acFhFanBsdlYrYmdNMys5T0RRYVhIT0M4TFowcXcwU3hmR2JYYk84czdB?=
 =?utf-8?B?TFVkaGN0cXBMVUZPRjczOWpOMWYya3h4aEZDa0R6TFNQU2FhaHBsZWhzRmFl?=
 =?utf-8?B?T1lDMkhlNFNiZ01lY3NuY2p6aFRUVlJNSWNTTExaS0JQMjQ0SkVRRXYvSzNh?=
 =?utf-8?B?NW1yQ25PVUR5cDJtT0VveEN5SUFoOE1XT0creFV5a3I0UkNYaHpFZXFuSlla?=
 =?utf-8?B?VmJKQTdweldGMWV2dXhhYVdZSGhsT25CQWtBNHZlTEtMMVcwbWVuOFdMUHZH?=
 =?utf-8?B?NSt2WnZmV0F5bDRWelFHZHVyS2FuOEhYMURXaURSRU9VUDM3SUlYQUhKSVd6?=
 =?utf-8?B?WGJ5aEZnM2V1bE1xdDFYR3FSeDdzaXMzM0FPVHNLZ2M4ZEsyUFI1a1hySDRT?=
 =?utf-8?B?Rkh4bVhnd0c2OHV3UCtHZlY3MmRJc3BRZ0RvQk5TZTFZVytXNmViWkorNjc2?=
 =?utf-8?B?WEJPT2pTMFprcStPRDJEOXJNa3o2WUlEYnVhYVd1clhuRjVCSDFSSmJIODUv?=
 =?utf-8?B?cUNVZ2R3QmJPSVZmTTZvb3o3bjB4UXIzbjRWRmxHdXRDRkhmR3I2NVZBaHpF?=
 =?utf-8?B?MEl3OEdtM2tVc2dTWTNTVkpBVjAvN3hGVFdQays2RVo1OVcrdlVMK3RFNlVj?=
 =?utf-8?B?cGlXM202SUtLWGhJcXlWVHZWVWE1cHZTYlFaQUpZK0dXR0l1THFlKzZqRGVZ?=
 =?utf-8?B?amRUSDBNQTNvT2tzclByc1d4WnZVZ3NhanhBczVmUlJYVFRORWIyMXg4ZDQz?=
 =?utf-8?B?c3BvMlIxQnZFcFVlVjVBQXk1bXJHVHBDWTBXNmd0bTBkTEM3MmJOMUNzL2dZ?=
 =?utf-8?B?U0lpRUhVZ1ZhejZjTHQvU2hYdnNHeURWckJ3SkVyQTZ1K3B1ZFUwcWMwNENB?=
 =?utf-8?B?OURHdWYwUXFUaVRPbndDNzkxSHVJYWhTeFpieWxsK2o1NTErU0E5RXpuT1Y5?=
 =?utf-8?B?VDY4a1NWWnJZOGZRelp0dzI0U0xvYTc2VnorTnplRE10MklRN3RoV2hJR3FF?=
 =?utf-8?B?SkVIWkJQNDBQbGdxeXQ1dktsZThScStVbVRteXp2cXk2WFk2U1ozb0l6WWJk?=
 =?utf-8?B?ZkhMSDROYVdKYkVDVG5YNVNKOTlaL3g3Wk8wUm11bGpLc1RwUmZhNm1pbmxK?=
 =?utf-8?B?TGZtUm1UTWRhR1FEenRudEd3ZFY3Z2JRUHJjZzluV2RLVkdYaGRWUE1hMkdH?=
 =?utf-8?B?clhWVk15akVpYjhzRHA3cERNQTMyNExSSTRLZWgvV05GU0hDUkpvbTF4UGZV?=
 =?utf-8?B?dWdlL2JreUIveUtCbU1PRkJ5RzJWU3MyNko2NmxjYWhjRTUvZmM5VzFyMW1z?=
 =?utf-8?B?QnNKYmU5MWdPbVRTcGhieWdwalhsVERMOElrV091N2FzWTFZMTN0UzVubWE3?=
 =?utf-8?B?M05VQ0llRnlGeTZsbW5GUVpCSE50dVozaXhUZUVUSUdqclhoOGR1VmxqV2Fl?=
 =?utf-8?B?dW9tbXJiYkowQ3I4SXNIajhUK0J5OU9VRjBtZXBzY3RhMHlURThOaVFmZmFW?=
 =?utf-8?B?QjUxeDUvay94RlZUT0JOK2RqS2F3a0VPN2J0NzIxVlZhaUhhcWxDY1hCbFhs?=
 =?utf-8?B?RnJXRVMza1FVK3RVVjZOL1VZYWFaZ2tTbUVoZllwTzVlQnh4MUpZeXNUYjV3?=
 =?utf-8?B?cmlydHowWEd4b3RGK3hyNlFNQWhxQ0EvMkd0d1Fzc1ZJVW1tTzQ1ZnBKd00r?=
 =?utf-8?B?d0lORnVwOGZUNDhIMDBkMW52OWhKakNYUEQzT3ZORXlqenN3TlhRK0ZBQTdH?=
 =?utf-8?B?czRDcVR5ejdYK09NZDFnSXJwT29Ic2gwaWpuUVEzZ1JNMVh2Qy9DWlhkUGFm?=
 =?utf-8?B?VnJwZ2V3dElKZGFGbVI5RnRaUHdYYmZxRUlSeTZMZVpXZGREeXRYWlRIT0d0?=
 =?utf-8?B?MnZ1Y1J0TWVwM3U1aTVPSVZrc1lsWmdCU2JpL2lNTFZsTzdHVG1KVWpYVHdM?=
 =?utf-8?B?UC9hMW9YelNRQUVGTGliNDlxRnNralJvT0hDT1lMYm8zeXNmWFlGMXhDaTh6?=
 =?utf-8?B?a0k2SkpUSExKajVxMTlIM1RnL21hcGg1a2Y2YVFiejRMWHBoS1drT1pJUVpL?=
 =?utf-8?B?dGdidkxZU2lRT1MrYVNhMy9jdEswUHUzQWVoSTZYVGFYY2ZYbTRiSFZSbmQ5?=
 =?utf-8?Q?DSyX7vydc0kMFMdt42?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6149bb21-14e2-4d5c-a408-08d9d602e4f7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 19:36:57.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rh/cN1kqFh//dyTEhtofmTYMvyMODGK6IWqfX1LPy2hZle/XQKbSXVtfEFTL3QF9lm/vZY8NNnTvchfO/pWVGVfJ9U2ESsgInBTIs/SNLag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3625
X-Proofpoint-ORIG-GUID: YvivcTUSoP8aMBJ4i9oPQkKyhlex3aRQ
X-Proofpoint-GUID: kRC2rbsxUsnHM4ACVEeag4rTR6sVH5aP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=873 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 19:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94794


On 2022-01-12 08:04, Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Wed, 12 Jan 2022 at 04:34, Tim Orling <ticotimo@gmail.com> wrote:
>> I finally cracked a nut that was at the root of our cross-compile woes with pyo3, which was the root cause of python3-cryptography not building.
>>
>> For those interested, my WIP branch is:
>> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_36.0.1
> I've just built this on aarch64 host for aarch64 target, and it built
> successfully. Congratulations! :)

Tested qemux86-64 and qemuarm64 as well. Great work!

- Trevor

>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94786): https://lists.openembedded.org/g/openembedded-devel/message/94786
> Mute This Topic: https://lists.openembedded.org/mt/88367097/3616776
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [trevor.gamblin@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

