Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147D7C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 21:08:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2415.1667077695662251203
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lqMOGyl7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83011fc69f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29TL8FGl006864
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 14:08:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=DDcuTUuBLYHCwb6p3DRk4CvNBjG25ESIfkjzcgRe664=;
 b=lqMOGyl7q9fRNRqbw88pMhslCz3Rq7othclrUonJvpJcTtyraIG3SAe8ccG4MsN1052t
 2aYUNbUzHM6nsY7vzq8JI+ep+q73ABGcH84R80bkD1DzvTtZ0SP32VOSl2+jA9TF9Bxi
 rZi6IfLJv8jTwLiGXb6A/zrbcRIO0y79T2drwpDoSCsoeOe/8W9/PWykq/KmNrgCl7hT
 elZNZvPEk8Hp8actUtU9c6el/QvjJXGRXOotABc2hhBHa7GFexOovVntlVquvHaJ/Ph5
 HtWXpkRnTVeokUIhCYJn3hW3x2ohXuJy2YWw/6fmQ9GSE8pT06YuQPH0h+VADPm0SB9+ ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgyf3rbve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 14:08:15 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29TL8ESE006766
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 14:08:14 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgyf3rbvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Oct 2022 14:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQNx6oBfZ603Kcs//GAi1hT+oOTgzcPoeGCBHND0DE3Q/EUiEE1DDEn6mfdC2qy8bwpYa+oT3fBaQ9VUl9n7+Xqy96nnJvh60YeMYL1dVUzA5UxJaiSzI2LBV062sz6NMTuIkp5LdD7Csh8UQYsT5nitcYUMlfOYjpJc85xEmnccbehcC8bcqmaeoeogSlB49ahZmK3fMgoClpiy2boyzFiADg9RPdbXnFkXGPVoRAMkEBH1UMhtPQJ+6JMNRAOqbMM/bq8SyYttVW7ofqQqoNLgsNM+77qbsURowQfQTrvAnjfw6vpoPJeMTb4VFKWMMrrkJ3EBY6rcMlYtIf4o0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDcuTUuBLYHCwb6p3DRk4CvNBjG25ESIfkjzcgRe664=;
 b=fzmXcVZzGY+HOM4GOwngq5ESBLAK3zPbPZOGhIM6eLlF565h45rVtnMIDGtZaQFB5t6GDRjNj2EgOrPzKOdnqSlRJrlwn3lVOCqmTwb7Ye/QYJTAj880BHcMTt/rg3AQPQt6ckZiboHtT/r0cmFlZr3Wy3KkOc0/dVLBSaFZVB1olzWsXQXumtXCBUeZ7VfDVFrewhbCzmUHZTjBqZTOjQaxkJ/OhyXxrZ36m0oDWaTipFqvIkzciJuJwGGhmoHbiFIOLO3i/xubdZKN7927JsxzXnAc8URe47DOfFEUv3MUWUZJeJLzF9/AJXWoMV7K2KAltW/86dMxeUf+i8adeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 21:08:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.015; Sat, 29 Oct 2022
 21:08:11 +0000
Content-Type: multipart/alternative;
 boundary="------------6NJOXRzG90cbSMChjZ300i0P"
