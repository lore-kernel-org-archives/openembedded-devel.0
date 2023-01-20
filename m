Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E983FC38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:33:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.64291.1674178394338803152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 17:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=B8H96lix;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03841ac291=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K1PZuC007805
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 17:33:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nzhBKS9ZrU1Xde6Kfl8fUPYm5WiqESGTD7s56F25CFk=;
 b=B8H96lix+ycy9vrTl4y0yQGfLoQMBZ6tLJ6QuBILNo+u6Kj/fXNpgXZ3+GGJnirvolPw
 1kl4BiUcw3XQs4d5HMOwgpTRIuyyt5pThJ/bikS29wtdoZxAsUldoaf6/TXBTYA8g6ms
 zfTT1J+5Tdw4hoRvGIVcQJppqU4op7sYZeZbq6glLUDxOeI3Q8TbTaP8DgEpRTCxUF7d
 s5wQUyH/9FR5XwcatdzW8DugfFvlfehtDrIqDZFTi2vrC6pu+nQTYSDUJJ5uKGpu5YpC
 29XclPQlQQQiNt9TSu7oJDv+STWd94GLZh0WUA7YVKHSfg6sh3IbBNoV+30yvjqYVSEa 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6wtdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 17:33:13 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30K1XD5f023826
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 17:33:13 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6wtdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 17:33:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AocZJ5D6DXb3NqlezrLz6CwhZOvsZl2saO/Z+qT6aEGgZromCisO3i7+/tLwS3M/gkf1SJI7jt4B19nmM2cAyAbtaIqa/eDu84gJ8h5X7bSyEnrvbEi6L20CWzle4nr0Qk7zNCqe/OAR1BrCGqlZCpUq3L64nSQMPzezO7cz/0nJFYeSqpkOvMtfse/mvXoXqTHq29ptTd62x90Smx9GbQMYtyp8hLqAda6smELQeY2qyrDk30t1LRom6XcdgJdWnDZ/i4/4+i5joXhJZyrxFS+lPN7ewkbL17/BhYf/Bx+WdqLhOg4fxolY2mzL67t7TGKgHO/fC1eMCkDTu5xEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzhBKS9ZrU1Xde6Kfl8fUPYm5WiqESGTD7s56F25CFk=;
 b=IFCK3sDxx7ED8wJeu8qfofNG9byAYkCl5Ortskoq8o7AYuOKhPt7AEIEn5pA/r7jIkspHBau6uv01+CWeUh6+AIEKvRyeV5gWQ51mlgBhTKYz0Hk+yPqm9h+a4QhHEyqRfC8h8HkxXnV9y4AZxnV6fODLWMnEjBTYordAPcV2dNbqsRzEMbwj/l24H3hWZUQgI1MaXDTgP6azE7VcOI7Jxdh1I4dZVKRnZzNPr0Ysz3Hyc7mV1hNnRJmpgUZOhSKdgElEye4NdjV8u474dC7vp5jTZ41WzodSnvSrOk+cEpW7LKajMuGiQpAnNnEPn25fJBcZ5pzSGwBYiEXldMIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SA1PR11MB7111.namprd11.prod.outlook.com (2603:10b6:806:2b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Fri, 20 Jan 2023 01:33:08 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a651:a5f7:f7bf:52f6%7]) with mapi id 15.20.6002.025; Fri, 20 Jan 2023
 01:33:08 +0000
