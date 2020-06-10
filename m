Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.86])
 by mx.groups.io with SMTP id smtpd.web11.2879.1591818785997697759
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AohJGJyr;
 spf=pass (domain: windriver.com, ip: 40.107.93.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbPr7zc6+DEUNAU6MOrDEqzlKh/3ejne9wxbof+V+6l/eNeEuFvsfLpfahJxSnMGH7gz7kHdYpBKhXnUgi50U2Z6E+IpSvt/+TihsojqqpUOim9g1UE+Nl4oNh9MTcGBmVf5rUFwKWH0hSrG0uuVURaSiL/b8B35NRe6EH/hABtE13elKO8eWYiOhDw2uGGlVr8iQussqJez95O+ETAZMwWovib9F+tnWojXWfL5iYt2uDhmHuN5eGh56ZFP8oAjCMt22OUmEbPpTsHeuR9wDX8xxDz5LG/gIkUnsZGvKJ5ACrXw33SSsl+h7Wtz+TEGe99YCzEcbxThHS2fyL4NQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVSRpG4LjbaJ1Rhl3iPnU3rgIe1nEcHi6ZVo2P8esJ0=;
 b=DASesQkJTpwDpQIu0rxEX63Lf9Jo69QMt/sK+jADr3qfCPBqw7kw1Qy6/LT7XwR/TfUWG9VQOH+0OutaeB0tU/0dBm7PFhEl5aouHhLtHMD5bdfVCduFH23KJJ981182DEoScAeqK2n9A4NTf3+rZUNW/wO7SHd3SorA5zuQX4h8uqMuIFgrARhGUlA+YasnC8gb/HiK1nNdpXwcbO2rztdURfAPrl90nGuBfcSXdb3Bl9rTTJ+kF1U7YOdByd3hsT+frUBM1hSW7USkqslePuXJViN7TtdUGGRHi9ZLkpFsv17aantUI/GcGN2dsJP+r9846qvfxyRsDXnPfUzmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVSRpG4LjbaJ1Rhl3iPnU3rgIe1nEcHi6ZVo2P8esJ0=;
 b=AohJGJyrb1MA4UnROkvEM6nOBxduE++i5pn+SlW2KpY1SxCbEbkqYdogEnfFwE57l4Mbsna7F2IWUG1UuBaGOFFuxkKCxMggin4UpoM48hJAR29cq3D7zp3LuDmGzWFIQZDpwlqrkFdNWWEBImyJp3ov4F3Iza/cE8Rw2QwhmZ4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:53:04 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:53:04 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-twine: Upgrade 1.13.0 -> 3.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609125600.17773-1-leon.anavi@konsulko.com>
 <20200609125600.17773-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <81b5aa5c-c971-ce99-834f-4238965f6751@windriver.com>
Date: Wed, 10 Jun 2020 15:53:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609125600.17773-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::17) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0108.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 19:53:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e52dd0f-56f4-4a6e-af02-08d80d77e3be
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39245880EF9C5338148DC0B69F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Djjzdq/CVledD2bAdn4bUoNUAcyoHqkTfE4HMrvSlPwo1RqErbcbyvA8/ybTPj5m2Thc/HtY4G507h0Q14PIuSaEdWgTeWch3zXodqJB4Pb1rtHOr71OLa9hc9fQUyN4y0YNxTZ2FsmHkxE2taUibgEfzc2pHgsociBgPnWI3QsWaR6fkBLCZRviENF6BkqqgKUG9sOHVy3XogX1/74ytN71GpfhdtcW7TwAbLMLhhzIwhqFbmDa7iMebm/VmfhQJAuIY/TD5mxMiO1gz+ZZaS1vvM/8tLvn3XKzzPl6GDUrafTBRDKclFUPOOXZl3tFekWyADC2QkBjldHrFjkd2TnVCqh+qrvM84xrKPq/rX/wip54cW96LepSkgjlGxrY8ZnlERqzfpWW/9aKpV2ssymvZq9A4Bgn3xP3zoBU4b7okg3tsrcy5348kY0krIhkuWbyjD7oeqJQjfJ+oc0+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ayawi4u73yL7eE5lA39eqYWzj6BeU0vJ4uJFsUE1T0XcBnulVc6i84C9N221io30BClGW72urJqDMLcSjVwvmJLzaGh6tTAwTUUikZTGTom+rjOiChbkhVzh3G0zcApXJ43/q5Ildhq7amVlY6xLwHbfVZ7mzlWK/avLCGqzfZW8KcquxqvTqTvlAmkK6ZiXbBJE04KpOgm1bs8jiTWcQs+4ciUqe2lKZ7HOA5TvbtHGPUV8o9huo2JGM+3EIxDF+AE6WOiWbyz7ncydkWGKOArf1Y/MfsYLppCxyC3g5GqHHWpJ42uVEnkyHB9pQQH4VgfPdoPvNroP/jE7aUI6p+oF1WFiESr0bYmQQ9uDKCmWihYH9rmf2JjKUZonZaw96N2sUjTZ72ahbD4HAITPlDBeLiZpmfEhjB+lw81tEix7irpJmUUazNX8L0vbO1mhuLIjP2elp9W2NTKzT9S1ok/ra7CJKnRkUhihVdJrk2V2JSRdghvBObMwF0JyubAh
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52dd0f-56f4-4a6e-af02-08d80d77e3be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:53:04.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYh5OJO87bKXx1rScpP2XfvwI7dUTgpGO8WuN6O80+ZhBoZLvRYatE3kRmPYFD2Xcvgi1Gnc/cKV/zjjvczgjoyKNjet9fsNgivx8z+MzUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------70B42E47559C90BCD7DFE4FA"
Content-Language: en-US

