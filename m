Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.41])
 by mx.groups.io with SMTP id smtpd.web11.7191.1591881761725651661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eHNSHlyn;
 spf=pass (domain: windriver.com, ip: 40.107.69.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do15zG0dPXj0vOKHHuWABysawG8ba3xEQZknE6KNNunIFrGNeRGJJZUMTyEXP8e5Qwz2shcyuKQG0qZTpjhXRfrSmwHdorCZAcgS/Ch54y4yV1zramVnkR4Cpx+71zxtR7GDLzezMRoFVP5+yxMDT7zRG4EYlvpRuZN483uAZ3PdbLombUoKamJ/SLLnBAf513LRqdIWmaIWBuE+0tdcZ0xI0+9bg3e3ykU6r2ISbfOO8yLVqsZGlK+ae7tnOxntcJ13X9e44SBR2wqkgES4wq5Yj2FdW6m8VRmDMe12y6oqi+o2P+d8QqQw76XpZ6s6cqivgaxH+vt45b4FdJwrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNf8QFA3TtBtG1fFyAMlywUuMIfJwKLLFbXmGU6+MYU=;
 b=He92vAmQImV7WDOtAd2ljgashCCRhzZZ0mUTG6xzw4lUPsdn0haXZosUfUR8ZNEFVt2RvBNVUUnonbSxlOS/mhzqxfLFWVpN/GGgFIGYnyYH77CmEDiC66GK9OyRCjNq/CYbTh98tWZrtTyIdrzJusbHWkmkq5Xeo05UtNuS+mGLbm7mWnq6SylnzQoq7LKoSBcYzA3JrpWxs6laIUTWQblPi0VlcsBAUe03DvFBBVx12c7PhoZHuPQhQ9N1wDA3ZW+FT2CxTPY8gRCDxTfZO3vlDS+MF+5t5he/1s1Zqen9hMn45i+YUsiHZG7yLMMe9dbX++jXOBhgtkVQLw1WVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNf8QFA3TtBtG1fFyAMlywUuMIfJwKLLFbXmGU6+MYU=;
 b=eHNSHlynsf9C8kef1B+3fWmg9Tw3sKEw+B0mzpanVlTW00aMAR6T/LHHtQROMAfGe7fLFospt5XEtj4Mf33elely0S5be6KEAKMkFbDBk32XxkYuZf6mE4M5ZjgfQAPR2ejNRJJRLtz7gGaR3q10zpbMRFXfW+SAzkhecNQBqbk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 11 Jun
 2020 13:22:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:22:40 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-meld3: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <88787a40-8fd8-d802-b9e7-79c74ec1920f@windriver.com>
Date: Thu, 11 Jun 2020 09:22:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::48) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Thu, 11 Jun 2020 13:22:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8b2576-5585-4875-13b9-08d80e0a842b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1780A5618DBF1F0B418606799F800@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VcyjfCu5TqXt+NoDgha5qbgJxf8QxqS+EPKpn+RRStKPJAT4nUVZWFKFEcFXteqNMN5dkiaOgQoA4gt5J4nPFytIJF02QwqkI1G4wMKqr5FGOCbEpwHsz9BqxwO/4zsRmA//4FUNswmgNVY5/VI9VVTfPWYUPEqQk8qryy9rDwvpgLrYfQsBtspI96KJKYgYcjz1QFS0yBwEj18sVTkXYPbIn5/y2DjhYCng8BFeEVzIcuS7Oe1BR2QOlLtZVgHBE1aCztE6N3GwAUVIjtnyu3q9jCkivoGnFJeQHuudiwQEw5P/brPJqkuDCuAd2o1T9VlD+/JpXtAPhdfa7yTujbuOs6e7wBHCj9lTxpp+hjyPSDmCQ96akmG6cNqz7cj84fC70BsX2yimwUQVjX+8wssiIx7ZxjEo7i8nxMdoXSuqfMw2T2oQhR9LHHZdYIDck3mrxydR/uEXNMMu6EeS9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(16526019)(186003)(5660300002)(2906002)(86362001)(6486002)(66556008)(66946007)(66476007)(52116002)(33964004)(16576012)(31696002)(316002)(53546011)(31686004)(36756003)(956004)(8676002)(478600001)(2616005)(8936002)(26005)(44832011)(966005)(83380400001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wlhPvLdtk+MdaxDcZngsCGJu0Ucfxujeah0PXcuAddYr8QaY7FDWT4Dd45d2SMnlLFrObi6mkoWXOPZGMpz2UasJNuXsUB82qInuYYTHOCaOn3YFFTv8PMK/jGh8bWHf2Pk0dKFVZ0IPhjtuSVASKEUYCJwQ1p8o4bIxbeXaAWheX6OvzmTXYHU8Jj9UeeUE9An/nk+BrdSDYk1bzqx5JbPgs4uNkZl+dqiwb+hr85fOQjp5y5B9bWc0S1OxQ91kteJ0bVd6Ork/BZMEUsN44sBpNNZS1HGx1OL0SwBAz7k4aT9mfagkexAcb44m8xvbrccRIEGUpg1AbYnWNWymyogarANjVZ6KVHMs9NeLeY+5aqEi4FzPhVCFJa3kBeZnKgC1KTdW2vtp+Dxllt64k/ZQQ0k7wZTVBjLMuiW9+9+1kHPfQGdDNysvMzKPTBIlyYRq881pgE+rqwGUQVn96Tq4KMsLMUAYpDB7ADVysMe95fZDw+5i5qQ/GHQl7dkz
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8b2576-5585-4875-13b9-08d80e0a842b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:22:40.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuTaDTBqCYlTowYkiZQLBfnfjKl7RnMuDzC/Fq4sd+sp1HyeuHLiIKnJ1XCK5Mw4k04ee/2dsoWN3U27vnpDGEoa8UFkqwiB+lxi7kuRFdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------0D116BB843C75819BB62C054"
Content-Language: en-US

