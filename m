Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.78])
 by mx.groups.io with SMTP id smtpd.web12.8595.1590075219631070078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 08:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JPoGSqRS;
 spf=pass (domain: windriver.com, ip: 40.107.68.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXk+IwEQ4ykrqctgj318SqcCkNKHR/PQOuCgZKjB84NyvRAfB6cgT8H3g7VI293ZQ0rnRlz9c3l5IfsdxWwzy28nsrXz9uEFPH+NT32bZNiOJ6KwEfmIj5dWsxoGCxezWDN1c4DY8H8AdMIYQpFfeGPr540E9rtGs+KqlgcmYuzEkobzWMCVZyQcW805AJw5AtxHkusSTwLhKZ1dl9/rQ5Pq+8Zrm4Z5z/vTReqFqSY3G4Ck3Tt9Qko6pnF4saM8x2w+19Ksxh8zCz5WIHq/o31C3EIt3L1d5NYNKaEadUg6eVXkrEunuvtLQ7Qt++iqNczggKlmv8erUxP5UjtJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+6FQmgpnx3ULSTyMYLiPAPiilQxGZoggLZHNpFIOrs=;
 b=XYy2uKqPzS3TdrAQIWga1zmF9HbhaWU96aLo7ygXBM2fwJHZ+q0V8nNKojlWTfMF6kTZF2wxsYbts+vihI6D2ywDBwtHBBFAbm3Wk6iGBAPAdmyUEz31/YVXRHcdkNceCb6yLKgCB36JOPSf6qxzR9tWXCqlRwbzQibcGtY3PVdtE3yxJ3BZtjs1a0+0nDhfETBDyw8MZ9dczxvdSc/xfJOYws8Yl50it/buWnxy8mjieFETf/WKniQhfQ+Z18oQ6RxqDJNDSyMlR+u2KrpCCqNhtEZctYSIio3l95WjMfGDK8qhQjnycpmPaP7PgQvJ4UCJeFbddWJu3PP+td9GRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+6FQmgpnx3ULSTyMYLiPAPiilQxGZoggLZHNpFIOrs=;
 b=JPoGSqRSLNtj2upatpBTpEZpjixxSNq6eWhEK27qmOMsi418tsLsjpNkCGfF3zBuCYVD5iQ2OFvc9c72yUMaED1lrXzT0ObAMyqxQU0Vexb2dZ7Yj5cDT5v+FYScciPiS3Zub6NuOjWHQIfKQaBf/VVU6bksanxk3h5cUcDPy58=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1809.namprd11.prod.outlook.com (2603:10b6:404:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 21 May
 2020 15:33:38 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 15:33:38 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-markdown: Upgrade to 3.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
 <20200520141502.28254-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aeb4d456-7669-4ed1-dbe2-a9edaaa3e18e@windriver.com>
Date: Thu, 21 May 2020 11:33:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200520141502.28254-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25 via Frontend Transport; Thu, 21 May 2020 15:33:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 879c8804-2c24-46fb-3f15-08d7fd9c551d
X-MS-TrafficTypeDiagnostic: BN6PR11MB1809:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1809B6F88A470F2E1E66049F9FB70@BN6PR11MB1809.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vNjmciZXAnGiGFYwHDaHByy7tjW9C8HRSZjv8YbK1UCt21hcP6HvJ0sShdDeVJkbW2OblmmCLWvXKoAFhGSQY3so0aUTC1ukK4golLjNp7iwphkki7OQexsnV+XY69LWQhM0ZSJ4nfgBP7jBFEdnhcLyLJ+8auJqO7jN/m5XwYte6/w1rgy7CZYXinQ0gDF2+9PoEpaBW49hU0DEERvFw+vLDXoLt8XIpPDe0Pgblo+R0/wEL8A+ZRzsHDVKwNyRU4g9gNcX6xO70I0p/sOu3RnKXndTN1f+D0zlBmJw5pHoH6xO+OCJnaYYQWk2QsldbsHiQ/bPb0dd6jxgstvN+ijCk6+NABIA2DBByQdHXQjeMxK+loWTr/PVmQy4nfSORa9UGO5EBNEtaRMvOVSkPTXQ2jF79L66mmZl3UsH+TU+mkOTwLG62ndmLeSY7EBnNsBLz7IHCJvmNrX4cZclDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(366004)(396003)(346002)(376002)(6666004)(31686004)(26005)(478600001)(5660300002)(53546011)(166002)(6486002)(186003)(16526019)(52116002)(66946007)(2906002)(33964004)(8676002)(316002)(8936002)(16576012)(36756003)(66476007)(66556008)(44832011)(31696002)(956004)(86362001)(966005)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GbJiWWXq6cafV41rN9z1Cu/NBgJGd0x737KV7Rdg07i7ITbEGuJnIgpkgzhDTIbMMcbs+G1ra1rbXiHz0iApEfS5iwg+fiW7URmVgYHtkUkVd1iLjupM32EiAEgiYvs7W6vdRBxRDxwYKd6TTPZcBEUwlU3kgGQgqV077vXWiYRHoY42wDArB9XUMxuG+3xkdDote3qxsLlZjeFRtAcc7cykZKG6fBr1jVrrFVDVmUdS8JtW5gzFEUnM+oR/u0GMQxLFOcyhDP5VgjsKBHxWk8OLkFnclN3FovSX9kTos4TmvgQv3XIQifq5VGR0oCTv6YQwTaEIdeC7XgNpGdDv3KJ6/k1SkKpDmmMs83EBHWB0+T7Uh3uKyChAOohHCmiP51mB3Dk6iKdL5W6Xv/HykgKYfALPHicPynpIOz80KoqT6Hv8y6t0S9f1Z+e06uFRkeO23O6Ugm2VAK0JwhhWJp3HksNQxhuPlt2lZXe+qV++A6uR4o4Xg127BIGaFmt0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879c8804-2c24-46fb-3f15-08d7fd9c551d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 15:33:38.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHrOhtpH5T5iyJMq21g7T868X3tgR+chnq3v5yVuax/OdtGM3BBAVVWmA6yJpo+AJ0O1N+L5yk8JKiTHaY0Elt0OhQyaS0pB6Ir97h9sjeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1809
Content-Type: multipart/alternative;
 boundary="------------CF1A311CFD3BAC870E7DA2E8"
Content-Language: en-US

--------------CF1A311CFD3BAC870E7DA2E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/20 10:15 AM, Leon Anavi wrote:
> Upgrade to release 3.2.2.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-markdown_3.0.1.bb => python3-markdown_3.2.2.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.0.1.bb => python3-markdown_3.2.2.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
> index cdfe5496a..ce5dde63e 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
> @@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Markdown"
> -PYPI_SRC_URI = "https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2/Markdown-${PV}.tar.gz"
> -SRC_URI[md5sum] = "72219f46ca440b657bf227500731bdf1"
> -SRC_URI[sha256sum] = "d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c"
> +PYPI_SRC_URI = "https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz"
> +SRC_URI[md5sum] = "6e8daf1e566bf3572c137ada399fe40b"
> +SRC_URI[sha256sum] = "1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17"
>   
>   BBCLASSEXTEND = "native"
>   
>
> 

--------------CF1A311CFD3BAC870E7DA2E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/20/20 10:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200520141502.28254-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.2.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200520141502.28254-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-markdown_3.0.1.bb =&gt; python3-markdown_3.2.2.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.0.1.bb =&gt; python3-markdown_3.2.2.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
index cdfe5496a..ce5dde63e 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
@@ -5,9 &#43;5,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Markdown&quot;
-PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2/Markdown-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/3c/52/7bae9e99a7a4be6af4a713fe9b692777e6468d28991c54c273dfb6ec9fb2/Markdown-${PV}.tar.gz&quot;</a>
-SRC_URI[md5sum] = &quot;72219f46ca440b657bf227500731bdf1&quot;
-SRC_URI[sha256sum] = &quot;d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c&quot;
&#43;PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz&quot;</a>
&#43;SRC_URI[md5sum] = &quot;6e8daf1e566bf3572c137ada399fe40b&quot;
&#43;SRC_URI[sha256sum] = &quot;1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CF1A311CFD3BAC870E7DA2E8--
