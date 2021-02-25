Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.5599.1614217846498172951
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LLXylnot;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7Z0VIqh7RMKgGMtZ6chWY4m+yAPtrx4AzkXrSS5C0BeZj/J9zZHISsmAqStVjF5X2LPAymkAtYhcroQ7/HfRzJ7C7Gy76TgMLJDklL6VhgpsEtdLcbN+jejaXN0G3LznXOZmZ0sAyYy1vvZZV1T+VG0p9Iny3E0Jti1SVt91T/VfBMnS/L80+Wc4dyof0ynhDvXfJy5huy7QSFqAzfJYk4Dnu72FSmv8MEc9ACj8NJUtyQk0on2c7i+Hg9535oxpBCmfsS5C9yNsitxOpilXlZcCftJqhCiM6EmVUq7zvpof4zei+WDrFndt3fPGwI8RsOXcWEkiH85Qba0+ZYRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jryrZTtH0y/RK4qR+7DcdBhjicPUDYjHFnapCfMm9uo=;
 b=A0dO8Pzf7ukCPM3kuFvtcwah0v7lEdD/IRAF5ZEyblXpf/tJdtcvBYTUIljSJ5fgHz7XXPP3yAQUXgMuk9w7QkKfrqzpi75M9YnMSBEqHNhcfrcEh5O5B0Q8vUKlpUMpF2lwERD75QzTbKL8smZj0nq1BDmz5PJue83RVoVOOQfxMZVTaVA6/MvCo380Zgp7idedF2KSw+gm20Exkm/T/tCW/JhrsS5eW2VHpNSsHAjEOkg+EzkmMGENgStNE9pzgm5PIJOFvzyJeY2RsYN0B7yFzeXZgkdwDyRn2fzd+BVtaabnwMwQgCpd3fXhfL71F3WcNb5Indj/vKF5UFRPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jryrZTtH0y/RK4qR+7DcdBhjicPUDYjHFnapCfMm9uo=;
 b=LLXylnot9CsgQeVDNwFrqyc7vNzmI8ZCLPLAJ1KOwnmtrJVf74ZGpHcyGwYCxAElBSbysCPgxAOd0T57xT3+G2ET8p0G1QSa1/BnzzcFYKfEw4hEYuvv+76xqygbopv78rCRFiUFimjNTinOKNcRqRSja1vvHnpxnMmm6MPIevA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1785.namprd11.prod.outlook.com (2603:10b6:3:10d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Thu, 25 Feb
 2021 01:50:45 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 01:50:45 +0000
Subject: Re: [oe] [meta-oe][PATCH 1/2] libssh2: remove the recipe since it moved to oe-core
To: openembedded-devel@lists.openembedded.org
References: <1666DA5E5611EB4D.10310@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <019de890-4401-e038-38e1-69271c007766@windriver.com>
Date: Wed, 24 Feb 2021 20:50:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1666DA5E5611EB4D.10310@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:a03:2ef::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 01:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf2ad9f-4b3a-4653-5455-08d8d92fc41f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1785:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB17858460B1CDDDA9E29A049FF89E9@DM5PR11MB1785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	le0XkvcDLV83djHezGzwsENvdS90oT6K/FDwxWVHeLbGFbMsnukcQ4RmfU4fjnkj1r8HgkQ0nlOe8wG9ibKwyqYVG0kxNDRXSsZp1b+yPw6QAPxYAvED/ODZFcdgM3dXm8SfhrgqpV01a+DDSXNXEhatipLz4WFyZSErsCiln6bk0tplLXEBcJLeA+lHzN1Zgn9Sn6BM6G/WCm12sadBTy2ZC2+3cC+M0GYV0jmWwimw5iz5yYqad7GgXPGYp4v5Eem6JJ5IqfvRfATA3SnCycEtPAls3I5ppVuh6/KgF8QQFKoRQTr3yqrY/DQxyZPUhCFuqgUywhw0r16/04y/XEVt8Vm/+3PqZUf1Ndkfo81FILRglysyxKxiM/ihAoCJJtmE0RH46SlhF7D+2U044kUAYqZbyWePm3SEmuJhUwZRKSLEA15fVDti/HWgxbWFRNCMwMxJt79GC+m8mnahqYpBX5HGihw+p1egnTsWWr/A3YuAIppAAfvuRS4cL59AXt9nK1HDIhpnCmfSek3+BWKo2+cSNPKEt4Hm6UZ7CjQdpPv3OWMVSLkaIAgEEDO2QEFosf8TjSTlEWEObWeFCJbBV/eys54BEFGHtZ7wUCI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(956004)(6486002)(16526019)(316002)(8676002)(31686004)(2616005)(5660300002)(6666004)(8936002)(26005)(2906002)(31696002)(86362001)(186003)(52116002)(66946007)(66476007)(6916009)(16576012)(66556008)(36756003)(83380400001)(53546011)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZThHQUZBT21Ja21NbVJXZUdicmtMMlA1elVBdEVKQ2h4YWtUS3VENTFiSzBi?=
 =?utf-8?B?LzlHalFmcjh3ZVl3V3JsV3BoWlNEWVduM1prb3IrWG1MYXFhT1hWbkRGU0xH?=
 =?utf-8?B?eHpWY3ZiSVd0YlF3eFEvTnJVS1FyYi8yQUpmd0o5djZqWjFIT3JwMFFWT2Fj?=
 =?utf-8?B?VGYzdXduUW5hRjRVM2RacVphaUZIWTJueFg4Q3FUSlhVZWhNc09kRWxNUm82?=
 =?utf-8?B?NXRtVlpkRmpZV09PMzdnbGRSM3RWdjFMa1VOSTNkMUZhUitmRk8zTW16a2lL?=
 =?utf-8?B?YnNuaVhENFZMSTFJVmRkUjBKQzc5VnVTWWtCeCtrTG1oWGsvaHZXU0pudDhz?=
 =?utf-8?B?NGJnVUJGMFlOTXNpbDRycStFOXBLdW5PZnRYNTRzamgvMnJodW9rN3IxUmox?=
 =?utf-8?B?WXdHODdFZGxrSXptY2w2TGFlNmh2ZWwyRjQ0eS9ZcnNEbDVyMVpqb3AycE9v?=
 =?utf-8?B?Z2QvV0VXcjkrQUp4R0RURW43VFppeGxwY1pVcnhFYjdqMmJHdzE3cWtHUWVU?=
 =?utf-8?B?Y25lUzFJY2lLd0hGV1JzUFk1YVFCRjdDNDlMVDh3MVFZVmdBa2hITFJDekRH?=
 =?utf-8?B?d0FDZ3VBYm1aOUVjaVRFMmlMcnltZDJoZkhsVktEbCt6SzVxeVkzN2U1a2Yz?=
 =?utf-8?B?WTBsWEpMTGxac3BQdDh1aDVrYUxmUDFhYjFDQXhjWmtpbUdnNVBUQ1NYdHpl?=
 =?utf-8?B?Q0xwSVMyNVFBZCs4WGNpNGN5S1N6b3oyR0c0c0pjQ01RWTVtck44VzR0WlZS?=
 =?utf-8?B?RzFVdG1FdzByL2lyRkxXaC9jNmFkOXhUN3Y3cTV3cDc1RmpjcGozcWNENFA0?=
 =?utf-8?B?U29tLzBzNDMwdjFwVHRFTm9sTE0veWVLTlowbnRnVjhnY3BhTmFqTCtkclBr?=
 =?utf-8?B?Wnl5VEVzd2RCb05ZRG1Sb3o1TmtDQ004bTIrSWtuTjBUS2I0QnMrdE5BQVdJ?=
 =?utf-8?B?YTgwVGhOQ21vS3BsWGxQWkNJL2JaMzBQSWIzRkM5cmk1U2Q2UUtZa2hyMHdB?=
 =?utf-8?B?R2VsWjdNQWpuemllTUdRalFhSVZEdmQzOFBrOHZMd3p5VjFESEFIOUNRcWRE?=
 =?utf-8?B?RXZoMHZ4ck80bVVLRVRYSjAyUnFFRTlJQktCTW9kRktiSkFKY09KdWJPcmxh?=
 =?utf-8?B?bnkvSjd4bFNWbWthaVhmaUZTV3ZSVWpjd2JUaC8vaXpnSldFdE4zWmdDclU0?=
 =?utf-8?B?dkorOUNXWm1RK2h1TUY2b1pjRDM2aGsveitOc2Rpb1lic1ZpSWJCdm9xVnd5?=
 =?utf-8?B?UlFaK0lyYnJLbnFwOFU5UjhBSWU2d1M5Q2xnekRMYllCb0w2MjhzUXI3MFdS?=
 =?utf-8?B?NHlSa0pBMmphODNrOEZmdDdBVi9Gbm5CZ3IxdmpFTzlwYWhXRGFsNVJ6Wkp1?=
 =?utf-8?B?WWlpMXdFYlF1ZTBGaTVLaUJESlQwNnlmalU3YkE0TURYYk5PZ3JlRUd3OTIr?=
 =?utf-8?B?eVlXRXZzK0MrZENnUnhPUDNXRENTcDk5OWtIRHVUK3lRMGJwTnRLSVBaQjc1?=
 =?utf-8?B?b3crQjA4U3BiNSt3Ujl1djE5MVkvY1cvT3F2L3dwcHNYaFlkWU12M3hlakpa?=
 =?utf-8?B?c3dxNU0rTi8wdTBUY3VVVGhBbm1lL0k0d2FxaldIdGJmcy9vNmdzT1hJSDBL?=
 =?utf-8?B?ZWJCdTNJSUp0cWhkcDNIM3M5RllYVWlkcnQrWE1sSFZuTUFQNXRHQnozaDVy?=
 =?utf-8?B?Z3VURC9LWmlRQWZyTCtqNHRPa0lkVTA2Q1p0OEtrNEhuWTBzS05HQ3pWa01K?=
 =?utf-8?Q?Zofu4hj1wXLdvpanMJKRXglrGfaqwF1HijxFSVJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf2ad9f-4b3a-4653-5455-08d8d92fc41f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 01:50:45.1052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aLiBMjyYahg3YIwvZFR4gGmRnmYqtbPyHkfndA4RJ+hEOcXyZb0/N4f1WdzRvVwSt+ty69U0SLDNRbqCujvdKOVsmgrBMddo1F3W+AsYdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-24 8:46 p.m., Randy MacLeod wrote:
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   ...nviroment-to-decide-if-a-test-is-bui.patch |  46 ------
>   ...ditionally-undefine-backend-m4-macro.patch |  30 ----
>   .../libssh2/files/CVE-2019-17498.patch        | 131 ------------------
>   .../recipes-support/libssh2/files/run-ptest   |   8 --
>   .../recipes-support/libssh2/libssh2_1.9.0.bb  |  53 -------
>   5 files changed, 268 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
>   delete mode 100644 meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
>   delete mode 100644 meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
>   delete mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest
>   delete mode 100644 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
> 

This and libgit2 are only in oe-core/master-next at the moment.

-- 
# Randy MacLeod
# Wind River Linux
