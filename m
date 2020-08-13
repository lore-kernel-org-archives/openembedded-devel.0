Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.40])
 by mx.groups.io with SMTP id smtpd.web12.13043.1597334042573674296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LfRfF4+o;
 spf=pass (domain: windriver.com, ip: 40.107.220.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6tc5TPSQYS33EzyEooef30sVtYqJIYxTPB5KsEE56+Tu4tpNp6kuK+AINH+wJiUZO9RR246EZmCcx7iqGXCUkbHczoxiLQr1IK83PATN+2ZDXoxQ1kHnzoBMrM3KzBQDP6pIIVwO0za5MRT3HAS0D4k/kDrzAjHt/zGh1ysYc4uudtYiiam8hfkWy4TXWL5PLsHX2atQXhWiiNptggdxGJnjun64mZiMCojiY5QqPois6KVdxDMyVSSg3jgRIm2tDDzB0BKXvaaRxM3J8XXy9xsX6KiCbX83WV8LmNTXsKveQyCjCl2xu0ozglko74Grwm3SQY8LIf6yC1tUvARVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKsfxomaiBkW/SjCTuzVwjcYS5A330KM89NIcMOzpKk=;
 b=VDGfYVBV5r+kyW+Y6FB+S9PNSqoQNVefUaxnXkOVWG1Hyn+zEdhLSR436idzC6yzGmOKZafSFCsEFk1gZntMlGPyCNgTFPA1lNKNyaiEvpSwsNsU/JZ+m8IaXDkMC0xXZO74/GKznd3KhnKXWKjxS4KdHYrF//ncOnHoc+/xJjv1JN9mQi/vMC9+VwpQ+RSJ9TqNxciKb3sYkYEE70hfTGY03SUF060kO4hqN1RNQWAjry9YT2t4qOa/VwPdFAj97COTqO3pQ8GtD70TRjUTYVVWlvCVHAL0hiR0glhzi/6n2tTh5s54473vW+KuJTXSQ2mV8pU3tJqv0D7zN0/bkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKsfxomaiBkW/SjCTuzVwjcYS5A330KM89NIcMOzpKk=;
 b=LfRfF4+owzv4bcHniAmVwNaVVTNUzdklSSqRTfSGlzvFJ6xfaFHZb30WyB7gP9UzWE77uX1heYqM9iD8UMM+qEn1EkpGHlLwYDU6W6As0Ud9V1T8YGC/iVGN3AD+/E3M9PBMizOsvGvFAu/sgY0+bBpSMXbeOSyOm3vSWn+VEmA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:54:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:54:01 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-isort: Upgrade 5.2.2 -> 5.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b861f6c3-7518-6674-3f84-31d8fbcd3b5d@windriver.com>
Date: Thu, 13 Aug 2020 11:53:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:54:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f6ae9fb-20d9-4fee-1300-08d83fa118f1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606C361DBDC2566A75DD2859F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IDrqPKn62nW4peHegUtKV6d0STU9ApR0TuTa1UtoSYjhyh1uTr40x5fi9++SiLXvYhtb7DzOiXeJeEPA7rWq6rIexL4YkPoNA8P5oNdnE2sXUVN75Ie+PxUt3SLAB0GcASCjpf8Q8h39oM+E5XaXmVHurDMDDqr+cjefMyrIu4ynvrgqoMyBUWZp61XSOl5fhdy+JaXx2BViHtfiKx5tfbWzR4cDh33xFNk/vPxs0JIylbph1a3F5FWDSXkSwANSQcba9rwTnVM8bb3uYAIeoQ1cRtQMStjISXDFnbAPZbPnsanxAeMljYY1Z4Fk8ImkOXtCNk3WD2e92K+unYYVdAYHTvlT4ccYCnaNe1VU6HqdTU7jtU8STvAked3cmGpSJkIVz2u5tZN8blJrfy89TUZj8IGKV16l2DU9FIGbHt8pguTx1Q0S1t+7FH6spMAJpnQU/1vkOzD115erJU8vRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eRJOt4+BkRVtLyrE+KckNnbunKa0xDdk/jKObW4NJv9cx6o4IPEA8dtHMx/XoM4kZ6FEkq5P0z76fcXGXwW9igyFkLHDUi14vrkqJ+HPs02R03XQQC1gTCoXDkGu9M7ebUgjVxBwUBXhlpOmM4ER7yhsYoYjn8GDOgUeobLUhZGK7HWjbGQ/s2fndu6rr62JNl5Jl9X2txzUOh9OnWvI4FlljbVT+sZ+GsY7wIgl10eXkdIAggRP8Wrxsj3AWJSsqMEdK7hfITfe0VGuLbwg2DkMMpY0KckYduuoJd1OCChWJ0JKtjuCoqS1Fb5r+a8AcVwiLikvGa7iA2XJi/GO8aXa6j0uEPsXGmoS77cC9mU+126UFx8CoOBkbCDgbdcwqiCHCSrfdHjfqBlSpH+3tvD+16Eu+yJs7iWb/oMkYPsgUKllRxTiH8hnHwVzW02Q75HZUf5niL47fNdNr5YLQ4dGtpteGCPFxjdIGV3o28Hz4Nxtj4vxOgvNCGs69l7Fyx7L3lYb+gEe3lwZgp0NnbJKvP1pH7d2AGQG18d0k4STsrBqBD1JgLgz5UbmZq1MsyVdWBIpDTfwubxWRVZiXXc0ghtuSxfQhw+atAiYCxf4R8OzTl970e9beeTEo7K5re+18guXx9b0Y4eXMvWyCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6ae9fb-20d9-4fee-1300-08d83fa118f1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:54:01.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFMQFehgY4JB4nuBPRLHC9QVawihQHtN77SqWd6DToH5P5ZMk0qneC5iFa91laTCi8C+Y1WKAQGDbIfcia/Qq/rtEzJz7Vf96fUqTawxxlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------772962D7BCA4A5F325CFD7F2"
Content-Language: en-US

--------------772962D7BCA4A5F325CFD7F2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 5.3.2:
>
> - Fixed incorrect warning code (W503->W0503)
> - Improve upgrade warnings to be less noisy and point to error
>    codes for easy interoperability with Visual Studio Code
> - Implemented ability to treat all or select comments as code
> - Implemented ability to use different configs for different
>    file extensions
> - Implemented ability to specify the types of imports
> - Implemented ability to dedup import headings
> - Added experimental support for sorting literals
> - Added experimental support for sorting and deduping groupings
>    of assignments
> - Improved handling of deprecated single line variables for usage
>    with Visual Studio Code
> - Improved handling of mixed newline forms within same source file
> - Improved error handling for known sections
> - Improved API consistency, returning a boolean value for all
>    modification API calls to indicate if changes were made
> - Fixed spurious errors when combining skip with --gitignore
> - Fixed --skip-gitignore does not honor ignored symlink
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.2.2.bb => python3-isort_5.3.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.2.2.bb => python3-isort_5.3.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
> index 4aa3a8838..2f1a9838e 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "2e501eacbf110d1e2c524590b183d339"
> -SRC_URI[sha256sum] = "96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3"
> +SRC_URI[md5sum] = "5ef33a4fe121b3f24493ad8ac450baac"
> +SRC_URI[sha256sum] = "ba83762132a8661d3525f87a86549712fb7d8da79eeb452e01f327ada9e87920"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------772962D7BCA4A5F325CFD7F2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.3.2:

- Fixed incorrect warning code (W503-&gt;W0503)
- Improve upgrade warnings to be less noisy and point to error
  codes for easy interoperability with Visual Studio Code
- Implemented ability to treat all or select comments as code
- Implemented ability to use different configs for different
  file extensions
- Implemented ability to specify the types of imports
- Implemented ability to dedup import headings
- Added experimental support for sorting literals
- Added experimental support for sorting and deduping groupings
  of assignments
- Improved handling of deprecated single line variables for usage
  with Visual Studio Code
- Improved handling of mixed newline forms within same source file
- Improved error handling for known sections
- Improved API consistency, returning a boolean value for all
  modification API calls to indicate if changes were made
- Fixed spurious errors when combining skip with --gitignore
- Fixed --skip-gitignore does not honor ignored symlink

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.2.2.bb =&gt; python3-isort_5.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.2.2.bb =&gt; python3-isort_5.3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
index 4aa3a8838..2f1a9838e 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;2e501eacbf110d1e2c524590b183d339&quot;
-SRC_URI[sha256sum] = &quot;96b27045e3187b9bdde001143b79f9b10a462f372bff7062302818013b6c86f3&quot;
+SRC_URI[md5sum] = &quot;5ef33a4fe121b3f24493ad8ac450baac&quot;
+SRC_URI[sha256sum] = &quot;ba83762132a8661d3525f87a86549712fb7d8da79eeb452e01f327ada9e87920&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------772962D7BCA4A5F325CFD7F2--
