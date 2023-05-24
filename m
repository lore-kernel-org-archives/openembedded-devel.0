Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759BAC7EE2D
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:59:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.919.1684951138105628686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=tCZ37cc4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45087f15ec=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OHie6o019719
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 10:58:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OgTIsjG2OnvT3ONk4dA1xcJioRaJUTh/yyFJstRPB44=;
 b=tCZ37cc41qm/ZCsfVaBoySaEHiTnpgQdxhhV47AeQuudvt2ZHRFhA5OhpPsSzUSxLpAq
 Z9N9Ax1CVH1hs3GGAfcxy5YmTmAzRlXjuefzpAiVhbDizUaqlo5liP0IQi6ZW8f+GuRp
 NahPgqDul/UdT+P4ntlANcCsKew3Z5prVVFx9ljpHqsnq7/x0w4jZ8khsrCnXnbw5bLx
 shks5C0hA7KgN/55q1S8VxOjFj8PO83JiIpS89d0HNKYxGJJeZU+Tb1WxJzy6JflnAB1
 mQzRYuSvFP1q8mlXPabtpnuZ6ewpWnwsAaye2SKhBcQF3vgmf/SFyV81aDlpaUjchdq5 dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1m5ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 10:58:57 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34OHwuth004109
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 10:58:56 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1m5ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 10:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIsEcj7lR4S7bvtoqUb7DmtR7dJaJYXj6M1eA/39LZ9PVhjj1RZhv2CGdI69WnxUfP/7o8e+A4PvsGXUO06VNYV8lgRoEeLjy7I2USj9uosA8e8kzYijzjO82O30kridrQhyRdCMytkdgpuZXiQoOEivw1jzWQD7VmN2P9sLANMEhMgqaRF2G4eT9bdOpgSdoAVk7NNzAHNj+ELvUA8O6w5kgwkhFaCjCaWDS4aRTmhfTtOahWfOB+RCdlDfwznyIiWfZxt9mgbc3qfAky7GGegwIydN8UC7PQDitkqltXTPIZnQp2rCXOSUu5ARRUnYNRRVy1yee9qgSR5+JM9MGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgTIsjG2OnvT3ONk4dA1xcJioRaJUTh/yyFJstRPB44=;
 b=oAo0Ob07xCakRc1BqQX5I24MqAzmOgIeMgJgDqMjuGNtD2MQZJcjvEW8lHAKizt1w+8wmob3OCtl1y7cXUCEwohbgUedemtXDBVClqo4bqCJYE8S3f2DcZ+LMQvFXWMIXe8hBHUmN11NYd8BlWFTJiVeoQpEH6+gl9Ddd8RiDvngRfSfxEl5Ngqg8WmtPC/hUM9Niude6v1Gnd2V5Lx5T1dbdXkHNcFVesjhDU7ra29hMb803Wmk8AdRVdqQV+Wp7KrjkVeD7FKgixBnPLWn7tSaTF66pkicdEdyOni3NTDMAB0Rjkut0/5hEYL7QSIvzz0GjaXxOgYhxbzti9U9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 17:58:51 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::f8d6:40cf:5516:1786]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::f8d6:40cf:5516:1786%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:58:51 +0000
Message-ID: <ecc1bb01-0dde-7732-b156-1642df1f685e@windriver.com>
Date: Wed, 24 May 2023 23:26:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-python][hardknott][PATCH 2/2] python3-django: upgrade
 3.2.5 -> 3.2.12 -> Now Kirkstone
To: akuster808 <akuster808@gmail.com>,
        Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-devel@lists.openembedded.org
Cc: "Reyna, David" <david.reyna@windriver.com>, Khem Raj
 <raj.khem@gmail.com>,
        Trevor Gamblin <tgamblin@baylibre.com>
