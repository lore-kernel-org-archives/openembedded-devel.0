Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web12.13122.1597334245688903299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UsatPpO2;
 spf=pass (domain: windriver.com, ip: 40.107.93.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1Em1rUBYI3KqbdoLB1qXesY3iyvEa5e26/J3pu8mMvZNrfPM81aTmEXS7ur0ij2M4JrZIdVWNfzduXLdTNwF/AOyYpSCNCq0wUPowBv9qs0cS1JqIV3t94b73JyLEbTbZ5r/KuLw/EF/Na92Y/xyHLROhXNdewfi8euC+BaFs4RILE6+y6vCJBESGn3Ei1BKPelUV3sVnwh8YR7H74Y8QBeztWXQbXD2L9SRWvQlBPwFaZMvFIT7GaIQmcWn19rok2iSTHoljcpN2MY5nnLYYAlsXI6NkaiIOANnCS6Oz3xqgzn54sHK470Gq8/L6kjfkcOakqsf45JQklf/z0Ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+RBRQUqMYAr7IL7JPAaWQktlnvaLBE0eP58OtZLWdo=;
 b=dEn0wFHTwWHRwqoH5tGd1r1cRewH+6ISyD/2UQnfvNpya6IOgTjAJrw2Wp861Q3Jd8bF0/SOQBW7kmjwNnqmSo4RUjKJ+qgTU0z4yPHDGDHAccHbsaNTxtSsZ1WdKOXMTPu8Yy3NoMP7gFhHySWxpZPHMpxd4guld1XhP1be+yUT8NKxJm1CLUZeG3H5Cl2bBWWku83oyQXj9Kep3a8kJ1+qVglNTRJduDffcjSGShbEYaZux0ISXjHu/2QM8uXCSePQfFXwnzCcZxhgnlcCI46W7dsFSLk/FHNupe6bPexqwI5VkK66/qHUXCaOQJHcIsoI+y6zcdcGaOJAllzIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+RBRQUqMYAr7IL7JPAaWQktlnvaLBE0eP58OtZLWdo=;
 b=UsatPpO23QL6yH4f5iWNZI+DIX85uOFzzWAw29/lOlbwpV//tciCTM4LbWpLXUMYXLwI3wiNPdbdFNuD53wXi+knhSXiZZfvcVzFFcRuG0y0I3xV9GsihlcHECmRYWIea32twUrdDy39rxdJpHZy/fFxqC5v4fXXeoHjvYBHm9Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:57:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:57:23 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-sentry-sdk: Upgrade 0.16.0 -> 0.16.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
 <20200812164335.24599-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d3203717-c7a9-42cb-2c79-16c45417312d@windriver.com>
Date: Thu, 13 Aug 2020 11:57:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812164335.24599-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:57:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c9cfbf5-5942-492a-8200-08d83fa19128
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814E4EFCA9F8FA86F584B809F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B8a4NDp/XdUK4SSncnh8s0yh7Ezffh3qkLV5oeC4DB5MHdRmrqZspc/44iJ1wussiteaX3HP325QAy7natuPTtUDDjAd2V9eW1X/REw8cjYwBBGfK7thQZvsGDau4YLndu469g/JjzmH0cs0R+u4hTEXaBXq8HfJtM+xChdTOifP2qRMdRj0B1lc31a1zbs06FMKsLhUQlnxsJ/seJ4WLCk0GKClYRYd4z4NvafGu+aofxMTI0gDP+rkAMXcqEa/IcO10FCRJ1rba9ygTYD70Ug8uQ0x+v2RW79v/jj7+vYn813uRnsVGrCCuQYqagm39SaN4kMRtSnwrAbA6lKRLEB7baAZuWY8GeERVkYZh1hYIsGhDKInpb7uOpzBWa/z5JmRDL9wOJocxmzmdU9yU0mM992ynKkIN6H5+YLk2WzaKnwUmWjqQXtYdVvNd2Rv6GeENfrdSCL/KpQ6zRXinw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ad7CK3WcmW28Sm7Zsbrg2onYx5pUrMsP7x/H99r+iy+8SdjfbUm72s22N940ndpvXZoej2rrfcjAwSJmydU1LLKK9ULJKTZ2b+ZKuzM/SeBhcuGRS2Nqa9yVDkNi/l/EXMDtdeCraRNl8p5Cn6H1QTPjT51/zYZLY6vEuC/hy7OZOix98qqmert5XVkbKzywCebr1Fk6iBbnmpygMPzkmS3nluer0Ts8O2BwDBi/HP1swP5xPAfaENV41jWUvTljKzOnYHUNOIbIsbJ0aXQymmZYQFjk14Eu+xpHPE3QPyMoUSvpEzL995w2zlUO2qNKHE8IhV2NvYfWrONPB5oeEvYtweg5UtU3OosDHzjxJaUyAOmQjDg9F9C8OjvzzzOGtksTysG7aljPcmibQD7PZF5BOHSeKtSQQQKBNM9zLW476meu3lk9/EhTSt5AVUhfHBL2wbiBPFEssaOVKzVSBLNzPZs00sRk40dk5AwciUCdcGwCq6CWeHMVs2LzwqIcm3Bx1fHnElYBWS4p+Ob9TkQ178FcMsu7486Vc9ZFU/R2rdKP3OMpDD2JV83QYIBmU1+kUC1kkVW3Kg8+nCjbOGkBmYJLikzp8i/XBKXXELd2cktu1OiyyZCeHkDy1lzmkuEcA9Azpl7c1TCh0X4FDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9cfbf5-5942-492a-8200-08d83fa19128
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:57:23.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zklp9rvS5Y1dumqiOktSodYdUkI1sXA7c179zGILu6B5EeTHPYsOy2V2zI2RE2abb9aysFVASQkfMLnADaVEsw2aR4CpL6v+N5zC7pNLB9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------A4F10C7A49469CAE893D3FB2"
Content-Language: en-US

--------------A4F10C7A49469CAE893D3FB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 12:43 PM, Leon Anavi wrote:
> Upgrade to release 0.16.3:
>
> - Fix AWS Lambda support for Python 3.8.
> - The AWS Lambda integration now captures initialization/import
>    errors for Python 3.
> - The AWS Lambda integration now supports an option to warn about
>    functions likely to time out.
> - Testing for RQ 1.5
> - Flip default of traceparent_v2. This change should have zero
>    impact. The flag will be removed in 0.17.
> - Fix compatibility bug with Django 3.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.16.0.bb => python3-sentry-sdk_0.16.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.0.bb => python3-sentry-sdk_0.16.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
> index b3f149029..ee84f6b0b 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "8cfa879e803add117b073cad20c1d74d"
> -SRC_URI[sha256sum] = "da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2"
> +SRC_URI[md5sum] = "41ac61676030401bcf22b47ac6a2709f"
> +SRC_URI[sha256sum] = "21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------A4F10C7A49469CAE893D3FB2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 12:43 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812164335.24599-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.3:

- Fix AWS Lambda support for Python 3.8.
- The AWS Lambda integration now captures initialization/import
  errors for Python 3.
- The AWS Lambda integration now supports an option to warn about
  functions likely to time out.
- Testing for RQ 1.5
- Flip default of traceparent_v2. This change should have zero
  impact. The flag will be removed in 0.17.
- Fix compatibility bug with Django 3.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812164335.24599-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.16.0.bb =&gt; python3-sentry-sdk_0.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.0.bb =&gt; python3-sentry-sdk_0.16.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
index b3f149029..ee84f6b0b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.3.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;8cfa879e803add117b073cad20c1d74d&quot;
-SRC_URI[sha256sum] = &quot;da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2&quot;
+SRC_URI[md5sum] = &quot;41ac61676030401bcf22b47ac6a2709f&quot;
+SRC_URI[sha256sum] = &quot;21b17d6aa064c0fb703a7c00f77cf6c9c497cf2f83345c28892980a5e742d116&quot;
 
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

--------------A4F10C7A49469CAE893D3FB2--
