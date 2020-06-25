Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.66])
 by mx.groups.io with SMTP id smtpd.web11.9934.1593090094512371365
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HICylnEC;
 spf=pass (domain: windriver.com, ip: 40.107.94.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7nW4td8Dd3GCYn7YS2rtDL0NdRA/IzPyhWpjY1JHCGZ+jV4bcqnUwIHXy12U/3q7SB0o0kdG8JWw0gBrp4/XFO2ZzY/CCHKLdtKV6+n60qIL+a1HmsmuFEV8zz18qXgPUU8898V6iQWOEBfZIbpMDHcMSlcBaLohIATO77hHXQs11PhJJcjGz9n2s2R10zLJcUeQSVynkrJf9JavetvKcH461twL6Hhdn7sSunSwQap1Zbv70Tk0dWASBtEUyTh+JM8C7nrPVWL17ri9/hu4vcvZXD4BNF8tAbb6Hy38AJxarASYDfflc6QkY4Ddd03GOHTi89+gu21SZ1vJAU8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjYhy/2E0CoNvjhmAMENEPNDYXw5tYzcNiBvUXrx+nY=;
 b=OKX6UYwt72spnYAX8YC/V7GxwJZJw0FZzHNedBGxN+ixEfYmhCrL8BdmlkhcA7SG1pGN0XX8yibqd4X+WqYzqOP4j9HyHdrf51vGtFErBoxpU7MKwG1y3vJ3vRj+ZoysulnSevRq6Wfs4zaT8+CLUBQg2IMVAaU4f52INHT9Q9rmy97owyAjuqPqkFd37DF7RhCIw6J43mrY/f5deNwhQ0ODNAmAEbklzwlRuHmDG6X0s8rX5dM8cEajcBzdeLJZ0ijqnVx94kuvnnEQL8DmxkjS5BS0zQ4iKrqGgzI/5QeDRSzxhIudelBCbycGn737IKTHZWvPwc2kInp3QVh21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjYhy/2E0CoNvjhmAMENEPNDYXw5tYzcNiBvUXrx+nY=;
 b=HICylnECaY0AwKih0op7cCvj6WfBZr1DhXkLKq1zIGgHLTaF+/PwtVV5tYjB4agjTsfiaWUVqVymi55LsSZb63ntNemGcEbEbUl/I6x2+v2iOkQjrrLKjekJ4vZtJPPpKqkev94hMnI7Xu2yqjdJTdmU/7hrD8/o8RGrkiCmdrY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:01:33 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:01:33 +0000
Subject: Re: [oe] [meta-python][PATCH 06/11] python3-configparser: Upgrade 4.0.2 -> 5.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9bef947e-0c28-bf00-802f-01fe2eb84164@windriver.com>
Date: Thu, 25 Jun 2020 09:01:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:01:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f9fd86-e164-426c-f704-08d81907e29e
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41614D0555948829D2F318F69F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N8VQi8PuIkNXI8BJY2FkVBB/wE79zqsfvj13beU9nqcZXOUUHKDtSsP8PbYuC3UOiQMSb5veRcT7C/iybdIBzxX42BxYcJa6a7vSyuv7zn0bcXCWfrg1Vndx8dzjZHnCFowzzMg85qfs2C1AoWxgP2O/oY8PGhiS3Fu72IrAxCaduzrgaAUEZt+EMp9QqefRL0RUXqWp+W9ojryCDH97FgCFsCQW6YMcOWhOz5PLOlDnb1fz74eOHeNyhRUgwTqwhHgs8Z4sQUJY5NzcZeo+NXM/ndXURigmkk8Q6nlRIonLf8HVPQ8nR9nJQdXkWn+ocv/JEHXjwpCXNQUbPHuBkqk7xwblAnmIoQccGWFpmEH+pC46s376Mg2hA3DkOU/ESttrrstadX6KhtUdlJUan2y4avfarwHHIpBzRTjNMVMAoCkZggDO3nWua25WSj7kCB+CM1bah+L7jd1yCGktlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/SEK0uOgZia0hpbXRYu3qni3PW3uNN4Ckg473P9uzz6Ds1ARP/GLpUmO+r6YDDy+6EfGafyg9Vu0sYY/wFf+m8l8LgcLDBrUG8iqSAbaTTkxl/UfYIx/l7/T29mJXCNjt1Y/H5fEPUkqPac9aaBpm2MHnwZ8DeOE5UDuQI/7hPCr+gUsVplTSC5cjUigTedpRN5TOcyHQOxGFIMZFKTGUeHqxcfwnde0ySs6VJuIgK9pveEKvUy7HNiiqvG9w61AUZSc7u/VQvcYl3HaWVf20mv/uuUC2jcHFGtAov8vRXyMo7FRfGAjq19YdOhq51cya08orOkQ+Zdos7axAd/WckXLW2Egl09awaMuV4XiChw2j14rKg5WIK1CAuR81+zF148Q6BP7kJ+I7R7CpC6AcCVHY8dVSdsj20CD74t7x5NX9lPikO56b+GJjFhfUA0kakbr6xC0yiu8eK42jS8v5SRtCjjeKj4LpGT3jW7Zl9zf/dmvv1uKUKGJ2iqT2ugU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f9fd86-e164-426c-f704-08d81907e29e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:01:33.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjkXyW5OmWYxYEjvguPKlATt8LWyfH5bJKXlrRFgr6ENbJuyEox2L2YXP22+vQAMmAxxZLj+MqUDJfC1G8VyRQbI5Bll0hMaufIKajM0DCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------75B07A03CDF02F547005835D"
Content-Language: en-US

--------------75B07A03CDF02F547005835D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Add toml-native as dependency. Upgrade to release 5.0.0:
>
> - Require Python 3.6 or later. For Python 2.6-3.5, use
>    configparser < 5 (selection should be automatic when installed
>    using pip 9 from PyPI). The 4.x line remains supported for bug
>    fixes but will no longer be updated for future releases.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-configparser_4.0.2.bb => python3-configparser_5.0.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-configparser_4.0.2.bb => python3-configparser_5.0.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
> index 196660925..6b2af125f 100644
> --- a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
> @@ -5,10 +5,10 @@ LICENSE = "MIT"
>   
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
>   
> -SRC_URI[md5sum] = "35926cc4b9133f1f9ca70a1fd2fdf237"
> -SRC_URI[sha256sum] = "c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df"
> +SRC_URI[md5sum] = "558114054aa5610365df1b34d3fea349"
> +SRC_URI[sha256sum] = "2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1"
>   
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
>   inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------75B07A03CDF02F547005835D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add toml-native as dependency. Upgrade to release 5.0.0:

- Require Python 3.6 or later. For Python 2.6-3.5, use
  configparser &lt; 5 (selection should be automatic when installed
  using pip 9 from PyPI). The 4.x line remains supported for bug
  fixes but will no longer be updated for future releases.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-configparser_4.0.2.bb =&gt; python3-configparser_5.0.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_4.0.2.bb =&gt; python3-configparser_5.0.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
index 196660925..6b2af125f 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
@@ -5,10 &#43;5,10 @@ LICENSE = &quot;MIT&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa">&quot;file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;35926cc4b9133f1f9ca70a1fd2fdf237&quot;
-SRC_URI[sha256sum] = &quot;c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df&quot;
&#43;SRC_URI[md5sum] = &quot;558114054aa5610365df1b34d3fea349&quot;
&#43;SRC_URI[sha256sum] = &quot;2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1&quot;
 
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native&quot;
 inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------75B07A03CDF02F547005835D--