Message-ID: <be625167-2724-79ff-867a-d684b5c33880@windriver.com>
Date: Fri, 20 Jan 2023 09:32:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-networking][PATCH] crda: remove recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Cc: troth@openavr.org, openembedded-devel@lists.openembedded.org
References: <20230119083744.33977-1-kai.kang@windriver.com>
 <dd74601a-abc5-b262-8cc5-68042d4d25db@windriver.com>
 <CAMKF1sq43=eswtbdA3LRteMa7JdXcUKD0_uQY46JJZASeO9mpA@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sq43=eswtbdA3LRteMa7JdXcUKD0_uQY46JJZASeO9mpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SA1PR11MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4664de-0a52-4826-1fde-08dafa8648fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SsOdPMHvSs6uJqBCdBtCHZ3s/XGw8d5lDhdKk5aM69sWN8VzlozqzbOn07+u7ZN/gjS2C7jDaddRzNP//hLnYEH3dPr8oOEboTE5iUH/JV4KuWldHyRBnm0mg59RCQ+88EdfpUj6vpn5GjyMtmzYU7OaF23TnCwDGZ4ClbXMIagocQ1gA0r7QTSlKmlnxH/wQ7AjM+pa8u5JF57fJPeATbVZWGQO/H6SYVrR2D76NXU+h6j+FqVxlp2qa62bIG4xTOLTRS4IdEP1sdhuK8JmYobmCbwwxVrCAB2C7ZSh8+lqlRRTu2vyU/I6Spvdq0Y12N2RGfNwTrkLqITrVJJl7lre8F7Uc0eqGjYQWkN5+el05H/A7a5EyyCu+0c7YLZZpkzlgmUJ1+NmqKBSxUXkOmD2FCx8ZhjS9DIJItIDaVzVU4oECY1jfmJ/ZRbu1TWMyR90ph5pYEOH6RYXHYfl5TKKArmzUzQb098vHAEdTuUQoWgVaIkqlSY1T5hxPyaq3W2RRbp4sU8zxzKlzTRkXu+O5rsu4Djsjjx9/r/xCv/MOPBaH/IQclbb2N+F4IVB1ZxKjMjPKCs0/DGxtxpgmBbN38fbWY9dUa3JTQEUyiqK7VlprcZyDPCFbqeNwe8/63jkXUhKGffIyWRJD48wsYE3GDyT0c8BNSIVNYiqCA8157s5G79qlBnPLP70I8d4Elvx3X3R5EcuiQMT46lJLMByQjOyren/DgTGVOHtPtx9F/jYJ/3fbSTIoR+3ohgrBec89voPf+2AE8Taoj5C0CIOKvHmskErxNTLDszESy8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(451199015)(86362001)(2906002)(31696002)(36756003)(966005)(316002)(6486002)(6666004)(110136005)(6636002)(478600001)(8676002)(41300700001)(5660300002)(4001150100001)(66556008)(66476007)(4326008)(30864003)(66946007)(8936002)(38100700002)(53546011)(6506007)(186003)(26005)(6512007)(2616005)(83380400001)(66574015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWNVWFVWRFdVZm9uQXdTWlo3M29mUk9icnF4Wk11R2tHZit4MHpIeXRSdXRa?=
 =?utf-8?B?UGxnZjBWTDY2UElpUEdmVzFEd2RteGxhL0p3ZFE0SStvVnpQTVlQd0VINUxU?=
 =?utf-8?B?UjFOUlVXLytyMHgwYWl5ellFWnBJRmJxbEk2ai9WdDRLeVVRbTZpWXBnTWE0?=
 =?utf-8?B?NVcvbUlUMDBqMkptRXh4MktZYkR0S2FZVWRXTlZRKzJLdXBwc0xFUlk3NmFP?=
 =?utf-8?B?Z1FHMjZsTm5PelB4cllpQnhwN2lqRlkydnJIR2pCM2tMcjdFVU9SYS9VYlhZ?=
 =?utf-8?B?REUxUGo0YXd4a1BhQ2FvK0tOaFJnOGhTTXFCOVpQUlMreE1ETmJ2Y083VXNK?=
 =?utf-8?B?dVcyZk4ySWNNNXMzRitVVXJxTFZXMjVvQldtQ0tCTWMwU3RvbzE2VkYzbHZq?=
 =?utf-8?B?am8zQ1Jza0xHSTJzbCtYY2pPbkRJa3BlcExJdE1Zc3ZDS1VwK3VXMTF1S3Ru?=
 =?utf-8?B?dnlMbzNFR091T0haU1pNYU9ZdlRjQ3NTYm51amJQcUZjcWRqL0FQTzJwQTFG?=
 =?utf-8?B?czhWTVJIZklhdjhMb3JuUDVtc0NQU1pWZmttcmpOR0xvSm4rd3FsWDAvaklC?=
 =?utf-8?B?RG1HL1hFTjRHVU5yakFRVU83OHhhczI5cHlsNnJJTmk3OE82L0xWZEwzQkIr?=
 =?utf-8?B?akJWeVc4NGNxU2xXclRQWGVyYnZqLzJtejhZbTNLbWpSM3VTU1NaUG51SVFS?=
 =?utf-8?B?S2E1VDRXSlR0dWpVdDJvaDYxMTNzbzVETk83RFpsRHZXTlYxZ0tRM2tBajhr?=
 =?utf-8?B?MHpJbEEyc25nTGVHc2dhclZOaHFXakVaa2FtVG9Ga3N5a0VadkM5dGRTT3ls?=
 =?utf-8?B?UEg0bW4yc1BoWnNNSDZFUURCUnRNK1NTTnQ1TDlYM3ZhM01IalhpbTMwdHNy?=
 =?utf-8?B?OW0vSy95QkFaem56R2lsMWZHRGtyaFpOSEQ0K0M4V3dZQmhRc3hSNStrTzhI?=
 =?utf-8?B?TUlJWkxvMUdGYjYzRlhGZVllQXlFQWdtNGVxUjNYZnYrdjlFdDR6bmwwMzBS?=
 =?utf-8?B?QU1haFBSWXVtTWZseEhnbytCZi9FSTZnTENEY2lKWkpmUGFvMGhOQjRyZCt3?=
 =?utf-8?B?cStoL3R0NGdBLzRYYXd2RThwRjNGT2lTOTJKWUtJLzJZa0NxUlMrV1V3UWZN?=
 =?utf-8?B?Q2tHOEJUTFZHZ0RTWVFxczVsM3UzNDVXSThpbEFXdktsWUMrZGtFck9KZTVD?=
 =?utf-8?B?V3I0QWQzNzVWakRqa093cWFjRDczRHdUeVdVTU9JbkxzMEMwdWxsSTdxOEtF?=
 =?utf-8?B?ZWx1OE00RUFMZnJvNkZnSmY1WVNrYy95bFZpK1JpZTZPYStDL3RyUytYdjZM?=
 =?utf-8?B?eEZISklaN2ZwMVJVaFJjMmYzbytwNThJQURDb0dvak5mQStvUnJmMWF2a2pW?=
 =?utf-8?B?VU5wK1dXUExTS01sZXF4Q05odEsvZE1MbDZFNEtwdXlucWgwVzJnTklwaDQz?=
 =?utf-8?B?OFUzSnhWZjBmSE8yRkordHM5S2ZEdG9OVTBFSzlWOWxnUjFKTVFjUEc1ZkJa?=
 =?utf-8?B?L1RWR2EzdGQyN016L2JxR2xuandHRlVxcEtDd0J2ZDVBcXlYWG8zbzg1cUpR?=
 =?utf-8?B?czZqNzlxRXN3UUxETEdaOVlaUmgrL1M4S2VFUk5PcTZxazBXa09sRXJFMEcv?=
 =?utf-8?B?QnBKSXFteXM4amdhTHIwaDQzTlN1dnczYlVHZGRjU3NVUSt5Z0dnbEJJL1Yz?=
 =?utf-8?B?NWNaUWZYU3JJbUdYSlpCZys0UEZ6eDJTckc4NnZtWHdXTERDUXVjdnpiWFYw?=
 =?utf-8?B?RE41RjJENjdFZXNwSTZtVCs5ZExZR1dOVWtkYUN2L2hIVFlhY2IrVmx3WTJW?=
 =?utf-8?B?empEZkRGMU5xUkEzdGtHSGpGbFZoSGlLT2lUUU5xWWpNRENTcFlsMHh1cHhY?=
 =?utf-8?B?YlpWTEhFaFZ6N3JBWlpKMlFrZWl1cnpPSTk1NWpZMU5pOXBNSU5CekdQMDUz?=
 =?utf-8?B?NFFhZHBZM21iQUh5czNXZkdkVGN2Y0FLVVZsYXhjUXptWTUvSG4vMXg4Q3Bz?=
 =?utf-8?B?YlBSaVpzSVpuN3lMM0dOZ0hSQzlvY0RwQ2ZNdTVZbDdCN2Z6OVFGSW1XSUNs?=
 =?utf-8?B?eGlmblBvVFlTZlNDNm9Ra3ZQc3dZenhZQ0tMZDZzQUdBbmNtWmNNd3Fkdi9M?=
 =?utf-8?Q?y84WKwAhmzyWB7CyHapVvKV9v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4664de-0a52-4826-1fde-08dafa8648fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 01:33:08.5578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtQ79TwFwCQImuvT055pyydF3UkUyyyd7owg7uFMqGVe+0XGUxoaV5OeGYX+/rQdcH9EsUxCS35QIowoLtS0ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7111
