Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.50])
 by mx.groups.io with SMTP id smtpd.web11.1619.1594487971223402799
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2020 10:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hb/aAG0i;
 spf=pass (domain: windriver.com, ip: 40.107.77.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOWNwSS0dDaScmdKmS2r8SX7I8+Rje27gszWe0bYmg75ZxAoRPYrOqyIUaexqXPIlGAyeZt6lNOlgpVU+zvg81//ZlM1r0t5jXX3xaGX39BF449Y/X6Lw1ZLUchEMasW4d6nzkZ8d1sJLJVIkMYAfPtF+Vht6QRRgiLrsSL1v1lgKLBlAcLKoc2TRHmPcxNm/HDjQwd1p7gkYoqgp1YZuu8speAINAIGmDxUcwgzNGRN/mJ5NR9Ij7R44WbqWUfUpqiyfLO3kvQnv71EYrQbvQGF+kuvmbPSjexCGJWXMH51ulBzLy1S18OB1MAJZ4l98K7Q3a+cYPkdci+tUWunfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txcN+wRzEb1dZ+HngjJpJWWglIP38gxr7yihKMO2iGs=;
 b=b8oqR1vsflZZrkUSdsvWqyOinzD2hxZ1+UqT/rqYvfyHrctwxssu/jT54RaXi3BLVMWpyZN47EI5pUhKbxK3y87TS+hYSJTr2J4eU2168aKb2mME9fUoVmZmeGsjdtOiUTBWtimHKNm1n6qlPnN/ALqxHK5IxJJK3mLsuhMnJHHEO5uRWAR4pKzHkLT84YY83TegU31muCZHjPnhDKAisHrOIWAZohWTzZIety6mPEaNyKAIkXqeDugWqL6fgogaBO2Ci7GQ9tedexMHtTxvu51ppaKwh/fYlAFLZkWdoHejAbGVIyNP6tz3Z6lBUpqlm0LWVe82X+cKt1niEuHcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txcN+wRzEb1dZ+HngjJpJWWglIP38gxr7yihKMO2iGs=;
 b=hb/aAG0iRCLBYoOsbwBmef7/YqPdGu0iDNKgA+DdVZUrwrOqn5cLQzaf3qkvQ1Bxw887PDl5tS6qj8g9pwmfULEuoo6ngWfv5EzSoGgSXCzBpTIJGItVFRssedUzH7w8fKSIi7d/Jmqx9rGH6Qb2hR7IbWBCqu+uQ6FmyG27fHo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2843.namprd11.prod.outlook.com (2603:10b6:5:c7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Sat, 11 Jul 2020 17:19:29 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Sat, 11 Jul 2020
 17:19:29 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-croniter: Fix missing rdep
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200710040109.22600-1-akuster808@gmail.com>
 <20200710040109.22600-5-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ff715213-0255-4e9d-fd51-e68ef64f01db@windriver.com>
Date: Sat, 11 Jul 2020 13:19:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710040109.22600-5-akuster808@gmail.com>
X-ClientProxiedBy: YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::17) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Sat, 11 Jul 2020 17:19:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1135683e-a32d-4920-2ce7-08d825be91fd
X-MS-TrafficTypeDiagnostic: DM6PR11MB2843:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2843264B9F9296BFFD8339479F620@DM6PR11MB2843.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SzNtcxk1z8iGVPZvIYeP3/N1f4F6DG4Xc/z5CzlgobPQlzHSNaHki+eAA8+WYhW83KOnA/iYCX/o/bseiqW8l25ObYrko0u9TBL+fymx8s90MJNTHKv55uwdwFixlEJeMge5sEFXEB0HnkviA4seoMuchaicIu7VREsJl1UhgPVYvqiG0Pib5tE7X1d8X/GmbCYy9qGPzuRGAwXdlH3NnsKIe+JzvJzpIw409rmfaH/JEZ2GkNHjcmmh/gn4yjEOyYqBD6GZpIcKtdtF3wpON+w92OgP9fsqt1Q2oeCs+9DpqHYAP4EWieMFqUrXcbl3/xzjnnXZqqgE58jtNPIvxfZOz3Kj5uIgMZYMMbafNfvHG3IvQSmx/O86qYRLwsrMiXKRBCJxgHRb9s5E5tFBvXG74mF8Ev7n/V0xj5UYwYUgmXtQmPqHRok9BoHyslBsZVJw5DXB/x8Xaxifj96TNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(346002)(376002)(136003)(396003)(26005)(66946007)(36756003)(31696002)(478600001)(86362001)(966005)(186003)(2906002)(53546011)(66476007)(66556008)(6486002)(31686004)(16526019)(5660300002)(33964004)(16576012)(52116002)(2616005)(8936002)(956004)(316002)(44832011)(166002)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wDcw4PHmM7Rj9AHekzvhc2MRTKAdEhf15tp4+gMiGpQIRrV4hNjpQOx4JtedO3rm4Zcsm3fX6CfdzpOPcjbAY4K76pI4yXO+KgAkunzX74Q6w0VyHlcd9X98XcsJt1rwzz+cxHUhGFxDnjG2dYQYhDCA9ExcM6Saa2h1XP1UHn3mlPlUX2B0vrqnCmINcMbyO0xCWfoN7J6TdC++GBzVFmbEjATI5Nzwr7ezBHrAFmDTn9LhcRyjip3WLmoO+DzswcsYXg9oA+KSf9AXb6fZ6s/8KzEb4OWHrDBIbWkIWwTOErnM3mbP0Q1Enh8cO02fjZ2i7ePN3sguVdXxXVhlE2sHJ6z33MqlUHOu8B4WWp7om0lzoa5/eQ3kQNDE3ER5x16idZCJrNXR+CWy2RqgWPJfjWpdAnElOwkK3Z9IJH55ozxWUCpfQ7r7XSu6hcA/ZOV+IxcKGO7bV4kUoLDKUGdbNQbkxzUZfQhhsFv3CI0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1135683e-a32d-4920-2ce7-08d825be91fd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 17:19:29.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCSrOUJVka8Li8Li3QGQ/Am5wJtuYegjAgfpgwIHctSKOJ3kUma2tdB1Nv3pzUd8Tbav5NKa0mZyXVE4w5IsWNv9hIqrGU0d2HCVG6cQiUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2843
Content-Type: multipart/alternative;
 boundary="------------0D4D942089C375D058EDE88D"
Content-Language: en-US

--------------0D4D942089C375D058EDE88D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 12:01 AM, akuster wrote:
> The last update introduced the need for natsort. Fixes this error:
>    File "/usr/lib/python3.8/site-packages/croniter/croniter.py", line 13, in <module>
>      import natsort
> ModuleNotFoundError: No module named 'natsort'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> index 0c28948f63..123d176137 100644
> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
> @@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b149
>   
>   inherit pypi setuptools3
>   
> -RDEPENDS_${PN} += " python3-dateutil"
> +RDEPENDS_${PN} += " python3-dateutil python3-natsort"
>
> 

--------------0D4D942089C375D058EDE88D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 12:01 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710040109.22600-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">The last update introduced the need for natsort. Fixes this error:
  File &quot;/usr/lib/python3.8/site-packages/croniter/croniter.py&quot;, line 13, in &lt;module&gt;
    import natsort
ModuleNotFoundError: No module named 'natsort'

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710040109.22600-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
index 0c28948f63..123d176137 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
@@ -9,4 &#43;9,4 @@ SRC_URI[sha256sum] = &quot;7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b149
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} &#43;= &quot; python3-dateutil&quot;
&#43;RDEPENDS_${PN} &#43;= &quot; python3-dateutil python3-natsort&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0D4D942089C375D058EDE88D--
