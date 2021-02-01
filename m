Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.52])
 by mx.groups.io with SMTP id smtpd.web08.33835.1612186509098633626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=imMFcAaT;
 spf=pass (domain: windriver.com, ip: 40.107.75.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpc/k0wLAbaIRQQodsQNBGvEpOSNEE8CteZ+DyQ+tAivPYX/e0MCBXFsAEZivDR+lwKpz8IKApMXZ+9t1iGnBNM4Eizp/FpP3SPFdynqPOsXlkkew4Ni0/9Qp0NXOiboI0xXENfj79cJAUhURF9Zv0mTPTa7Ewzb6sB2n/0ZmMV4sYvV82RrJHk1actNwqN5SYs8qHHuP5Kbs9FJRCa90fuOtMtURkhqUWpfOd1E2d9NtDX93xxz3xFRuFKkhwUmQK/O9glQKgcROILgnifaNSmA53XVN20/tH06nc8f7mM8zb/yCiXQpElsWGalYiQ2wgK7sib05JgpwKOK4I0MWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDDgPF0vehvGzGdy8dswq8ePAibEQQANhYxxEQCj/1g=;
 b=iObWEElCZXPPq+iWBJsFtnAM8XCFP/zp/C7toYs1TYiYb1pg1uqunnlLbV3ZZ13cAHNhqdNou7hlK6/ZzOYCC7Nkp3zM1JTY9fMYDkGjEmxCtjOaFKLLAb4uq3OkeG1bqvwvZtJmcs2ZIg4WMON7xTWYOewElFhMuM5hbRz96oP8Bfi/cpIZMvdd9VqKj1YYJ0tdQZb5gId9MpGIo7Sw8+MYgfv9UbTAz6HdH4Gdz9AITkEb/CDLT8/hM3DyUA2AeNnwF8ftXFt5d7B0B1LqSjqhrIe6BvpB3LJKxIU7uCNfPRW5FCRYPu0yq8VhcDZqHq/W9FuglbCE3TD1hq1D9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDDgPF0vehvGzGdy8dswq8ePAibEQQANhYxxEQCj/1g=;
 b=imMFcAaT22CKD1Ce0PXTQrLe2s/ipXoxOB701U+gYtmLIHpLmJhKOBnohtDUtnOyQ7mYxgRTuwmR2QGRTwyGjyIHwFa7TuwLW8szmUtm7pMaqFwkGOUPPHRTekJ7zWjZURIJXUt8uRRp8Uj+ojhJgkcrrOWKds9xTI5J5EzFitM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:35:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:35:07 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-cantools: Upgrade 36.1.0 -> 36.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
 <20210129131029.2163-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0804d170-4f46-2b6f-f02f-a9c7c7e76988@windriver.com>
Date: Mon, 1 Feb 2021 08:35:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210129131029.2163-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1101CA0013.namprd11.prod.outlook.com
 (2603:10b6:405:4a::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1101CA0013.namprd11.prod.outlook.com (2603:10b6:405:4a::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f55db15e-2928-4d37-b231-08d8c6b6308c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4308C31EBC663CAAC698BF0F9FB69@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PtKo79KV8reKM+RLuz2yyt5fg33SpuWmSafnOduVJmPmcxkeIdZj2yhhvNEGQnBn3AdTuPOTh+P5Up/OzBOU8EEAokd0YtUJYjADXVmvDW1/+5VdycFG6afz1di4U5mG+FLecfC/e3nD8jRXk2eyr/R55q4sKKCXIHnEJD+I2N9AEfiX3r2kiWAVQcMW9y67ibECBUGOS2cPZB5II/2e4asW22Bdg+VPDhcoVJSQnwrzbNfCj0x8Guyauyhq4HNRn5Cb4I2QC7puQhOimMxpSTbkEGGh8IG+zd04aQOe3xjJPj4v7vHmC4ipoXxKBGAK/0/ROqiLmziJeU5KGf1UHr6luH8pwf1wy0EYKcuHh73OGzwY9lupQ7T92+8V6hCCS9W6E2AM/caTkUdVIMhyZ88v3gMWHe3W/yauY8Vvr/uj8nCUaMnS9w7YxBHCsq3uBJTDID0Iha43f9jah7XCFvOJtMTnVPvt2BCksja0dHJfLCGH0SMr2M7PrDPJBzKW4c+jFT9CAQCnD+wRHEx2cY52AwpNnJez3gXh7JIptrD9GHNfHuyYgcTG+qzA6q5Prg5f6BpBV7i1hfUYnz5/X6pVrJG82IUulygB2gkHkNh59wqZ0wsqEdd4MTVDjsuiCoVgTVSL4OZAw0OAthcH3qxm97+lIfWfmdXkA3YiboNxY4cfMJ0ju8IWJb3HBO+m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(5660300002)(316002)(478600001)(26005)(966005)(8936002)(53546011)(956004)(2616005)(186003)(44832011)(16526019)(166002)(86362001)(52116002)(2906002)(16576012)(66946007)(83380400001)(66556008)(66476007)(31686004)(6486002)(33964004)(31696002)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dVYvMFVZUTB5V0lJb0JrS0IrY2ZtSTh3WTJJa1FTRzFrVkUvalF4RXJpOEZx?=
 =?utf-8?B?T0lRdmFkeDE3bXJrWm03LytoV0VEM205SzdyUW9DR0FBci9vUHZRY0VGeWVY?=
 =?utf-8?B?QUh5dTNsOEZUV0NGWWUwVzB3N0VKcWVlSnVQV2R1dkxOTlhHc1FRTFo4c2tV?=
 =?utf-8?B?b1g4ckFiUXRNakN1Mk9BMkhBeFV1dERPdXMvYXJGa09UWjg4bnVnOTlLSm80?=
 =?utf-8?B?dzQrNlRvZWxWeUNNUUJaNFozMC9TMGt3YmdnbDJnSTNyd0IzSnF3My8rLzdC?=
 =?utf-8?B?ditDSE0wbjJaR2tZbVAxRUFpYjZRUDVtV1F5QkFYdjJwOHNTdktwdlhHZnZL?=
 =?utf-8?B?Y0orQ0JPdUxyMGQzbmJzaDdybkQ2cTdmVXE4d2YvMEhkZ21ZM2pPeUU5UzV6?=
 =?utf-8?B?SWp2N3RHM0J2cFhCcDFLL1BjU2xaZzBaSnUwSEgvaEcvcVp2emswTmxOaWpF?=
 =?utf-8?B?YWJKdzgrcFRRbS9zWXZsWFRteHI5Vk9FeTJVSVBrZjFkS2hmU0ZtMlVRbStl?=
 =?utf-8?B?eSs4aW9GMHg1UjgrRG0xTGlyOGUyYm84QU9kOVFzd1pLSXZWazVwaDl2SjVT?=
 =?utf-8?B?K1o5NjROSjFLRFFEOFhOTFp0SlY4RjFrRGc0OUNQVEtTR0Z0NjNOVHBQVXdX?=
 =?utf-8?B?Y25QN3RKMkhvRXFqdzY5bWdEenFOZm94ejUwSUZSNkxySUo1dUVlWHVXanVy?=
 =?utf-8?B?UG0rbkNnOTVVS01NZW14NjVGUkVRWTd2a0hqR1FVdjRxcDhxYVAyTXB2UUlm?=
 =?utf-8?B?L2hWNVBybENKM21RQmtKOTNnQkNRTHl3QUxZSjFZN2E3a0t4NjB4aVZCQWlH?=
 =?utf-8?B?ZFlkS0ViQ2s1Yit0MVJvTk1XUEF3S1h5TkpxK3E5ZWlBWXZnM2t3Y2hPRDA3?=
 =?utf-8?B?bjUrQ2txUGl5bXd2WWNIdTB0aTF4UVh0RnlDNHppSGJTblhFOEd4N2FvT0hE?=
 =?utf-8?B?NzBkT2xNWlhSRi9hdWdGWFdwVWRpTk40bFNKcXNuK3IwNkxZU01KTitIRHBy?=
 =?utf-8?B?bHVSVVMvcU9uWktxeUNzRXNJRjk0Qlg5bS8xelVoSCtURG1vWWptWGFSZURE?=
 =?utf-8?B?NWNZcFA0cW1NVi9ONEZWZ3pwNU00NW9raWpvdWl5bmxuditud2phSkZlRzVh?=
 =?utf-8?B?eEZUZFZ2MnQ1NTJsUm1Fc21yS2wxTFluQU91MkQwWjBsa1pubEdXMDlZWXYx?=
 =?utf-8?B?d2FxbUE1eFozTkE3Wk1ZbThKMGtwbjV0R010SnJJTzNseVh5SU5jcXl0WHFJ?=
 =?utf-8?B?cmJjNnBTNy9Jd2UrWEhjcVFrN1o0L2M5V09lL1ROVjVDT2dTSXI5aTZza3Er?=
 =?utf-8?B?ZlZaR0NnbmNsazhkY1pnVUZaMUpxdTdzQ21BV2xyUDg1MkduWGxYVzBtOUJa?=
 =?utf-8?B?KzFBRHJwQUZ2aWtkKzdLQXVEWW55dC8xcnlJc0VlQjdpV3dkMzdZdHB4WFV3?=
 =?utf-8?Q?+RdOlnrY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55db15e-2928-4d37-b231-08d8c6b6308c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:35:07.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZTdggSq3zUJ7InvXSxaCocO4j6iIIDXhcHm/RrCxdzpSCf8vbO5iBUT2MLv9oZWFvwQ+hPCy7rhD0jBMpMF//DWe7YmS0yYc4BoIYxai4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
Content-Type: multipart/alternative;
 boundary="------------67B966E7BEDFDF7DAD8072F7"
Content-Language: en-US

--------------67B966E7BEDFDF7DAD8072F7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-29 8:10 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 36.2.0:
>
> - Make matplotlib optional
> - Only run release job for tagged commits
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cantools_36.1.0.bb => python3-cantools_36.2.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cantools_36.1.0.bb => python3-cantools_36.2.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
> index b2f3fd6d8..632175cc4 100644
> --- a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>
> -SRC_URI[sha256sum] = "3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5"
> +SRC_URI[sha256sum] = "31bcdd56cbb5e26decab42f0624c8cead9b94991f6ee922512b0acd6ae7d6da2"
>
>   PYPI_PACKAGE = "cantools"
>
> --
> 2.17.1
>
>
> 
>

--------------67B966E7BEDFDF7DAD8072F7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-29 8:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210129131029.2163-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 36.2.0:

- Make matplotlib optional
- Only run release job for tagged commits

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210129131029.2163-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cantools_36.1.0.bb =&gt; python3-cantools_36.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_36.1.0.bb =&gt; python3-cantools_36.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
index b2f3fd6d8..632175cc4 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/cantools">&quot;https://github.com/eerimoq/cantools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>

-SRC_URI[sha256sum] = &quot;3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5&quot;
+SRC_URI[sha256sum] = &quot;31bcdd56cbb5e26decab42f0624c8cead9b94991f6ee922512b0acd6ae7d6da2&quot;

 PYPI_PACKAGE = &quot;cantools&quot;

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

--------------67B966E7BEDFDF7DAD8072F7--
