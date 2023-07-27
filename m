Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4194DEB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 06:26:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1728.1690439191850297543
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 23:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=CS2fYQKg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6572b4b065=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36R5Lohu030533
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 23:26:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=i/n+fDpDI043cB2ru1dBJECudbKdoV8Z8MhGrKqQxBM=; b=
	CS2fYQKg3lUnfebjR0W6g8s3C2qhvdw1BaBoB1qnFIEVl1Xnt17lwlfyWkGv6UNz
	E4E5NpK7PezKg/51LghoUrHlt86MMX53eTZhBEJxv2SMiDX4ryc0spNeuWZqqhgD
	PAbsBx8Rf9VRKOjbjRRqy2vf/4cGN+38Gq7aPGKgKK4BH6uFpO+0iksA0txxv0QI
	XNcbyVFovhqV3RCylJYNGCHV/ZFpWPMpXNOR7xuP/9uOgt89RAjwAFVbn0EjF2EU
	8h1Ebbr/vRLFMbj7n9x2ZL25Q1wIFZGxpa0KNzjersW1HmQLxP08V3051ZpElIi1
	aukYGloxZY92l+efMHgRGg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad044y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 23:26:31 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36R6QUKE031618;
	Wed, 26 Jul 2023 23:26:30 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad044y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 23:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2JLLgULA5Ch2chR9hCbEruSscTFC7EtLUT+aynDpOpxZPMisysv6sL43TGXjIgzCMz/kp8kW9/z5vh4grXpqEOMx0TfBdZL12ON3B/bPMpiB2sDd5GiLsrZCii1oV1XN8ncyc635qBMnBXUXUARkZquS2Slu20D70oJv/fiTwoziiQmjE6VtD+GOJPY35kpf7pdWY+2iVo4irpZtbyeK+i2FsCNHgoyYmb51V/rS6H0T7QAzHWXfOWtAKDgEYZu/ETp5W9xyo1Xk3I5Sw9zBzDOkA9j/9ICvpeZqBsMpqi4I+RoJkBbG0iG6wOybKzpzQocBMw9YhibrZHAE5Fekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/n+fDpDI043cB2ru1dBJECudbKdoV8Z8MhGrKqQxBM=;
 b=ke8E537yfy309kpCKI7GE7tkrk7QrSYRFdbe0EQUXm3MqMhQivz83MCk4oDUpHwT75TE03nJuo5labCMK9BnP+9qMIb01F266zM6Y/7nN9XsL5JoF5lpY1hWFSixRgtRtWJfqhR3Hmljac9e5E/S/xjYVeU6F9C8liOGS7768wauPmdMVUlhm4rG9PbpdFstoLdvKACkqhunf4s1Si+wwxO11c/MnvgAeNAQ5CBRmAasG2tZQoECDyvewX0s8+EWqCTbJ9d58yytRZvInvKGfFOMoYQDQon5cL9HFsneHjGwTAEVvjDiKbKpW94HBEopuWvCqGib+a3KX2t7Zl+FNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 06:26:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::f499:a2a9:85eb:97ac%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 06:26:26 +0000
