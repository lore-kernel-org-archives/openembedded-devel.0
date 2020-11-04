Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.85])
 by mx.groups.io with SMTP id smtpd.web08.13842.1604501181876385731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KSxrruqH;
 spf=pass (domain: windriver.com, ip: 40.107.243.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+fN/KN3p5JrQgroH+HB4FZ8EPFj4knZ52kZlk1LCM3yLO0K/5xgEfxmwcLOT5uC9ptsiopAecDsOXmQ/bWEJ7SmHVCVbOGctZX2ITqOYzvs3zLQPirMooYM5m+ZLaBmX7YhjKPVctovMLXRk0GuhhYt5A/a2HhM8pd5CNZVgbbnZ7GpFFV+rq9eCYrhnmokVEyDNL8JTxX3n52UCnHPdWlU3eKTKWJBXV9ZNnHzV0lcW4FHPMhRfiPs0CO4HzHSO2RCJymgm7M0eU4iBADzddATxEW9YfUWvY5oBW+IEeDuVkohG515ILH0anrV3dGJa3WNnZYgLLfQ6dO1bE8vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJyWeun/Ndg4/HqI9Y6U3XztMCkifR1tdgYn/DIvTM4=;
 b=Pf+P8pwtkFJXMzICY7xH4ygOz8N47uDHPZyKo60GEfbWesck618e7RJfOmOA1naA35iHFWizFZpeSQjtxrWT1OHO4b0QVUkeZG73GHpn8KYbTVQHvumSa5+9qSfPD2TTFmUhr2xULBrmHYob6DAFS4y7j/oHnZLx73icCtgE3ljMGeXtxoz+ZzqV91gzXb+s+9no5ITqTh1rAiLIdEzsrYRi36DmoFoBEeJ61mGqtkpso69BGSKoq0BLZHuwn1AAE3I7Vtl+Im62TieDNJ65gOZkKU+Nbolswi8uKYyZaJsobJ9SOBcmQzXVqMyv179+W2B1oaVA6KB1VMrLuwW/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJyWeun/Ndg4/HqI9Y6U3XztMCkifR1tdgYn/DIvTM4=;
 b=KSxrruqHqWKU4UZ3abMyf7baFnmrgQ1NboGjYPoTDXCDPFmF0We4FJN4QThAbs3sIPyOmVbMOYLvWlMlK7xn02jqhQVlDjvd+daf4zcRBBjHOXIrZOhQb2xKGCr3V+FOQwvEApKmwSg9csWewKjhH97Ly3cgslbyrEXz2w5Tt3k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:46:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:46:21 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-sh: Upgrade 1.14.0 -> 1.14.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201027104013.11394-1-leon.anavi@konsulko.com>
 <20201027104013.11394-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <38f7b10c-e742-e1bb-9ae4-691e70ffc9ad@windriver.com>
Date: Wed, 4 Nov 2020 09:46:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201027104013.11394-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 475487bb-49c5-4916-91cf-08d880d064f2
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB508500F9B8A1EE0D3BE959279FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aFwoYwiktKVEF+FC7Eo8CgV7Hp5PXZsHw84jIV+wqvkd5UX90locYM5fkX04OiFyUYTRPJCeoGb+DiL4qMN+3foXs3maNzc4XObIsWnYiU8vravizJvtMGMc1XowYJ5zicdxh4EshmChWFf/yHBUPCoffkyJYCAoBUFT0BasLUmU6oEAvAcpJnUb9tpKXjz/OrfESRDFtke1/9IwiTbFxFRR9rQFHY83mpzOVFikoc8Iaz3cp/aMCtsTFbmOIl1gbSa7svOyBpYjpZ9qlvU3Y8XmQeX2RDSm+I9UjBx3yj1TXstKg3ruxQQb2Jy4FbZIdrn7P5thYa4yqadaRIuoWrmVDxY5KY/1CkcNEWIpa5pbi4wnoxk/8ZmUF+R5h6Ut/k/PP0+7dYw4luvVkExRtNCWJcCKfDmixqzJiHWk29Vur2PlbKGc8Eu+CJWhle4SDG/SV0dxHZq8fKammuHhiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	g+vSYmQaVh3LWe+sm4GH9inbfPgH6+ZmStGVpX+tSgBz/BBrZxfavLr8Qd50n6bE5Bt0gQEbuu9E/3z5x/rlT312Nh+PHYfQQOp1xI1EHwgIPV/SdwaZivCqnVwd/N6qoBxk0zZVqhU6Vv4KQHPx5oGhVYqh1KTC0LYk3KtFegcF1BALJEY9pVGP0QGH76dZBIfv4c6RugSWfsdRLC8d+xxdjQz4DyhcsoMV6u+AWv7tZ8eLHup+LKeMKRkmaPv1VnmS8FYh/yYpVl21CWgCKn+jNLjUbRpbzG9XgqhoRN9fkScwIW6JPX8TcKK8gVxzrnYNKGSH4C/W21e47TMz36FNfC0iLW68CUx9FXWhxeTrg7tHLeiFkJEdckLH5a24dFAAquJBXH6hV4xoP7KWHSEE4Ars+H07ZRdiF33cuxdP52zsbGoZN5MZ0lTPjpwvKAtWsgy+v0ppW8Kd57YjZnmymr2Fcs2K8qs8BYaNdSnQ3akTEIwcuhqf2OQnAb8ooEbP7l2TDGQpNhKIhPXKbGoTVeAbovDLlJShnrrDCvpyHMU/Xk4i4pGFtOXUS0E5kkWQ1Xa0AKqp62T7IEH7DaV3G7TzjKP+q0UZkQDPBa33yGZinw/jh3W8ERWzwFbPrbzn3YI/QZsyT0bv5phsUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475487bb-49c5-4916-91cf-08d880d064f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:46:21.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpt1rNUOftdISPwLIetlx5gMbgDwwITbeVDXR/eTgv1fpR7y90qBFF5fashu1SWDYA4CLLxoM50F64Puc/xT8OzISbTqiersGzrQXMaqN34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------9A901CC5133D141351B7D60C"
Content-Language: en-US

--------------9A901CC5133D141351B7D60C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/20 6:40 AM, Leon Anavi wrote:
> - bugfix where setting _ok_code to not include 0, but 0 was the
>    exit code
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-sh_1.14.0.bb => python3-sh_1.14.1.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sh_1.14.0.bb => python3-sh_1.14.1.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> index 7724f4be08..c7b50c21a4 100644
> --- a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/amoffat/sh"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
>   
> -SRC_URI[md5sum] = "4cbbcb85c081d78f4b0f00d634db9bb9"
> -SRC_URI[sha256sum] = "05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59"
> +SRC_URI[md5sum] = "50fc0a2953930ed8d0f6570835e88abf"
> +SRC_URI[sha256sum] = "39aa9af22f6558a0c5d132881cf43e34828ca03e4ae11114852ca6a55c7c1d8e"
>   
>   PYPI_PACKAGE = "sh"
>   
>
> 
>

--------------9A901CC5133D141351B7D60C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/20 6:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201027104013.11394-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- bugfix where setting _ok_code to not include 0, but 0 was the
  exit code

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201027104013.11394-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-sh_1.14.0.bb =&gt; python3-sh_1.14.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.0.bb =&gt; python3-sh_1.14.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
index 7724f4be08..c7b50c21a4 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/amoffat/sh">&quot;https://github.com/amoffat/sh&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6">&quot;file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6&quot;</a>
 
-SRC_URI[md5sum] = &quot;4cbbcb85c081d78f4b0f00d634db9bb9&quot;
-SRC_URI[sha256sum] = &quot;05c7e520cdf70f70a7228a03b589da9f96c6e0d06fc487ab21fc62b26a592e59&quot;
+SRC_URI[md5sum] = &quot;50fc0a2953930ed8d0f6570835e88abf&quot;
+SRC_URI[sha256sum] = &quot;39aa9af22f6558a0c5d132881cf43e34828ca03e4ae11114852ca6a55c7c1d8e&quot;
 
 PYPI_PACKAGE = &quot;sh&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9A901CC5133D141351B7D60C--
