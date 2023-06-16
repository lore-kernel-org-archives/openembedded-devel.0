Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDF1EB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 10:40:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5372.1686912007432294086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jun 2023 03:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IyyS1kEP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5531bc8c46=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAFBkS001312
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:40:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=eOvApB1st1arlfCeed+4H6TiKKFr7ufP6cNDfQ+HzgE=;
 b=IyyS1kEPEbAN7m0mCNapmn+EoK/3aDq90HTM6ozk9C7WkLYvy3GlZBcv3hEQz2mH99/Q
 NgQO3Z3tFFdrmFW4xwbKHbNbBnaTNBkoLFnK4hnCY2Cp6+UpHzc27yqF3RkWYXqNtbou
 HA0Bh7A6jpoeQ/SGhhYnJNsUuCS8dfTzv9q3wuk42VF28S/4LhEYW+0dXBnXWRXgaZVk
 7zQs9XJT14xZ4/j3TZrfyh2HFf+LEH5i0BS/K/cMCIjLPsLjGj/OQoVFVuxqg70awSiS
 INxvM7srYY8gtypOuGlNcq60mnmMpbJgu5DOtOVD+P+bSH8oIvpUnQ5vBPWVuAJgrxKb Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf35v5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:40:06 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GAe6Gu017588
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:40:06 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf35v5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDrJHUqgGhqsMc0SldO5q9g9YNAfW8JW3rPMqk+vqCO/5g9EV7txpnLoCrKlG1hWqd91zVb6Gp5ke6cHSWCgEqfLGrOZOywHBO0BqfJeVcU/87kqMXcNwxVxMBHmd2qhSKvxH8/nfFHzk/bKHTHyL9AmVQ+rxKBq4Kj2VaHRS1jZWz1UFgS/iOBhyOVdUPHvyg/6jeomHNc2Tv0VzouoMIezuvTSh0/4wxE5W53cy5EZa5Dqn0ztZYKLmeJ+225OMRfKQG//ebUjcZfeRg1j4E6htmNpunHKh3BZC0MIFKqfMZEIpDnzqVd5AXcANrP+wlU3mCY1BS3wpvsLOvNprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOvApB1st1arlfCeed+4H6TiKKFr7ufP6cNDfQ+HzgE=;
 b=ANQzu06ecJkio2a11xPSk4n1Y8qp0ryJR0SIzaZqKFuSNOrpNy+JtoBAzONIFhBP9f2l1A2NYjQs8zH6qU/v9ud/uDt9XXpfkKZFOdMioR2ghQ2ayCvNH6l0y91HWnlQdOpwPFSBS/44wLwQFSHmeKhbBr/WJTIKaDWn8zaXbUrMKlbe8EqBJk+ahl+UumzkymucvthVkTeK3/oDeVzm4RUF8i6oUBmkQkemQfHK1kDX62MCiTf87sp7J02wI+FKgZM6CnWixVYeETM9ID/6SgCSV7dFI0LdIkhMrel7PV+rUkv5IV9oOJlA7ffdTof/QyyVx2MgosVb7mNRYYDXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.41; Fri, 16 Jun
 2023 10:40:03 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 10:40:02 +0000
Message-ID: <c79de7ee-f634-b440-cbd4-99593b6da210@windriver.com>
Date: Fri, 16 Jun 2023 16:07:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade
 3.2.12 -> 3.2.19
Content-Language: en-US
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
 <schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>,
        "akuster808@gmail.com" <akuster808@gmail.com>
