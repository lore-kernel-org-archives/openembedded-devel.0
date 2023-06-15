Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED81FEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 15:02:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20821.1686841354707707685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 08:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=oz0uyj9c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55300b703e=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FARjYD006352
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XW71vKpXEJLJ8jw42lbdZsgEhf5g4ioBzccaU3aImK4=;
 b=oz0uyj9cFGtuSYejzyS2HywlZd8/S0ai8JGkLNhlZgso5MnF10IhXhBmbFy59MOMC9/Q
 fYfzv6Fm27f8aOSCC9nwQDATPrgVpEbaM+wczoceEKWIo1/A8xqRU40xfYZ74Vwhio+m
 Ez9s902dBelTz3NC6uSfA4TGbHdX8/J6SA2H9woMOpn2UM4pCANEd4kSLygrUyU1ohU/
 rDU7zuIFxpQ3VrBNkx/83lntc4wqosDXN67SJfzoVctyzYv1bHrAFFl9jiTkEKx20ffi
 1xKyIIL50dBTq/+TawPD7FEhN9DT/RJD+UMThILrk99EbcRd7+/9ANt6+gERkZpuDQZW tA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4g5850wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2d7ZKAk84lHeGabTC3hwlofZluQ+XpgsJt9n93RjJMNOOPZa5p9Agj2x/ZkGXGasyGkOW4sed5/J29l0cBanGCe3llVOWHuKt2jFRK8KhQy0W9zSh5xxqpcab3ARVEUB3p5yv7QaYLNbMhoPCiwrfBCR7CdJ+ObNP9kKtFBml9d74RIEJ3b0OOtU9fsz3rPCxiJb0qN1JJJRoRWttKOBpulEaK2tVpAsKrrHRGSPpDzkAyeisbXFAkfYN3pIt0JFHd2QrMzSSNWr6vEcfB4xPwlzVSmoeK+yd8SbzdHeGoifTwx/wUC6c6CXOe8wPsKulDV6X+b+kPHepo0Vf+yEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW71vKpXEJLJ8jw42lbdZsgEhf5g4ioBzccaU3aImK4=;
 b=PZv8wytgBejTZcwQLTZw7zWIqYU+EyC6CPN/e1nfl7JTwioNI9cI+TmHjkbUxjINs0I/DMu2AHU3iTugNW6URK+SUJwFWpgHA1QtUTXdke+eoo3HeIp4M3g+NiBYarWZtVIlRBgc78cVkyC07r90bFzgyAMlyj6IMYnNk6NEP+pmpNXCidaOGlCuqFoe2Kpyk69oA7CKukobDjwUUNCRFiqVvLGgypFcpsvfXm7plT1PCuoRnTrrbYTvOf70HFUftKJpUugfNAbIRloR3l5HKbmMLVyTCjm2NR1pucxjmoUC9VQ+GYLb6Wo4Z3eEMNke3PZtu6gDxtfO2spm8e16cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Thu, 15 Jun
 2023 15:02:29 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::deef:c312:c6d2:187e%6]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 15:02:29 +0000
