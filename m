Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.55])
 by mx.groups.io with SMTP id smtpd.web11.13049.1608044557811603026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 07:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CIuGW7Nt;
 spf=pass (domain: windriver.com, ip: 40.107.93.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdpLCGnme5/eLfV9jZzQ5lUAJ+Gstcx9iUemUe0FDjYHCMB5XaxB0nINf0Uk0HOPGA4hKwRnayUqzqTD2PMRBIN5Ur3a8tn2gBkfLTGUUVumGptT1Nt3aH2WO4qwIJTWLTatwztxSVDzzYIESjJvnLyBzJIyOUHFXZPuEDsuwvUCMwS8grjIxkLZTsRppDdsHVGtZRkPLQlUR35JxeryxbwwQvuRH93S7ZX4DA9Q7HiAdhCiXAcUD/wVAPPKWJw/HxBozqnhbT+1+S5py3pC97a9EEXF7+Wiyp+i3yn9gWSsdp2WRfEMJNbJIJdfPfUw0FD6lWZEGRsKJL55LIrA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AhcvvD6LfVk6uCyub1nYuz4MGTnUTNZ5D5Y+EYWAys=;
 b=WcbslccOPySek7KAT75XPhLz4Yjf/8ohr8h+lSMOEARufNPm9EG+QcK4mieXvqvXpwBw9BKweu8cjeZ+TZUaoIGkvQgCE/Rl7ONT7UzmHYQPh91FxOcKNotYeU+ey0Lah9sMzkoJBD4NPb0y0Ar2sjUD9qKwxPxsKApVdDpVjjkcmJ2/TAsnOxSmY3X/zSGC3wCBYvgEe7ExhYD7AimSGgQGL+5j0nv4tqfvEiM7aCGeGPZQTaIRpSbLc8qDa7o6BdesyOOuaTumPXCMx3d8vB2iCHOgNHNVkEiY0TeplMwBiu9HSSFj3OUN0nKkuQc9bJNapprhQUzuujNOvmRy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AhcvvD6LfVk6uCyub1nYuz4MGTnUTNZ5D5Y+EYWAys=;
 b=CIuGW7Nt09PijwBrOtOvwKssNAn1mmQJR/SDVO1N06Nhuhd2hRKH7kg9Tp18oEAIXFKO+liZhQArGljqpX1W4hbvFenseI1s0w2e+04IubCT5QuJOgc+5C6dv6PbT4SlLOXyXvvYiE3S+i9nA5quE1NO/J4e5hv8XanEuSoLT1U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2728.namprd11.prod.outlook.com (2603:10b6:a02:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Tue, 15 Dec
 2020 15:02:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 15:02:36 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-matplotlib: Disable LTO on mips/clang
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201214184251.353899-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c906b4c5-3395-72c1-298c-d393b836287e@windriver.com>
Date: Tue, 15 Dec 2020 10:02:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201214184251.353899-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:c0::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:c0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.13 via Frontend Transport; Tue, 15 Dec 2020 15:02:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dc31ee8-07d9-4a12-d49e-08d8a10a7568
X-MS-TrafficTypeDiagnostic: BYAPR11MB2728:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2728AACBA74200B55CDB485D9FC60@BYAPR11MB2728.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gwA/4mVF+zMHLqksnq1GPEXpCZWJfh7Q2JqkTgX3U8R24hvVh0yO7FLbR8rawx6+8Stp7S+4V/KJRzw9mS+LD010A1piwzJP5f5o3Se/oP64HxJvH4AW63n2E6lKEbqkfszPrfMwPLSFmhCe/X5SkinTPrZzoVjC+AZK+CuAjYoeaIzOmuhdlxIojh708o3Rai1acX6+crD04nHnfEA/gzCci2E6saWN69q2/u7bTI2QQCNJPgV7M30/b2mAdfVXPp0Bt0oe0B7VxCTU1Y9JC0Upb1ZkcLygWFavreNvRZQAEfqPwMBrJ2NjnADb3muT7CCX0Fi1GLdoPd60eVuss5VFvHLxqeKCfQ5qXFbzYEaCr3JIpNN/IQDDgmO9H4WkuDYAl25gKiJWiL+92wjAeioKE65fbW0cXi/jLx6mClzgH7iUz/N/3AbYF57KmL2FopsvTXKRqo5/DOM4WLjV6pWvULwMtcoHN6N7cWRisuJRMToe0cnC14EEYxYfB3pv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(8936002)(33964004)(36756003)(2906002)(4001150100001)(498600001)(83380400001)(66946007)(66476007)(31696002)(53546011)(86362001)(16576012)(44832011)(31686004)(5660300002)(52116002)(186003)(956004)(166002)(66556008)(26005)(16526019)(6486002)(966005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cHc1UHMzNHM5eStTMXJFQ0RiK2RaVlBWZnhFWENQeUZCeXA1VVA0Z3k5UXZt?=
 =?utf-8?B?SEpuVU1lQXowRkNYdE8wNVFGbEhYeVRDS3VNWXRQczBSNUxJRTkydWJvcG1l?=
 =?utf-8?B?SE9yQ0NnNzJKa2hjVWptbTYvQytvRUVpYnkxMXNUNjZML0RCTXF5Um9yNVFF?=
 =?utf-8?B?T2wrNVlaZi92SUpKWWpLTThDY0RpRUI2YnpHczRpSlFmeVp2c3RjSmlmd2t4?=
 =?utf-8?B?eW40RFErU3JpaE41Y2ZEVG00aks1ZW9vajRCaVRzeGNJVkZHVHY3V3VOb3BD?=
 =?utf-8?B?TFFLcW4xSzQzREM1SkI0Y3g3ekFFQXdBcERNZll6TGFRNXhPQ2pjTUZyQUxl?=
 =?utf-8?B?VTQ4M3JvOURzRFVSZWJUNlZyM0xYUHhINzVCdGVscVY4dFg5RU5YNGxpT1lR?=
 =?utf-8?B?eTJaQjFVbmo0dkp0SHIyMEhpSFU5TWZhSlRibjFjcExidXpCUXJESDQxL0x2?=
 =?utf-8?B?ZWNYdnZpRWMwZHFxMHRTZHdpK2NPQlpCMm53a0tJL2krYysxTTBOTXF5M0c2?=
 =?utf-8?B?ZDkzQW5uOVZLdnNXVkhBbEF1Zy9OU1IyL0FnT0ZoVmorcXBhU3k1dk92MnZw?=
 =?utf-8?B?RCtIN2R4aEVCK0R1YllXbkhrZSthNmxjeThJZnhva0t6S3UxdGI4c0ZCQmRQ?=
 =?utf-8?B?dTBLQUJUVXp5amRielhiYlVuTEk5Qi9BUkYyUitsMmJCcEg5TjNoQmZpL0Nx?=
 =?utf-8?B?N1EyZDNpaTVqclk2T0E0VXhjMWg3REtNall4Q0xqaXlGeS9TbVprMUFSSTlE?=
 =?utf-8?B?VHZDK2lvT3k1aEhMSXcxZFREMmo2WGtGZzNxM0M3djdGTWlqTXdJVmFlRmVi?=
 =?utf-8?B?eUltTllhV1JTbUdzbHdvdzlKSWlFTE51WkNRaUE5Mm1xc25vOFlIMnhRUElJ?=
 =?utf-8?B?U2ZkenFCVG42YnBRcFB6VVFhdVJidXJyK2RUOGJBQlo3SDVWeDF5SmFYaFY4?=
 =?utf-8?B?SDA2Vi8yQkRZamxkQTV2eFhLMThyeHNkZElKbUFNcFMvMENrK3daMVFvNXQx?=
 =?utf-8?B?Qm9IeHArTnFxVFErUi96K1Uwei9sTXNxTDVUcndYODNBMjZVTlR2V0pWQlN5?=
 =?utf-8?B?SEZUc1NaTVk5MlpERXNaU29NQUJkeDAzR21KN21VQ2plT01GWktCOCsveUJa?=
 =?utf-8?B?STdsUFh3cHpCV2JSTTlIS1RLYzJRNXo5eE9WSnkwQ0hPUnF3RkhMakxrUEVt?=
 =?utf-8?B?Nk5GL1Z1R0h0dmcwMitWeEZia2oxVFdNcWtrell5UmhsSytEVTdhZjBnSkVF?=
 =?utf-8?B?bnc5RU9VUXVkZW5Dbmp6djJoQ2I3Z3FXQXUyN241dHhhcDBPMENIaUx5TXl4?=
 =?utf-8?Q?xWMs48esT4ZNeHcN0FMQ82A/vuX39ubSVy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 15:02:36.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc31ee8-07d9-4a12-d49e-08d8a10a7568
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHgIlgdfv2tTkDcGNyEaHYpV+6Jx3VwABS1SDLIfCC27Z/DmcujBoVIvJ3wTDagVn3vbqB84QDRk+UcnRQdru8ov8ph0x8thUuW+ZG7xKR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2728
Content-Type: multipart/alternative;
 boundary="------------C8720815870FF80C81B66B59"
Content-Language: en-US

--------------C8720815870FF80C81B66B59
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-14 1:42 p.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> It needs lld with lto and lld does not yet support gnu_hash for mips
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> index 3cfa3f31f4..25709a1176 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
> @@ -26,6 +26,7 @@ inherit pypi setuptools3 pkgconfig
>
>   # LTO with clang needs lld
>   LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
> +LDFLAGS_remove_toolchain-clang_mips = "-fuse-ld=lld"
>
>   RDEPENDS_${PN} = "\
>       freetype \
> @@ -40,6 +41,7 @@ RDEPENDS_${PN} = "\
>
>   ENABLELTO_toolchain-clang_riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
>   ENABLELTO_toolchain-clang_riscv32 = "echo enable_lto = False >> ${S}/setup.cfg"
> +ENABLELTO_toolchain-clang_mips = "echo enable_lto = False >> ${S}/setup.cfg"
>   do_compile_prepend() {
>       echo [libs] > ${S}/setup.cfg
>       echo system_freetype = true >> ${S}/setup.cfg
> --
> 2.29.2
>
>
> 
>

--------------C8720815870FF80C81B66B59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-14 1:42 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201214184251.353899-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

It needs lld with lto and lld does not yet support gnu_hash for mips

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201214184251.353899-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
index 3cfa3f31f4..25709a1176 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.2.bb
@@ -26,6 +26,7 @@ inherit pypi setuptools3 pkgconfig

 # LTO with clang needs lld
 LDFLAGS_append_toolchain-clang = &quot; -fuse-ld=lld&quot;
+LDFLAGS_remove_toolchain-clang_mips = &quot;-fuse-ld=lld&quot;

 RDEPENDS_${PN} = &quot;\
     freetype \
@@ -40,6 +41,7 @@ RDEPENDS_${PN} = &quot;\

 ENABLELTO_toolchain-clang_riscv64 = &quot;echo enable_lto = False &gt;&gt; ${S}/setup.cfg&quot;
 ENABLELTO_toolchain-clang_riscv32 = &quot;echo enable_lto = False &gt;&gt; ${S}/setup.cfg&quot;
+ENABLELTO_toolchain-clang_mips = &quot;echo enable_lto = False &gt;&gt; ${S}/setup.cfg&quot;
 do_compile_prepend() {
     echo [libs] &gt; ${S}/setup.cfg
     echo system_freetype = true &gt;&gt; ${S}/setup.cfg
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C8720815870FF80C81B66B59--
