Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79AEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 06:21:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10086.1687933277654492465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 23:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ptrEpYRS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55433dcc83=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35S5raNA008298
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 23:21:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Y+7MmiR4xbKj/J/e94C
	7kB7hsUqzc9V8hZDkHjjPcFY=; b=ptrEpYRSmYt7s+n76itZyI4K7WOpo/W+nBY
	fjsRQ1qu1p6NDVij9jCTYzj6QSOh0RmfwVs1jZ2Wj28qPZaqH1+0FiQXyfT6fdLe
	ZAJ/eX8sMnuOfrIQav0qGlj4D+ZbeHtp+MtCxeL7u1L8POdt1SNesNXhF/imIVkp
	y5AgTRuJque9cLmKtLVcM2JumMLZAI2AsSvy4CYWouqu4jCFqGL1RdRS049oe60G
	aISk/LkIknN/xzBLLiIvuVARqGWN3fZAKqHdrW9glDWrjXtqgZrvD/Ys80ryDl0c
	9VKCMPDKTlQ4ZultE29WHfKhfHPHIbwuc1YzztONj86Mt1Ru9ew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb2s8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 23:21:16 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35S6LFtT024046;
	Tue, 27 Jun 2023 23:21:15 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb2s8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 23:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apktgetcIvfkarSH870HvsweaXr0L0GvlauMxM1Z0e8sVo1vT5ocCMh040q3PfoPq5iys7sNtMr7cqM4tgyR6X9UfF2sqRGqsKxSRX9iUUE80LtTY9x1OEZ2syLVot8ePZkCMCkiIWwX/btloZSxJNka39lDBwBDiYhEWwttQOXqdMUQbImnSksk2qsNSSwSN3BnyvD1jr+kPihqL8O9LcZs658FtlA+uDySymQlW98ww0dbILYsPVkcwU6y8e+ay5zwJXlMIwzajRMce/VeGJTVE9wnBW9OCjAr8UhsVxNbbg5GoliB42+TMwQKIo+ZkenJRMyHcT0ogZkzvVqZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+7MmiR4xbKj/J/e94C7kB7hsUqzc9V8hZDkHjjPcFY=;
 b=CoQDJnaTwLDmMXCeTzXS0aPcTdjCYtqEDwKpNLTQ8EHylN6rllh0sv5q/zB0WxtBrK9SleRjDXm17hYh2YbnlrKU70sineWqPFMNVbcdsNy56bcHdmZ+Cy0E+s0raYweFyHjKH1d3iy/MBEhfDXGRKa7GZF73h1H0GNbFKKjOWc+syiedYSrRs7UQMFujJd9Ja0vGcvOxuPVj3/0Fs3tHV7bzHPOWpw+kFk3J2rQwQsO6Snto8y+FPYFSn3ThLgupB9N3ddTcDOAd0fFxyH3g2Sj4jmu9B4Wedoj9XTWWgiXQ3SojZEgfPNNc+b574U2mGTUdySzsiAC+bFZV7Oqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 06:21:10 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981%4]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 06:21:10 +0000
Content-Type: multipart/alternative;
 boundary="------------PywyqnjZsZSkQ6g7tVcuQ1uy"