Message-ID: <7f680b57-19b4-d43e-df23-e774b259416e@windriver.com>
Date: Sat, 29 Oct 2022 17:08:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-oe][PATCH] grpc: Update to 1.50.x release
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20221018173118.784429-1-raj.khem@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221018173118.784429-1-raj.khem@gmail.com>
X-ClientProxiedBy: BYAPR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:a03:60::33) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd2df74-6744-4180-aae6-08dab9f1afa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6b9c5aAPScfyZO/hUFLLaEEzBSIT5oRCsHTS/wOs+v7I7mjq5hMeRKPSesLdGht7EkcQd+QmX/Vns6DR82VAyTBqtbZYoK4DGHAhpmWOQULkU4ZRIAikE0DPXyYmBzG8gQo6YPJfIDKRTHJlSmhWkxCExlGnbiBzX8RSsMDM8f6VJ6womwLDMsg0YDovVlAcw+4Mk48C4k9Aq6tYus54qGznSjFBCQ8To1kmBiZ38Xfc7Nvu+nDGFxIl3YmcnK0GfJrCBNk/nBeCNs3QsNZvzXm1Rrvv8bZcUYHZGug5lU1AXlYjnZhwBVfeoT1+RNbPjLtJWyAANaaSHKHeb/e/IGCorzH0yvSrGHirV/c9z7zbiel42WDvTuKmCWZyKGMHAFTAclyipJh+s8JFk7PL6/8pRaVsFTM46WrDgMHWQSW4H6d7WCURTO6ypmZ7G39r//Gh6Oqg3xnkq+Qc2JtmJ8ta3HK4N1jOmjt/h1gFZEPbJu6gyuuWSnVZZpxOi/kKRGemlxqWttmJkV2XgdeesknC9czHO7oDr2nTWronFDcXOmWpkHXI5SdTWUm2PCOkAMCINJWRcy2EjYuBvZ/kMTG7luMk2ftbRiFuU90z7FGkNFzPq/ZzV+edVBCCoc8WrIRVqd7xy+nm+JaoCCNER4ME52Tqsce+UChcr/hHvVWHHEYsWRePNxRj+THKTYtHwCRaBXTKeAK9qwUNCNl9Git+e1PcnaR73kTYHyOLU7mc8dQPgJ7Rrz1K4zfuSn2UcpNs10BVopW/2ukU2YTG/9EmuW+rBOYp7+4SNWVpvy+XaHzAOwRM5/sXX5t6csqbWmWxh3lpLgaPDClsXRg9m0lnahx/p4b2zxQQPWmKUvyPoIMpe7DyFnzKZTtI/mPL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(66899015)(31696002)(36756003)(86362001)(31686004)(38100700002)(166002)(2906002)(83380400001)(4001150100001)(15650500001)(53546011)(478600001)(6506007)(6512007)(6666004)(26005)(2616005)(186003)(33964004)(316002)(6486002)(966005)(66476007)(8936002)(41300700001)(66946007)(66556008)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czBQV0Y3VVdScHhDcmdlZVN6NWhOWjJxMVcycFYzOHpCTms0aEtpWGFOMW85?=
 =?utf-8?B?WE5reE51L0xVazk1ME5VVS91TEdsTW5xZE1sQ2pxMzJ0OWFzQzVaSFNGaHlm?=
 =?utf-8?B?MUZXaVBaVGNIdktydXFiOVRpcmVrYWxPN0Y1MW14bVJjWTh2TjRYUnRHc1Bi?=
 =?utf-8?B?OHNyU2JDM0xaV1c1QTJ5TGdwbjQvRXRhN0JhRWZQVkhSdU9sdk5OdS9WNFVN?=
 =?utf-8?B?RGRweElzYkttVWs2T1JxQlU2UjA3TGJQZXpMdzd5SWt6azBlL2ZmOEc0YWhi?=
 =?utf-8?B?Y21sRkRqZ0ZtdFVCcTRQbFIycitnQjUwMzdySFRQVmt6YzFzeWg1bUxaRk1Z?=
 =?utf-8?B?dWRaejVrcm1DclMvUTlPU29SZE9BYy8xR2wxSC8wdFNRNlVQMFkxT0xtSE9K?=
 =?utf-8?B?TkdYUG5mVEo2ZFV4WEVKY1BJd3d1Y2l2TjJpZnhGMC85Uk1FQ3NmVyt6R2NI?=
 =?utf-8?B?ZGszaC9EaGx4bWNtaFYveFNJdE43UGN2OEtGbFhhRUlwTnBWMytXUmFhMTJV?=
 =?utf-8?B?ME9tTHNiUDdFWG9lbjVOUm9hV0w1bUN6TjJMSWxBZkRobE15KzlxbWdMWnFU?=
 =?utf-8?B?UG5wNS9IUXB4YVE5dExhcXFsemN0RjFtWFdmNGRxMWNqSU1zekJXZGQxZDBP?=
 =?utf-8?B?OVNpaU9kV0pySzB6Y0RNc0FDKzBwa3J2NlIxWUpCTWFvelovZnNOL3p6K1ly?=
 =?utf-8?B?b2Y4Z0lQWU5SZ01ZbnFnQm1LNUdOWlo1VWtuakFKdCt0U0EyblpNUkJ2Mlk5?=
 =?utf-8?B?OHlIRjlUbmorbFlXNjljVmRtVlBReEJoNnFJQkh3eGNZcVRuSlZDWlo5WkRi?=
 =?utf-8?B?MUZyT1RWVHBDMStwakJVU0ZrV3gzQWl3S1lrdVhsNVYzSG8xWnplUnZRY3Zt?=
 =?utf-8?B?cjIzYUtwbUdneUdIYVk5SjNxYjZIdVpONHhMaEhRcmhscEJhbkllYTdKSERW?=
 =?utf-8?B?aFVtUW5EV1NzejRFUmxaQVBlVFhOVkxFQmJiK2tIZS9UbjJFZ1NjZmRZdXE1?=
 =?utf-8?B?dUFyTXVZSnhOMlhDZFJrbU56cjZYS0tIeGx4VjI3dG5ndUlEUVRlZVFEUlN1?=
 =?utf-8?B?KzJaZEVFRWxFT2JpbCtlM0dFODdOVHlNcVlidnRacmMxSnlXc3ZuanVMVi94?=
 =?utf-8?B?UC9KSVViWUgyZ2g4YjVxRjZWdGxldUNlOTdzU05FOVlCdFR0ak5lWGxWU1dY?=
 =?utf-8?B?cVFtQ1BlRnpiUnBuWS9jV05oUmNxUlF4ck0vZFlsU3BtVmFVWWI2ODcvUDRZ?=
 =?utf-8?B?UjFpWFc0UWFlT0JLNFZCcHNJQUVlZm5mckVhakIyVkV2Z3F2dDZqTmc3dzNL?=
 =?utf-8?B?dmg1T2E3am5zN2NrUTNQRkVSYTYzd0RRNExtaDlWMXZVUE0rLzZvVjRiVFI3?=
 =?utf-8?B?Z09zSHI5MmhnZzhEVnRXd2VtSk13d3VYQkJCUm85NzQvZjliS05TeDhiRjha?=
 =?utf-8?B?T016SDZNY0JiLzd1TVljMnNGR1lHVzI0SjJBSzcrWGl6Mml1QkhzaUc4UVZ3?=
 =?utf-8?B?M2dEV2FEcmFraHJKNE04VGo3UGJkUHNISjEwREdGSldRcCt6aXRwU1JNem9K?=
 =?utf-8?B?bjFxd3I5QVNuMjA3MHU4aUZLYXVxZEhqc0hvOEQ3MUV3RmUydmsyZmdhYkNH?=
 =?utf-8?B?N2QxWkRDTGVNMWZYVFd4M1RjRzQ0UWtyeTRGdlRXdENvaHoyMkR6Y0tUMTdT?=
 =?utf-8?B?MnNhd3ExUEdOb09GSWxvZUt3TG16S1ZvL2VWSUxnV01LVGcwTTM0M3pxL2NT?=
 =?utf-8?B?Kzl5OE5US1lMSE5IOHpVbHR5dEJZVDRtNGR2blNsODZTSCs3eldWY29XSThK?=
 =?utf-8?B?TXBsU2VJQmk3Wi9DRXlwNzZjMW9OSGNhR2R5UDczOFVDTFJWZ2lIMVJDUUhw?=
 =?utf-8?B?V202S2ZSVlFoZ0YrWCtDSDc0RE9MUDZWQmpuYXRoc3RwS2pzY0k0bnZlQjRt?=
 =?utf-8?B?TXBJTnNrUmlGVTB4WFVFRzlzOEs1ZllpYS9lblVSSWdjYk0xaGdJbExzRkhk?=
 =?utf-8?B?MWNHREg3RG51M0pXSXVOc21oWnpweURmNFhxS3JPbThjUUE4VlB6WnBkVzcr?=
 =?utf-8?B?MWo1WlhYRTd0cVhWTDJTWEVQdFQwWi9qbG5JV3R4dTUwUnI0MWpicmNJVVc2?=
 =?utf-8?B?VlBnUmtmYXFZbW04YmNKVjRTamo3OGRHSHl0OStwY0s1UHBCTC9ERTc2eUZv?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd2df74-6744-4180-aae6-08dab9f1afa5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 21:08:11.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v492QUosqodeCApXxjHaERXwvOsTow1tW/D7J2inF+lO9XNUsG6K0xvJs1cXgWGG7cJ90eNyaYnM3aFWPeLHThDJYPy/E0l/S7IRu04gfVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
