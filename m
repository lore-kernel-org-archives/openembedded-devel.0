Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web11.10226.1599060578755860969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jl130x/9;
 spf=pass (domain: windriver.com, ip: 40.107.243.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UK61lwESHh4hP7Qpo0aC638lt9guo4+9wGr1qbUVGX4OpXMMUvWx7mmEHG1lUyA1EmLdbJL6piV5nxCry/oBxf5ivkfH295U5sfZh3/IJYKUZ3qv+jqvEpi2407Jo5/aKWiFOXPDS+rk3MJfisDuhx9AxmcBUvikO5/8bF0Fx8p8yD71rS5aXFWmWFG23XpR8LZt+JU0SmJAViBsapr3dFuoImjMLXxXyrhtWoAxy9i2WVHeYpOmekbZEscNk1h70hk731fNDh7AEeCGj+Cz04tK257kMjpvLxbJO5GNWdddU5Et3QOjQZtPhwo8A6uDS3OmmtkJWtGXJzx/PJ2j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auh6UjX9xNtC6JiRx2i+w3Y06VUdV8ZTi6QKasnY5vk=;
 b=K3kxnsTzEuRZkMtxcDhM5DvlG+J40HG/UKhYHZAFpKZTAe+eQgMLtrPLk9kIWpIyCJjO9mqsIL9sAZIKmJKUfnM8miAhkvwFpS4u2mT2bWDHqGZhSwfsc0guwuEhjo8mQyfA09bEQV6w3BYPFMwOrr7hh2Z7aPowIduAKq53Nkq4bwrPwOjd47ILVwGc0v2gtAKDLxV/EPcg51/RF9hMYLo0/Ft8cyyvropUEY2Owpe6CbhnNM2V/mCDe7Po+w7AgKtA++way8gwT2dBNq1ZO/eR4CRLl8aqxXjRgNbJWOe3pYcgRAiCjboGX0v2CNozyj2zAnaJ9o7PWyBQoFHRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auh6UjX9xNtC6JiRx2i+w3Y06VUdV8ZTi6QKasnY5vk=;
 b=jl130x/91JKef707TcIoayIOiQ3C20YFNYY3LuCdvh80YR2V0nhHVRz0q6QTmh/kU+nMg29MZ3612i8YVhd/MQuUSPQnQmT7VIHtyQ53OEuJBthG0Byfm5VkeAOHnohN5Toe5jfKJkFtCfpNA8UZ/DadO0OcuEqL5xOiPZTHCzo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3815.namprd11.prod.outlook.com (2603:10b6:a03:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:29:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:29:36 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-prompt-toolkit: Upgrade 3.0.6 -> 3.0.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <258fdc2e-7d11-c626-723f-a34d94ed962f@windriver.com>
Date: Wed, 2 Sep 2020 11:29:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:29:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208a9fbc-230d-46cd-6795-08d84f54ffed
X-MS-TrafficTypeDiagnostic: BYAPR11MB3815:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3815938C4D843F4B10DF857E9F2F0@BYAPR11MB3815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4UD/+SBe8fOGNWsHmV05lYzu1WNtoDdLd3TXoiJaJ3zGDhXAwvpQxunxNgRUDJ0Z9jFpeIsYTXS5NSY36gVoT5sUAvROAXJ3WNWHxOEYznj1szfnY1j9c+hOwSnQA6mJcU68+CfNL/GLt+/X2y856Zws+uXnXJgttTrWIYHsALfI63poTm2pL5ICUCPq+YriN70Nvi5AqGWZ7JKHe+/rH+GnG5xcrmZUg/RWcJiTTgRDvar9niMjXBeIqXKr1EIzvgLTO0iZ1OITdurEhpnnstek7qvXOq6puZbEPWpxvR+eOxEAAizjO15M9ypt2Iai61KgQO5TTn0oYmKxFwYgZtNQahfR6BgXMJmgHbHekpfRh+XR+gsZIiyrcJPRAlyii2vLY4HagEyEA8GTtKuuRslZr1KgU/QR61M/a/owrGEJTBXlw1gO0u75DM6/TPrsb4AKXPrsDzGanbc6/9xLlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(366004)(376002)(2906002)(31696002)(86362001)(5660300002)(36756003)(66476007)(66556008)(66946007)(6486002)(166002)(8676002)(316002)(186003)(966005)(83380400001)(33964004)(52116002)(53546011)(2616005)(478600001)(31686004)(8936002)(26005)(44832011)(16576012)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8c0dmHOu8Dg++Fkco1ZSQ8gaRlUOqAWmSxytnDKDlwiIOe68Ujvqi0+HzzCgBxmaUNCeF0OeI2LAnGcidGd/rtVF3kgZMEeUI7MrXvn3wjxezt6/D399jr2uBXeJiLOkHCGhRgLfY7XO2SD6xGrtMqVAWgbLnDCR9g8J6WK6lxuyUHyAL8BnCbttcJL/ZjSsGAUzl0IQquphGtz/IdJZ7xD+lvyHkCFiWTU0xZkwvUOkQQvLBJpaLKtl3QlUEiV8zHcf4EL1ci0myLUCqPbVWQuFP003jhMOdBUK83Undzvbr4fURCnAz1mYcsIi5GK3Drok6RLEi3LIOA8gk9tIoP5XzlQHLWadwSB7Sx6uspwYZWRmiNfdTCmSMa/kQBAkvw86t8PIwOpPEfBHp+mffZISeDac9q2R6DxUgbHOpzp4+hIG1YN/wkgGh+a3bvWqA/j/xT7hZTur4Bk373luzvFnIkI33SzXjUw9SvvcFCrNx7Zwf2hL5NV7fqf+0ipI5LdkTliaptOVzjxdtbqZotK8HOE7WgXg3l8jxVnUNKOWBMzaePrxZVCekgzp4yTzCDZe4YGSg9/QffVb9Pu1axQHhBybmmwQzIAvaPOhuP5FR9TI0QEleTHlSz8aJP4D+TjY5JMfJsqXPCS0yeuNJA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208a9fbc-230d-46cd-6795-08d84f54ffed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:29:36.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqXbEr0nqVIDEQEyB7PZL+Sqas8FAP1kNrrogTRXy2sfA9klbfAqdLty8MdPCxkKCSLm6yGOIyUkadPhBcaHBMr6/uyX5gxo/u0ZTzGcueM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3815
Content-Type: multipart/alternative;
 boundary="------------C92021D3E7062C04486908DD"
Content-Language: en-US

--------------C92021D3E7062C04486908DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 3.0.7:
>
> - New "placeholder" parameter added to `PromptSession`.
> - The "respond to CPR" logic has been moved from the `Input` to
>    `Output` classes (this does clean up some code).
> - Bugfix in shift-selection key bindings.
> - Fix hight calculation of `FormattedTextControl` when line
>    wrapping is turned on.
> - Fixes for SSH server:
>    * Missing encoding property
>    * Fix failure in "set_line_mode" call
>    * Handle `BrokenPipeError`
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.6.bb => python3-prompt-toolkit_3.0.7.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.6.bb => python3-prompt-toolkit_3.0.7.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
> index 806e67c09..7b0d1a069 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[md5sum] = "e50cb328715b338480d8d29dda54ff5d"
> -SRC_URI[sha256sum] = "7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6"
> +SRC_URI[md5sum] = "f1b34c688ef7dccccb951130f008f6fe"
> +SRC_URI[sha256sum] = "822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------C92021D3E7062C04486908DD
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
    <blockquote type="cite" cite="mid:20200831070318.6573-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.7:

- New &quot;placeholder&quot; parameter added to `PromptSession`.
- The &quot;respond to CPR&quot; logic has been moved from the `Input` to
  `Output` classes (this does clean up some code).
- Bugfix in shift-selection key bindings.
- Fix hight calculation of `FormattedTextControl` when line
  wrapping is turned on.
- Fixes for SSH server:
  * Missing encoding property
  * Fix failure in &quot;set_line_mode&quot; call
  * Handle `BrokenPipeError`

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.6.bb =&gt; python3-prompt-toolkit_3.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.6.bb =&gt; python3-prompt-toolkit_3.0.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
index 806e67c09..7b0d1a069 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[md5sum] = &quot;e50cb328715b338480d8d29dda54ff5d&quot;
-SRC_URI[sha256sum] = &quot;7630ab85a23302839a0f26b31cc24f518e6155dea1ed395ea61b42c45941b6a6&quot;
+SRC_URI[md5sum] = &quot;f1b34c688ef7dccccb951130f008f6fe&quot;
+SRC_URI[sha256sum] = &quot;822f4605f28f7d2ba6b0b09a31e25e140871e96364d1d377667b547bb3bf4489&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C92021D3E7062C04486908DD--
