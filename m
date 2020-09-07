Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.48])
 by mx.groups.io with SMTP id smtpd.web11.584.1599495066722344825
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ldXk9F4Y;
 spf=pass (domain: windriver.com, ip: 40.107.76.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqXuEpIGgWD/AaqrWWswiQp5e2D7i43v/7FhmisVDv/Wmj0AG/ZCNgrJl+vTzeRLLZny77UiHCSsoz0u0MLmLkGfYiB85wXpMpZoxbAlPGIxyBiyvphIh4G9eqvNlg+gnmqNKo1bqpWKH3rWXV/HYICEdrzW4+QRNImpqU2OzdjbCD+vA9Lpe3+C3QMKPmjYGgulrXTT1J0AH24Uw9IxmNQ1i8exEcfrpHV9RGMAjeSMoukn8u0WCizY5AU+jnvI05kFL5h2oLrPDz+zWvltWf5gjCmzIg53qcMRXxHAUd8kS5/bRx4fIdWmTMLJToIW1MnO1B5hAnB/v5YGCV0+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQEMn+uKYfzIT3nXPgkzGFfoMjK5zVk5uaIfSSUssJ8=;
 b=AGVOYUCcSIfu8Upy+xyLzlOuhNo5VKw9gTqTqBfO9uatGn0u6ZI91BkRNwhcz2cKKE8a6CdoUjmicVu7dKjScnIae3OvUyZJeWYpYlVPDzyZDL/3IzyZMq/A3zmdSuNSxofvKS5wSZWDlS2ACb5V3UkcPkBIQGdPT7jZo3vNXx3RQ55YTNGIRtcrUlUwVBvvqN53IN6YqZk1NK7T9pUwSNFXm3BseW/Y6tek+imUqdcOOWkZsblfjbbnIhr8aQ/MAGse6Ibk1HZLzEkrmu0dK5+QECUIwORxXEjuaIO893T4nPFJtK95xC6ub/4kBZIuqnoPA/uhA7HXOW+9+qNPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQEMn+uKYfzIT3nXPgkzGFfoMjK5zVk5uaIfSSUssJ8=;
 b=ldXk9F4YHMYhGFbrXY+k7pj6ttshHLbt+b6QeLyi4+22Ibxln//5d34sa4nTeDlooNxfoZsDbS37rGHL3OWCILtPZXHm4HOZ1egy3BBRpE3D/CNJZnmmjVcvsJrCj4YGLEL0SJ54hkZisoPL3e9WGc6GpHerTE14QPjTvNLH8b4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 7 Sep
 2020 16:11:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 16:11:05 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] gyp: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
 <20200904134713.13164-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ad191cd1-4610-6c43-200c-7fcd384fe732@windriver.com>
Date: Mon, 7 Sep 2020 12:11:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200904134713.13164-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Mon, 7 Sep 2020 16:11:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e40659a8-90fb-4fa8-f673-08d853489fa6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3671CDDC2806C808A2CD48489F280@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qEz9Qtt04BTFRBlBOc7GHU0NdV87Mdn6SMhn42heXumfUfxdkINoiU6dcY3nsohqQCuQchOdvh8OKUH/6YzQmg4qXUmaSYdgkLVf7vwxbhGtBpEVo3rvGKYNtDxPzKsPfN5RW93k+laVfuI35d2UJSZpj4daRI4mqScjHZ13id0a//SuJnto28RaofrqycGMtDnJ6e14KYMrKvT1rOfhuFUrltoFbUEaWkHH7dhOjS7ojtLycpX99ArYKNqKKUfNe4SdG/Inkxam/LLhQzyOTOKm3z7/61DD25JH793zujwPFXxGgVcfB4bMAp9eEAQuyqLmkWDUoC1Ar05gmI2XfeyXT+6V+HGmxrExmmaryjK1eQQaR2mBGRFp9mXk7RBZqCChD6L0ChagqZLuBPf7D9pgJ9FQjWzgFLujAoJR+LglktfZDHzef19egVcWrBLcXNmFw+hTCk2jE3qXnqJa8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39850400004)(396003)(478600001)(66476007)(2906002)(6666004)(186003)(8936002)(66946007)(44832011)(16526019)(86362001)(31686004)(66556008)(966005)(6486002)(53546011)(33964004)(31696002)(52116002)(26005)(5660300002)(16576012)(316002)(2616005)(8676002)(83380400001)(36756003)(166002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AfB2/FIWulisCuwJt7dQNFrmUIS6td6N0bsNlomijAvtqPLTJDi4fuXyEz+MbSVoCYSJSTWP203dM1w++z0siibgFudNJkiKRjPkc6FAzMiMa0bSDRDG5+YOtuMi6Oki9fPUDtGBxgfX7NsvEW3Ed39aG2v6IO7c16CCQ8a+0r/IA3pYpBgpJqgNzmeFBUEYB67QfqGMGJ3/W9HM+cUxLChBX9xFu/GuugQtWD5yeLyhVk4dWiN11SApZRVN2Wr5cM+TXSsfu2CawklVnewm/vwJujDdEGEVs9Q5kJMzer2lu7rL7GAx+u59Oabaxa/udetLFii03e0IzOygF0Is2DYVBxwTh9tJtXNhg+MjSeKZfYyTtvOfF+nFlCa1C+3/7ggXH+fqyOXb65CYMt1556Pg99G3gFLgpEfTW3WBZrFXfBvpoxO5ZCF0lN5ni+t+rTIc+xI7p3+Ca27zY3DoDbS2oOhx4LLq0HxSJ1qeEs/H+BKiYGrXftpA2XLvfd+VVdSg02xWyL6vz9IbHbXCwVNGO0FdQYNc/Q2RkMxzfhbGcFp9Yaw+KFFA7hKw4CkmyY8I+Ops3gmlV/TVjHJ5LUYmxnv093vGuDvPFHDd/Anw7r43OYvoHmvh3vrpTY88kEI4ZEgMTz9tuch6LNBlEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40659a8-90fb-4fa8-f673-08d853489fa6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 16:11:05.6114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rYLs5GsaEWy2VI2GsSIXKznt+omMKyGKhTPFCNjgtPtPan6oOVNW4D3eB68VO27uWW5hq9c36uZOB0uB52uI8KLf4SU4M51khAs6zo8QEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------6D1F2E923361549D982A4C4A"
Content-Language: en-US

