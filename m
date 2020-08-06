Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.44])
 by mx.groups.io with SMTP id smtpd.web12.5710.1596718876643562517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nEsjgRZ0;
 spf=pass (domain: windriver.com, ip: 40.107.93.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CACA5InQAgRoLNnM5pJHRQ/DCk1i7qScJpXnHPonj/ti1vm/SR/Bgm+5PJECFiqtwffdMoS2oagAfFpLKVHFmT8dbVj7BsA7YKQigId73NEx5yjsd8kHKXLF34PSkybZJE81Qlzx0B3Ix/eZ3eggsLfrL4WKlf/JJN8/DYNswt/staQRxewBAHBpTZ3zUcupfp0z/PuD+aNi/Xn1j2e61XIxPhneFLu5OvA3G5jqksJRv7AJtCL62UOeWRyZ4LGJxbWImmr4KN/+2H6DaNn+IgXKtRcIBC3Ecvc8aN8gi3xRA3bmLKwpROTwwkUOuQrF9RxTsYXixAb75L0NRK0DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPo9MB2D+uFiSglr7VMjW54l47P44r1uCkHkAra2n8E=;
 b=k3rgtlo2JZt9uwAVVqeGH/zwD/EKiFHvr+EEodqceZlDTvnKLHfIUxmbdYo/Bb8k1ZiMvdbrKxv4XEOczvfeodRharm5jLr3isDjQYJ+XzzJJwrBp3DMCW7lXR90BBx3fM+5NmdOAYo7oM7xvfNxjUEs1NBXYp6el3rdnyBM0wmRrZZhQkgGDI4Ry+skoDFOVj6LEGsZgRQ3z2euEJw+soXpWaz85xBCYl+F8+CSzaJiao7WEqUQiGC5GuQTjBVTEAmALtFvcPnMpGJriF6rpId6JybGkqTsKNGv9mfkAHS6A4CTeVEAQ/naxqnNDyRARNf99sDlGZgdjTuv3YJlIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPo9MB2D+uFiSglr7VMjW54l47P44r1uCkHkAra2n8E=;
 b=nEsjgRZ0wlO+SncPBObJV6hcDQlZ5WU6SmyR0464Urcb3bhpyJXOag9b51kYkRXrEIKDGi9A5SM3amnD1k0t+ui12Xv3sGr5sbOCQ4MXaaCgLYxTadN94gsYqF7oFzmhpHW0K3osV1UIC9RwRH+DXEuc5SKtR3tcYbOBeQYHycQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:01:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:01:15 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-ujson: Upgrade 3.0.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <94074a78-d7ab-4f18-d790-f5bfc52778af@windriver.com>
Date: Thu, 6 Aug 2020 09:01:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:01:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa297c31-571a-4904-a1b2-08d83a08cd69
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305B9EFC0AEEA2340AE4A849F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WaB7EnJp/JpdWVwTomSc7vkmSHGZRTQTxFyOosOyWCCZE4w3iQHAXU6hzxZ7xkj4+4nCtytCcpbYVzBBjhq5Vdvmfhr8DNTX3/Ufsk4V3HG2QF7CH6nEebqr2UEFGblhkLqT7zNyLcEhPaUzFmXrZzMf4fTtFNtZyVycl71EWFnY1LFxx19n9eFwRsPJ4fsVzVxOPM+cZIAs01jtzNlhe+fCeIkhZFXBTBWqZQ2F8hcc/4DwDwh+NH4aILsxisJvezhSiw4F4VF2dW1JFYS8qH6C/BNhrZ4iIicZ12/EPS8OQV1ZfpQeNIZmVKiuRP6LiruM8d88ZjW0vMfF+Fvd11vhC2csUb4asQwW83lDcnFvRDOuepCThqFzxdYTg5O+YFGNt1e/zOITNtWAbaVgXJH2l3DH6syXZiIlPUQcOGZOYvd+bCdBS1LkzQPwiQTSmpWBOabYA0DlZhZXbDHy9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pRUPILqv9kUxArIHyYmivvD0Om9tvIHUrCVK1/gosDTb/T5CQw0phrv5LpdTXSRtzZAFhf7wgPtogznMgBVNqMS55bHtRVOygSHfFzXev3kjRR7TrsJFIp7DCnKwUCFVWxIaFI90D/ojTqFJ/untWn88aa5bAoPGqbufguWw28eUSJnH0oEazOcSLeBvCAZ/qyXB3joZrS1+JKLDy5WjGHA/KBamhH0jfkHpinecK7LEUgjkcOXPH/4ch1fck2ynHID28ammNrGtFX3uPrk0Al/aBPmxtCpS6V4S1sUDRCNb0uovTsbbyEL2eMc9P/87Nb5MohBPb9a5ExzVL4wNKLaesWy6EP1ZuTtR345JHV3VaSzKHGRSNmKWdsikfODkHxaVRiyquxx43iWmSIxgg+bsNwWgSHB8gqdVRufkIhhINdKnoPLhZPNcBlfPBwfAC/PrhTjfC+fYA41une5/K9LuxJ9489knju8hI4L2KcQMZz+LaR1HhaWPbkyWFJMbmu5IZACsNNNze2D9uzzkA2oaeIw3vMxLAJVlNv982ZiwrYadCCJLXAFyxm+2PEOtoCkFLfgeSLbe90ikToBT/DcjEQxmnNdY2kx+iNEQe53wc/iXgwmkrryx+KkH6i6Xln8HGGMai39iB4cadznPuw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa297c31-571a-4904-a1b2-08d83a08cd69
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:01:15.5045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6D/9tyEwxsD32jo1DgU9n4Z9reETUcYIHpmTVfImx2VLKKNMaGTkBPcMoJanehgqK++oUvTWANTurzPoyMk4osssV0Np2gtBy2wsuEmLJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------CAE1DF519203D7A9E14CF50D"
Content-Language: en-US

--------------CAE1DF519203D7A9E14CF50D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 3.1.0:
>
> - PEP 489 Multi Phase Init support
> - PyPy3 test fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ujson_3.0.0.bb => python3-ujson_3.1.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_3.0.0.bb => python3-ujson_3.1.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
> index 352aedcf9..ef57b2a1f 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
> @@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "1c13a485776a2a0dfa1795d101bb3d57"
> -SRC_URI[sha256sum] = "e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d"
> +SRC_URI[md5sum] = "875ac729018f3cac786d471422306fa8"
> +SRC_URI[sha256sum] = "00bda1de275ed6fe81817902189c75dfd156b4fa29b44dc1f4620775d2f50cf7"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------CAE1DF519203D7A9E14CF50D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1.0:

- PEP 489 Multi Phase Init support
- PyPy3 test fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ujson_3.0.0.bb =&gt; python3-ujson_3.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_3.0.0.bb =&gt; python3-ujson_3.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
index 352aedcf9..ef57b2a1f 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
@@ -4,8 +4,8 @@ DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;1c13a485776a2a0dfa1795d101bb3d57&quot;
-SRC_URI[sha256sum] = &quot;e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d&quot;
+SRC_URI[md5sum] = &quot;875ac729018f3cac786d471422306fa8&quot;
+SRC_URI[sha256sum] = &quot;00bda1de275ed6fe81817902189c75dfd156b4fa29b44dc1f4620775d2f50cf7&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CAE1DF519203D7A9E14CF50D--