Message-ID: <fdc9bf44-d91f-949b-ec60-38d9e07ed9d1@windriver.com>
Date: Wed, 28 Jun 2023 11:48:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for
 CVE-2023-23934
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
References: <20230510134849.562209-1-narpat.mali@windriver.com>
 <CA+chaQe7hfFSzZHbSkhDA2qN9dSd8tdr5oAjWTJj5rZqqa1MQg@mail.gmail.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <CA+chaQe7hfFSzZHbSkhDA2qN9dSd8tdr5oAjWTJj5rZqqa1MQg@mail.gmail.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b37b9f-98ad-4bde-8c33-08db779fdd4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oEFkTW9UsHFa+l3JGL3Es2yoY64f6VVJJypZVvyOlqKdqgyl3K5h7sVHaUsAip/V8T6hZgVsoNrHc4vNlj5ZdiDrSwr/FNL28R2A1w3tLbgmUIp3DvbPlEK65cFB43f9oSZI6p2xX/bgWjllRYuTkQc6mr+WdeQ76Oqcm4awlxsmx3dQ6TDD0k2LH3tXG6Y0DgbZ1L1YeA8wbWGWggPtWuC/v6pDiqDfJZq59v2cAJ9Dircq0QDDU6SEJMozf90CCzfWcuVXh6iBn/h8yJ6qLO0TSw3iEXvZOt2TPFkdbgROqhhkcVpjnBkfHX/tRcpa8JAk0mPKuFrCnIZ//kjIeP4fvt3LQNWdbn10x6FjM0PwbiBXOKsww98Npe5mEMbb+78cNX/4sjEDbcgZhlUzlVW3EFBO1x+nNOHMPKcrlVuhXHVZJNWDiOiYOOi2Wbo2alwUahvhlyC+EuOZAIyxA1Io8HxqdazvAsxmuGh/YtknYxo/dfnumIChDiuBdlGviQ2bYUH+Qfs54iMLLbGkk65T/7FgANby3+HbEZppyO+rAVN/+T0tBBsEhoReCUy+KrbIXquf1TKd/yTarWUoMn7F0SlqGj0GaIjnyh3YVRDGyOvE0RgKgTztUVuJUOrXt3OUnN3wkQZFddwi5S/6dYlv9f5dbIwdILtvyprHL1c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(451199021)(31686004)(66899021)(36756003)(38100700002)(30864003)(5660300002)(86362001)(41300700001)(66476007)(6916009)(166002)(8936002)(8676002)(66556008)(316002)(4326008)(66946007)(31696002)(478600001)(107886003)(6486002)(966005)(66574015)(186003)(6506007)(53546011)(6512007)(26005)(33964004)(2906002)(83380400001)(6666004)(2616005)(1910800001)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmgrKzlBK2ZXeThGT28rcERMeFF1ekVXOTY1NE4vTjBKOEYxVkV5NzFSS2E0?=
 =?utf-8?B?YnpURlpCc3NMNi9Zc1pBYTVYWWZONW11WlI2RUJuTzV2MXo2aUFGTWczT3do?=
 =?utf-8?B?YUxPTXJTTUVWN2pyMUplM1o1Z0VpdWI0UlpZZkZIMm9vK3B2ZzEwSzFCNnZn?=
 =?utf-8?B?b2xlUloxakMydlNNYk54Um5zTEltemcyc0VYT3B5eEFJbUlkeER3ZS9tUzZF?=
 =?utf-8?B?MU5LdENPZTJ5QzdoQzk3OTYyS2NidmcxdEdFZWdpUW4wdk42V1ozSTJaVTRS?=
 =?utf-8?B?dzRzQnE2NjUvNXpYeE10UTlsVXR6N1lxZmZtaUlTbFZNVW5pcW50dWxtMmhE?=
 =?utf-8?B?Tm9WSDNCaDNXUVVWeUtHQXM3Sy9HL0F2VW5RaTBsQ1FwSHNqaHFRNFRnN090?=
 =?utf-8?B?VEtoM0dwMUZnY2hiNm81OURHK0p5T1FiTzY5VFJ4YUJhdDNMVkw4bEJPYno0?=
 =?utf-8?B?U29kdzdtMVByU3Iwa3VEanNFa1ZsdDJ1RjBiR3NwLzJhTlZabmM5cmEyWEJ0?=
 =?utf-8?B?b29FUVhvb0FoOEFlWElPWFVlSzlMUW13a1gvaDQ3SWs5UEJqYzJiZWdzT1k1?=
 =?utf-8?B?REJvYU5TSWUwVC9TWnVUcVNNR2RIU3RNZkErRjB2QUM4ektnTWZhY3ozUjgy?=
 =?utf-8?B?S1dOVW41WU9TQjY3Z0lqOXV0K2pmek1hMDRWVU1SUU92KytIY3c0Q0dycjRG?=
 =?utf-8?B?Z0VHeWRkcjVQVXkxeXk2cEtvK0xMVk1PNXVZdWw3RWQrbHlnQWJBZ0pwQ3Rj?=
 =?utf-8?B?bUYvd3orUyt2NUtJTmhqK3FiaGNGTXQ1SWlnK0x2NDhKK3M2aXgvVHM4UEF2?=
 =?utf-8?B?YjlmcURDcWtWaU9NVEJWODZobStqSjdKallHa1czekZGSXRsYW5HYzJ5ZTBJ?=
 =?utf-8?B?dnVmL1ZpM01ZeTBsZVZDZm1rRWowOFU4amJhd1ZsOThyMHlQRmZGQ09xZFdy?=
 =?utf-8?B?Z09VWjlzSFJaSkk5UVN2bUlXSkxqcGI1RDd6V3orUXBYRW5BNHpGQi9ySW0w?=
 =?utf-8?B?dk1VR1JremJpenRicDV2c01tUktMQU9NQjc5YmRUSG1aanFLSElqdWhrVnI0?=
 =?utf-8?B?enJrajREZjFJVGErVDFBa1RVbDdwZGhtQ1Bha0x1a3NvZ0hGWlVLQ0VtR0F6?=
 =?utf-8?B?ZmVXMFRrcjNyRE5rVWlvNkliN2Zvdzh6eGp6QXNEWnJlODdYNksvN096czcz?=
 =?utf-8?B?ZXhlZGoyV0Vyd1RvNnRncURTODNJS3RJbjdHWmNvcFkxVEFDWXNZUTcxai9n?=
 =?utf-8?B?YjlyNkNmVU1GWXNjUmg0aEV3TURQanFHRlBNejlXN3RvTHo3dmpBTHIrbGkv?=
 =?utf-8?B?WlR3SENsU0c2ZUNDSXlES25sL0JaTWs2VGMxcmxuVDg4YlRqZmJuZEE5Q0hq?=
 =?utf-8?B?dTE1ZXBzSzBVUXlKbld0QzZyUHlCa0h2UTlFV3l4bkhRb2VqbUJyNy9MWUoy?=
 =?utf-8?B?dDVlQXpDQzdSVXFKY3l4akh5VUFGMGZhd2JOV0l2cGp0b3NWQnEzc3kybHVq?=
 =?utf-8?B?TWh3TFZqa2N3dyt4L2FPKzhrUzNuUFhqZWFCdWwrSisrMHI4d3JycENJUUR5?=
 =?utf-8?B?Q3B5UUs3ZXQ4V3NFZmJMQTZxeGNCcHJLbDY2b3hmaVp1NktPaUhoay92bWRo?=
 =?utf-8?B?KytLMUI2SGpaQWd1RmY1VlkrcGRjc21iblZpeVR0b1Yvd1EvK2FmNGUvTHVT?=
 =?utf-8?B?czhsOXVTSDcwMXNZL1FKaXZCcGhpbDJTb2dBS09BQnlUSGlGTFN1eW1kZWF3?=
 =?utf-8?B?UDQ4eVdlWEFuTWRvdFA4SEt5RnZ1clIzNUl5c0VhYkhBVm1IRjZtaEx4YlpQ?=
 =?utf-8?B?cEJ6RnFpb2d0Wkt4Y2JpblhMNGVEN2xTQ25na0xLclJtOG1xZkpoTGp6Q1Jo?=
 =?utf-8?B?RlZzeFFlTjk5aCtTVU5nSXpiN0NFNFJuSkl1SVFPNm5hbVRTZ3orVWN1R0oz?=
 =?utf-8?B?c2t1dkcveVNVYmo3c1dRanJFMFNBL0QvWENFQlR0TVN0WnR4NkJrMTRwbm9v?=
 =?utf-8?B?WTdCU0NQQW85Y3loem9tUkxEbDUyRU1jaGNiNFVaNFZFK1Qybk53OGNZNWlE?=
 =?utf-8?B?L09YbitzUzNGYldYNDVVUTF5ejd5Y3ZQMW50S3ViNjF5KzdSZHBGU2VtWTR5?=
 =?utf-8?B?OE9FN2R2R25RS0szQ1RvZFRrNDBPSkpSQVN2VnZzaFhKOGRaWDQyNkl4OFl3?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b37b9f-98ad-4bde-8c33-08db779fdd4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:21:10.3968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iom0v8q3Qg8IB/ba9MzVKQenflv1niXHgk09/6nteWwkLz7iQPWqrkn6BE6aRobBN0+UsBO2MwbSaDqLBYLlueCDJSMd/VfIa5xhIcXvms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-Proofpoint-GUID: Kl_vD-PMOC2FyUioL7Mj-ANeCD9_fQIK
