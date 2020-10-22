Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.47])
 by mx.groups.io with SMTP id smtpd.web08.1264.1603410206338298688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NkvQnXSM;
 spf=pass (domain: windriver.com, ip: 40.107.77.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD0/O1MmwuzsT7+xvxehrvbiOYZMPgNB5BeiqdsuURXN3/8xKdLqfQqOZfEPmUticpSimI1OqZWqfJ8prPxvGZZAwpmLAyd/0/3/m5+YH77HRydF9KUuO5vBTjWKrTGA1VA8IdG2J6yozNsadgu2pprDtEhERAwjPkvb/fzFEEHOWxpxVsC+FhWmVkyRpgCPsLCZNTBJwTG4qjMuD22Fprhfa5nSF13PyMmjjoA+hJZIfoQuhAZYATkOTNyDfgJ0bAbVeZjXuMholIwm+YQFfIrspDyAjFa4whMUr7AFH0Vc1cO06PmwdJF8nDLVRIgp52wLRfkh4O0kwRfla3IIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6xMFF7zOlfoipZfgEd7u2nm7L4nU5KNxHpXe0Wj6SE=;
 b=Dla76V5E2w/JCMvKnrfUROUdw1FL+Bz8N59yq6jNL6TamgKwC2uIG21HDmZXi9u1IzRruyeINrxJkL6krnmLBPfGRw8yUJLuZD30poDLh8IOko7GWTRduA6RyzJrOCJ3Jd3HtSv3xtWJxetChkYfiIIeLfqBFCo6HVa3zKXdWeYdyR78ldOTYo5FMqrVclsAbOTutgVmw3CORlTeWM4gZqn1HeitB5YOwJq6eHQRioZtqrozt3o1Kh6NBZ/Kn8MNpw7MZZbg21jqJSFt8wqu9HZqnYzv6Rw59YVxVlkd7KKfuxUv1kRPt/l+Xuek8blgffy1HsOiK1q5wYnrKmt9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6xMFF7zOlfoipZfgEd7u2nm7L4nU5KNxHpXe0Wj6SE=;
 b=NkvQnXSMF9JQLqS7qY4gyWSo+XkDgS9RL37FHoyWS9J/6rAJ0xf6dbpPgfSJWZmof+jb7DFsZH6MsWqrqFGX9oDccnHT8V6ZaaiIBmHuFN7TFVmja5DrqlTQwLX63aZkd1Oi/3i/7Q6iXphdcBtNI4NjPOA4uyk5VV21J+vHXB8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:43:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:43:25 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-zipp: Upgrade 3.3.0 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201020152601.26261-1-leon.anavi@konsulko.com>
 <20201020152601.26261-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <808d3e9f-6a5b-182f-8310-61987ee846e0@windriver.com>
Date: Thu, 22 Oct 2020 19:43:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201020152601.26261-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:43:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b38081-2093-4aa9-46a4-08d876e444b5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48969D04017BD44CABBF696D9F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	02qwGSxzR95gLUWyPIjMkv1S39umqzlpcYkTQDwAF9xVSYbC8jChvKY++tW3AFvM1NKEUrIDEXnyLTevYVIZCO+cy30ecEj8nEScFyX2yyjy/mel56lG7ZRBQnMmB93lCWd3IrJthCRmX5lXw6RbpCdClKWCzzJ2+0EfCKZqSKZfAMTIJmIktARG3UuUpDsURSoXj2O/0S/YPimF/Uhg3fNrzOxYSJxJ9x9xONhzn2n6t6QvWTLXfDhP7xp2XFqoM+7AzwcjJrdatTRn3jj5OvcMi9rPUumEg8Y65KGBlmxwGSRqvRiGtyIr/CTlPXMu9qisK5V+bTjSBEbphTiQ0C48ZwR/sKFFvcWnYs4rSljrrHIf9hUyc4MU3/WX5UJ4ZnzzLXtPYwBIX4lE1tFMNJaWDzvkim6aROSXODPsTES21sHERdTjrvmUgG9ZxTOV6lgr3Kw6xdS6V2ga3RDpmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	THVq8R88twfu9M1JoKbIm00V05XwMi+ok4qUsuA7AgQz9Ky0AfPvAfyj0ALea1F0+xwnonc+wPEGiCL8ivlDaL9HVSx/FuPGax196kiCnziVH11iUj0TD3riez6FN1rg+vSCb4n+At8m2lscUC6L8BgaF9HyAYTnSRuk9n8gNqfCV0UPK2JiDQcKHRxA58FlSgKR0s4yqrBkE6SoPN139qVwGMID0+AdDPOwjf4XDAHnKPm7ZeJgI7zxQ8NlUTCNnP5glSUNpYCvGwPblEvIpGMGZKyHHDgbGllgV3ShBQgVhS/HJN2zD63SWD/e/wqkxHtMIMflZyESZ4DpkCuob2QxZ9Z7L4ZZU+haYPkCvKjas1ZTDbAIfrgYwFVFlUDAHVB1D7i5frjezYU5KW4VQdElPxykU1IyKX4jQxNFEDXPptBFxbHIO01+j0Yt5bxkdHyxIWTli27T71i3yDd07z7PVy84PFDFPiRkoMFBzbPp/wz4WzUO5FO2RP1C6PUda1mLc8aJ1ssL9qHsLVizO6veTBQRD2jl3w6vBT1+jFs4FgVW2Z8x/W2vYsSdnhVO+51jGUf8io0UO+9Z/XNnCq6UZ8HIcM05TT4PDGGFc933my30KAI4K0hDvpNQiMNqOHKhP0/5j3yWzyyv+uCgog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b38081-2093-4aa9-46a4-08d876e444b5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:43:25.2025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWJ+c3pp0Ay79gTLIXNmmXsDDf0/pQDkT3SNSKJvbNUNpUdckWtR82fn1UERLF0KSW4gPEjxub5ajHzVuX9xVFec3OXvTckqj0Udw2upX2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------E0A3B95046BE2202C2FF3C17"
Content-Language: en-US

--------------E0A3B95046BE2202C2FF3C17
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/20 11:26 AM, Leon Anavi wrote:
> - bpo-42043: Add tests capturing subclassing requirements.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-zipp_3.3.0.bb => python3-zipp_3.3.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-zipp_3.3.0.bb => python3-zipp_3.3.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
> index 746f9cea52..1cb4c2aa88 100644
> --- a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>   
> -SRC_URI[md5sum] = "87a53f0bf48671f6bf6d3e9938218509"
> -SRC_URI[sha256sum] = "64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b"
> +SRC_URI[md5sum] = "8bc697a6f65b8e2f75bcadfb90e98e58"
> +SRC_URI[sha256sum] = "c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
>
> 
>

--------------E0A3B95046BE2202C2FF3C17
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/20/20 11:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201020152601.26261-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- bpo-42043: Add tests capturing subclassing requirements.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201020152601.26261-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-zipp_3.3.0.bb =&gt; python3-zipp_3.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.3.0.bb =&gt; python3-zipp_3.3.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
index 746f9cea52..1cb4c2aa88 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jaraco/zipp">&quot;https://github.com/jaraco/zipp&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>
 
-SRC_URI[md5sum] = &quot;87a53f0bf48671f6bf6d3e9938218509&quot;
-SRC_URI[sha256sum] = &quot;64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b&quot;
+SRC_URI[md5sum] = &quot;8bc697a6f65b8e2f75bcadfb90e98e58&quot;
+SRC_URI[sha256sum] = &quot;c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E0A3B95046BE2202C2FF3C17--
