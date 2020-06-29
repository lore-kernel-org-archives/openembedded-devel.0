Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.71])
 by mx.groups.io with SMTP id smtpd.web10.20572.1593442387258731213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I/VTATaJ;
 spf=pass (domain: windriver.com, ip: 40.107.92.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrOZi6TdJFQYGjE5Di7oGsfH2swWZqs4JqHFvl6qHhCkPVleOfQCZ4w6+Ez6r/iAQj1lDhBtu4QVkIBX27VSq2w0ZjZDGn+YKw+d9uAa89t+UhopzTgbrYnGs1Xsb5rSUUf2n9Byuqw83SaJpAhJXxEKbiArlSMJpvTv+bOCT85BPPtYZkkfFix4E7HQgosnP16kajtoSe8WvowJBxEsgY129b1bKBDAfGX0j/6hL04ku5+UQnqrc6YW/dsfjxIYje7YxmZG1OadCxAJwgVWJysUlsA63ABT32nALhfRMboBLVUpVql+eLZ4p9RBTy35P3x9/rJCRu2hE36fZosCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb3FEzTvW0eW5lUTjEgZsusOGU8IXs9P0kl514Px6CA=;
 b=ZHRg321Cx0niYpBh3c7cl8l8wLap7Askyik2nPVSMp8kL1nwWojrOyLXCIY64vnSXQM4LPXR4cCvqVT4cJasK9wm8ijXWnRZTZe6yJg3hBQ46GEaiWugnnG29T6u8JhfRLj2JOQB4iH1nWp6U+8IJCZ4mSbLbS9LK7z0GJTIL+doNZiDRQfDU9obAFlsXBDmxPf4fPqckEok1DVoZWXsFiaxdcm8OpkJHGyKNcBhjsg7RFkXXvm5G2jUP5FD1kJLgLD2ChdiaMxxGcuec+W9Truc4of3BujZyGqzsUdVgMg9w+1I3pxQEycbT/GKiJeiNQpoLjqyzNVsFscclvIuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb3FEzTvW0eW5lUTjEgZsusOGU8IXs9P0kl514Px6CA=;
 b=I/VTATaJqppyyufkRjgYuU1d9WzHILhXv6hH+Ng0ZMQsX+grIWYp57BgzpAaw0H/yqJ0QIl/S2/tI8IPnukkUH3tufXoLs5q2e5FlHzr3oZkdWxklcorBCehZkMBSG9IcmMY9rze87PeFjUfkdsg5UlFteiu31i1/R5LuewNaL4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:53:06 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:53:06 +0000
Subject: Re: [oe] [meta-python][PATCH 12/12] python3-pybind11: Upgrade 2.4.3 -> 2.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-12-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <92b4e917-cdda-8da2-d518-d43d0d6f324f@windriver.com>
Date: Mon, 29 Jun 2020 10:53:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-12-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:53:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f12d502-ea30-428e-4cea-08d81c3c2140
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19885D48F89E188E10FB27219F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+wZJFh0oKh5HRKnExjTgOXrx8OvT52blPVvrtKhabNPKk/sKWnQhXJAX8M2ngzlI2TY3m799J3gl1s12TVfUip2EpHEG5pUmrrytkCva82fSqDBmZJqh1pogEFo5YgaQ+HDVFZXd7rVrnjfykCHnNdo64LIV5TAIjaJN+Rz1uF62ueYAeasv7273h3i+WruLotE2PcG2ciyqkYHj+tGhQPiGe0WzPdwAXgtJ71DP5X5ttzqx9cUdCFECjf6g8ai3wirj2xXzEh8Wn75WaH3nPYRQURKX6s9OtE886DoE+nWpd2Y+xzwZC/PW30b715bI4TcPL5jpcsRedzdPh4pj8Sgd0NBAQyzrd35a60aXCF/N7zaXk7IhadP6qkENfHxTEgr+RiObjwVbznKSxViet0oxFGYFanp8FK82OGQKoKJskeh6kClST1x4YCky31GZb+YJuEHyFpnM4E/nhRYmrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bvvm1xKbCMixTzB9AX+M9EJCA0cOUqCcKSUY/g049SqSQNhls1uKFCNGxFTnrzRig3tioQl/Er3kSRsPqXukMqSy1sFfuW2dzY4JodDgs6/H9GWncPNPzO9p45XwCLYdQAuat9cgIq/8oMC+Amzl9C4GYb50AfWkJWYl0zigNxtqfsvkLJx5kb/fnlzXralEr1kOZloRX4dzgQQwwnWv2l9//G0/o9JgoUtBj8BNy5PbeHKTr07zE2CEJfgKtWFmZemQGRmxZ2TQ421MXWZn265qyuLZ+5S1baAdxocnDck9PmivIjNiGG7g687rH7BkTwa5pg37e90PTQN630fg8dVKN2drX0B5NbYNCRg1p1XgyB7bYX/FIQtT1/T85wGz/pqTsxllDsZppO9rlWOj+CqQ0kWbS04GcyKCsD6QFm0+PwrTMsUDTgvZsI6PJjrbpsHXPOPGmtXb5rnVIOZsun/p3Zh2enjXImHjbQm8YqrbQgnxUSQElYMe9wDnbQta
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f12d502-ea30-428e-4cea-08d81c3c2140
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:53:06.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7112rBsKtn9885jtFImj7QojVHCSlvQYEcHspUdpcZq4SmNHQsoZvE3BjYSRjC6fWXURJf9LRBF9YcZTY6iUVVrbU1vDvioIuEu1G8qImo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------4871CBCDA60D65114E230520"
Content-Language: en-US

--------------4871CBCDA60D65114E230520
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 2.5.0:
>
> - Use C++17 fold expressions in type casters, if available. This
>    can improve performance during overload resolution when
>    functions have multiple arguments.
> - Changed include directory resolution in pybind11/__init__.py and
>    installation in setup.py. This fixes a number of open issues
>    where pybind11 headers could not be found in certain environments.
> - C++20 char8_t and u8string support.
> - CMake: search for Python 3.9.
> - Fixes for MSYS-based build environments.
> - STL bindings for std::vector<...>::clear.
> - Read-only flag for py::buffer.
> - Exception handling during module initialization.
> - Support linking against a CPython debug build.
> - Fixed issues involving the availability and use of aligned new
>    and delete.
> - Fixed a resource leak upon interpreter shutdown.
> - Fixed error handling in the boolean caster.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb => python3-pybind11_2.5.0.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> index 9efa2db75..dc3b8f6ad 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>   
> -SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
> -SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
> +SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
> +SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
>   
>   inherit pypi setuptools3
>
> 

--------------4871CBCDA60D65114E230520
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5.0:

- Use C&#43;&#43;17 fold expressions in type casters, if available. This
  can improve performance during overload resolution when
  functions have multiple arguments.
- Changed include directory resolution in pybind11/__init__.py and
  installation in setup.py. This fixes a number of open issues
  where pybind11 headers could not be found in certain environments.
- C&#43;&#43;20 char8_t and u8string support.
- CMake: search for Python 3.9.
- Fixes for MSYS-based build environments.
- STL bindings for std::vector&lt;...&gt;::clear.
- Read-only flag for py::buffer.
- Exception handling during module initialization.
- Support linking against a CPython debug build.
- Fixed issues involving the availability and use of aligned new
  and delete.
- Fixed a resource leak upon interpreter shutdown.
- Fixed error handling in the boolean caster.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-12-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pybind11_2.4.3.bb =&gt; python3-pybind11_2.5.0.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.4.3.bb =&gt; python3-pybind11_2.5.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 9efa2db75..dc3b8f6ad 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 &#43;3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">&quot;https://github.com/wjakob/pybind11&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">&quot;file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62&quot;</a>
 
-SRC_URI[md5sum] = &quot;23fdca8191b16ce3e7f38fb9e4252b2d&quot;
-SRC_URI[sha256sum] = &quot;72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758&quot;
&#43;SRC_URI[md5sum] = &quot;5355e1fd05c8eedef19cc9bfd3d82a77&quot;
&#43;SRC_URI[sha256sum] = &quot;ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4871CBCDA60D65114E230520--
