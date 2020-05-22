Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.63])
 by mx.groups.io with SMTP id smtpd.web11.20115.1590175392185730581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 12:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DpfjayAF;
 spf=pass (domain: windriver.com, ip: 40.107.237.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBNzY6lTa7fRqiQjZeONT8S8g5D4ZT5TPqSyI3me75Vb4gq2Xq8dqJf6K6EpWKolw5uCc42OgTtmR9nLoybK7oOj45CEpkhknEU0lnkAKrjmxxSBDDJisnrcVUhMv4Dd3jEO7ipwci/DhuAVQac9lgsFVJ7m28ZBWwnuR12Kdmfkdd0FCxMmv1DyTemJgNx0OQv8i27S440FbqMzriEfip05cZhyM7oi+gRM+tB/xsm9u1ACc0i+lkSTIzFnRsxKMOds/7sBF14DZ4IuKQCcjV+iw1ii74eoAc3xnpnLZOyk+Mcwh9bHIxXJyYfYhI7y+ShAl13+idWAqvM0htHuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WgZKSaRj3MdHocqoJNnPUyLftXvfyEAkU7R4ZuiWg=;
 b=Rkou6fv/T2nA5PY137fALyKXCtLvrQ1oqzDDRpYoHM99NA4ofJouIKa+Y/rWFps9KC8sL2op6hG3Wg/ywoywfHyzgu1aMrmhwYj/tk54O4H63TN76lt6DMNPLfjgLzAGjTmCFaD8obLoH6QItVO3bxXkSr/XhRkWasH4rV7j2N/sRR6UBzf67JHyjd6RaRstfiOhWjL8Z4eN/J/lSdNvA1sf32kYchZzLVs6Nujq1vCBjgwoCyfWOAmUX1g+DBITO18NQi8UT7SSdn+xb7MkBS0HPsMD2Hw67dVUmhpoRACb8e9Ekrq7pwXGst8jiU/s9j3d1vfhAsxWRLIN/V/F5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WgZKSaRj3MdHocqoJNnPUyLftXvfyEAkU7R4ZuiWg=;
 b=DpfjayAF3HU+l4bJd7ipBVbqkhjgcNHbOpIDMnF1+3e8jdhb6gJQoYUqjjeh9ECOoxoeelXxctjCcERKeBisKFXMDmhJNn97xL1NUutzk9GM6+ILqZ3FNyZnkIC9dLc46+kiH+EVsWwZKxFsb0+y4HCOrGAbSiYOpR99DQNQerE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4004.namprd11.prod.outlook.com (2603:10b6:405:7c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 19:23:11 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 19:23:10 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-ujson: Upgrade 1.35 -> 2.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200522134007.10925-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <de04a20a-f386-eca0-9e00-5d31975557c4@windriver.com>
Date: Fri, 22 May 2020 15:23:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200522134007.10925-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::43) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Fri, 22 May 2020 19:23:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e51467-d508-4064-9f61-08d7fe8590b0
X-MS-TrafficTypeDiagnostic: BN6PR11MB4004:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB400418A601585BFE49AB41AF9FB40@BN6PR11MB4004.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jslbwuZEP8rVqQ9D+dH0rwPazA5Ej8Hhe52iBh1Tzcj/tjiNiZ45cbBkKcUCTCK20USE8BMZyeFsQlEKEqjiX+cmphsxqNN7B8yIrz+BdyB+xqmpgdQuJnnlPdf7pDha2VMlNU5QbHa1NojWBOPLP47Sk63gVc41hC2RCQezbMM9NzBV50oaH4vBopmt5msKd2UXjKCKYohrQsHLmB/uKNsqZAz9YqauoMfzKo57eSzgtwmJ5Lqe6jRCfw0WrR9yCjo103KK4vqmTwgPZ51C28UUXBdlaLbIG0qW17taof89UpIakGDxIYmsAyuzODr2sPSb/1xzEaWOkwukbMaH5BMuf5Sm9AiMuFS1ZhhCHKKigRzuWAJ6mMpfj+UA3UDjAPEYqwsm7LzR6OlYhQeXncjKUvQKcfcso7WLZd44LyqO8FhVffNoCdrSpF4XczxCgeDQiB+KbqzFpnG7RvOpfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(136003)(39850400004)(346002)(366004)(33964004)(31696002)(166002)(16526019)(53546011)(186003)(956004)(966005)(2616005)(31686004)(52116002)(5660300002)(44832011)(2906002)(26005)(36756003)(66556008)(86362001)(316002)(8676002)(66946007)(6666004)(6486002)(16576012)(66476007)(478600001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mJwvP9fmg7hSHOY1/lj+AkO0EMshBACBMh95Je0Fy6D9ya13ZK6G6PKKvqwBxNdTRdw+P83ga3ugeL6S/QNjqDzQ1JhGdT+7whCbytLghMSITeZbOdfbCd0lHoPVscI363AKBiQzUYPgL77ktUReDc2DLg1fVHGhfgGHTfMHyj6E+qGyhZjUzDlBT6IvHhJ6zBt0V2xwGMu3s6iEuSrr3wveW/rpWNffTi9UTPRgTR1tQ+qnWxUx7IM1a+d6AdXJ3RRpBxdOWC8Oyl2SwKnpOD7n27Km6xBlvnvFW+3PsK9desQOXOApN3Cl+R56iRY/tJXEyiq9G36ThcZOckxpaLuvx3Ok0WrZU56hMLgbNlkqj8IxPb547W2CPY/k2EBB46cVnYAVsyD9slJn/1jeCk4g7cbJMm+msq06BcEitMR25cD7ZSAPlS0zwZf/Mp5SgX9EhMDGj+l1wuGc+e9T8YFcq1QW5zaMcNuAz9LszM5P2cPVKjLjgk89czmQzr/o
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e51467-d508-4064-9f61-08d7fe8590b0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 19:23:10.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl4lafydbbQXOT82Phxu4XpiyxPlxoU7OhH8N/ac/bP61Za3qmxEvAguQV9Wwdir23BNkUaYiWXdpwQDpCrjhJ+ycwf/euwhcwERYMhRUdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4004
Content-Type: multipart/alternative;
 boundary="------------67A013B6BB854F35BD1E83B9"
Content-Language: en-US

--------------67A013B6BB854F35BD1E83B9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/20 9:40 AM, Leon Anavi wrote:
> Upgrade to release 2.0.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ujson_1.35.bb => python3-ujson_2.0.3.bb}     | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_1.35.bb => python3-ujson_2.0.3.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-ujson_1.35.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
> index 36abb7ea9..be3dc8e64 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
> @@ -2,10 +2,10 @@ SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
>   DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
>   
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
> -SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
> +SRC_URI[md5sum] = "80d288c186dd02579e1561494b45aa41"
> +SRC_URI[sha256sum] = "bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3"
>   
>   inherit pypi ptest setuptools3
>   
> @@ -13,6 +13,8 @@ SRC_URI += " \
>       file://run-ptest \
>   "
>   
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-datetime \
>       ${PYTHON_PN}-numbers \
>
> 

--------------67A013B6BB854F35BD1E83B9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/20 9:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200522134007.10925-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200522134007.10925-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ujson_1.35.bb =&gt; python3-ujson_2.0.3.bb}     | 8 &#43;&#43;&#43;&#43;&#43;---
 1 file changed, 5 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_1.35.bb =&gt; python3-ujson_2.0.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-ujson_1.35.bb
rename to meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
index 36abb7ea9..be3dc8e64 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
@@ -2,10 &#43;2,10 @@ SUMMARY  = &quot;Ultra fast JSON encoder and decoder for Python&quot;
 DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5&#43; and 3.&quot;
 
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e">&quot;file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;42f77b0cce686dfa4da2e68480b1dd24&quot;
-SRC_URI[sha256sum] = &quot;f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86&quot;
&#43;SRC_URI[md5sum] = &quot;80d288c186dd02579e1561494b45aa41&quot;
&#43;SRC_URI[sha256sum] = &quot;bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3&quot;
 
 inherit pypi ptest setuptools3
 
@@ -13,6 &#43;13,8 @@ SRC_URI &#43;= &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;
 RDEPENDS_${PN} &#43;= &quot;\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------67A013B6BB854F35BD1E83B9--
