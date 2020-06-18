Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.75])
 by mx.groups.io with SMTP id smtpd.web12.1912.1592508709422936496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 12:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XxVum+X6;
 spf=pass (domain: windriver.com, ip: 40.107.236.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYMfRMmwXMnLwrRYZfOgTp78EXjdZNqfibZA7DiINT7+8DjAUJF8bgCAoW0qJfYMj5EszRPwGiLxCsKn/O8kfsLoUEryPjYZc6YrjpIAjM+wVJRIeGTTLjZhROBjlgfSTTQz0PkvRquB6jkux1RyVTo2tn3V3Pm1LF50Y8yD18EUEa7bY8HQ5rK5KxvUG2c+35X0bNv6m+Or1tvhp4ABU/1jpFeSldr9uUxFeVW00bJUYWbf/7pwhwkQJoZihoOGNBDF/ozJAzvLT9CDtvCWOBhfVf4f9Kqwgrq9s2MncvrIdP20vIN8U7JKCTu/1nGPsr6xxBpRf06uW48W1GHdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLzmSOMChjsJR5FAk2Je9V07CyohGNF30mfISAqd5GY=;
 b=fjUUieN72OLcdK8mwkVmy80fnmTdjgbow4ZUxxhzCwqt5mTaVr3GXU4Df0FbbrLMxxKG1ti09JkCYSZZLZ4gu8kEstQGGpSwPkDbE/bd3Di9u9SUzMdSbbayt8/EV8rn5j5oZxDWiYhwA29mDwAmux89hkPhWrc4zkk9n0FblovE2btRuy8/JhStgr8j3+7BU9ypaxoGxU3Qt0Cn9DInTpVhJ3qlgF2izuDAvS7jOnVXG3jJZ2mRrV/+LyZ9PlEX4QqSL7XrDBWJPjU1piET2vYdGBMkKxPNQb3Hpx3cN68tg6abB4MycTPPmzMJc4PAqnimPLUgIvG0Gm38jGq/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLzmSOMChjsJR5FAk2Je9V07CyohGNF30mfISAqd5GY=;
 b=XxVum+X6vaHYls1ESv3pUFumUPhYKdvhtFmrMgV49M78C8Rq9qGRvZJCVFbP9HQUYBkB5yFJJ3dHvSuCgUE+BR01hevC9jP55t2enKm/o7dQT92pFTXmzOPzRrxtFnn4mlOso5TUl54jc+gKb4kJVgFwWm5JvGvjUNQH5aKYbL4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 19:31:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 19:31:48 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-periphery: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200618090358.31927-1-leon.anavi@konsulko.com>
 <20200618090358.31927-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7017dafc-51d1-ae6e-adf6-aeeed81844d4@windriver.com>
Date: Thu, 18 Jun 2020 15:31:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200618090358.31927-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Thu, 18 Jun 2020 19:31:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f5210b-dc7c-4139-7075-08d813be3dff
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB20507315354640F1419C06629F9B0@BN6PR11MB2050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0ZQlO5euRKwnXAPj+j2UhDHE5HpTxII5KCuZQADiz9iyvYZgoig9EtJ2tetH3Hqmjrjn+/f6iGxKRRFUmXSglnA874iQ+xHTNVJCt687d45uo/RoOmiIZnoLs6AzW+Lt575K9RKMFvzDRlb1VhBEaRhPwiDc3D0GmNlTGS2gr6l2WRodXP11VDb/TH28vkRESOEHvIWqIyGFbbeABFWdUVcQona2emJb4lMDZfruwpYLs4rlHcAYRYxQs6aq68ldGjFXXx27Wyt/SLPCBTC8jDoq4Y2xilx6Uimt07WrmWZUxWWdrQZfRiJA0VzLdMJbc821FUZxpSlGaAndLq3XV0wg93pUOkCXczgGC3hRLutcre0ff84n/qY+o2jDOjEiwH/Yucc+yHSoeo1yGSgPXE7Qc58Rno2MnDlu0qsovqcuAIIJJxmTCA9pqEBdUPZKaAr+TlXzjXYzSaPYHiU5rA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39850400004)(376002)(366004)(44832011)(6486002)(33964004)(956004)(166002)(83380400001)(2616005)(36756003)(478600001)(86362001)(31696002)(53546011)(31686004)(8676002)(8936002)(16526019)(26005)(966005)(2906002)(316002)(66476007)(66556008)(5660300002)(16576012)(52116002)(186003)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	t75H7FSKJd6KR7CeOh0ZichuWqYjySlVAZIoP9Sfp9/Pw7bAiew8PkVG/2TRZMZpNrXtsWd6UO58+o4tUVkCaZjbCZGzWECD4et3aRZOzzTUsLL9k5V6zZbIeK4kbh0CUPc4Qa7m4kOKbJJt4jxReTJ+mt43qswTXe5c+1mIf0joTmY6ONi5qHzDzBq7ZWFHD71zIaS3dB4dQoyS/ByVjljoQFdEGqP4JSdZy6H7xq1rmrObAvVbPMOmCjqtkFKhXy0Wrye0iir4JSsgbG6skmozNwzTiRWw9EwEEg7kJgtD7hop9kunxIqxesOOAAbbH3Wef+7/0vCTPBkOJlWuGKtqZaM5CHF/1Wq2Fbq9OB/VwLWAQMh/PfYrqIU6UtdrjqHnJ9rYIbf1XQwubM4GNiul8MpCOrhXUJhcf9hhd9QsqqZCzJPl9nqGcZmaZwi5MoSfs+XSiugYyI1+IJZa4dD9tip5dqVSUPghnkcbfrrlIo4ClHddP8Q054ea79VD
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f5210b-dc7c-4139-7075-08d813be3dff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 19:31:47.9581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9DQyoBI0eGFWj/mq2g2NTohSG8KKVfbigobOamTYnPuQIM0R6BuGlHBfHbzg3uIYLL5KvMNSbLB0dHUgtnxBd2D287Zw4zSBgjht6lemuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
Content-Type: multipart/alternative;
 boundary="------------2A7293E3DEEA5481A1CACBC8"