References: <1763A46E49E18848.14832@lists.openembedded.org>
 <eec3a915-552a-a8fb-5c9f-1376d492ff9f@windriver.com>
 <SJ0PR11MB671739C02457D298E739D3CDDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <SJ0PR11MB671739C02457D298E739D3CDDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|MW4PR11MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b1f9db-da4d-412f-d8ac-08db6e560a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hWBnkHrhiEcm6H9OQwZF1sRwMFd7Zg/qoYboAQPnBK7YIOr+QiUpFvaV1ZnB8IlsMmt6xfOvNyyLK2Bbe91wgI0zBhVZ2Y+5Aup22Py6YCf6Rnf5vB4snavbxS5nQB/afPJRTVqi7azyHKIcAF+5QLNgDiSwMSjwrMB2YZ65WiRJYmz+52sI6Lm26rowI+AxnHbe2PpfXySm30/1cHMPJS+iWovQslvv6mX24sRA8Cqi6WukbvDJ144caVJNIzx1xSqY6to5y09efPZdSGeTKDZl7apaGN5YsRN4Dh9p/JrxWDIGaUtiwWL3rz1lWZlfjVLVfeCzH0VofHpZn7mbQCKBQmUkk33J9A4iMVsVrtRTphP9JXplS64QFPB2ZnbVfHJvpdzch4ueeuZ18CPxEuXW9jnc+f4TtoSVkqM86WsSgD1r9eETbCC2RN1YXckC940ipUFRLE/zaAUvU2dVBdH1Nkb2o18l2iWWk8q2Estr2oRI+ofJEWX7RVChKlWhU3gnwhd74mR1GiHGdBB2bps0+Zws1xoM+sr7GTJ73uqKZJBveVkbK9k+lIvcVVpSbfqcEH6vuYyH+ykPUqwMWLMzQpVJt+kXFDhbn2HOps+pR7bzz0dzI03P3iHldm8Dn2Ztk8BlqyvPglu/ILKD6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(451199021)(83380400001)(2906002)(2616005)(38100700002)(36756003)(5660300002)(86362001)(31686004)(41300700001)(66556008)(66946007)(66476007)(966005)(6486002)(316002)(4326008)(6666004)(8676002)(8936002)(478600001)(186003)(31696002)(6512007)(6506007)(54906003)(110136005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDRBcXhGWnR0WVFBcHVROTB2eFl0VERTYjkwYkw1TlR1Q0JrUndrUDRycWxI?=
 =?utf-8?B?UlNvby9KSHUvdEVUQkNVVlFOV3JtWGl0aEFGWXdQaDdMU2tJazZmZ2VZeG5N?=
 =?utf-8?B?c09pOU9oTWkzSnZNSjdTTWNwWm16ckVlWWFkUDFXVXZ6eGs0ejcxd0xoeHQ0?=
 =?utf-8?B?YS9Zb3E1OHNyUGdZb2VTSDFrNlRUZWc4UlFzNUF4WVkrQXRDcGI3ckMxTmpr?=
 =?utf-8?B?bEFaVlZCYXF1OWFzNDRKcGwySFBtbGVLV0hUN1Fpa2FpTTkwZ2tKZjl4VXN6?=
 =?utf-8?B?L1hPWFFPMTcwQy9MN1ZQTDlpaWVmVG9keC9Ka0JpZUpjVjFZK3FhQzVza3Bj?=
 =?utf-8?B?azRKc0loRThNdGtjREdNRFJwNjNZZFNmK1NjTk5BU3hWWCtublp5b0dGV3Vk?=
 =?utf-8?B?SWtuUUpNNXpFK0R4Q29iZ0dwcUxpaUdxV25ZZlBUMnNIbFJ3QlVORkZtU2hV?=
 =?utf-8?B?bDJSRU9nSFZNUTJrYVVWbWd4Smd4ZUE5UjNFdmdBWG9YelF2cTJPQWpPbys1?=
 =?utf-8?B?MnBnb1VmWW5iUXBaLzk2SkdXRDZDUkhtRlNaclVsdisxTVFwc2twVzJBcjBw?=
 =?utf-8?B?V2Zjb3NXRFQrVDJNQUd4Z3NEMVQ5NytDZG80STRJcDUxWUZiRFJQbnJWdzN4?=
 =?utf-8?B?cTJFa0p2cDdCQUQrZjdBLy9Hb1lDVzVkL1VWc1h4TWk2dHJ2aWYwSmFNR0Rv?=
 =?utf-8?B?RVZ1azQ0d0tpVFRicnNkazVBNlQxRGxBUExtd2R6aGdXUFY3ZU5rdnQ0dUpJ?=
 =?utf-8?B?azdVcG9PSzFJL0lJUGlUdjc3SWNFNy94M2NFbE80ZitDZU9OVTkvUXhTRzE0?=
 =?utf-8?B?aFJ6cGRkb1pIcTc0M3dvT3hNL3A0dTRKNjkvMVlYaVZGNmxzdGZnVFh5MDlq?=
 =?utf-8?B?NCsvV05reC9IS1FPckphLy9keDMwSTFSNmdHTE9aRStZeTJ1cC83eFVnWHBu?=
 =?utf-8?B?Q1hsMVd1Mm1ObmhoMm11Q1Fabnh2ZkdEc1dUaW53eHJOSWhUQVZjNjZjNnRp?=
 =?utf-8?B?TWl0YmtqVTQ3NVJNZ01SeDZyZjBnemltVmhhR3RDVjloejVzQ3J3d3N0Nk92?=
 =?utf-8?B?WktyamZMYnZWeGJQWlM5KzhOM3ZJc2s2V0hjZGg2RUVYNS9mS2swdFd0ekNu?=
 =?utf-8?B?ZXltdHdoNnJRVzRneitUQ3RjZ00zeUs1bWZVVmdhYnlhVVBCU3RUSVhoTk15?=
 =?utf-8?B?dXBIUTNsRW4rUVNZSEsxWGJCbjRWajRvMDRiTGVML1BpQmRmWElJMmpMaEIr?=
 =?utf-8?B?QWIxTjR6cEgxM011dExvR05hT0VkaFBUSlVWdm9iU2U5ZEU4VDBSZ2ZZNW1i?=
 =?utf-8?B?RElXc091VVVHWng4SlhhZGFyVlBXM3ZTVlhWMUhDY0s5dFF3enNzUWVpUHQ3?=
 =?utf-8?B?MVpqaDFuQXY2VlZSbmxPS1FMOGdHVm4vakgwSXF1Vk54WitKcXRyZFdDUDBK?=
 =?utf-8?B?dC9oSzhOMzR4eXY4cURIM21iVm5PMk9SU1lKM3dhZUtrTjdXTHhDTExWUVhW?=
 =?utf-8?B?aVM5eEVUb3RUcDVVVmZxV0RZRXp6ZnNQZzhKMlNpTThGTlIyb2JYd3JnTG4x?=
 =?utf-8?B?ZXhLRm13b3VtNTlhWFFrRGovSUx5RUFnbHAvM1pDc2YxbGxkME9YY0lUdWVz?=
 =?utf-8?B?THdSeDBEU3pyRDlieHdFdnFMcTlMWnVieUpmaWZweThBUlRCSXphRkJ1WGpM?=
 =?utf-8?B?ZHVnQU41L3ViYldUL0wxclp6MTdVc1o5VVRxcG1HM1c2VG5mN21wdEpuYm02?=
 =?utf-8?B?cGJqTmdTNGZzMnRoR29SeDRhRkNQWDdxTlhlcEJKZHppVzI4NGZ6ckFDMm9Y?=
 =?utf-8?B?MHlnMjlpaTRVT05PTXVmbEVaYWhUVjN2RDIxajBtT1ZSRDhyUENqaUt6Sysv?=
 =?utf-8?B?WE5NRWMwbTJ6QXVxWWVSS3phTXA3RHB6LzY4WktJQjVqL1FUbHdib3EvQWhv?=
 =?utf-8?B?VE53SGJ1UDFYaU1rR0E2cGQ4ckVOUmJ5aVNmUW9xa1F3QzA3MnorLzFEdGkw?=
 =?utf-8?B?bHo3RnJBYnJvQ3IvZ0FYNnJJRUN4cUlqVzJlWmFxVFJzZFNQR2h3M3FaODVs?=
 =?utf-8?B?akZMUmNqQW9CUHhsVXZCUnd2MEdkcEx0V3BZMmxwbS81SGVGbGU4d0RjM29P?=
 =?utf-8?B?VHhTbzZKSExNSkNsMVl6YkV0UmtPSXpyY2dvVnUwZ2JGQkdVRmhQM0hzS0w4?=
 =?utf-8?B?MERPbXNGckRFWmRJbDd4T29BWGdkZEwyTXpEdWViVDVvV0NpZFh1elBpNVZY?=
 =?utf-8?B?OWFHdXlBRHZYYWg2aFJ5WTlYR0lRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b1f9db-da4d-412f-d8ac-08db6e560a1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:40:02.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFVrIvMflXPIRtM75a104OPAYOUthOrSBOzQDQmtl/hM9H93VCkQShSCH6g9R5lZs5gF3fvVjHwRScaa8tNykXVvqNOYQ8vP+lh0jJDFaXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
X-Proofpoint-ORIG-GUID: Za4SspB6wJWPNXB9QVU3OmSpXJSjZfhN
X-Proofpoint-GUID: F9V2pGU3fYe5DuZCqjZfhioH0vFxCL7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103338

On 16-06-2023 01:10, Sanjaykumar kantibhai Chitroda -X (schitrod - 
E-INFO CHIPS INC at Cisco) wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> ++ Arman
>
> Hi Narpat,
>
> As per my knowledge, generally we don't go for package upgrade in stable branches like dunfell/kirkstone.
>
> In some special case where we have strong motive then only, we recommend package upgrade.
> Kirkstone Reference: https://github.com/openembedded/meta-openembedded/commit/84782522d145f55e4076699c4bb00bcb4cec98da

I agree with you but, this patch is for minor version upgrade from 
3.2.12 -> 3.2.19 which includes only CVE/Bug fixes.

Best Regards,

Narpat

>
> Arman(akuster808@gmail.com) can guide us better in this case.
>
> Thanks,
> Sanjay
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Narpat Mali via lists.openembedded.org
> Sent: Thursday, June 15, 2023 8:30 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: hari.gpillai@windriver.com
> Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 3.2.12 -> 3.2.19
>
> Reminder.
>
> On 29-05-2023 20:14, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> The delta between 3.2.12 and 3.2.19 contain numerous CVEs and other
>> bugfixes. git log --oneline 3.2.12..3.2.19 shows:
>>
>> fc42edd2e6 (tag: 3.2.19) [3.2.x] Bumped version for 3.2.19 release.
>> eed53d0011 [3.2.x] Fixed CVE-2023-31047, Fixed #31710 -- Prevented potential bypass of validation when uploading multiple files using one form field.
>> 007e46d815 [3.2.x] Added missing backticks in docs/releases/1.7.txt.
>> a37e4d5d6e [3.2.x] Added stub release notes for 3.2.19.
>> 963f24cff2 [3.2.x] Added CVE-2023-24580 to security archive.
>> e34a2283f2 [3.2.x] Post-release version bump.
>> 722e9f8a38 (tag: 3.2.18) [3.2.x] Bumped version for 3.2.18 release.
>> a665ed5179 [3.2.x] Fixed CVE-2023-24580 -- Prevented DoS with too many uploaded files.
>> 932b5bd52d [3.2.x] Added stub release notes for 3.2.18.
>> c35a5788f4 [3.2.x] Added CVE-2023-23969 to security archive.
>> 9bd8db3940 [3.2.x] Post-release version bump.
>> aed1bb56d1 (tag: 3.2.17) [3.2.x] Bumped version for 3.2.17 release.
>> c7e0151fdf [3.2.x] Fixed CVE-2023-23969 -- Prevented DoS with pathological values for Accept-Language.
>> 9da46345d8 [3.2.x] Fixed inspectdb.tests.InspectDBTestCase.test_custom_fields() on SQLite 3.37+.
>> 4c2b26174f [3.2.x] Removed 'tests' path prefix in a couple tests.
>> d21543182d [3.2.x] Adjusted release notes for 3.2.17.
>> 4e31d3ea55 [3.2.x] Added stub release notes for 3.2.17.
>> 238e8898ac [3.2.x] Corrected passenv value for tox 4.0.6+.
>> b381ab4906 [3.2.x] Disabled auto-created table of contents entries on Sphinx 5.2+.
>> f6f0699d01 [3.2.x] Removed obsolete doc reference to asyncio.iscoroutinefunction.
>> accdd0576d [3.2.x] Added CVE-2022-36359 to security archive.
>> 7190b38b8d [3.2.x] Post-release version bump.
>> 4c85beca9d (tag: 3.2.16) [3.2.x] Bumped version for 3.2.16 release.
>> 5b6b257fa7 [3.2.x] Fixed CVE-2022-41323 -- Prevented locales being interpreted as regular expressions.
>> 33affaf0b6 [3.2.x] Added stub notes 3.2.16 release.
>> 777362d74a [3.2.x] Added CVE-2022-36359 to security archive.
>> eb5bdb461e [3.2.x] Post-release version bump.
>> 653a7bd7b7 (tag: 3.2.15) [3.2.x] Bumped version for 3.2.15 release.
>> b3e4494d75 [3.2.x] Fixed CVE-2022-36359 -- Escaped filename in Content-Disposition header.
>> cb7fbac9f8 [3.2.x] Fixed collation tests on MySQL 8.0.30+.
>> 840d009c06 [3.2.x] Fixed inspectdb and schema tests on MariaDB 10.6+.
>> a5eba20f40 Adjusted release notes for 3.2.15.
>> ad104fb50f [3.2.x] Added stub release notes for 3.2.15 release.
>> 22916c8c1f [3.2.x] Fixed RelatedGeoModelTest.test08_defer_only() on MySQL 8+ with MyISAM storage engine.
>> e1cfbe58b7 [3.2.x] Added CVE-2022-34265 to security archive.
>> 605cf0d3f6 [3.2.x] Post-release version bump.
>> 746e88cc63 (tag: 3.2.14) [3.2.x] Bumped version for 3.2.14 release.
>> a9010fe555 [3.2.x] Fixed CVE-2022-34265 -- Protected Trunc(kind)/Extract(lookup_name) against SQL injection.
>> 3acf156be3 [3.2.x] Fixed GEOSTest.test_emptyCollections() on GEOS 3.8.0.
>> 4a5d98ee0a [3.2.x] Bumped minimum Sphinx version to 4.5.0.
>> 1a9098166e [3.2.x] Fixed docs build with sphinxcontrib-spelling 7.5.0+.
>> 37f4de2deb [3.2.x] Added stub release notes for 3.2.14.
>> 7595f763a9 [3.2.x] Fixed test_request_lifecycle_signals_dispatched_with_thread_sensitive with asgiref 3.5.1+.
>> 2dc85ecf3e [3.2.x] Fixed CoveringIndexTests.test_covering_partial_index() when DEFAULT_INDEX_TABLESPACE is set.
>> a23c25d84a [3.2.x] Fixed #33753 -- Fixed docs build on Sphinx 5+.
>> e01b383e02 [3.2.x] Added CVE-2022-28346 and CVE-2022-28347 to security archive.
>> ac2fb5ccb6 [3.2.x] Post-release version bump.
>> 08e6073f87 (tag: 3.2.13) [3.2.x] Bumped version for 3.2.13 release.
>> 9e19accb6e [3.2.x] Fixed CVE-2022-28347 -- Protected QuerySet.explain(**options) against SQL injection on PostgreSQL.
>> 2044dac5c6 [3.2.x] Fixed CVE-2022-28346 -- Protected QuerySet.annotate(), aggregate(), and extra() against SQL injection in column aliases.
>> bdb92dba0b [3.2.x] Fixed #33628 -- Ignored directories with empty names in autoreloader check for template changes.
>> 70035fb044 [3.2.x] Added stub release notes for 3.2.13 and 2.2.28.
>> 7e7ea71a8d [3.2.x] Reverted "Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+."
>> 610ecc9053 [3.2.x] Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+.
>> 754af45773 [3.2.x] Fixed typo in release notes.
>> 6f309165e5 [3.2.x] Added CVE-2022-22818 and CVE-2022-23833 to security archive.
>> 1e6b555c92 [3.2.x] Post-release version bump.
>>
>> Release Notes: https://docs.djangoproject.com/en/3.2/releases/
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>    .../{python3-django_3.2.12.bb => python3-django_3.2.19.bb}      | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>    rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb
>> => python3-django_3.2.19.bb} (77%)
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
>> similarity index 77%
>> rename from
>> meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> rename to meta-python/recipes-devtools/python/python3-django_3.2.19.bb
>> index adbc498bdf..0c2fc10e63 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
>> @@ -1,7 +1,7 @@
>>    require python-django.inc
>>    inherit setuptools3
>>
>> -SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
>> +SRC_URI[sha256sum] = "031365bae96814da19c10706218c44dff3b654cc4de20a98bd2d29b9bde469f0"
>>
>>    RDEPENDS:${PN} += "\
>>        ${PYTHON_PN}-sqlparse \
>>
>>
>>

