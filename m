Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.55])
 by mx.groups.io with SMTP id smtpd.web12.10975.1593785175218128839
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h+l/Oirs;
 spf=pass (domain: windriver.com, ip: 40.107.68.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqSMM5n4smiD8vZPdZVKOvI8WPrD1B22MlXUF/Q9sj70nDrIOwAz8Uc5ZyhPEyriAP3mg/KUrijL59oCjfoSsJ8iwlaUO7cyL8UKUgYkf6MobORdaYiJMnFO9Siw/0/w+xgQIbDUdA8W+221kgl3LKTsE2FmToaD/3Sfymtr3fczGrfRogahvMMx7RrsanF8/vXLLllZNhePRSK8iXUVwPw+jYvdknen+J1mtbtt3L1cIi/PnMCrwn3LZQJeBbtqkZbDK1mG6uyQhA58sFOxNU4TW7YYoQ8dr9AkOq+DwJMP00h54cIf5XcPSh9UFC885neEd5iFg5HjL96IxgPpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzNLTiW2Nd+m7/AcOvlmGH6pCmk4eTbdLX3bQqMNoGU=;
 b=EZJ7HzsdyMB/Eoe/YSVtMKFE1SQhqZgSDRjI63SlOhmLrFNN3DFP1z2330BE7ysUGe8eAsh9XTMJjJvkEqadAXHMoVWkHt/FMm4XebSlV+BMbMXl5jodMnjhkrQ+VUf+v5jF4P56y2rIPYHoJm4c/07AbtFtcA9IGyHALMj8OUW0JHy3L+ifpE8V8uVGwyI8ctukxENt6DLTAOV10WbWZBc7LGYtRlW6LiH6f7I3O/HQExSIiKfeT2UAL7hHs798T0Jthr2YPmMpjA++l+uDAulkqcC+yW0Sfw4MSGBFACaUSecoPHqyttZ2vbONgOMu/bVrkh93EdSJuYcAZpRuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzNLTiW2Nd+m7/AcOvlmGH6pCmk4eTbdLX3bQqMNoGU=;
 b=h+l/OirsE8OOX1J2Tr25r6ngjWfQFA8FzuOlnbM36Zkvf9CRn/PlaLR2ZBvlFZTDs4s1ktxTuZcI8Ja+e7xvwDJzRk7xnJg+mye4irZeH4aVruQK3UZMUXPygBYMGc6MO/T9xZA85d7j5Yuwd5WVFpZHzg7bnJ7Zd1zhEwfL3ys=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 3 Jul 2020 14:06:14 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:06:14 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-pywbem: Upgrade 0.17.2 -> 0.17.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1b6022ad-45d2-42aa-043f-675927c08fb6@windriver.com>
Date: Fri, 3 Jul 2020 10:06:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:06:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4dd4940-601e-48e5-dd0c-08d81f5a3ef5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4300:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB430025447DD8DAC7CFDDED4E9F6A0@DM6PR11MB4300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fQ/swC5NxSdtU93Wemb9uuGHJvJvtvpaOywFdnMCjZmmUAAQi+8ZNzHtmlpw+UDi31KvPuvRV8gCgpHYpGtdum1rS7G6gCw32ET+7YjZxFTQWMNEXX55hL5omh9vfEkccd66HmQUbYnur1iVzB2dY0LT0H37NsjvoENUW8E/AJqG0gCsafyRnTJrWM07rAi/lK+TPx+/1L5l/ZLNlZd2Jw0Nq+5Z7kE5eIH4z69IaZjrUvtaUTANdcDEt9eIh3M20unQI4m4Q3nnbUtotpqA+Fg/Cw6YCujPEHVyJYY2QPsY3l5zdkLO78vxgG12Dj/8X1RiPDq0u5gq9GGuH2jGhyFXFThklIxwebxbsZG9ahHST+3heWrlA3R7/fIcQmk6yVX0SEJI0T6TqQTWj5QCZb7c0+akSOiH/5QUpvHAYe66SPURq/w4z9xzPEeDpakYbPS1O7VJ69Fr4KqDhZXsSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(83080400001)(31696002)(66476007)(66556008)(66946007)(16576012)(6486002)(2616005)(478600001)(166002)(86362001)(966005)(16526019)(956004)(5660300002)(44832011)(8676002)(2906002)(186003)(26005)(31686004)(316002)(8936002)(53546011)(52116002)(36756003)(33964004)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r1+6HwtnOc0+8oYlySnig6tuKK0LJlJSS/l8Qt0zW1ZFsDaJ7u65v0YH9wwLvTX7+J+QNAiH4OPSq277D7loHY4hb93f/7fAdrLpxtA94zPihhxwP0ynMele75qMLjkHAqVqeBARpQ9IeyQslJ/J17/LeWnCG5EQs5xVMTtHxpAHeiWsfGACvqY5CcnsCZU4HCG3K7siwXKWrP35J6HpmXYe/uGzd+YzZX1i23AnXoZX0aU8uaVQOAK9TwNqLfwVzHyv87J+Pj6FZX8wGCz6awYNCIrSt+RFRUEogZBUwj5kYH4IMaXz44OvzJbbzAh9Qnj+FeBDpCGVNqDJKv4E1SJYnZoGrVZRwOeNjKE6IoF0c61kYszR7V6U9mtK99VdoKcSk53+SVZyJW0P7XcZRBbs2zJ/+hcecJblJtAlX23vSSUcNYa041DPotOn7QsrPKA0jLFW9sICAAHqpTDPRm3oNnaVMFvsL5grxycIKc0xStWCWQB08M1b8XIC3/MK
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dd4940-601e-48e5-dd0c-08d81f5a3ef5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:06:13.8821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miczghi4EDvzxwChPsKyl5ZBiAE+UVyAWgmqgsgnUG64BhQXyM8vubtgjVeQbcNjAj/9BR8T+1IXGsBFPiNQ1d05fNUqef5oOX/06Aut1Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
Content-Type: multipart/alternative;
 boundary="------------8CE1C3DF548A52521A41900A"
Content-Language: en-US

--------------8CE1C3DF548A52521A41900A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Upgrade to release 0.17.3:
>
> - Improved support for array-typed elements in ValueMapping
> - Accomodated the newly released flake8 version 3.8.1 by removing
>    the pinning of pyflakes to <2.2.0, and adjusting the source
>    code of pywbem to get around the new flake8 messages E123, E124,
>    E402.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pywbem_0.17.2.bb => python3-pywbem_0.17.3.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.2.bb => python3-pywbem_0.17.3.bb} (92%)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
> similarity index 92%
> rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
> rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
> index ce63822b4..930f04896 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
> @@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
>   
> -SRC_URI[md5sum] = "6100157c720ba272895b3f79a05c8dc3"
> -SRC_URI[sha256sum] = "84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809"
> +SRC_URI[md5sum] = "9fbee6b4327f035eb212017b6cd84309"
> +SRC_URI[sha256sum] = "1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441"
>   
>   inherit pypi setuptools3 update-alternatives
>   
>
> 

--------------8CE1C3DF548A52521A41900A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.3:

- Improved support for array-typed elements in ValueMapping
- Accomodated the newly released flake8 version 3.8.1 by removing
  the pinning of pyflakes to &lt;2.2.0, and adjusting the source
  code of pywbem to get around the new flake8 messages E123, E124,
  E402.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pywbem_0.17.2.bb =&gt; python3-pywbem_0.17.3.bb}    | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.2.bb =&gt; python3-pywbem_0.17.3.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
index ce63822b4..930f04896 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
@@ -16,8 &#43;16,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
 
-SRC_URI[md5sum] = &quot;6100157c720ba272895b3f79a05c8dc3&quot;
-SRC_URI[sha256sum] = &quot;84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809&quot;
&#43;SRC_URI[md5sum] = &quot;9fbee6b4327f035eb212017b6cd84309&quot;
&#43;SRC_URI[sha256sum] = &quot;1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441&quot;
 
 inherit pypi setuptools3 update-alternatives
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8CE1C3DF548A52521A41900A--
