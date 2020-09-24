Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.86])
 by mx.groups.io with SMTP id smtpd.web11.26305.1600976728250316581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lg6+MiK8;
 spf=pass (domain: windriver.com, ip: 40.107.220.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al6UWhbyHdfClf6P0Bxl5ZkhMuW8GBmd3N16urQ8GqrCOralW8MWjfeyZYP4McnFRi4ZMADFzz9d8sVIQYL9DmXQYGhpWg3E0WVkVGdyt97dnV1DwTvb5KTIM7tAc+W3g+th+BKgPVf7gxlx5S6mox3ulomEtvAT2cR04fmBWJEaG6HU4+rdGHHikERQdpPl8Yt8n5HmkGpMxqdxPnj3N3qAlC+9ucAMYptVSEYup4VV5o1QqdE+NHz+6X5jqvSzOn2lN5baNpgZ74lfhEzlCofA3kh2ZF2wj4j1tOXVU1W4mmqrsQXHzINZyd2v/NC180uIDEtMJ4nlH2fnpHvjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KwO7uw3dGo/AHdsIyR+zpAK1Hh/LxzEQ2g/mGc72x4=;
 b=Op50oS2pG2O2DL6HV04mEVST7KN6KvixxHKI4JwHCHzfY+Ahp9NaY22hwJVJ5Po8UH4dotn8S8ggAr9Hx/QRYUIva00AmnBDv3d2oYBBNNPXTlrVhPOPqVsaV1/zkAvAAd9iHs/oU7My+HdpzZMl07qwNmgMPwkwKLZ8j5ZlR0hQWPoBgCHR3JjLuGqaK13zwAxjREyUvmHBneitzPXcAJnRlGapBH/jAedvfJxXs4ik27SIu+n+7I8LQglhSGyrKLXDq9Kpv3b1oOVc6vKouaPk5ySMVjVuzW52k1Ut2rt5+g3NxGPu+6NMh5/1yg3IYQFIaQXG2vsGNKuyDyKo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KwO7uw3dGo/AHdsIyR+zpAK1Hh/LxzEQ2g/mGc72x4=;
 b=lg6+MiK8UTqGL2eXf6SlG72jglwarbt3VNkSuAcPG2X0M9x046rTc8uXxVDvkFDJLKEgK7RUDLAFVE+sAaogvHEybDiGGneqi6EveiAewCljsy4OaOT1ZLJ6IolwPXyu0WLWQZ0nb1s3aZkVjOk4WebB60WnYhCLBqLmV9nzvpQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 19:45:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:45:27 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-sentry-sdk: Upgrade 0.17.6 -> 0.17.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0cd7d1f9-1125-cf91-d885-27df8e8769f1@windriver.com>
Date: Thu, 24 Sep 2020 15:45:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:45:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5a042f-d1ab-4ecc-6a2d-08d860c262bd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3559:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB355934788A6289B360E61B149F390@BYAPR11MB3559.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r1UuR3qi1c4Ngl6lS6VIkW9VtfMDvwM5keG8lY3LNkxO3Qg7mouq75OOQ82B3xEJQZy4SfRinjHUFwj9Lf5UcQtcSnoLVFCQ1bm8rkj4xn+IIHIO/pWrI7ocAKR/o1/NOWmAzm8Ms0Dqmd6M97UXxtloSHlfK1MsFLMWezvuVZiX97NmVRionqh10iNUFT7EAKIKIYuHUDsZLjUEoQwwCnIhQN7mxoE+3iQ8VXI0Znjz8VwqQavUP+V3zvtqs71ATXo5c6VOGnAbbDcIpS4QGACyaeemzrD/IloXVDLpgRk15jIHXyGJ1BlKXGWo0pNJHiFGezIcvLCIDvYsheFADCFZAoKB5PEH/fR3Q6+CDVwhpGZP/Uc5bBGQAk9MDl0C328dJwiabuAmtAOQWgSiuJcKaUsCEZpXZU0D9PdHKoWEox6n4pSgtZuWbi+oRRaGhaUmzPNLru03xE+IuVeg79leXvc4J/9kNX/FJi94nUrtniwOJc9xLr8AXdKDWdtg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(66476007)(26005)(83380400001)(966005)(52116002)(53546011)(36756003)(8676002)(166002)(33964004)(44832011)(86362001)(316002)(2906002)(66556008)(8936002)(31696002)(31686004)(66946007)(956004)(6486002)(5660300002)(186003)(478600001)(16576012)(2616005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Mxd3oaA1HrX/X1rCG7RKcANwhT7kFarLGKtU3hqY9ihujFNjhkbRfa6/7KXIHrb/r7In2tNWgBMlJbPIPB3AKD8YouZO3XFxN7FcVuNssBgtkdBeHD+dvbhtUQtZ6HAFpX9hevYpyEf8YdQipSROCebe8ajr16pY/kip5cKbswV5KvLr/vNVNVjZqtVPbPloDFnPWXmrpH7D6XSsVJBRUgvjHY6b9e/XoNoFrc5EmAeZFOJWodtCnzw2vCiV8hcg+7IzrVMsfuKZe2szVOMWbwxluzc7aId5Biz/dbRJl3C3vMVXO0k5KxhLUNBfRp31FPEeqvNyPp6zrC+lYP3AS/sKKs2Nq3IJyJqIkJPRn/A157u9dPND5gDUgbFZYAMi+XlvLucOn55AA74Bw7kMaKlPQpHaWldIc0uI6vpTrpL4hddujbU3cpB+aNIcae+7LvlXkY6p0S00qXk3KMBcKkQh6lKGSyrMpP7bAnQbuu1V/zQBa4m18nHpuyRADi5Dw/oq72/+Ym7spwfhmU3RMw4WTNB4YohxljpIiHd1d0bou0BBThcdjTpZaEUeltAyZo6Ik/pSDdxQn6QavOxeKyftt+yjeZFJtONbn1lMAPM3+r2eZXAfLts+AhN84edZ5xM412sNdjhUhNYs3xVNbA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5a042f-d1ab-4ecc-6a2d-08d860c262bd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:45:27.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VVVqPpLuIo/TmdlOypVxoFtr0rJR6J2rnK/KCgHYfg/OjD1ttd8oErzOz6ht19+WA9gBOaR1lX0cOnMHxHO7FEXZ6nL6GVoIcIM46GI19U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Content-Type: multipart/alternative;
 boundary="------------1CBF8E2637AA46D254A4F6A8"
Content-Language: en-US

--------------1CBF8E2637AA46D254A4F6A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 0.17.7:
>
> - Internal: Change data category for transaction envelopes.
> - Fix a bug under Celery 4.2+ that may have caused disjoint
>    traces or missing transactions.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.17.6.bb => python3-sentry-sdk_0.17.7.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.6.bb => python3-sentry-sdk_0.17.7.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
> index 5f566a8264..27f68fcb21 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "f48cccd128b10a9a4d19db89d1a74a58"
> -SRC_URI[sha256sum] = "1a086486ff9da15791f294f6e9915eb3747d161ef64dee2d038a4d0b4a369b24"
> +SRC_URI[md5sum] = "eda3a8d9aae8459ef6efe540293a9ca8"
> +SRC_URI[sha256sum] = "a698993f3abbe06e88e8a3c8b61c8a79c12f62e503f1a23eda30c3921f0525a9"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 
>

--------------1CBF8E2637AA46D254A4F6A8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.7:

- Internal: Change data category for transaction envelopes.
- Fix a bug under Celery 4.2+ that may have caused disjoint
  traces or missing transactions.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.17.6.bb =&gt; python3-sentry-sdk_0.17.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.17.6.bb =&gt; python3-sentry-sdk_0.17.7.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
index 5f566a8264..27f68fcb21 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.7.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;f48cccd128b10a9a4d19db89d1a74a58&quot;
-SRC_URI[sha256sum] = &quot;1a086486ff9da15791f294f6e9915eb3747d161ef64dee2d038a4d0b4a369b24&quot;
+SRC_URI[md5sum] = &quot;eda3a8d9aae8459ef6efe540293a9ca8&quot;
+SRC_URI[sha256sum] = &quot;a698993f3abbe06e88e8a3c8b61c8a79c12f62e503f1a23eda30c3921f0525a9&quot;
 
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

--------------1CBF8E2637AA46D254A4F6A8--