X-Proofpoint-ORIG-GUID: 4KvyWar1uU07Pqlf_p0_30teZ_5giQrL
X-Proofpoint-GUID: ifrgf3eXF76OHG975Cv0mYAAPJZ0qTRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-29_14,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210290154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99345

--------------6NJOXRzG90cbSMChjZ300i0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-10-18 13:31, Khem Raj wrote:
> License-update: Include MPL-2.0 [1]
>
> Add missing BSD 3-clause and MPL-2.0 to license field
>
> Switch to git submodules since its using locked versions of some
> components like opencensus-proto
>
> [1]https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb}            | 10 +++++-----


Is anyone else seeing:

error: #error "C++ versions less than C++14 are not supported."


i.e.

TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/include \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/address_sorting/include \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upb-generated \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upbdefs-generated \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/upb \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/xxhash \
-isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include \
-O2 -pipe -Wl,--no-as-needed -fPIC -std=c++11 \
-MD -MT \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
-MF \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \
-o \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
-c \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc
In file included from
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/config.h:86,
from
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/attributes.h:37, \
from \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc:25: \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/policy_checks.h:79:2: \
error: #error "C++ versions less than C++14 are not supported."
79 | #error "C++ versions less than C++14 are not supported." \
| ^~~~~


Happening for a variety of distros.

fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153


../Randy

>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> similarity index 90%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> index c2f952fc64..8efd9321ca 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> @@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
>   (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
>   HOMEPAGE ="https://github.com/grpc/grpc"
>   SECTION = "libs"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM ="file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
> +LICENSE = "Apache-2.0 && BSD-3-Clause && MPL-2.0"
> +LIC_FILES_CHKSUM ="file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
>   
>   DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
>   DEPENDS:append:class-target = " googletest grpc-native "
> @@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
>   # RDEPENDS:${PN}-dev += "${PN}-compiler"
>   
>   S = "${WORKDIR}/git"
> -SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
> -BRANCH = "v1.45.x"
> -SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
> +SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
> +BRANCH = "v1.50.x"
> +SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>              file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch  \
>              file://0001-cmake-add-separate-export-for-plugin-targets.patch  \
>              file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch  \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99241):https://lists.openembedded.org/g/openembedded-devel/message/99241
> Mute This Topic:https://lists.openembedded.org/mt/94413640/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------6NJOXRzG90cbSMChjZ300i0P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2022-10-18 13:31, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20221018173118.784429-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">License-update: Include MPL-2.0 [1]

Add missing BSD 3-clause and MPL-2.0 to license field

Switch to git submodules since its using locked versions of some
components like opencensus-proto

[1] <a class="moz-txt-link-freetext" href="https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4">https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 .../grpc/{grpc_1.45.2.bb =&gt; grpc_1.50.0.bb}            | 10 +++++-----</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Is anyone else seeing:</p>
    <pre class="noformat panel" style="border-width: 1px;" data-mce-style="border-width: 1px;">error: #error &quot;C++ versions less than C++14 are not supported.&quot; </pre>
    <p><br>
    </p>
    <p>i.e.<br>
    </p>
    <pre class="noformat panel" style="border-width: 1px;" data-mce-style="border-width: 1px;">TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/include \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/address_sorting/include \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upb-generated \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upbdefs-generated \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/upb \
-ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/xxhash \
-isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include \
-O2 -pipe -Wl,--no-as-needed -fPIC -std=c++11 \
-MD -MT \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
-MF \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \
-o \
CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
-c \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc 
In file included from 
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/config.h:86, 
from 
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/attributes.h:37, \
from \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc:25: \
TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/policy_checks.h:79:2: \
error: #error &quot;C++ versions less than C++14 are not supported.&quot; 
79 | #error &quot;C++ versions less than C++14 are not supported.&quot; \
| ^~~~~</pre>
    <p></p>
    <p><br>
    </p>
    <p>Happening for a variety of distros.</p>
    <p>fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20221018173118.784429-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb =&gt; grpc_1.50.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
index c2f952fc64..8efd9321ca 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
@@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/grpc/grpc">&quot;https://github.com/grpc/grpc&quot;</a>
 SECTION = &quot;libs&quot;
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6e4cf218112648d22420a84281b68b88">&quot;file://LICENSE;md5=6e4cf218112648d22420a84281b68b88&quot;</a>
+LICENSE = &quot;Apache-2.0 &amp;&amp; BSD-3-Clause &amp;&amp; MPL-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906">&quot;file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906&quot;</a>
 
 DEPENDS = &quot;c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2&quot;
 DEPENDS:append:class-target = &quot; googletest grpc-native &quot;
@@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = &quot; ${PN}-compiler&quot;
 # RDEPENDS:${PN}-dev += &quot;${PN}-compiler&quot;
 
 S = &quot;${WORKDIR}/git&quot;
-SRCREV_grpc = &quot;b39ffcc425ea990a537f98ec6fe6a1dcb90470d7&quot;
-BRANCH = &quot;v1.45.x&quot;
-SRC_URI = &quot;git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
+SRCREV_grpc = &quot;91091e3668144de9c6aa392f496bb7639f7025a7&quot;
+BRANCH = &quot;v1.50.x&quot;
+SRC_URI = &quot;gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            <a class="moz-txt-link-freetext" href="file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch">file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-cmake-add-separate-export-for-plugin-targets.patch">file://0001-cmake-add-separate-export-for-plugin-targets.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch">file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch</a> \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99241): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/99241">https://lists.openembedded.org/g/openembedded-devel/message/99241</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/94413640/3616765">https://lists.openembedded.org/mt/94413640/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------6NJOXRzG90cbSMChjZ300i0P--

