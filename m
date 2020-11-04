Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.43])
 by mx.groups.io with SMTP id smtpd.web09.13899.1604501282527298371
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ozYMqykY;
 spf=pass (domain: windriver.com, ip: 40.107.92.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbZrh7pd0bVXTpUXBFj1STKzaLFr83AZgNN3+YQOqsa2LV+10nOlJhCrmQUBeY9AFFdGz/m81x1X2IYlUegrxMmgegFNrA9RKFqfFovPgKPmP2LR4uti2AYWN3PsEUZ8dkfsRD6I/UBaKbc3Hjeswm5zZJJ19+kJs8Y4GCH46B532sY0e1N20BnAT068uhw/HMNVbAAHzedy+rIR9/p6iKH2uJSIXKLv9Pn89wLaO+bPOJkUDB4v2y95pDk855lPNtpK9BG9KAhxFYbKByB/04Zu6wkgjj4HkAeZCuNXRLxR64O0TZNN1X47+fzYppO1V9UVNWKb1JDf5aEo9ZzsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCJLj1vIgfdAV3+6To5XOI6obFVjplCR/XRRDOHe6Uo=;
 b=h7RZbSNH9bg1ZqM4s6M2P/cO5gBTgAKWWf3b5j06DD5ZgcDO9qsu+8L9bw4Jt7ER03vu5q7rHfOTVJbhFwlfGE1s2NHCPuXu9Wxa3ejkNVUwhzsYPxffilmUZGxbc+hHmsBTPeTHHcSiUi7LBYDzgb+Otm+I626Qze+WIL+BEnz3TM7O/Q7MNUv2PcxA+2q1Q3BwUY7bENQ7gvE2pY/yU9tUn7O9KoI7nxcnTle/YRTrGK24bmpyjsP8V6sR893wlefr1zh5N5Vur6Cwk+enml25FRUTNKTZSatwJIQ7YAOMcbqDHD3/cYKU+UpHoM/nRwjtWyX7DQFmwk2S+0OAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCJLj1vIgfdAV3+6To5XOI6obFVjplCR/XRRDOHe6Uo=;
 b=ozYMqykYBJ0HSB/QmPtdiaYtoli/k1k4AAswe/86BT6nJPwtjWdq3X5Pijn4SlJ5FcPh35to+5idk2JgcQbl21s/nL6blM6sESHpjG4Zekwq6jnaljgydaEjdZv+7xY3Gn/AucpX70OdKzJFeWy+gQhOO9BwXuZI574uMNr35es=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:58 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:58 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-kiwisolver: Upgrade 1.3.0 -> 1.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201102100303.2377-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5a673887-44a6-0c0a-9131-170c3cf12684@windriver.com>
Date: Wed, 4 Nov 2020 09:47:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201102100303.2377-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0022.namprd20.prod.outlook.com (2603:10b6:a03:1f4::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 14:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b489317d-ce43-4946-ede0-08d880d09f29
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085D3920776C14ED8B0BA509FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MPQWoRknpZttDX6zZ5eeEbwxK93tU04NsRKzcul7j6U0Xzwd9rHIxP5m65j6uEYJ6oeUrWcP4G2tkWSkxy7DXU+prr7WahfPxeXpGshbjSAiv2l+RFITbpCp99aDVjOd9bEXccI4Q5Eh+CpIO3zu43OHeaV281ha+Tj/Nyo/PJ5Z2rhPFVw22Um7efQRexyMdpefjKAgzNn/hMy91rkbeGXIlPmNsarETThYa6hpLVjwErXJmVhSgV5adTYF9ksgYn1cuTZNQI7RWM5tHIxikwyKUs9qMbmcU09dYMJMann2aoRhiFMQbirjYsIlnGTJs2jrzSCV3fQt3H8GzpudAi/zoYr3+H5gKzJXdP35RU6HIGEJ1o4NPnY4cwmudXSHyUZRDs7RGmaI1PMaxRKJfJuHFDkFFObbo21veh3Z7yFGkOJ7Va3YNPoGjW51wX3vo9xTluBVeU3eLlT2o90eGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xr7HDrLinl5Ozr8YIvs+8dWdURWtYu5lPVIRwm2A64/47i/VmEDvKw+VBioQoF5xTt6fuyOPwLMB5pZ+uS2Nw1ILyCskKSjkZf6TfGN8x0oAws4RW7O8wVb4yRJcXYVLPIwRgd6sz5vepqt/R1NQg97F6ngb4lGrZraLWwVikBLl9TPyLbraguEl9+ismpWlucSraSHu5OM0W2XYyI1ZuFPMly3VhxgGuGOZzcqLXXmL0axNwN/9bPi2Adolxi1PqsP+R0l8JN2fDeBBrTIBMR9d6tODDY8H+XtOlI/JwU7YcBXGnIJx7z2pGO51r7DrfMEKe2ujUy0A9tRU2f/lCxMIPO7DC2IXmM9BUQgPnCy/ga+dh4wqM2LbTZVm383RXyPREGCyHvknpfF+OyhTgDW83Vn6ak0m5Rl68FwpAaiimEqzFWTOxbQsoHGrZhu91xN8gCkelCyowlad/p3lVtBCoLjgQyz3moVVMhKfzdbTVLhux3tyDv0N2g7NGB8Yp7ipCC+l6jBZdlIjA2v6WL5g5/XXnHK50ZVYyERtf7QC/jNu4KagD8NLRpKgHzChyckL9l1j4euQzpXD+8iPkIRRE1fBtzzirT1wgv+fl7tFHJTa3TJlfIehxitxUCyKs8NQerWKuTQsr/GPsXT/Yw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b489317d-ce43-4946-ede0-08d880d09f29
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:58.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZkxSvfm2tjJxjdxBjDopDFgBaJ4TGM20EYRhrJZDMlQqNrbM7zS5TUUgI4Sw18BW/COFk7B4WSK+153qcmBZt/8MsbsEGBj5y9RccMtW/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------A4F360757BB232DE3595C4B6"
Content-Language: en-US

--------------A4F360757BB232DE3595C4B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/2/20 5:03 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.3.1:
>
> - allow to avoid linking against VC2014_1 on windows
> - do not mark move constructor / assignment operator of expression
>    as noexcept. This is to circumvent a suspected bug in the GCC
>    compiler in the manylinux1 image.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-kiwisolver_1.3.0.bb => python3-kiwisolver_1.3.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.3.0.bb => python3-kiwisolver_1.3.1.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
> index f499f04530..be60dc20e5 100644
> --- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
>
> -SRC_URI[md5sum] = "9d1b3e2dd2bbe1a81ffedcc73cab07e0"
> -SRC_URI[sha256sum] = "14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9"
> +SRC_URI[md5sum] = "81012578317ddcfa3daed806142f8fed"
> +SRC_URI[sha256sum] = "950a199911a8d94683a6b10321f9345d5a3a8433ec58b217ace979e18f16e248"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------A4F360757BB232DE3595C4B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/2/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201102100303.2377-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.3.1:

- allow to avoid linking against VC2014_1 on windows
- do not mark move constructor / assignment operator of expression
  as noexcept. This is to circumvent a suspected bug in the GCC
  compiler in the manylinux1 image.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201102100303.2377-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-kiwisolver_1.3.0.bb =&gt; python3-kiwisolver_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.3.0.bb =&gt; python3-kiwisolver_1.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
index f499f04530..be60dc20e5 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nucleic/kiwi">&quot;https://github.com/nucleic/kiwi&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4">&quot;file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4&quot;</a>

-SRC_URI[md5sum] = &quot;9d1b3e2dd2bbe1a81ffedcc73cab07e0&quot;
-SRC_URI[sha256sum] = &quot;14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9&quot;
+SRC_URI[md5sum] = &quot;81012578317ddcfa3daed806142f8fed&quot;
+SRC_URI[sha256sum] = &quot;950a199911a8d94683a6b10321f9345d5a3a8433ec58b217ace979e18f16e248&quot;

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

--------------A4F360757BB232DE3595C4B6--