Message-ID: <14233326-528b-e67f-6dac-890d39bbdfd5@windriver.com>
Date: Thu, 15 Jun 2023 20:30:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-sqlparse: fix
 for CVE-2023-30608
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <176443B9AA3F1AFC.21586@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <176443B9AA3F1AFC.21586@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c54751-5e4c-45ac-2f43-08db6db18a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9GCt0OAtZdRcWU3t7dwVoC3j5gJPUCTqEY16q9lIln8sC+pT2GlR+kmdXlsGYIq0kCrEz1j4ptoGXwywVmbq4zaVys+zfJB6ydpaJ42HsDPDffPxlmLUejlIM2/7aXjFizOdwOxAkcyuA931v5hOcO5Tr8KiKJSdJWNtAjhs+aXp1zLvvfSXipkZnKcQFKkDr4pLb9VyP0qE1yeu4edGfT+3nF5Uwdx4NXT/x5GRinTc7ohgMYUb0kk2GNicradKZhVHZ/KwGTb/ZZschmLdUgVbql6moTeTSzv4N+ZSZhlx9WtNjGS8U4ZBqyW2jENb0OamdGNysYfLLfyIEwTXXFPpyn0cahR+T6iCR26tdavonM/R7d73omfgVHt9jWcDRAWsjfKSPiA65IR3MIrykIdi89kZXphXZ13RCbFEORWTPRWSWEYJlHErpfjHopKp8+FAGcbAsRj63XE6/9AqOeKCPY0J5LkqMumjFer6ssZF1Vht3pqqMC1qlo1PHQLHEnPk3M2TFoupzjdFRA+7FWYA7xOfh6JkMmwIy5UiJvLbdq0qFqGwLkOIxQZY/RF+9HS4Yz8LV7dQcuYyFm1kz3tpywlfSwM2lcesukw7bu7PBTIsxneZpkn+bAq44EGth9qDifpzIYYgwiVw5P50zLaJ/d4MzYE4eSx4xhjHipk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(451199021)(2906002)(66899021)(186003)(2616005)(83380400001)(66476007)(66556008)(66946007)(6666004)(6916009)(4326008)(966005)(41300700001)(6486002)(316002)(31696002)(86362001)(478600001)(38100700002)(36756003)(31686004)(6512007)(6506007)(26005)(53546011)(8676002)(8936002)(107886003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cSs0SHdMNE5GdlMyVEJEcGI4MEdYUVZPQTlOVVEwdmxiMWFQWkJsV0IyTWpB?=
 =?utf-8?B?aEdsRyt5TDh2Y0JRWnlxUEc0RHUyM0Y3a3VjTXNkZW1TZmd1UFgrUFNFelJG?=
 =?utf-8?B?OXY0eHduMW5iV1EyaUhEakdVQW9Jak9sV21BR2t6KzlPZ0lMU1Z1dnlVejNU?=
 =?utf-8?B?Q01ocTNqQWhvWlhhRGU4bVdFckNhdXRzam1VY0ZneHNZV1BBN3Vyc3JId1Vt?=
 =?utf-8?B?RjZ5THoyVjlZbTVvalhFTGc3REJpcEhnMGZqOFJUUkFWTGpDckppcDZHTkFY?=
 =?utf-8?B?Z2twd1NsQU43WGNNZy9tWnRWRS9hZ2wwSDE1Y3ROTGEyenZIRGJkKzEyT0Nt?=
 =?utf-8?B?QXNOWjVoUHdrS2xBSERIVDUxZ1htZ2Y1WVUzUGtHaFE5VXdKY3dVcXNiU3dU?=
 =?utf-8?B?N0kyMit0RjRtbWV6dC80UXhrUlRrVlEzenZvbW9lOWN0Vmp2Si9UTlJpUUpz?=
 =?utf-8?B?NkVlZVFuN0xaVHpBRWYzMHJxVVU1ZFdKTE1aNVFQNm9hejNiWGMyTEt6MS8w?=
 =?utf-8?B?Mk5BdVUreVF0WEFQd2NKV21xRkxDWlZCNFZ5WWR3VkVFMTVzOFI0aGNGcFZi?=
 =?utf-8?B?Y3dzajROVTFtZUVoWWhMQzZhVCtRMmVKcjBmeDRhRVh3MDUwMHN5UWRzNDk5?=
 =?utf-8?B?UVc4SVpGTFBLUHRwclEwTVBibkVVdVY0ejRyUTBwbEVHczFZVi82OW9pc3ZX?=
 =?utf-8?B?bXRiemNJbjg4WDFGUENyZ1I5R083Zi9yWGZVcFJsQlltd1pudUxHM0FENGNs?=
 =?utf-8?B?UVB6MmxKUmxmZDd0cnorYUluTTN5aVk4OERKZGMvUGRCOStJRjFyMUhTd1hv?=
 =?utf-8?B?dnVPUVBGZWJQa0FxT1BZWHRERG4wTG5makRrVXdheXE0TzRwOHR2aFNZYndm?=
 =?utf-8?B?WDlEUmRkR3hnUWluM1dkRE1BK1N4UmM4QXVQOXpkSWlCWk9uaUJ6ZEJoYjdl?=
 =?utf-8?B?UVNzYXhYS05vSStxWEc4MUpoNGZZQnY3ZjR3azVuOWtWSFpEY3BDS2ZydTZo?=
 =?utf-8?B?WEZwQW81OXVCdnZOTmcvVFQ4Wk4rN2pJMTBVb09DRllwTTljSHVlaldRTGdl?=
 =?utf-8?B?QysrUG5pVmJpbkVrZ0NIOVUydWM3VkhreVovSWJkZ3pvUERZeXJuTnB0NjBP?=
 =?utf-8?B?MWpzMDZ1M0UrVkxTaC9sRnNOcjZPMW11YWRKSDltaExZdzYyOWtyb0lGcmt3?=
 =?utf-8?B?a2FNcWU4c3dKbTFuMHoyZlNJSGsvd0pNLyt4b3BORXptWEpjQ0hsZklXanpN?=
 =?utf-8?B?L04xTXQvQW44a0lqZ0YrQnlkaERnb0drR3FpSWsyT0R4Q21QVHlQNUpVTGFx?=
 =?utf-8?B?cHJFRXV6OUNkd2ZEYkFBaFNLVE1pamtldkNsRGNtRTArYjhvdGZjT0pXaENt?=
 =?utf-8?B?YmovOVo2MnVvWEh4WTJ0dExodWU0U2wvdXI1UHFBYWpuT3BycXU0Y1JoUE91?=
 =?utf-8?B?NjQ5NTdSU0w1Q3pTQXRmN2tHRDJ4Y3JuY0dNZHdOT0RncHB4bmJZamtMcVBC?=
 =?utf-8?B?aGsvVkdQdVBSQS9sdDNaNUZpL1hMTVlqUnpPWitMeVBvWlBBMXNQV0ZmMVY4?=
 =?utf-8?B?V2N3N2tKd29SRVk4RFF1UjMrUmNIWDJRSXhEdEtzbE5jQ0FhZlpvQ29hUUMx?=
 =?utf-8?B?cmFQQnlmVDQrSzB6bnVpOW9Ub3lhMmdTWG8rSFU0Y1FFaXJ4UmxjOE9LQTlP?=
 =?utf-8?B?OUNzc044cTRxZW1RbGpxb0MvYXdtc1FET0dPaEIxZEZTN3loZVlLaklXUGJI?=
 =?utf-8?B?SE1DdkRxdnEwT3RMTld6aFQ4TTlDeHZCbTNBNktBTlZ5RXRWNS80RUdoV2RF?=
 =?utf-8?B?N0llTUNTNk1IVHBJTzY1OE1XMXd2WHBMK0tkUExIbHpzdy9VWk44cFZuTUJJ?=
 =?utf-8?B?MjIwZkJtZFN4YXlBS1FiaHlDUUFxY2E3TGpvc29IQTRocVgyRHR0ZnVVK1Vk?=
 =?utf-8?B?cGZnRzV2a0xXcDBEVkpBUXR4YzRaVmVFVUZaWk95aVJSR3UvZkdNUU04dGdW?=
 =?utf-8?B?WjUyNjJaMGo2VVJBVnROU2s2U2V2TG1yY3BIWko5d2N4aEo4MWhiS0sram5l?=
 =?utf-8?B?djFKOW5pb0xYNSsrWTJpNXhtdUh2eTdGNXhtVDY3NWpJMlFYRXBRUktMUkFS?=
 =?utf-8?B?MEtIaUZmMFhMUllKZGVEbEg5NGdjRVNHeWVFRjVaa1RjV1RndVdsV1BaNVN3?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c54751-5e4c-45ac-2f43-08db6db18a0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 15:02:29.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz2N8ZMfUjgAUcCfd3ocBLjeYk9MGpIDnR1jvGiRHiPFvnVEgq+56Aa9mlSRsFoJiqi5yaWQauGgVQLgG6cR3x8cmVPKHqlh+yZJdtByFqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-Proofpoint-GUID: p2__sorAC2DhFDBVlgHfbM7J4rZaS8lB
X-Proofpoint-ORIG-GUID: p2__sorAC2DhFDBVlgHfbM7J4rZaS8lB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35FARjYD006352
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 15:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103311

Reminder.

On 31-05-2023 20:53, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> sqlparse is a non-validating SQL parser module for Python. In affected
> versions the SQL parser contains a regular expression that is vulnerabl=
e
> to ReDoS (Regular Expression Denial of Service). This issue was introdu=
ced
> by commit `e75e358`. The vulnerability may lead to Denial of Service (D=
oS).
> This issues has been fixed in sqlparse 0.4.4 by commit `c457abd5f`. Use=
rs
> are advised to upgrade. There are no known workarounds for this issue.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   .../python3-sqlparse/CVE-2023-30608.patch     | 75 ++++++++++++++++++=
+
>   .../python/python3-sqlparse_0.4.2.bb          |  1 +
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2023-30608.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2=
023-30608.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CV=
E-2023-30608.patch
> new file mode 100644
> index 0000000000..41dbf088e1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-306=
08.patch
> @@ -0,0 +1,75 @@
> +From fa1cc25e1967228e5d47b9ddb626cc82dba92d7e Mon Sep 17 00:00:00 2001
> +From: Andi Albrecht <albrecht.andi@gmail.com>
> +Date: Wed, 31 May 2023 12:29:07 +0000
> +Subject: [PATCH] Remove unnecessary parts in regex for bad escaping.
> +
> +The regex tried to deal with situations where escaping in the
> +SQL to be parsed was suspicious.
> +
> +CVE: CVE-2023-30608
> +
> +Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/co=
mmit/c457abd5f097dd13fb21543381e7cfafe7d31cfb]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + CHANGELOG            | 15 +++++++++++++++
> + sqlparse/keywords.py |  4 ++--
> + tests/test_split.py  |  4 ++--
> + 3 files changed, 19 insertions(+), 4 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 65e03fc..a584003 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -1,3 +1,18 @@
> ++Backport CVE-2023-30608 Fix
> ++---------------------------
> ++
> ++Notable Changes
> ++
> ++* IMPORTANT: This release fixes a security vulnerability in the
> ++  parser where a regular expression vulnerable to ReDOS (Regular
> ++  Expression Denial of Service) was used. See the security advisory
> ++  for details: https://github.com/andialbrecht/sqlparse/security/advi=
sories/GHSA-rrm6-wvj7-cwh2
> ++  The vulnerability was discovered by @erik-krogh from GitHub
> ++  Security Lab (GHSL). Thanks for reporting!
> ++
> ++* Fix regular expressions for string parsing.
> ++
> ++
> + Release 0.4.2 (Sep 10, 2021)
> + ----------------------------
> +
> +diff --git a/sqlparse/keywords.py b/sqlparse/keywords.py
> +index 6850628..4e97477 100644
> +--- a/sqlparse/keywords.py
> ++++ b/sqlparse/keywords.py
> +@@ -66,9 +66,9 @@ SQL_REGEX =3D {
> +         (r'(?![_A-Z=C3=80-=C3=9C])-?(\d+(\.\d*)|\.\d+)(?![_A-Z=C3=80-=
=C3=9C])',
> +          tokens.Number.Float),
> +         (r'(?![_A-Z=C3=80-=C3=9C])-?\d+(?![_A-Z=C3=80-=C3=9C])', toke=
ns.Number.Integer),
> +-        (r"'(''|\\\\|\\'|[^'])*'", tokens.String.Single),
> ++        (r"'(''|\\'|[^'])*'", tokens.String.Single),
> +         # not a real string literal in ANSI SQL:
> +-        (r'"(""|\\\\|\\"|[^"])*"', tokens.String.Symbol),
> ++        (r'"(""|\\"|[^"])*"', tokens.String.Symbol),
> +         (r'(""|".*?[^\\]")', tokens.String.Symbol),
> +         # sqlite names can be escaped with [square brackets]. left br=
acket
> +         # cannot be preceded by word character or a right bracket --
> +diff --git a/tests/test_split.py b/tests/test_split.py
> +index a9d7576..e79750e 100644
> +--- a/tests/test_split.py
> ++++ b/tests/test_split.py
> +@@ -18,8 +18,8 @@ def test_split_semicolon():
> +
> +
> + def test_split_backslash():
> +-    stmts =3D sqlparse.parse(r"select '\\'; select '\''; select '\\\'=
';")
> +-    assert len(stmts) =3D=3D 3
> ++    stmts =3D sqlparse.parse("select '\'; select '\'';")
> ++    assert len(stmts) =3D=3D 2
> +
> +
> + @pytest.mark.parametrize('fn', ['function.sql',
> +--
> +2.40.0
> diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2=
.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
> index 0980ff9c24..b5cc41e730 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b136f573f53=
86001ea3b7b9016222fc"
>  =20
>   SRC_URI +=3D "file://0001-sqlparse-change-shebang-to-python3.patch \
>               file://run-ptest \
> +            file://CVE-2023-30608.patch \
>   	    "
>  =20
>   SRC_URI[sha256sum] =3D "0c00730c74263a94e5a9919ade150dfc3b19c57438998=
5446148402998287dae"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103067): https://lists.openembedded.org/g/openembed=
ded-devel/message/103067
> Mute This Topic: https://lists.openembedded.org/mt/99244615/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[narpat.mali@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

