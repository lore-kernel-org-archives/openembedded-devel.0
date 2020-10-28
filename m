Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.50])
 by mx.groups.io with SMTP id smtpd.web12.10623.1603898538456052637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EGsykdH9;
 spf=pass (domain: windriver.com, ip: 40.107.94.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8zz/XMDPdQEr3ycF2uEULe/ib4R1IWs5wKyVkfF+kUcCDSo3DbKyN5ndeeVF7GklZE5tL2Qae6lUzazJJeW55yD9q75qa1kanzcssWupmstQyj2Esuf5d0s1nFdMoHZCeSx+C0bOk9Y7sPqWHxWKe9+RpKBWUciz+oj6Uqf2GznHb6EQMxpAZTHCuemJs5iEAoNUnadlporY+dEjLBPdmoU80fwfkxg7qjvXFTTXiWHBPB6aXpCRFYLFy1shxAN6cpB5s3f/BcSK0Jrktii7Tb4JXU0i0+0lzHbFakEuqoZ73mNurWvQEZo9xqfU9vXysPuBMZqILCkd30tQiO71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQnjELgf2MLIcB2++NT+Imsdu68Ws3cLFtRQiIAkAhw=;
 b=goJxAgX5IiqVafeY+QBazAN1jFOIEOcbZBOgUW52+tR4FlJoYA2uNkfmJwDVzjozeunRD+7PIsbPjUPTo077E3cjTL9qtbTzCFa4ns3z6kLAHiuKFBWN2g9c1dHWRecd7S/WJRkPP1MmfFZd8swGH65u/uEI5tg6c2SnnF4rqsWQUg/V0BBc/UzAOlpAFtoTtRmGn3tbMnn5ugQRisdMbjfPpUEzm+z7drs2KTFP6Xj7MBLFAG3jL2eR735T32fr8c/3Ovc+0tId9PMNBaOuWh1SU2pR0kPODMDI/y80OrUOxE8qtUsP8qwamP5mNTISa/em1Ze8rCDWnr84w7goKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQnjELgf2MLIcB2++NT+Imsdu68Ws3cLFtRQiIAkAhw=;
 b=EGsykdH9spNq6uqEyOsZiXQTbsLDHK9g5nvVmca3pDgvvqtmHNqDnZ5FEeNdx1cgabbR24PobXjY6tDnK1zB9VAO+UDW5/q9QZQ+RPK0CsLlGjigqCZQRTWDSo12xZThIvqNEReOXpGu2aRbH+GwxYrrXQroE74ejkZHuHsqabw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:22:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:22:17 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-aiohttp: Upgrade 3.6.3 -> 3.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
 <20201026090217.21174-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e4611b79-a5e4-f490-c40a-a7f919f3ee03@windriver.com>
Date: Wed, 28 Oct 2020 11:22:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026090217.21174-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.7 via Frontend Transport; Wed, 28 Oct 2020 15:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b497237-b57d-47b7-d2d4-08d87b55414f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3189:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB318976579027B1694178AEC19F170@BYAPR11MB3189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LGZ8gjCWrRpyl7j8MlmV0/5fFWU8DEDZJCX6oxpGjtxfN+GkNun4oqr74LCQBQB0CRbDPFIvNyd/atUog+20Zy6PTCKHXHKGh8QqxltrgY/SCqS+VOY/Wm3P1cWKXS28ghNNy80HXPuiGImxkKFzANvWtviy0R7loAvLDTdtjp19s9WwvNWwO84V9ErzlRWifXSijBlM5ZMKFNh1EfOIrCIhIMnvc9UAAKnoVw6Bp+Cb3Qp0ROwQHhw8IW+gsrtQlPKsrmvAe1FHqEHLTKxuQlDoc/uNaXJ/ZExGtkin0rVssjYKrUgfYMOIsUKusFvXPDXholZWx5sdWmuZ9WGmipFRUxl4OkLEq3q9D31Y58VnJ+sbtHCyKOCW/ShzTewqzYAinGkbOBXx9g7oMbDcIdSt+M5X0OKRjs8fiTzkTRdLQnkcZyQYM2A0BkxmFGw1f3g1GmoYDWf2Eav2r+xrDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(956004)(33964004)(2906002)(478600001)(316002)(83380400001)(26005)(166002)(6486002)(2616005)(186003)(8676002)(966005)(31686004)(8936002)(16526019)(66556008)(86362001)(66946007)(31696002)(44832011)(16576012)(5660300002)(36756003)(66476007)(52116002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	34W561Y19BOgAyAG3O6lFixlMnmUAOVcmPS7xpG6KExRXvbC+OzVqfSXi16Lo3McDJMqsZvv8b8WgLMI4F81NOXrsJtsYJXrZjv23S1mGHnbJ8KN2Mc00mtjs3zLVQNCL7hDogzSWuDKUj1Hg+B7NTI9UH5eRASupokp7eesmI6Sf7DEPn0tq4TfkWtsjIIaQ/QQDL4R2vofuPoZY06ICU2dop51JQHwKMLRFDfsUmxJqmt+vQLpuaZ5eEK03ZSGVHEcSal9+RIV6TvMkJ8vC9FHxO23DRoQPUxcLFXjdMbA1oAr2Plqh5a7qxIw1JxOCe1/xze+zrXabkz9h7Rk8tVvULGI6U827jVLD12K6kNaX4X/L55+MzEd3Sf0Vxi0+3C9pjGYuJQnwLXZ8pCtB/Q8NkV4fjCLF9fFs5Lu50NMmB4/Jtr+iHAzsUmeWsACYYCHNkyHXibYHtwgr79qw5BRpADtOnlNcEabIW2rR2kWXi1xFmNH0tT2e6hjp6YX+E35nlmNiw/0qkBmKy9p7phi+1g8iN/PA0os38fcNBg97kQ7i1rFzbkHo985de0qeKuUGnTUAmk+qTgY2gjorjWxi2UOQKRgnPw4OdTEFg2OpOvXVPxkoS3Ci6c58UAcoAL2xiqkOh9MQuN1IVv9bw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b497237-b57d-47b7-d2d4-08d87b55414f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:22:17.2141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQXSSHSp3+bokGE29blNmmOczoYhjiHmL0Ol4MDirFGtwzF5B7R0obi/++k6Lq/v4Pz1mgHThm6A0lnj8lHolKm7aOvrAeKruy3WAQQbYbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3189
Content-Type: multipart/alternative;
 boundary="------------E71298527408980D9947ABE5"
Content-Language: en-US

--------------E71298527408980D9947ABE5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 5:02 AM, Leon Anavi wrote:
> - Fixed a type error caused by the conditional import of Protocol
> - Server doesn't send Content-Length for 1xx or 204
> - Fix run_app typing
> - Always require typing_extensions library
> - Fix a variable-shadowing bug causing ThreadedResolver.resolve
>    to return the resolved IP as the hostname in each record, which
>    prevented validation of HTTPS connections
> - Added annotations to all public attributes
> - Fix flaky test_when_timeout_smaller_second
> - Ensure sending a zero byte file does not throw an exception
> - Fix a bug in web.run_app() about Python version checking on
>    Windows
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiohttp_3.6.3.bb => python3-aiohttp_3.7.1.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.3.bb => python3-aiohttp_3.7.1.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
> index 824bde5e25..8b5b1dd160 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Async http client/server framework"
>   DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
>   HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
>   
> -SRC_URI[md5sum] = "13d02dc8379207dde1f6966d1fc5083d"
> -SRC_URI[sha256sum] = "698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645"
> +SRC_URI[md5sum] = "ed78633cc420b29d3b61c7d877dc0901"
> +SRC_URI[sha256sum] = "04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2"
>   
>   PYPI_PACKAGE = "aiohttp"
>   inherit setuptools3 pypi
>
> 
>

--------------E71298527408980D9947ABE5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026090217.21174-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed a type error caused by the conditional import of Protocol
- Server doesn't send Content-Length for 1xx or 204
- Fix run_app typing
- Always require typing_extensions library
- Fix a variable-shadowing bug causing ThreadedResolver.resolve
  to return the resolved IP as the hostname in each record, which
  prevented validation of HTTPS connections
- Added annotations to all public attributes
- Fix flaky test_when_timeout_smaller_second
- Ensure sending a zero byte file does not throw an exception
- Fix a bug in web.run_app() about Python version checking on
  Windows

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026090217.21174-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiohttp_3.6.3.bb =&gt; python3-aiohttp_3.7.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.3.bb =&gt; python3-aiohttp_3.7.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
index 824bde5e25..8b5b1dd160 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
@@ -2,10 +2,10 @@ SUMMARY = &quot;Async http client/server framework&quot;
 DESCRIPTION = &quot;Asynchronous HTTP client/server framework for asyncio and Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c">&quot;file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca">&quot;file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca&quot;</a>
 
-SRC_URI[md5sum] = &quot;13d02dc8379207dde1f6966d1fc5083d&quot;
-SRC_URI[sha256sum] = &quot;698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645&quot;
+SRC_URI[md5sum] = &quot;ed78633cc420b29d3b61c7d877dc0901&quot;
+SRC_URI[sha256sum] = &quot;04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2&quot;
 
 PYPI_PACKAGE = &quot;aiohttp&quot;
 inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E71298527408980D9947ABE5--
