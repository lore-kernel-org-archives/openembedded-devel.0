Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62B8CD4945
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:18:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20171.1695385101588559220
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=X3T+22v2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7629d4ac35=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38MA0WN7004326
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ROEERngvEOIzcrr0x2BHpLG9zZ9l93s218c6HcdufKI=; b=
	X3T+22v2KvLcbVa/8D3tApTyD1XEfiOEOP362VFZ6c15NadR3WK31f/GCL2/0BiA
	NrI8VcaYK/aE17r5lHtnl5eT2R8oNl4hO528BwOyTSGBkw2VnPsVD6JPLcH8Vikx
	jZuzD/FlwEyEBlu9xae7ukyydFlbPhjvnLYvi6T5uCyBld+DEw1+CJ1FBCKkCND1
	g4njzkNlZqP+wZipf6yTYlFj4ejdc3Jk2kQF0yCotIYH8rmrWgaTWVKR186LADZV
	Ej5tOeLsEZHHf8rxIMTj1ios+msxqbTEIFJWvZNM4LfoWVD20bXuZvY0BPKJEcyW
	hkj01fg/8K3TVjteft//Ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tvx0qu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:20 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38MCIKL0022784
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tvx0qtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 12:18:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1jmDb0s8Q/UtWVNEmmHL47yfKADS/JZAdZ9MWZ6E4x7euW35xlLfpU5v7KD0zVxnNPAhQ9nruxNpFKMUftupzCR+ddlMwtpDHkTIKcDF7SuVUSBTIndnfeXnZ6DUcq2enKphHMb/2hWe/ROFbJCzphZpuVpMrGkAJZw2OA3K5jGU8UUXzotR0+gey3oryP+niwPrYX1bJvikhAmA38HxnxDoGOu9U0xJOBowa08azJGgEGDjszMaAUlAzVCvCVWTDnZPPfAlMxmRm9LWS33Q7O7qgnyu3SkJUjxRj2jX+7vLAfk4Rt/MeBzWbw38lkGEaZsJ90o2AdEqVLUmZROIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROEERngvEOIzcrr0x2BHpLG9zZ9l93s218c6HcdufKI=;
 b=Zmt4bC8KO87DcHXKA/5X/7xVbfUm3t5DgmAhbn8YzA6pxW4RsgBSi3MsHMkOiZq2A6RkYJeSdtJTjit9PrkxPA/hkieCHr33jVDkC54tPcMUFXeAo9qBWVr6r8i6wUpe0JuR9LdxHDOoIY0Bvgi/tBm9v+Fuj37Xz7b9ddu+PFVRoE6hum0Cmb4fyXr+pe/o0zrmpnZHSfcl0xRIh2SGE45UJ3LD3jDAf7O0zzP0mr1wbpGFydopmKH73i2b/70ZKBviYef0FnY4CIEuD008xaIkQHumaw1od3V+DIkwxwT5NKeHd5yS6/0gnxu0gYShH+x36BHOWlmXsIHR7cTsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 12:18:16 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::8271:f46f:9f87:e2c3%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 12:18:15 +0000
