Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.60])
 by mx.groups.io with SMTP id smtpd.web12.21405.1594922613589289298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bnm8OZeh;
 spf=pass (domain: windriver.com, ip: 40.107.236.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkFi4LO7M5UmcddJiSdnrvcbxSXoUn8m3VCezffKaqzzRZ4k35wlMgRHFcrLmBx8REuRyIUAz+8Q8SGZCDiwbK3fDYhnmMc1TXbRjicL4G1tXBAQUEeHsBvPN7g0gkbFPcDqj/s4KwboBgZA7WvOAsktvfkdYQ1JGQ3VNj8NA/Ok3q9JiBIkwLwJi+kYAWrX9apiv82diViPN2IEySqnfZkSXxvrFXf4NMlObgmsQyxtc2H78sofSpfstfArdTKckcJggexMbt3an/vsUW3vkomMo7S/JXRlHT5Rscg2KBXPERgKHjTWw1IMpLYceWNztjHoIDWk0gU28DHlz/45MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuQ/DFMDGrnN46R6W9RU2jjv0320KlOsggLFaMZDiXw=;
 b=Hcw3LB2MPGSEtzmc6S9RQyaYCE61SN3k2wQTm+v6gflTvhzEUwMARC6tVdOVJ9rSWkIZ1Jg4/yShW5Z29fSRGxg+EviWGvptjDhuXZABnWd1hGxSi35mZH3kkLYFrBmgWrLFOs3PNB4W7yUhxCApZLFgE5bBhjiYD+7TzLAIPpgE/1Y3QuPYwGR93//EJH1pH5KmWovR2kQirOFLB9dIelGoDAtnMxrApqlo0vPFoFQoWdo3Rl27DLBT0SKtFGOXKLnYwZ+PthNKOhuWCm2NddZNdIG3eMcMQmnIQAf4dM8BQEY0MMDBSGFYgHud1xgshiBhEOlIT5AlPIei15bT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuQ/DFMDGrnN46R6W9RU2jjv0320KlOsggLFaMZDiXw=;
 b=bnm8OZehIPuLzcCWJs8AG0P8GdjG45zNHcp7ek5jZSTEQ0P8WQCRhI+bISJ0bncH3FmIZDg/7SgS7DdeX8INsr3963ynHzUq7h2g1KC7ln7rwjEpSJ+Q5BVTXPf2xJwMSDXxDIB7Pv9MekWgzBBkMhzO678f4Z97jRuLmVEsq6A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2168.namprd11.prod.outlook.com (2603:10b6:910:18::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 18:03:32 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:03:32 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cbor2: Upgrade 5.1.0 -> 5.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <932c1958-3260-c439-dc1f-d40055fd09f0@windriver.com>
Date: Thu, 16 Jul 2020 14:03:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715152450.29018-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 18:03:31 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6861121d-b1b0-4872-7cbc-08d829b28d15
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2168:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB21682AFB428953E72D7443D09F7F0@CY4PR1101MB2168.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6y8p2bxgMy04CPwbX4J26/b5DTI7IaepchIO3JpW++gV50qbZ79lKMT5gvaSi68oxUGiwk536E9Ekt3B/3+g+0MGhB8J2oFInMLQkELcgM4+RB2GGur2oyi538itwfTjUSLRoHq2v7KO2NckuH0GZhNusiBUhjvlaN0XPSwiX5la5Sy8CODus8RqIVBmCIdCCouplQ1af0+QJXzjBZMQSuPiO/Cg8dPzYp8vo4wikvShoSKe9R/779rXzr3ckVLj/+lrkqMRUJj8/HAI9Kf/GqvjuNazHz5pwg3OL/YRJAf2mPub1XQo0dMlRdBW93vj66qFPsyQ5dNGX9nsqaaHZhspEZLtCPpT2Va1Iqef4LJJ3PK1VBZBo7cEjhNC7PAv/ArV1iyTYBiNnLe8Xh6/FCSUXWbsQELytTY+tULx1sGTx7w/4cy1UWqJlkwFc9W0XI/CsoiP6CWB9c2K9bgz1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(366004)(39850400004)(316002)(83380400001)(16526019)(186003)(66556008)(66476007)(166002)(2616005)(26005)(2906002)(8676002)(31686004)(66946007)(53546011)(33964004)(8936002)(478600001)(52116002)(16576012)(5660300002)(44832011)(966005)(6486002)(31696002)(36756003)(86362001)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mZ+IkdlW1Fj47SL+pW41ar29Ic58UXVxFzb3cGsrdGe4Se5k5P+No8dl6S4lF5jmKhaAfgZU5ugRhkPOEvnwkidVmLVyE30Y36lUtF942gP4N5au5TBw1megt06Hyb60JL1doAgWRWguq2sBuAHVJuE70zkD9AyH1oobIaNMnqUywEtrOHG8jXkTq1eMqo9IP6QBR6sa2BatsUizSHyDAx4RtBcSqJhzApfIoT0Cpq3ELTghOc5bJsufP1nHPIVASf/JSAyjjuT8nCjdwkWAeyROgCYBOoTKI3eTBx9mZmRO4YxU3A9HlBSoebF4JRx1RlIdNkxMePJ6yHMR3gx9WPc0imuoPQcXbMWqDy0bKxU/6gd612AmWwLNMm9PoYsyv0Lt2Nei7NM9lc77qRF/yTojV1T8Qig6s7bRCI8RJmYbMKcK+Rl1SxqjlqCesgM41+09z1qwZfM0D5yOaLtankHVCAEZVeWWJxKZpPJ13Wo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6861121d-b1b0-4872-7cbc-08d829b28d15
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:03:32.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKyFO3Hpk5dS8stfE9jizm4AuGyxELVarX/QFKPLzcDuK07f4LdvY2T1cW8BnF0pccTFLlaJ0Dtwsc9jmR+5fWf/uLqRp+4WubGkqckGzkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2168
Content-Type: multipart/alternative;
 boundary="------------C90DE337800ED7E654EA3DE9"
Content-Language: en-US

--------------C90DE337800ED7E654EA3DE9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 11:24 AM, Leon Anavi wrote:
> Upgrade to release 5.1.1:
>
> - Build system: Making C lib optional if it fails to compile
> - Build system: Better Glibc version detection
> - Tests: Positive and negative bignums
> - Bugfix: Fractional seconds parsing in datetimes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cbor2_5.1.0.bb => python3-cbor2_5.1.1.bb}  | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.0.bb => python3-cbor2_5.1.1.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
> index 812539941..6b26da2a6 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
> @@ -4,7 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>   
> -SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
> +SRC_URI[sha256sum] = "09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64"
> +SRC_URI[md5sum] = "b034d7edfd22c1f98e600aaedbd90f39"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------C90DE337800ED7E654EA3DE9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/20 11:24 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200715152450.29018-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.1.1:

- Build system: Making C lib optional if it fails to compile
- Build system: Better Glibc version detection
- Tests: Positive and negative bignums
- Bugfix: Fractional seconds parsing in datetimes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200715152450.29018-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cbor2_5.1.0.bb =&gt; python3-cbor2_5.1.1.bb}  | 3 &#43;&#43;-
 1 file changed, 2 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.0.bb =&gt; python3-cbor2_5.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
index 812539941..6b26da2a6 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
@@ -4,7 &#43;4,8 @@ DEPENDS &#43;=&quot;${PYTHON_PN}-setuptools-scm-native&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10">&quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10&quot;</a>
 
-SRC_URI[sha256sum] = &quot;43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa&quot;
&#43;SRC_URI[sha256sum] = &quot;09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64&quot;
&#43;SRC_URI[md5sum] = &quot;b034d7edfd22c1f98e600aaedbd90f39&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C90DE337800ED7E654EA3DE9--
