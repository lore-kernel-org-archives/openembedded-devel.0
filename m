Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62467C4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 05:08:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5680.1672549715431753402
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 21:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=COruWBQ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03651cea20=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30158Yb4014032
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Jan 2023 05:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=E0vJdMNNIWCalToPDZipLy32IJ26TV9AhSzOSrejNbs=;
 b=COruWBQ5dxngOUD2dfrsyqspi13uz/dotMVPyNVgmiUCDc48XlCTMwBFMvJzFb7EL0aP
 nPzk2T9L5ch1r1n2nwiaEt6ZjpgM1nIqDXf4ZgUgnlGi4A3frR+up/S3dvwy/uA89vD0
 qhR2yAate2m4PumwytA3Ym/lbQ5jAsmiRZ14X3WlUHa8f8vdDkJL14C1rIpDPml/esoy
 33PD+rziJldKKkLJyHkgISeU026e0Al15WaLiJi7ENS7QnEGyE+sfEFQ6URyv4XD9X4W
 6jk2lb9bs/atOahVodvEsK2pazyBjccoJwlE9T5yWTm9rLyxAGH1S88HBHaAng8eLjwF Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2gg84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 05:08:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30158XVd014025
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Jan 2023 05:08:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2gg83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jan 2023 05:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTgyPF0P8/ThZPWtYLHy4Ao45Fb+ZD3kKa4RDwr3CENgZexJPUvh5B76pOzKao9sG1WN42PrQoAYePMwIJBh0dWHQ88jmqKIR9OR+0j4T0EYpXlgakGvCdpp9wILfjL0SEdEzQUrOnRbbG+eH9+ccIYSlQb37ltG3+cJoLmjf415utE6JFuOFvc6/jRBGfTS2umN8N0aiMv3tOm1y7VzNG+GZD3euHUrGEk4wlXNDoBXoxVyJz1Mucu/sGrk/tm0FU2+8YAaqY1cD1Vl74AZ9X0uskqdO0Zo+kLmCzcqY4Kjk30Qa8JDSZH683ZAteAyLNH7TPcyA1Gv7pjZgafWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0vJdMNNIWCalToPDZipLy32IJ26TV9AhSzOSrejNbs=;
 b=WNuHcyM0PrS3DM876wkIaOYXm+sv5mRZELvfhhgkiPqN5mmFb7Ng7qX3KJqIg07gwc9jWjVy+vTLTBLbqyiK4u1Yla0gHEHpaFje5VydwWe5khmUOFWJEuXE3gnQdDXMcBUcPP4XF3meL510Dyq0xaON/mw5UGkjHtlPdiRnyxdshSfqR4UpVSDy8i3wLWEegefTtHM8L6LPQ49/4ZLZxZCexni/qsDK1Yilfl27zedVDpwaMDN4PPZEDZ+7cdUG4t7FpU1I+/Jnh3eGWhLwhPndFu/FDCSSNZG0/DUBdeq8GfjY2bOgx79P1nXePLr0GtwM5pbs+3z1sP6FVhWj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sun, 1 Jan
 2023 05:08:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%4]) with mapi id 15.20.5944.019; Sun, 1 Jan 2023
 05:08:29 +0000
