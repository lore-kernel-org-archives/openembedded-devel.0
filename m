Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.58])
 by mx.groups.io with SMTP id smtpd.web10.10582.1603898407145924918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oj7pyaX3;
 spf=pass (domain: windriver.com, ip: 40.107.94.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrJE3FBiK0vgcz31aFiPsjM+yf8TYMI6i+SxzjTHQKqsLBoKg6ABmV44jrMit2hCW9KDvIxqhlUrPP4CODelbtvWmOxX6JykISzgC4OIHlAzCo32C7DpBtBVgman8NK1gJxzdo4GhKdUorUjIbECW8AZjjkFvyQRmqfDsXvM42D7IeneSJPBvmnetAxlvAa7RUAV1erzExPKjb+eYPUVoZnYMsaaO9qw7c2ONIk0jW4t+PKe+oNRbJmBmTblrP0enFBt+tqDIUR3j8L3lmTpwShVsHWlkSDK6F84gHhpqwg9jNoLIbr/NKqAsE1XTKmO0yllbs+IY23iwu8ihkBKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqKHfCEOQcM/93MJKKtreyEBOEosdrAhx9ol0eSA4s4=;
 b=ZghSCbqcA41JluzURW489BBaS/JIVgPhK1d3SWWe82KYdU+LeBN0cIbZahAaNxUeGAvDoLmcl8rjVvVteRhCpVTUMWkZwYSNSe9uMc1oQVfP990c8OuhDOKdHVUMWlXyk5d6P+BoypNie1b+kO6LDAhorkuF/3NPvuBEmgagq2UYzeT9nUPtWZXiHEKiXIu7enbIb2oz1Ng4ZnZlkCZCR52vXwlduhSD3bbfceaa4vhayN4K8tNCICEOJERDsTXTs4HqNJyRjmj/LCgw2Y4DbRG4EItZ8K5M+0a2CAy3tHx7y6Zf8Jv5sXKuSCJZ7O6Uip0fgGb8lkLBrL+SM1Pvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqKHfCEOQcM/93MJKKtreyEBOEosdrAhx9ol0eSA4s4=;
 b=oj7pyaX3lIiFvY2PirLrX6CF2dT1rznXZ7BipA3UpHxfrCDZJ2jfc2nrbxIl/UWzP7YqDkW9dUDCLKb0qKK5CqdWFu/SH090mUMuwkgpzElLlXmGJY/MBTSP7EVgUtXhsU01FnmWsrNkShSc1Us/VWkojE7kvZo3Nh6Ew0HMYu0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:20:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:20:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-sentry-sdk: Upgrade 0.19.0 -> 0.19.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201022141749.14950-1-leon.anavi@konsulko.com>
 <20201022141749.14950-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <dc6ef672-93c4-13a5-572c-bc19f2d3e207@windriver.com>
Date: Wed, 28 Oct 2020 11:20:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201022141749.14950-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR11CA0090.namprd11.prod.outlook.com (2603:10b6:a03:f4::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend Transport; Wed, 28 Oct 2020 15:20:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed72fcc-7201-4927-7083-08d87b54f2f0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3189:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3189D663A3F360FD320F37209F170@BYAPR11MB3189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dPX0AykGK81LzKtDnbfNd5gjH2vKSjvDMi10bfktnrLzOo5yApC+KMJpt5cQEcZXJpCt6MALDwcfvZWWbrqUNfVKxjlUJZIi5mAmlH3m8tI+QSCNyJHCq62AbwRZxpOTyU7v2NCnyztn/IIvZHcU3UnY1RIJWCUc0LSHAmgmM3K/ipacKcnIohFD6dbnXb+TL9ua8cSkIA02yot7aC9y/Vxhjhqc48SYjMFXqEpK6MiPlYO43Cx7KMkND2yV2CxQo3jbs8s9oS9pQL+gucDu0El4E/NV9yzbHRCq9JshXhtHoFJwN/q5u88uQaYHxSpvS3T7LM+L3SNPecwABNR7TnAx16JISl/5Hfop60C2rBqHs/XoU0ZL8rUMfWcHED9EqHcPZCdioMP8rtiLf+tC1nwB5cEq70aFxK0h+HK95lwjsy9vWvP+Fyfc81dl/D9wAv5g888rgs5zzO7suZsRzw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(16576012)(66556008)(44832011)(86362001)(66946007)(31696002)(36756003)(53546011)(66476007)(52116002)(5660300002)(316002)(83380400001)(33964004)(2906002)(956004)(478600001)(26005)(8936002)(16526019)(166002)(6486002)(2616005)(966005)(31686004)(186003)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nH4NQL3uyyyRPxOOnuEVJ/5L8c4d/CDXYBRe+Q0kDRFsg6idG5Q3eSn58yAsaUEG+K2Lp3ZVEW94A0wlPPzdvlwdrwRwQTetCx06SvCQkkx0S8bJq4Kas7g9wb1G+cWreGcL3YCzr9jfxtekEDTqEyOlBMotHUqpxdchB5bwjur9vlmjlhRJfPJ4FyrZciye6e/rKDVs8QCBAAgp0swUw+fWnSZc0F3gc43AKjerwf4fSZ3lbbZbPClpU/oljZkjggXmsSa24WRVvZbCiEjB+Ga7LaEEYpkFOQnq9d38pPTdpUsCOfZvP2ZODvDvQma8Lp56kJH7UH/DeTFcCA81rTHI4RV+ldRvkqgSO5oBU5TkMb8ugyfKFYsoFTeOZvg+bH0OyyqwUBcbBRob9jYEq6I28SSiCLxiiOaL8FFe/SjKoaE/b30tx+vYmmjSsabxj06TcjtNSxrpSSuZdJyJeTsKdTC3VFk0d/0b1lL1CuW1ZLtEDs5OeieLLU1/Z5HmIBGArZqV2lDPO3diiNzxZ5TI+N9e9/08tzaz/5UCh2pIZzSsDi+hBJWyiyGbih0ndcBUA7/0KndP6PL5L4ulhCx6X2tIQqsCDnz8hTbhOfSidNBhA2ljqJ0NRw2fTFcCMON/CsoTk0z6sl/xLnlLjQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed72fcc-7201-4927-7083-08d87b54f2f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:20:05.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bex4VFGX/4SJAMjfE7fDgFfy0uZO8kg1ni7WWlF6MLLGafM7GwSzRxxzppJ2+3SgypJ12CS2pkOg4ZocBOxmswvsgHqQ++AaIlM1xehanMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3189
Content-Type: multipart/alternative;
 boundary="------------B71D9A914F7321679BF262D7"
Content-Language: en-US

--------------B71D9A914F7321679BF262D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/22/20 10:17 AM, Leon Anavi wrote:
> - Fix dependency check for blinker fixes
> - Fix incorrect timeout warnings in AWS Lambda and GCP integrations
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.19.0.bb => python3-sentry-sdk_0.19.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.0.bb => python3-sentry-sdk_0.19.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
> index b03e76b7c1..2da9908e34 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "5c988086e4c124380887b0d579081f33"
> -SRC_URI[sha256sum] = "a3716e98a1285a74eeaea7418a5b8fb2d7568fa11b5fba389946f465876a4d44"
> +SRC_URI[md5sum] = "1e6aabe30f4c86356d1d85a9beb0b05a"
> +SRC_URI[sha256sum] = "5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------B71D9A914F7321679BF262D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/20 10:17 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201022141749.14950-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix dependency check for blinker fixes
- Fix incorrect timeout warnings in AWS Lambda and GCP integrations

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201022141749.14950-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.19.0.bb =&gt; python3-sentry-sdk_0.19.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.0.bb =&gt; python3-sentry-sdk_0.19.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
index b03e76b7c1..2da9908e34 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;5c988086e4c124380887b0d579081f33&quot;
-SRC_URI[sha256sum] = &quot;a3716e98a1285a74eeaea7418a5b8fb2d7568fa11b5fba389946f465876a4d44&quot;
+SRC_URI[md5sum] = &quot;1e6aabe30f4c86356d1d85a9beb0b05a&quot;
+SRC_URI[sha256sum] = &quot;5cf36eb6b1dc62d55f3c64289792cbaebc8ffa5a9da14474f49b46d20caa7fc8&quot;
 
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

--------------B71D9A914F7321679BF262D7--
