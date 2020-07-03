Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web11.10729.1593784948858681632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IahVG9jP;
 spf=pass (domain: windriver.com, ip: 40.107.237.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbYdS197Pmg925Jj8x7NbOKgZ/1tlA/PtTIzoRJ+ij/AIGSIWAlJ/szsqKP2w1VG11MgyAiuXbW0kxJe4OuiPmuighNmLUxI8zPr/RXD7P42Rgd0GTiVZEkaCKaG8B3tfj4aofDsJ7zZ/yNkIBjC3VnQPecMrZX219bbAdMtpLTIYBwngfmMymgfx41uhwzHL89zAi2lqqv4LltBuzjshTmSBB4aaXVIPD51JiGuXgsVWhek1t3Z24XVqACAcmNpAt0mwHgACZ2ozLyfJl7PgGzJLkRy6xFwmtm8CdzIS6D+kLanE1L+/ET9j1FNzrcZDprD9qyL1MP9ifEbS5Ei2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ4UPD0omAvn1YkAAEipcLnokCJXRGdn+Pq7xXfTCkI=;
 b=mEmY4Mx1A9d8c4d5fyFBb3KA3ixdoF27k/++3rArKwJqDQjWJXRfcqN2Qqt75n3xTqeruRH/Pj9iabZ3jdtvCmsdNjwfltqAtgda0KiiErWZrwZvJnDPB9DqIc48dxozXyyRFzxZ2oUFeE89BD5ZAUFwQ6/5UBhocxzzC0aM6ZO/Kvq/Zdb8BAcQMsHXFLGqxHcP+jFTTOmvjtKSaNFIjDU1v3KxQSivAu5d0ztyC6v3bvG23QfmA08E19nFJMTzwxOVXllqxgYlk40abe28HKOwSBcrc1ElsGi0X4V52kQA6CCepWl5k/E13onhWDOQ5scfAvVZ9Uxow9Lsjg3+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ4UPD0omAvn1YkAAEipcLnokCJXRGdn+Pq7xXfTCkI=;
 b=IahVG9jPgmMM7JLxL/xDsoCcZDioo7Wu37yKDqGhT9H2CeJ43AHbv8eBhWhBDHcu+fygT5aiIxTnJrS5ZJkLfOpibD3A5I5g2PaZUdWq9Uv3qlSgZiobJV2gH8L73Scbtq+AUISSCufoLw4mcJIav/NgppiHRe/2qBTOfiufFAI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3627.namprd11.prod.outlook.com (2603:10b6:5:13b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.23; Fri, 3 Jul 2020 14:02:27 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:02:27 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-pyflakes: Upgrade 2.1.1 -> 2.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
 <20200629171853.18608-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6a046d8f-b073-afa6-ec04-f9aab89344e4@windriver.com>
Date: Fri, 3 Jul 2020 10:02:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:02:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab83ebd3-8c93-44e7-19e5-08d81f59b804
X-MS-TrafficTypeDiagnostic: DM6PR11MB3627:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3627E6CF4EBD5EF29DE247469F6A0@DM6PR11MB3627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TuoMq42Q3ZRgtQwhr9moeqcWRbf2Qmb48EH+qJieAPow/XVbZVtaVimFEQInNWlMW8Z6Mv0eL4GadP1olLhp1+jukSVGwmCqdqfLko03S2MSwpjcLX0tIiouY9G16k8Vkj9lIZeFiN01kB/OHfpKhP8SL6erE8j+lumLErr3wARozdwo3IiP79fcTvC9bnF1hNtOomY22IXWuPA1m1cjBG+9KbyqGrMt3swPGg8ocvBCzPBnN+nW2/GOAgNMXUenudtvA0o98eHS74vmbDhAcsrtsmeoK11pTKMh+QK65BMbXXraVmOVuZA9wLxoCR66+T+5HftrGLAvcUZeNtnR2cOI7vh95O1nVb1mi81n+sezxggEgrdqcI3+WYIbubUhXI7YXgRKT6DbJ+nO1XVWF7/gX5FZBgBiMWj/2fp/q4fWmqZsR9qnKRQIa3EUhVDgLIxamMXKTFkFb0ri2x710g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(376002)(346002)(136003)(33964004)(66556008)(478600001)(966005)(16576012)(316002)(36756003)(8676002)(66476007)(8936002)(53546011)(2906002)(86362001)(52116002)(31686004)(31696002)(166002)(66946007)(83380400001)(16526019)(5660300002)(26005)(186003)(44832011)(6486002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Kq6svmnNi1LbhWljrzCybJw/o8wJSw9j3RO7FPt+72jQBCy5pDFv6Lnd4oDIqVNCR/0CmvjQNcQ6x/Q9U9yxMjzYU+Y5ICL/IYqUaKw3+Xr3DevGQLD/Y+epIivJWaOrmFR+OMrTUJncG7WN6n0QVmPngEpOkrK1o6oX3Ny6n53gFhP644U4ay8CwiiZLuV+1j0Qbqvp+FWI9PqPdF73zbq5Uvh+1XlN3iQEiK+Zg2PNe1tC4GCZHMdMfkDFpWn02zSuEDS6/9utGkHVmzFr8eAKHtzC4c7lx7T7w9ixM6vFvaxJbaTodtvfQkmmjXNGevWKkh8+2m5lzOdytBFvG1jZyxCgset+YqSWd2oCjNQ/RjtBSdAOU87wK+BwgGwLZQaafwYZZ+1XIh3avUX2dZDNfUSkS3ADpzdUhssspDw96k5azZegAF7cInXa+E2Kuiv/ecvAGQLJjSWNtewgPsogOTvn1bYRWTtO/FDyH7o=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83ebd3-8c93-44e7-19e5-08d81f59b804
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:02:27.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 327vysi28y8qKVSlu2iHJRRWgjUo+ivdr6X83yxaVnMv/LqBo5/xMjR3/1RsMv9BnUAXnLsXMzVzhP0nFH0V/MFFNNgPFdHyHdIsTq/f5VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3627
Content-Type: multipart/alternative;
 boundary="------------256E95F64BC3EA99217AADD9"
Content-Language: en-US

--------------256E95F64BC3EA99217AADD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Use LICENSE instead of README.rst for LIC_FILES_CHKSUM. Upgrade to
> release 2.2.0:
>
> - Include column information in error messages
> - Fix @overload detection with other decorators and in non-global
>    scopes
> - Fix return-type annotation being a class member
> - Fix assignment to _ in doctests with existing _ name
> - Namespace attributes which are attached to ast nodes with
>    _pyflakes_ to avoid conflicts with other libraries (notably
>    bandit)
> - Add check for f-strings without placeholders
> - Add check for unused/extra/invalid 'string literal'.format(...)
> - Add check for unused/extra/invalid 'string literal % ...
> - Improve python shebang detection
> - Allow type ignore to be followed by a code # type:
>    ignore[attr-defined]
> - Add support for assignment expressions (PEP 572)
> - Support @overload detection from typing_extensions as well
> - Fix @overload detection for async functions
> - Allow continue inside finally in python 3.8+
> - Fix handling of annotations in positional-only arguments
> - Make pyflakes more resistant to future syntax additions
> - Fix false positives in partially quoted type annotations
> - Warn about is comparison to tuples
> - Fix Checker usage with async function subtrees
> - Add check for if of non-empty tuple
> - Switch from optparse to argparse
> - Fix false positives in partially quoted type annotations in
>    unusual contexts
> - Be more cautious when identifying Literal type expressions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyflakes_2.1.1.bb => python3-pyflakes_2.2.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyflakes_2.1.1.bb => python3-pyflakes_2.2.0.bb} (56%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
> similarity index 56%
> rename from meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
> index c13882240..911cf4ec3 100644
> --- a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
> @@ -1,10 +1,10 @@
>   SUMMARY = "passive checker of Python programs"
>   HOMEPAGE = "https://github.com/dreamhost/cliff"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=5127315117a8561a1504343d59620647"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
>   
> -SRC_URI[md5sum] = "a0f71a15724e553c46e03ba5ed56703c"
> -SRC_URI[sha256sum] = "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
> +SRC_URI[md5sum] = "48b1c29732ca810a70cba0e6d0531169"
> +SRC_URI[sha256sum] = "35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------256E95F64BC3EA99217AADD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Use LICENSE instead of README.rst for LIC_FILES_CHKSUM. Upgrade to
release 2.2.0:

- Include column information in error messages
- Fix @overload detection with other decorators and in non-global
  scopes
- Fix return-type annotation being a class member
- Fix assignment to _ in doctests with existing _ name
- Namespace attributes which are attached to ast nodes with
  _pyflakes_ to avoid conflicts with other libraries (notably
  bandit)
- Add check for f-strings without placeholders
- Add check for unused/extra/invalid 'string literal'.format(...)
- Add check for unused/extra/invalid 'string literal % ...
- Improve python shebang detection
- Allow type ignore to be followed by a code # type:
  ignore[attr-defined]
- Add support for assignment expressions (PEP 572)
- Support @overload detection from typing_extensions as well
- Fix @overload detection for async functions
- Allow continue inside finally in python 3.8&#43;
- Fix handling of annotations in positional-only arguments
- Make pyflakes more resistant to future syntax additions
- Fix false positives in partially quoted type annotations
- Warn about is comparison to tuples
- Fix Checker usage with async function subtrees
- Add check for if of non-empty tuple
- Switch from optparse to argparse
- Fix false positives in partially quoted type annotations in
  unusual contexts
- Be more cautious when identifying Literal type expressions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629171853.18608-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyflakes_2.1.1.bb =&gt; python3-pyflakes_2.2.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_2.1.1.bb =&gt; python3-pyflakes_2.2.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
index c13882240..911cf4ec3 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyflakes_2.2.0.bb
@@ -1,10 &#43;1,10 @@
 SUMMARY = &quot;passive checker of Python programs&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=5127315117a8561a1504343d59620647">&quot;file://README.rst;md5=5127315117a8561a1504343d59620647&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f">&quot;file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f&quot;</a>
 
-SRC_URI[md5sum] = &quot;a0f71a15724e553c46e03ba5ed56703c&quot;
-SRC_URI[sha256sum] = &quot;d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2&quot;
&#43;SRC_URI[md5sum] = &quot;48b1c29732ca810a70cba0e6d0531169&quot;
&#43;SRC_URI[sha256sum] = &quot;35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------256E95F64BC3EA99217AADD9--