References: <20220323173332.16576-1-trevor.gamblin@windriver.com>
 <20220323173332.16576-2-trevor.gamblin@windriver.com>
 <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
 <e2a0cd62-0632-f473-6d44-32fe1cb566a6@gmail.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <e2a0cd62-0632-f473-6d44-32fe1cb566a6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b98bc79-6962-4677-93b7-08db5c80882d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t+x4pfyT4hCJJEnvqn9CQPjpQtkYC7zC7cYEprDQSEaqf//J7NK6STtT9FdeZUvYmdxRqhf6VZROFNDL6ior+cQzVcz7MGpd+eu57x4/uyR5/De5YuUWZmq4rzG0kRzEbc5KqEpoZV2galC7qfPGVOQQG7P2Ha7tSNsptuJmV2XFfd37kKQrjp3EetIvrYUsWWZeSKNOTSXc9T4gv2xgdHXygfy8p7/twZeFDN0dHAopzhNK+1fqg8wxql//BHVgqmOEbq3VSFoRNPRknIZyRQ7BdqR+lI7HZlcEiNqM5vM03bRCAVCq5RHBaMx04bH93/3BWgdHiLQY1i39yLUeKj/RcQjanPDnfle8O/d8K8NKsAh6gW0sFEHVfemrjP5tbRvt7FjPc6g4sF3Qzemkn0clLXcrXw6BpbCXF+AAeyzDoP3dZeTtgoj1FWO/9gaKEPvtMyQCUQhV6ROYFZHG4UULTtkuSSMWbomiRERpHUK6okLwf6eYLTM4NJIjMnG+gERcy1DpfyDBPsXXyGnbRm92EoOO9/CmScKQTVQtc+kezeDgukBgTpkBMeYGM+MZIrrBLHKPtRbhWSzPkgYWp7yGPhapAlQpdFgA6oxD2aT/vwAW7Hbed3sivfYIHsYLN/2opw0om85/HNyNmLDrBvB6N+uT3kw35OOJAKYx5q7jaUcupQJ/DQBgSjJOmc+w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(451199021)(186003)(26005)(6512007)(6506007)(53546011)(55236004)(30864003)(2906002)(2616005)(36756003)(83380400001)(316002)(6666004)(66556008)(66946007)(66476007)(4326008)(86362001)(41300700001)(38100700002)(6486002)(54906003)(110136005)(478600001)(31696002)(31686004)(8936002)(8676002)(66899021)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXpnaTVnNXllQnpodmlHRmlKY0pOSG42SGdsWmhtbjcwTXRJOUdXYWxMYlZi?=
 =?utf-8?B?dHdLQS8wdCtPeUYveGNhZHM2ancyUmlGVUlseGdmdDQ3bWFVNHZWSTFOdkY2?=
 =?utf-8?B?alNhQ2NUQnVmVm1UQ01RV0wrVEpHZkVNZndNbWh6Mk5ZUDZGMGtWUmlHRElJ?=
 =?utf-8?B?WVpSUlViNkhlWFVtT2krbWxPa2R4T3N0M1QxR3ZZYXdvcXRKVXBPY29HUmhh?=
 =?utf-8?B?aXBQZ2xwMTg3dG1aQWd1WTFGcU54WXZFUldnY1RrcS92cEJNYXdYZy9qMmJ2?=
 =?utf-8?B?REhOSk9TQnJnRHpFbjk0VGRmTDhIenRrQmlHR0hzV0hCVEJDNDZWU09Ia3hr?=
 =?utf-8?B?V3RJL2tnZVF5cGNkb1pUOEpTT3FOcGtyTy9PeDJxL3lrc0FBaUN3NHBQaS9M?=
 =?utf-8?B?cGdlWVJuRzMyeDRZUkoxeEJ2Mi9VR05XRU1LaHliNzhhRDkrdk9oOGRJRjh0?=
 =?utf-8?B?VytFNGVxTWN2REIxSU40cHZ3S1Y4N25oS2o2OVBsemhzei9uUm5Vb0hWclRo?=
 =?utf-8?B?Zm9yc3Y0VzNEbE9kYzRTallQbkVVQkkxN0tQbTVSMjdoYzlwaGh6c1hMMzUw?=
 =?utf-8?B?WnBHRTNoUkVic1VhRFp0WDQ1bFdFV1JaNDRkMmt3aVVYODc4a1ZvUXc3SCtw?=
 =?utf-8?B?MnpMVEdZYXpGQW9acDNSQlg5cm9GWS9MYTZWUnRnUC9yRXQ0TzRiTkJpK1Yy?=
 =?utf-8?B?eTM0Vmg3VFhGaFdzSnZ2SnpZRDdtQjduMFVJZnFkV3dhalJZOC80VjZNTXE1?=
 =?utf-8?B?MDRTWXRiNy84YWtxZy9WWUUvU3loNUxLa3plaVV1WmhTdWhBTUJzUk1zQWpx?=
 =?utf-8?B?cURwQUNIR0M1TUE1UnZvWUxJT2s0MmI1d29iNGVLTk5OWFVqK1cwNi9oMm9W?=
 =?utf-8?B?NlRodExYN1RmTk5PdGpEZm5BeVg1S3NvNGs1NWhQRXhmNWhqWGoreTNDWXJp?=
 =?utf-8?B?d1l6ZjRCcFZUL3NPa2NuUGgvYXdSMkxCTUh3eHo4SzJoVzEyWTJabXpkN2tW?=
 =?utf-8?B?OVExbHJ0REhLNFhRZGQ0Ly93K3hiaGQ3WnZiVHNtMnN5VTFFSEF4cTQrbEJa?=
 =?utf-8?B?bG9sVkFMKzVPbWFWbWdlbVAzclRLRUdMcmxKTTVJMjdPeFFaeW96K3MyV2ds?=
 =?utf-8?B?QmJZcmVPRXR1ZVF6Q2k4cGRVYnBGTzlWT3Mvc0s4c0xjZkJhWlp1c0s4Nmoy?=
 =?utf-8?B?eGhXMEVOeUIvSmcyRTJ1YmM0cDlDd3ZzRDlrN0k4RmtQdTNkR2RsVExPQlhL?=
 =?utf-8?B?Nk1RUlRQY0c3Y08yUGhaS2ZMaUN5blppR2FkUFpNWkd1V1J1UndoQVFCTGZC?=
 =?utf-8?B?a2lhNjl2K0tJM1lLbjBrSXVhbjArQnB5TzV0dGNWckpJbzlDL0kyRnoza3ZO?=
 =?utf-8?B?a0JDK2ljVEtYdlA3NkN5TFMxY0VFTHFrczJRL05hdERxVFh4TDZvY1l5Qm04?=
 =?utf-8?B?S1Bjd2J6MTFWUlk1T0F1TFkxVkpMY3pkZSs5V3JwTkg4ang1TjFQTFZieFdC?=
 =?utf-8?B?VVhoRlErNlJXZjFCMG5oZTJqbHY4b29aVWFTblRSZkk1V0hVVjJnVG0wNGND?=
 =?utf-8?B?UUxzLzZmeWtadHNMNVJqTlF5T3BwTEI5ak9KMlN2bm4wa0htemFWQmdCYlZJ?=
 =?utf-8?B?MGlENUYwUkRRMFlQNWMvdzJ4bjlSeENKditJVXFkN1lrOVNlaENxcjlyTmNh?=
 =?utf-8?B?TXp1aVVyTEF2LzFsdHNDTmsyZFdCcHlXQmIxbERTUjVyNUVLRW1qQjVzU2c3?=
 =?utf-8?B?N2xjUUUzOU55c3N5d3AzQmRCVU1MdURrQ0o3OG5FY3lmQlRMSFUxR1Yyejly?=
 =?utf-8?B?QWhpRWtLREEwby9GbDUvaEtVV3pFU285NWlCeGhVMkVFUDVuZ2tvZkx3M2Z3?=
 =?utf-8?B?SURwcnhNZ01WUjZscFhRUllHdCtZQkFTekgrMHdEcHZXVVY4SGtZV3cyTFgr?=
 =?utf-8?B?WXVtMSsvWUZOZjdjVmo3MnJvZ1BpYXY5VmVzRldSYkczaThGM3NCMGJzaUxt?=
 =?utf-8?B?a295SFUyMXNDVmsxc3l0WlgyckY1bnpPR0VVOVp3dVZ1MFY2OVNoM2dLR0Y4?=
 =?utf-8?B?UUZMaVd3QUV2Q3ViWEI5NXMvQVN3M2RFYUE5SEpSNkFCTWNQT1AxTTNRMnFT?=
 =?utf-8?B?TVZNVkxXSmhVZzB4U3hIS2RKT2ZHdjFaRTJBdURSZFR5WC9HS1F6SFNtVWFQ?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b98bc79-6962-4677-93b7-08db5c80882d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:58:51.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqD/5Q8+QEYn3HTiNv2aeO5HPrZ7Ssd2JBf9iXK7FfFyS/UTrLtV5sM0MMcKhThe8I0jlOtDf4+MPs/dk09ToEw67Q136Pn7r0+OxczCu2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-Proofpoint-GUID: X2vqebJ_Hu9zKtVgegOgBWWTnyck2l18
