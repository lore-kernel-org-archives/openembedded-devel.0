Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.40])
 by mx.groups.io with SMTP id smtpd.web11.10031.1593184953960733876
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TuHsyJnu;
 spf=pass (domain: windriver.com, ip: 40.107.237.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8VSFqxZtNN8p9t2neb1a7t62jo2DxfWvi+nawDp5JWJmUrjyAYKOuMF1K7qmfHp5vMsBXtN5B0vPmH2ty3ZHbrUFhXAm8nsrpBW29vuCKxQeB503PrFR//UxNLcGuzEmJRbPaNqReAwAQ8CxwMErcIo7ZHwuTvoKQOVEkq+oU/3d8a3nzovrMIvifOT6AgRtcc7VfwBnIXpQxpOCUE6MEPhpg41GFjg9unawAY1dbhpQib50zTUsCzXhQIOc7FitnwJwEZqY+k0xOSYl+RRHoHWYbkBmUXSc0UgBQoUlwevWeD8o3QSA2mygE+Zb91WY65erwfwyAmEQioL6SKmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEZ2H1AqFnCvyoDVwaDC6PWqLJWkH1lyj/Bg8atHRyY=;
 b=Gwj0NrOckJ34nUlQYHJhBAjCmOQdz+kTOK0/O6VuU2WAArRrSOOmGqTlTRScBDUWP0f5aaR6+U1bi7/oEP7k5KgeB1VmC7lg0SmRtyBTBXAJOH/vKU9jqWsWGp3AYUVchJRLyKdwYOqqyLn6N6eBpvdZpoOtB7gDuCe8bP5XII2X3dDWZH2P6Z2kLBXUN7Pbu26JAF5k4xbfn1uZTqGLMHYL5kwh1UCHE/fltrDf8j0+gyVoNs5HijISIp1F7FU79xQ7FcLnF/XWKmdMctkwzULjRcKKhT744tR3bEGqeOjLbMuBUtSvHPp7Z2y9TWVXbu7nu3wd2RDZU6rmGP2Gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEZ2H1AqFnCvyoDVwaDC6PWqLJWkH1lyj/Bg8atHRyY=;
 b=TuHsyJnuS8jaw4gLBkg8YZyeEkotUDo1N43Ob3nn9SKe3xUq3s+u9oyoj3qIB4Sx4lr/P453eSr8WDhq1FvuvuNv+9GPPCHc0ygS/Wh41uv+hIVa3Y139DlNH00X4vG0I1DY7713fqUcTyNd/y1MNfNNRnINQq7xHGUXivkurec=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Fri, 26 Jun
 2020 15:22:32 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:22:32 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-croniter: Upgrade 0.3.33 -> 0.3.34
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cd1632ed-d2ee-903a-27f6-917206be356c@windriver.com>
Date: Fri, 26 Jun 2020 11:22:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:22:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c06a8cae-302d-45e4-fc3e-08d819e4bf26
X-MS-TrafficTypeDiagnostic: BN8PR11MB3682:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB368236B3DF295E793D4563679F930@BN8PR11MB3682.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Neh4kMZ2I79WvtZ0hqP0HkHplpmzrJx9yj2n0E6owAVAagcqFlO59TptFm4Hw7TKH8RqMx/dPj9+j6/zApRNQ5ljhaEq2Gm2vQ+1AEDZREm11fexdYCuINFZJdv9uK7dGVUkzOViY6kxqWsJnLrHLzAJbM/cILJNOY5+/9cUxEyMIAszoy52mmCaDNmlFeeYG2fvsneYC4p6s8MY0sSTmceRpMMHBmE7Y+FBTpCqyyJq3cjyQtapLAQgwKh2SLFTtHCfNyf8czGHv1HyM/AIjum3gT3QbpNhjxamKNtM1kZXC3HM3xnayphQ+ejRjRRRQBWSMmPF4Nk1ZbJABMRpSvovQ4A10JrzY6bXEMMTkXbOMP4hh+2h49QYxlpoTmFQYBdZJqXRzWCYR+GgwvHo780WLB+LJuGqqaZa/dimSGB/XploFDifCA9UKu3JFRKleNQHehDDsV5Wd/YLwXz18Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(956004)(16576012)(2616005)(166002)(316002)(36756003)(31686004)(86362001)(5660300002)(66946007)(966005)(8676002)(66476007)(66556008)(44832011)(31696002)(53546011)(33964004)(2906002)(478600001)(16526019)(186003)(6486002)(52116002)(26005)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	inuXMQYorhyQNqIR6EAHxxEWBDdO+JhqtypU2KtU2Ta/1qAF2t6yWeOZZff3fCIYEr6aEdoGQjpGIr99g31fnsbMTGu9ZAJ6VtTH/8Q3c6R7a6aGGHGJu2wflzK2xofzW8VkFwKNuQqAcym4oD8D+6cisQw8Iurwav2rk5rSxGgcyp6g2oPDMuWANvkNlzFawh86L+MK8Db+7TM244j29NrhLKESj0QfTaN95rioBJLqbPgyhElgjA6O+hhwFw0Gs3LyceJlpoqHjZFyIeVe32Z75WahtRhMXWQlwRNxZEa2TYboxEe/hS3ogLg+D5vC2BrzC4vCgm2YkN9PmRf58UFQEjyuANQDpMw1J9WOpZ+Hhf9Xt00wnJdJnyNQ/KC6dop0BMigy5KpuyGXDUixCQw9yrZGqwZob8UCAsU5f0XmuANmch95QAounCnxAyPv+jWp5JmpsdjahLWdbI0LRQx8ihYW2TaOfpSIthQqGKoRvy5I0VBbO/+c3jsXMIBL
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a8cae-302d-45e4-fc3e-08d819e4bf26
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:22:32.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgONPhSPRQ7Fp9Ydnh0dYHhSnz9O2acDJhd1k2uFvEMebvt2CcFQPzQnQuE5db67yEEt0QTOliZzFz3gbUad2wXdtXpieDf4ORLlR8oN1q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
Content-Type: multipart/alternative;
 boundary="------------D75187C73111F6203414277D"
Content-Language: en-US

--------------D75187C73111F6203414277D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 0.3.34:
>
> - Add croniter_range(start,end,cron_expr) function
> - croniter_range: Allow different ret_type/input types
> - croniter_range: Tweak internals
> - Simplify datetime type check
> - Remove croniter_range() timezone safety check
> - Add cron expression optimizations
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-croniter_0.3.33.bb => python3-croniter_0.3.34.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-croniter_0.3.33.bb => python3-croniter_0.3.34.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
> rename to meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> index 4dd53a67b..0c28948f6 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> @@ -4,7 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
>   
>   PYPI_PACKAGE = "croniter"
> -SRC_URI[sha256sum] = "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee"
> +SRC_URI[md5sum] = "adfeeb0032ab7aeccba908fa2eb09c33"
> +SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------D75187C73111F6203414277D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.34:

- Add croniter_range(start,end,cron_expr) function
- croniter_range: Allow different ret_type/input types
- croniter_range: Tweak internals
- Simplify datetime type check
- Remove croniter_range() timezone safety check
- Add cron expression optimizations

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-croniter_0.3.33.bb =&gt; python3-croniter_0.3.34.bb} | 3 &#43;&#43;-
 1 file changed, 2 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.33.bb =&gt; python3-croniter_0.3.34.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
index 4dd53a67b..0c28948f6 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
@@ -4,7 &#43;4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2">&quot;file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2&quot;</a>
 
 PYPI_PACKAGE = &quot;croniter&quot;
-SRC_URI[sha256sum] = &quot;03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee&quot;
&#43;SRC_URI[md5sum] = &quot;adfeeb0032ab7aeccba908fa2eb09c33&quot;
&#43;SRC_URI[sha256sum] = &quot;7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D75187C73111F6203414277D--
