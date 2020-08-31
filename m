Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web11.52720.1598879538261468005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P9veE3EP;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze4riOdPpLMNJGivmleNBebx1RF4jIpHS3xhPMuSufGogODFifArPcdsLMWkgZr4sXOVozCuYsP+fL1hszSeTYRtKVAOA4K/P+ujean5AMJPxG2/eLLgdosw7oP2DZPbdAaayaFwX8eZH/vmb+jg39eBzgGkvJmWNSOZ36V0bl6yCZTtFtVCpD9MYk632UQ41l/rb6PiuyV/7jgu6MMTqpBIVP01uPGLaaotxdk73R2Zta5uRsBKJcf1XPyFc9M71vSGXd7Rzif6vxn/PSoBSX+mYAYj2qGy34vhDXL0JeeZ1z8LigeWB2nzzDZDg/KRFj/M6fZyjj3PLy5ty8Qn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZFvEIASrKX7OaeNvyIA6CVCa5KZ3oIMMUanVrmf4No=;
 b=dLnGUSLz0hyAf5RjTF7WYXQV9Hxmqcy2KwyXMNAbD3BjV7giOWW428leu2V/u8pImPFrXbcsaMNV45nErAypSIYbhJjZxRdPKg8E0zZZ/xtolVOygceeBWd/CSy8wDprG0HwAvQe7gfU+3clM7jG9AebHRcnkPvvvTkrAeQnQcBSdO36W6iAE7joiaAvPOG3Ln/lnhfvytCzuf5fqwKnV8AYbbuoOWskdqYGZTjhTJggi1UB5/e8ktGpLKo+VsUS5bwkLUmyHqdl8xBLg606IXH41kdx0AIZx3hG/h5z6v1p1lf11BBHYdZMjXfRJ5jK8rls4DycVOhl5GXlXR2QpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZFvEIASrKX7OaeNvyIA6CVCa5KZ3oIMMUanVrmf4No=;
 b=P9veE3EPjmL3J3ip7cdmGDI8oUvJPn5CPAc0pzbjx+UxMB88XH/UvXh7LL6P9m4rQkEWrscgpMt9aFr4t0WgIClegDXXQbBPNp8iVY3IfbwUvd/xRRvF5Uas5ASL4LazHTsoL11ZVufV3W/O+/pEyQzojSM7pTQkrYekScFFCX4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 13:12:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:12:15 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-flask-migrate: Upgrade 2.5.2 -> 2.5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ea5aeff5-ba50-3106-7e83-434fc479d343@windriver.com>
