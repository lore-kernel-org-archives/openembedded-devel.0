Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web10.10791.1601818680356290035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 06:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I8olz8Yp;
 spf=pass (domain: windriver.com, ip: 40.107.93.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuPp1fZXZ7ck5Xv626V+405gRxZ6k6wlIfncdJJSlkbzCFRL4Vn3EkOE5/7DK53NLIHND8b+10yY39wR5UEiQhQ72yiMbZbSPn0Xpl4rmd9UANnlVK8tKuaLKKRutulzY5OlesZzCEEgYWleOIwJGeNtmKoXAOPPepoXGGTRbYZVc+wpdgcnFing21TIhRd9bDekHD18W4Kxuea2T0Si0qMUhrvp48jfSjRG8P4E6TiuBci/1tBbINSybeUGSCge4kYUQ1drQYv3UtX4E+Ad090bCXw0j6ZRiTmLlBauHL9jVEYPsOe9JWxaZRZTTWsNnDyYuQtsNGg2lMPfCyNsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXoK8fDydYNB0AVa11szU8LWJNnZ5p8HPo0f1OBtg9c=;
 b=Nkqym+3Hqh4vV1wgP/XCdSN6txbG9yn8OgghVuD+1EcNdbd49VBpJikkjhdz7o64sw9z/NazteLnH4C0T3MVjZ+uDbQgjfZke32MLzmXuN+IBTt3WHDs5GTMyW9Y6DcTKimYKtZKnJYCY1je4dDcrNHp0YAMJaW88NMtFOi0fMzhb305yU/n9nHh9DciMpU2JQwazeKHhU88dealLZMj7umkerTs2AtnTwZ/5i6IV9aRINOLwkmy1PVANIDIKgngTEsGSnhCTSvOxLZa5EkKiZ74txExvFpOG8AQHJjgSQAROR1nxc8jeDDV+c5ml6YaYFNz6h5jRR0bAf0ZZXnS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXoK8fDydYNB0AVa11szU8LWJNnZ5p8HPo0f1OBtg9c=;
 b=I8olz8YpLCcD9ScDrqyxToYI3ms0wFGijXsRLzzdtFtuOi7xs0cpH+L84osHGswUS08bu4osq9pzpecsXC9Eq/ygybHneX7zaJyOInSD+HMEqq8yg490qUxbOQTne3BczYidecE9ECCcZKeIUsYVzjsVYeLD2Yc1/e6zPJlYWvo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 13:37:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 13:37:59 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-sentry-sdk: Upgrade 0.17.8 -> 0.18.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
 <20201001082006.21365-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ecf5d0b2-6f88-6263-8ea3-8a83877d1385@windriver.com>
Date: Sun, 4 Oct 2020 09:37:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201001082006.21365-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend Transport; Sun, 4 Oct 2020 13:37:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c432fdca-50ab-4543-13c9-08d8686ab525
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951A58501590BC9136568499F0F0@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EqrBQxSFscUQro1KKg95mIqinGT/Kp5cqmVjq4ChXD+otIOPv9NlMNDupOE2rHcswBNq9L97W5jii7+26K7EmBD/2npQZrzM2zIrTwIwNw4qHHXGy22eK7+sR89wZIH+CLlkib+m4S7+CHNPuxrZtDq7u2nRg8GTV6bx6OqwZCEUr16n1ve9qPPt+pg/WZcI0mYHKC4HZjGqkCvOO3NoibEdvT9ANCk74BAnx3veN1b1xjl8xaPs4FnfOSgJ2g2rcxWnFXyxciaWcS0H2jqO4eCC3w9TBbx7INg8zdztz0c7945694t12jlF00vLnVMqTt/GWNpknsl4BsC9xL/G2ZA7X98A7hdSrHlBIkUClgtdyB0S40OYJ3iKiPI70GSHApMIgT+d/fw8uOyEZiX6tuoWHpdmPI/Kz8nDtj7gPtfeaJGr/89F03K3zZ25xngbnZ5GWTrGxl1Q52KgGv2Z1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(6486002)(186003)(16526019)(86362001)(478600001)(44832011)(52116002)(33964004)(31696002)(5660300002)(66476007)(66946007)(66556008)(36756003)(8936002)(8676002)(53546011)(26005)(83380400001)(966005)(83080400001)(16576012)(316002)(2906002)(166002)(956004)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	M3vQsO3vcTt8+kebP2WUpR3otnWGLDg8SYF0WQ1d6V3tprSff5DgNVOv0rQMuav8DGL/tTgedyd+5bFtMy9ubr9dDICQLTUspvNUkrYM2zBEf38AAMXP2S5D6GZMK3g/rmP91AAR+gUCvY+jffz+6aqQTE9+zGTUGQxzX7Y5M9TlfbwDRGrJonhxiJEZ3RZtMj61EUYBmJHRWZ4YnMhfDMm4GsUVLjqJaD7JpUSwKymkANBSNplmUm+81xkgIojN70KmYGoru0Trf0kDF3XgBdt8/9IbS+ejPfxxGo67yeb2ehQmap6kNbGTeRWGXK2RqAV7LhV1kbR+DmCB93FFNroL1zd935+85lTy1gt2PlBvr01tHW7jiYJg9LYLIMeEPotWbVvDSm3mhjuEptBB4Ndprb/wTVX/IjzUnDeMRWgR2Cnvj14b51pNRD39CsHDCiaDNvcxouukQo0IyTJYDB7tnXkZh8w/kohsVEavwGvBe1EqpqzEe4oQe0hcR7zthsYornmznV0HdVGyzQDKC94ZQcpJkCm24AWRSe1YOmA7XMBNoVNJ6JejrTfnyGL+ZBi5zTaN0/MlnDHKCx2e0ezPcD9FwNJ8YXjkXDpFp0SOfNIS575vPFiCcG9fs4Ruc68eq8sYKEnE7Mp/VZ8ufg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c432fdca-50ab-4543-13c9-08d8686ab525
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 13:37:58.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpwEm38nSPFJ/ObDvLuFIWi1tlSAr753+uE4RnqmJMnO8XZ6HfkXgFhZKS6la8QhE+iZMRf3SD2XVPz/6FRRSEteNY3/5PD3nzUesXdo4Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------C5BDF0685786B4997DCC9860"
Content-Language: en-US

--------------C5BDF0685786B4997DCC9860
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/1/20 4:20 AM, Leon Anavi wrote:
> Upgrade to release 0.18.0:
>
> - Breaking change: The no_proxy environment variable is now
>    honored when inferring proxy settings from the system.
> - Added Performance/Tracing support for AWS and GCP functions.
> - Fix an issue with Django instrumentation where the SDK modified
>    resolver_match.callback and broke user code.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.8.bb => python3-sentry-sdk_0.18.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.8.bb => python3-sentry-sdk_0.18.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
> index 99ddbe64d9..e4ab9f33d6 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "17ad6e414d77026e264152bd4cc11400"
> -SRC_URI[sha256sum] = "e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1"
> +SRC_URI[md5sum] = "d6a85d958aea9277c1728c77dcf063a1"
> +SRC_URI[sha256sum] = "1d91a0059d2d8bb980bec169578035c2f2d4b93cd8a4fb5b85c81904d33e221a"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------C5BDF0685786B4997DCC9860
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/20 4:20 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201001082006.21365-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.18.0:

- Breaking change: The no_proxy environment variable is now
  honored when inferring proxy settings from the system.
- Added Performance/Tracing support for AWS and GCP functions.
- Fix an issue with Django instrumentation where the SDK modified
  resolver_match.callback and broke user code.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201001082006.21365-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.8.bb =&gt; python3-sentry-sdk_0.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.8.bb =&gt; python3-sentry-sdk_0.18.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
index 99ddbe64d9..e4ab9f33d6 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.8.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.18.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;17ad6e414d77026e264152bd4cc11400&quot;
-SRC_URI[sha256sum] = &quot;e159f7c919d19ae86e5a4ff370fccc45149fab461fbeb93fb5a735a0b33a9cb1&quot;
+SRC_URI[md5sum] = &quot;d6a85d958aea9277c1728c77dcf063a1&quot;
+SRC_URI[sha256sum] = &quot;1d91a0059d2d8bb980bec169578035c2f2d4b93cd8a4fb5b85c81904d33e221a&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C5BDF0685786B4997DCC9860--
