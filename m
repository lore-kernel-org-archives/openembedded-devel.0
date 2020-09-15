Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.69])
 by mx.groups.io with SMTP id smtpd.web12.14994.1600180403884578455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mqs02Pj+;
 spf=pass (domain: windriver.com, ip: 40.107.100.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpeBcQvWGVodkQS1E1QybVsebmHQBo7njztTgOX9g4YWWScCVim35vf1UHfqzIpCH1ronyEx8/ho9N28I1GBialKUBWDyqwksor8HwSfVt6RCa/vIXeCKNm5N+pRR6Ywf2SqU+j2yPbmsqIO5B7hXjy8ggTzChF4fvSl5JXkViduNkd/0+DGuFXkirCIwz5hhcr7iutlY8+Fg2mFG4WOWTEekTkYkR5/UTXhEyWxyTtqoMR13eZJfeXdDYeaZS9tk4fiYkh3SQuJaMgEVILP0Dhbl0asQJCs0krc9gbV4Pl0OfD3M0i0026T6uqSUv6KjzcETio3DVo1uFG06X6emA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ats8VVeS82S62twVouUsfrkKQ93RxwQz7Yt3efx47hc=;
 b=JZPBRlxLR+IZwWkekdWVB1uvHAmRTETSdrGelJgOkXBfSKOicfbYkwBDAukJb8KaxARA39ru7t7oNdKqj340SlHs3gusSLjuRrgegG2de7n4H88HS3b4b+mPgHc9KD+i6VtshN+Uuird4yMQ9J4xWCACmklSlEVVq6Z3D9IZuWXv29BhV8nLJknLd9A3fEwlkNbZaupa4KJ6adu7x82dlcKlfcakoPAjjpziJbQRWJ6t1zzv9APwzaS86D8828bBf6O1zCS9RW3SbuOs3F+7SQG+OWMVNWNaFlK+8WJCo9mqIns08HEJucfdXznVI/+HypLOnQIrxGDKer3FMCjfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ats8VVeS82S62twVouUsfrkKQ93RxwQz7Yt3efx47hc=;
 b=Mqs02Pj+MTxheTWQMOCf4VFvFbAj5j31/JTVc41BoR6mHOgJvWyBfDt7PjiRSNDrPGE7NH83jlkhhmPfXIV89Qs9Zb8DZMGhSEPts2oGfUj8RUG7wVNMfaxixcQkcpEnkVFRlt5dzbfrgkfnU10y1mYtE96U8U5gwihgu6ZWLk4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:33:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:33:21 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-parse: Upgrade 1.17.0 -> 1.18.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aab8f1f0-c352-9f68-9e24-e5f779c98eec@windriver.com>
Date: Tue, 15 Sep 2020 10:33:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 15 Sep 2020 14:33:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead15d40-8912-459c-1ff9-08d859844b8a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30296E872771610ED60AAA3F9F200@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2C44chd0UwGgbyreLrfa+dp1QFGy/3aJ5AybsFFl/oG0V1agPw3VP4dLVxU0WAAhIvKC8eAiCUZBWnYK8U5Piqmkjvn1+24QN1OdNC/KmrgAfZQNinGDmFBwjRFx624JlpXDSBSPvcnEFPswHKHFL+xygmRbRqulAU/JvztVsOaHZJ/T7gXQlTh1AA4Iy/rYn7cBb5g/y5M0S+FbZxnoGpc7sB6FhXrNXeS1QZcnBD9AQ679T0HA0DaKp6fv/OTMyc1PJzXIotrmjZc8/unyt7VMbNKxy553TDI71Tl0dgdPe8MyNmSc0r2iwSb1BG5MPn7c6c+E6h3gQBUbwUaT0ziOyzGHHQbm4l4htxr0JKHOv0CRKRVATI0jw4Eg5OWHHqhKmFMkHzD7fOVIrtqNPJ5U0q2yJUA1194YpRQqFGBeHpUbt1c0XoswL3p5Je1fXmnwst/zl4GeLHBhBl9npw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(366004)(83380400001)(2906002)(86362001)(966005)(166002)(8936002)(36756003)(316002)(52116002)(16576012)(6486002)(31686004)(66946007)(16526019)(956004)(66476007)(478600001)(66556008)(31696002)(2616005)(8676002)(26005)(186003)(44832011)(5660300002)(33964004)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/dRZJlD59i7x55GGUGn0QY3XijJzW6ZL2dKw68kVRATqke1Ee4BlonafOcayVa8C+G+gOLkt2TOW5+O+klLZI/5akG05eGdDMSCjdFsD+EMo3TCP2XyzXn+DVmpzPVJUsOxTu74FJFK6fC4GMvpZop4lmsaLNcaVN7ja4/QIzng6KGbJK1LM2O4HgVxAItL2hu6/Txu5tSkWoKp6suaXdwqLSJQHDHQ1ofPcHEd2u4cq5ZKfMeB6qxXAHyONqOTzvS+u3ms3M/UQl8ynwbGqDxRwo+qlznx4XM5HKLgn1o3ptGCNsFj7CZwyqsppEg8VHF2/yKiahse5mobxlk193hPsduyU9QlTMnmkukDaPOc4clioBppTk4Yk9bbOW4U8Im5KNtO5SkCBzHqdQetTJ1GWEUrPxQps58pA0gsQQ/Cudsu3gMjOMLGQAYqGLZY5xpN7hAZl+SBiE1Ch1nBc4Bu4m3oxtBnoD+mfwcs3RVwhnadHQ3T7cjoyV8aY47MQ64hOd9jNI3j/oR6V9Wd6j/S2/sJlNCQF/bneVr9U5VDSowOm1EN5PllDKivIUGTu8Z7vumhayyr3ItGGYI7xRJ0RZ9v8kP4uaQwT9/tHqK204DaPbBb8V9kfwbj/jvH6fdE4oCKkHKfxgOy0gGNFFw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead15d40-8912-459c-1ff9-08d859844b8a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:33:21.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoRkgazP0pAC/NZiGMlnay+e2ke6GuJfqc40WPbQsPkbrM6vQS4XtiGzfzUiGl2ZKsLdwG3dhgREZL15iYX/AP3C6wy+tV28kcf1ft3Izjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
Content-Type: multipart/alternative;
 boundary="------------B73A877935F6299F97F383A8"
Content-Language: en-US

--------------B73A877935F6299F97F383A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.18.0:
>
> - Correct bug in int parsing introduced in 1.16.0
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-parse_1.17.0.bb => python3-parse_1.18.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-parse_1.17.0.bb => python3-parse_1.18.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
> rename to meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
> index 7acf780e3..ed9204e3b 100644
> --- a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
>   
> -SRC_URI[md5sum] = "5b753ffb1470ffa4b3e6e16956048316"
> -SRC_URI[sha256sum] = "c7806139a481ec8c8336a54418894c8b201314f8ecc63e55f438f4b72bdc4485"
> +SRC_URI[md5sum] = "42ea0002cf36bfd2bd74f3c05bf25f60"
> +SRC_URI[sha256sum] = "91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------B73A877935F6299F97F383A8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.18.0:

- Correct bug in int parsing introduced in 1.16.0

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-parse_1.17.0.bb =&gt; python3-parse_1.18.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.17.0.bb =&gt; python3-parse_1.18.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
index 7acf780e3..ed9204e3b 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.18.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05">&quot;file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05&quot;</a>
 
-SRC_URI[md5sum] = &quot;5b753ffb1470ffa4b3e6e16956048316&quot;
-SRC_URI[sha256sum] = &quot;c7806139a481ec8c8336a54418894c8b201314f8ecc63e55f438f4b72bdc4485&quot;
+SRC_URI[md5sum] = &quot;42ea0002cf36bfd2bd74f3c05bf25f60&quot;
+SRC_URI[sha256sum] = &quot;91666032d6723dc5905248417ef0dc9e4c51df9526aaeef271eacad6491f06a4&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B73A877935F6299F97F383A8--
