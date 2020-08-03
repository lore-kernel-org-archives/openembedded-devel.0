Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.40])
 by mx.groups.io with SMTP id smtpd.web10.6830.1596491698171901980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L0tjoC/M;
 spf=pass (domain: windriver.com, ip: 40.107.76.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sumy3s7khhrGS+gSFoS1GdGSdfheT7XczzGHF4nfzJKXjSPpbyM5KhWExZIrzqZQtRRm8iwKYiK/DsOAs1Ut9E0m3IAe5tl5HaAGuu+XPZ+7vvru+4AoHiDfBC4NCepEWNucbBrzPQOCnh48Hq6GTduEJ/khNy31f4+PqGUPj/H0/sarN21KlOs8A3elNBwag/KkCrT2MotDJHV9tJIyu0WcseoMIUNAbsKaI1NxCYqM+Hz/aUsC3tgp45G6JgJGoaVouCOVumxNLXeOk3aQ4Y6BXe2Zdd24CXOjbqnBixzxMGuzbur5civBGWrDN4g6UY/45g4+IbRtJq4YrSZfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtcCih/TjWx7XCG88m/LNNiC7OBjtFYz0Y5ZOqCqMVg=;
 b=QNHTbJMgyHC0peNnrXvVg0yGSOrXRjt/Gax0wDId2mQye/o5baDddJe4z9K1DT8imNll7wojoOiQwfOssXwCSL+etio1sI4BsjXPWaEY2t3is4XGSiGDdn+gg0ZRX3mqNC9LdNLFOkgrp2hOYJvcZ5dkKuJzx20jmU9ntidcoVOXVXwidT9i4qN1XosP/RNkMWoIA6AJ39WJ8xwRSGa6J531gw1gZeYjSo2Lx7Efq2KJMRPR+kvcJMVj6nrAylHyWoPkHYSqKulWwxZgXwBi3165pcVpDqtjOOoHnLnHwjXCsKP/ljT5TKWHigbjlgeDOl6pQfvIoH/HzPQXLk0eaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtcCih/TjWx7XCG88m/LNNiC7OBjtFYz0Y5ZOqCqMVg=;
 b=L0tjoC/MA5BViPXk67XkanCzUvfnjiltJaA4yUD8AZJOnOlRvRao5xzQvgSpZDf6fLgRp4b+XN2UI7+xKRUBbOe5tRyzEN3NsUMNvL7/vMOMMoh31PMhgQBKcekbZgN0B4WhS01Xt1XNXq1P43THTY3Gu+TzTnxMFZEvYob0sFg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Mon, 3 Aug
 2020 21:54:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:54:55 +0000
Subject: Re: [oe] [meta-python][PATCH 08/15] python3-dynamic-dispatch: Upgrade 1.0.2 -> 1.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aebf4e4c-c154-fbea-efcb-e891afb31209@windriver.com>
Date: Mon, 3 Aug 2020 17:54:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:54:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7962139-d543-47df-56d5-08d837f7db5e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33520FE17651C7017061986A9F4D0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oh49Oqa7daR+VdHTWTNICNb6i1GTmNOL/k0IKfSVue2f3O1prc3bM/ik1oEUGwfzj6G5xUrGBp3GWKotOPIMlP9g8uYZyAM5eDhNypt6hu6cc5nun5deCtPlpxy4Mf68jE7yNhC6z8SZKO3/SnswL3RFiuP+2m5oGBr42OhWkUuf2eAbUsueP/zuCkwRFxPCpGPHi9pesa8bZfJN5JdJKeVYCiGU8nskSwzMhLcwzYCo6NR8WbKW6jU3RXbjkCQJvW5S/x5f7X64TX8Yq9jWCnegvesSES16eeDZidT4K5P1h9cW+KlHtzJXqeEEcUQNhIqg5AQKlFziIo8DEW3jvZIZizKOM3uktqeeCTTSihlXQ5c6E4eRC7/TenpTu8+eXTPohl18HzsSnN9MK75DMXmklr8Agok49TRd7IbINfxIWweJkvqlGwdWkCA4nPFQJo6OfpFzM3XU7GfcKecvtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(346002)(39850400004)(136003)(8676002)(31696002)(2616005)(83380400001)(44832011)(2906002)(53546011)(86362001)(5660300002)(36756003)(8936002)(6486002)(956004)(26005)(16526019)(186003)(66556008)(33964004)(66476007)(478600001)(166002)(16576012)(316002)(966005)(52116002)(31686004)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r3nnVOdsSw6nSDkNEvj9oVfH1zgZD16yjwGXd9LlK8ylKdC9yYBldaRaeebtvLqUPUukKBlQmi68kSlDz8+z4/uSz75NfegAuHHLUlQ6vuOAkAlIYASgDJgzjG86NT75S67BKGZB9FsXEhHvix/ndMbkHwVvwYi4ARFcSGDvPXYnyO47uP2M7oFU2wrfy/i7xwhUm1xYzhbDctcU5OCsMNfmo1plPRogHi2+m7Uh9j+8RAANdhL/V6PwN9fl3j3LNTEtVAD6RFY8p+XogF74Ml0aoFfKK+ubFvcYJ0/Qw38ZnlSnFv4BroB5jkFEp/XolWIJdX7wKqHmamy7y7hrEqGQefVarrFEHeUrrc0MAp34QsxfeTr8Pa4ITJ6iBhpudDUZEqXOw8RVWmUTVnwrz46RGs3Sk6eL9FZXFataU4CBMzKvvtLDX6Tltk/p3i7vZAQyZD7BYxoPgIg/JOusdS8ty0HbPdPlmDD23cZDx2x58URz6Ooftcic0tPbFT7PpdKa96H5x9ytgj6bK4lpMuCelZMbyNlNlqfLQ/nlo/ZqePPbYODE7CpYI8njW/qASgzRAAs23/MAfF8WK6y6+S6cWpcPSHGMkzRQSxzcoLCh0aU3zxSm9Wl18hGawPKE8G6Jr0q+7vdIYE6vTyFDjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7962139-d543-47df-56d5-08d837f7db5e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:54:55.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+vSsimY7RcVBviIrV/BISBktaXmw1a6dueAa3UBz9wqrbLu1ANyR/JIE3ZBUIcQMf6D9JAlAyAJSEHuDbGQMbrLemeALs/3dLoZX4qMh3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------F21BE3A198CC81732920CEC8"
Content-Language: en-US

--------------F21BE3A198CC81732920CEC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 1.0.3:
>
> - Fix bug when instantiating a thrice derived classes via dynamic
>    dispatch.
>
> Also a HOMEPAGE has been set.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...c-dispatch_1.0.2.bb => python3-dynamic-dispatch_1.0.3.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dynamic-dispatch_1.0.2.bb => python3-dynamic-dispatch_1.0.3.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> index 6485f9d57..2bf487584 100644
> --- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> @@ -1,11 +1,12 @@
>   SUMMARY = "dynamic dispatch decorator for classes and functions"
> +HOMEPAGE = "https://github.com/XevoInc/dynamic_dispatch"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "0e29d2afa806b9b87dadfbed6a0afd6d"
> -SRC_URI[sha256sum] = "ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d"
> +SRC_URI[md5sum] = "6bd3cc24427de753eed0656e89d5302c"
> +SRC_URI[sha256sum] = "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604"
>   
>   PYPI_PACKAGE = "dynamic_dispatch"
>   
>
> 

--------------F21BE3A198CC81732920CEC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.3:

- Fix bug when instantiating a thrice derived classes via dynamic
  dispatch.

Also a HOMEPAGE has been set.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...c-dispatch_1.0.2.bb =&gt; python3-dynamic-dispatch_1.0.3.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dynamic-dispatch_1.0.2.bb =&gt; python3-dynamic-dispatch_1.0.3.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 6485f9d57..2bf487584 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -1,11 +1,12 @@
 SUMMARY = &quot;dynamic dispatch decorator for classes and functions&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/XevoInc/dynamic_dispatch">&quot;https://github.com/XevoInc/dynamic_dispatch&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face">&quot;file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;0e29d2afa806b9b87dadfbed6a0afd6d&quot;
-SRC_URI[sha256sum] = &quot;ec7025b2890e7a882ceef95ff82fd154265136af930cab42533070b557d2a15d&quot;
+SRC_URI[md5sum] = &quot;6bd3cc24427de753eed0656e89d5302c&quot;
+SRC_URI[sha256sum] = &quot;fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604&quot;
 
 PYPI_PACKAGE = &quot;dynamic_dispatch&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F21BE3A198CC81732920CEC8--
