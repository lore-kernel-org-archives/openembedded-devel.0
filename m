Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.75])
 by mx.groups.io with SMTP id smtpd.web10.21311.1602868640985295676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hRVqH6x2;
 spf=pass (domain: windriver.com, ip: 40.107.77.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPD5RzOsOie4q2fv3TXb8B09gwtiWPBo2GVf/pVeVmeSEVFtSxCuHe5aCBTtqRkuNkq+JHMLQFqzP5NYCQcyOz3rO7X7dTkO4TeNOIUe6EbyrR9Oj1kyYylzAnLFCFHiDFS9oCy0jGlrOEIPA46oJ21m6Yf++MqS3R/IAsXK1Dn2n7VcQ2kD9dvYUHh4ZsZ22jwc37WUfNXIkd1vS8cziuyGZAd4CcQrWcTajee0VbZrN1M97TKtgJWZ29BD7pJzVmvbAjcLPYA5wwo/U5pHGGMVJr6u4g1ifhgWfJFQk5+dzKgCgBWkktFuh4HhkjrrdJF2X9Uj+fAi2coaRni0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+itRV1P0QkFvom0f2W32Jz/b+7LPok0/Jah4zRUdYk=;
 b=QP62KqEuJofjgYiCE+7eJufkasr2G1o/GGjwy6JakkuAN2zaJV51yKx0DpaxK6ubRduq9I/mRyehR+kTx6Yi8KQO1H5KFcJ5OYXwTtP5zdIn+BiiZ1IVcSse27NHLQPRbsKEEqqYLJxgAeI6I0WedRGkChnCvA5c2I6okab7FgVg3lGj4oCfE/Tg6NnSYS3Wr0YqSvVSUJVeUDvyRsXuG6EaUCsORKIctNNY9DeCbuTsHu3bvmIOdhTD94nWee08uGYS3s8jIKqkZuht3p2oH+rgsVZ/ChrU9gp2Khq/VpfRihXuF1tFIhdeFky0FSiWM5OWw/gsYmpKJ82niv8onA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+itRV1P0QkFvom0f2W32Jz/b+7LPok0/Jah4zRUdYk=;
 b=hRVqH6x2fbYsjJzuFNDZpKr8kQxmCZ2cyB6bvP6fG8Y8S+F632q4pg7uRvrcqPleEBOvf/5xy5JlKZ5pZBuuKne6XzNUtKtybuRxN4dVVV69/k7NGf6oVieeaqcW1lNFPs6uiPkgFf7v0TzcrdEt66vLWgxcVvYCi+ZpbQDpbA4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 17:17:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:17:19 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-yarl: Upgrade 1.6.0 -> 1.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
 <20201013085914.31580-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cd12cd11-1e34-4fa1-cb6a-7fa5b76b0938@windriver.com>
Date: Fri, 16 Oct 2020 13:17:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013085914.31580-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:a03:167::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:a03:167::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Fri, 16 Oct 2020 17:17:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24fbedeb-385a-49d9-1c65-08d871f7567e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4241:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4241FC144FCB0E8A9033FE9E9F030@BY5PR11MB4241.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0P6Bf1N4V1ZZYYDipRhibUBrmB60dV4//mZPRwKuOuDwAoJzy/2to/9bssYvxZkB/g4apVSIJKduBeLF7vDSMNibD271jTG9JjAMT4NoTwwrdl2DZ8RwEx7VNiErbhAlp9bVrfFmo5S6cj761NyyeQ9VarMxSxX7YGrZsmugfUo4vO4z3PX7tkY2blrbg3i1TLXkhp7o5emRuo8BCz0MKJaXxVJLtS8AyLuPxZBJDjycmG3Zi2dW4MMZr+9wEZqX8j4YEA1yUZ5SpdIoWlZsEYha9ump1y6G1X0LpdRI8qyHrZ73e3g2KoVw7sNCRdEEiJlyi5xYm4J2gzJwwh8r1qmiVWymDxQdXQ029z/uXPTBVRZ3nPivx/Gh/2RUK3bj9bXJviTURWfXe+lEgaQf9bsQUthMqBgO0RXc9hYriHcI5PNOkA7fWx29wQRCJQpITZx3xw8P0jYwKwrl+bYe0riM3Oe+UrvNbaUzG5QyGnrSffBTt4lZccVtvRC2KH55
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(83380400001)(16526019)(44832011)(166002)(2906002)(478600001)(966005)(26005)(86362001)(6486002)(2616005)(956004)(186003)(53546011)(34490700002)(66476007)(66556008)(66946007)(316002)(31686004)(52116002)(5660300002)(33964004)(31696002)(16576012)(8936002)(8676002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FfSZfBm+se9tcp23RoxZ8nczn2bRmSRXqPOtcVVNaXsw9SIfoPNYjJp4FMwuxnzBG1bvg0kWgB0dflr0P/2OV9jGZbIyNOQaZoTH2WuFtc5kOI21ewZNGMoSg6A4o8EEWOBPi7kOmYq0cxuDOYiaTq1mcakZKwBtGq2BMdA9XYKag+655WGVNzpdAcmGNiRxtqqgnpPrci1PDYI1bA/l4Uilgl0VVNCrHeI/HXaZuIbqaOg/8Mdt8agx/DKaPY/3e4vRENXkKgSlEfVza1mKHnQCBO0889/PlRyg7DUIcr7+FJsE2kyWNmb+SAOyVyTZ5QyAIvthgndTRbsavKBGYHjbPjQr/uOBxS/GytLC4vDG1+M0vU5P8v65W9Wb9e7zOCLjCG/QbfD82ea6C+Aj6Q1H182tyIcPxoaTVscJXV5OrOoSKGvYAYuhcnrtPxi5WTx94+p8rteEwujYJhrO6DbdxYAElOTbqMZCa9AobufNgiulb55Icd3mPJ8GconJu2veX/q6JrVL9yVN/mJJ7xDpp1/nYjw51tjCJt/4/2N1D27e5s/CMY2UE9rjhBs/tsVeD86res2WJlZ/TENviX62of/vDnQvFpeQJ6jzHyv36mCSf/aRuXaL6ffBPd2gAfP+EeV8y9RnXvAwuLVsrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fbedeb-385a-49d9-1c65-08d871f7567e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:17:19.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwOcIwCDdkrSMIIh6ri7oK7P4WG4kJbOMOywKSMPBxSQUrq7JffVIbxf7RUu20OTk4MmhNOwRQcD9eaPYxcjIEPP8wHzGuCQ5mf/Oa2UeuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4241
Content-Type: multipart/alternative;
 boundary="------------C7996EB8FFE81AE0E9A6C9F5"
Content-Language: en-US

--------------C7996EB8FFE81AE0E9A6C9F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/20 4:59 AM, Leon Anavi wrote:
> - Provide generated .c files in TarBall distribution.
> - Provide wheels for aarch64, i686, ppc64le, s390x architectures
>    on Linux as well as x86_64.
> - Provide wheels for Python 3.9.
> - human_repr() now always produces valid representation equivalent
>    to the original URL (if the original URL is valid).
> - Fixed requoting a single percent followed by a percent-encoded
>    character in the Cython implementation.
> - Fix ValueError when decoding % which is not followed by two
>    hexadecimal digits.
> - Fix decoding % followed by a space and hexadecimal digit.
> - Fix annotation of with_query()/update_query() methods for
>    key=[val1, val2] case.
> - Drop Python 3.5 support; Python 3.6 is the minimal supported
>    Python version.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-yarl_1.6.0.bb => python3-yarl_1.6.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yarl_1.6.0.bb => python3-yarl_1.6.2.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
> index 543acc51ba..dbb5d23bd2 100644
> --- a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
>   
> -SRC_URI[md5sum] = "802bb27ebdb260fbbaecbcc8168d6f28"
> -SRC_URI[sha256sum] = "61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b"
> +SRC_URI[md5sum] = "65c3346f694e37f45045f4e29a60d280"
> +SRC_URI[sha256sum] = "c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6"
>   
>   SRC_URI += " \
>       file://run-ptest \
>
> 
>

--------------C7996EB8FFE81AE0E9A6C9F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 4:59 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013085914.31580-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Provide generated .c files in TarBall distribution.
- Provide wheels for aarch64, i686, ppc64le, s390x architectures
  on Linux as well as x86_64.
- Provide wheels for Python 3.9.
- human_repr() now always produces valid representation equivalent
  to the original URL (if the original URL is valid).
- Fixed requoting a single percent followed by a percent-encoded
  character in the Cython implementation.
- Fix ValueError when decoding % which is not followed by two
  hexadecimal digits.
- Fix decoding % followed by a space and hexadecimal digit.
- Fix annotation of with_query()/update_query() methods for
  key=[val1, val2] case.
- Drop Python 3.5 support; Python 3.6 is the minimal supported
  Python version.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013085914.31580-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-yarl_1.6.0.bb =&gt; python3-yarl_1.6.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.6.0.bb =&gt; python3-yarl_1.6.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
index 543acc51ba..dbb5d23bd2 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/yarl/">&quot;https://github.com/aio-libs/yarl/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b">&quot;file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b&quot;</a>
 
-SRC_URI[md5sum] = &quot;802bb27ebdb260fbbaecbcc8168d6f28&quot;
-SRC_URI[sha256sum] = &quot;61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b&quot;
+SRC_URI[md5sum] = &quot;65c3346f694e37f45045f4e29a60d280&quot;
+SRC_URI[sha256sum] = &quot;c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6&quot;
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C7996EB8FFE81AE0E9A6C9F5--
