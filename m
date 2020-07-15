Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.60])
 by mx.groups.io with SMTP id smtpd.web12.4848.1594857155108319458
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 16:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lxUSQizZ;
 spf=pass (domain: windriver.com, ip: 40.107.244.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEr7s+4AU43MCA0dLaOCC+vyeAhP/eRCsQu2FfbkDvg3FiB81iNbxdo686ozx4Jy8dOTmVI1nbhpkS6TmK6iulWNciOJh36XhSAyCdMoljOvnT5AXybpiO26vG9X3l7eaEu+NlmwvlCisFND/QWbDWs8EJSr119+/L2Ie03hUhZp+w3gRjQ2qAGlA6MXhs280PGWkeXi5Fld+LXOBkpezRUeLnxrIunJk+4BJyJFZ46ABBt61ZWCbAnMEfqsapx02S9fUYRHLoRwItS1MUz2GZiF/yTFuDwR4LC967/ZW09N8llqU6dEbpvCc+aRCzl8+AYI5H9sKj7xbxWW29eYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NjtmksO20GUI+CbeajmCH9g2dXn9F8Y8X9LqHANm4A=;
 b=DQG2aMwqojTlRDFTrbwhEahwszJUaxr/C/q1fJCecPFXYMYBgQ9l7p5yCT/cIvGAfG06a6PICMcVrk+AksGR0YtVfUnyU1C0fqQtPuee50EazWfkriSlyIfBL3lmPOUp131nXs5rUFnEVJYC7hufVgd6DuPVRPyVSM1Tmt6X+CTFV/RmKs7QZz/tYiXjaC43kXJJQTH3ntfVrVLIOHlpDURU0TyWZxupUXfx/m8XGUEfg5+8dNZVibnuTi7NKRmEWaqq8Bq3iOTeeAwj6JR67iqkeQlTozQy8/9LZCqZhKTGbm4/Fd2Q7RdHVkXYLVcpeLP3Qkkw7w9XiKGQyaHS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NjtmksO20GUI+CbeajmCH9g2dXn9F8Y8X9LqHANm4A=;
 b=lxUSQizZdp0XI8yZmnlVvkAa+agcgmSQCLJCHFVrGIYrETozYmt3Iv9+H55Q5l1BJJEY+koCE1TnyweBDfBJv8bLxe0BaYCLwJRqeF6f3++vjrKDVPkbR6SjvQZF4VXQ+J5sF1m/Y8s3dQ9LROH9OiFNwrkHrMGjlWvGjnLjbd4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0055.namprd11.prod.outlook.com (2603:10b6:910:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 23:52:33 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 23:52:33 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-gmpy2: add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200711031932.5883-1-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <70ecd79d-5f56-1b70-7363-648394e0d78e@windriver.com>
Date: Wed, 15 Jul 2020 19:52:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200711031932.5883-1-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Wed, 15 Jul 2020 23:52:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097ab8c6-9d20-463c-6972-08d8291a2434
X-MS-TrafficTypeDiagnostic: CY4PR11MB0055:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0055589F445399A8CD5F80BA9F7E0@CY4PR11MB0055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	17mBvYdvKLf98w3UTGeS6+DorS9iNK7vt/zSBVFPEUuqxcqDqoVANpxtGnxnvbHt8Xl2amLytaHMscE5iLmR9O9gplGZwP+OmSH9JRbAWq2zn3h/z9IhUEEvpdSa4V7YB6x916siZ7gJ2FrR0XeGwhdZDt+MbUT6hfgB2JHa+P0TXAisJCR0xaYS0jV7VHAdVv2UdxDXi84R/OFzzMoQz2dwWKX523VjYx+FsqJCUkrrkhQSt6EUfeV4jp6zp+Mi15aJNr4WSmKI/Ip2NyZoAndUZmlpMEAw/PWa63YUydHXE5xvrvvt9JaLKHmFvvRh0uEdrKXzKMtAZQvv6fvwNfJmQq0ys/TlISU3GdNf8CdgboeqfkMz6tXiL8xoHEeJp+/NIdcFifLB0INC5Hm2GQqIdACcTFcTDKSYSg4TqKElpJmGzDJ3N5CU0m8oP208zCDoxwmYj+HqCeZI6RbxrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(39850400004)(396003)(136003)(86362001)(316002)(8936002)(31696002)(2906002)(5660300002)(478600001)(16576012)(166002)(966005)(36756003)(31686004)(8676002)(186003)(956004)(16526019)(52116002)(44832011)(66946007)(83380400001)(6486002)(66476007)(26005)(2616005)(33964004)(53546011)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XqNYXE7q27fstkETeeWSpoE2KwyWPmHK5MD/H7Ht/w6BzRe05oFO/v3iMufUJRZ5iRxed2ty46hQklgH/ivI1AidyVzUgSAy6+qsn9nYfxjV4PAb9D5yw8ZLfZqxW4pu1EXMIcRs9w3B2U9qYAoD9QUH5c0fYZp6ydCAG3jFbpnc2lFUzyoacgjrvbRFBiM0wsA8jrESeZJe4Mc5YUKOchpPttI5vXuKw9peFakVZ3BUj9bfZP1j8055Lai0xy9Ijfiaj8ym1qAASKU/f1q51WUpvtoFEPDsp4KLALdBaugp92vbdBxJSpyWTwaRBAhvsDUj3lx9RatgalftGhJQwHl4VreQloImrTx/rAEJuSBmLAXFsexS5ctrv7mef8jvd+OvuBQ4pQ1yD1BVLJPUy0e8+Cko/s64WzGKNr/0+Mn6/+NHNirP3fHuzMki9uBOJ0nKU9gz4vA7T22zM9bBd/0FtRqvh17s+bVdVM6VBeQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097ab8c6-9d20-463c-6972-08d8291a2434
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 23:52:32.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsMvXP0Rt40IHSApS+K+11qfX+dnpPadPZzoTjHmZ3hrFEAnOXR7aYIkAw+mcNbTco52X27kOlC2z3o7ukaSFnPDnNkEINiZYjfXE0+SkDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0055
Content-Type: multipart/alternative;
 boundary="------------7247B7136EECC95E733B0D27"
Content-Language: en-US

--------------7247B7136EECC95E733B0D27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 11:19 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-gmpy2_2.0.8.bb  | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
> new file mode 100644
> index 0000000000..c6edcbb320
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x"
> +SECTION = "devel/python"
> +LICENSE = "GPL-3.0 | LGPL-3.0+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +
> +DEPENDS += "gmp mpfr libmpc"
> +
> +PYPI_PACKAGE = "gmpy2"
> +PYPI_PACKAGE_EXT = "zip"
> +SRC_URI[sha256sum] = "dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
> +
> +inherit pypi setuptools3
>
> 

--------------7247B7136EECC95E733B0D27
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 11:19 PM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200711031932.5883-1-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200711031932.5883-1-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-gmpy2_2.0.8.bb  | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 13 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
new file mode 100644
index 0000000000..c6edcbb320
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
@@ -0,0 &#43;1,13 @@
&#43;SUMMARY = &quot;GMP/MPIR, MPFR, and MPC interface to Python 2.6&#43; and 3.x&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;GPL-3.0 | LGPL-3.0&#43;&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504\&#43;file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02">&quot;file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
&#43;                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02&quot;</a>
&#43;
&#43;DEPENDS &#43;= &quot;gmp mpfr libmpc&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;gmpy2&quot;
&#43;PYPI_PACKAGE_EXT = &quot;zip&quot;
&#43;SRC_URI[sha256sum] = &quot;dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7247B7136EECC95E733B0D27--
