Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web12.9899.1593090146919362353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h7UQohQy;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoEZ4/MyStEzJztzuQp3th6YKlL0Ty7f12FxJNH1S5ig4EY78e0gUAqXqOFdSUB8rF+XsK0Hq87/Hmy61PNhwL20yGCj0ZgWa3GqZgp91gCog7rZwGcrxtj9P5PV/InapChg9IiSeVtigX0LeeSdJJmiPphOv9lOt76JdwxiAgvAFiXPFaggrFPBXqC4MHjq+vHStdZ0PG3G8zceTYJRIseDe6Vr5UAnkSz5GFgC3NN5xvwEJYpM1J086kTRaWnDOp5oh78rQAhbsQkdPxgq7XUx7YW+0NE2dDOLKyXDzGDwx2P0uPgm1tsK4jyUdo0Drb3d4mY1mcLTpbkwa4WAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npNcjxVf0VAIjhKD2gu6LBvNtiLZoA0XpCRTK/qgAvw=;
 b=Xa/BEkLCKECdcxxlDeICmLrgxaSM3rdExjpnC8iD85ffkwm/OZIrrchZGgMvoGAlEYfEOAMaMKSucKc4hFkdVBdsjXCMHC1nMSS+7X9+wysT6CeNo/PMCLfXz14hm7fkhWRv05GB827A2WAUy4q9ELUulHT/FWkiY9RqdJ3zARF9TtRV31rtf7JmN0SWE3XrEn+nP/jb5B818KcENRGZ7IUuDyQvqIx76fSv24J3iSp3w6eJHT5CGQHY+mnWN/lCUI1VWgGoY2FE4tVxIlxeytW/5ZtbTp6ED1+Zb1MZ2NAE/1Z2O72rIjm3757OGmnOGXEAmOPBeNrbrHDD4KUKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npNcjxVf0VAIjhKD2gu6LBvNtiLZoA0XpCRTK/qgAvw=;
 b=h7UQohQygzit6/o0WWF/4wnNLfK3gJXGpboHMQFiHDw/i2h0q0/YHXy0NiCWwZM8WGxDKx90+7FGaKzNvDwCjT4BW8kkC453rO8qL1ELfPRmd9edCwqh3CLlNsLoTQxldAxIOyiMOYjrizR9HIVXNcewmXEqeUR7zbmJ6FK8zlc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:02:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:02:25 +0000
Subject: Re: [oe] [meta-python][PATCH 10/11] python3-pint: Upgrade 0.12 -> 0.13
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b1f6d412-f618-d4e0-7cb1-dbc2d9c9da2f@windriver.com>
Date: Thu, 25 Jun 2020 09:02:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:02:25 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33a7214a-cea0-4373-9518-08d8190801d0
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4161BCEEF7B966EB9215769A9F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NYjx+woGLRvi01WZAJ36L6VE4OmuZYKHq6uv+oVDQ7tbVLj4fCfc/TtBx6YJR/ZUQmKUWSh9kxLFd2KDTc8POKzKLljxLK5L1vCoWdbxiBjs/hXRhjxGEBIyi2GXv9WiLNcfsdrfVpGS33ejcOYdWvs+MgwmtOLo4nxoHRmDB96C9gXpczdhcdIhA8jNXWwZoqfmNAfRAi6yYe/rk0nTdpWpIaJ399b0w5P0MQIHvXB+D36C/boDPiHTihQWGillQ02GENOKghbh8cZi6TfFlb+7svI8FbL0B1nUItPELRm47/hQ+scZt3qxF9uVfoQqWYvAb48JMK4USdZLhTSeuROHgfmtx6hVbTHbeOHg/tA7xsl/FIspBkfEycVYQflDFH1Z0xU3Pwbq9+aglnM1GA3/m4oojBZLLTLzesb2rYRyT9HsDDVve4EbAwq5T17dZP4NP5h6iWJiT0sDAKnahw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	chThOZEt3E/sqtVocDx6XJw7YWShiA8ywDipPp3j8906RDJdlOkEn8GWoytSUArWndeGMsylmwwT1QKattmFx41y5OOh4mHvxLf2k538dCn6eeTwdjnXpJJsqUTII4PXlYi+13vtyNI141XZ3Ta6LSPLzOYSGNieVM7vYSrRuo3z8Pu1q79TuIJtjXRLg7dkCU9/hYbIoutOqxYoZKu0ZV1hSqFYp0wJ15iL3c/2oFJGpfDh6if6ECx1X42W9fF5xesVx+Wf8TGDFf1Rq3/peSCvMKTwyF1QEBRMuMmy7aiCimgV9iOV2zvZcp+uxUqQE5+qJrMHxummmUFaH9SdK+uDbAGwve9ENqtkxZ+z02v88V25xEnp2tbOeSCYTUY6TKgZDoPMmiDVrJpAOO525F//NvJ4/GPlmVzKD5l/hWDN+TUDz97ZI9kx7xtMuoSJ1W9Js5XasmF614CQEvF5a2rhERNNBQzfynGafvAhja1JHXsV257BboLTQW5oB7zt
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a7214a-cea0-4373-9518-08d8190801d0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:02:25.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHhUMfGLb9Ho8LjpSo9Rzk+wUjUlYwU0O8Oje6KTD5Mxrb9TcK/wyNi77MIZwXEroVbfMFmZHeYWjdHel9i5bxGxrqwObu0JVbrI+UKZ+VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------629DAB6883580D64F61B06D7"
Content-Language: en-US