Message-ID: <65b56200-86df-8ab4-93da-74f5dd7dc26d@windriver.com>
Date: Sun, 1 Jan 2023 13:08:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH] krb5: upgrade 1.17.2 -> 1.20.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20221230014607.703918-1-yi.zhao@windriver.com>
 <CAMKF1sqYXMgszgQDALtrvLCXrhHJex3111VeM_oRRg9g8_np3Q@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1sqYXMgszgQDALtrvLCXrhHJex3111VeM_oRRg9g8_np3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: a43c4e17-b6fa-4df8-26f0-08daebb638c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3cuQHv0QUdJrWKNxtabRbJWSkQcDLA2kZ2TLsPLozRzbFM86M1hvftr14LRyeVsLJA7vNTtHofAT0ei9Oc03zqbXvqGGzD1t/Y99fcMue39CMd5IGK6RAnY+B11hcOqgNR4D0Y7XSfnsXiUBeHupSgkNdvlB41mM65K61v7zyvCEea9pYlDgV7XG6wWh6EFm1qSYCUmnNuMGWs+2BHHvefHo77NO73/hLlkXCKDX6zol5N49Iz6K3E00KBIdxpNiQOx8z49i4BILZPKCxow224nHUIN2iY33/QRQHViA+ZFsoN1x4eF7QxC+2wo01FvSI3TvknC00Yh/0ZyR7HCEO1VxkoQBrotPh7HXkNOlGhX4B7uzFTHnM85PJ8t37Q51li3QJG5HcbRb/uXdxaYBYwGTFMkvYNkVMqqd7ab/vENYswWyWwH1oGbuEZDXjGjW6m7EcWqHgbbIgBS5JVdiXGoM8kCeF39ykhfBYLOEpaxbyuivoTdR8igCSGreij/0V17X8wAj6LBVed6Rbsn0edBgf/TcldaQLtYdtDWC+gE7WEaluENh9AVOoJuwflWC2zndEgsAeNtIvqyPxzvsBlMUtGz5hjQXQOghbtQvu+PeISgM3dXJIEn6zfXxD3lfQHj/Fotv5ngPcYMRR01iZXL/WuUkygRu8eDqsqibi0Blp5NoMDP10mm1T4vViv7J/3ZCWnSfnKoWEZb/tzGChjhOWw5WanvJ+SUf5Cq6vZyEfxAYyGmoYNgOhL+/iKESMxS4UKSHKwfIJhbMHEV7idtSulXl+5qxJWODrS6YwyrM1op7DwR1iXykZg+Wa33+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39830400003)(396003)(136003)(451199015)(186003)(26005)(6512007)(83380400001)(2616005)(31696002)(86362001)(36756003)(38100700002)(44832011)(30864003)(31686004)(316002)(110136005)(2906002)(66899015)(4326008)(8936002)(41300700001)(5660300002)(66946007)(8676002)(66476007)(66556008)(478600001)(6666004)(966005)(6486002)(53546011)(6506007)(22166003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVV4QWw5RkNmNEkzcUNlWjV5YkRJdzFlelpOc1g1dVBUQks0bkVlbHBadHQ3?=
 =?utf-8?B?QVd1WXZzVHVxbmJScVV4VGpReVBXL2pFQlQ3M21obTQ3ZGdaRkN5L3l1ZXh1?=
 =?utf-8?B?MTRtYjZkWFQwUTQ3cWUwQVltYklOVlJiZ0ZIYUdCU1JnMFJaRUIxVDZuam1J?=
 =?utf-8?B?SXhxbk44eWVXQlI4czJhcGVVU3NURGg2bzdRbHF0WU94eEoxVktsR1NtK3Ax?=
 =?utf-8?B?U1JMM1FteEJBNXdEam5TTHAzZkk3c3J3U09BdTZCSmtlWWtma1N5VVcrTlFp?=
 =?utf-8?B?ZjZDRkF2ZExrbFR3NGtFRzNOMmd1UXlJMUlCZVIwOVdqaUFHYnE0bE9YSmJl?=
 =?utf-8?B?SGlqbHJJWHB3clU5b1l0MHRnTFcrWTB1QllsRzl0aldrYUVaVHhlMUxUbnl3?=
 =?utf-8?B?QmFqVDFKUlV1bXorQlByOGVLbi9aSmZqT1R0ZjJBUWM1V016QnM3RUl5S04x?=
 =?utf-8?B?eGxSWnkyc0ZTWW1rZzA5ZzJCVFJCOHFUVUtzSDBUclA4Q1pTNHhMaFVGZUd4?=
 =?utf-8?B?Uk82eG96MHpqQzl1L3JDQVZqK3R5OGhjV2xnaERLdVkzaE95ME9icnI5M2d5?=
 =?utf-8?B?V1pxMFRMMDVVb0dYNHpOY250RGVzTjVZeUlyeVVlUWM5U0VSQjhuVFZHendz?=
 =?utf-8?B?Q3RLMEx0TW5hTUkxTW8rNElpa3BBdE8yM3VmNEtwMW9JUzFkTlkrckZWZ0pW?=
 =?utf-8?B?Q1dPKzZtRmFadkNORWxRWXFYZVRhOStNQnovb2NNRFJoTkkzeXFHbGczMzQz?=
 =?utf-8?B?OVZnSEs2NDJSNWpqUFRuSmgrY2oyWVNvVmN2alhFdm1PV1JueFBob2hCYmVX?=
 =?utf-8?B?TzJkbWlvWGIzOWdLVGhHMGpkNnd3YWZhcGRCVi9GZ0lWMDcrRUYra2pURnlX?=
 =?utf-8?B?V1daNU5VRmZjbGYrQW9MZFFUUk9xc3pTWVNnL21mSHByUE9ZYkdSVTk2RSs5?=
 =?utf-8?B?NTVMSE4rdjlrTy9GN0ZBVWxKOVRyVUJ3c2l5b2hFRzNzVWJqL21CMnl0bnZj?=
 =?utf-8?B?S0huLzdhV2ZFclRrZ295ejk0ZkFBQWMyRXF2NVgySHdJRGE4N05VTml3OWVF?=
 =?utf-8?B?TWQrRG5ha1FPdUhBdFptMjV5b0NENldUZWF6TXZCYyszUVoyQW9UenBaZ3Vr?=
 =?utf-8?B?dXBkMnF2U3RyU29XQWNlb0ljMk85QUNsaEFiNjU1TGhEdUdLeCs1Wm8rQkQ3?=
 =?utf-8?B?d2p4aHMvY0VwSGpKalBwVDE5a2tDMDdqSUJ1ZHR6NVpzWGZDeEx4THNuaDZE?=
 =?utf-8?B?Z1lMYzhLekxvRWx5dHQwbS9OMDdFTXVpbWpVVG1YUHdBTEJCWlI4Wnc5ZWNX?=
 =?utf-8?B?K1VlV1Q1RUpvMTB4eEpPNUNJaEFOcmxpZWhMTkFibjMxRGV2RUhNaVRBTWw2?=
 =?utf-8?B?TERyV0Z5YmdhY1FLbWczczRyRTRnMzBiR1poSzBaSGFMMmpmYnV3UHArYmNZ?=
 =?utf-8?B?Nk1BanV1a3VrQXJDcEkxK3E0ckNzeTBxRWNnUGU4RnAyOFZkQk5URDJDZkwz?=
 =?utf-8?B?TDdSZVVQeWJJclVpcWROWVg0MVpxQzNETlhYOUN0Y1BldkhTUDdiZzY0cmRW?=
 =?utf-8?B?YXlqWEhMeHlQT3Y5T0lBbEtMR0pYZTdSN042anBhYjZDSTUyZVo5czlLemd0?=
 =?utf-8?B?T0RmZEFXcjZZWGtuQW5XQkhpMHRJL052c1BLbmJVUWdMK253U1VJWEY2WW9Y?=
 =?utf-8?B?enNNcmYrdk9lZ1c0TDV6bDZzZUhIQzB4Qjl2TnJ1VDViOFBJOEJmT0Nadk5O?=
 =?utf-8?B?cE9xcWluZUlQV1FkVVc4VkJKT3UzVEE2MURXQUJFTmdCeGJRMURJYzRtYXhh?=
 =?utf-8?B?eHJSVG5OeGVTUGsxY0w2VTVSWWNLZ2xLVWdtOU1oSEdlV2JoRUQwODBVbHBQ?=
 =?utf-8?B?VHZielhpMktMd2h5SGowK2ZtSWR4Q3Y2L0lUM3QwQWl4NWdQcGZ4UHZLMHp1?=
 =?utf-8?B?a2JNdnF2clBnQVRzNUF4S2xpb2FiZXdSNjJ6VE5TbEFjQndHeldmSFh3WXFY?=
 =?utf-8?B?MkdkckJvdy9wOGNYbG80T08zRyt5UzdONVJ2RldoRElIN2NOa1RpMmZhbXYv?=
 =?utf-8?B?djAzQVVsYVNGSkZBTkxmdWM1d2JqeFdyaUxENm1sZUwxeHNDNm5Ea21Ucm95?=
 =?utf-8?Q?fUnAMfKx2+CKx65EbAFlinLOG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43c4e17-b6fa-4df8-26f0-08daebb638c2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 05:08:29.6418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERHVj2gdhFqgJ6ZrCdKdX706n1AUCWlwTq8XaVfc9yHxPvUrTn4eCwXq6fbUR0AzagdaW78qMbefDL5D66h95w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: nPMbdtFzYaH3ImZKtVHRCz0wUcEoTqNs
X-Proofpoint-GUID: wDZoM5vWz39k4i7HuQ2nqVPu9_6G0xKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-31_16,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301010046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 05:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100329


On 12/31/22 04:49, Khem Raj wrote:
> This regresses samba [1] [2]. Please look into that as well and
> propose a fix along with this.
>
> [1] https://errors.yoctoproject.org/Errors/Details/685903/
> [2] https://errors.yoctoproject.org/Errors/Details/685873/


Thanks. I will send a patch to upgrade samba.


//Yi

>
> On Thu, Dec 29, 2022 at 5:46 PM Yi Zhao <yi.zhao@eng.windriver.com> wrote:
>> Release Notes:
>> https://web.mit.edu/kerberos/krb5-1.20/krb5-1.20.1.html
>>
>> License-Update: Update AES algorithm copyright [1]
>>                  Update copyright years [2]
>>
>> [1] https://github.com/krb5/krb5/commit/cb5f190056ef4d123c5fe5d4923982b830288438
>> [2] https://github.com/krb5/krb5/commit/f1535bf6b47e8dc03d69fcfb98e798546ff7c272
>>
>> * Update PACKAGECONFIG[keyutils] and drop the local patch.
>> * Drop backport CVE patches.
>> * Inherit pkgconfig bbclass to find com_err library correctly.
>> * Drop --without-tcl option as it has been removed upstream.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...ameter-to-disable-keyutils-detection.patch |  32 -----
>>   .../krb5/krb5/CVE-2021-36222.patch            | 121 ------------------
>>   .../krb5/krb5/CVE-2021-37750.patch            |  53 --------
>>   .../krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb}   |  19 ++-
>>   4 files changed, 9 insertions(+), 216 deletions(-)
>>   delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
>>   delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>>   delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
>>   rename meta-oe/recipes-connectivity/krb5/{krb5_1.17.2.bb => krb5_1.20.1.bb} (93%)
>>
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
>> deleted file mode 100644
>> index cbd5d71fd..000000000
>> --- a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From a9e4057bfda190ad365b503af058b460ab8c7616 Mon Sep 17 00:00:00 2001
>> -From: Martin Jansa <Martin.Jansa@gmail.com>
>> -Date: Tue, 1 Oct 2013 22:22:57 +0200
>> -Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
>> -
>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> -
>> ----
>> - aclocal.m4 | 4 ++++
>> - 1 file changed, 4 insertions(+)
>> -
>> -diff --git a/aclocal.m4 b/aclocal.m4
>> -index d6d1279..80ce604 100644
>> ---- a/aclocal.m4
>> -+++ b/aclocal.m4
>> -@@ -1679,12 +1679,16 @@ fi
>> - dnl
>> - dnl If libkeyutils exists (on Linux) include it and use keyring ccache
>> - AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
>> -+AC_ARG_ENABLE([keyutils],
>> -+AC_HELP_STRING([--disable-keyutils],don't enable using keyutils for keyring ccache @<:@enabled@:>@), , enable_keyutils=yes)
>> -+if test "$enable_keyutils" = yes; then
>> -   AC_CHECK_HEADERS([keyutils.h],
>> -     AC_CHECK_LIB(keyutils, add_key,
>> -       [dnl Pre-reqs were found
>> -        AC_DEFINE(USE_KEYRING_CCACHE, 1, [Define if the keyring ccache should be enabled])
>> -        LIBS="-lkeyutils $LIBS"
>> -       ]))
>> -+fi
>> - ])dnl
>> - dnl
>> - dnl If libkeyutils supports persistent keyrings, use them
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>> deleted file mode 100644
>> index fee6e64c1..000000000
>> --- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
>> +++ /dev/null
>> @@ -1,121 +0,0 @@
>> -From fc98f520caefff2e5ee9a0026fdf5109944b3562 Mon Sep 17 00:00:00 2001
>> -From: Joseph Sutton <josephsutton@catalyst.net.nz>
>> -Date: Wed, 7 Jul 2021 11:47:44 +1200
>> -Subject: [PATCH] Fix KDC null deref on bad encrypted challenge
>> -
>> -The function ec_verify() in src/kdc/kdc_preauth_ec.c contains a check
>> -to avoid further processing if the armor key is NULL.  However, this
>> -check is bypassed by a call to k5memdup0() which overwrites retval
>> -with 0 if the allocation succeeds.  If the armor key is NULL, a call
>> -to krb5_c_fx_cf2_simple() will then dereference it, resulting in a
>> -crash.  Add a check before the k5memdup0() call to avoid overwriting
>> -retval.
>> -
>> -CVE-2021-36222:
>> -
>> -In MIT krb5 releases 1.16 and later, an unauthenticated attacker can
>> -cause a null dereference in the KDC by sending a request containing a
>> -PA-ENCRYPTED-CHALLENGE padata element without using FAST.
>> -
>> -[ghudson@mit.edu: trimmed patch; added test case; edited commit
>> -message]
>> -
>> -ticket: 9007 (new)
>> -tags: pullup
>> -target_version: 1.19-next
>> -target_version: 1.18-next
>> -
>> -CVE: CVE-2021-36222
>> -
>> -Upstream-Status: Backport
>> -[https://github.com/krb5/krb5/commit/fc98f520caefff2e5ee9a0026fdf5109944b3562]
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ----
>> - src/kdc/kdc_preauth_ec.c      |  3 ++-
>> - src/tests/Makefile.in         |  1 +
>> - src/tests/t_cve-2021-36222.py | 46 +++++++++++++++++++++++++++++++++++
>> - 3 files changed, 49 insertions(+), 1 deletion(-)
>> - create mode 100644 src/tests/t_cve-2021-36222.py
>> -
>> -diff --git a/src/kdc/kdc_preauth_ec.c b/src/kdc/kdc_preauth_ec.c
>> -index 7e636b3f9..43a9902cc 100644
>> ---- a/src/kdc/kdc_preauth_ec.c
>> -+++ b/src/kdc/kdc_preauth_ec.c
>> -@@ -87,7 +87,8 @@ ec_verify(krb5_context context, krb5_data *req_pkt, krb5_kdc_req *request,
>> -     }
>> -
>> -     /* Check for a configured FAST ec auth indicator. */
>> --    realmstr = k5memdup0(realm.data, realm.length, &retval);
>> -+    if (retval == 0)
>> -+        realmstr = k5memdup0(realm.data, realm.length, &retval);
>> -     if (realmstr != NULL)
>> -         retval = profile_get_string(context->profile, KRB5_CONF_REALMS,
>> -                                     realmstr,
>> -diff --git a/src/tests/Makefile.in b/src/tests/Makefile.in
>> -index fc6fcc0c3..1a1938306 100644
>> ---- a/src/tests/Makefile.in
>> -+++ b/src/tests/Makefile.in
>> -@@ -166,6 +166,7 @@ check-pytests: unlockiter s4u2self
>> -       $(RUNPYTEST) $(srcdir)/t_cve-2012-1015.py $(PYTESTFLAGS)
>> -       $(RUNPYTEST) $(srcdir)/t_cve-2013-1416.py $(PYTESTFLAGS)
>> -       $(RUNPYTEST) $(srcdir)/t_cve-2013-1417.py $(PYTESTFLAGS)
>> -+      $(RUNPYTEST) $(srcdir)/t_cve-2021-36222.py $(PYTESTFLAGS)
>> -       $(RM) au.log
>> -       $(RUNPYTEST) $(srcdir)/t_audit.py $(PYTESTFLAGS)
>> -       $(RUNPYTEST) $(srcdir)/jsonwalker.py -d $(srcdir)/au_dict.json \
>> -diff --git a/src/tests/t_cve-2021-36222.py b/src/tests/t_cve-2021-36222.py
>> -new file mode 100644
>> -index 000000000..57e04993b
>> ---- /dev/null
>> -+++ b/src/tests/t_cve-2021-36222.py
>> -@@ -0,0 +1,46 @@
>> -+import socket
>> -+from k5test import *
>> -+
>> -+realm = K5Realm()
>> -+
>> -+# CVE-2021-36222 KDC null dereference on encrypted challenge preauth
>> -+# without FAST
>> -+
>> -+s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
>> -+a = (hostname, realm.portbase)
>> -+
>> -+m = ('6A81A0' '30819D'          # [APPLICATION 10] SEQUENCE
>> -+     'A103' '0201' '05'         #  [1] pvno = 5
>> -+     'A203' '0201' '0A'         #  [2] msg-type = 10
>> -+     'A30E' '300C'              #  [3] padata = SEQUENCE OF
>> -+     '300A'                     #   SEQUENCE
>> -+     'A104' '0202' '008A'       #    [1] padata-type = PA-ENCRYPTED-CHALLENGE
>> -+     'A202' '0400'              #    [2] padata-value = ""
>> -+     'A48180' '307E'            #  [4] req-body = SEQUENCE
>> -+     'A007' '0305' '0000000000' #   [0] kdc-options = 0
>> -+     'A120' '301E'              #   [1] cname = SEQUENCE
>> -+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
>> -+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
>> -+     '1B06' '6B7262746774'      #     krbtgt
>> -+     '1B0B' '4B5242544553542E434F4D'
>> -+                                #     KRBTEST.COM
>> -+     'A20D' '1B0B' '4B5242544553542E434F4D'
>> -+                                #   [2] realm = KRBTEST.COM
>> -+     'A320' '301E'              #   [3] sname = SEQUENCE
>> -+     'A003' '0201' '01'         #    [0] name-type = NT-PRINCIPAL
>> -+     'A117' '3015'              #    [1] name-string = SEQUENCE-OF
>> -+     '1B06' '6B7262746774'      #     krbtgt
>> -+     '1B0B' '4B5242544553542E434F4D'
>> -+                                #     KRBTEST.COM
>> -+     'A511' '180F' '31393934303631303036303331375A'
>> -+                                #   [5] till = 19940610060317Z
>> -+     'A703' '0201' '00'         #   [7] nonce = 0
>> -+     'A808' '3006'              #   [8] etype = SEQUENCE OF
>> -+     '020112' '020111')         #    aes256-cts aes128-cts
>> -+
>> -+s.sendto(bytes.fromhex(m), a)
>> -+
>> -+# Make sure kinit still works.
>> -+realm.kinit(realm.user_princ, password('user'))
>> -+
>> -+success('CVE-2021-36222 regression test')
>> ---
>> -2.25.1
>> -
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
>> deleted file mode 100644
>> index c67bca32e..000000000
>> --- a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -From b3999be7ab59a5af4b2f1042ce0d6b03ecb17d4e Mon Sep 17 00:00:00 2001
>> -From: Greg Hudson <ghudson@mit.edu>
>> -Date: Tue, 3 Aug 2021 01:15:27 -0400
>> -Subject: [PATCH] Fix KDC null deref on TGS inner body null server
>> -
>> -After the KDC decodes a FAST inner body, it does not check for a null
>> -server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
>> -would typically result in an error from krb5_unparse_name(), but with
>> -the addition of get_local_tgt() it results in a null dereference.  Add
>> -a null check.
>> -
>> -Reported by Joseph Sutton of Catalyst.
>> -
>> -CVE-2021-37750:
>> -
>> -In MIT krb5 releases 1.14 and later, an authenticated attacker can
>> -cause a null dereference in the KDC by sending a FAST TGS request with
>> -no server field.
>> -
>> -ticket: 9008 (new)
>> -tags: pullup
>> -target_version: 1.19-next
>> -target_version: 1.18-next
>> -
>> -CVE: CVE-2021-37750
>> -
>> -Upstream-Status: Backport
>> -[https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
>> -
>> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ----
>> - src/kdc/do_tgs_req.c | 5 +++++
>> - 1 file changed, 5 insertions(+)
>> -
>> -diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
>> -index 587342a..622b48f 100644
>> ---- a/src/kdc/do_tgs_req.c
>> -+++ b/src/kdc/do_tgs_req.c
>> -@@ -201,6 +201,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
>> -         status = "FIND_FAST";
>> -         goto cleanup;
>> -     }
>> -+    if (sprinc == NULL) {
>> -+        status = "NULL_SERVER";
>> -+        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
>> -+        goto cleanup;
>> -+    }
>> -
>> -     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
>> -                             &local_tgt, &local_tgt_storage);
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
>> similarity index 93%
>> rename from meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
>> rename to meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
>> index 6e0b2fdac..2221000e3 100644
>> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
>> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
>> @@ -14,14 +14,12 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
>>   HOMEPAGE = "http://web.mit.edu/Kerberos/"
>>   SECTION = "console/network"
>>   LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=dd4d0ad4c5e98abb58aa0d312f276791"
>> -DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
>> +LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d31018dba5a0ef195eb426a1e61f02e"
>>
>> -inherit autotools-brokensep binconfig perlnative systemd update-rc.d
>> +inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
>>
>>   SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>>   SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
>> -           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
>>              file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
>>              file://crosscompile_nm.patch \
>>              file://etc/init.d/krb5-kdc \
>> @@ -30,26 +28,26 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
>>              file://etc/default/krb5-admin-server \
>>              file://krb5-kdc.service \
>>              file://krb5-admin-server.service \
>> -           file://CVE-2021-36222.patch;striplevel=2 \
>> -           file://CVE-2021-37750.patch;striplevel=2 \
>>   "
>> -SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
>> -SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
>> +SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
>> +SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
>>
>>   CVE_PRODUCT = "kerberos"
>>   CVE_VERSION = "5-${PV}"
>>
>>   S = "${WORKDIR}/${BP}/src"
>>
>> +DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
>> +
>>   PACKAGECONFIG ??= "pkinit"
>>   PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>>   PACKAGECONFIG[openssl] = "--with-crypto-impl=openssl,,openssl"
>> -PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
>> +PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils"
>>   PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
>>   PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>>   PACKAGECONFIG[pkinit] = "--enable-pkinit, --disable-pkinit"
>>
>> -EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
>> +EXTRA_OECONF += "--with-system-et --disable-rpath"
>>   CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
>>                     ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
>>                     ac_cv_file__etc_TIMEZONE=no"
>> @@ -85,6 +83,7 @@ do_install:append() {
>>
>>           echo "RUN_KADMIND=true" >> ${D}/${sysconfdir}/default/krb5-admin-server
>>       fi
>> +
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>>           install -d ${D}${sysconfdir}/tmpfiles.d
>>           echo "d /run/krb5kdc - - - -" \
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100305): https://lists.openembedded.org/g/openembedded-devel/message/100305
>> Mute This Topic: https://lists.openembedded.org/mt/95947642/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

