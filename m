Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.82])
 by mx.groups.io with SMTP id smtpd.web12.84.1615992782418526956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L4T2Nyks;
 spf=pass (domain: windriver.com, ip: 40.107.220.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klDEL/SFwyFRAiCa5+iTrGIiDi0EKWvUjehIIRBHYB38dFnGB8Q+1JeciVCiPOia1stJjX3eWNtWHavyPept7B0nGRsXd5Drd4IWwKKjWwmB6RGcZNklBv5SrNWIycUo7LQchfJ2rHN/RuVVcrQ4XoOBoZAwl1Mj/gRSqKpdIA7OsVpq8luEfbn5WaXqQA5Xev3uKoQb6Lr7rRI6A3w+2SRnKEpwRddNEQ1GHdp6eyiMyrQj5kUEkdXrMetuqt66g1ALnUv2Zmsv8WQ0zodBDfxtTQLBHKeyI3200HfJBWfRpk+LTfDKarMpoCLTelC8PW+sGn7Bb2NwV/6eixmvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMRiCMhHzv2vPDUvdc4wMTSzqdxfxymA/91cvWAO40Y=;
 b=OnCi1EPXbcTKsL74iGm5A1FcPywGOGx13KKOxOT2c7Shs3LscaHlnCUKk0FSMJ0JIZzT8V9AR57oG+5A8soEGabWBx78Bw2W8rePJZ2bdd2QBfe+VQu4OkckXOOjJwpZ/z7IYXjSnBFa/ENQp3n65yEHDamq0l4FLKH9/SB8yt9Au3BUaX3m4xxk53Jk7hp7Ilz0e/+27lyoiqBhOyMX3XTk8+Z7CdubbTvg9dvSIrqkUJ1wkFMgv9kQxJyMmudb8LmB/1rmxaQkyy5QhdolWjfqjlzduXZnlsjEUEDMy6iLDRZYjZGFp4Sl3XMWLNTClJr7bP6Mp8IDO+paJTFiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMRiCMhHzv2vPDUvdc4wMTSzqdxfxymA/91cvWAO40Y=;
 b=L4T2NykskzuY0M2fQ9zCFv2w8H0H4+Ij2YBipZe6xSqhFRLUV/+NZq/pBgSWl8Ru3+VTuofsBqN2JsFwsJeg6ZkmvdtTVabLX/2BiKcwyz9bjyx4F4UCGF1rASvC9yFBZOmkR4DFzRJL+6iCugrDzZCUK4E4oDFQF7IQeAaeAfs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:52:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:52:59 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-luma-core: Upgrade 2.2.0 -> 2.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
 <20210315084727.26812-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f2407039-c5ce-dfac-1840-11a62bf314f7@windriver.com>
Date: Wed, 17 Mar 2021 10:52:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:404:11::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0068.namprd13.prod.outlook.com (2603:10b6:404:11::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6dd3dae-07eb-436a-3806-08d8e9545b56
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2632CE4B00E2BA01AD23EC079F6A9@BYAPR11MB2632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9vbYr4sVKlhWE1DQBU0EW7inaCV1KeF/eb4uDASBwk+XoJI7TTsE7lylhHLmDQlxmKYV1mD6mKjMBayO002IasLlWcJPGIbDkDIJThSo5bAyf9mgyxgGn0JzzZx3Tz7ARu+MBNF8kCnFGp1jlpZDjZmp19ZqX7c6hqC0FHifa/hUW/nDyVIhMRQ1tEQ73GCDod52SS+WcMzxsCtT2KLDP7+5lfu6fzrg5OLw9h4I59Sa5nqsZ+WZKaKpplMnSvhUzjCqbWwmAL2oj6Su2DopODXlgwgl2gTHdGclpNUxPhP7WF3IF1leg0m52NmO6sjMOJwXDBwBPUxLBL40cW8dvjAQCEsdR1C0oS8udtE3KBEZw/Ki++k9nb5veonKIiA7IoZSqkiTVmShLmtPCL4paBXMpnBxxiS9CJQQ/MG2KLM0dvbwu+m5NBFhP70exy4ch6i/n7KOdGvu9XQw7Ba/MtDJsW1kCAtAZFYUnmAU3Qu8+8tfJyKZD7AfglDqgQ/fKsM6LpX5rXphBKeMKmX7OsMl1t4428vo5Wgq1khcd2Uc8qzKoqOq1a8WuaduQtUaVGPWJa2NIDB1CS9N3grlrBF0lj4aGeqzG5LDVdcVYNzdQXO9gBI2eXTo7FmNmBl0jAdJ1ltJ45tJgsWKiMF32YGA+TckYftJSWe+xtBNzeATTRE69s8Wq+mbohj1utd1Co+hY/QPNzUaOzqSvp/zhNlsHSJFXPQPPliv9w6gP/g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(44832011)(86362001)(5660300002)(16526019)(83380400001)(31696002)(6486002)(36756003)(16576012)(31686004)(186003)(2616005)(2906002)(166002)(956004)(478600001)(26005)(966005)(33964004)(53546011)(8936002)(66476007)(8676002)(316002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?c3B5SlZ3N1pIMWpDbmxBelpodXdacUdpKzNKWHhyWkVHZmdLeGZkdm9ZVTk0?=
 =?utf-8?B?THlhbmVSNXJDRHJicVdGYnpUSklkUERpMnBnbU1YaCtpckxWTEJMSnZiYm1p?=
 =?utf-8?B?NUFVdzd3MmFiQ2NBU2pzci9kczl4UlJXL3o2UmRadk15TjFoYzdZdFRoMFhz?=
 =?utf-8?B?OW42R2NQZEgvaFQwMVpkVUpTWEhRdjFSOHZyNlpBV0dOZGRhUVRUT0djY3I2?=
 =?utf-8?B?WGMxVEFMbzJjWWh6djJIY2pkK05uaHE5UktObGx4NFJGSmNpQm9Hay82SWxB?=
 =?utf-8?B?b1pLWmIxUVg0dUg2Z3ZCV0UwbTFaZEo1SWFkemJyOGk3ZjRIejg1dmdYc2Mv?=
 =?utf-8?B?bTZCUStyOVdzUWFrWnhQbHp6bit4WXQ1U2YzUlA2dUsrMzhMQ1hoakttaUJa?=
 =?utf-8?B?WVRjcnIyTy9vSXNwM0hib3R0QlA1VzcvMThFRmwvblkwOEpvYjBaRUN3NVUv?=
 =?utf-8?B?WXdYNWdrbEovQWhJZFNMTDlLUUUwR0ZtdzNvbXlscWNGU3B6R3JhSkZRdUc4?=
 =?utf-8?B?VURtWXpTS1VlVXVOVTdkT0loWmg1ZVYvYU5BdTRSd2hYMVFKbU5Uc3hhUkZW?=
 =?utf-8?B?c0N1cUswelMza0JhZHk1TkNBWm9zekFaeEdLcUVqQ0lTNjBldjhhcjUwNVhK?=
 =?utf-8?B?NlBMTG9JODBzOGhUUlFHRlNlMkJwcjZKTGNmamZwaUNnZm5GTGkrbnRQb2dL?=
 =?utf-8?B?enlXYlZzbkxIVGMyTlE2QXhWa1NxSFJubUMzQjVOK0JwcU9UUjFhRElOc2RF?=
 =?utf-8?B?QmtyVkY3UDl4YjYzbjhCcVJNbXY0eWd1czVRMVBBc3o4eHYzTUlnckh1cWsx?=
 =?utf-8?B?QXVnU0pmMkw3WjU3NTRnR0NRS0pNbm02WVM2V2pDdmJVQUFxeXJSbDlSeXVx?=
 =?utf-8?B?clA5NVNtakhKTjU5UFkxT2ZKMktrN1FOZnFPc1NXcEhJSUtHempBUnZqcStv?=
 =?utf-8?B?RThhTVBrN1VoazZ0djJNRldmbWdYaExCRmFZdXdkcEExWlFYYlZQM1VIMlUv?=
 =?utf-8?B?MHFGRjRqeUd4TkFIbU85UFNXdlI4THBvWmJxdTBmcDJRZHU4L1RMSkJMNTNl?=
 =?utf-8?B?ZDNOZDJoZTdwYTc5cW9MOTJkdGNnU3pSNXRUdWtQVHFvcUN2OVlsa0FrNzJX?=
 =?utf-8?B?UmxnYkRFVCtvYStNUVQ3d1lSS3gzQ3RJZ01RSzlLWjltVUFiL3hwV2xtNjF6?=
 =?utf-8?B?SS80U2FhNURJY0RKR0pTcDFxbVQ0SUlMc0xJenFLVTNmREVUY2JlWjJWRnk3?=
 =?utf-8?B?UFQzWmQzQjN1b1VHdmFMREhYejBxNXdBVkpoQjAxWjg3NGNRekljRmUyTktr?=
 =?utf-8?B?blJ2RHViZk9sUzREUThHbnM0TDVXZVYxRFpudXVrajBPTXNzQ3dreEloL3hi?=
 =?utf-8?B?czQ1S2JYYzYrcG5RUzA1Q1RzVC9YSmVybjc2eEx6bjJ0TTdNMUIxaENXdXJF?=
 =?utf-8?B?cTIycnN5ZU5qMGUxc1NnQUprYVlLZ2poc3o5a1hPTnJXYzY2QThzdlAvYnhE?=
 =?utf-8?B?M0RJR0h4OWVGTERLQUNGVW5WQUd5N3l5QnFCYy95SWlSc0lnUzdMTU42dXBK?=
 =?utf-8?B?WVBPM2NQMG93UXZiY2RELzNxb2xZT2FHbWdRZXhHb3dNMUROVnR5TWxKVU83?=
 =?utf-8?B?cmx4LzdRVjNaU01VS0JaQitNWms1Vk5nbGJxbDV6cGhpQURwM2YwKzJBbnM0?=
 =?utf-8?B?OFRBQnRncTArcUlYWlIyS2I4eWFUTS9Cc0F3Q3JqaUFaV1BkLzAvSERwczBH?=
 =?utf-8?Q?BoUGw/KiVV/LoFFolsLkWarR08ARi7daOOygpcf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dd3dae-07eb-436a-3806-08d8e9545b56
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:52:59.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuibuPR7lu2XT4ROxWxLRKbL9MsVOOk8OHVm2YbGOumI4cVHaVyIgkAwyEB1htYCpFXmVNDL+9WKtFyD357THY8/gP6TiJUk9sXQqOaSvo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
Content-Type: multipart/alternative;
 boundary="------------09409D38FEA496EE4FD00029"
Content-Language: en-US

--------------09409D38FEA496EE4FD00029
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.3.1:
>
> - Add Github publish action
> - Cleanup only GPIO pins used rather than all
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-luma-core_2.2.0.bb => python3-luma-core_2.3.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_2.2.0.bb => python3-luma-core_2.3.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
> index b181e0986..47efe8a72 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
> @@ -2,11 +2,11 @@ SUMMARY = "A component library to support SBC display drivers"
>   DESCRIPTION = "A component library to support SBC display drivers"
>   HOMEPAGE = "https://github.com/rm-hull/luma.core"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=3b1d500f5911ec7522f1f790d616e0ee"
>
>   inherit pypi setuptools3
>
> -SRC_URI[sha256sum] = "62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c"
> +SRC_URI[sha256sum] = "f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90180a385da9f7d003"
>
>   CLEANBROKEN = "1"
>
> --
> 2.17.1
>
>
> 
>

--------------09409D38FEA496EE4FD00029
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.3.1:

- Add Github publish action
- Cleanup only GPIO pins used rather than all

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210315084727.26812-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-luma-core_2.2.0.bb =&gt; python3-luma-core_2.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.2.0.bb =&gt; python3-luma-core_2.3.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
index b181e0986..47efe8a72 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.3.1.bb
@@ -2,11 +2,11 @@ SUMMARY = &quot;A component library to support SBC display drivers&quot;
 DESCRIPTION = &quot;A component library to support SBC display drivers&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rm-hull/luma.core">&quot;https://github.com/rm-hull/luma.core&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1">&quot;file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=3b1d500f5911ec7522f1f790d616e0ee">&quot;file://LICENSE.rst;md5=3b1d500f5911ec7522f1f790d616e0ee&quot;</a>

 inherit pypi setuptools3

-SRC_URI[sha256sum] = &quot;62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c&quot;
+SRC_URI[sha256sum] = &quot;f293f5fff8946eea62af3a5d5d7da55c37d2b64aac6c9c90180a385da9f7d003&quot;

 CLEANBROKEN = &quot;1&quot;

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

--------------09409D38FEA496EE4FD00029--