Message-ID: <c1026a51-6b2c-c0fa-2391-50e47491c32a@windriver.com>
Date: Thu, 27 Jul 2023 14:26:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-networking][PATCH V2] vsomeip: add recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230727023924.1121571-1-yi.zhao@windriver.com>
 <5325926049a47cf61b6fe57040b9f98189f0e968.camel@intel.com>
 <efe84917-0da4-face-5d3a-3cf5ab38db4d@windriver.com>
 <CAMKF1sragyPm_iKUj7ufhBLhk_Frmh8Z+kuc5CU6kjNP8FurYw@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1sragyPm_iKUj7ufhBLhk_Frmh8Z+kuc5CU6kjNP8FurYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a122a8-e9cd-4b0f-686d-08db8e6a67bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ISYjRtNmSWAOX8hAUF3P1q+lReYuFI+3cvDlehNx76pnyiAnhEcMI9LAVQbkksuGBKG6czNiCdW4OGJ1hSITZZd9ncWjQwpAx6R9Lup6npTHT7BsdcHlr4K9b6t9fsCVzYMZLfDB6+NCxAfnZqo8ATYQs52L4ZXkuLWcwZ2tZ+w1UaziYWuznlp5BiJyiCRJDgDc92tM/U+mNKbvkHvz9IX8Q8wRmuMCi3uQDUjEvq3BqPZEdiNYECFZ7du8r6MeIt2+p5UqY+nneGzR9jXliFJqwZxQsk7wjp/icGjriyK7KIiX7fQYjEVnPxdtH5K2PlbVD1EitjRC3JcrvP53lwFulk8cYU2sj39DO8pxo4eU1Q5E6xNamkzaljlnzcwmwHvuWfUFYvnthw4OwoHvyKNXsGav0OO/bzDLv1ahGIKEcoISGNieh8N61wg4SLbVxGKGDdIZvWpww+730LVyPkYT3OZtCm/zTLHblOyQF0qzyCFMgv/DhbOtuVwuYfx16YuHNsYOVWk9rBX2G4LpkTvm5ne+cYdCWla+BvLq2FFfaYYqvoLIMVch0QFefTVHkj1amxgq87BizN5LAwGFZhyFicYAvyEHvkiPI+ArajaVO97Y4qeoGYsGM75tuABt97kE2/tbaldvwTL92eymmSUR6g0RkMmj6ohqZ1kO7kGnV8OuTAmCwIn3bFt3vJfR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199021)(83380400001)(44832011)(66899021)(54906003)(2906002)(5660300002)(2616005)(6666004)(6486002)(53546011)(26005)(86362001)(6512007)(966005)(478600001)(38100700002)(41300700001)(31686004)(66476007)(66946007)(66556008)(186003)(31696002)(316002)(6506007)(8936002)(8676002)(36756003)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVN3VEYyeXArT0xLSnZ6MGRyeE1SajRyT0NSTDRkM2lTVENoTmVUTS9Ca2FV?=
 =?utf-8?B?VS9RL1JxbDZ6LzNJSUZPMFhTQ0VsNytDbzQvMGtPazFuQktwWi95a1E3Y25T?=
 =?utf-8?B?SlFVd3EzZlVwMVpRVUFLZmlLSmU0dnZPbndUSnN2alVDZFNHQlF6emJuS00w?=
 =?utf-8?B?clBoNTZJMTlBNjJtbFpaODhLNnYvRTBZVWxmbzkveUUyS3BoK0xHUGk3VFpB?=
 =?utf-8?B?WlhhaXFMTlNuR0hsNDlGUlJiaGJXYmFmaEdZbWJKVlpNRVFqeG1rYkM2L3FB?=
 =?utf-8?B?RjdoQU1rUGZscytIZFhPWm1MQWpTRWZMMHIvWXRubVpDRTRLSXgxay9YU0NQ?=
 =?utf-8?B?dUNTZ3UzUHRXZU1MTTNyd1BuV1J4blNjOFJVMHpqQThXWEFXclcxcGRrZTNm?=
 =?utf-8?B?VGZ6c0M4c2x5eTBXSElkTmdCcHNpNHBwTEdSN3JLeURMTGs3ZHJjTDRYWURU?=
 =?utf-8?B?cnBDVnZOdExzamc4M0xSYUNRRkFZS1JYazhrWFZpMllWV0V0YjVIMC9vdGhq?=
 =?utf-8?B?UGVTb3pVTGI5aklxU1FOR0pyOFB1RVFRZzMzWlBLY3hnNlh0VW5wZ1dHNFd6?=
 =?utf-8?B?NzBYazBJMFl2MkFMNFV0WDVCKzA3NmVEOHd2ZlgrUWsrRlhZK0tLQllUS3BN?=
 =?utf-8?B?RS84ckpLWExMUXYwQXRlb3pHc3AzRkdlV0FQRmVKV0l6MWgvWlFNT0tVSFR2?=
 =?utf-8?B?U2R6NytESmJ3azZMb3lNdnpldnF1UjhENThrWERKY1l2WW5MR1VtRFlCK2xR?=
 =?utf-8?B?d2JhZGJ1SlZwZmJWcm9Td2w2Y2Ntazk2NS9CNUZBbWJTdUsyZTZwTVM2bDla?=
 =?utf-8?B?TWpobUFsaFVhbnh6YUNrSkFSMHBhSmdmcUZSWk16ektBUFFWMzA3TWlHbWxV?=
 =?utf-8?B?QkdqWFptRkhRY3Y1WVVaMDRxNEMvYmtreWZVdFI1ZVNSbXBtTmhGeVFpalNn?=
 =?utf-8?B?SDJVbnVDTGhQOWU2ekk4SVB1L1JZRlc2VGUwYmxSVis0OUpmb2N3WEZIaTk1?=
 =?utf-8?B?c1EzYlAyaW9mZmNDV0FWM2crazhqNm1jQmoxNldMV0o5aE9EY1RkNEVmK2xP?=
 =?utf-8?B?c3Y4Ym55VUYrYWp5YzFwaGM3S1hrc2pmTk1BazEyZlNFUHZyeFMwNUUrTzFn?=
 =?utf-8?B?MFRxVlFtMFFPQzBtOU9jL1E2K0MxaTJjUTJscGpWQnd6eEFIcWZDd3dsY1p1?=
 =?utf-8?B?cHVuWHF4UE43NHQ0NnJRNGVwbXdMbXhDcTJSRW9kYVMzcFkzMHg0WXh3akdv?=
 =?utf-8?B?NjFVZVlGb0p5SXJlZ1RDUmphdmExckJ3a3VraFpwSlFTOExjV0dVMVhlRHJU?=
 =?utf-8?B?aU9NeS9TcmlnU2NaNnlrY3FpSzBaWEtDaFo5MXB5ekN4bkFyN2tyTVgxVlJk?=
 =?utf-8?B?a2VtM0RSdUVEUTlFMmxCUG9rRmF4ZjRTcEJqZTJPZnpFdjVGb0xaZTQyMlh3?=
 =?utf-8?B?QzJHUE9MYWVhcFJ6b1F0Z1ltQkp2TVZtcTFhUkVEdDdKaW5LcEFlbVZVejR5?=
 =?utf-8?B?SjlwRStGTVkyR2kwUWtZSVgrV09MUUV1WTRLM3IrSEEzZXJMelVOL0NEdXQ5?=
 =?utf-8?B?OUI1RXRRQTVybStGZUVrWUN3TmkrOFpUcGduMzFRQ1dmL29CK05BQ1JMazk4?=
 =?utf-8?B?MEUrYjRqWXY0cENkUVJtanFGeWJ4Rjl5ZHpjU2FHaFJub2M2RUsyOHprUjNq?=
 =?utf-8?B?T3IxSE9zdkg3UkpFSEtPWTVHOUFzbnk0S25UdGhCSlhsR05McVJYMnBiTW9U?=
 =?utf-8?B?ajFUcUVYWTFMc2FKaENMTVZFbTVXTWxrTU9PL2VRS04ybm1TN29yZ1F4Y1Ar?=
 =?utf-8?B?dUpsM0loSjg4Yk91S2oyQkV6ZFpLaXJRTEhubm1jUTdRTzJFcGhGaGNuZW8r?=
 =?utf-8?B?TkNSU3NzWmhMN3lBWTdZaWt6VGZyRVR4MzFPSlJGSGs3RFVCY29VRmlmN0Za?=
 =?utf-8?B?T2t3bWZrRk9UcHVVRk9XT3lyTVBjOGg3aHMwZ0JzOUt4SDlVdFdqcHRoVGp4?=
 =?utf-8?B?bXl6b0FKbFFKK1djcFBaZ28yWVNyMHRtU2hCSkVPV1ZjUDZWWmVEbkE5VWVp?=
 =?utf-8?B?UTR0a1YxeEMwWmVkdFJGOFU2S1pScFBPSGdMUU1rYXdSa2tmQ0ZqSHdHRkw0?=
 =?utf-8?Q?io9Z9O2P0UZbWbMbAa8vdeBBt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a122a8-e9cd-4b0f-686d-08db8e6a67bb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 06:26:26.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI+apU5fvDfDXnR4Bok3DCIH+jMhmB+KuXIQiPqhWgy+uSBjnSnt33CFD8mFz/bDQcopoK2QQddJade/5LGvkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
