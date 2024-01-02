Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400A6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 14:43:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30216.1704206627341288019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 06:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WrEH8zro;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17317c20d1=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402CfGNS003864
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jan 2024 06:43:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=cTouWAJHG03/Uf7kgz/3dexk4N+vTc99eOFiZiCZU9Y=; b=
	WrEH8zroQMmxpvfhEsL46YCouKaRpkWySDw92AwABUaMVYy25k4QzjEeM3I6Wlbt
	vdTlVRT+qxYqMzsLamthawlPDji5xDXOmgO+HYrNnsNKhYodolIxNjJzbVkQa0xL
	FRw/qrt//g8l/giUfhhJrYNp3CuohnWgyh0bGHSESeyCSqCWqLefm8r5xywp7gGk
	N2/OQPkG34pOfmTwC2YDeMbhBR2ck72H8FXIybXXQWL1UsapLm7aOwghu6q6tBHJ
	UcFQfgMsk1/L0qPsqPX3NWOSz0i8vIdV3mRCVjbLIDSUIDevCdAuib1+BEFrQFS2
	MdoeT8+meskuZD0YthKAOQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4ap6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 06:43:46 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 402EhkCj010494
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jan 2024 06:43:46 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4ap6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 06:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfZ+5I/M/CFcPJTsGprEaF5dH/syF5aHE1KErAzy+4mhBnzEGuslnC8ZdYI0RdSYM55nHuvNiYPcYPBqbvU5HpxYfkDrVgrz5yYuP5lRokbube07Donc9UFx0KBBl2D+U20BP7wjdQdwSgqnNfKQvlGfDhGgi1wEjIghIRLVNSRJcgvXdhCGKz11YuwXNmloI2jUrpS4YBcXvYt5q0IePzQpBR/hfd2KyxFzNRflotNKMdkz5/t/gFzvkXJnKe/L3W6QJRCVcgb6KiU247UDEvmfX/LYSprLKoUbBjNAblw4j3NQzPuBiZGbeCaN8MAVqm1hZknAkO4adPhRTbO+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTouWAJHG03/Uf7kgz/3dexk4N+vTc99eOFiZiCZU9Y=;
 b=jl0KshXEYAO1Vp35TBxaGNp65ueKaIDx7y/YtksIZo+vNO0mZDOuOfMmCdO+WvKuC2CCfuIibvX+aytIfNH5yshLmsCOovDTOGgM/xlXOwVHg94wneyJSlQOqQEoz/tozaF2V784uNvENZoEZ9spoqhlzDxlCBglikwTY5WdJqNsixbUMgdDC9huip7NQjdROn1a0hq8POxk/bHdFHHrUT0HUIGIQxn7+JaRpHDwteScXjiAsvuA5j9/TzrYI9WFondt/THR8y9E0vHcPfA3G9587RnnGN0OBwgqS64cIDfZROAezvVTdLz4a6YTJlUE6Om0DCpcKJi2VoFOESAv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 14:43:42 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::5697:e6c7:c042:1b17]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::5697:e6c7:c042:1b17%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 14:43:41 +0000