X-Proofpoint-GUID: MxYKmNpFP4iqJldIEIV876HebrYxbf0m
X-Proofpoint-ORIG-GUID: 4T14yvIKLE3y70T8qfJhlFRwBKjF0t4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_16,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30K1PZuC007805
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jan 2023 01:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100666

On 1/20/23 00:46, Khem Raj wrote:
> On Thu, Jan 19, 2023 at 3:34 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> Add Theo, who changed crda earlier this year:
> And this patch also needs rebasing on top of master or master-next
I am sorry that I've sent patch to update crda to 4.15. But without more=20
thinking, I suppose the recipes

should be removed since we have 5.15 kernel already. Please drop the=20
previous recipe update patch.

Thanks,
Kai

>
>>     https://lists.openembedded.org/g/openembedded-devel/message/97671
>>
>> Does anyone really still need crda?
>>
>> ../Randy
>>
>> On 2023-01-19 03:37, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb4=
5
>>> ("cfg80211: support loading regulatory database as firmware file") ad=
ded
>>> support to use the kernel's firmware request API which looks for the
>>> firmware on /lib/firmware. Because of this CRDA is legacy software fo=
r
>>> older kernels, remove the recipe.
>>>
>>> It could change regulatory domains with iw and wpa_supplicant.
>>>
>>> Refs
>>> 1. https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tr=
ee/README#n8
>>> 2. https://wireless.wiki.kernel.org/en/developers/Regulatory/CRDA
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>    ...-Make-alpha2-to-be-3-characters-long.patch |  31 ------
>>>    ...-Makefile-respect-LDFLAGS-for-libreg.patch |  29 -----
>>>    .../0001-reglib-Remove-unused-variables.patch |  59 ----------
>>>    .../crda/crda/crda-4.14-python-3.patch        | 101 --------------=
----
>>>    ...o-not-run-ldconfig-if-destdir-is-set.patch |  21 ----
>>>    .../crda/fix-gcc-6-unused-variables.patch     |  11 --
>>>    .../crda/fix-issues-when-USE_OPENSSL-1.patch  |  58 ----------
>>>    ...-linking-of-libraries-used-by-reglib.patch |  57 ----------
>>>    .../recipes-connectivity/crda/crda/make.patch |  25 -----
>>>    ...e-target-word-size-instead-of-host-s.patch |  34 ------
>>>    .../recipes-connectivity/crda/crda_3.18.bb    |  40 -------
>>>    11 files changed, 466 deletions(-)
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/0001-reglib-Remove-unused-variables.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/crda-4.14-python-3.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/make.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>>>    delete mode 100644 meta-networking/dynamic-layers/meta-python/reci=
pes-connectivity/crda/crda_3.18.bb
>>>
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-n=
etworking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-=
Make-alpha2-to-be-3-characters-long.patch
>>> deleted file mode 100644
>>> index f1d2cbc5a..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -From 078e962d345fd0536fe7ba797485ee1a4159c032 Mon Sep 17 00:00:00 20=
01
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Fri, 4 Feb 2022 09:18:30 -0800
>>> -Subject: [PATCH] Make alpha2 to be 3 characters long
>>> -
>>> -Fixes buffer overflow
>>> -reglib.c:969:9: error: 'sscanf' may overflow; destination buffer in =
argument 3 has size 2, but the corresponding specifier may require size 3=
 [-Werror,-Wfortify-source]
