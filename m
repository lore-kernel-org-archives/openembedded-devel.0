Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.54])
 by mx.groups.io with SMTP id smtpd.web10.15696.1597154697417941721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m4byoczp;
 spf=pass (domain: windriver.com, ip: 40.107.212.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+/u9Qu2YPJmNfYemJoDgMJRq+D0HILXp4X+oUcTkZZrsT+tL6EaePC+52ZTtl/n3wACTCPjizUOgzIK45Gc1L9rOCYPvKzPKtVrAP8/ze+5dxz31cXJaSlW83kEF4B6gMYXuDnGFWNDLyKylHhvUqKCffAIIjQG42lIjCl+6QIVXBxX2Tglm8GMKkyVOEU52yZIa2WdGoFQ7EdMbPBmjLITVOwEZJ9DkSWCFXm1vRNVwqeAEdHpVNU+auLTRysWzb4Me83b9fh7ibigyOheEn4aAawNOptHJxzeHTkhAwtt/pSieALGWBZLvdLHj8+vuVsZFjLzAnkQKm4TGTptIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpJPjzXFqJbMkmQLBGlcX52n/d5R7VolvrIeUetCISw=;
 b=NQPbPXUPTJ07RRdP9+GuiNdgC+L7ztZuR+Irx8DK4zD0FeoZQ5KAr60FUaFAaJyf2RgeeNOmaz7gUFtGZphaAQjERmd6Vnn2208BBC3jGOLgUk1xQPVfYK4ODcRLUk6Q43Pv9eSNe9owBhQpYqmOFx6/aU0545ANdKLD82o3vGrZMSeQV14A0NRJ6WnV1B0m3WIOmfvX0XU/8VrZ/MZvzV6f6GBEDNNgxgqIqYygm9p7Kb1UnLyffA3mzA3H6iDNMqzPIW6VRdXlKrlrBtuaUkokU93QcqE9C8liEkOuPtMlzyZHcTGjkW6uNEjeJOz0vppZQx6IIk907Wvl7svwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpJPjzXFqJbMkmQLBGlcX52n/d5R7VolvrIeUetCISw=;
 b=m4byoczpA+hHYCvARY0odNoHr9GaYcumGvu6ocMixQh2xV0zJXNKKAvUVLdGM7KkwxheKVhowg86XPSMPYMILrqxgg5IGCSckEgkXqU07vEP41I1Zn5Eolbs/jQ257m/xewgKHv/xS1+poI6Vlf3FyBQDoofAWqappLOfHLWolo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 14:04:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:04:56 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-wtforms: Upgrade 2.3.1 -> 2.3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <531aac59-9652-f56d-2dea-7ea090033f5b@windriver.com>
Date: Tue, 11 Aug 2020 10:04:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 14:04:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9556ce-8ab9-44a6-9703-08d83dff869e
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2904B7D75DB461FE00A0164B9F450@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DbBjY0xJWu3IcCuVbFYVsWV3hlavF0DSaj1bBRjbtHWGxXzpu5zeRrdfv/4atcQXd+CdGDT07ii0ptVrJ3617930/idguqCIfgPWFnw/S2ERaUNMTc4dNsYUaiv0Bf8vZaUq3wjp3MpMy89QmGowWssZiHgm3EgFLZuxoIqPIR46plxFvKM46ZKaMHSahg8KaM2sC/sxV3bpT3xcQW6F3Cq6ZfTautRytTEC29mEI2uxJPWojjkVk390Wq4JppOaayfX7teUivIOaHH+YKzxb6u1i8mr5zWm0L7NRQsILnOQ1UXu2VWprzC1Z0R5xHcPC1iZ5+jzRdzWvBbLZe0Lg4f/HxJR1gTpNh0FmcNcD+CJfOBh1VVT5LpwPkmtg7Lh0skTKiQ43b6hKPbenT8EZiVKHBpCT7i4TIwcHxUXHslqgdPzGizCD4CnLUzcchp0HR4vsg1huYSCjEdGHMxH6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39850400004)(366004)(136003)(346002)(966005)(86362001)(8936002)(166002)(8676002)(956004)(16576012)(83380400001)(186003)(66476007)(66946007)(2616005)(16526019)(478600001)(6486002)(31686004)(26005)(66556008)(5660300002)(2906002)(36756003)(31696002)(52116002)(44832011)(33964004)(316002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	W9+46R3vjAtXZ3RuqX32YrQcr6yuw0jWbjy+Xw3KQpNNfKmvuSYylnLaktN/hSyP2PJuhQZHwDlzjQYDxTezSbbnNtYcWK8QF1xgUJHHXf0mxgVb6abj8obtp/Yl2iuBk8LZqVxBPDLu2xQ7lsL9OKEqxo/xUl6cXCK7fq1NJkpDbAWpzTz0OGr8LfJNZay8e2W7d75qondEmLPFcXxhAPHXRCWDuVTt9Zo51nxd3VNVWS+jMJA9r8qo3CvbyiRSfzUf8sHKhoJly5YNX3sPkonHv6NGZCSuPka+kkGfW4CR8YHapWyGlWpi/KIrAdiCfkvS9QwwDkrTzRFqYwhIcmW7cJ91VzR4YJZ9e1Mn8rgOuaVZWgtYD09dATl2GbVaAIfxC2YEcoy+vKxb8c53mnFqYTkBw6eoYSw1hEuDp9oNf2krMwxUGqw5XHhKkMsXcU9T2kWiLkbGQjLBzomdmCLly3/CA2wSwyiuS279QXAmj/UbQkLIl6VPzA1oLa0Lqqdu/unWuJB9sXGXux8+CVlt/43smlUsQ2cOKf8W2CcMfwrYJTcYWnUs0ULoCJ4Moj7YfAIEU598U+ZpcpPs5W6jyW8D4QaVAdx8fNynH4yD2DI894YJNEz3R3ckHZysl2DnxcEVqp5DyvcrSVhF5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9556ce-8ab9-44a6-9703-08d83dff869e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:04:56.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jN+zi7hNSP9XKxngoJ436/Q3Wt2cXf23GnDiu1XntCCiKkIBy6khrEOXmf5jhdAuQ4FjTyf9br5zhdJjQPMyb5mBWrqghAE5J4p0F69LXvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------985842BABD76B0794D527FAD"
Content-Language: en-US

--------------985842BABD76B0794D527FAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 2.3.3:
>
> - Includes the missing translation files
> - Fixed a bug with SelectField choices shortcut at form submission
>
> License-Update: Use the exact line from PKG-INFO. The license
> remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-wtforms_2.3.1.bb => python3-wtforms_2.3.3.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-wtforms_2.3.1.bb => python3-wtforms_2.3.3.bb} (58%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
> similarity index 58%
> rename from meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
> index 9f081b68c..a6e7a5b2e 100644
> --- a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A flexible forms validation and rendering library for python web
>   HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
>   SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=208ce1c159f911ecf389806650582021"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
>   
> -SRC_URI[md5sum] = "bff06943e59671581af07f80d14bda5f"
> -SRC_URI[sha256sum] = "861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972"
> +SRC_URI[md5sum] = "2b6ea167a71c6becf20f0934417fd06c"
> +SRC_URI[sha256sum] = "81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c"
>   
>   PYPI_PACKAGE = "WTForms"
>   
>
> 

--------------985842BABD76B0794D527FAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.3.3:

- Includes the missing translation files
- Fixed a bug with SelectField choices shortcut at form submission

License-Update: Use the exact line from PKG-INFO. The license
remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-wtforms_2.3.1.bb =&gt; python3-wtforms_2.3.3.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_2.3.1.bb =&gt; python3-wtforms_2.3.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
index 9f081b68c..a6e7a5b2e 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
@@ -2,10 +2,10 @@ DESCRIPTION = &quot;A flexible forms validation and rendering library for python web
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/WTForms">&quot;https://pypi.python.org/pypi/WTForms&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=208ce1c159f911ecf389806650582021">&quot;file://PKG-INFO;md5=208ce1c159f911ecf389806650582021&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d&quot;</a>
 
-SRC_URI[md5sum] = &quot;bff06943e59671581af07f80d14bda5f&quot;
-SRC_URI[sha256sum] = &quot;861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972&quot;
+SRC_URI[md5sum] = &quot;2b6ea167a71c6becf20f0934417fd06c&quot;
+SRC_URI[sha256sum] = &quot;81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c&quot;
 
 PYPI_PACKAGE = &quot;WTForms&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------985842BABD76B0794D527FAD--