Message-ID: <ac04e8e4-5bda-4f7e-a140-fa39b7bc01a8@windriver.com>
Date: Tue, 2 Jan 2024 20:09:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] apache2: upgrade 2.4.57 ->
 2.4.58
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <179DABBACBE5AD10.18076@lists.openembedded.org>
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <179DABBACBE5AD10.18076@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0079.namprd15.prod.outlook.com
 (2603:10b6:930:18::15) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3db33e-2b74-4c45-8a55-08dc0ba136cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ET6iCdvK4W4NphBbH2KDzQ1DA44Cf38W/OuJOPUfo3U0E8LCRiLC8viujl06MqTMjuzQAOjjFchaIiTD9aVirbjDY/0HH1JJsxFX/CWf9JbTBhTgjeGWusbiWIJD36FNg/f/C4hE7r5hczC4roY6weBQ2Gm7nEb5dalEVB0Is8BWMKQQbeYOvcB1iaxlLqHwBpcod557juRC62aqFaP6dyJM8vHWuPpc9uY7EbNu4G2BB6MqOKU0aApCBIyZbjKPU0zY1DWFOglfAXunRYR0BF8e3nfsOdRB38gkIGJl70lNDEBDpLhJhfxHiwR6NLZhUOcN9+1+2PM7u7cWnamqK2iQRZCye9MKCmvLDTP7iUH6nZ6tZySnO1MDUepNJauxaOpBKKTN4twMhKrqC4BV7xG+KZbvMMkRxhEbrI3MXj2XPxWTSadrOXHgyOczDIy/iCfKP6jGp44xd2LJOm7SsX4HL8pDOV+/N4FHr0uTlXPdEZeWSvUv4fK2FVvns9XBuG6y54HPhUV8vy8VdBMMUfKlv6X1Lr4afI0tRHtKL6TRk8S2/8rVOUbA7wEOPc5ljgpU8M/OuHctKyjQVu3HMEAcUdzuMoQQinQPz6IE9wyeWBUAdZ8amgHN6fHoJCLxrkzT53cUZKA1R7y80gGE/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39850400004)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(66556008)(66476007)(478600001)(316002)(966005)(8936002)(6486002)(8676002)(83380400001)(66899024)(53546011)(55236004)(6666004)(6506007)(6512007)(2616005)(26005)(5660300002)(2906002)(41300700001)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUl4d3FDaVlNZGtBWVJJVEw2ZDNGUzB0NG9pazMwQ0MyNWgvc1JFb0hGOXdt?=
 =?utf-8?B?WmhwT2hkZXI5SUJEeS81RjNabEc2bWF1eTZ5UDVuZEJuNHVrdHRXWGljTWwx?=
 =?utf-8?B?SkQxdHEzNWxIbnlmSjd3aW9OcUFDdDE0WTM5WnpYT3h0SDFCcElxQzZSS0xV?=
 =?utf-8?B?TEIvZEdJWTJnNU5ZdVRrUWx0UEEvWVp6djJNOGNLenkrN3BDYXl0S1gra0o0?=
 =?utf-8?B?bjNaMXI0bkVaQUV4TEUyMVJIeHRhMlpaS3NBWnNsT1c4MjAwR2x5VlBTUFIw?=
 =?utf-8?B?YkRoLzFUa2VqNk5DVkk3MjJjRllzcE9sRm5QMUtpMjkwMm5neldJd3F4U0ZL?=
 =?utf-8?B?SnkvbkRjZ3hQcktxZGdqSDREbnVMVkFaTk1vaDlLRC9KU3UwT2NlVFZ0TXQv?=
 =?utf-8?B?OVU3aWlYeERPK1ZLeUkycXZ5Z0NzaGsxaExPWjcyb0RIck51YmZUSEdoSENT?=
 =?utf-8?B?TXA5MmFrTStDU1YwSU9QdFVkSGozZDVoWnVXV2owUFNFR3M1eEt4Z3JaVC9x?=
 =?utf-8?B?bi85RDBQOHNXOURkVjMzbjhBVEFJaXJ3WUVud0hjVFhjalczVEFRYzdvOFpt?=
 =?utf-8?B?T28rZERFZ1V5dmNXOHhDWDcyNXc0aFdsc09yRGFSN3d3SUc3MmlFbGJ3d2Fq?=
 =?utf-8?B?WWVmWXJsRjA0WFhLSmtyQmlUQUhMdmdRNkFsaml2eWxrM0NEbWdwelprSEhV?=
 =?utf-8?B?Qi8xZXBJUXF2TEFobUtJa0N5ejVTWGtQVmYxWStVbENhTlh2aVZQbm55ODF2?=
 =?utf-8?B?akRMWG9NK1NKZU1vR1J5LzVta2czRS9Bb3lmZ3FIZVI3QlcxdlhkZjI4V05Z?=
 =?utf-8?B?ZGdISkFWdS9aNmFSOWVCSGwrYTliVWNrelMvb0Z5YXl6RFpJNHZqTGJtYU1H?=
 =?utf-8?B?L0tHOU9KYkRyZDRjNFlYa0R3SDZhZXFSb2ZpT2JNSG1RMVRIOUZlY0hpUnRw?=
 =?utf-8?B?aDUvQkxpK0ZTeStheGZubnRQVzdId2ZZbnNmY3hUU1VTNWswQVJsY1k3UTU0?=
 =?utf-8?B?L29OQU5qdW5xRXA4OHRWSXhkYTk1eWw3SEdyMzZjdWRqaElNUDFkRW9yNmxp?=
 =?utf-8?B?VzBNdW01NjRBN3dlcXhLbXF6Zk9tTXU2WU83TVgwUEc3SmFCUEdIaGVWUTdp?=
 =?utf-8?B?MGdMN21OQndIM3RFeTZsUUlYNy9EaW1HWk1ZRnkrNllWOSt5c3FURm9qOUFh?=
 =?utf-8?B?Mm1JMVMwSUNCY3R2KzF2R045SXJ3M3VmZDZyc2d2c2liOVBhOUFRMHRFVnM0?=
 =?utf-8?B?ZnFEbnh4TVlOUGEwZEVmRkNpSFYveEVmTTNmMmtFTWYrOTVPaFIzdjFtK2Z0?=
 =?utf-8?B?bWlDWktLcGhxdnc1Nmt2d000c0NOcC9BTUJ4Sk41ZkdaRnFKRFlmNHJ2U3ky?=
 =?utf-8?B?MVJOZ0d0NEpRV1RPRERyNDl3ZUpzMVlxMWpXTG1UTm50Zm9KS0Z5SWh3SlNv?=
 =?utf-8?B?KzVZeGpPbGVTS2dpMjVERE1wMll2dGZuOGRPZ0NkMUU4ekg2ZkN1OW1rS2Z5?=
 =?utf-8?B?ZjZ0R3liNkRPSzlOMnJ1cVI5dGdHeGZhcXE4ZVBKT2dkajBDQnZHOGZ6a01w?=
 =?utf-8?B?ZkRIcVc0WGp2eVliVEYxS3J5NzhxbVBGOGJ2dXpZbkYxNkJ4WXVnNHNOTnpx?=
 =?utf-8?B?dmFuLzd3WEtka0czVGphZENFWnROaG5WTzFVRURsTjZWNWlNZURjcVU2aUQy?=
 =?utf-8?B?MjNwemd6V0hTMlZSYmFFMUp5RkhKQjA5NDdhRkJjRFVDS1lRTkkxUUdHMjdq?=
 =?utf-8?B?RFNjcTNoYmRha2g5SUxOUFVoeFNRcWhLVlZhODJJZklMOUZaQ3hqVlVUcUo4?=
 =?utf-8?B?c3RmNmxlcjUvUm16TnVCSFUydFdkOWF2dWZCQ3l1ZVB1OFdFcllhK1d3NDJl?=
 =?utf-8?B?c2Uzb25sSnVRL2JDR1BvRWFUWnZLZVhrM0w0eFlreUloSG1MYllCbWJvUXVH?=
 =?utf-8?B?MHVMR3h2NVdxdm1mbk5XbGNOdytjQVJaWE9xajJ5Q0V6RDA1NnRWMVk3Qmxv?=
 =?utf-8?B?UW1qaFpwV2hZSjB0TVNXcEV6R29TYkVZSmZZNUl0Q2sxNmt6RmdEQUpyWUZG?=
 =?utf-8?B?cHh2bXh1VFhBZWE4ekpLS2VXdFhwdkVobzNNSHYxVk5tcWFKZHNxdkh4VFM0?=
 =?utf-8?B?OEdWNXpqbm5nUTVlWmsxbmszclJ4NVB2WVBLay9SazlYSThxb3k5bGpPem96?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3db33e-2b74-4c45-8a55-08dc0ba136cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 14:43:41.8965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k/PMNTkasrJ/H6PFyj3jNQFk5xeVZKrg++fuiCo7DVmp/Rw2hGNYMnEJxpLcvJK5ik2oZEocoOH7HgK/yrywDjd7lvQqXjMTKrUTytHclI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