X-Proofpoint-ORIG-GUID: SyvcI6_e70MZiwOM0XGE5ktmRVT0bXjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34OHie6o019719
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102791

On 24-05-2023 08:34, akuster808 wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 5/23/23 5:58 PM, Randy MacLeod wrote:
>> On 2022-03-23 13:33, Trevor Gamblin wrote:
>>> The delta between 3.2.5 and 3.2.12 contain numerous CVE and other
>>> bugfixes. git log --oneline 3.2.5..3.2.12 shows:
>>
>> Narpat is working on a patch for: CVE-2023-31047
>>
>
> Isn't Hardknott EOL?
>
> - armin

Yes, it is but you can see below that Randy was talking about kirkstone=20
branch.

>>
>> He'll start with the default version of django : 2.2*
>>
Yes, I will send the patch for 2.2.28 tomorrow.
>> Which if any of the other versions should be fixed?
>>
>> Can we remove version 3.2?
Since, as Tim pointed out 3.2 is an LTS release so I will update to=20
3.2.19 to fix the CVE.
>> Can we update django 4.0 to 4.1 rather than backport the fix?

Randy talked to David who said that 4.0 version was added to support=20
Toaster. We are

considering to backport the CVE fix on 4.0 which is currently not=20
supported but David

suggested that an upgrade to 4.2* LTS would be acceptable for Toaster=20
and would be