X-Proofpoint-ORIG-GUID: 2QE9W7X14cgACCLiUM7yzJFvXdlHC-Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 06:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103621

--------------PywyqnjZsZSkQ6g7tVcuQ1uy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35S5raNA008298

On 24-06-2023 19:41, Martin Jansa wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> This change is now merged in kirkstone and causes:
> ERROR: python3-werkzeug-2.1.1-r0 do_patch: Fuzz detected:
>
> Applying patch CVE-2023-23934.patch
> patching file CHANGES.rst
> Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).
> patching file src/werkzeug/_internal.py
> patching file src/werkzeug/http.py
> patching file tests/test_http.py
>
>
> The context lines in the patches can be updated with devtool:
>
>      devtool modify python3-werkzeug
>      devtool finish --force-patch-refresh python3-werkzeug <layer_path>
>
> Don't forget to review changes done by devtool!
>
> ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue: Patch log indicate=
s that patches do not apply cleanly. [patch-fuzz]
> Please send follow-up patch to fix patch-fuzz.

Hi Martin,

Thanks for checking.

Have double checked with building python3-werkzeug with poky but, I have=20
not observed any patch-fuzz.

Have followed the below steps:

1. Cloned the latest poky & meta-oe layer and switched to kirkstone=20
branch for both of them.

2. Added latest meta-oe layer to poky build directory and built the=20
python3-werkzeug successfully without any issue.

Below are the logs in:

meta-oe :

$fd werkzeug
meta-python/recipes-devtools/python/python3-werkzeug
meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
$ls meta-python/recipes-devtools/python/python3-werkzeug
CVE-2023-23934.patch=C2=A0 CVE-2023-25577.patch
$vi meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
$git branch
 =C2=A0 dunfell
* kirkstone
 =C2=A0 master
 =C2=A0 mickledore
$

Poky Build logs:

$bitbake python3-werkzeug
Loading cache: 100%=20
|########################################################################=
##################|=20
Time: 0:00:05
Loaded 4328 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 "2.0.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "universal"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 "x86_64-poky-linux"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "qemux86-64"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "4.0.11"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "m64 core2"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 ""
meta
meta-poky
meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "kirkstone:fc697fe=
87412b9b179ae3a68d266ace85bb1fcc6"
meta-filesystems
meta-gnome
meta-initramfs
meta-multimedia
meta-networking
meta-oe
meta-perl
meta-python
meta-webserver
meta-xfce=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "kirkstone:a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d"