X-Proofpoint-GUID: An_dNKFCZiyiEXiqcUFusa0ZXp2qLuOK
X-Proofpoint-ORIG-GUID: Me5SNcR53zyH-Oln9D-hZRBNQ65PIvA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 14:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108010

On 04-12-2023 21:18, Narpat Mali via lists.openembedded.org wrote:
> From: Narpat Mali <narpat.mali@windriver.com>
>
> This upgrade incorporates the CVE-2023-31122, CVE-2023-43622 &
> CVE-2023-45802 fixes and other bugfixes.
>
> The "0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch"
> is no longer needed as it's included in this upgrade.
>
> Changelog:
> https://downloads.apache.org/httpd/CHANGES_2.4.58
>
> References:
> https://httpd.apache.org/security/vulnerabilities_24.html
> https://security-tracker.debian.org/tracker/CVE-2023-31122
> https://security-tracker.debian.org/tracker/CVE-2023-43622
> https://security-tracker.debian.org/tracker/CVE-2023-45802
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>   ...config9.m4-Add-server-directory-to-i.patch | 31 -------------------
>   .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |  3 +-
>   2 files changed, 1 insertion(+), 33 deletions(-)
>   delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (98%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
> deleted file mode 100644
> index 996eabf586..0000000000
> --- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
> -From: Valeria Petrov <valeria.petrov@spinetix.com>
> -Date: Tue, 18 Apr 2023 15:38:53 +0200
> -Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
> - include path if mod_rewrite is enabled.
> -
> -Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
> -
> ----
> - modules/mappers/config9.m4 | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
> -index 55a97ab993..7120b729b7 100644
> ---- a/modules/mappers/config9.m4
> -+++ b/modules/mappers/config9.m4
> -@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
> - APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
> - APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
> -
> -+if test "x$enable_rewrite" != "xno"; then
> -+    # mod_rewrite needs test_char.h
> -+    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
> -+fi
> -+
> - APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
> -
> - APACHE_MODPATH_FINISH
> ---
> -2.25.1
> -
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
> similarity index 98%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
> index 00f8aaa415..f7376fc58a 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
> @@ -16,7 +16,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>              file://0008-Fix-perl-install-directory-to-usr-bin.patch \
>              file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
>              file://0001-make_exports.awk-not-expose-the-path.patch \
> -           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
>             "
>   
>   SRC_URI:append:class-target = " \
> @@ -28,7 +27,7 @@ SRC_URI:append:class-target = " \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
> +SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
>
Gentle Reminder !!

../Narpat

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107208): https://lists.openembedded.org/g/openembedded-devel/message/107208
> Mute This Topic: https://lists.openembedded.org/mt/102972765/7199376
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [narpat.mali@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