Message-ID: <799cea32-9ffc-bc98-59ce-2fc9d11f364e@windriver.com>
Date: Fri, 22 Sep 2023 17:44:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [oe] [meta-python][kirkstone][PATCH v2 1/2]
 python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <177DFD1376FBF60F.28529@lists.openembedded.org>
 <1782D9483FC3D259.9600@lists.openembedded.org>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <1782D9483FC3D259.9600@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 4522c4ce-cf37-4e2b-b9c3-08dbbb65ff78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xnBx9qV9i6SjNeq2oZqf8LnHS7I4dGd+1XoIYSpbia5iFMuXXiyRSLygkyJ51p/Ye6jK0iiAlVji3lj/uBdlvRjP4NlkJPNQ7xDxN9d57iEdn7ByAb9lNNRtoni8ztl7CFZLDc9wvse6ZQaiWGBOIs37HwOFD8FiUY/iadxokeOYEKmMaBITIDB5gOXAxH/LRhQ3tIRWqwu3LEk6u+nLyZiVz7xdSG7jd2QmX1A55g/I6IWJEvkZYfmTDuztV+qBp979eqn0eep8SuTqCjxR7+gBFyRIHV2zF6pYhqghr1ya4YS3muOYjxcRt32pzBxSe8NA07t5MiGRlucVK/Ms5t+ViI5betWq5Lh1Pesw6F8QVsm6klQHn7RzAq9Nc/m25fo1Vi0SNAaEGkL6PN1VtYbA+Saa4glqeX6+YlCcYstNORH66z8S7uDPGEC0gSYS6i2ELxbcfudjTas3Y4PK3qOzkaHjsQo9honQRaqnVtJl4Ygre5nSfsIccokTKC1zAIMgfWOc0O1YTGgMgbtWhbImICBxdcFbSCwssQTiIgHBskc380cQtoOGm84/gHjkZQfKrc3GrINsb0JbJ50oi9Bwpe34U5CHuYjdh4ORK3Xak0byvUcR8yy3sZ+6SzaxClr+l5FN9M9xpI/8eIwbhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(451199024)(1800799009)(186009)(2906002)(31686004)(5660300002)(26005)(66946007)(316002)(66556008)(66476007)(41300700001)(478600001)(966005)(8936002)(8676002)(6666004)(6486002)(53546011)(6506007)(55236004)(66899024)(6512007)(36756003)(2616005)(38100700002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHQ3SFg1ZUxXS2wwejh2ZUkrR2FMYXR5d21wZ2JzZ3JETzF4THhrdlRYOHR0?=
 =?utf-8?B?UTdkS0FrbnQ0S09pOGFDaG1BR1VVdXRMbUFuOUZoOU5aK2I4YmMvaGJRWjQx?=
 =?utf-8?B?aTZxNXlLbmloYzdTVndNRkh1N2kxYVd5KzVQS1JLZFhpR3NtMnJvS3ZkZE5B?=
 =?utf-8?B?Mm0xUFhQRVd3U2JOeGRFLzcraVlyL3N4YlQ5NC9nS1pNTmZ6Mjd4UlRBR0ZU?=
 =?utf-8?B?UDh0MUMyOXlaUGhoNHQ1Nm8zelBjNWVwZmlKcDBxVUgrZi93dGtSNHBsZjc5?=
 =?utf-8?B?Vk5WSkt6QU8vUmNrTEhTcUF2V2lBMkwrRjJ3UFhRMkJIOUdBY1RJeDNjRWZN?=
 =?utf-8?B?V3RGK04wMnFlNWpiTVRKajhyT2xUVlZmMjNnRTIxMy84RXFZYitiVHNlb0Q1?=
 =?utf-8?B?TU4wZ3p3QlFjM21CN0tKU2dEcmhGVTR4TVRPTFgwZVRRZWJQbWFhdVU5OXM1?=
 =?utf-8?B?WlkrMFV3czJ0VGFjbXd1Mk1VV3dsNTE3L29QQjhiTU03UEtiZ0NvU3BJNEpN?=
 =?utf-8?B?UVQwU3pEL0VDTkkzYldDWS9KZU15L3NTYzlKT3NKbXZpY1YrOFBOa28wNEdR?=
 =?utf-8?B?cXBPT093RzJQenBvV0dTNmswcUQrV3QrV3dHdVFaMSthaTNXRkFQbVFhSXVu?=
 =?utf-8?B?b3A4YTJXMFRYWGRtM0dtWCtIWFJxc3duMUNPdUZ5aUh1UEhaS1lNK2F1cTFt?=
 =?utf-8?B?OUJaQTFLSXBSZndOU3dnTnZOU2dZMzR2S1NFODZ5ei9yckl6L3QrNzJ1bXA4?=
 =?utf-8?B?aS9zL0dDVDJTa0JRbjZ0MjNTSXZRUjc4aUR1aHhWQ21IVkMvNXNnRUo0eHo5?=
 =?utf-8?B?VUtUaUdOL3VjRm1qVDNWZEVMb1BUMzBRNUlTcWIvdWJhRXZWVExBT0hhZFJL?=
 =?utf-8?B?MHlBUVIzWU1mUC9UeU1kWkJ3cGhWZFFmYzRUU3huc1JqVVdrS2N6dy8vTzNN?=
 =?utf-8?B?dDdMdkJWbFRCcGxYNnRLbWMwVDNxb2d5bFBhSE15MVRjS0FtWTFpWDlkUUxW?=
 =?utf-8?B?K2ZIQ0F1TXdjMFhwcVFsZFNYOFc5dDdYa2pudzU5YmdHV0FOM0RmczhsNERV?=
 =?utf-8?B?VzFJYkZKZWlkTkoyTDlUNXRWcHQvNHhwWXVSQ3RBVTZOalArdFlSa0pRM1Vr?=
 =?utf-8?B?VlBqMXMrUmM0eldhQ1RYdHlGbTVVMzJnVFl6OHk4eXh2M3dmM3d6Um9xZDZt?=
 =?utf-8?B?NEhKbnlLdlROREtJZXFWeC9wREUvR3hRRGRHWW5UMktwOXBMemVzcW9LdGhX?=
 =?utf-8?B?REl1RTBNYXVvZ3A0YlRUZ05SUW9udE5ua29kK1hSdnlEVW9XT1Y1TS9DVUd1?=
 =?utf-8?B?STZTWkQ1bmk1RGVJa1ZEdk9MSEtOOHQzS3RyQk5YQUlkTzlVSFhlbWRZSEZp?=
 =?utf-8?B?YlNrOWt2REEwTFN5VnVKdG0xNnR6Z1BCUDBNNDBwVjJUWkxRUlZoY3d2ckF0?=
 =?utf-8?B?VkJtSG5mejVoYWhjRzFVM1ZsajU1Q3BmUlorWVdleGdaNW1LNWU3Z2RmMWt5?=
 =?utf-8?B?RThhZ3VNVG5rakxKTW1ZQnkyUGpWUnZYZ2ZsbENpTmJnNnFvRmoxYURoME91?=
 =?utf-8?B?WlBBL2kwY1A0Ull3a1Fjc3U1TWVCczZNRGVUeENZRStrNlh1NktEcU9hTVF4?=
 =?utf-8?B?UGhzblp2ZmhqRDhYQnYxOU96bGlhaDFzUnkyYnJNejBHc2F5Ykd6V0docm1U?=
 =?utf-8?B?NENsUzZKanhJS0xjaDF0enpwdDRjWndwT1d0L2hTcmkvbkNqWU9VOXhUNWU0?=
 =?utf-8?B?aEVoNE8rQllZRDF3dlZCSncyUll1enJBd280THphSlp6bWlUMDZIRmR6UHpm?=
 =?utf-8?B?U2ZkUk16WDRMQVJzMTFEY1htcnBGb3dsZ211eW9vbXZVbUFYS25CeXRjNkFW?=
 =?utf-8?B?b2lsQ3VSZkVZVXFwRzVqWXNjbTVvSHF5cjNHVkdjNklQM1k3N05BUnNYL0ls?=
 =?utf-8?B?Q1JiZUcwWVBSNnUvNVlVME1DcXVjcG1XV21NQ0VETTBlRDk2T2RsbjF3M21B?=
 =?utf-8?B?VnBnZktqOFFZUEcvaHpnZCtUcnNPbkVNSXl5NWdnT3I0aHJsbnF2TGJCVU9D?=
 =?utf-8?B?MnFjZ3hjT3I2dXczOXlodDFrbW9UVFR1MlRML1NsbGpUblhPUCtQQUREY1E1?=
 =?utf-8?B?VmhMYlZYRlBmNm13MEJhRjhKUXhPUS9NQzZyNFQrdVBnVi9ReTNXemNhVzQ3?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4522c4ce-cf37-4e2b-b9c3-08dbbb65ff78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 12:18:15.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdDZLKN1Ec7stBbXAayMhNEFTrjIq06E2GDXWSAAguDtXFkNUfRm6H1ibQ1cr78GrRZs73VRg4U8Ay9qgXKJCbLOuMzI7knhSXHhBZpMOO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4965
X-Proofpoint-ORIG-GUID: KIRAN9IsDWhSQ3iJsYTk_Rk_Amau8lYX
X-Proofpoint-GUID: PKIHQA-oHKzXeKkac-RKY3sDgOkEZcKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38MA0WN7004326
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105060

Gentle Reminder !!

../Narpat

On 08-09-2023 12:08, Narpat Mali via lists.openembedded.org wrote:
> Gentle Reminder !!
>
> ../Narpat
>
> On 23-08-2023 16:11, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> Changelog:
>> https://pyup.io/packages/pypi/requests-toolbelt/changelog
>> https://github.com/requests/toolbelt/blob/master/HISTORY.rst
>>
>> - License-Update: url of License changed from http to https.
>> - Fixing missing newline in dump utility.
>> - Add support for preparing requests in BaseUrlSession.
>> - Fix urllib3 warning to only emit on X509Adapter usage
>>
>> Upstream master patches:
>> 0.9.1 -> 0.10.0=C2=A0 :=20
>> https://git.openembedded.org/meta-openembedded/commit/?id=3Da4f2646ef2=
7a3f27bc607d57b8166071f307426f
>> 0.10.0 -> 0.10.1 :=20
>> https://git.openembedded.org/meta-openembedded/commit/?id=3Db5cd6f6164=
eb3ab0403f610236ac0cbbe5459671
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>> =C2=A0 ...abc-deprecation-warning-in-downloadu.patch | 41 ------------=
-------
>> =C2=A0 ...bb =3D> python3-requests-toolbelt_0.10.1.bb} |=C2=A0 8 ++--
>> =C2=A0 2 files changed, 3 insertions(+), 46 deletions(-)
>> =C2=A0 delete mode 100644=20
>> meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-Fix=
-collections.abc-deprecation-warning-in-downloadu.patch
>> =C2=A0 rename=20
>> meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.b=
b=20
>> =3D> python3-requests-toolbelt_0.10.1.bb} (70%)
>>
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch=20
>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch=20
>>
>> deleted file mode 100644
>> index baa833b6d2..0000000000
>> ---=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/0001-F=
ix-collections.abc-deprecation-warning-in-downloadu.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From 7188b06330e5260be20bce8cbcf0d5ae44e34eaf Mon Sep 17 00:00:00 200=
1
>> -From: Jon Dufresne <jon.dufresne@gmail.com>
>> -Date: Fri, 1 Feb 2019 16:30:01 -0800
>> -Subject: [PATCH] Fix collections.abc deprecation warning in=20
>> downloadutils
>> -
>> -Warning appears as:
>> -
>> -tests/test_downloadutils.py::test_stream_response_to_specific_filenam=
e
>> -=C2=A0 requests_toolbelt/downloadutils/stream.py:161: DeprecationWarn=
ing:=20
>> Using or importing the ABCs from 'collections' instead of from=20
>> 'collections.abc' is deprecated, and in 3.8 it will stop working
>> -=C2=A0=C2=A0=C2=A0 if path and isinstance(getattr(path, 'write', None=
),=20
>> collections.Callable):
>> -
>> -Upstream-Status: Backport=20
>> [https://github.com/requests/toolbelt/commit/7188b06330e5260be20bce8cb=
cf0d5ae44e34eaf]
>> -
>> -Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ----
>> - requests_toolbelt/downloadutils/stream.py | 3 +--
>> - 1 file changed, 1 insertion(+), 2 deletions(-)
>> -
>> -diff --git a/requests_toolbelt/downloadutils/stream.py=20
>> b/requests_toolbelt/downloadutils/stream.py
>> -index eed60a7..1d1c31b 100644
>> ---- a/requests_toolbelt/downloadutils/stream.py
>> -+++ b/requests_toolbelt/downloadutils/stream.py
>> -@@ -1,6 +1,5 @@
>> - # -*- coding: utf-8 -*-
>> - """Utilities for dealing with streamed requests."""
>> --import collections
>> - import os.path
>> - import re
>> -
>> -@@ -158,7 +157,7 @@ def stream_response_to_file(response, path=3DNone=
,=20
>> chunksize=3D_DEFAULT_CHUNKSIZE):
>> -=C2=A0=C2=A0=C2=A0=C2=A0 pre_opened =3D False
>> -=C2=A0=C2=A0=C2=A0=C2=A0 fd =3D None
>> -=C2=A0=C2=A0=C2=A0=C2=A0 filename =3D None
>> --=C2=A0=C2=A0=C2=A0 if path and isinstance(getattr(path, 'write', Non=
e),=20
>> collections.Callable):
>> -+=C2=A0=C2=A0=C2=A0 if path and callable(getattr(path, 'write', None)=
):
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pre_opened =3D True
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd =3D path
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filename =3D getattr=
(fd, 'name', None)
>> ---
>> -2.25.1
>> -
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb=20
>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb=20
>>
>> similarity index 70%
>> rename from=20
>> meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>> rename to=20
>> meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.b=
b
>> index 72ad7a6180..c39950ab5d 100644
>> ---=20
>> a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.=
bb
>> +++=20
>> b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1=
.bb
>> @@ -3,14 +3,12 @@ HOMEPAGE =3D "https://toolbelt.readthedocs.org"
>> =C2=A0 AUTHOR =3D "Ian Cordasco, Cory Benfield"
>> =C2=A0 =C2=A0 LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D71760e0f1dda8cff91b0bc9246caf571"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D6f14302a4b4099009ab38b4dde5f1075"
>> =C2=A0 =C2=A0 SRC_URI =3D "file://run-ptest \
>> -=20
>> file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch=
 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 -SRC_URI[md5sum] =3D "b1509735c4b4cf95df2619facbc3672e"
>> -SRC_URI[sha256sum] =3D=20
>> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
>> +SRC_URI[sha256sum] =3D=20
>> "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
>> =C2=A0 =C2=A0 inherit pypi setuptools3 ptest
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104798): https://lists.openembedded.org/g/openembed=
ded-devel/message/104798
> Mute This Topic: https://lists.openembedded.org/mt/100912004/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

