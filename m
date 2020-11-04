Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web09.13890.1604501243628539966
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WOVwoOSx;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGG2/SZjRNefb6OJXWKBholeXc9xLiPDxny06oeXiMPEJ9oCG+njwFahYVieaNGwL07+4BFsrsyc7pojwW2pnSrkmmu0V25WxgmJ2AR8kSBfcwbJk1s34MeOiK5h2u+HWzzq0nCY99NUI+Syfww8ndGEJruKgHedv0t9WrRvERPcxEFfG45wLXXc/8Rm6vkp+TqPQO2Cu00RxgQJdTcTNPDncF+noNaobhI/U1FAJKJso5dqpjptY4IvD8S6yDKKr98pbATrlS3XisLVMf/o9BbhXRr1t1QfvhNM9L4NSouAV2++HxwsEa5c+Fzfalxfmmz7VEEaygIVNS1D45N1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qELpdZj1zvZFGWNiHIcFN8Z4eIdp2O4dWivmnlm5bR0=;
 b=MMd1+hyJ+4aspTc9CgRJFNF5yYG3+2DS+4YpLDquer0NF8qwlqpBjkCD2uFQsTJ2cReWGfOE4z130TS7Y/fiI1MyBUNFa915qwZYOMu+ucFUspPbw9Qip8vz1j89RlAxjKEUIeEuRQNm0mnzhZrIoy5Rwk5RF4GOQ7B+Xa2jvnSpQESlCfcqESV8cjjK8LlNs7VEL9J5Y9ACTqpE+hd8SG6cLUn1T8hnZ94meNxMozn7DtCEG+YyecaVkrp5WEA0toJgNCGSN4HrTCMoBrmzxOtGLyNlw3fnzPxiUAtMP5Se5LDJ9axP5ddWwv6OPGkQv2GK5AQqH8FM6W0OOIF5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qELpdZj1zvZFGWNiHIcFN8Z4eIdp2O4dWivmnlm5bR0=;
 b=WOVwoOSxcbAEPzZgTR69u1d4OXoctmfQ5Kk8tQxHx6CoOVbGXxuXvM1ZELZoefldR6puk1B/16GK3sDGiFfeG+KWQPpQQzvvpPpA+kz4Y9q0JSW6A0nzn+OoHP7eCNGMHjMBwzekvKu9Sah/8jxp9ObR3LhIwaDtOhRTEDPNwgE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:22 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:22 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-regex: Upgrade 2020.10.23 -> 2020.10.28
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201030130840.9169-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1cd96fdb-5803-2b8d-5a3e-e29c666f2fa1@windriver.com>
Date: Wed, 4 Nov 2020 09:47:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201030130840.9169-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0019.namprd20.prod.outlook.com (2603:10b6:a03:1f4::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:47:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5775272c-ce48-42f2-58e7-08d880d0899a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085C3220F67CC40E6A16DC29FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JStL92VsN8iOy2NmnPUgFMHb8YPfRBfwZ0EMJ6+F46CZIwwRDjcNP88xhR7ItXVG1EXt67GM/CByB7Flz3IzjWC8KhVPZroVN7Eas/hf98jUVFnAoJBC15ZrlnMftR52a8CrjvI4h+jJdLHEBOszHDXGIsM8JW8UipakKNac8H6/EOuWeS54fwbBUPe3GFVYFzUb+mLzACyta/f5qQXbIW7VWtIyYaA6P9De8X5L7E5lKWRSOUGDUP+4KtGqGZh3hx2GZ5iXzK3XkKxgkYH4kveZ125tBK9UmpqWTFzCSfprHRC1sj+0Jyy26RR2mFBclZb+LARtiKoxVg50JJ3DfExe5GTMhv7sYubbxa76j5f4/Lt+BeeFwm9pGOY6AgL55AI7i4svR8LwLl3VQc0aQib2MpkNazpdezi8mS5giE6mFX7gEP0UpaWsBMjrefUHm/Ak0OQSAHdnmyTZ5KFpJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gVUML4cZc5I7SWokxCiSeL1xx7T/BC4s5Tj46PXeh6DtMdIASHHO1m2T0KQF6lVyracR0y4PxhQzODVzeEfq48r0g+WZkf/Ht93lZxBByy52+2aVWuOt2vT158ZvZ9w4+K3PcOXlNy0Lv2WYYSSnzVsne3y5vCxWDcZ9GaQP7TACNLAQPcj8Hd6I2JbV+ltmBDLfDEEanzlfLW1hI3kH3f1iqnadJxqpWPY80fGlnMlfa4DQ/77etsXaiIDVQuXzmoO7wUB/Xkl7AbGlx1sDTVak50TTNeHhzAuKGWl1E3o/0n07RP+CY3muD3hKfMNgMAWAVt8smZL156TKFzeTf/iK5kWOtHI6RgunW8debA/Auwx0XiG9rloIFscTdhKMzTxPMHkK+7pERA48/XQ6d2dn5ICtKAxFhhq6zxGtzdxRo1tPRDovE52xnJCi6O35Z3hSA/1Oeaz1Wik/IYuSYb9/OkrWSGYpbp8NUjllZ0cUcTzk6IU4KpIUD6E/FuQHFDN60yB4RA25B0dUFtfOLTsLFeXqXnH+SsDw6IE7zdpHQlB8MoIlkbK9JuSTuFaHc7SWr0HlmxL+A64ufsOSRUvv+7ClVE7xdbYHaq+Qu6eUOT7mVzM+bn6b7yixfEuEda7nmqYh+/V9rk0EOz8S1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5775272c-ce48-42f2-58e7-08d880d0899a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:22.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEwqCDzyjNo7DSuM9wFO2As7s6t4fTatpv/VfnhDn0PJiOP+NLvByw02bMA6LB+RHkhmsXY0U6UxGzrymI8HjrqTLDwB+WfFg3NvAHWpJ8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------60BF7BCDBE7D750861FE78D6"
Content-Language: en-US

--------------60BF7BCDBE7D750861FE78D6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/30/20 9:08 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2020.10.28:
>
> - Added Apache 2.0 licence file to the files in the git repository
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-regex_2020.10.23.bb => python3-regex_2020.10.28.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.10.23.bb => python3-regex_2020.10.28.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
> index c8cbdd11f2..c3cddd8f15 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
>
>   inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "13fb62a1b276623e38931f7217f080d8"
> -SRC_URI[sha256sum] = "2278453c6a76280b38855a263198961938108ea2333ee145c5168c36b8e2b376"
> +SRC_URI[md5sum] = "8150da7f676e73751b4e3c7b1ba79a34"
> +SRC_URI[sha256sum] = "dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b"
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------60BF7BCDBE7D750861FE78D6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/30/20 9:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201030130840.9169-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2020.10.28:

- Added Apache 2.0 licence file to the files in the git repository

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201030130840.9169-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-regex_2020.10.23.bb =&gt; python3-regex_2020.10.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.23.bb =&gt; python3-regex_2020.10.28.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
index c8cbdd11f2..c3cddd8f15 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0

 inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;</a>13fb62a1b276623e38931f7217f080d8&quot;
-SRC_URI[sha256sum] = &quot;2278453c6a76280b38855a263198961938108ea2333ee145c5168c36b8e2b376&quot;
+SRC_URI[md5sum] = &quot;8150da7f676e73751b4e3c7b1ba79a34&quot;
+SRC_URI[sha256sum] = &quot;dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------60BF7BCDBE7D750861FE78D6--
