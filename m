Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.76])
 by mx.groups.io with SMTP id smtpd.web11.25404.1598552289277063271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EVrSLohY;
 spf=pass (domain: windriver.com, ip: 40.107.220.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB/8I/vOlUuP/n45kr13KdxjNwTYCH1xwBlOPZ99gCushuU8UHogp8Z+fjzRgx2r62F4ZmfZfz06IWCd2Nbh2w7AOgHZwccMfLyfOhDwZgNBT87UDiEbw379vZLK7R9ZE+sPehZ6Nr63XG4+SOLsd60z2KtGyIy5uUSAKjtM0cULMeyc2Uuh/uY8AI9+41mA15buR6sb0Hj+oP9xt7s66sdLly/22qyq5+pN6ehppyljwowCaKKK/tZ5iUwVHKw0xgd9A/OPr2TQietkT36al1M8w9uiRK+Dfgk+ZUcw//S5WLggpm8l1goilTFyCOIWl2K4VDeEcPKh4AKarwElBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f58DkZz1FtCl1Z4aVfb2mE5S9JJ1f876RViY6v+uAH8=;
 b=ak/movXHUDzehn4GuNOgsWitA54ei7pdcG2eYSNJl55vmfvGxfHSC4gyyE1s2dE/Sya33ZQHkRmcV8//0bA7W15EoiAIKg/5crkgvW7Pln/13gLFzYkUNMdOxj75oOehMxUFeen7pv9eOwFcPu3GKHnfQYfQSb4UsfNsLIqf3/yx9eRX3jmz6bGrQllFibOvJnhXDONPGbepKx8etIyM8KmDQJc/Nz9CDZBKiMjgK0a1IaCHw71Eke/gS6iAhx7RUTpDgCCOccm6f8b4ITtj239B2ipMt1lC/YuTgb6wYAsWX469up1qeeAoX1yNELG3m97ph3t2L3TmFVcKhM9nhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f58DkZz1FtCl1Z4aVfb2mE5S9JJ1f876RViY6v+uAH8=;
 b=EVrSLohYe2A2idQHWvXyUBF2/hyRm3UsahFLAFmZGP2qfEd1EjAHuShTD9k5xwMWbwVY1PDkEcvu/5CkuvrGwxufcOrOqzwdV5rbrUuQCm4QnLNJDcZBsNL5KVjKDOmMDH9EHDxucDwMRCTbaC8i1ndAtNn4majVtZWUh5QtG8c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 18:18:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:18:06 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-sentry-sdk: Upgrade 0.16.5 -> 0.17.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f212ae07-6dee-8dba-e61f-0820079df590@windriver.com>
Date: Thu, 27 Aug 2020 14:18:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:18:05 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a808b06-ffbe-4477-0f80-08d84ab58b30
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2952479D231EB08D799892D79F550@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CcjPquH+Mxr3t36vPTvCFxsb8R8ILRnSBwINfADBo03Ji8y4YJ9puBjm7/q5JKgDD/4wqVazgtqXLrUSinI/qq6jvZDEgvcFs8/W7fMmOpHfNdugL9fjZOZ+HSKYZB+Ep8T3SS4WmEcbRqIwHjBDrfMktRnKNGlF1Jn+gPRYq+0dtACuhllhJrwRXjPWZsgtldEBYJKq5PYkrFL0OowGsfoorRbpHJvG8sP4AWWDUgbFmoV2RQOWo9xFX7vdLI/ob8gfazdN9EEteEs5JKOyKChMvw8PMJUdWkNJTwQlkTAq+GRDK6qPWa7gBdpzaT2k7g9OApgGDTGgqIJeS9HZt1gkT6/1lE9UCcIq3c9aaXsFmfbQF1e1DBiNqsnC2m+V+fHoBbRV8YOtTv/Fo8eD3q+SP4LOxePE88loGZG33Yib1mATke2BbvsL5tQJGQiSLk5dNqBJp7t/RdQvR99B5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(53546011)(6666004)(26005)(316002)(52116002)(66556008)(86362001)(66946007)(16576012)(166002)(66476007)(33964004)(8936002)(8676002)(966005)(31686004)(31696002)(956004)(478600001)(44832011)(36756003)(5660300002)(6486002)(186003)(2616005)(2906002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hFuAxsvRnt92D0QBFG5Eya+e4x3W5Y2Fp4QZSOANNMyT+eUeLVF0O5k2uB813FWMfRXfk9OcaF/dN0wUiNDnfkwALEZHetqW/XNymO4trzaxlMgeeQ8h6sLgJg5/F0t64qH6wJK5anRYM8vInjpVp50/UwerM9uqN/cff0IDWoWrAHc8WGrggs7p/bVaIoYtMY+XK77HTl0onHfwQ0QBSun9AlMMpVCRuHOhrLqCZWRxVKxFQVVrl60wYLVI786Uhrk8zRK5UUecobJIRdfr1VU4MK0gNV+jGULC9FJaRGF0A+7iMBfpFOPNaPdTvhDfJK0r7P1det8xXTKSJ6sWsyNcUCIbdDTltthHpB7L8tXNwd4yy5ZqtRb2mumafdOW4GN7/Eb/kxo489ENzoRg6hCa3DLnVGp1jR5vAiQdfjRvvReUOfTAA6ywns9/KEYpel4035LO5sdwYXKtsKk4OsxbcSYEzbd5hT7su/hOrHmzoXJKvirsX0WYo7HAsClaLlaxkPYGCNeymza6hsAzRb3/t6nYyiUUmr7AV3qTeozm76TbqXkw6DouPeB8wQw+/MQ3PCGu6+9DYi5LF+WALx/434WGVORxuCEiNOHDkvn/Hrepp3iiuAD3pvfxyvXX1MYmvyA6JhgB0ns00w2vdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a808b06-ffbe-4477-0f80-08d84ab58b30
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:18:05.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftVtCU8p3YRiw+J8+eXK6zj0rsat5mBiNobnYO6OjXDN3lBKBQfbPPryCWAJ1KXncaom1fFVDEFzhUcAYG4N6NGdKNtnNM1GPoX6udym69k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------6C65406AF6EE3488969BEF0B"
Content-Language: en-US

--------------6C65406AF6EE3488969BEF0B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 0.17.0:
>
> - Fix a bug where class-based callables used as Django views
>    (without using Django's regular class-based views) would not
>    have csrf_exempt applied.
> - New integration for Google Cloud Functions.
> - Fix a bug where a recently released version of urllib3 would
>    cause the SDK to enter an infinite loop on networking and SSL
>    errors.
> - Breaking change: Remove the traceparent_v2 option. The option
>    has been ignored since 0.16.3, just remove it from your code.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.16.5.bb => python3-sentry-sdk_0.17.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.5.bb => python3-sentry-sdk_0.17.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
> index ad01f6f5b..340b5fed5 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "6d65fda758929b6a8d16e6030302c811"
> -SRC_URI[sha256sum] = "e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334"
> +SRC_URI[md5sum] = "5806e450b2a4e341478411bc5d5cef31"
> +SRC_URI[sha256sum] = "09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------6C65406AF6EE3488969BEF0B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.17.0:

- Fix a bug where class-based callables used as Django views
  (without using Django's regular class-based views) would not
  have csrf_exempt applied.
- New integration for Google Cloud Functions.
- Fix a bug where a recently released version of urllib3 would
  cause the SDK to enter an infinite loop on networking and SSL
  errors.
- Breaking change: Remove the traceparent_v2 option. The option
  has been ignored since 0.16.3, just remove it from your code.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.16.5.bb =&gt; python3-sentry-sdk_0.17.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.16.5.bb =&gt; python3-sentry-sdk_0.17.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
index ad01f6f5b..340b5fed5 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.17.0.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;6d65fda758929b6a8d16e6030302c811&quot;
-SRC_URI[sha256sum] = &quot;e12eb1c2c01cd9e9cfe70608dbda4ef451f37ef0b7cbb92e5d43f87c341d6334&quot;
+SRC_URI[md5sum] = &quot;5806e450b2a4e341478411bc5d5cef31&quot;
+SRC_URI[sha256sum] = &quot;09cbc253c827a88064c5ed548d24fb4294568bfe9b1816a857fa5a423d4ce762&quot;
 
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

--------------6C65406AF6EE3488969BEF0B--