easier to support.

@Armin, which approach should I take for the 4.x fix ?

Best Regards,

Narpat

>>
>> meta-oe.git on =EE=82=A0 kirkstone [$]
>> =E2=9D=AF fd django_
>> meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> meta-python/recipes-devtools/python/python3-django_4.0.2.bb
>>
>> Can we add a check to ensure that we never have 3 versions of a single
>> recipe at branch time again? It's rare I think but worth discussing
>> the idea.
>>
>> ../Randy
>>
>>
>>> fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
>>> d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in=20
>>> file uploads.
>>> 1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {%=20
>>> debug %} template tag.
>>> a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
>>> 027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and=20
>>> CVE-2021-45452 to security archive.
>>> 0a9a46a1d7 [3.2.x] Post-release version bump.
>>> 6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
>>> 8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path=20
>>> traversal in storage subsystem.
>>> c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential=20
>>> information disclosure in dictsort template filter.
>>> a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in=20
>>> UserAttributeSimilarityValidator.
>>> b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26=20
>>> releases.
>>> ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path()=20
>>> behavior change in Django 2.2.25, 3.1.14, and 3.2.10.
>>> ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
>>> 1cea03ab00 [3.2.x] Post-release version bump.
>>> 0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
>>> 333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential=20
>>> bypass of an upstream access control based on URL paths.
>>> 6014b812e2 [3.2.x] Refs #33333 -- Fixed=20
>>> PickleabilityTestCase.test_annotation_with_callable_default() crash=20
>>> on Oracle.
>>> cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with=20
>>> models.BinaryField on PostgreSQL.
>>> 0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx=20
>>> builds.
>>> 487a2da02e [3.2.x] Added stub release notes and release date for=20
>>> 3.2.10, 3.1.14 and 2.2.25.
>>> 742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
>>> 99532fdadf [3.2.x] Corrected isort example in coding style docs.
>>> 31539a63f2 [3.2.x] Corrected "pip install" call in coding style docs.
>>> 76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
>>> 04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
>>> dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
>>> 9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read=20
>>> The Docs.
>>> 327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The=20
>>> Docs.
>>> bc691d555e [3.2.x] Corrected module reference in contributing tutoria=
l.
>>> 3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
>>> 34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
>>> 21a56d596a [3.2.x] Post-release version bump.
>>> 1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
>>> e299cc2d2c [3.2.x] Added release date for 3.2.9.
>>> 947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party=20
>>> DB backends.
>>> 128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming=20
>>> example to use correct template block.
>>> f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a=20
>>> field with functional indexes on SQLite.
>>> fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length=20
>>> docs.
>>> dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated=20
>>> asyncore and smtpd modules.
>>> 137a9899d7 [3.2.x] Refs #27131 -- Removed=20
>>> SMTPBackendTests.test_server_login().
>>> 1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
>>> 82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in=20
>>> Django 3.2.x.
>>> 1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers=20
>>> and tox.ini.
>>> 53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop()=20
>>> instead of get_event_loop() on Python 3.7+.
>>> f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader()=20
>>> warnings on Python 3.10+.
>>> d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated=20
>>> Thread.setDaemon().
>>> 8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's=20
>>> deprecated distutils.version package.
>>> faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module=20
>>> is not installed.
>>> 329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
>>> 85e4af6a22 [3.2.x] Post-release version bump.
>>> 4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
>>> 65367b0500 [3.2.x] Added release date for 3.2.7.
>>> 51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained=20
>>> with HStoreField key transforms.
>>> 031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
>>> 7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
>>> 6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the=20
>>> admin changelist when actions are both top and bottom.
>>> e235c7815a [3.2.x] Fixed broken links and redirects in docs.
>>> 51e76c922f [3.2.x] Used :rfc: role in=20
>>> docs/topics/conditional-view-processing.txt.
>>> d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for=20
>>> admin's readonly fields in custom admin site.
>>> 561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
>>> 454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in=20
>>> GeoDjango tutorial.
>>> b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
>>> a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and=20
>>> order_by arguments.
>>> 54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of=20
>>> check functions.
>>> 1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
>>> b61f44c339 [3.2.x] Fixed #33082 -- Fixed=20
>>> CommandTests.test_subparser_invalid_option on Python 3.9.7+.
>>> 707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
>>> d5710f405a [3.2.x] Post-release version bump.
>>> 45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
>>> 4b80a40272 [3.2.x] Added release date for 3.2.7.
>>> 4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options=20
>>> are supported by every management command.
>>> fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for=20
>>> fixed offset timezones.
>>> 382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute()=20
>>> signature in docs.
>>> 11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
>>> 69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of=20
>>> cached result by QuerySet.count().
>>> d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
>>> 358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
>>> d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django=20
>>> Forum.
>>> eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django=20
>>> Forum.
>>> 6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
>>> f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing=20
>>> tools docs.
>>> 2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
>>> 87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
>>> e1cad66dca [3.2.x] Post-release version bump.
>>> eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
>>> 70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
>>> d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board=20
>>> description in organization docs.
>>> 99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to=20
>>> organization docs.
>>> ed29959812 [3.2.x] Refs #31676 -- Removed Core team from=20
>>> organization docs.
>>> 55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create()=20
>>> docs.
>>> 5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
>>> aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as=20
>>> preferred over Form.get_initial_for_field().
>>> bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments=20
>>> sections in Model.save() docs.
>>> b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M=20
>>> relation when through_fields is a list.
>>> de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in=20
>>> admin docs where appropriate.
>>> f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
>>> 1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling=20
>>> in DecimalField.validate().
>>> 05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
>>> 9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
>>> 0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
>>> b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
>>> 6931963886 [3.2.x] Fixed typo in=20
>>> docs/internals/contributing/committing-code.txt.
>>> f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship=20
>>> mailing list references in docs.
>>> 527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
>>> 1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent=20
>>> id_list items.
>>> 9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
>>> 92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
>>> 3ab942f10a [3.2.x] Post-release version bump.
>>>
>>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>>> ---
>>> =C2=A0 .../{python3-django_3.2.5.bb =3D> python3-django_3.2.12.bb}=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
>>> 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>> =C2=A0 rename=20
>>> meta-python/recipes-devtools/python/{python3-django_3.2.5.bb =3D>=20
>>> python3-django_3.2.12.bb} (77%)
>>>
>>> diff --git=20
>>> a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb=20
>>> b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>>> similarity index 77%
>>> rename from meta-python/recipes-devtools/python/python3-django_3.2.5.=
bb
>>> rename to meta-python/recipes-devtools/python/python3-django_3.2.12.b=
b
>>> index 5890c8541..ee71f953b 100644
>>> --- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>>> @@ -1,7 +1,7 @@
>>> =C2=A0 require python-django.inc
>>> =C2=A0 inherit setuptools3
>>>
>>> -SRC_URI[sha256sum] =3D=20
>>> "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd"
>>> +SRC_URI[sha256sum] =3D=20
>>> "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
>>>
>>> =C2=A0 RDEPENDS_${PN} +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-sqlparse \
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online=20
>>> (#96163):https://lists.openembedded.org/g/openembedded-devel/message/=
96163
>>> Mute This Topic:https://lists.openembedded.org/mt/89981302/3616765
>>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub=
=20
>>> [randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
>

