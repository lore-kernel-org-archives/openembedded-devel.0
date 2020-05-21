Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.45])
 by mx.groups.io with SMTP id smtpd.web11.8679.1590075235167366001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 08:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lnIt+EEM;
 spf=pass (domain: windriver.com, ip: 40.107.237.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA5DD/+A9B+kdTimoIAHz/IrJ/Nr5CuNEAZ3Tx8QISb2s9v9MAYaJY65Wk3xTv+O+oGg61OnJ2kP50lWHhJY7AGwjcbpqBkYW7zu3tIJbh/NGpsYKfHv/1VVGEQIuYkJOUnvu9Be3nfpPmMtyJAYCX9DsmHSwwdPaYcvTm4mvuJXNOJkqu9b0EHltlnF9CsIWlXBPDNVBc8Px64IVzXxdaE38R3kE075VtdPgpZEPuqfzJBSd4tkdLDp3aFT/ga8l7LdQCOFnIpZj8VASIHm1kbm6xXxRjpaT5t9CFOxBHBLPNiNZPuFgZ0zhelbQAAkGKE5e1KfGy4eXBVKmIBBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s3QX0iE2MlqxEbNCr5doYHVb22hNmMjroiL25aCsBo=;
 b=DCJHOFyA5MWaMLwKsNDja2Yz7bz1vpCIXV0GhgyO7L+REbimFdTEP6cZwUlAgaH1PD7WypfvMaTwY/ZMk08/GxrMIo109qyIA8WMi2OBuS7qAcxdYGot0wSk4QyJJ0JZdr+Nly8Y2qExUDq04Wg6oWLF4zsJwdjYn1hipOJg6FCEogQsdfq4EZKRFbqIf5iseXGiTaH0yYMjPUW+8O6jXs27KkL+nkVfmmrLZjAAYOy+U0kEtoi2b/NfT3Dx8JjhVo47M98cwleqeoKNLqQeN2wR1uDbRLByy8tRWbAnold9e4QcXqosekPpwPXqMjKAYj0/TWIRq2COCjXQcmELdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s3QX0iE2MlqxEbNCr5doYHVb22hNmMjroiL25aCsBo=;
 b=lnIt+EEMt+GQ3F4FXrjQlBHka3Sm12V/4QKDpGi8jQFSN/aorkwdyDq5n/2lgML7FytK57FYnUvofkxTJ61+/5wpp+bSNfEJtIIiW/SMLkESJXnbDdcwgTLGJBp7WnlCkfxXo/KIaWxIeqzfOF4Njp9TyWyyp46ipQx2T8UhQOk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0002.namprd11.prod.outlook.com (2603:10b6:405:62::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Thu, 21 May
 2020 15:33:54 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 15:33:54 +0000
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-luma-core: Upgrade to 1.14.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <88965611-2b40-67ec-f019-befd2db5d642@windriver.com>
Date: Thu, 21 May 2020 11:33:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200520141502.28254-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::22) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0143.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 15:33:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b65aa75-c201-4520-99b2-08d7fd9c5e68
X-MS-TrafficTypeDiagnostic: BN6PR11MB0002:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB00020D4C2F4691655A2CB69C9FB70@BN6PR11MB0002.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K9Cmxr/FBEhcPAzZJZEfU7pGAqfSSdYgbINGEMCcXx092NDcQz/Xav+btSMFH7AJSkUH3Ap/0R91e9kXJlecEOTfdgFcHSLaLQtRTQHYncC4dh0UwRsZGxCQsLfWhNlHfA1D4I0+xyO2DJQbtYMLZq+MTCJpTBBlKgQNLtdXBrRfcx51iyq1qJxZjeaGQq28jIickXLNVCp8JAe8AMYT5cWKPV6hssQ+NffoACqLPCjeSaR+/tsk0xtFQkvYqV+IPRAPWr/ji3P2OtckRRzTLx4N5GU1L2D9sMd7cy64I97dBzexNhgYYQ24Gmlp3EVv7tIQgdGmIzrHpBaFyiLDvDAfv4EbIw0A0CRdAe5Lkpdcz9r0ZFx7BzbTxnCymXnUX5mWiz8zuZ5+Q5Q4UAhqV0Qn3EQk2nku4mTZQ8opIcRmmbJyX98F8FPP0NVsFZMOxeIuHAP2FYRe1BSifn8hKa8XWQu5WON6iSP0GBDKhlAQXk6UviZpHdSBTWXUoynW6Boh6+wk6W/Mljw/HcNo3eV/AJrsK6wI1oKdvZEq3ce2nFnyVeEzXN+lzSb+tpDSghZNVMHbJbsWa2r17sj/mg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(39850400004)(346002)(376002)(366004)(36756003)(66556008)(66946007)(8676002)(186003)(53546011)(52116002)(33964004)(478600001)(31696002)(5660300002)(31686004)(966005)(26005)(86362001)(16526019)(66476007)(8936002)(316002)(2616005)(166002)(956004)(44832011)(16576012)(2906002)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	85fPl5jMUyWCgac4lTLZbBgiYCVnSkg2+C+fh1MixCx00DV3m1c0jIlexXtAyZQLfURytLdW50YQuu82nclKh17bDi8tF4sfHzhNCoJCaNiLlhFlkX9XLwTdKXX9ZiNeLfpiv195QmgrLEKCQbjHJlBAZCXhpji418WhBHCCKkrtBapQrsdd/6OvkzwQkSShEPGG9seZgEo5pk9jk0VssK3AhbR6MOh/4E+5r3fQxfmgL9+CdJZ7OIWkgAF5P9qPwa8tR0NJGm4oKmdnq9UTZjmP1qaOOWcZaqZKA4PZbrNSdY2x3QGqRIzTPGmIxTt98Kx4nQcPuM+bGexpXaXxN4ABOwfmm4cEis57ZasR/1fSLbkuZxHFAgNL+UqHu8eKaSgBnJrqvyq/dDMS88M0BMpM2k8ue9sTG1+HrCv9PdTLlSHoq69c/FMGUJN6d1p6FE6BX3LCqHtN+yLeAJfk3d6APmaw6BbwBeJ0Zd6bBGYVCte8TtN2xoFbVNtV2Iwa
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b65aa75-c201-4520-99b2-08d7fd9c5e68
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 15:33:53.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAhD8s3rgyIDor9/SlgwG03SLM7IFDJ6QjuGbZx1Apiuj+7sXXMaIupJk6roBY8wP3UdcRa9aWA5kYVfoC+93uJgBZhXLv/UzGIwlK+aNBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0002
Content-Type: multipart/alternative;
 boundary="------------A09A698E5D53D720078EA204"
Content-Language: en-US

--------------A09A698E5D53D720078EA204
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/20 10:14 AM, Leon Anavi wrote:
> Upgrade to release 1.14.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.12.0.bb => python3-luma-core_1.14.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.12.0.bb => python3-luma-core_1.14.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
> index cdb1ac8b9..503acc824 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "4378edb99cd12540b4e4a588969567ee"
> -SRC_URI[sha256sum] = "864a427de78bcc16758f4f4402a9e61f31cc8857bfae9aba8041159aaec3a491"
> +SRC_URI[md5sum] = "c049eabcdd50c4c1e630282c058e18f8"
> +SRC_URI[sha256sum] = "1501901f08c279abb9a5f1b76347955d6a15238c1e86e055aef96acd3e2e4215"
>   
>   CLEANBROKEN = "1"
>   
>
> 

--------------A09A698E5D53D720078EA204
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/20/20 10:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200520141502.28254-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200520141502.28254-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.12.0.bb =&gt; python3-luma-core_1.14.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.12.0.bb =&gt; python3-luma-core_1.14.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
index cdb1ac8b9..503acc824 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.12.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
@@ -6,8 &#43;6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;4378edb99cd12540b4e4a588969567ee&quot;
-SRC_URI[sha256sum] = &quot;864a427de78bcc16758f4f4402a9e61f31cc8857bfae9aba8041159aaec3a491&quot;
&#43;SRC_URI[md5sum] = &quot;c049eabcdd50c4c1e630282c058e18f8&quot;
&#43;SRC_URI[sha256sum] = &quot;1501901f08c279abb9a5f1b76347955d6a15238c1e86e055aef96acd3e2e4215&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A09A698E5D53D720078EA204--
