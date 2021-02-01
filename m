Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.48])
 by mx.groups.io with SMTP id smtpd.web11.34045.1612186629469588177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lauys5Yn;
 spf=pass (domain: windriver.com, ip: 40.107.75.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A64tZmsI+RVzGKp9IljpAy8O7+SS0ry1SBFbjSSzsNYLQwq+0ZQaD2IDTRvDswQSqZ++Oi8QsY2qF+ccdD4usURaRDYFYf+88w2RV9H+q0m0J53u06LApUq9hnxeSoLvYYHjYlxDx+efcH3Sz5RGvSUYC4cTEKdkxFEAkdtuMBW9g6mosko1GiaH32fYBCIw22VprByjE/jw34TRa+8HMclCetgEl72Lvp0nt9EGVozv/q/o7RvBvGFgWQrQxAsnK9ZtoAm8RVFMIZ2p8O+l/zhvi1954Vnr7gqgeZNpj8so5AEowB0zZnrHtLX7dYwionQbrPel0gKS/m/L9by2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JajogNT1RjGifa61pV/sWYht22axyRWlX46Vki9QkL8=;
 b=lKkGIQF7sQV8gqqYt66kZw6fb3E3aFq3uCvH5wSODT8sjniLcpJrFpIvLjf8eRmO4rsP/DDCCjWWpX4od9zvo6ChG9CjjHxU2IrBBQM/2gUTlVCA8R4jIfn83msvYMmSXmMqDSvxANsXp5PktHyq4eYChlumV9layqTpC+LMxw3FqjTFTRgjNEMohI+hFab3uO2y/FuV8ZyJ4vuUkdy+/H7Gnoo3M7bxx9wDMIUYz+/FDszLK1r/v0738srT3ovK7Qf5+gf7FbHH0dGp70OGM9EzXMf2KzRao33D1RJLczsBv6htpxmLfewihDeLYHvv4Yp9lAenwj2KgNO4nU/oUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JajogNT1RjGifa61pV/sWYht22axyRWlX46Vki9QkL8=;
 b=lauys5YnMpovCCJX8fB/07y1Gl1D9JwL90Sj43caQCYDxCzd4qTXSaIGcu6fukPemdVs/FESqoqQzxPWS+vbkeG0QhQjvQhiu9/SKldk2xJ9F4KsMA2UwoWVx0px+JRG+HcJ3depm2TjVlE6ch57wSIv7QqsiO1GVniVEx1XBUQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:37:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:37:07 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-prctl: Upgrade 1.7 -> 1.8.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129193230.20879-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bc5dd197-2127-4297-ad37-a8f0b433cd7d@windriver.com>
Date: Mon, 1 Feb 2021 08:37:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129193230.20879-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:208:160::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0018.namprd13.prod.outlook.com (2603:10b6:208:160::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.10 via Frontend Transport; Mon, 1 Feb 2021 13:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5794d4b-6e4e-4854-7475-08d8c6b67832
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4308CB64398D2E40EAB28C159FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9OGyUJyc04pBl3d3yUtL+UzpGEsOxAn0y6qab3m+a9ohJ4OAQPkljiF0GxPOna235uNycHkmKsXHR/7Z93Nr6sRnwCQt5OaV3A2r9KdxVSfWGWvpKDfLmOzsCzOURWR9gY43+uL1MN08GUlVFEdEWgVlYZSgez6QWHGDds3HsB6GgDSfa/qP6GHNnK4X/vtwElC+Ubm1U6zQjBivCpuEgPpNknbr55XYlN3n/fRls5nGaOUTACH5iooRxhJPMd7wzzywmE99GFzCruEPm4bPyfxeOohTD0ogpd/btSC0DHZ1oPIR93ELrOTd/YuT4SeEZ8H1/LPsIx3FfYleo3BImCbohauEj0r+oCH5YdVMh4JMCG7cDSGNEoTkCT6smZ5RdaUxkjLdxAaLw/4eilaevST8kNzgF8+wsLqbT1WZ4TT+LfGhEaMQ4t4KBKf3xRoCqGIVmt7ez76BTUakAQ9FB2IPxebDuZEJ2uggfXrVEzdDre2rvbI9NoHi5K5tkr4E86okHFkvsxBk1KkA2E0Nv11gZTwoOKO2uQhU1RGiCk74BAJxutTrBJP7zqfBQPcTRZZ8U1vtRIONWW6WajMwQ8iklNK/SPyyqugZmdQ1sk3jm5BnuiFbqgAw78eYYiqLiyFzHXfarq0hBfxs7tEVNFt2k8mK+mfBBB51E0a7WLkbCaCnfmUy8QeJm8hFrI0Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bW5oc2FqM3JZdVVMQXFrSnBmYXFoSTZvTWxPUFlFcG1lSE91eFNkVkEzRm9t?=
 =?utf-8?B?Y3J5ekFIMVJodEh2dm9NZW5vY2E1ZktqUmpYOUpyblhjM0NoVFVKQmRSck5q?=
 =?utf-8?B?REd4QmJaUk5idEVqQk9rSXl5V1VYZXZWc0xTWVp1c05mYW9pcU5ZTThtcUxY?=
 =?utf-8?B?bTFQU2hiby9pZ0FwMUkxUk1aeWtvOTdyNEMvS0dmTEd2Vmp6bDUvUTdvV2Zq?=
 =?utf-8?B?UGNHK3RUcFJzZnhOUFVoT2xmQS80UmhEMUNMVzFaQU1ENXNuZk9tTzk1Nmxa?=
 =?utf-8?B?eDZSdEcraGcxd0xtazJzS2ZuYkJRdWlVVEZjbngycS9XUGI0UkpGWHl0ZWFT?=
 =?utf-8?B?S2RSK29JamFrQmUvd3h2V2E5eFc3ZHZXRStKWWZMMXdXZENTYlJCRmhiVk5L?=
 =?utf-8?B?cDlteVpYQmRiT1RvU1hrMUM1SHpoaWJqK2o0TE9PYWhWMU0yVHgvNTNSZG0r?=
 =?utf-8?B?aHgwdzl2R2NWVmRKWVhjUy9vL1RaK3lFOTVmaXZqWS9Qck1vN29hWGYvMksx?=
 =?utf-8?B?U21ndkl0bnhkcEt5anRtZ1lidkR1MjVHN2R3TFhjYVVmMDAvNG9EZDNqNGxG?=
 =?utf-8?B?Z2NQSmJnNThzZ0UyZ1p4WFA2R29MbGpVeGk4SXJRdXBQQTN4R0FmYnBpYVJp?=
 =?utf-8?B?eFFPTDZ1V004MmFDYXR6MVFmcmV1SkQ5Rzd1Q0drK0xWeXdQYzBScHBXckpr?=
 =?utf-8?B?Q1pwTlRVOHhoVEovYlBoWHZQY0UyeGN4REFOR2trSXBuVGRab1VNck8rZncz?=
 =?utf-8?B?Ly9IRE95bDZKSHNXL05oQkJJWERGN2hFV2FsNkk0M1h3d2c5Q0pZdDJHZ09v?=
 =?utf-8?B?RXhhRkorb2JrTmFDR3BNWVlUUzRxNzdaNVk2RnE3NUhieEZPTXhyU2U5M0xt?=
 =?utf-8?B?OFFXTTR2TEtSRjR4bjduVzVjelNUNVY4RkVqOFdKTlNFOWdaZks3UUxjWE5K?=
 =?utf-8?B?RnlWVWlweXVHQTRERTM1WkQ3NHkyRy80WUt6VDYvTlV5RTRkVHdncllIZGFD?=
 =?utf-8?B?Q2V5bUxQQ0lMOVBiVmR0MTUvTk5NY2NYelBqNHNKVmF2dUpXSEZldDg3bHF4?=
 =?utf-8?B?STFhLytoam9FSnk0RVJ2S3MySnZLTnRrVm1hVVVGa0tOaEF1eHRnVU1YQXBx?=
 =?utf-8?B?YkhKc1hGdG00eit4dmtzc1gxV29QOEZoeE1kNmJ1TllTNXZmRzlwejlrc0J5?=
 =?utf-8?B?eGRXdCsxTVY1bGNodHprN1c0SG1wREV6V0s5SllkVEF1elVaa0x5YW1vVDdz?=
 =?utf-8?B?UHcrcFFiVEJXQWY5OHA1U1RRd3M5TGdtUmRMdFFhVXYrMTNrSzYrWHQvZzRm?=
 =?utf-8?B?ei8xUEtna0lrWEpubnN5ZzlMaXpNbGVoMzE1NWVoU0tIVXF3eGxNQzk0TEk1?=
 =?utf-8?B?MERUa0dOZVhxanFaTFJtYURCREc1cFZ5STd5Y2t0WnRGV1BMVVk5TGNNNzVr?=
 =?utf-8?Q?fnaKhL4K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5794d4b-6e4e-4854-7475-08d8c6b67832
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:37:07.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXvNMSAZgsow2JByLGQ3PMJu0UWeMhzr8llL5gdzxpsrusWlER5SK38PlHWAF21M6VBfVa17Po8gM/WdBgENjsdN8PIjNKIQkHbD1aKF84E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------4B7986068634418DB217FC07"
Content-Language: en-US

--------------4B7986068634418DB217FC07
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-29 2:32 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.8.1:
>
> - Master was renamed to main
> - Backwards compatibility fixes
> - Install dependencies before trying to build/publish
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-support-cross-complication.patch             | 11 ++++++-----
>   .../{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb}  |  8 ++++----
>   2 files changed, 10 insertions(+), 9 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> index 775ae1b2e..98d250c74 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> +++ b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> @@ -1,4 +1,4 @@
> -From 9a16800738547d117284354bbcad7dd77d9d0344 Mon Sep 17 00:00:00 2001
> +From 5f3911737c63a098caf73f1365320fe1b3a7638b Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Thu, 21 Apr 2016 03:05:57 -0400
>   Subject: [PATCH] support cross-complication
> @@ -6,12 +6,13 @@ Subject: [PATCH] support cross-complication
>   Upstream-Status: Inappropriate [oe specific]
>
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    setup.py | 35 -----------------------------------
>    1 file changed, 35 deletions(-)
>
>   diff --git a/setup.py b/setup.py
> -index 658d1a5..e8be7eb 100755
> +index eb83cfe..3f9567b 100755
>   --- a/setup.py
>   +++ b/setup.py
>   @@ -13,41 +13,6 @@ import sys
> @@ -38,13 +39,13 @@ index 658d1a5..e8be7eb 100755
>   -    sys.stderr.write("You need to install gcc to build this module\n")
>   -    sys.exit(1)
>   -
> --sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
>   -sp.communicate('#include <sys/prctl.h>\n'.encode())
>   -if sp.returncode:
>   -    sys.stderr.write("You need to install libc development headers to build this module\n")
>   -    exit = True
>   -
> --sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
>   -sp.communicate('#include <sys/capability.h>\n'.encode())
>   -if sp.returncode:
>   -    sys.stderr.write("You need to install libcap development headers to build this module\n")
> @@ -57,5 +58,5 @@ index 658d1a5..e8be7eb 100755
>                       sources = ['_prctlmodule.c'],
>                       depends = ['securebits.h'],
>   --
> -2.8.1
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-prctl_1.7.bb
> rename to meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> index 54620a066..b87a470b4 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> @@ -5,15 +5,15 @@ limitations in C and linux. This module provides a nice non-messy python(ic) \
>   interface."
>   SECTION = "devel/python"
>   LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f"
>
>   S = "${WORKDIR}/git"
>   B = "${S}"
>
> -SRCREV = "57cd0a7cad76e8f8792eea22ee5b5d17bae0a90f"
> -PV = "1.7+git${SRCPV}"
> +SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
> +PV = "1.8.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/seveas/python-prctl;branch=master \
> +SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
>              file://0001-support-cross-complication.patch \
>   "
>   inherit setuptools3 python3native
> --
> 2.17.1
>
>
> 
>

--------------4B7986068634418DB217FC07
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-29 2:32 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129193230.20879-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.8.1:

- Master was renamed to main
- Backwards compatibility fixes
- Install dependencies before trying to build/publish

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129193230.20879-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-support-cross-complication.patch             | 11 ++++++-----
 .../{python3-prctl_1.7.bb =&gt; python3-prctl_1.8.1.bb}  |  8 ++++----
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prctl_1.7.bb =&gt; python3-prctl_1.8.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
index 775ae1b2e..98d250c74 100644
--- a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
+++ b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
@@ -1,4 +1,4 @@
-From 9a16800738547d117284354bbcad7dd77d9d0344 Mon Sep 17 00:00:00 2001
+From 5f3911737c63a098caf73f1365320fe1b3a7638b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 Date: Thu, 21 Apr 2016 03:05:57 -0400
 Subject: [PATCH] support cross-complication
@@ -6,12 +6,13 @@ Subject: [PATCH] support cross-complication
 Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  setup.py | 35 -----------------------------------
  1 file changed, 35 deletions(-)

 diff --git a/setup.py b/setup.py
-index 658d1a5..e8be7eb 100755
+index eb83cfe..3f9567b 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -13,41 +13,6 @@ import sys
@@ -38,13 +39,13 @@ index 658d1a5..e8be7eb 100755
 -    sys.stderr.write(&quot;You need to install gcc to build this module\n&quot;)
 -    sys.exit(1)
 -
--sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
 -sp.communicate('#include &lt;sys/prctl.h&gt;\n'.encode())
 -if sp.returncode:
 -    sys.stderr.write(&quot;You need to install libc development headers to build this module\n&quot;)
 -    exit = True
 -
--sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
 -sp.communicate('#include &lt;sys/capability.h&gt;\n'.encode())
 -if sp.returncode:
 -    sys.stderr.write(&quot;You need to install libcap development headers to build this module\n<a class="moz-txt-link-rfc2396E" href="mailto:)@@-57,5+58,5@@index658d1a5..e8be7eb100755sources=['_prctlmodule.c'],depends=['securebits.h'],---2.8.1+2.17.1diff--gita/meta-python/recipes-devtools/python/python3-prctl_1.7.bbb/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bbsimilarityindex70%renamefrommeta-python/recipes-devtools/python/python3-prctl_1.7.bbrenametometa-python/recipes-devtools/python/python3-prctl_1.8.1.bbindex54620a066..b87a470b4100644---a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb+++b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb@@-5,15+5,15@@limitationsinCandlinux.Thismoduleprovidesanicenon-messypython(ic)\interface.">&quot;)
@@ -57,5 +58,5 @@ index 658d1a5..e8be7eb 100755
                     sources = ['_prctlmodule.c'],
                     depends = ['securebits.h'],
 --
-2.8.1
+2.17.1

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-prctl_1.7.bb
rename to meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index 54620a066..b87a470b4 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -5,15 +5,15 @@ limitations in C and linux. This module provides a nice non-messy python(ic) \
 interface.&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;GPLv3&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f">&quot;file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f">&quot;file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f&quot;</a>

 S = &quot;${WORKDIR}/git&quot;
 B = &quot;${S}&quot;

-SRCREV = &quot;57cd0a7cad76e8f8792eea22ee5b5d17bae0a90f&quot;
-PV = &quot;1.7+git${SRCPV}&quot;
+SRCREV = &quot;5e12e398eb5c4e30d7b29b02458c76d2cc780700&quot;
+PV = &quot;1.8.1+git${SRCPV}&quot;

-SRC_URI = &quot;git://github.com/seveas/python-prctl;branch=master \
+SRC_URI = &quot;git://github.com/seveas/python-prctl;branch=main\
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-complication.patch">file://0001-support-cross-complication.patch</a> \
 &quot;
 inherit setuptools3 python3native
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------4B7986068634418DB217FC07--