>>> -                      alpha2,
>>> -                      ^
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - reglib.c | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/reglib.c b/reglib.c
>>> -index e00e9b8..8565a0b 100644
>>> ---- a/reglib.c
>>> -+++ b/reglib.c
>>> -@@ -958,7 +958,7 @@ reglib_parse_rules(FILE *fp, struct ieee80211_re=
gdomain *trd)
>>> - static int reglib_parse_country_dfs(char *line, struct ieee80211_re=
gdomain *rd)
>>> - {
>>> -     char dfs_region_alpha[9];
>>> --    char alpha2[2];
>>> -+    char alpha2[3];
>>> -     int hits;
>>> -
>>> -     memset(rd, 0, sizeof(*rd));
>>> ---
>>> -2.35.1
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-n=
etworking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-=
Makefile-respect-LDFLAGS-for-libreg.patch
>>> deleted file mode 100644
>>> index 16800d506..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>>> +++ /dev/null
>>> @@ -1,29 +0,0 @@
>>> -From 1e1a78b7b4fa1662b4447aa19c15b1e839b7e9db Mon Sep 17 00:00:00 20=
01
>>> -From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-=
klieser@phytec.de>
>>> -Date: Wed, 24 Aug 2016 10:58:45 +0200
>>> -Subject: [PATCH] Makefile: respect LDFLAGS for libreg
>>> -MIME-Version: 1.0
>>> -Content-Type: text/plain; charset=3DUTF-8
>>> -Content-Transfer-Encoding: 8bit
>>> -
>>> -Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.=
de>
>>> ----
>>> - Makefile | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index 2879896..1650db8 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_D=
IR)/*.pem)
>>> -
>>> - $(LIBREG): regdb.h reglib.h reglib.c
>>> -     $(NQ) '  CC  ' $@
>>> --    $(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIB=
REG) $^ $(LIBREGLDLIBS)
>>> -+    $(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIB=
REG) $^ $(LDFLAGS) $(LIBREGLDLIBS)
>>> -
>>> - install-libreg-headers:
>>> -     $(NQ) '  INSTALL  libreg-headers'
>>> ---
>>> -1.9.1
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/0001-reglib-Remove-unused-variables.patch b/meta-networ=
king/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-regli=
b-Remove-unused-variables.patch
>>> deleted file mode 100644
>>> index c6c3c53f1..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/0001-reglib-Remove-unused-variables.patch
>>> +++ /dev/null
>>> @@ -1,59 +0,0 @@
>>> -From 1bd6ff9d10c83afbc9954fc38b953e9167e6d4a9 Mon Sep 17 00:00:00 20=
01
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Sun, 28 Aug 2022 14:01:55 -0700
>>> -Subject: [PATCH] reglib: Remove unused variables
>>> -
>>> -These counters are not used anywhere therefore delete them
>>> -Fixes
>>> -reglib.c:1015:15: error: variable 'i' set but not used [-Werror,-Wun=
used-but-set-variable]
>>> -        unsigned int i =3D 0;
>>> -                     ^
>>> -reglib.c:1062:15: error: variable 'lines' set but not used [-Werror,=
-Wunused-but-set-variable]
>>> -        unsigned int lines =3D 0;
>>> -                     ^
>>> -
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - reglib.c | 4 ----
>>> - 1 file changed, 4 deletions(-)
>>> -
>>> -diff --git a/reglib.c b/reglib.c
>>> -index 8565a0b..6c62c2c 100644
>>> ---- a/reglib.c
>>> -+++ b/reglib.c
>>> -@@ -1012,7 +1012,6 @@ static int reglib_find_next_country_stream(FIL=
E *fp)
>>> - {
>>> -     fpos_t prev_pos;
>>> -     int r;
>>> --    unsigned int i =3D 0;
>>> -
>>> -     while(1) {
>>> -             char line[1024];
>>> -@@ -1030,7 +1029,6 @@ static int reglib_find_next_country_stream(FIL=
E *fp)
>>> -             line_p =3D fgets(line, sizeof(line), fp);
>>> -             if (line_p =3D=3D line) {
>>> -                     if (strspn(line, "\n") =3D=3D strlen(line)) {
>>> --                            i++;
>>> -                             continue;
>>> -                     }
>>> -                     if (strncmp(line, "country", 7) !=3D 0)
>>> -@@ -1059,7 +1057,6 @@ struct ieee80211_regdomain *reglib_parse_count=
ry(FILE *fp)
>>> -
>>> - FILE *reglib_create_parse_stream(FILE *f)
>>> - {
>>> --    unsigned int lines =3D 0;
>>> -     FILE *fp;
>>> -
>>> -     fp =3D tmpfile();
>>> -@@ -1076,7 +1073,6 @@ FILE *reglib_create_parse_stream(FILE *f)
>>> -             if (line_p =3D=3D line) {
>>> -                     if (strchr(line, '#') =3D=3D NULL) {
>>> -                             fputs(line, fp);
>>> --                            lines++;
>>> -                     }
>>> -                     continue;
>>> -             } else
>>> ---
>>> -2.37.2
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-laye=
rs/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
>>> deleted file mode 100644
>>> index 9125d0ab9..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/crda-4.14-python-3.patch
>>> +++ /dev/null
>>> @@ -1,101 +0,0 @@
>>> -Imported from Gentoo
>>> -https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D9c50acec16bc7=
c33d6dc122c007d713e7fbecf9c
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -
>>> ---- a/utils/key2pub.py
>>> -+++ b/utils/key2pub.py
>>> -@@ -1,22 +1,22 @@
>>> --#!/usr/bin/env python
>>> -+#!/usr/bin/env python3
>>> -
>>> - import sys
>>> - try:
>>> -        from M2Crypto import RSA
>>> --except ImportError, e:
>>> -+except ImportError as e:
>>> -        sys.stderr.write('ERROR: Failed to import the "M2Crypto" mod=
ule: %s\n' % e.message)
>>> -        sys.stderr.write('Please install the "M2Crypto" Python modul=
e.\n')
>>> -        sys.stderr.write('On Debian GNU/Linux the package is called =
"python-m2crypto".\n')
>>> -        sys.exit(1)
>>> -
>>> - def print_ssl_64(output, name, val):
>>> --    while val[0] =3D=3D '\0':
>>> -+    while val[0:1] =3D=3D b'\0':
>>> -         val =3D val[1:]
>>> -     while len(val) % 8:
>>> --        val =3D '\0' + val
>>> -+        val =3D b'\0' + val
>>> -     vnew =3D []
>>> -     while len(val):
>>> --        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5]=
, val[6], val[7]))
>>> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4], val[4:=
5], val[5:6], val[6:7], val[7:8]))
>>> -         val =3D val[8:]
>>> -     vnew.reverse()
>>> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew=
)))
>>> -@@ -34,13 +34,13 @@ def print_ssl_64(output, name, val):
>>> -     output.write('};\n\n')
>>> -
>>> - def print_ssl_32(output, name, val):
>>> --    while val[0] =3D=3D '\0':
>>> -+    while val[0:1] =3D=3D b'\0':
>>> -         val =3D val[1:]
>>> -     while len(val) % 4:
>>> --        val =3D '\0' + val
>>> -+        val =3D b'\0' + val
>>> -     vnew =3D []
>>> -     while len(val):
>>> --        vnew.append((val[0], val[1], val[2], val[3], ))
>>> -+        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4]))
>>> -         val =3D val[4:]
>>> -     vnew.reverse()
>>> -     output.write('static BN_ULONG %s[%d] =3D {\n' % (name, len(vnew=
)))
>>> -@@ -81,21 +81,21 @@ struct pubkey {
>>> -
>>> - static struct pubkey keys[] __attribute__((unused))=3D {
>>> - ''')
>>> --    for n in xrange(n + 1):
>>> -+    for n in range(n + 1):
>>> -         output.write('      KEYS(e_%d, n_%d),\n' % (n, n))
>>> -     output.write('};\n')
>>> -     pass
>>> -
>>> - def print_gcrypt(output, name, val):
>>> -     output.write('#include <stdint.h>\n')
>>> --    while val[0] =3D=3D '\0':
>>> -+    while val[0:1] =3D=3D b'\0':
>>> -         val =3D val[1:]
>>> -     output.write('static const uint8_t %s[%d] =3D {\n' % (name, len=
(val)))
>>> -     idx =3D 0
>>> -     for v in val:
>>> -         if not idx:
>>> -             output.write('\t')
>>> --        output.write('0x%.2x, ' % ord(v))
>>> -+        output.write('0x%.2x, ' % (v if sys.version_info[0] >=3D3 e=
lse ord(v)))
>>> -         idx +=3D 1
>>> -         if idx =3D=3D 8:
>>> -             idx =3D 0
>>> -@@ -118,7 +118,7 @@ struct key_params {
>>> -
>>> - static const struct key_params keys[] __attribute__((unused))=3D {
>>> - ''')
>>> --    for n in xrange(n + 1):
>>> -+    for n in range(n + 1):
>>> -         output.write('      KEYS(e_%d, n_%d),\n' % (n, n))
>>> -     output.write('};\n')
>>> -
>>> -@@ -136,7 +136,7 @@ except IndexError:
>>> -     mode =3D None
>>> -
>>> - if not mode in modes:
>>> --    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0]=
, '|'.join(modes.keys()))
>>> -+    print('Usage: %s [%s] input-file... output-file' % (sys.argv[0]=
, '|'.join(modes.keys())))
>>> -     sys.exit(2)
>>> -
>>> - output =3D open(outfile, 'w')
>>> -@@ -154,3 +154,5 @@ for f in files:
>>> -     idx +=3D 1
>>> -
>>> - modes[mode][1](output, idx - 1)
>>> -+
>>> -+output.close()
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-netw=
orking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-r=
un-ldconfig-if-destdir-is-set.patch
>>> deleted file mode 100644
>>> index 3ef35ee54..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>>> +++ /dev/null
>>> @@ -1,21 +0,0 @@
>>> -From: Ben Hutchings <ben@decadent.org.uk>
>>> -Date: Sat, 23 Aug 2014 12:27:34 -0700
>>> -Subject: crda: Do not run ldconfig if DESTDIR is set
>>> -
>>> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wirele=
ss/msg126028.html]
>>> -
>>> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>>> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>> -
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -132,7 +132,9 @@ install-libreg:
>>> -     $(NQ) '  INSTALL  libreg'
>>> -     $(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
>>> -     $(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
>>> -+ifndef DESTDIR
>>> -     $(Q)ldconfig
>>> -+endif
>>> -
>>> - %.o: %.c regdb.h $(LIBREG)
>>> -     $(NQ) '  CC  ' $@
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dyna=
mic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-va=
riables.patch
>>> deleted file mode 100644
>>> index 747804d34..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/fix-gcc-6-unused-variables.patch
>>> +++ /dev/null
>>> @@ -1,11 +0,0 @@
>>> ---- crda-3.18/utils/key2pub.py.orig  2016-06-18 09:54:23.671326113 -=
0400
>>> -+++ crda-3.18/utils/key2pub.py       2016-06-18 09:54:34.387326300 -=
0400
>>> -@@ -115,7 +115,7 @@
>>> -     .n =3D _n, .len_n =3D sizeof(_n),   \
>>> - }
>>> -
>>> --static const struct key_params keys[] =3D {
>>> -+static const struct key_params keys[] __attribute__((unused))=3D {
>>> - ''')
>>> -     for n in xrange(n + 1):
>>> -         output.write('      KEYS(e_%d, n_%d),\n' % (n, n))
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/d=
ynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-=
USE_OPENSSL-1.patch
>>> deleted file mode 100644
>>> index 1bb5c638f..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>>> +++ /dev/null
>>> @@ -1,58 +0,0 @@
>>> -From 8d2164a090f17286ea8291f30a123595cf447dc3 Mon Sep 17 00:00:00 20=
01
>>> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
>>> -Date: Wed, 30 Nov 2016 10:27:36 +0800
>>> -Subject: [PATCH] crda: fix issues when 'USE_OPENSSL=3D1'.
>>> -
>>> -Fxed the below issues if configured with 'USE_OPENSSL=3D1':
>>> -a. keys-ssl.c uses BN_ULONG but doesn't include the openssl headers =
leading
>>> -   to build failures:
>>> -   keys-ssl.c:2:8: error: unknown type name 'BN_ULONG'
>>> -   static BN_ULONG e_0[1] =3D {
>>> -
>>> -b. The large unqualified constants also break building:
>>> -   keys-ssl.c:8:2: warning: overflow in implicit constant conversion=
 [-Woverflow]
>>> -     0x63a2705416a0d8e1, 0xdc9fca11c8ba757b,
>>> -
>>> -c. keys-ssl.c: error: 'keys' defined but not used [-Werror=3Dunused-=
variable]
>>> -   static struct pubkey keys[] =3D {
>>> -
>>> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
>>> ----
>>> - utils/key2pub.py | 5 +++--
>>> - 1 file changed, 3 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/utils/key2pub.py b/utils/key2pub.py
>>> -index 401d58a..3ae00b8 100755
>>> ---- a/utils/key2pub.py
>>> -+++ b/utils/key2pub.py
>>> -@@ -24,7 +24,7 @@ def print_ssl_64(output, name, val):
>>> -     for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
>>> -         if not idx:
>>> -             output.write('\t')
>>> --        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(=
v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
>>> -+        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (o=
rd(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
>>> -         idx +=3D 1
>>> -         if idx =3D=3D 2:
>>> -             idx =3D 0
>>> -@@ -60,6 +60,7 @@ def print_ssl_32(output, name, val):
>>> - def print_ssl(output, name, val):
>>> -     import os
>>> -     output.write('#include <stdint.h>\n')
>>> -+    output.write('#include <openssl/bn.h>\n')
>>> -     if os.getenv('TARGET_BITS') =3D=3D '64':
>>> -         return print_ssl_64(output, name, val)
>>> -     else:
>>> -@@ -78,7 +79,7 @@ struct pubkey {
>>> -
>>> - #define KEYS(e,n)   { KEY(e), KEY(n), }
>>> -
>>> --static struct pubkey keys[] =3D {
>>> -+static struct pubkey keys[] __attribute__((unused))=3D {
>>> - ''')
>>> -     for n in xrange(n + 1):
>>> -         output.write('      KEYS(e_%d, n_%d),\n' % (n, n))
>>> ---
>>> -1.9.1
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-ne=
tworking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-li=
nking-of-libraries-used-by-reglib.patch
>>> deleted file mode 100644
>>> index 812e98379..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>>> +++ /dev/null
>>> @@ -1,57 +0,0 @@
>>> -From 890f5bf2654b695a866262d72bfa9750af921a3b Mon Sep 17 00:00:00 20=
01
>>> -From: Ben Hutchings <ben@decadent.org.uk>
>>> -Date: Sat, 23 Aug 2014 12:26:37 -0700
>>> -Subject: [PATCH] Fix linking of libraries used by libreg
>>> -
>>> -The math and crypto libraries are called by and need to be linked to
>>> -libreg.so, not to the executables.
>>> -
>>> -Upstream-Status: Backport [http://www.spinics.net/lists/linux-wirele=
ss/msg126027.html]
>>> -
>>> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>>> -Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>>> ----
>>> - Makefile | 8 ++++----
>>> - 1 file changed, 4 insertions(+), 4 deletions(-)
>>> -
>>> -diff --git a/Makefile b/Makefile
>>> -index a3ead30..da2dcc3 100644
>>> ---- a/Makefile
>>> -+++ b/Makefile
>>> -@@ -30,7 +30,7 @@ CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
>>> - CFLAGS +=3D -Wall -g
>>> - LDLIBREG +=3D -lreg
>>> - LDLIBS +=3D $(LDLIBREG)
>>> --LDLIBS +=3D -lm
>>> -+LIBREGLDLIBS +=3D -lm
>>> - LIBREG +=3D libreg.so
>>> - LDFLAGS +=3D -L ./
>>> -
>>> -@@ -40,13 +40,13 @@ all_noverify: $(LIBREG) crda intersect regdbdump=
 db2rd optimize
>>> -
>>> - ifeq ($(USE_OPENSSL),1)
>>> - CFLAGS +=3D -DUSE_OPENSSL -DPUBKEY_DIR=3D\"$(RUNTIME_PUBKEY_DIR)\" =
`pkg-config --cflags openssl`
>>> --LDLIBS +=3D `pkg-config --libs openssl`
>>> -+LIBREGLDLIBS +=3D `pkg-config --libs openssl`
>>> -
>>> - $(LIBREG): keys-ssl.c
>>> -
>>> - else
>>> - CFLAGS +=3D -DUSE_GCRYPT
>>> --LDLIBS +=3D -lgcrypt
>>> -+LIBREGLDLIBS +=3D -lgcrypt
>>> -
>>> - $(LIBREG): keys-gcrypt.c
>>> -
>>> -@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_D=
IR)/*.pem)
>>> -
>>> - $(LIBREG): regdb.h reglib.h reglib.c
>>> -     $(NQ) '  CC  ' $@
>>> --    $(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIB=
REG) $^
>>> -+    $(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIB=
REG) $^ $(LIBREGLDLIBS)
>>> -
>>> - install-libreg-headers:
>>> -     $(NQ) '  INSTALL  libreg-headers'
>>> ---
>>> -2.7.4
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python=
/recipes-connectivity/crda/crda/make.patch
>>> deleted file mode 100644
>>> index 0b737852c..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/make.patch
>>> +++ /dev/null
>>> @@ -1,25 +0,0 @@
>>> -These headers are not related to any Make rule but they do appear in
>>> -compiling of libreg.so, specifying .h files in compiler cmdline is f=
lagged
>>> -as error by clang
>>> -
>>> -| clang-4.0: error: cannot specify -o when generating multiple outpu=
t files
>>> -| make: *** [libreg.so] Error 1
>>> -
>>> -This is how we see headers in cmdline
>>> --O2 -fpic -std=3Dgnu
>>> -99 -Wall -Werror -pedantic -Wall -g -DUSE_GCRYPT -DCONFIG_LIBNL30 `p=
kg-config --cflags libnl-3.0`  -o libreg.so -shared -Wl,-soname,libreg.so
>>> -regdb.h reglib.h reglib.c keys-gcrypt.c -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -L ./ -lm -lgcrypt
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -
>>> ---- a/Makefile.kk    2016-11-15 04:54:53.338670000 +0000
>>> -+++ a/Makefile       2016-11-15 04:55:07.718670000 +0000
>>> -@@ -114,7 +114,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
>>> -     $(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
>>> -     $(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
>>> -
>>> --$(LIBREG): regdb.h reglib.h reglib.c
>>> -+$(LIBREG): reglib.c
>>> -     $(NQ) '  CC  ' $@
>>> -     $(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -shared -Wl,-soname,$(LIB=
REG) $^ $(LDFLAGS) $(LIBREGLDLIBS)
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-net=
working/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-tar=
get-word-size-instead-of-host-s.patch
>>> deleted file mode 100644
>>> index 100b765f2..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda/use-target-word-size-instead-of-host-s.patch
>>> +++ /dev/null
>>> @@ -1,34 +0,0 @@
>>> -From c1c42513edd27c97341f2033af77c13a4724eb8f Mon Sep 17 00:00:00 20=
01
>>> -From: Haiqing Bai <Haiqing.Bai@windriver.com>
>>> -Date: Fri, 25 Nov 2016 16:48:01 +0800
>>> -Subject: [PATCH] crda: Use target word size instead of host's.
>>> -
>>> -In key2pub.py, the codes check the wordsize
>>> -of the host machine but not the target's, this fix
>>> -fetches the wordsize of target from the build system.
>>> -
>>> -Upstream-Status: Pending
>>> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
>>> ----
>>> - utils/key2pub.py | 4 ++--
>>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/utils/key2pub.py b/utils/key2pub.py
>>> -index 3e84cd2..401d58a 100755
>>> ---- a/utils/key2pub.py
>>> -+++ b/utils/key2pub.py
>>> -@@ -58,9 +58,9 @@ def print_ssl_32(output, name, val):
>>> -     output.write('};\n\n')
>>> -
>>> - def print_ssl(output, name, val):
>>> --    import struct
>>> -+    import os
>>> -     output.write('#include <stdint.h>\n')
>>> --    if len(struct.pack('@L', 0)) =3D=3D 8:
>>> -+    if os.getenv('TARGET_BITS') =3D=3D '64':
>>> -         return print_ssl_64(output, name, val)
>>> -     else:
>>> -         return print_ssl_32(output, name, val)
>>> ---
>>> -1.9.1
>>> -
>>> diff --git a/meta-networking/dynamic-layers/meta-python/recipes-conne=
ctivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/re=
cipes-connectivity/crda/crda_3.18.bb
>>> deleted file mode 100644
>>> index 2f4d4dac9..000000000
>>> --- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity=
/crda/crda_3.18.bb
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -SUMMARY =3D "Wireless Central Regulatory Domain Agent"
>>> -HOMEPAGE =3D "http://wireless.kernel.org/en/developers/Regulatory/CR=
DA"
>>> -SECTION =3D "net"
>>> -LICENSE =3D "copyleft-next-0.3.0"
>>> -LIC_FILES_CHKSUM =3D "file://copyleft-next-0.3.0;md5=3D8743a2c359037=
d4d329a31e79eabeffe"
>>> -
>>> -DEPENDS =3D "python3-m2crypto-native libnl libgcrypt"
>>> -
>>> -SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP=
}.tar.xz \
>>> -           file://do-not-run-ldconfig-if-destdir-is-set.patch \
>>> -           file://fix-linking-of-libraries-used-by-reglib.patch \
>>> -           file://fix-gcc-6-unused-variables.patch \
>>> -           file://0001-Makefile-respect-LDFLAGS-for-libreg.patch \
>>> -           file://make.patch \
>>> -           file://use-target-word-size-instead-of-host-s.patch \
>>> -           file://fix-issues-when-USE_OPENSSL-1.patch \
>>> -           file://crda-4.14-python-3.patch \
>>> -           file://0001-Make-alpha2-to-be-3-characters-long.patch \
>>> -           file://0001-reglib-Remove-unused-variables.patch \
>>> -"
>>> -SRC_URI[md5sum] =3D "0431fef3067bf503dfb464069f06163a"
>>> -SRC_URI[sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb19=
4afa7aa921b01e8ecdbf"
>>> -
>>> -inherit pkgconfig python3-dir python3native siteinfo
>>> -
>>> -# Recursive make problem
>>> -EXTRA_OEMAKE =3D "MAKEFLAGS=3D DESTDIR=3D${D} LIBDIR=3D${libdir}/crd=
a LDLIBREG=3D'-Wl,-rpath,${libdir}/crda -lreg' \
>>> -                UDEV_RULE_DIR=3D${nonarch_base_libdir}/udev/rules.d/=
"
>>> -TARGET_BITS =3D "${SITEINFO_BITS}"
>>> -export TARGET_BITS
>>> -
>>> -do_compile() {
>>> -    oe_runmake all_noverify
>>> -}
>>> -
>>> -do_install() {
>>> -    oe_runmake SBINDIR=3D${sbindir}/ install
>>> -}
>>> -
>>> -RDEPENDS:${PN} =3D "udev wireless-regdb"
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>

--=20
Kai Kang
Wind River Linux