--------------6D1F2E923361549D982A4C4A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/20 9:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/gyp/gyp.inc    | 13 -------------
>   meta-python/recipes-devtools/gyp/gyp_git.bb | 15 ++++++++++++++-
>   2 files changed, 14 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/gyp/gyp.inc
>
> diff --git a/meta-python/recipes-devtools/gyp/gyp.inc b/meta-python/recipes-devtools/gyp/gyp.inc
> deleted file mode 100644
> index 98ed42cc9..000000000
> --- a/meta-python/recipes-devtools/gyp/gyp.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
> -HOMEPAGE = "https://gyp.gsrc.io/"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
> -SECTION = "devel"
> -
> -SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
> -SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
> -
> -S = "${WORKDIR}/git"
> -PV = "0.1+git${SRCPV}"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
> index 8e48a27fa..61f3c8637 100644
> --- a/meta-python/recipes-devtools/gyp/gyp_git.bb
> +++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
> @@ -1,2 +1,15 @@
> +DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
> +HOMEPAGE = "https://gyp.gsrc.io/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
> +SECTION = "devel"
> +
> +SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
> +SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
> +
> +S = "${WORKDIR}/git"
> +PV = "0.1+git${SRCPV}"
> +
>   inherit setuptools3
> -require gyp.inc
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------6D1F2E923361549D982A4C4A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/4/20 9:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200904134713.13164-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200904134713.13164-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/gyp/gyp.inc    | 13 -------------
 meta-python/recipes-devtools/gyp/gyp_git.bb | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/gyp/gyp.inc

diff --git a/meta-python/recipes-devtools/gyp/gyp.inc b/meta-python/recipes-devtools/gyp/gyp.inc
deleted file mode 100644
index 98ed42cc9..000000000
--- a/meta-python/recipes-devtools/gyp/gyp.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = &quot;GYP is a Meta-Build system: a build system that generates other build systems.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://gyp.gsrc.io/">&quot;https://gyp.gsrc.io/&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd">&quot;file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd&quot;</a>
-SECTION = &quot;devel&quot;
-
-SRC_URI = &quot;git://chromium.googlesource.com/external/gyp;protocol=https&quot;
-SRCREV = &quot;fcd686f1880fa52a1ee78d3e98af1b88cb334528&quot;
-
-S = &quot;${WORKDIR}/git&quot;
-PV = &quot;0.1+git${SRCPV}&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 8e48a27fa..61f3c8637 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = &quot;GYP is a Meta-Build system: a build system that generates other build systems.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://gyp.gsrc.io/">&quot;https://gyp.gsrc.io/&quot;</a>
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd">&quot;file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd&quot;</a>
+SECTION = &quot;devel&quot;
+
+SRC_URI = &quot;git://chromium.googlesource.com/external/gyp;protocol=https&quot;
+SRCREV = &quot;fcd686f1880fa52a1ee78d3e98af1b88cb334528&quot;
+
+S = &quot;${WORKDIR}/git&quot;
+PV = &quot;0.1+git${SRCPV}&quot;
+
 inherit setuptools3
-require gyp.inc
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6D1F2E923361549D982A4C4A--
