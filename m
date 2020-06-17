Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.83])
 by mx.groups.io with SMTP id smtpd.web11.9283.1592405049709454870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ABpa6ttH;
 spf=pass (domain: windriver.com, ip: 40.107.70.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOCRPADG1D3VrHzi1aMq9GOqbROmMfE7AKWhz9ftr/axSNZ2R+Enh5f1BIeNxYSGuZiPKjcwBZZg0aQfcZpOVIgKKBk4E7eUk9Eo1w0iL9THP7myCtZEN3E/xlY1VKdcCqOJXqLX59StCxe0zNRit7O27BBvUBAJphn183cAnhZg7SvBi0KQePDh1TmrVP9TjOxHswWbgfP6TzwEUNJm7EgBLRhO4UnT47fehR5QqKaafS9NLdxkzpGKf6ewOpIBSlYKkyWGyXPbKoMXZ7E3BjRiJZcmfLckmQg/94drIX1ETmahOMPOMBhaF08bmHsMWD11Eb/ZiVkOXUZP1odFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdbB3Db3gWkNfJQENy61zCcLezZQL8clF9C0EhKWDmc=;
 b=mgj5QJmULkfMjX33oqRLzj03LqlQf6/eUGNHE5ruCCi+xkjsqQRuPj38XALyguTU84tdKr22bKU7Bs7bqcN/nkCTz+WENYSNXlgHh0dJs/FdSiBcVhbsrteW4qkZJr81h35c9RIfBJDA/IjkhIowk89qIhI3CRu6LP9llbtupgn71/qX4eeVGfq9T+EbCz844DtxJ6fJM3m5TycOl+lMjHVjxoSErW4vzNDSFZubJI1FSW4TCAbJ1NqhWH7/qb49wUQCo/BHYpCkKQi+P1FU7oHbwnG98iTnP4vLPMts3rZtE/2JXAAzmrOs0oa+lQy9hzoWePTLnclhB0ryaGcUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdbB3Db3gWkNfJQENy61zCcLezZQL8clF9C0EhKWDmc=;
 b=ABpa6ttHBkryCkYVwZZE0oV6/VfjBuWLuMmScFQraU92Sb9il4N6eHC0ep2/UAm1cTUCqP2HL4JMiC1aiVXcPbe57IEWa7uR4HHc4Z/bHsDP9/Xqarp0crquPSDm8WOSAIml6bsBNrJEtqaY2V9WWVCK4oA7a1KCPy5zp0M3jVY=
Authentication-Results: xevo.com; dkim=none (message not signed)
 header.d=none;xevo.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 14:44:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:44:08 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-typeguard: Upgrade 2.7.1 -> 2.9.1
To: Ryan Rowe <rrowe@xevo.com>, openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com, mkelly@xevo.com
References: <20200617005409.44365-1-rrowe@xevo.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a3bfd2c-9d94-b522-152e-9f27cc6a8453@windriver.com>
Date: Wed, 17 Jun 2020 10:44:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200617005409.44365-1-rrowe@xevo.com>
X-ClientProxiedBy: YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:44:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8781d952-4772-4128-024c-08d812cce3e1
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1233B4531A5DE4EE05BAF44B9F9A0@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EpxlNXy8aW9gcxmxdizqq4xY5YTXHkOn0R1wYOkAaEb957Gh0IvXZacr3scoDObLwGgV4u6e/0Cybf/Z8wA/ZVzmexEFqzM3d23XUCCuSrHozT0Aco60eVfO9W9cel+2F/RBQIqjZq+BKWt99bq7dXqY6RrCuESK8JLzUppRosgGMrj8L5QQRgl4JXPd0wJD58frtaO1SW5jCQv2PZaiz2LHIsOCHL8vdAtSqfQQtWRj6H3JUvB1dsXH9F7v7g/iYTVlQK8PWIVJ2bR181fqCdpC7AaH47Wc98aLEpkm5ra/KJMsDkmcSXWeqLCDbh+/Xlbj1yf1Fz4EbNCU0kf7CB3OZp/d5a+hZc6BPw2jtCgbViln6I4+w9kQUWAGgKENfEvb7l54gZI+HuxII2dzKPfSGlRNYXULSgfV8DLPpHzOAVXmEBC7jbGBkWARwPtKgSUITBJ6phjejbalKaiZeA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(136003)(376002)(346002)(66476007)(33964004)(44832011)(66946007)(6666004)(5660300002)(31696002)(31686004)(66556008)(16526019)(86362001)(956004)(52116002)(36756003)(2906002)(2616005)(8676002)(186003)(6486002)(4326008)(478600001)(26005)(83380400001)(966005)(166002)(8936002)(16576012)(53546011)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KDCm0Nf7fmtTzpsLtb0e8isq03YQb/D99qrrJTR5MjIuFX0tSSV8Qx4DZ0hqY+XL5+7OLrJgv1KnWl08mgzaz3YBVVwEwBw96Lfb6Y79OTuG/FR+W6AnyPG31ng6dZZ3Zd6C1Admm8xqSXkDq8VAllBGoRQItNfaqVwL0mgRCfaymBLmcot9Hfm1IBNSVUSD3Zsk0r7ZsffTy7LG2Pfatz+SXN51kamAD5bJR0C7t2COeiGqDnECI6ls0bvlxKT1E1KU/cRga8+rdikY2LBfcf8T+YjmUdnr13Nf3oF8QKDD90STfuKoXT14XJtqM7HkvDDmnoExZwP+fkjvqJVxSaAwuZh/zScMsGzHAt7iRpohR0QPkEpljlSzYvxkuzGSrObEiXn+LSND0ZeZEHL05M2myPlWCmXIib7f92+FOarVvBMCB7nnVMlV5GXt+xtuBeCBH0PX6yKUvA6Kunp+mDbMlV18cshRb5pS/vLwS03rRTQ2wHAplbpCUVmvTdcm
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8781d952-4772-4128-024c-08d812cce3e1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:44:08.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YGHz9qAQ9WDbuzYys1o69GPWat5P0HIqpqd7loFQPo1E7vFPwSNzvRqtfVNOHMwjEy1lAv3Oy6iW152dfhFjdXbPljm8y76i12tocUXKgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------76990DFD263A06BEB5424A15"
Content-Language: en-US

--------------76990DFD263A06BEB5424A15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/16/20 8:54 PM, Ryan Rowe wrote:
> 2.9.1 (2020-06-07)
> - Fixed ImportError on Python < 3.8 when typing_extensions was not
>    installed
>
> 2.9.0 (2020-06-06)
> - Upped the minimum Python version from 3.5.2 to 3.5.3
> - Added support for typing.NoReturn
> - Added full support for typing_extensions (now equivalent to support
>    of the typing module)
> - Added the option of supplying check_type() with globals/locals for
>    correct resolution of forward references
> - Fixed erroneous TypeError when trying to check against non-runtime
>    typing.Protocol (skips the check for now until a proper compatibility
>    check has been implemented)
> - Fixed forward references in TypedDict not being resolved
> - Fixed checking against recursive types
>
> 2.8.0 (2020-06-02)
> - Added support for the Mock and MagicMock types (PR by prescod)
> - Added support for typing_extensions.Literal (PR by Ryan Rowe)
> - Fixed unintended wrapping of untyped generators (PR by prescod)
> - Fixed checking against bound type variables with check_type() without
>    a call memo
> - Fixed error message when checking against a Union containing a
>    Literal
>
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-typeguard_2.7.1.bb => python3-typeguard_2.9.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-typeguard_2.7.1.bb => python3-typeguard_2.9.1.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> index b62b60564..a0167cf03 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
>   
> -SRC_URI[md5sum] = "ef743359de59f8fe17e7c5e3af70e2c5"
> -SRC_URI[sha256sum] = "2d545c71e9439c21bcd7c28f5f55b3606e6106f7031ab58375656a1aed483ef2"
> +SRC_URI[md5sum] = "411df8eefd76ffa014328a46342bdf38"
> +SRC_URI[sha256sum] = "529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------76990DFD263A06BEB5424A15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/16/20 8:54 PM, Ryan Rowe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200617005409.44365-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">2.9.1 (2020-06-07)
- Fixed ImportError on Python &lt; 3.8 when typing_extensions was not
  installed

2.9.0 (2020-06-06)
- Upped the minimum Python version from 3.5.2 to 3.5.3
- Added support for typing.NoReturn
- Added full support for typing_extensions (now equivalent to support
  of the typing module)
- Added the option of supplying check_type() with globals/locals for
  correct resolution of forward references
- Fixed erroneous TypeError when trying to check against non-runtime
  typing.Protocol (skips the check for now until a proper compatibility
  check has been implemented)
- Fixed forward references in TypedDict not being resolved
- Fixed checking against recursive types

2.8.0 (2020-06-02)
- Added support for the Mock and MagicMock types (PR by prescod)
- Added support for typing_extensions.Literal (PR by Ryan Rowe)
- Fixed unintended wrapping of untyped generators (PR by prescod)
- Fixed checking against bound type variables with check_type() without
  a call memo
- Fixed error message when checking against a Union containing a
  Literal

Signed-off-by: Ryan Rowe <a class="moz-txt-link-rfc2396E" href="mailto:rrowe@xevo.com">&lt;rrowe@xevo.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200617005409.44365-1-rrowe@xevo.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-typeguard_2.7.1.bb =&gt; python3-typeguard_2.9.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.7.1.bb =&gt; python3-typeguard_2.9.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
index b62b60564..a0167cf03 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/typeguard/">&quot;https://pypi.org/project/typeguard/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53">&quot;file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53&quot;</a>
 
-SRC_URI[md5sum] = &quot;ef743359de59f8fe17e7c5e3af70e2c5&quot;
-SRC_URI[sha256sum] = &quot;2d545c71e9439c21bcd7c28f5f55b3606e6106f7031ab58375656a1aed483ef2&quot;
&#43;SRC_URI[md5sum] = &quot;411df8eefd76ffa014328a46342bdf38&quot;
&#43;SRC_URI[sha256sum] = &quot;529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------76990DFD263A06BEB5424A15--
