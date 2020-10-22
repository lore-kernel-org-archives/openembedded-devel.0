Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.45])
 by mx.groups.io with SMTP id smtpd.web08.1297.1603410331949815055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Kk9onvuy;
 spf=pass (domain: windriver.com, ip: 40.107.77.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqSFiU2V+mGz53rnFeW6LCeAECDH5q/5mz+S152v+/WtQhDCfsXZsk6Qirz1Dw9IXJNvXxph8e0eTNRUqCvMk2SP1viMn5BJVpXSuDdsv5g1avsTPx7mcpn9pweWIsPQUCU8tA7i5M25w9yNZgtQqDvZK2A31N8Jom2fEBraSKxtiJ/oAACYr6OZD2LcwaXD9wEtU3U59EBktlBbvDcmxz29rr1zcWiRbduXYAFwKOeNs9beXYl5TPbVlHQglCD+b2v9WrKsr1CxGm8A3wBa1hraNajxv5E9m8j3BicXQ3tY4i1AGZkbM3wgqRP14EOLN1u/Dpl5RJQyZC311JABcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgIel78G8XmuUgZb1sJYNRBOFaOlKMAdJcl4xjQRwn8=;
 b=b3YG4HVt+JPnUw6tOtb7ABTAhrzwL72hfHjLvOJdyxE1iPRofMe4flqn9VgNqYoB60wsjO00WUTcHdCQn+DU50c2YRpGBXKxCalJ0fxfjllquSn30VTMHfBlV8NUJZV+yo88ak5Kf0rpe9C2irYBlae8RDT1BqB8TLGGV8GZwzgK2bso0lJ+Y/CwngPgnRoxlhgD/DVwFYIFR5Nhy+niprYKFskfFYzXG7iytNNVBObqDiiusuQkGdYH/r6IaokArNK00hr+Ng3pehR+gCduQW3OkrcZRDfs0U6aiXoOPOrKQuD+nlUt458I4ZB0PuTRweB2DW5KubgRNyxcVIAQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgIel78G8XmuUgZb1sJYNRBOFaOlKMAdJcl4xjQRwn8=;
 b=Kk9onvuyvD+JLgTDpOVMV0FbHhXaivlbOw3OuWhiHKXcDgqmDm+n0F8hspW8IjYk89cIzOLKTI1jSpuCDK868H8vwGRA+5UONjmMwcJg0a9nomXQFoHjigFmDbc6/U55AHeKvbF1g2uSMFrqqEIMzTJn1XLkfUnLrenP+rKVchc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:45:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:45:31 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-typeguard: Upgrade 2.9.1 -> 2.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
 <20201021111609.28237-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fc373ca4-4afb-e84e-95ef-e7607b92502b@windriver.com>
Date: Thu, 22 Oct 2020 19:45:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201021111609.28237-7-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR07CA0084.namprd07.prod.outlook.com (2603:10b6:a03:12b::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:45:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 381843e1-0de3-420b-484a-08d876e48f95
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896CF5815E97E9694F6E6A19F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7rTmplNrSryOsOnHaYjXuGRnro7hDPoyiXyGR9v0JI5hon3wsahxrDN8APNDZgmzCKE7Y6cZBCDF862Wk3dZUpxASsj6UlNgkisUit/xhYiN+sNQGMOj5+AyGR2iOjzvMUrVQ+7SjEoZsMSxa0nl+Egq8I0rNbAN2QBs4SO8JvuNpOOkPetweAGpf/h5tnED49k5IUkrqp6gmg67qzoQ9bY/bcUUPSo+EY1zQ7WY505/IPSDYd3pFR0R9NHHA0kWf6m59RWQCS6EjFpHrFEajPUfcqeu4KqnLl85YGNPG5fghoMqLmA9US9/1tBZvviXOP6WlDJ+n/2N/IzPjBw7PSVRSCPKtsSm+zJaZfZDGdRNDDX1VsnMlnSEpou1c/v1mMxCufq1ZdjVha93tZVeYTTGgVsN6rp4DO+hIAoyp+8b0dmNejBdYT+NK8o2NjkZDvsHiEXJsaML/U51Ie9GzA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	oh3yJjF6qSw9+DUGXKIHo1qLwlMrwXv+j0okDvSGrTd/Ycj6G+Dwc/W6vvskiZkrKpP+AtQSfi4Vil2R7Rc6JcyjBC+d+X7XYXL3M9eGeu1B7lUFyECHc5O238WCntNFG1VfqGRsKZ3mbXLloz92DcgLuhbQTNPBNu++o1DOLOs5PfetnYEg5nsViHDXtQps0B21dLxhjYrS5Tip1Ivuey92lBvqWoebXWWDJlTm+qyDyq8PsaxVUGN3iAFqkW4X1cF7OBWb3oxfrzxs5H+uYgACRzr7Ratv5I5tD18wNzOeej5f1ONEIu5nUQmFh9iy9A8MvwSqtN+GDPKxbRovnTkhMwsFfOBdcnrtI+QvsIp7yFpE6mf8lVqRUyCLjP20N5GBvLwCZHv15ARaI3J2J2aOVC4icaVIGKQMjS+EdE3ZRoZWKNuv/iZCZDaWOzjv95aeKYyF+YNKaCG8nJk3U1Yxmb7YLI7zNcLsfBREu0AQVhD9Vo67cFsdh6LBA/ZqbgkQrUTQtXjsApMTOIcrbmNakhvYnuZe2f8+GDAPMo6w/IJh/qnBqf8A1sO7tus2zEEIuaBosMRumL+ZNFDxZUU50/Xr8Jq71L1ZWz6UKbZlUvZDoTLEAA9kPMWeRIblFappqcG96qq6akX37j+3RQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381843e1-0de3-420b-484a-08d876e48f95
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:45:30.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo1OlcWEGmyYIxSrFkWncc7OZubrGRMUd2SG9qcEGN4RD6/nIrATQtkQGIAmzOLU365Or9rrTHCHFfIU1QNeU24pK3Sy09Gv9EuC/BRF6GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------6BD2C47E0FF134940F9BF507"
Content-Language: en-US

--------------6BD2C47E0FF134940F9BF507
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/21/20 7:16 AM, Leon Anavi wrote:
> - Added support for Python 3.9
> - Added support for nested Literal
> - Added support for TypedDict inheritance (with some caveats; see
>    the user guide on that for details)
> - An appropriate TypeError is now raised when encountering an
>    illegal Literal value
> - Fixed checking NoReturn on Python < 3.8 when typing_extensions
>    was not installed
> - Fixed import hook matching unwanted modules
> - Install the pytest plugin earlier in the test run to support
>    more use cases
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>

> ---
>   ...python3-typeguard_2.9.1.bb => python3-typeguard_2.10.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-typeguard_2.9.1.bb => python3-typeguard_2.10.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> rename to meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> index 3786ccb855..bd92216776 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
>   
> -SRC_URI[md5sum] = "411df8eefd76ffa014328a46342bdf38"
> -SRC_URI[sha256sum] = "529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288"
> +SRC_URI[md5sum] = "cc43e0eb1dea7e409a74c7f1effc4544"
> +SRC_URI[sha256sum] = "d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------6BD2C47E0FF134940F9BF507
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/21/20 7:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201021111609.28237-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Added support for Python 3.9
- Added support for nested Literal
- Added support for TypedDict inheritance (with some caveats; see
  the user guide on that for details)
- An appropriate TypeError is now raised when encountering an
  illegal Literal value
- Fixed checking NoReturn on Python &lt; 3.8 when typing_extensions
  was not installed
- Fixed import hook matching unwanted modules
- Install the pytest plugin earlier in the test run to support
  more use cases

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    <p>Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20201021111609.28237-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-typeguard_2.9.1.bb =&gt; python3-typeguard_2.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.9.1.bb =&gt; python3-typeguard_2.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
index 3786ccb855..bd92216776 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/typeguard/">&quot;https://pypi.org/project/typeguard/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53">&quot;file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53&quot;</a>
 
-SRC_URI[md5sum] = &quot;411df8eefd76ffa014328a46342bdf38&quot;
-SRC_URI[sha256sum] = &quot;529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288&quot;
+SRC_URI[md5sum] = &quot;cc43e0eb1dea7e409a74c7f1effc4544&quot;
+SRC_URI[sha256sum] = &quot;d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6BD2C47E0FF134940F9BF507--