Content-Language: en-US

--------------2A7293E3DEEA5481A1CACBC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/20 5:03 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-periphery.inc    |  9 ---------
>   .../python/python3-periphery_2.0.1.bb               | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-periphery.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
> deleted file mode 100644
> index 0171f63f8..000000000
> --- a/meta-python/recipes-devtools/python/python-periphery.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
> -HOMEPAGE = "http://pythonhosted.org/python-periphery/"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
> -
> -PYPI_PACKAGE = "python-periphery"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
> diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
> index e9944274b..1aa48625f 100644
> --- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
> @@ -1,5 +1,14 @@
> -inherit pypi setuptools3
> -require python-periphery.inc
> +DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
> +HOMEPAGE = "http://pythonhosted.org/python-periphery/"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
>   
>   SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
>   SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "python-periphery"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
>
> 

--------------2A7293E3DEEA5481A1CACBC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/20 5:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200618090358.31927-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200618090358.31927-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-periphery.inc    |  9 ---------
 .../python/python3-periphery_2.0.1.bb               | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 11 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-periphery.inc

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
deleted file mode 100644
index 0171f63f8..000000000
--- a/meta-python/recipes-devtools/python/python-periphery.inc
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-DESCRIPTION = &quot;A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/python-periphery/">&quot;http://pythonhosted.org/python-periphery/&quot;</a>
-LICENSE = &quot;MIT&quot;
-
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b">&quot;file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b&quot;</a>
-
-PYPI_PACKAGE = &quot;python-periphery&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-mmap<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bbb/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bbindexe9944274b..1aa48625f100644---a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb@@-1,5&#43;1,14@@-inheritpypisetuptools3-requirepython-periphery.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
index e9944274b..1aa48625f 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
@@ -1,5 &#43;1,14 @@
-inherit pypi setuptools3
-require python-periphery.inc
&#43;DESCRIPTION = &quot;</a>A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/python-periphery/">&quot;http://pythonhosted.org/python-periphery/&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b">&quot;file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b&quot;</a>
 
 SRC_URI[md5sum] = &quot;1d958f02575d4a19734ee2dd92336157&quot;
 SRC_URI[sha256sum] = &quot;5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;PYPI_PACKAGE = &quot;python-periphery&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-mmap&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2A7293E3DEEA5481A1CACBC8--