X-Proofpoint-ORIG-GUID: NkvTnyA_E26ZDKcgooVJmbDmCn9jXzYZ
X-Proofpoint-GUID: 5Pb2Olc9XCUDv1qm9d5C6GYCL9347vt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=896 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307270057
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36R5Lohu030533
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 06:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104050


On 7/27/23 13:03, Khem Raj wrote:
> On Wed, Jul 26, 2023 at 9:36=E2=80=AFPM Yi Zhao <yi.zhao@eng.windriver.=
com> wrote:
>>
>> On 7/27/23 10:55, Mittal, Anuj wrote:
>>> On Thu, 2023-07-27 at 10:39 +0800, Yi Zhao wrote:
>>>> The vsomeip stack implements the http://some-ip.com/ (Scalable
>>>> service-Oriented MiddlewarE over IP (SOME/IP)) protocol.
>>>> The stack consists out of:
>>>>     a shared library for SOME/IP (libvsomeip3.so)
>>>>     a shared library for SOME/IP's configuration module
>>>>     (libvsomeip3-cfg.so)
>>>>     a shared library for SOME/IP's service discovery
>>>>     (libvsomeip3-sd.so)
>>>>     a shared library for SOME/IP's E2E protection module
>>>>     (libvsomeip3-e2e.so)
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>> V2 Change: fix build with nodistro
>>>>    .../0001-Fix-pkgconfig-dir-for-multilib.patch |    28 +
>>>>    ...e-configuration-files-to-etc-vsomeip.patch |    28 +
>>>>    .../0003-Do-not-build-external-gtest.patch    |    68 +
>>>>    .../vsomeip/0004-Support-boost-1.76.patch     | 14220
>>>> ++++++++++++++++
>>>>    ...upport-so-that-vsomeip3-will-compile.patch | 14216
>>>> +++++++++++++++
>>>>    .../vsomeip/0006-Support-boost-1.82.patch     |    32 +
>>>>    ...up-of-warnings-that-gcc-12.1.1-fired.patch |   298 +
>>>>    ...8-Do-not-specify-PIE-flag-explicitly.patch |    41 +
>>>>    .../vsomeip/vsomeip_3.1.20.3.bb               |    72 +
>>> Is there some reason why you are adding this recipe for an older
>>> version and then adding big backport patches instead of just taking a
>>> newer version?
>>
>> We found some regressions in the new release. So we decided to add thi=
s
>> old stable version and plan to upgrade it after the upstream fix.
> What is tentative timeline. I am inclined to wait for upstream fix and
> then get latest version


While I can't find a release schedule, I suppose it's in the next few=20
months.


//Yi

>
>>
>> Thanks,
>>
>> Yi
>>
>>
>>> Thanks,
>>>
>>> Anuj
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104047): https://lists.openembedded.org/g/openembe=
dded-devel/message/104047
>> Mute This Topic: https://lists.openembedded.org/mt/100384151/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