--------------70B42E47559C90BCD7DFE4FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 8:56 AM, Leon Anavi wrote:
> Upgrade to release 3.1.1. Fix homepage, summary and license which
> is Apache-2.0. It seems that previously there was a mismatch and
> this information was referencing python six package, not twine.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-twine_1.13.0.bb                | 11 -----------
>   .../python/python3-twine_3.1.1.bb                 | 15 +++++++++++++++
>   2 files changed, 15 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
> deleted file mode 100644
> index f5cc70f98..000000000
> --- a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
> -HOMEPAGE = "https://github.com/benjaminp/six"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2"
> -
> -SRC_URI[md5sum] = "6fb4da0c7d81ddfd48f619b8caa1493c"
> -SRC_URI[sha256sum] = "d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
> new file mode 100644
> index 000000000..31b55302a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "Utilities for interacting with PyPI"
> +HOMEPAGE = "https://twine.readthedocs.io/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
> +
> +SRC_URI[md5sum] = "faf033a3458de37df6cdecceb6da2c2b"
> +SRC_URI[sha256sum] = "d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-setuptools-scm-native \
> +"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------70B42E47559C90BCD7DFE4FA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 8:56 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609125600.17773-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1.1. Fix homepage, summary and license which
is Apache-2.0. It seems that previously there was a mismatch and
this information was referencing python six package, not twine.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609125600.17773-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-twine_1.13.0.bb                | 11 -----------
 .../python/python3-twine_3.1.1.bb                 | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 15 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twine_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb b/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
deleted file mode 100644
index f5cc70f98..000000000
--- a/meta-python/recipes-devtools/python/python3-twine_1.13.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-DESCRIPTION = &quot;Six is a Python 2 and 3 compatibility library&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/benjaminp/six">&quot;https://github.com/benjaminp/six&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2">&quot;file://README.rst;md5=3963bdcee7562bedae1effa09e7542b2&quot;</a>
-
-SRC_URI[md5sum] = &quot;6fb4da0c7d81ddfd48f619b8caa1493c&quot;
-SRC_URI[sha256sum] = &quot;d6c29c933ecfc74e9b1d9fa13aa1f87c5d5770e119f5a4ce032092f0ff5b14dc&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
new file mode 100644
index 000000000..31b55302a
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-twine_3.1.1.bb
@@ -0,0 &#43;1,15 @@
&#43;DESCRIPTION = &quot;Utilities for interacting with PyPI&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://twine.readthedocs.io/">&quot;https://twine.readthedocs.io/&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c">&quot;file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;faf033a3458de37df6cdecceb6da2c2b&quot;
&#43;SRC_URI[sha256sum] = &quot;d561a5e511f70275e5a485a6275ff61851c16ffcb3a95a602189161112d9f160&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;DEPENDS &#43;= &quot;\
&#43;    ${PYTHON_PN}-setuptools-scm-native \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------70B42E47559C90BCD7DFE4FA--
