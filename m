Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.58])
 by mx.groups.io with SMTP id smtpd.web11.10231.1599060587608682947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SNYhXQzL;
 spf=pass (domain: windriver.com, ip: 40.107.236.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNJqwAWuueO3t4IdzwIJg8nwygeuj/QQTNynrXiUkohK8DonaZ5PtC4PMBAV4XEazT4wC+tNCbvfVNMQD+JxX87/6qHTLISsE8jZs89LiPqOsz33sgj4LZzzlF8ZSBA8YDVc4dNAeQdbfwOTaRvDJI7H2WdO+hE8iZIdyDfxsgiqaFp8OZHE0Ue/iymseJ7STiidGsH3CnMuFhnY8A0EtutcodaSL/A5ikzi/kNvzk25d7PMVOyjXuq/x/wVUHjMZkK9Hwqe2yOXTFHl+4a4bfiq7fx1pGmSdN44HLQ6nYINjdiltqLrjpoqWF8jpzisYXEG5fBymiW2qPukKEpWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ2tH5fnAiI1JYVE1OpB9Fgjj3ECV+e70cxfiqOPozY=;
 b=j7klWQhTIMRw0KxagGYaF3GteHP12V4zZfvXTmcW1j9qgY+oBFrTb4biIRbaB2ZfoX3q/IU4Lu+mF1YpOQOccWHRq4BRVaerllKe3SCS1VMI6n9dFJ2G60dnC4pHbMNGtnWVc5eKcJTn9Pdegd9B0A5e+MTjc/UTyYBOMinqqKkIPcurrQ/WdiifqsNGpD/KshYiF+IXQxJG6xfIJRx6hZnpkmYyfevF7w1BCeQ2XObQDJGWi551sQW8tQrTYhGffw1sAap5xLZOWTQgqb669xq0HfosVJ7NdzRe24omNkoiG1baOG9O7c0H+D4D2OWwIXHfMX4K1yRoPQaHzyjkmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ2tH5fnAiI1JYVE1OpB9Fgjj3ECV+e70cxfiqOPozY=;
 b=SNYhXQzLYRh/j0d3ZlUX6ahXI89WbeILoAR8BGEFUMQ+G2TrI7ByNHPqmZTdTLEpVT6VM5eBUTMIyKr0FI0q2X2oAqd9KlKbKuWib9WVTw3Q7+Z1+C8zNP8RYB4xqE6Xgv3CJ30fRBzVnaw6rmA7uRzQ0w2gCeFWK9mET9bxxRw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:29:46 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:29:46 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-more-itertools: Upgrade 8.4.0 -> 8.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <63925898-75ca-2ed0-daf3-8cd335404cd0@windriver.com>
Date: Wed, 2 Sep 2020 11:29:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:29:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44d5ab0d-65d1-4d22-65b0-08d84f5505bb
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030A7775C9A9D01C0FD79209F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	byIp4g978Ufc25lUQmga9IPYz0ie26dW2lZBczNF0Z8IM5tw7Btc7Z2yByqTWKQNrBZIplwFFgmvJwbFYNNtjUP89egzwZD2kj/lt9ByELQss0EkAVOQt2xgRLHO1W1WOQ7zOoQY7AXWo7DRj6zwthqWZYmVVszo1epSmU1aChZBWLl47fpOpNAT9vpHrUzOmLs+/EEL0Qw69P+3m50L7KMIu07/qktJkH1BhWKqJ6N1RsQEHUTPVo6ZoX40sobv0JYfs2XJ3gjNbdaiOB8unhkAPz0KDk45mS7VjQgcRrtmkJwcptLkOsKbclWs19IBqI9HNfPoMueFK6Uhs97ZmZbuUDjCzYSCqeJNJlDTvwGMJDNG4s/2La0h2owrWOn02U4O79vHp/NvmLslmJ7WmOAMvCptzgJzYVhoXrfXGR1jZa8C4Fwl9wTNiXbAqMQPqVcELynjHCjq5z8a8801Pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IhB37V0MAYji7R6opG/tQYzHGJELyY87T4Zb/2qZgqFYb4xyNTD6ZA0NTMyzd6WANZROSArig9ZlFYNT2G3vS7/060DWsT8xCEBJVwHZtsYDmjGrXRG4trPw6dqrwFX086+7jNlHQWnnhRSzEKYNaGtdH0JRTr+ArZSu5O6GXZR1eri406sYAFSb2uK782wUZ1zm/hWg15ttuZIXrRWjMdOgQItc9VDNtIfgeZsYZT1VVoiFb7bG9IB6hGc3GCC51QC/GywZeQfwwDtVLXol3MhPB2M5UNEiBArDjJfVs60PUfdU6uWralwDM5Le5YTkOc1TVpSb1lwUoJWaxIlTQd6meM+FFf1gREnOtAv7P+oGm7j3T5vQGTwjgpOJQrCwAZr98q+5mtQ73bsVWalEbc2XHSG5iRRVxVFjQ1N9h3Onu9OGXVzPNIX7qHtcbR2flSe2qVDqEpFERDTN+rRCGSkAz5pvs4XBGAy5hCuRX/oNYD5hTW4HyehyAw56Wp84sD85290FgzooHXKLViO/CJvBYcSFE+c/4TSDvLcwSukVBOhDTEmv51WGVWTRwB2daU9nhUUPOdi3eSefWv9Tsr2bsJAFTOKGsCOR500Nu1DmohoEj9RPSWWLMTQS7geU+TSEp+b0jPFTNwczc/znPw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d5ab0d-65d1-4d22-65b0-08d84f5505bb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:29:46.2435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syuJPhGlVihq5T4baEhI4BnB1xyNRX7u9xO8sIW3gIRjR2utCvfyVAx/Qlz2GF75M47uk802Zta84YsvxnmvVPb0OAXV9Fo35IBH0sUy3lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------5DD72650501CC6D29CD8CD9D"
Content-Language: en-US

--------------5DD72650501CC6D29CD8CD9D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 8.5.0:
>
> - Add :func:`windowed_complete`
> - The :func:`is_sorted` implementation was improved
> - The :func:`groupby_transform` now accepts a reducefunc parameter
> - The :func:`last` implementation was improved
> - Various documentation fixes
> - The tests for :func:`distinct_combinations` were improved
> - Automated tests now run on GitHub Actions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ore-itertools_8.4.0.bb => python3-more-itertools_8.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-more-itertools_8.4.0.bb => python3-more-itertools_8.5.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
> index f040b1a97..e924b0f73 100644
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
>   
> -SRC_URI[md5sum] = "0912041c05148ed079984cff69af2e99"
> -SRC_URI[sha256sum] = "68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5"
> +SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
> +SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------5DD72650501CC6D29CD8CD9D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 8.5.0:

- Add :func:`windowed_complete`
- The :func:`is_sorted` implementation was improved
- The :func:`groupby_transform` now accepts a reducefunc parameter
- The :func:`last` implementation was improved
- Various documentation fixes
- The tests for :func:`distinct_combinations` were improved
- Automated tests now run on GitHub Actions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ore-itertools_8.4.0.bb =&gt; python3-more-itertools_8.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-more-itertools_8.4.0.bb =&gt; python3-more-itertools_8.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
rename to meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
index f040b1a97..e924b0f73 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;0912041c05148ed079984cff69af2e99&quot;
-SRC_URI[sha256sum] = &quot;68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5&quot;
+SRC_URI[md5sum] = &quot;2588b5a7042576b99574779582be9292&quot;
+SRC_URI[sha256sum] = &quot;6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5DD72650501CC6D29CD8CD9D--