--------------629DAB6883580D64F61B06D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 0.13:
>
> - Reinstated support for pickle protocol 0 and 1, which is
>    required by pytables
> - Fixed bug with multiplication of Quantity by dict
> - Bare zeros and NaNs (not wrapped by Quantity) are now gracefully
>    accepted by all numpy operations; e.g. np.stack
>    ([Quantity([1, 2], "m"), [0, np.nan]) is now valid, whereas
>    np.stack([Quantity([1, 2], "m"), [3, 4]) will continue raising
>    DimensionalityError.
> - NaN is now treated the same as zero in addition, subtraction,
>    equality, and disequality
> - Fixed issue where quantities with a very large magnitude would
>    throw an IndexError when using to_compact()
> - Fixed crash when a Unit with prefix is declared for the first
>    time while a Context containing unit redefinitions is active
> - New implementation of 'Lx' String Format Type Option
>    The old implementation treated 'Lx' as 'S' as produced by
>    'uncertainties' package, but that is not fully compatible with
>    SIunitx. The new code protects SIunitx by fixing what
>    unceratinties produces.
> - Added link to budding `pint-xarray` interface library to the
>    docs, next to the link to pint-pandas.
> - Removed outdated `_dir` attribute of `UnitsRegistry`, and added
>    `__iter__` method so that now `list(ureg)` returns a list of
>    all units in registry.
> - Replace pkg_resources.version to importlib.metadata.version.
> - Fix typo in docs for wraps example with optional arguments.
> - Add momentum as a dimension
> - Fixed a bug where unit exponents were only partially
>    superscripted in HTML format
> - Multiple contexts containing the same redefinition can now be
>    stacked
> - Fixed crash when some specific combinations of contexts were
>    enabled
> - Added support for checking prefixed units using `in` keyword
> - Updated many examples in the documentation to reflect Pint's
>    current behavior
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pint_0.12.bb => python3-pint_0.13.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pint_0.12.bb => python3-pint_0.13.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.12.bb b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pint_0.12.bb
> rename to meta-python/recipes-devtools/python/python3-pint_0.13.bb
> index 626af0554..9a081baba 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
> @@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
>   
>   inherit pypi ptest setuptools3
>   
> -SRC_URI[md5sum] = "0af699bc0ccdff56228b4a81216b4f7d"
> -SRC_URI[sha256sum] = "dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793"
> +SRC_URI[md5sum] = "6e60d42736f8175a57119aecc383fe4b"
> +SRC_URI[sha256sum] = "13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2"
>   
>   DEPENDS += "python3-setuptools-scm-native"
>   
>
> 

--------------629DAB6883580D64F61B06D7
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
    <blockquote type="cite" cite="mid:20200623095136.24854-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.13:

- Reinstated support for pickle protocol 0 and 1, which is
  required by pytables
- Fixed bug with multiplication of Quantity by dict
- Bare zeros and NaNs (not wrapped by Quantity) are now gracefully
  accepted by all numpy operations; e.g. np.stack
  ([Quantity([1, 2], &quot;m&quot;), [0, np.nan]) is now valid, whereas
  np.stack([Quantity([1, 2], &quot;m&quot;), [3, 4]) will continue raising
  DimensionalityError.
- NaN is now treated the same as zero in addition, subtraction,
  equality, and disequality
- Fixed issue where quantities with a very large magnitude would
  throw an IndexError when using to_compact()
- Fixed crash when a Unit with prefix is declared for the first
  time while a Context containing unit redefinitions is active
- New implementation of 'Lx' String Format Type Option
  The old implementation treated 'Lx' as 'S' as produced by
  'uncertainties' package, but that is not fully compatible with
  SIunitx. The new code protects SIunitx by fixing what
  unceratinties produces.
- Added link to budding `pint-xarray` interface library to the
  docs, next to the link to pint-pandas.
- Removed outdated `_dir` attribute of `UnitsRegistry`, and added
  `__iter__` method so that now `list(ureg)` returns a list of
  all units in registry.
- Replace pkg_resources.version to importlib.metadata.version.
- Fix typo in docs for wraps example with optional arguments.
- Add momentum as a dimension
- Fixed a bug where unit exponents were only partially
  superscripted in HTML format
- Multiple contexts containing the same redefinition can now be
  stacked
- Fixed crash when some specific combinations of contexts were
  enabled
- Added support for checking prefixed units using `in` keyword
- Updated many examples in the documentation to reflect Pint's
  current behavior

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pint_0.12.bb =&gt; python3-pint_0.13.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.12.bb =&gt; python3-pint_0.13.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.12.bb b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pint_0.12.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.13.bb
index 626af0554..9a081baba 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.12.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
@@ -10,8 &#43;10,8 @@ PYPI_PACKAGE := &quot;Pint&quot;
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = &quot;0af699bc0ccdff56228b4a81216b4f7d&quot;
-SRC_URI[sha256sum] = &quot;dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793&quot;
&#43;SRC_URI[md5sum] = &quot;6e60d42736f8175a57119aecc383fe4b&quot;
&#43;SRC_URI[sha256sum] = &quot;13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2&quot;
 
 DEPENDS &#43;= &quot;python3-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------629DAB6883580D64F61B06D7--
