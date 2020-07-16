Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web12.21427.1594922657711584197
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fqrsVaG0;
 spf=pass (domain: windriver.com, ip: 40.107.223.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8IeY5/z+xHkur8cmCc7c+e1FMQmHTXbAbvgFXZXk5gRtxOb+xBrYpTuZ2nqjH985m8IW/Qo3zS2W0gOLYO8u7fQgUGlNowv9A+PHv+F6EDJR8kIwDf2Hn2E8kractYgTB9vtuQIz8QXi1/q7BWqI1t+zxoYL9RSIYbJvS9llKOsbS/JCpi451zRR4Wc4eMkIZhPQeCxhwd+U/NXEnWS7sc0ukftGcD1Fz3QWwTH7WGRyjB8InS/qq1vmoKbjD6nnRzB1iZo273ItwtmHr9EqQtzdLQ84orG78thXP8g32FAztsIG++Npz7BqhlmnIYWTSdseCqj55iC1ehHVX1bKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si2KXTIydr7mN9VQ7UkU8n+303UON1oXs9oP+pOn3Zc=;
 b=drQmP7EANvFA8c2DF8vX12PNPkK+gVGkktFvJEcbK90Ec5At/+ta9Jnmo42FeQcFJKX45cAPQgV5rOL1DLhaMi6lPkzQWjuQrdWz08Nz64T88HT63aH+Y8SPA29o69k08QABELNalnvBC/Q5SH+TjEOLp0bACkhMndQvv68RPDNn9M7L8XUUbPoCmlfHq3WYAmH/EEwVFpa3cHLVfe9tYMk9yRFgOryftgrHC3rRfJR6RvEgxHsiRYUyhKBlDKTig4KVzvyhLeRIR8Czw3jSeYoHlJyK9Gsc7v5fiH8sVobv8rHVv7OIzNlsZW1p690vMTxQC52rVNSAI1gNbnGnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si2KXTIydr7mN9VQ7UkU8n+303UON1oXs9oP+pOn3Zc=;
 b=fqrsVaG0JNxGbsIIZVwZv/mdGtZ7g6U+0ifBZfkpYABSKh3P9fpfIuFgyT9/7beO/QaS7soMbDWoJlymO32ltUbn46xGotxhQug+aPjW8mRBwDNFyG0dbd6CKXzKjQql3YEm+HmqD6B5Y9wXi+HX6d1BQdg2HcF2cB6l8ZVkFrY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:04:16 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:04:16 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-bitarray: Upgrade 1.2.2 -> 1.4.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
 <20200715152450.29018-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <213ce8e6-975b-84ac-99a7-bd12e801eab2@windriver.com>
Date: Thu, 16 Jul 2020 14:04:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200715152450.29018-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:04:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82988a7c-352f-4011-0250-08d829b2a782
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB00080FA62DA8DC53DFC2F1989F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x0c+Fsf3dcj0KdpDeGIHEEOEdgj1vnLWAEuVkC3ZKolkkfzMriDUtVqEAq5c4YPXYKFi8N6ZP7vKPczMbvha9tW0HJqb/lCaGe4twodTETsDwlnTp4uTGeMveVQSLqoP+NI8jHTqxgpyaqmCESu7BwpbOlkri1c0542RIrX4oQfS73mBH7OcP8QUgEg5gK4WwYs9KgjKdBXWsR+TE3HrzAFn/ki0if2uudq3oMWreDVoA8+k03S/MUQ1C5tvqeImx+SJovxkBQceuL91cHxkxJsHjX/hTRBdWSw6CKitn/vzqKQ1Fp5EmHQEnFN7qSzeDCgD2LmGFfYnMQRzbnOrNifXU57hMEtrU1Tp/diWiEvwRzvJuWikSRwl2Luqo3jXf1+U24FrX69ANK0XxdFTmGSUAiv/FWuc5CdvUfvd6x52xh6kij4PP0shtgvozcy/wDZOYDm3TWyw3osRs7QLrQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UInmHpdtwqvDxMaJ0SvAGDvuMp0k0RnJMc0oPa6s06Qps3JYSyViCByP4v9U61Hu2pcmLFwm599tCmZ8/eWpqhdx5mv9PNJD3AGq/CqP5jB+zbKr0HjnLuThBu5zYK1szfr8+R0oAXBLe6bAKp86Kc5N1LRHs7MrWil/Q2w5DO4AJYdU5Rccnnr2vFeZGUBz5HyO+l7ZJHcg87oyR1TGVo8dK+tykMxxjq2galvjlW0q8mDJB2NnpuOdeEnt7J6nwDpv0P8OUsZi2QXITHkF5u9jIwiTORoCtbHR+R1/MYGOrJTr0p5Xp4CGDzZj5PLezh8hqRudXM/mGc/BlLimZ0fAXTOP2Iz1OoxPKQIQ4jX+9WhpzaGS4TEwtcOWt2QZZENAT7KzBUCZOGRqTOxnbcIJyz3UApPpFPigOy5VulNHBTrJvyfSk4trrxN6zdVDx+BzEKfKB03l0lDT573b2gJ5VqueEHq0TnZHYpeDHt25Ufp3v6M1fYapH5S/fkAH
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82988a7c-352f-4011-0250-08d829b2a782
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:04:16.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcDCR90yeSCvbCJ5R1EPqEBV9dcrhO8VJQA94bLWAzMYzsPbfDrPwtFfEfEBq6Asuq9NtEH2rga8me6JRW8oOepLCnSHYcTudyENdWnX3CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------69E53DBAEB39E2862E550AA4"
Content-Language: en-US

--------------69E53DBAEB39E2862E550AA4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/20 11:24 AM, Leon Anavi wrote:
> Upgrade to release 1.4.1:
>
> * add `.clear()` method (Python 3.3 added this method to lists)
> * avoid overallocation when bitarray objects are initially created
> * raise BufferError when resizing bitarrays which is exporting
>    buffers
> * add example to study the resize() function
> * improve some error messages
> * add more tests
> * raise `NotImplementedError` with (useful message) when trying to
>    call the `.fromstring()` or `.tostring()` methods, which have
>    been removed in the last release
> * add official Python 3.9 support
> * improve many docstrings
> * add DeprecationWarning for bitdiff()
> * add more tests
> * C-level:
>    - simplify pack/unpack code
>    - fix memory leak in '~' operation (bitarray_cpinvert)
>
> Use the exact line for the license in PKG-INFO.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 -----------
>   .../recipes-devtools/python/python3-bitarray_1.4.1.bb | 11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
> deleted file mode 100644
> index c495738c4..000000000
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
> -HOMEPAGE = "https://github.com/ilanschnell/bitarray"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928"
> -
> -SRC_URI[md5sum] = "81c48852b0bc538ac3ed25fae020360c"
> -SRC_URI[sha256sum] = "27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954"
> -
> -inherit setuptools3 pypi
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
> new file mode 100644
> index 000000000..4866e8464
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
> +HOMEPAGE = "https://github.com/ilanschnell/bitarray"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
> +
> +SRC_URI[md5sum] = "dfb3fe66ae989e4724747fcb0f704f56"
> +SRC_URI[sha256sum] = "9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f"
> +
> +inherit setuptools3 pypi
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------69E53DBAEB39E2862E550AA4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/15/20 11:24 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200715152450.29018-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.1:

* add `.clear()` method (Python 3.3 added this method to lists)
* avoid overallocation when bitarray objects are initially created
* raise BufferError when resizing bitarrays which is exporting
  buffers
* add example to study the resize() function
* improve some error messages
* add more tests
* raise `NotImplementedError` with (useful message) when trying to
  call the `.fromstring()` or `.tostring()` methods, which have
  been removed in the last release
* add official Python 3.9 support
* improve many docstrings
* add DeprecationWarning for bitdiff()
* add more tests
* C-level:
  - simplify pack/unpack code
  - fix memory leak in '~' operation (bitarray_cpinvert)

Use the exact line for the license in PKG-INFO.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200715152450.29018-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 -----------
 .../recipes-devtools/python/python3-bitarray_1.4.1.bb | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 11 insertions(&#43;), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
deleted file mode 100644
index c495738c4..000000000
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-SUMMARY = &quot;A high-level Python efficient arrays of booleans -- C extension&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
-LICENSE = &quot;PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928">&quot;file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928&quot;</a>
-
-SRC_URI[md5sum] = &quot;81c48852b0bc538ac3ed25fae020360c&quot;
-SRC_URI[sha256sum] = &quot;27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954&quot;
-
-inherit setuptools3 pypi
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
new file mode 100644
index 000000000..4866e8464
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;A high-level Python efficient arrays of booleans -- C extension&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
&#43;LICENSE = &quot;PSF&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;dfb3fe66ae989e4724747fcb0f704f56&quot;
&#43;SRC_URI[sha256sum] = &quot;9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f&quot;
&#43;
&#43;inherit setuptools3 pypi
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------69E53DBAEB39E2862E550AA4--
