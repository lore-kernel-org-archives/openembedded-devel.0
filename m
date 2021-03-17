Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.88])
 by mx.groups.io with SMTP id smtpd.web11.215.1615993225666084198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 08:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b5AjGbIT;
 spf=pass (domain: windriver.com, ip: 40.107.220.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLKeDFnoJjTKtpBiTAoMYLNmFF80IuBE3i/OFb5C8/FgJV0SA5qF8D28UnfvZAuVgIj02evNs3Zn7aCz5LvMiFAjiNlQVStSq0pRerQQjfnruHFSCMw8xdLVRVH5hT25KPaKCSsXcutZq/6j8ghHSs0xAuPJu+5EC/ul+Gb5AyNvXnVil2t8TVGdOy10VKN0pLIIsOF9+VCza9jCLW3p9d8O6w2HWpjzzranmn6hiU/yFRcQ5/AxinJKPPofCiC27+Ibjr9tJP+Q8fdwSknp8Z4t0nQKKGNomHu08zCM5/GA8PLgwEhI2vIR3rHp64xG4VZzPlEzqv3/U5BRtde7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgnCdsDMzjoj5yQgrT1K84iNMpM6GCR6h85Kh2czHAc=;
 b=XP05YTPcJJ0K+Tx7YWPPX1cB3k7Ljjqyh/p3XVjVD9Vbj23JLr72El9GxVej0pUag+YITYn1LXDhKYWL8WCPKQng/adwQudZMo5WjntLIeAnjUNxzDEeiu3a9TeTgebyxcydpSpmUbCqa8M1PXJ/arGPs1qhQpVQDv2AKkijQA9+Wxnmz6b677/e0FKoQTBm2setyCf5HIxM44UfxlPH0SoYcCwIyFy2T635d8M29Iy6LgnUdsFnHH9+O3nKtxSAwUz/XeHbARwni7DJAvq7DTQvH2w6Sg0MD8VWjjkSOzjh0yBT0yJ+FPjdaLpNILg8xG2ueTdDmQoL+IaUHB7+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgnCdsDMzjoj5yQgrT1K84iNMpM6GCR6h85Kh2czHAc=;
 b=b5AjGbIT8NtkxjFUhia77rZJIh7hIemq56WnpKMU14x73HZwZBbpYvoONYSGXvq+hsBrED49rFBJPS7+Gfk2qfKAozM2NhlXyvlSZDPeEw8mKA1s5qyrSLSMb1FtXWvLfxIZ+SWigvuyQ58PWGFAM4LzE2qWEOmng4SrF+QWPoQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 15:00:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:00:23 +0000
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-defusedxml: Upgrade 0.6.0 -> 0.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
 <20210316083744.17558-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <18020dbe-2474-9091-d266-b9a4e69332ae@windriver.com>
Date: Wed, 17 Mar 2021 11:00:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210316083744.17558-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN1PR14CA0025.namprd14.prod.outlook.com
 (2603:10b6:408:e3::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN1PR14CA0025.namprd14.prod.outlook.com (2603:10b6:408:e3::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:00:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27479065-e4b4-45c1-6c87-08d8e95563da
X-MS-TrafficTypeDiagnostic: BYAPR11MB3253:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3253CBA75F19743A95B7FBF29F6A9@BYAPR11MB3253.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q4eDOaqirs9rTio+/RORCPbZTEqE2Spf7g/eQMNlZA/wUU6QfDozlsj918UJETiDSIgD975I/yswecwlUIlTvrhH8DdLT1t1keye+6FgZFf6S63gQFHcH8i0Dr/3l9yJvbFdnwKM+Jwl5mCHZMHJ9kYFtkeYx8qaF+OQaZS+ZR3tAi8rh6apYQlpGYM2WXwz9ntjv9Lf1GQuy8c2mCG9zkPzJOGJCnyE9IZviZZYUEcqVqjSxf1OtmozuV3E4/EKvyaW3LtWNooHJ0t8WIniXJgvGX376zEFtwWt+WQMZMnPca7JtpXUnb3UqbAJZvS05YJ1MKzd6j6aJKG43r0LhvUqAZ/7c/CeRk1icSkulXcLSrb9/uEartyVEeCTJSH9c3bYpHq8lEby6JLubfW2zmDe4sLwPzzaMnJtNXIVnJTdv5adDLlNAraUFux1s7SzoXAHUghwtNlolF9CtYxD1sdFytH1oqVtSNGDbJdVXc9Z+5tile42p2bM+Qv1XA/R7rtdTdmZmgh4bjmCNgyT5wuFb5t6nBNNpAHGGplxna9SrnNSkkjY130sZA0+yeAH1HQHtcU/BH1KyWFa5aHUOCnMZhXSKC6otDSKPAgGvOeIkytInZm/+r1hFiOQwO7MW+GaWxfTYQb2Q2WcxXr9VJiEBStvjKFKIcBwQ0Hh2ROI5/9DJGH4Bz4o86xqk0OWaMfOahv1lq//JZPNZqsVJquVAHTixwWanY48DaBfE04=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(6486002)(956004)(86362001)(44832011)(2616005)(186003)(16526019)(26005)(36756003)(966005)(478600001)(31696002)(53546011)(33964004)(66556008)(66476007)(5660300002)(66946007)(8936002)(166002)(31686004)(8676002)(2906002)(83380400001)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?a3BEZ2JFQzN2TWE5ZWpVYlVaWDV6RlF3ZEpMUWpWc0ljMnU4OXJGd01GNWRO?=
 =?utf-8?B?Y3VQWkVsVG9ERUZ0S1hlNU15SEYxK1pVaTR5MzJZcG8yN0xvcSs1Nzg0M2tM?=
 =?utf-8?B?ZmZVNTgvYVh1Y3Y1SVh3ZUF2SU1Jb0E3U3FNS3RWYTUwYW1YVFRsYkZWRE5p?=
 =?utf-8?B?U2F6elVVOCtSM0hXaTUybmN2V3lqbCtRYlU4NzltSjluMTVxNkY3NlVGNUUw?=
 =?utf-8?B?YkZMQ1lBckZMZmtzTkVISGlST2FwakV3MVhqRi8vTWNQZVViN2IwQjA4a3JK?=
 =?utf-8?B?WXl3VFdXR0d1WlBTUmtVNmxJcFJRU1FVWmxOMnV3Qk5wQjNGK0oyeSt6c0E4?=
 =?utf-8?B?UGVFMGNQWG9Zc1dlclNYRVB0RUt1QnhVQmVSYTlGT05ERm1qaUphcytJVzk1?=
 =?utf-8?B?Qk4zclhTeTJiSHE0RGxMbGRsd3NLRm42Qjh1ek9NMEZhbERjOEZEZnlHZW5t?=
 =?utf-8?B?ZzFrbHkrN0tnNDFBNWszM0NVZ2JzbEJnR2t2dFYxWTFVLzM1Wnp3N2hybGc5?=
 =?utf-8?B?UTZxK1hyTDhFa0Z6aUZzdzNmWjBHYUladmJlZEVIdE9ZTlJjV3RJallhc2V2?=
 =?utf-8?B?NEltWkN3S0dLeVY3UG1mYWxCVk1KQlgrVG1HNFVMS1hocVF5RlU1V2FUcDNC?=
 =?utf-8?B?Tk4yNkx3WHBKaXNjdHg2K3kxSG9ueEM1MTZndVdQc1pJVnVTYjhxNzFLMU9q?=
 =?utf-8?B?eVd5WjRmZllvYVkwUDNzTnZvQUFuT0EzUzBEenhJZjNxMmE4bk0wWkZDU2Yv?=
 =?utf-8?B?MGQ0eWdhRHdmeHVFc2t5ZmxNTTBrV3NENzdheERsR0VRU1ErUVptN2dJcnlC?=
 =?utf-8?B?UkhNNjVLZTM1S0dKRkJ4V2wwU2ZndW9yWGI1Nm9mWHl6cTFPNG5HK3pxZnF0?=
 =?utf-8?B?cTNTQnpjdFJsSDQya2xGK2poSjN6ZjVRaENxcjBCWVpwcENtQnhUQ2g0d3NJ?=
 =?utf-8?B?d2UzSUwxcC9kdmFaYjdyR1JPaVJUUGl0VzQ3RXRCMU9sU2ZpeEVuMHBHQkJy?=
 =?utf-8?B?SlYxb3p5d0M4WGRpK2ZmQi9xck0zQ1BIckw3Rm9xU1Q5VklnZC9vaVBXREhx?=
 =?utf-8?B?MGM0N1d3cFFzZkNhNi9vT21wYVdIT09zSTVmU01oM05mNE1vM2R4K3o1SjJG?=
 =?utf-8?B?TWl4K0xsTkYyYUdzVCsrQ3BoWmFkOWZjOENPUEZPSDB2T1o4VDZIQUxoS0gx?=
 =?utf-8?B?VGd5Q1VveXlCMjEwZG1HaXVlcVkybmExK25PeDdWemEwOEVWa2wzTEoyM2FN?=
 =?utf-8?B?d2VCSFp4WkJPb1c4VEZoUENjMDBvUm4vWUFIT2J4WDZjY242UWQ3ZXI2NmNP?=
 =?utf-8?B?QU1FNnErdHJKSjRtSFlGc3RuSkhEN3dsb0o4NlpIUE94R3NxRnF5Wmk4NHp4?=
 =?utf-8?B?Ui8yNDJlcm1WREdlZFFiOG1jRDNqd2NRdE5XQUppbXFTUWtjbDhwNW4vVzJ4?=
 =?utf-8?B?Y21KdHNkMlIzenBGeTJ1c3p2Zlh4RVNYVkwxSmlURXB1eUpDOFkwQzNlTHlk?=
 =?utf-8?B?d2dvbjVxdk9ta3VSVFpGQjQ4YXd6TElpYlpMU1ZQZGd5Y01JeDYxS0lqL3pI?=
 =?utf-8?B?d09SWm9DMzlTS2hyZzdZNGNkWm9CRDB4VTNIeU94bFZHdXV5ZFpjb0t1aytk?=
 =?utf-8?B?aVhnSTIvOXNBVkFuaGl6V0J2S0xRamF0cm5CYzJFZ1RmaHRqNElMNlYwR3lw?=
 =?utf-8?B?UHgxTkZLdms2Z1FMc2Y4VzJmOTBmUWM4RVJVMWFzeEN3OGVqYVgremZUNU5k?=
 =?utf-8?Q?NA1WYyy9vl+O3P+OJxerQB6pazo+mi2/2cT2qQg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27479065-e4b4-45c1-6c87-08d8e95563da
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:00:23.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCKh+kKW+8HLe/LHG4m9PsNq9oU2vjlw0AXSbyfA0vd9ROuIGNdSVstzQz0g26wDtnEzaycZ8ZYZT4CjRs0L1KCE4xIhaJru+QoCyV/wCk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
Content-Type: multipart/alternative;
 boundary="------------6A9D3BAF2BA7BD8B3E523081"
Content-Language: en-US

--------------6A9D3BAF2BA7BD8B3E523081
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-16 4:37 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.7.1:
>
> - Re-add and deprecate ``defusedxml.cElementTree``
> - Use GitHub Actions instead of TravisCI
> - Restore ``ElementTree`` attribute of ``xml.etree`` module
>    after patching
> - Add support for Python 3.9
> - Python 2 is deprecate. Support for Python 2 will be removed
>    in 0.8.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-defusedxml_0.6.0.bb => python3-defusedxml_0.7.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-defusedxml_0.6.0.bb => python3-defusedxml_0.7.1.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
> index d041d0e6c..f48c429c4 100644
> --- a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
> @@ -5,7 +5,6 @@ parsers that prevent any potentially malicious operation."
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e"
>
> -SRC_URI[md5sum] = "a59741f675c4cba649de40a99f732897"
> -SRC_URI[sha256sum] = "f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5"
> +SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
>
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------6A9D3BAF2BA7BD8B3E523081
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-16 4:37 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210316083744.17558-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.7.1:

- Re-add and deprecate ``defusedxml.cElementTree``
- Use GitHub Actions instead of TravisCI
- Restore ``ElementTree`` attribute of ``xml.etree`` module
  after patching
- Add support for Python 3.9
- Python 2 is deprecate. Support for Python 2 will be removed
  in 0.8.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210316083744.17558-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-defusedxml_0.6.0.bb =&gt; python3-defusedxml_0.7.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-defusedxml_0.6.0.bb =&gt; python3-defusedxml_0.7.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index d041d0e6c..f48c429c4 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -5,7 +5,6 @@ parsers that prevent any potentially malicious operation.&quot;
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e">&quot;file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e&quot;</a>

-SRC_URI[md5sum] = &quot;a59741f675c4cba649de40a99f732897&quot;
-SRC_URI[sha256sum] = &quot;f684034d135af4c6cbb949b8a4d2ed61634515257a67299e5f940fbaa34377f5&quot;
+SRC_URI[sha256sum] = &quot;1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69&quot;

 inherit pypi setuptools3
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

--------------6A9D3BAF2BA7BD8B3E523081--
