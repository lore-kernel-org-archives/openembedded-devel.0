Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.50])
 by mx.groups.io with SMTP id smtpd.web11.21769.1591972796652715038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PGZeusFI;
 spf=pass (domain: windriver.com, ip: 40.107.69.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRQcfqjy9JnZ78/vpXZchxPYbRRwOd3JE2auNbrStZHVvsp4GrC+1jXkUY25CPdTaVt0Cjsp6Y2za+Y1HjalQn4aQOcQdj0yL1uDv/+d0g0hElRJrDxE8ucChWGIgqpbtbtfMrO64p02ye37fgeM60AWJhpPWV5Wdp3xytoqX8M26gnuD3WQ0kyqaRNl2Dmxdp1x5dHRq7dO1f4nTPs7oRhPI3bA4h+0EQxANZTPXdAS7Lt5jPrrycKxM66YH6obIOboQSgT7lDmJWiNScybkFgw3kgUvobX32/NJ7stsshDYIJ9a4BE6mcZyjN1W2vRd487s2iDG8jWXib67CyFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqycduEn0vKFTUEFcxRvYPK0iIRkC7vHP60BP9WjM9E=;
 b=T79dV2Tg0bSKTgxGNeOb0CxNV/HtpN5EywGq+4VWerWBDFjr44xXxZtEpu2zpyvmXQxCM6xGbVpTbCoXX/kO15zka2WSovPOTY6p+4DS/sR0AA/vJxbGQ7vFz+sAvBo+eg6sJ9CVf2M/XBqyK1C3AswuyysfY3OsMJsdUyGA2FmsI8KGegCe5hhw9yyR2YXt8N9VAVl8kSs39E3TM3jpoFkMTu+20n0GaT10/8trR4s3qhPL4OmrSMFljd/ntUcac4pvumbFh1UMgQFZR0++/V1BRGYuNXZ8+7KlcdA+N37ATWsOApAyS8TIlAWebkn28AohTl0ETPDXsCsAp0dE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqycduEn0vKFTUEFcxRvYPK0iIRkC7vHP60BP9WjM9E=;
 b=PGZeusFIYhoTsKKDFVbET02JFPXfntaoduhWKDu8SUAd6cYbNipYlJQDeE3wxDR98I9eOBKVUJzWQ9reDsV7iNNRkTJPusZeSnuyE5bwECxyk1ZLVOdZQZKAvZAacSNK9XG3nY9HAYXfKJjauA0z5iAv7DZzZReesK8AjTcYl8I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3956.namprd11.prod.outlook.com (2603:10b6:405:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 14:39:55 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:39:55 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-pint: Upgrade 0.11 -> 0.12
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <355592c3-af2f-f218-c3a4-891ea003a3f3@windriver.com>
Date: Fri, 12 Jun 2020 10:39:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 14:39:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0159a800-e622-42ed-bad8-08d80ede7936
X-MS-TrafficTypeDiagnostic: BN6PR11MB3956:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3956B32DC280B08F72B53CF19F810@BN6PR11MB3956.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lu4BTuljHHC0NGrB/oNE8DFJV2bsr3OJZpkZKnhErKyeRCQG7UMv67anOJAvjGWzgAH8WSheIfaUGfxQCGomYEbVHHTuPAs8ASAy93PPv7pFHxkt2nBb9uz8XcQYgIiKVbiA76hlx5+JNxXkKJ2oiDwIygjIZVnBAwf/kfNySfxzVToCEhtKrR39+awTvZNIghYEhrYEVcPJHRRkro5fjmRPBc6OSKBlRTKfWOYghO24KKSIQDMrkJiJe6p8Z41t1nQiL4URuz8GDv68gZTEXjCf5GedJqLUHOut6SwvNNrM5xXO9t9EEwd4clqSMI1hVpNykCiOREicPGDbV0y7XfoUmyXtcRT6b/fZKMV15Q3yEXx6mhg5/+cCmUx4e+ErXAd9dw8cFgguj8l+V1c0b8uvCK+PUp+q+3DhhcKGhOGFgqryW+xagcww5MYxN2YzbAES6TFsltb7clcirol1Ww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(366004)(136003)(39850400004)(966005)(478600001)(66476007)(36756003)(26005)(66946007)(2616005)(66556008)(31686004)(5660300002)(53546011)(2906002)(8676002)(956004)(186003)(44832011)(86362001)(16576012)(166002)(8936002)(52116002)(6486002)(316002)(16526019)(31696002)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dtG/4TBgOKoQKxbZN48PDzat/p/HkOSqd1+fmPitp3LlP/4A+lO37eM6OGpXfrNwMF7ND2VX6865Af8pIKCNrxHK7gJZaf1xOMaqeWa3+1au1Yr1DiTutQiWiIKilz7hULEkcn4e6gOHvC2C1jp6ZL9/oRn7pPrU6fIGurGfXLDsf4ErmbZ4acrc+1e/oGfa6hbBUq6JQ6h+pJfvRlJK7gmNNHIvaG1enSKCmZRcvnQ79rhT08KIzlfjZfdHl1l9xTBVnvGw25tyoiV41DT6yGw7d9Jq+ZmPOz+ZMaZWwgGI7sMv49vvHnVZLCVFfOiQAJGRix7HPi2irNv9mrF6ksFCegXPnWniTJrkn/tStzjPWcKoBHUNXF4T/wWJVHa6ATU0RujfXzLLuFA45TN+yiQ1PDnp6bh2+ggJtJbKmm/535OorUFnH1xdveze5Vbuy75+PZAn+vdEqcY7KeFfjtLkBJPG3QypfLnrV7fAXK8QXPghjUkTQEyDt8GR+QYr
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0159a800-e622-42ed-bad8-08d80ede7936
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:39:55.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVssQLzwzvXYHHa/aJvRbsru293wTItB2N7s5BbFhT55lHYEuZXswor3WU+C15Z6+cULrobU6V5lk8ru9aGArXcYfUtRWbgmXdy/NF7kHfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3956
Content-Type: multipart/alternative;
 boundary="------------BF13F8C9F33B3E2B9AAF0E18"
Content-Language: en-US

--------------BF13F8C9F33B3E2B9AAF0E18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:09 AM, Leon Anavi wrote:
> Upgrade to release 0.12. Fix link to the homepage, add a summary.
> The new release brings:
>
> - Add full support for Decimal and Fraction at the registry level.
> - NaN is now treated the same as zero in addition, subtraction,
>    equality, and disequality
> - New implementation of 'Lx' String Format Type Option
> - Bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pint_0.11.bb => python3-pint_0.12.bb}       | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.11.bb => python3-pint_0.12.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-pint_0.11.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.12.bb
> index d37da7c6a..626af0554 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
> @@ -1,5 +1,6 @@
> -DESCRIPTION = "Interval arithmetic for Python"
> -HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
> +SUMMARY = "Physical quantities module"
> +DESCRIPTION = "Physical quantities Python module"
> +HOMEPAGE = "https://github.com/hgrecco/pint"
>   SECTION = "devel/python"
>   
>   LICENSE = "BSD-3-Clause"
> @@ -9,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> -SRC_URI[sha256sum] = "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> +SRC_URI[md5sum] = "0af699bc0ccdff56228b4a81216b4f7d"
> +SRC_URI[sha256sum] = "dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 

--------------BF13F8C9F33B3E2B9AAF0E18
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:09 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.12. Fix link to the homepage, add a summary.
The new release brings:

- Add full support for Decimal and Fraction at the registry level.
- NaN is now treated the same as zero in addition, subtraction,
  equality, and disequality
- New implementation of 'Lx' String Format Type Option
- Bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200611090904.29772-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pint_0.11.bb =&gt; python3-pint_0.12.bb}       | 9 &#43;&#43;&#43;&#43;&#43;----
 1 file changed, 5 insertions(&#43;), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.11.bb =&gt; python3-pint_0.12.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.11.bb b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-pint_0.11.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.12.bb
index d37da7c6a..626af0554 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.11.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.12.bb
@@ -1,5 &#43;1,6 @@
-DESCRIPTION = &quot;Interval arithmetic for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/python-intervals">&quot;https://github.com/AlexandreDecan/python-intervals&quot;</a>
&#43;SUMMARY = &quot;Physical quantities module&quot;
&#43;DESCRIPTION = &quot;Physical quantities Python module&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/hgrecco/pint">&quot;https://github.com/hgrecco/pint&quot;</a>
 SECTION = &quot;devel/python&quot;
 
 LICENSE = &quot;BSD-3-Clause&quot;
@@ -9,8 &#43;10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;3a8f29c2a30efd35af4b5c5a224ef965&quot;
-SRC_URI[sha256sum] = &quot;308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d&quot;
&#43;SRC_URI[md5sum] = &quot;0af699bc0ccdff56228b4a81216b4f7d&quot;
&#43;SRC_URI[sha256sum] = &quot;dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793&quot;
 
 DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------BF13F8C9F33B3E2B9AAF0E18--
