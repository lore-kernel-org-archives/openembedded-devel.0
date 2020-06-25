Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.63])
 by mx.groups.io with SMTP id smtpd.web10.9985.1593090104316443142
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JxgNxBpG;
 spf=pass (domain: windriver.com, ip: 40.107.223.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2Sf8LAyd31s2KB9lGQBLTM6ohE/6Zqwzd/f18B3/4iaeCI57cTOTxOOUuMuhGJ42HHYNQDu9e55mhP4XT6JBr27vG5Jasm5Kgxk+KQjG+dLwzFupEMkky3ljFVmRVyyVfZjGAI3LYEzjrDVA4ZTOLbTpNzYVavpAocvAUWkefRTdqVLAL/OFSQqHj7/MjEd6D456s8ihdGoxgRK7j6BVVlU98NC1A5YrNmyiOL7zai1vEZcjbYr6GI6JJ/afp1dYjFSoccAtqmceEhz+6hzp9Um7LxGAI6EiLh3YPwZggvhtqBGZqVp8hG9XFd4HOap0a4mAACEgvFHdXtVQYPzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXS/TUJUmXobwXXbJQ22I4Wb6A4L/5/5mqJjPHisqWc=;
 b=jZVZ/ukMfxmHlwuZEX/ueGeQ1WrLZFde2TCrNz7/uoV8/CBxrBHx5esvmb9UJHit/bpnB9Mr/CRQnwaHGjoWd+BKc4i/IXRIEK/eLD2OYlQ3GF0qNFOQV2xqdjq2M8xtre/ddd08oSEzwfuw5FjgdXLIOh2kev82GJKgq4UmbqgMPCXaPwJUzyJAx9MB4Jk8KgjSFDE+nppDWpiLrVetgnPYk6NTNxQXDaOQZNFOsE948nJRdXvYkzhtWP4dgrwyFXZAq99iTC/P1nlr7gjCVfpRhzIBYsuKQuyBs30GMC1tYQWRLzMKRnV0CZWPwTohRC7VgI1Gm6stz4ij+NNFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXS/TUJUmXobwXXbJQ22I4Wb6A4L/5/5mqJjPHisqWc=;
 b=JxgNxBpGsDrI0P5jYzKiVOnI5057uOYqd3hGCjvO948eIGvi+ZgZNF26A/hYWKyEMgYoU6mZEq5+VwvFarDPrIXsfY6v94HpZRqX+6nS43+8QSkBoHXx3Fn8zriRxkW5RZmz+iL4h6QsvgdVpnhbVzCsh6zZq+DgMIRoSdJwIQY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:01:43 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:01:43 +0000
Subject: Re: [oe] [meta-python][PATCH 07/11] python3-pytest-timeout: Upgrade 1.3.4 -> 1.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <865d93c7-5d81-f9a4-2666-92cd82475d33@windriver.com>
Date: Thu, 25 Jun 2020 09:01:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:01:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29cc7998-e647-4295-6261-08d81907e874
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954D1385DCFC567633F4EF49F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0r1X059S4nAKM24ZY+sy0mVdzaQZiXjDRC48OzWFfG/prB/8nXvVcxbQQHdg1MuP6mJla24pgFcuJzB1GuZH1o5Yh1mfq7v/+vh0uNI6PioVLt8kS5+FdIPYe8GQfesLpVG1d1MmTmXu/LSZUrhyMHnEssicaKQaaR5KCEKl+KPn0tlYeAuspcFpjga54EMyxpC6idWvQeeJeFNyH34O479AT4gCqyJiswtc9rmCImrjblZz1jczlYEYxx2Zlibw6aaF/7rpxNjjbQzDdZ0qVI8zsOcSSvNabDyaOxtrVOOrg8vkNvW5uVT43f4I6LvdkChkvTUqzWbe68UmaQuq2Qjc+kT13D4MD17qLSNHFUnH96OhukvjFTdOHU74V/vf+GMDta6gf6PsGy9WYru3esly8eVIuGf61RLmur9LUtOAtFlFSbQYFTjONf/9xqFTWBJ2W6oEnYOq/VU/8ur8sg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5LoUxAZeTgD/5n0Nq2+jhmUBqASc+E3JY5dPU4N75b/FP1WgewQR7wHzuDjMTLMokB25Bgym3f2jkDJ2vzSg3jIZ8//DY2Bgsv1S73JYf4LgmuTu8MAV86YYzs/vMj2rlakCRvgBAuz3OOL15Q8ttONyJ4TPRKjH4NErNGpgX2AD0aB5Qqi3RiCKNCjli8764jOmc3RUJ6PS1NeqeKkdgN5QCNyeovnDG+mEs0tQwjhYDyfqor3PNpLI60TjuzhekDRiXrCDINCWcE2e2dL2kc7jjLDFLJeIan143hiYZzREbsV2/TRZBNTzJjbAfpjnuRCffbcviuFdhVGo/P0IBxtS0QhmkFYPlEsBgKY2U7Q4wwnmXoPYT5QnxPMWp404pgZf9saLpv7NzIwsTkhx9cibFB5jaQBzR96A8QFSqtmLPyzKDylYPl9XqxjTUJ/0y9BRsuYSSzLJnop1dkW7aBaK1QmFHZx00sU3Ov87UnqxaB1B2J1uIxlTojeg5XGh
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cc7998-e647-4295-6261-08d81907e874
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:01:43.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DiF6Af0TRoR86cdpxzQW9YaNadEOBPjgMcN6DZMEdcTpyxOJnEPxL4XItz2N0yZa5vVQJ6beHe8wms8DNllK0/kEOLLvdQCyHKBlGwwfPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------E0BDC49417339AC5EA81DB97"
Content-Language: en-US

--------------E0BDC49417339AC5EA81DB97
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 1.4.1:
>
> - Fix coverage compatibility which was broken by 1.4.0.
> - Better detection of when we are debugging.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ytest-timeout_1.3.4.bb => python3-pytest-timeout_1.4.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.3.4.bb => python3-pytest-timeout_1.4.1.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
> index a359969ed..506f4c065 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
>   
>   PYPI_PACKAGE = "pytest-timeout"
>   
> -SRC_URI[md5sum] = "1594762ae77ed7c6c2727aa8b4aa8bfb"
> -SRC_URI[sha256sum] = "80faa19cd245a42b87a51699d640c00d937c02b749052bfca6bae8bdbe12c48e"
> +SRC_URI[md5sum] = "c458dd7d417a5f2dbae0f1f6073845f7"
> +SRC_URI[sha256sum] = "6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------E0BDC49417339AC5EA81DB97
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.1:

- Fix coverage compatibility which was broken by 1.4.0.
- Better detection of when we are debugging.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ytest-timeout_1.3.4.bb =&gt; python3-pytest-timeout_1.4.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.3.4.bb =&gt; python3-pytest-timeout_1.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
index a359969ed..506f4c065 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
@@ -5,8 &#43;5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff">&quot;file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff&quot;</a>
 
 PYPI_PACKAGE = &quot;pytest-timeout&quot;
 
-SRC_URI[md5sum] = &quot;1594762ae77ed7c6c2727aa8b4aa8bfb&quot;
-SRC_URI[sha256sum] = &quot;80faa19cd245a42b87a51699d640c00d937c02b749052bfca6bae8bdbe12c48e&quot;
&#43;SRC_URI[md5sum] = &quot;c458dd7d417a5f2dbae0f1f6073845f7&quot;
&#43;SRC_URI[sha256sum] = &quot;6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E0BDC49417339AC5EA81DB97--
