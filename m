Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.55])
 by mx.groups.io with SMTP id smtpd.web10.17545.1592833586592839650
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FfvCGKQF;
 spf=pass (domain: windriver.com, ip: 40.107.75.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdnyyyMHHHSJFrPoUDkX/KeunSdLN7eRCXk79taGUK01DXfB/QwYOGgy7P5cHKGEAQJDQQrkUhy6PoZrBI0FbYT7C9EjMFHmtihlepJOROTK8kvtgmhrBgoZFTKVTHUDjg/6vHeq/5L5A2lBUpox0Qmd9FubXeq1ikYHa4LB9+yiO7BicuJUL6QYy+2jxnueleT2dg/2qgQZ0sF+ciSFaBA6/cuIffHh0QyLID9LSs5MC43t+4mAwWz2fLRui8rjUITv/EFCAqh003CR+q9VFDQVZ8jGC8/Ibe1ryhoqSlOW3fSBYsDrDyBJiirKPyIQslftenzy7Gx4YWFz0qgl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPnJS2xXZ+4yH9O8qGQ/Bpwa6KPuOZ3gWCoOjkSmYfw=;
 b=bxAt+e5Atnan6po0RJAvhyMI6fBhzjaBhafU2erqSgO0z0FMTiyFuhk2O1aywOcLulQh2EneBZ5l76iyPORoZtFfK8YyzLwk4ZfLVr+jjIISVcNceqZXSqcO5f1YxS0GR7+O7ecC+WSZ+gaEapkbqBRRB/y2yhLcIs6EC6fKGKzmcEGv2F4fe09+7CcnUmxIUH75r+8U5euuNALOnPOz5hqsNErcTCjjFJbTH/EYUDAcrIkA1fYCUo2P0xUn+8+lnY9/XPpwwOO51xkJcmIYjF4yR5T1fP8jB5G2HTVjtzcJd+HLiwvxBYpVRN9VD+kRx+ydR7V7hluJcnrhWPJ1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPnJS2xXZ+4yH9O8qGQ/Bpwa6KPuOZ3gWCoOjkSmYfw=;
 b=FfvCGKQFQY1UW2F2hfExkf2GKg/J3VUkHHVttpMWW/m7MCD0h5aqgwxSk34uMkeHv7I5mRnrRGuQFVG09wyNLOMSm/+Gzyr1kVW4H+42j59o+X89TRuF4ECC5okvA1XHwTSMlKnUYfbTmTvqSxccUJ9f65N2PH0jlHHw4+7bTxY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:46:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:46:25 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-prompt-toolkit: Upgrade 2.0.10 -> 3.0.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e0cc2a2e-8c2b-a316-fd51-d1a87506aa0f@windriver.com>
Date: Mon, 22 Jun 2020 09:46:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:46:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4768c0-4b39-4939-70ec-08d816b2a7d4
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1779EB63958B7FA31B935E6F9F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rQmsz1fthnZ4XtJ856m07LBItjiUFjmFojjBm5h29w7eAm2H2jy8+rjzvip0NfwyOOwSFwHipDAcUC0rM2kz018lqIKgb2smKnAfdrJIgazKhkGsAn+ulDQUd0BZUCWSriIKrvILXOCPlabljmU4AcD/AHMoVNWfzTV8lmR3gUYjKMn8byXLon6V47cdjharaglgUeBtHhlTlFpmiRFXV388ISvjI5Ii74kt08TiPsBjNiSmX5gJgLrs8YhdpLVpxdl21hKzN1bSWeF0f/lJh0HJFOpjX1BEtq7kmuclL5V/LEz++0zXka2s9Etd/+oW9kIXjF7D9CYvF99FmV1uUWKJY9VYf76/P7hTVlfvccNt3FxEYjaghK4GJQlgpc5j3TpOjDyVIJq4eszBzzLENegTE4IQBFuqFaylo0qvBfMqMKJROaxRuanDHsAWRl90Nu/az2cuOBz6VzqT2T8XtQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/rDWjhN37JW67lfjwnb5Ht/NsoOYqol4kYjIJartImCrsWfOsu6aE20vHwoqSHCMBMdIGGVOYkPiAuy53TtVaS5Z6/74I79LgRb41jUSt8Tsn7kDcNINrutvZvrCuaDukqB6FNRoKgoWisy+vZpUfYiaFfobQtGRtugMtGnGo7P5pQbQiulX2bRLN9oL3hJvlRuatm+CUcE8lczcLnKKL4HEm0hgNSMBoo1l6O1oBGSpxRDk4VodE59rGPs8v03f/iw3p9zcWJqbRtt8TWrhxD9RW4ThJN9rg2aWpmjm01Do9GysH7wK9iLLNUz/Z0dJcI/XFbILl+3VBpH6KdceJoj47Dx8NlT+GJtHtScsHyQrFCAZjigxsnYPtqS/nwKBGYKtB4OHdGBcH/05M9TH/XDyGHcRJgquUZBgb5gy/itfu7KLqJ8Lv/1Y3wqmGOn1ao2oNp1MbwxG2tCy1LaQ/OZPx1RgD1iK1hk0uAf/hcs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4768c0-4b39-4939-70ec-08d816b2a7d4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:46:25.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEwfM84eEGvJ7Whrt+ucrDV3UMypkDwntayP6QieapDSq1tM4M1Iydd+cXcH1Au1VfbOAUq64SJ3gN9oNmEbABACIlspIzBbRCKRNkGvgy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------882B95E51F84515191A88473"
Content-Language: en-US

--------------882B95E51F84515191A88473
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Upgrade to release 3.0.5 and add HOMEPAGE. The new release brings:
>
> New features:
> - (almost) 100% type annotated.
> - Native asyncio instead of custom event loops.
> - Added shift-based text selection.
> - Added many more vt100 ANSI sequences and keys.
> - Improved control/shift key support in Windows.
> - No Mypy errors in prompt_toolkit anymore.
> - Added `set_exception_handler` optional argument to
>    `PromptSession.prompt()`.
>
> Breaking changes:
> - Python 2 support has been dropped. Minimal Python version is now
>    3.6, although 3.7 is preferred (because of ContextVars).
> - Native asyncio, so some async code becomes slightly different.
> - The active `Application` became a contextvar. Which means that
>    it should be propagated correctly to the code that requires it.
>    However, random other threads or coroutines won't be able to know
>    what the current application is.
> - The dialog shortcuts API changed. All dialog functions now return
>    an `Application`. You still have to call either `run()` or
>    `run_async` on the `Application` object.
> - The way inputhooks work is changed.
> - `patch_stdout` now requires an `Application` as input.
> - `ShiftControl` has been replaced with `ControlShift` and `s-c`
>    with `c-s` in key bindings. Aliases for backwards-compatibility
>    have been added.
>
> Fixes:
> - Bugfix in invalidate code. `PromptSession` was invalidating the
>    UI continuously.
> - Add uvloop support.
> - Forwarded `set_exception_handler` in `Application.run` to the
>    `run_async` call.
> - Bugfix in `NestedCompleter` when there is a leading space.
> - Bugfix in mouse handling on Windows.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...mpt-toolkit_2.0.10.bb => python3-prompt-toolkit_3.0.5.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_2.0.10.bb => python3-prompt-toolkit_3.0.5.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> index d9ece8dab..b4d20c2cd 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
> @@ -1,9 +1,10 @@
>   SUMMARY = "Library for building powerful interactive command lines in Python"
> +HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[md5sum] = "5016c523e603cd7119644fbc0f00ce53"
> -SRC_URI[sha256sum] = "f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db"
> +SRC_URI[md5sum] = "96ba0be8d3145eb70e3da25654987670"
> +SRC_URI[sha256sum] = "563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------882B95E51F84515191A88473
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.5 and add HOMEPAGE. The new release brings:

New features:
- (almost) 100% type annotated.
- Native asyncio instead of custom event loops.
- Added shift-based text selection.
- Added many more vt100 ANSI sequences and keys.
- Improved control/shift key support in Windows.
- No Mypy errors in prompt_toolkit anymore.
- Added `set_exception_handler` optional argument to
  `PromptSession.prompt()`.

Breaking changes:
- Python 2 support has been dropped. Minimal Python version is now
  3.6, although 3.7 is preferred (because of ContextVars).
- Native asyncio, so some async code becomes slightly different.
- The active `Application` became a contextvar. Which means that
  it should be propagated correctly to the code that requires it.
  However, random other threads or coroutines won't be able to know
  what the current application is.
- The dialog shortcuts API changed. All dialog functions now return
  an `Application`. You still have to call either `run()` or
  `run_async` on the `Application` object.
- The way inputhooks work is changed.
- `patch_stdout` now requires an `Application` as input.
- `ShiftControl` has been replaced with `ControlShift` and `s-c`
  with `c-s` in key bindings. Aliases for backwards-compatibility
  have been added.

Fixes:
- Bugfix in invalidate code. `PromptSession` was invalidating the
  UI continuously.
- Add uvloop support.
- Forwarded `set_exception_handler` in `Application.run` to the
  `run_async` call.
- Bugfix in `NestedCompleter` when there is a leading space.
- Bugfix in mouse handling on Windows.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...mpt-toolkit_2.0.10.bb =&gt; python3-prompt-toolkit_3.0.5.bb} | 5 &#43;&#43;&#43;--
 1 file changed, 3 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_2.0.10.bb =&gt; python3-prompt-toolkit_3.0.5.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
index d9ece8dab..b4d20c2cd 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.10.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.5.bb
@@ -1,9 &#43;1,10 @@
 SUMMARY = &quot;Library for building powerful interactive command lines in Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[md5sum] = &quot;5016c523e603cd7119644fbc0f00ce53&quot;
-SRC_URI[sha256sum] = &quot;f15af68f66e664eaa559d4ac8a928111eebd5feda0c11738b5998045224829db&quot;
&#43;SRC_URI[md5sum] = &quot;96ba0be8d3145eb70e3da25654987670&quot;
&#43;SRC_URI[sha256sum] = &quot;563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------882B95E51F84515191A88473--
