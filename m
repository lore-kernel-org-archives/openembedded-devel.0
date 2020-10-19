Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.89])
 by mx.groups.io with SMTP id smtpd.web09.12106.1603110626653591032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mZnPNZhu;
 spf=pass (domain: windriver.com, ip: 40.107.237.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCZEZtmzSnOAtzQ8lPEenpFw8BbYneD25YY4yS9sItmKZoar5UmUWRUdiyXWIT1UYzCG65axBzAJ1o4i0LbW6TCTrQ7RcQWScZO39xI957DYUmAwKCffWxsXViLsht5W6qvFIA+TDOMpEkiTDbk+NIlh2ZTGM61bgQVsH0v2lp9YjZTRsEJ8MLeIlmi+TXMmNP6KB50C9iXrTxGd++j7SvaWMchpyaMR3Ju5IgkFC0de1g6MqldTYtwoi88hJC6CRenDGExBmBq66S/iu5x1ECl2l3LKih029Y42f7Tw1P1r8AnXYIodkEvfZ5eIoWcYAvf9Eo6qnuXD8RAt8RuvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xgBnmFAMve43evdTYpGBkdO3Tg/vaV36qt4WzVxPKo=;
 b=j7FYvzIGydxhkQLmoB3PCvN3sGwYhE/qDr1LrGpFW8QMQCu0qnI9vBza2FlzICU9h5+e+ToNQpIhBhDrluooe0HdCbzLQgg58zro4KffuDYJzm+KvUYm03JhSTvdVlWyKSQ2w8mG0up1/ZmJ1rTJwovHC0o4joArWEt9J9g9Px3HX6TQsDBs1plzK/Udo1fzMzZSOoEuGDeYQqtAgHQEGupAj8fFXZMKcTR0weXpgg3EwKriVxldpaiHy9TOFlb+WunYUQZjHPupSm2m0mlC8ymkrgQ94kVEmOZqRgmch2SCe09MTNCOPm0HKlEWsGVa+iMRJtEXW6vyQ9c+21r4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xgBnmFAMve43evdTYpGBkdO3Tg/vaV36qt4WzVxPKo=;
 b=mZnPNZhuJISucxlYTm6Ue9qWOebiASg332Jfv3/xCGyy332S/F1d7hY11znS/jrdbX2PkNd9aJjcyq77md0xjUSYkJD+1WWfzQFEjaNto9rIa2WEbZWD2CTFxfLl30Nsg713IlzzicWhcJ8vW3tLjw3qN+avjkwkqIYyzfLQdYU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:30:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:30:25 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-xlsxwriter: Upgrade 1.3.6 -> 1.3.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
 <20201014073256.9605-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <96e85c03-692c-ff22-842e-3efacd950e13@windriver.com>
Date: Mon, 19 Oct 2020 08:30:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014073256.9605-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:a03:100::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0030.namprd08.prod.outlook.com (2603:10b6:a03:100::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Mon, 19 Oct 2020 12:30:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db37e9f8-dfc2-440e-a7f6-08d8742ac0ed
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4323B3B6535DC37B7FBFBBC19F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2BcP1kzWYw/axTW+imvTKyYMsM+JNrAV0x+wasTfnmltABki7b9pkTRzR9nozGGfyP7tARtUNlGIRf8kVHAYDv6WD2sEUiYcyDq9R3vfLN1wAzM9yg8wrKlwaN1ECAJ5D+jclrqTmrIkhx2vHGgEKsHmeWkK4uRGlrdFgxzGpjP4OvNtRppqEBzxzhIrMFXEwPZVxNdrEF+b5yK1PrsHLPOu2UOVM6sx81mkUcTRgqtzNUj5jRvwfAqX7d3Pg1XX4Grcks7d0Q0t1hRTRxK4GawmxrCOtTzTq5hudWPHBhjRjAYmtyLL7g9+8KGiAavaHCos+7ux449UpkyKSQRhcqenwTAfjRTsVUYe1wyrVquku1GPlSE+ltoxTBaG9ocWQCabNY0tZqixbj1WaqmnWhQm1wQzrzyI0eCOHrjCmDXouaTuKEy/KFe+TAV8WjAsBPqmGCMvdduYLsPqEVFE/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gLwHYQWv6gipUQ5dTELdJ61UL+5PYv9bjn2puvc6MAbxvHQ7XCaFQISQLdCuL3igJ2CDHVCzpith0EJr4N5VzQ7nE4FgdcGgPIhiA4C654NDi1r2b8Vk9BaEV3Yp4Jm3HC0H/EuiQb/LEmAFoZCL0W9/OUBu/GCpo9P9o8pEoQr9SNkaFF+0DG0k98Y90N9hgNAh9P+jbLAT60O1oFxlBMj6TZIO9VwwYsafxTMSJjOBKpF4i6ZTf4SRDfKCLN/vyaD5iefVJo6Hk/KT5ZniLsULkDPQ4KAk4MSmPi2GrBeYhx2nSTqR20YZMzV4xvulzBIGF2cwELpsue957usVYhaXezMZd8TMC1M3XWSTDMTR+FRcLIXRBbRyMvqAMWm3g+y8umche+ci5FvuLwHXDuqT/iyXyJSLwp5yUs44SW/YwEgXVncZIhsWSG7p2UV093o9mgPHq2V8etRcQ+m7SPkyQt0vpqOz1XB80aIYhDYVjwKrHGKsn6lEVM37ckAs+pKu5GJ/9/n+WIRcvVKK35tMuDTsU3AY4ly/7fJh8cUlcvFonL3Rf6z8h1lLy+OKQ26I5sVsfH0hIGR8MeE9R+OxBaCMqkDxeR/XZN+bOuRc03cspef+A+xg1YhvMLGgaAaFvLoKcUHZUezm9Vfglg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db37e9f8-dfc2-440e-a7f6-08d8742ac0ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:30:24.9103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOHZFouS0DzOvcpCPa6Z2yfpgEhIGpXRJ15AFX0G4v0QVF7aIbW0FpXBnmcZjKMBQKVluC6TJTHvuyghgBHK/dYLzhDOq9TauRjZAiu3a6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------305213E5807AE387B91BD336"
Content-Language: en-US

--------------305213E5807AE387B91BD336
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/20 3:32 AM, Leon Anavi wrote:
> - Fixed issue where custom chart data labels didn't inherit the
>    position of the data labels in the series.
> - Added text alignment for textboxes. The existing options allowed
>    the text area to be aligned but didn't offer control over the
>    text within that area.
> - Added Python 3.9 to the test matrix.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.6.bb => python3-xlsxwriter_1.3.7.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.6.bb => python3-xlsxwriter_1.3.7.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
> index f3314037f2..a8f013c580 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "378642a3754fb233e418e3869cf051bb"
> -SRC_URI[sha256sum] = "b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313"
> +SRC_URI[md5sum] = "8c0595292fae76297eac03ae76507b7b"
> +SRC_URI[sha256sum] = "9b1ade2d1ba5d9b40a6d1de1d55ded4394ab8002718092ae80a08532c2add2e6"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------305213E5807AE387B91BD336
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 3:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014073256.9605-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed issue where custom chart data labels didn't inherit the
  position of the data labels in the series.
- Added text alignment for textboxes. The existing options allowed
  the text area to be aligned but didn't offer control over the
  text within that area.
- Added Python 3.9 to the test matrix.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201014073256.9605-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.6.bb =&gt; python3-xlsxwriter_1.3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.6.bb =&gt; python3-xlsxwriter_1.3.7.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
index f3314037f2..a8f013c580 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;378642a3754fb233e418e3869cf051bb&quot;
-SRC_URI[sha256sum] = &quot;b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313&quot;
+SRC_URI[md5sum] = &quot;8c0595292fae76297eac03ae76507b7b&quot;
+SRC_URI[sha256sum] = &quot;9b1ade2d1ba5d9b40a6d1de1d55ded4394ab8002718092ae80a08532c2add2e6&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------305213E5807AE387B91BD336--