--------------0D116BB843C75819BB62C054
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-meld3.inc     | 15 ---------------
>   .../python/python3-meld3_1.0.2.bb                | 16 ++++++++++++++--
>   2 files changed, 14 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-meld3.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-meld3.inc b/meta-python/recipes-devtools/python/python-meld3.inc
> deleted file mode 100644
> index 558e436c9..000000000
> --- a/meta-python/recipes-devtools/python/python-meld3.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "meld3 templating system used by Supervisor"
> -DESCRIPTION = "\
> -meld3 is an HTML/XML templating system for Python which keeps \
> -template markup and dynamic rendering logic separate from one \
> -another.  See http://www.entrian.com/PyMeld for a treatise on the \
> -benefits of this pattern."
> -HOMEPAGE = "https://github.com/supervisor/meld3"
> -LICENSE = "BSD-4-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
> -
> -SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
> -SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
> -
> -PYPI_PACKAGE = "meld3"
> -inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
> index f69591629..b3e68c1a9 100644
> --- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
> @@ -1,2 +1,14 @@
> -inherit setuptools3
> -require python-meld3.inc
> +SUMMARY = "meld3 templating system used by Supervisor"
> +DESCRIPTION = "\
> +meld3 is an HTML/XML templating system for Python which keeps \
> +template markup and dynamic rendering logic separate from one \
> +another.  See http://www.entrian.com/PyMeld for a treatise on the \
> +benefits of this pattern."
> +HOMEPAGE = "https://github.com/supervisor/meld3"
> +LICENSE = "BSD-4-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
> +
> +SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
> +SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
> +
> +inherit pypi setuptools3
>
> 

--------------0D116BB843C75819BB62C054
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-meld3.inc     | 15 ---------------
 .../python/python3-meld3_1.0.2.bb                | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 14 insertions(&#43;), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-meld3.inc

diff --git a/meta-python/recipes-devtools/python/python-meld3.inc b/meta-python/recipes-devtools/python/python-meld3.inc
deleted file mode 100644
index 558e436c9..000000000
--- a/meta-python/recipes-devtools/python/python-meld3.inc
&#43;&#43;&#43; /dev/null
@@ -1,15 &#43;0,0 @@
-SUMMARY = &quot;meld3 templating system used by Supervisor&quot;
-DESCRIPTION = &quot;\
-meld3 is an HTML/XML templating system for Python which keeps \
-template markup and dynamic rendering logic separate from one \
-another.  See <a class="moz-txt-link-freetext" href="http://www.entrian.com/PyMeld">http://www.entrian.com/PyMeld</a> for a treatise on the \
-benefits of this pattern.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/supervisor/meld3">&quot;https://github.com/supervisor/meld3&quot;</a>
-LICENSE = &quot;BSD-4-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf">&quot;file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf&quot;</a>
-
-SRC_URI[md5sum] = &quot;3ccc78cd79cffd63a751ad7684c02c91&quot;
-SRC_URI[sha256sum] = &quot;f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558&quot;
-
-PYPI_PACKAGE = &quot;meld3&quot;
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
index f69591629..b3e68c1a9 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
@@ -1,2 &#43;1,14 @@
-inherit setuptools3
-require python-meld3.inc
&#43;SUMMARY = &quot;meld3 templating system used by Supervisor&quot;
&#43;DESCRIPTION = &quot;\
&#43;meld3 is an HTML/XML templating system for Python which keeps \
&#43;template markup and dynamic rendering logic separate from one \
&#43;another.  See <a class="moz-txt-link-freetext" href="http://www.entrian.com/PyMeld">http://www.entrian.com/PyMeld</a> for a treatise on the \
&#43;benefits of this pattern.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/supervisor/meld3">&quot;https://github.com/supervisor/meld3&quot;</a>
&#43;LICENSE = &quot;BSD-4-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf">&quot;file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;3ccc78cd79cffd63a751ad7684c02c91&quot;
&#43;SRC_URI[sha256sum] = &quot;f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0D116BB843C75819BB62C054--
