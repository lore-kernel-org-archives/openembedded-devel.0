Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.48])
 by mx.groups.io with SMTP id smtpd.web12.26095.1600976756775826966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IC4R8xXm;
 spf=pass (domain: windriver.com, ip: 40.107.223.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUDFc6YfMLKjhhOymEnjQqiVxotOsMv+ihGvmSQXhYB92A6NnWAKMtDj7O5Wyr8HkMTTPTGJ0yDqtbj+KtHmN4SBX7s0Ww4ByrTN+WcGG3LsubUOPHCYf1/p/4Phs0lWhY4y7iyJFRn3HXXt3T8a+la8BXS6MUeJXTRC8+6smcc4OLR0BX5XXlQY7pbeZdout1oMEIHVsvonT4xyBE3kmCO9vhQVcjzy8lfM1i0y5Dy6czGrF1gNBCrK/kqI4F8g5vkYC16rCQHueo49EpWjI1ig2yhNRNGnHnkWlpbZQIqvmArQUUaj2RVgel9Y7BlHio9BeAGz4GfNGEr/YV3RoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//+rVLn2UhrNv9vTfa0DOSrbVGZeCZk/UekaSmF/5U0=;
 b=Z6GzIruqgGw8RclJc4tV2nafwDbtYBnxUUL3QzI7WeEo2QUsU7VwpjCaY+C9gCRYbHTxjLGaxuJusMBOU6eHAwCKXKSmJ+0Uay+GfGgW0mF3psPH6ijdHi77ROngLMmaR/kMDEigGAEJc4cI2wmU/g5PGFAu9vl9IGsK61rYze42OfzFJT1GvSOjlCDCcS/54g3XS/eMcwrQCOwEdcJiBbVXyWymwDVd2Hip1OHewMhdluEIhWFGrVtc0MFpzE/GX9tNOKt6g5zgIfSTqKXHq/qWEM84yz0EP+azvCgrkAKdfnh1J5UR8D3UcM51GjPknVJ9dQ4n9PvQzFmFZvPbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//+rVLn2UhrNv9vTfa0DOSrbVGZeCZk/UekaSmF/5U0=;
 b=IC4R8xXmOsowIM3APMstQtYu8K19nWekTuz/YFmb0BJKH9IA55zd79jaFxoeFOnk2GP6A1AJqk6JjGVOL0nmZVGoTcCD1CA0pa2Ov9WIOmMVHQuyzq7Gn2qPX/5jYH/nPWLSpI/2+BSKHhL3y0oPi8AzKN0fL0AXDuR99Ozgj88=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 19:45:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:45:55 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-pint: Upgrade 0.16 -> 0.16.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6803a79e-fa6f-ca9d-4b05-66ace58cbc1e@windriver.com>
Date: Thu, 24 Sep 2020 15:45:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::35)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:45:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ec5197-b62e-44c9-aa85-08d860c273a7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB283900DED3611C0C51EEDF869F390@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eiYAXYta20yf6uwdCKY7pmA2zZ7eLXRkpjgfa2NElJPGXW4EoVQCLWfvRo7BjNvL9RvrEPRjT6zy6AR8S+NW9DulE2AfnuCnugX41pRTz9zLAU23qKEBSyDIPKOtawUP86of9nSCgA8MXQJdPxbcnUf2QcFaCa6B47FWPSvsXa9FJEjMTcUmoDNLZh5VDA8nDlNWjsZvskphLsMuogFMEFaUSqafEUsp1Rx8u9GxKQW5sUw3XUkFYGl4sT+Gi0IlzzJM9shDL8GxM0RRI+ubkuMJ4EvcI+OX+Hdrgw3c/5n7zyxRrMw00N4tWamnp1bSpkoq+HupNC5U8ixFM6OVPIsUzqd2eZ9b2oRIfAshfoBJwgJBHRiXnAS8XDm+uDkmkalmfG6sP6gDIr+6T6ZZmx4HjdBuDiXMAS09jE4iTVJECTIPKNPVvikV1HOocDtxMMeFMasSum/MsBFn2M7dgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(16576012)(83380400001)(2616005)(52116002)(66946007)(478600001)(26005)(53546011)(6486002)(316002)(33964004)(966005)(44832011)(36756003)(16526019)(186003)(8676002)(66476007)(956004)(166002)(66556008)(86362001)(8936002)(31696002)(2906002)(5660300002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MOu9VQlgBT+j8uDf2Yzq6R8FlusPu2e8iYtvBQp4BIv6KWEqILXoUqErFtSfKAqMfNRrd8cwdS0/yRXRP0VA8bDfvvF3bJf/6hJ90sg1KFWZzfgdMLn1hRieWI67OC58+DO4DJlxryqikto3SrbQXHJ40FPdnuTo93/4iWwkrIZRKN8gd9qDo7iJIwkk2PqC9Bs/nHF431XcbyGCyCK9qHW1J0VNYzTmT8fHFPNqKuf8aQDW3Q1W1xfSHZ0gr8JGEwuTd9paNkPceXbZnOdhUEMyi7bXCZNjXaAzuNllofFVfym2huq2/v5d5qqXSPAwpxrdFRNz4p7AxFGzzTBjW64fvDYt43PemOwqp/a0K7BLLmQpIS0EYttLN9YSW25650crH4eJK9SW0XC5BGVMH4Ggs3xhpjEnvspjj6xObgmvYkLSTNe8fw38moGxFN31W/o6PzxqzUBka+iGPvAVAist+piYTXb1EqjNGCKgbDBQ5be9wsFXslsFv+bRlVA9+uaPbSpu+CPs1phUAS3ZqeS5wdxzjRD3JMkgg+P0H/wEwqzCLgccGMiCWxXa1jmn2kcRHsiOaDCd9+eWYRamq8mFyLhTClZKioluE7ezKzMbYrDheDph2lZmBp6AgcDWV2jOjjW9ZlemdZYvut4ALA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ec5197-b62e-44c9-aa85-08d860c273a7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:45:55.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4TQAJGpNsBcv7VdXToHeZomEwmlrCsKAbMsio2TmCyTUIXQF3QW3xocJ/zBWLF59Z8eB1rdSWiVRcWYlJlrW8mm43+gE7I7gTGl+ganrNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: multipart/alternative;
 boundary="------------5B02A8123EB41E757936555B"
Content-Language: en-US

--------------5B02A8123EB41E757936555B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 0.16.1:
>
> - Fix unpickling, now it is using the APP_REGISTRY as expected.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pint_0.16.bb => python3-pint_0.16.1.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.16.bb => python3-pint_0.16.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.16.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pint_0.16.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
> index 7775d733a7..d96659592a 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
> @@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "ec78e4e42512b93f80b9093416ad7417"
> -SRC_URI[sha256sum] = "e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599"
> +SRC_URI[md5sum] = "d4a7bbdf505dee964eb1e5e6e7f80c34"
> +SRC_URI[sha256sum] = "d43a2e9ae003164978b60fdf8cd920d8581e1a5991df8dded29b00f4850ec83a"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 
>

--------------5B02A8123EB41E757936555B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.1:

- Fix unpickling, now it is using the APP_REGISTRY as expected.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pint_0.16.bb =&gt; python3-pint_0.16.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.16.bb =&gt; python3-pint_0.16.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.16.bb b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pint_0.16.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
index 7775d733a7..d96659592a 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.16.1.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;ec78e4e42512b93f80b9093416ad7417&quot;
-SRC_URI[sha256sum] = &quot;e437420e65fa72a2805f4036f986669c48d54944eeb0e47c8ba16f98cbdcd599&quot;
+SRC_URI[md5sum] = &quot;d4a7bbdf505dee964eb1e5e6e7f80c34&quot;
+SRC_URI[sha256sum] = &quot;d43a2e9ae003164978b60fdf8cd920d8581e1a5991df8dded29b00f4850ec83a&quot;
 
 DEPENDS += &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5B02A8123EB41E757936555B--
