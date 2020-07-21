Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.69])
 by mx.groups.io with SMTP id smtpd.web12.22833.1595348378412137291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 09:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S7WshsaP;
 spf=pass (domain: windriver.com, ip: 40.107.244.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW075PxNakz1R843V8ASRM+M71E83FesuhDcl14zu97vL+ktNflqjXx2Xf+W2nnBiJJtoGW2eWZVkRrjz8oeiYZwioieSSh0ZThibBTSpAAEdpO8AceJq82byiuZI7t5sBUNIgJh79Ncr7CxbRXot8B5nVQaPG09ZVVbmYkWbIBFsTQ4vLCdLc7eL4G6OCUuqY5VyS5TEVyHWFTwJhRYBP1uZCklEsnOTo32B9Xu79mof2vbyVxIlSAMmz8lblhkiEG7JETji5MgZyV4fInUiuzR6oWYg4AcEG5DZ6SOLrjBY7oxd8nx7FWockmWeuDzkBI1AiAc/PBiYn7T6rykqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHSDVssCS80Kt3GR9X3oygNxQVl3KD/k1AYD42e8zHc=;
 b=FFRIocHjFE4IEDPAsIVGb3wCoSB0a79uJVfA/R/Cjnu/EoWgw6cLjnCXSc9ApgJru3JZO9nlsfMe8oz8ggiopkeGX4CK/APYuKKIrrfS7vVY6LB8bUQsP2ut8ubhDEsBzHB7j9hesmLNibdWIWcYB8+Ie+o5blKEzMAElIZ/MH5L40vczY8oA26bvSF3Y3vdmYls9XkHgayACxDHy4cSB3l121vJvAFIqcKhUlVj6CYRR2QUm3kZprQJ0eo8Z8dDX7NTKwS2M3nTtrLlk8ZcaRF78YLhqEp7jHxnFJZf4MMdKXq51EoOYUoB0ulbvWnR2HxItBov9RzkGAFRM65+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHSDVssCS80Kt3GR9X3oygNxQVl3KD/k1AYD42e8zHc=;
 b=S7WshsaPIHXuSrgC303YHo7zVD6H1ShgFCjCdMlYlSF5VSnky8h5rRPq9Dn1yfj+P6I8rv62RRPEfZfK8/GfUQRoIVRAF0dQwJQBO8NC9myWD6aXuAlTsYmCTcnoSHTT1G+QtXC/SN1kk1TMbR45EtonDX5uarDo1r0H2xKH5yg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1288.namprd11.prod.outlook.com (2603:10b6:903:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 16:19:37 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 16:19:37 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pint: add missing python3-packaging dep
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com, Khem Raj <raj.khem@gmail.com>
References: <20200716231839.48850-1-rrowe@xevo.com>
 <20200716231839.48850-2-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <892fa835-302c-8367-ad12-a5d534c8dfd4@windriver.com>
Date: Tue, 21 Jul 2020 12:19:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200716231839.48850-2-rrowe@xevo.com>
X-ClientProxiedBy: YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::18) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Tue, 21 Jul 2020 16:19:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be4b17d-4ceb-4cac-8e7d-08d82d91dccd
X-MS-TrafficTypeDiagnostic: CY4PR11MB1288:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB128840FBC9633EF1A3DF26209F780@CY4PR11MB1288.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p8Qx3bYqMG1xrcNJTDgKcXW5TuKjneMLQiOVSY7fUHz0QhY4cG+ybP5qeYXi0RRXtg9G9d7Y4wl5QLSYoWSE1qCwFjHcmW5sJCLm3ViCHfcCpMMKl1xPzYsQ8IoOpPHJYrEJrz85k+CPfHJs2lFMcqbYJ/PHBLX1as06czpchLDUNCqLHKn/EwAtIQ/5RJ/lWc158WxzLopOjTAdXj2xELM/oM6xJdPBqNAlfqymsNKyRdRJStbJONg5x8yA9zugpsNXHYMie6SXKUAK6OrYSl7aiiwpr4VPoDRwEZlwZ8FdxpnBeUb9A6NlX9iF7te4vwqgbw3kK9wcALuGen52tCL74Ssi2th1q9Eh3toaaSMyVPYNK+VHPl768SEuldEInzSCWsha4dYG8iLz9/50kJQjBM9CoAd38joDR1WAidMgOTfFXrZYd2fwm7Tlnw2RKJFHnIBxJ4E9hTEv/Swbjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(366004)(136003)(2906002)(8676002)(86362001)(16576012)(31696002)(66556008)(66476007)(33964004)(66946007)(8936002)(53546011)(52116002)(26005)(6486002)(186003)(4326008)(316002)(5660300002)(166002)(44832011)(2616005)(956004)(966005)(478600001)(36756003)(31686004)(16526019)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	xHcQLsc4U/Hgm4Vwsf+6sAHqMQFvomiWEms2sbz3hBLCi3wEyAQ4iC0ZUGbFV8VPZ+oi+OeDK2x2L/4WiZa3/rcTS9y1O0IiNS34DYs8HQAnWtx7O23wYO7YotA4ZJVzBwDAndxAwmWIHrMLC/Hd8gE03+y9n6FEo7tDt7D4PDJBrnoDdohKXAs0IcVSHW2FJX2JV4PGebxtJpzDcfw7L/+bfWSXp+EGsHBkG4B1nuz2YA3RvALjbsv/KCDAw1krmogtZzPxPeGB0n1E8bBQ/hECElVKdbBMG822++KVYglD0yHgl9TrMWinMELE76v9n47K2YEHZp/6pB5Of8iiaoiMeA+1Ivf8Vh+1AOi1JsigYe+MLaixPESncjtPbrGMGIs+D1z31/YcOFvtnU9joWFQ1GRMYCwF82D4AfBHSD+rodlTd7aBnwKhf3LXoV8sMk52aCuDDqC3oyRefnPmXGn5j284lZQfJyZEqHyt+EY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be4b17d-4ceb-4cac-8e7d-08d82d91dccd
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 16:19:37.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwN8qEXf/Grz5TVZ7d8+FAJuQQJHXcZN6uc+8a6mbaOPn/K6BVmJ9c7rr0foUjUsBcau6z3Hpz+YLoI4jQaHbTnoFjC5A7tVAU09ByJmS+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1288
Content-Type: multipart/alternative;
 boundary="------------4487158DCCEF9EFF44AF9F2B"
Content-Language: en-US

--------------4487158DCCEF9EFF44AF9F2B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/16/20 7:18 PM, Ryan Rowe wrote:
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>

Needs python3-setuptools and python3-packaging in RDEPENDS to import 
cleanly. I'm going to send a follow-up patch for that shortly:

 >>> import pint
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python3.8/site-packages/pint/__init__.py", line 28, in 
<module>
     from .registry import LazyRegistry, UnitRegistry
   File "/usr/lib/python3.8/site-packages/pint/registry.py", line 49, in 
<module>
     import pkg_resources
ModuleNotFoundError: No module named 'pkg_resources'


Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pint_0.14.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> index 8e1630476..ab8b4d74d 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
> @@ -21,6 +21,10 @@ SRC_URI += " \
>   	file://run-ptest \
>   "
>   
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-packaging \
> +"
> +
>   RDEPENDS_${PN}-ptest += " \
>   	${PYTHON_PN}-pytest \
>   "
>
> 

--------------4487158DCCEF9EFF44AF9F2B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/20 7:18 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200716231839.48850-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    <p>Needs python3-setuptools and python3-packaging in RDEPENDS to
      import cleanly. I'm going to send a follow-up patch for that
      shortly:</p>
    <p>&gt;&gt;&gt; import pint<br>
      Traceback (most recent call last):<br>
      &nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/pint/__init__.py&quot;, line
      28, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; from .registry import LazyRegistry, UnitRegistry<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/pint/registry.py&quot;, line
      49, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; import pkg_resources<br>
      ModuleNotFoundError: No module named 'pkg_resources'</p>
    <p><br>
    </p>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200716231839.48850-2-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pint_0.14.bb | 4 &#43;&#43;&#43;&#43;
 1 file changed, 4 insertions(&#43;)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 8e1630476..ab8b4d74d 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -21,6 &#43;21,10 @@ SRC_URI &#43;= &quot; \
 	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-packaging \
&#43;&quot;
&#43;
 RDEPENDS_${PN}-ptest &#43;= &quot; \
 	${PYTHON_PN}-pytest \
 &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4487158DCCEF9EFF44AF9F2B--