Initialising tasks: 100%=20
|########################################################################=
#############|=20
Time: 0:00:02
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 279 (0%=20
match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 1056 tasks of which 1056 didn't need to=20
be rerun and all succeeded.
$ls tmp/work/core2-64-poky-linux/python3-werkzeug/2.1.1-r0/
CVE-2023-23934.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dist=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 packages-split=20
pseudo=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 source-date-epoch
CVE-2023-25577.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgdata=20
python3-werkzeug.spec=C2=A0 sysroot-destdir
deploy-rpms=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 license-destdir=C2=A0 pkgdata-pdata-input=20
recipe-sysroot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp
deploy-source-date-epoch=C2=A0 package=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pkgdata-sysroot=20
recipe-sysroot-native=C2=A0 Werkzeug-2.1.1
nmali@blr-linux-engg1$

Best Regards,

Narpat

>
> On Wed, May 10, 2023 at 4:16=E2=80=AFPM Narpat Mali via lists.openembed=
ded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r=
44OcxKB_13MA43zdPYINg$>=20
> <narpat.mali=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Narpat Mali <narpat.mali@windriver.com>
>
>     Werkzeug is a comprehensive WSGI web application library. Browsers
>     may allow
>     "nameless" cookies that look like `=3Dvalue` instead of `key=3Dvalu=
e`.
>     A vulnerable
>     browser may allow a compromised application on an adjacent
>     subdomain to exploit
>     this to set a cookie like `=3D__Host-test=3Dbad` for another
>     subdomain. Werkzeug
>     prior to 2.2.3 will parse the cookie `=3D__Host-test=3Dbad` as
>     __Host-test=3Dbad`.
>     If a Werkzeug application is running next to a vulnerable or
>     malicious subdomain
>     which sets such a cookie using a vulnerable browser, the Werkzeug
>     application
>     will see the bad cookie value but the valid cookie key. The issue
>     is fixed in
>     Werkzeug 2.2.3.
>
>     Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>     ---
>     =C2=A0.../python3-werkzeug/CVE-2023-23934.patch=C2=A0 =C2=A0 =C2=A0=
| 116
>     ++++++++++++++++++
>     =C2=A0.../python/python3-werkzeug_2.1.1.bb
>     <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!A=
jveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UA=
hyU9W6r44OcxKB_13MA41M9C3f8A$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +
>     =C2=A02 files changed, 118 insertions(+)
>     =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934=
.patch
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-239=
34.patch
>     b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-239=
34.patch
>     new file mode 100644
>     index 0000000000..0be97d2888
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-239=
34.patch
>     @@ -0,0 +1,116 @@
>     +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00
>     2001
>     +From: David Lord <davidism@gmail.com>
>     +Date: Wed, 10 May 2023 11:33:18 +0000
>     +Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
>     +
>     +don't strip leading `=3D` when parsing cookie
>     +
>     +"src/werkzeug/sansio/http.py" file is not available in the
>     current recipe
>     +version 2.1.1 and this has been introduced from 2.2.0 version.
>     Before 2.2.0
>     +version, this http.py
>     <https://urldefense.com/v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDf=
OQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13M=
A42CACK-xA$>
>     file was only available in the "src/werkzeug/http.py"
>     +and we could see the same functions available there which are
>     getting modified
>     +in the CVE fix commit. Hence, modifying the same at
>     "src/werkzeug/http.py" file.
>     +
>     +CVE: CVE-2023-23934
>     +
>     +Upstream-Status: Backport
>     [https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c50ff=
e8ef58fe62cdce028
>     <https://urldefense.com/v3/__https://github.com/pallets/werkzeug/co=
mmit/cf275f42acad1b5950c50ffe8ef58fe62cdce028__;!!AjveYdw8EvQ!ZvOorDfOQ_K=
pEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42A=
sHiz9w$>]
>     +
>     +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>     +---
>     + CHANGES.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 4 ++++
>     + src/werkzeug/_internal.py
>     <https://urldefense.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA41UuKh0Rw$>
>     | 13 +++++++++----
>     + src/werkzeug/http.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----
>     + tests/test_http.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-
>     + 4 files changed, 16 insertions(+), 9 deletions(-)
>     +
>     +diff --git a/CHANGES.rst b/CHANGES.rst
>     +index a351d7c..23505d3 100644
>     +--- a/CHANGES.rst
>     ++++ b/CHANGES.rst
>     +@@ -1,5 +1,9 @@
>     + .. currentmodule:: werkzeug
>     +
>     ++-=C2=A0 =C2=A0A cookie header that starts with ``=3D`` is treated=
 as an
>     empty key and discarded,
>     ++=C2=A0 =C2=A0 rather than stripping the leading ``=3D=3D``.
>     ++
>     ++
>     + Version 2.1.1
>     + -------------
>     +
>     +diff --git a/src/werkzeug/_internal.py
>     <https://urldefense.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA41UuKh0Rw$>
>     b/src/werkzeug/_internal.py
>     <https://urldefense.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA41UuKh0Rw$>
>     +index a8b3523..d6290ba 100644
>     +--- a/src/werkzeug/_internal.py
>     <https://urldefense.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA41UuKh0Rw$>
>     ++++ b/src/werkzeug/_internal.py
>     <https://urldefense.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA41UuKh0Rw$>
>     +@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb"[\\].")
>     + _legal_cookie_chars_re =3D
>     rb"[\w\d!#%&\'~_`><@,:/\$\*\+\-\.\^\|\)\(\?\}\{\=3D]"
>     + _cookie_re =3D re.compile(
>     +=C2=A0 =C2=A0 =C2=A0rb"""
>     +-=C2=A0 =C2=A0 (?P<key>[^=3D;]+)
>     ++=C2=A0 =C2=A0 (?P<key>[^=3D;]*)
>     +=C2=A0 =C2=A0 =C2=A0(?:\s*=3D\s*
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P<val>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"(?:[^\\"]|\\.)*" =
|
>     +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) ->
>     t.Iterator[t.Tuple[bytes, bytes]]:
>     +=C2=A0 =C2=A0 =C2=A0"""Lowlevel cookie parsing facility that opera=
tes on bytes."""
>     +=C2=A0 =C2=A0 =C2=A0i =3D 0
>     +=C2=A0 =C2=A0 =C2=A0n =3D len(b)
>     ++=C2=A0 =C2=A0 b +=3D b";"
>     +
>     +=C2=A0 =C2=A0 =C2=A0while i < n:
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.search(b + b";",=
 i)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.match(b, i)
>     ++
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not match:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group("key").strip()
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group("val") or b""
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D match.end(0)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group("key").strip()
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>     +
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group("val") or b""
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key, _cookie_unquote(value=
)
>     +
>     +
>     +diff --git a/src/werkzeug/http.py
>     <https://urldefense.com/v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDf=
OQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13M=
A42CACK-xA$>
>     b/src/werkzeug/http.py
>     <https://urldefense.com/v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDf=
OQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13M=
A42CACK-xA$>
>     +index 9369900..ae133e3 100644
>     +--- a/src/werkzeug/http.py
>     <https://urldefense.com/v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDf=
OQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13M=
A42CACK-xA$>
>     ++++ b/src/werkzeug/http.py
>     <https://urldefense.com/v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDf=
OQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13M=
A42CACK-xA$>
>     +@@ -1205,10 +1205,6 @@ def parse_cookie(
>     +=C2=A0 =C2=A0 =C2=A0def _parse_pairs() -> t.Iterator[t.Tuple[str, =
str]]:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for key, val in _cookie_parse_im=
pl(header):=C2=A0 # type: ignore
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key_str =3D _to_st=
r(key, charset, errors,
>     allow_none_charset=3DTrue)
>     +-
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key_str:
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>     +-
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_str =3D _to_st=
r(val, charset, errors,
>     allow_none_charset=3DTrue)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key_str, val=
_str
>     +
>     +diff --git a/tests/test_http.py
>     <https://urldefense.com/v3/__http://test_http.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA42izb7SXw$>
>     b/tests/test_http.py
>     <https://urldefense.com/v3/__http://test_http.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA42izb7SXw$>
>     +index 5936bfa..59cc179 100644
>     +--- a/tests/test_http.py
>     <https://urldefense.com/v3/__http://test_http.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA42izb7SXw$>
>     ++++ b/tests/test_http.py
>     <https://urldefense.com/v3/__http://test_http.py__;!!AjveYdw8EvQ!Zv=
OorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxK=
B_13MA42izb7SXw$>
>     +@@ -427,7 +427,8 @@ class TestHTTPUtility:
>     +=C2=A0 =C2=A0 =C2=A0def test_parse_cookie(self):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cookies =3D http.parse_cookie(
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"dismiss-top=3D6; =
CP=3Dnull*;
>     PHPSESSID=3D0a539d42abc001cdc762809248d4beed;"
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'a=3D42; b=3D"\\";"; ; =
fo234{=3Dbar;blub=3DBlah; "__Secure-c"=3Dd'
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'a=3D42; b=3D"\\";"; ; =
fo234{=3Dbar;blub=3DBlah;
>     "__Secure-c"=3Dd;'
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "=3D=3D__Host-eq=3Dbad;=
__Host-eq=3Dgood;"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert cookies.to_dict() =3D=3D =
{
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"CP": "null*",
>     +@@ -438,6 +439,7 @@ class TestHTTPUtility:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"fo234{": "bar",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"blub": "Blah",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'"__Secure-c"': "d=
",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "__Host-eq": "good",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0def test_dump_cookie(self):
>     +--
>     +2.40.0
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>     <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!A=
jveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UA=
hyU9W6r44OcxKB_13MA41M9C3f8A$>
>     b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>     <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!A=
jveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UA=
hyU9W6r44OcxKB_13MA41M9C3f8A$>
>     index 476a3a5964..ca8705146e 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>     <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!A=
jveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UA=
hyU9W6r44OcxKB_13MA41M9C3f8A$>
>     +++
>     b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
>     <https://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!A=
jveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UA=
hyU9W6r44OcxKB_13MA41M9C3f8A$>
>     @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
>     "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462"
>
>     =C2=A0PYPI_PACKAGE =3D "Werkzeug"
>
>     +SRC_URI +=3D "file://CVE-2023-23934.patch"
>     +
>     =C2=A0SRC_URI[sha256sum] =3D
>     "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
>
>     =C2=A0inherit pypi setuptools3
>     --=20
>     2.40.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#102533):
>     https://lists.openembedded.org/g/openembedded-devel/message/102533
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/102533__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCM=
h_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA400eOGMSg$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/98806142/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9880=
6142/3617156__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwW=
GmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA43JVkw2Zw$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42mksaTWg$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------PywyqnjZsZSkQ6g7tVcuQ1uy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35S5raNA008298

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 24-06-2023 19:41, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7hfFSzZHbSkhDA2qN9dSd8t=
dr5oAjWTJj5rZqqa1MQg@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class=3D"msonormal" =
style=3D"line-height:11pt"><span style=3D"font-size:11pt;color:#000">CAUT=
ION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <pre style=3D"color:rgb(0,0,0)">This change is now merged in ki=
rkstone and causes:</pre>
          <pre style=3D"color:rgb(0,0,0)">ERROR: python3-werkzeug-2.1.1-r=
0 do_patch: Fuzz detected:

Applying patch CVE-2023-23934.patch
patching file CHANGES.rst
Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).
patching file src/werkzeug/_internal.py
patching file src/werkzeug/http.py
patching file tests/test_http.py


The context lines in the patches can be updated with devtool:

    devtool modify python3-werkzeug
    devtool finish --force-patch-refresh python3-werkzeug &lt;layer_path&=
gt;

Don't forget to review changes done by devtool!

ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue: Patch log indicates =
that patches do not apply cleanly. [patch-fuzz]</pre>
          <pre style=3D"color:rgb(0,0,0)">Please send follow-up patch to =
fix patch-fuzz.</pre>
        </div>
      </div>
    </blockquote>
    <p>Hi Martin,</p>
    <p>Thanks for checking.<br>
    </p>
    <p>Have double checked with building python3-werkzeug with poky but,
      I have not observed any patch-fuzz.</p>
    <p>Have followed the below steps:</p>
    <p>1. Cloned the latest poky &amp; meta-oe layer and switched to
      kirkstone branch for both of them.<br>
    </p>
    <p>2. Added latest meta-oe layer to poky build directory and built
      the python3-werkzeug successfully without any issue.</p>
    <p>Below are the logs in:<br>
    </p>
    <p>meta-oe :</p>
    <p>$fd werkzeug<br>
      meta-python/recipes-devtools/python/python3-werkzeug<br>
      meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb<br>
      $ls meta-python/recipes-devtools/python/python3-werkzeug<br>
      CVE-2023-23934.patch&nbsp; CVE-2023-25577.patch<br>
      $vi meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb<b=
r>
      $git branch<br>
      &nbsp; dunfell<br>
      * kirkstone<br>
      &nbsp; master<br>
      &nbsp; mickledore<br>
      $<br>
    </p>
    <p>Poky Build logs:</p>
    <p>$bitbake python3-werkzeug<br>
      Loading cache: 100%
|########################################################################=
##################|
      Time: 0:00:05<br>
      Loaded 4328 entries from dependency cache.<br>
      NOTE: Resolving any missing task queue dependencies<br>
      <br>
      Build Configuration:<br>
      BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;2.0.0&quot;<br>
      BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; =3D &quot;x86_64-linux&quot;<br>
      NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;universal&q=
uot;<br>
      TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;x86_64-poky-linux&quot;<br>
      MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D &quot;qemux86-64&quot;<br>
      DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
      DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;4.0.11=
&quot;<br>
      TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;m=
64 core2&quot;<br>
      TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D &quot;&quot;<br>
      meta<br>
      meta-poky<br>
      meta-yocto-bsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D
      &quot;kirkstone:fc697fe87412b9b179ae3a68d266ace85bb1fcc6&quot;<br>
      meta-filesystems<br>
      meta-gnome<br>
      meta-initramfs<br>
      meta-multimedia<br>
      meta-networking<br>
      meta-oe<br>
      meta-perl<br>
      meta-python<br>
      meta-webserver<br>
      meta-xfce&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; =3D
      &quot;kirkstone:a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d&quot;<br>
      <br>
      Initialising tasks: 100%
|########################################################################=
#############|
      Time: 0:00:02<br>
      Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 279
      (0% match, 100% complete)<br>
      NOTE: Executing Tasks<br>
      NOTE: Tasks Summary: Attempted 1056 tasks of which 1056 didn't
      need to be rerun and all succeeded.<br>
      $ls tmp/work/core2-64-poky-linux/python3-werkzeug/2.1.1-r0/<br>
      CVE-2023-23934.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dist&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packages-spl=
it&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      pseudo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source-date-epoch<br>
      CVE-2023-25577.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgdata&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      python3-werkzeug.spec&nbsp; sysroot-destdir<br>
      deploy-rpms&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; license-destdir&nbsp; pkgdata-pdata-input&nb=
sp;
      recipe-sysroot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp=
<br>
      deploy-source-date-epoch&nbsp; package&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; pkgdata-sysroot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      recipe-sysroot-native&nbsp; Werkzeug-2.1.1<br>
      nmali@blr-linux-engg1$<br>
      <br>
    </p>
    <p>Best Regards,</p>
    <p>Narpat<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQe7hfFSzZHbSkhDA2qN9dSd8t=
dr5oAjWTJj5rZqqa1MQg@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at
            4:16=E2=80=AFPM Narpat Mali via
            <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1t=
bYEb5Feqzv2UAhyU9W6r44OcxKB_13MA43zdPYINg$" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;narpat.mali=3D<a href=3D"mai=
lto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            From: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver=
.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">narpat.mali@windriver.com</a>&gt;<br>
            <br>
            Werkzeug is a comprehensive WSGI web application library.
            Browsers may allow<br>
            &quot;nameless&quot; cookies that look like `=3Dvalue` instea=
d of
            `key=3Dvalue`. A vulnerable<br>
            browser may allow a compromised application on an adjacent
            subdomain to exploit<br>
            this to set a cookie like `=3D__Host-test=3Dbad` for another
            subdomain. Werkzeug<br>
            prior to 2.2.3 will parse the cookie `=3D__Host-test=3Dbad` a=
s
            __Host-test=3Dbad`.<br>
            If a Werkzeug application is running next to a vulnerable or
            malicious subdomain<br>
            which sets such a cookie using a vulnerable browser, the
            Werkzeug application<br>
            will see the bad cookie value but the valid cookie key. The
            issue is fixed in<br>
            Werkzeug 2.2.3.<br>
            <br>
            Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@=
windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">narpat.mali@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../python3-werkzeug/CVE-2023-23934.patch&nbsp; &nbsp; =
&nbsp;| 116
            ++++++++++++++++++<br>
            &nbsp;.../python/<a href=3D"https://urldefense.com/v3/__http:=
//python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh=
_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41M9C3f8A$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">python3-werkzeug_2.1=
.1.bb</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;2 +<br>
            &nbsp;2 files changed, 118 insertions(+)<br>
            &nbsp;create mode 100644
meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch=
<br>
            <br>
            diff --git
a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch
b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch<br>
            new file mode 100644<br>
            index 0000000000..0be97d2888<br>
            --- /dev/null<br>
            +++
b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch<br>
            @@ -0,0 +1,116 @@<br>
            +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17
            00:00:00 2001<br>
            +From: David Lord &lt;<a href=3D"mailto:davidism@gmail.com" t=
arget=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"=
>davidism@gmail.com</a>&gt;<br>
            +Date: Wed, 10 May 2023 11:33:18 +0000<br>
            +Subject: [PATCH] Merge pull request from
            GHSA-px8h-6qxv-m22q<br>
            +<br>
            +don't strip leading `=3D` when parsing cookie<br>
            +<br>
            +&quot;src/werkzeug/sansio/http.py&quot; file is not availabl=
e in the
            current recipe<br>
            +version 2.1.1 and this has been introduced from 2.2.0
            version. Before 2.2.0<br>
            +version, this <a href=3D"https://urldefense.com/v3/__http://=
http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1t=
bYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D"true">
              http.py</a> file was only available in the
            &quot;src/werkzeug/http.py&quot;<br>
            +and we could see the same functions available there which
            are getting modified<br>
            +in the CVE fix commit. Hence, modifying the same at
            &quot;src/werkzeug/http.py&quot; file.<br>
            +<br>
            +CVE: CVE-2023-23934<br>
            +<br>
            +Upstream-Status: Backport [<a href=3D"https://urldefense.com=
/v3/__https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c50ffe=
8ef58fe62cdce028__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7=
PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42AsHiz9w$" rel=3D"noreferrer" t=
arget=3D"_blank" moz-do-not-send=3D"true">https://github.com/pallets/werk=
zeug/commit/cf275f42acad1b5950c50ffe8ef58fe62cdce028</a>]<br>
            +<br>
            +Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali=
@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">narpat.mali@windriver.com</a>&gt;<br>
            +---<br>
            + CHANGES.rst&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;|&nbsp; 4 ++++<br>
            + src/werkzeug/<a href=3D"https://urldefense.com/v3/__http://=
_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwW=
GmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-send=3D"true"=
>_internal.py</a> | 13 +++++++++----<br>
            + src/werkzeug/http.py&nbsp; &nbsp; &nbsp; |&nbsp; 4 ----<br>
            + tests/test_http.py&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 4 +++=
-<br>
            + 4 files changed, 16 insertions(+), 9 deletions(-)<br>
            +<br>
            +diff --git a/CHANGES.rst b/CHANGES.rst<br>
            +index a351d7c..23505d3 100644<br>
            +--- a/CHANGES.rst<br>
            ++++ b/CHANGES.rst<br>
            +@@ -1,5 +1,9 @@<br>
            + .. currentmodule:: werkzeug<br>
            +<br>
            ++-&nbsp; &nbsp;A cookie header that starts with ``=3D`` is t=
reated as
            an empty key and discarded,<br>
            ++&nbsp; &nbsp; rather than stripping the leading ``=3D=3D``.=
<br>
            ++<br>
            ++<br>
            + Version 2.1.1<br>
            + -------------<br>
            +<br>
            +diff --git a/src/werkzeug/<a href=3D"https://urldefense.com/=
v3/__http://_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx=
1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-s=
end=3D"true">_internal.py</a> b/src/werkzeug/<a href=3D"https://urldefens=
e.com/v3/__http://_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxna=
CMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do=
-not-send=3D"true">_internal.py</a><br>
            +index a8b3523..d6290ba 100644<br>
            +--- a/src/werkzeug/<a href=3D"https://urldefense.com/v3/__ht=
tp://_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA=
7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-send=3D"=
true">_internal.py</a><br>
            ++++ b/src/werkzeug/<a href=3D"https://urldefense.com/v3/__ht=
tp://_internal.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA=
7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA41UuKh0Rw$" moz-do-not-send=3D"=
true">_internal.py</a><br>
            +@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb&quot;[\\].&quo=
t;)<br>
            + _legal_cookie_chars_re =3D
            rb&quot;[\w\d!#%&amp;\'~_`&gt;&lt;@,:/\$\*\+\-\.\^\|\)\(\?\}\=
{\=3D]&quot;<br>
            + _cookie_re =3D re.compile(<br>
            +&nbsp; &nbsp; &nbsp;rb&quot;&quot;&quot;<br>
            +-&nbsp; &nbsp; (?P&lt;key&gt;[^=3D;]+)<br>
            ++&nbsp; &nbsp; (?P&lt;key&gt;[^=3D;]*)<br>
            +&nbsp; &nbsp; &nbsp;(?:\s*=3D\s*<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(?P&lt;val&gt;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;(?:[^\=
\&quot;]|\\.)*&quot; |<br>
            +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes)
            -&gt; t.Iterator[t.Tuple[bytes, bytes]]:<br>
            +&nbsp; &nbsp; &nbsp;&quot;&quot;&quot;Lowlevel cookie parsin=
g facility that operates on
            bytes.&quot;&quot;&quot;<br>
            +&nbsp; &nbsp; &nbsp;i =3D 0<br>
            +&nbsp; &nbsp; &nbsp;n =3D len(b)<br>
            ++&nbsp; &nbsp; b +=3D b&quot;;&quot;<br>
            +<br>
            +&nbsp; &nbsp; &nbsp;while i &lt; n:<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; match =3D _cookie_re.search(b +=
 b&quot;;&quot;, i)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; match =3D _cookie_re.match(b, i=
)<br>
            ++<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not match:<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break<br>
            +<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; key =3D match.group(&quot;key&q=
uot;).strip()<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; value =3D match.group(&quot;val=
&quot;) or b&quot;&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D match.end(0)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; key =3D match.group(&quot;key&q=
uot;).strip()<br>
            ++<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; if not key:<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue<br>
            +<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; value =3D match.group(&quot;val=
&quot;) or b&quot;&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;yield key, _cookie_unquote=
(value)<br>
            +<br>
            +<br>
            +diff --git a/src/werkzeug/<a href=3D"https://urldefense.com/=
v3/__http://http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdG=
qA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D=
"true">http.py</a> b/src/werkzeug/<a href=3D"https://urldefense.com/v3/__=
http://http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7Px=
wWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D"tru=
e">http.py</a><br>
            +index 9369900..ae133e3 100644<br>
            +--- a/src/werkzeug/<a href=3D"https://urldefense.com/v3/__ht=
tp://http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwW=
GmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D"true"=
>http.py</a><br>
            ++++ b/src/werkzeug/<a href=3D"https://urldefense.com/v3/__ht=
tp://http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwW=
GmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42CACK-xA$" moz-do-not-send=3D"true"=
>http.py</a><br>
            +@@ -1205,10 +1205,6 @@ def parse_cookie(<br>
            +&nbsp; &nbsp; &nbsp;def _parse_pairs() -&gt; t.Iterator[t.Tu=
ple[str,
            str]]:<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for key, val in _cookie_pa=
rse_impl(header):&nbsp; #
            type: ignore<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;key_str =3D =
_to_str(key, charset, errors,
            allow_none_charset=3DTrue)<br>
            +-<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if not key_str:<b=
r>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; con=
tinue<br>
            +-<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val_str =3D =
_to_str(val, charset, errors,
            allow_none_charset=3DTrue)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;yield key_st=
r, val_str<br>
            +<br>
            +diff --git a/tests/<a href=3D"https://urldefense.com/v3/__ht=
tp://test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA=
7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"=
true">test_http.py</a> b/tests/<a href=3D"https://urldefense.com/v3/__htt=
p://test_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7=
PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"t=
rue">test_http.py</a><br>
            +index 5936bfa..59cc179 100644<br>
            +--- a/tests/<a href=3D"https://urldefense.com/v3/__http://te=
st_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGm=
D1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"true">t=
est_http.py</a><br>
            ++++ b/tests/<a href=3D"https://urldefense.com/v3/__http://te=
st_http.py__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGm=
D1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA42izb7SXw$" moz-do-not-send=3D"true">t=
est_http.py</a><br>
            +@@ -427,7 +427,8 @@ class TestHTTPUtility:<br>
            +&nbsp; &nbsp; &nbsp;def test_parse_cookie(self):<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cookies =3D http.parse_coo=
kie(<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;dismis=
s-top=3D6; CP=3Dnull*;
            PHPSESSID=3D0a539d42abc001cdc762809248d4beed;&quot;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'a=3D42; b=3D&quo=
t;\\&quot;;&quot;; ; fo234{=3Dbar;blub=3DBlah;
            &quot;__Secure-c&quot;=3Dd'<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'a=3D42; b=3D&quo=
t;\\&quot;;&quot;; ; fo234{=3Dbar;blub=3DBlah;
            &quot;__Secure-c&quot;=3Dd;'<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;=3D=3D__Hos=
t-eq=3Dbad;__Host-eq=3Dgood;&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;assert cookies.to_dict() =3D=
=3D {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;CP&quo=
t;: &quot;null*&quot;,<br>
            +@@ -438,6 +439,7 @@ class TestHTTPUtility:<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;fo234{=
&quot;: &quot;bar&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;blub&q=
uot;: &quot;Blah&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'&quot;__Sec=
ure-c&quot;': &quot;d&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;__Host-eq&q=
uot;: &quot;good&quot;,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +<br>
            +&nbsp; &nbsp; &nbsp;def test_dump_cookie(self):<br>
            +--<br>
            +2.40.0<br>
            diff --git a/meta-python/recipes-devtools/python/<a href=3D"h=
ttps://urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8E=
vQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r4=
4OcxKB_13MA41M9C3f8A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">python3-werkzeug_2.1.1.bb</a>
            b/meta-python/recipes-devtools/python/<a href=3D"https://urld=
efense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!ZvOorDfO=
Q_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA=
41M9C3f8A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>python3-werkzeug_2.1.1.bb</a><br>
            index 476a3a5964..ca8705146e 100644<br>
            --- a/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA41M9C3f8A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">python3-werkzeug_2.1.1.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a href=3D"https://=
urldefense.com/v3/__http://python3-werkzeug_2.1.1.bb__;!!AjveYdw8EvQ!ZvOo=
rDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_=
13MA41M9C3f8A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">python3-werkzeug_2.1.1.bb</a><br>
            @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE.rst=
;md5=3D5dc88300786f1c214c1e9827a5229462">&quot;file://LICENSE.rst;md5=3D5=
dc88300786f1c214c1e9827a5229462&quot;</a><br>
            <br>
            &nbsp;PYPI_PACKAGE =3D &quot;Werkzeug&quot;<br>
            <br>
            +SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file=
://CVE-2023-23934.patch">&quot;file://CVE-2023-23934.patch&quot;</a><br>
            +<br>
            &nbsp;SRC_URI[sha256sum] =3D
            &quot;f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01=
d39c3ae74&quot;<br>
            <br>
            &nbsp;inherit pypi setuptools3<br>
            -- <br>
            2.40.0<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#102533): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/102533=
__;!!AjveYdw8EvQ!ZvOorDfOQ_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Fe=
qzv2UAhyU9W6r44OcxKB_13MA400eOGMSg$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/102533</a><br=
>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/98806142/3617156__;!!AjveYdw8EvQ!ZvOorDfOQ_K=
pEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA43J=
Vkw2Zw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/mt/98806142/3617156</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
              openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!ZvOorDfO=
Q_KpEJTHk_XU_lnxnaCMh_Vx1SzdGqA7PxwWGmD1tbYEb5Feqzv2UAhyU9W6r44OcxKB_13MA=
42mksaTWg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
              https://lists.openembedded.org/g/openembedded-devel/unsub</=
a>
            [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gma=
il.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------PywyqnjZsZSkQ6g7tVcuQ1uy--