Date: Mon, 31 Aug 2020 09:12:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:12:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d9414a-1d02-4090-15f6-08d84daf7b1a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3671:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36719A467FA78C3B487525139F510@BYAPR11MB3671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eyLHHahQCa/KDuyeEYIERPtyigd7hVn2Oo3UImXSvDj0kuprwf/M1VjpbBVlLRpJASu8EGAJgNGncEvglfxIlx8f6XcFRsUbJ1JKZDGVGC97A+wOB1GG3yzYiX43LPULabw6lCsZnSTu5gpk8ubYecK56ZUH2iH1euz8gUcR9+4ILXhjRCVEfwM9la62VYuKlEh2c0+gDCzQDaEjqygfGsoNiTh2Rd41K24KZ9fZxQPeFkoOvHjRRCLUd4Zr804FysIiS64Zhiy/e1nuaXo+OOrbeqvnM9WYetpQzmYNkuaHKL76xXZIpgZXs45+Ingq97SwGdhZdTJk7Iy+PsdwZ17X7E0lb1mz8+uyyrFAfNRdA8EtLA+JKkr447IsEzh7VfGdshIJYDycEbeZaMUvIEb33/Qui9UmnurUQLicxTwfw3Apixsc+0gm6PlUBKMqpGqW2BSmyWtvrJ8hoMPDtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(52116002)(186003)(33964004)(8936002)(66556008)(2906002)(478600001)(31686004)(6666004)(31696002)(44832011)(86362001)(66476007)(66946007)(6486002)(53546011)(16576012)(36756003)(5660300002)(316002)(966005)(26005)(956004)(2616005)(8676002)(166002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ozk7WZf95b1jl8+BDVzFbZ6rT9WPymSQIi6Q677fMwaWP8X2jSQYUN56qbciakkzAK6w46E+53Qy5JT/1Jo9V7qaMmo4nTLDjp/A8qunJNf5dFuGN39/vKGWDZs4yiaRC8VYHUu/9BE8eRYrQI3XXxBR18xlt6IHQ0eF7zzCCLx5WtoW1usr+GOXbQtHtJsvJPnRt2tC7ClxkT2t/R7bYZKXASfOVKDjHb/TnPyrhO/Ko5el6Gu1xPD4fFS6jxVtv9LwwF9Gw4/HCdI/AfysxgVnqKUNR94Nu9c8ZfoqX9N5zx5dqQ7vdrSjxlOi5OfHvlZo7nnBnjwIuNs4XnstwfnFk9JSIKJsnswaiL7OplT7uLbEaia3fmWyJGjs4NFG8vV/Byv1CASSZhVignYM8yP+favDO7u6+8Yb5DI2qOqZVC7Sv9bGcC+K8oPxMIwhFDZGd8aQe937/qo0RdwYJSYVI0qekskCXhBdxR7A4MpIKBdlc1YYGS+3jSvXyF8bS2sIXcTyd+Lerxj0pUaWuEwZq2qjvtbIcnAVuuoIHaNOdF8W6Yc7ffJgNmgQeQ80SwyZ3kAklbIlCp9dN658yvgi8RprcxZB4jNV788u3HRCHMKb7njOx4wcP6jFd040EGhZR8PobkpI+ZiYSZrtsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d9414a-1d02-4090-15f6-08d84daf7b1a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:12:15.8194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N47FggHu/I/GAtupXD4Xxs7er4n+elqzUua0PgSj29NKsExgJlcuv8zutF8VSXOFlUW96//gEJYqQoN7vxZWF8z+k03ZGuyZgXFQOlD2BBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
Content-Type: multipart/alternative;
 boundary="------------92743AB152EF0A264C68A0E2"
Content-Language: en-US

--------------92743AB152EF0A264C68A0E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:55 AM, Leon Anavi wrote:
> Upgrade to release 2.5.3:
>
> - Allow Path objects to be used as directory parameter
> - Use same database URLs as Flask-SQLAlchemy
> - Document how to set up with init_app method
> - Document how to include a message in initial migrate
> - Remove checks for alembic 0.7.0. Flask-Migrate requires alembic
>    >= 0.7 in its setup.py file, which makes all the checks for
>    this version obsolete.
> - Use sys.executable in tests, also re-order imports
> - Cosmetic improvements to help messages
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-flask-migrate_2.5.2.bb => python3-flask-migrate_2.5.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.2.bb => python3-flask-migrate_2.5.3.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
> index 78ec665ef..54fa1dd97 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
>   
> -SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
> -SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
> +SRC_URI[md5sum] = "707d4a5fd4e11d3113a1228aa7793176"
> +SRC_URI[sha256sum] = "a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee"
>   
>   PYPI_PACKAGE = "Flask-Migrate"
>   
>
> 

--------------92743AB152EF0A264C68A0E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5.3:

- Allow Path objects to be used as directory parameter
- Use same database URLs as Flask-SQLAlchemy
- Document how to set up with init_app method
- Document how to include a message in initial migrate
- Remove checks for alembic 0.7.0. Flask-Migrate requires alembic
  &gt;= 0.7 in its setup.py file, which makes all the checks for
  this version obsolete.
- Use sys.executable in tests, also re-order imports
- Cosmetic improvements to help messages

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-flask-migrate_2.5.2.bb =&gt; python3-flask-migrate_2.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.2.bb =&gt; python3-flask-migrate_2.5.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
index 78ec665ef..54fa1dd97 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = &quot;SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85">&quot;file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85&quot;</a>
 
-SRC_URI[md5sum] = &quot;bedeb0366740fda6912fea683be11968&quot;
-SRC_URI[sha256sum] = &quot;a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502&quot;
+SRC_URI[md5sum] = &quot;707d4a5fd4e11d3113a1228aa7793176&quot;
+SRC_URI[sha256sum] = &quot;a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee&quot;
 
 PYPI_PACKAGE = &quot;Flask-Migrate&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------92743AB152EF0A264C68A0E2--
