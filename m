Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web12.12645.1590153066434625411
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 06:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EJlZ3CeH;
 spf=pass (domain: windriver.com, ip: 40.107.236.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4H9I++GrvgJQvjDOveKJZXfoQR9fYz2iUPjN3dkq9J8rpfR44SkAlFuvn7NOmzj4bSZ1gIEIQcJPkPR2og66rg8LkDNmYUCPECCnpbapcCjnjAPxq6XNs8xwEvcSakydZuNZb6psFnmjUyCzgiaudPpVO9afbxvCejWtFhSduEI9p6BgOlROJCSGe5vAA6LGgyb5MtW1k9QzKWZecL0jH8btHm8/TEISovsJyqIAQliItO1nIfHyhB7Y40c2M6eA5ABQuhSw4YIuRePJ9vLtgp4h0nMbVZtcKcAWotB5UMoXTFaH5IK/rZhA0EoIUonWrDAyHFQ0y5Pxo0LD4xe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwqXrJTaaSNhoLkWSX072OR6YyuS6LWWHvJLzoNochE=;
 b=LV4xTt6B4siusRpxOXZpUV5EDLJwNLeF60wj5vbRTM8prsdPMP0wYaHUhUNL6Rse2jGQwMp1XAedk3I4e9eCvXnjQQOtG7Oe9Ftfy0XuqT80SME7qz0nbW26fbncTRGWUSO1wqUQadj3ql5o47h67m9z2+dJRrDBQZlFJ5PSeB7Ut6AifQdDiMDEGfONjsNbDJDHJuCX1JfwyCnQ3p7R3pYk3NqfWEIIbwDo8w0WjADEy7Ah6jA22zk2t+7yYLHd4CZESKabI2WD2jVYVwtcrncVe/cugOIkGd9C3WWzQwJZqrzv5xUmqLAxZSBxh8+dFAAZ6vTgyolwhaUlxxqCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwqXrJTaaSNhoLkWSX072OR6YyuS6LWWHvJLzoNochE=;
 b=EJlZ3CeH+CUbRhhx1TDzLdBGXZ+UOUfLfZAgbYVRD6SGTH4vaQTXGjzmeraW0XfQboJitdbyQVh+3DoTVfYNGdY6sf5ozCn4aZs35w00vKWHFACQrJQpYH2atzGIw6EA6R1Q0kptK+LDaKxxMFJl/+VISQ++3QC3DUrDuVs5lBw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0050.namprd11.prod.outlook.com (2603:10b6:405:68::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 13:11:03 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 13:11:03 +0000
Subject: Re: [oe] [PATCH 1/3] python3-jinja2: Update 2.11.1 -> 2.11.2
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ca168199-e6a3-2638-faa5-39a457dac5c0@windriver.com>
Date: Fri, 22 May 2020 09:11:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200522121333.25045-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 13:11:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfc1923e-9687-4768-0059-08d7fe519457
X-MS-TrafficTypeDiagnostic: BN6PR11MB0050:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB0050A428ACAB549A7017E30D9FB40@BN6PR11MB0050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7hYtOSP2Ena9V0LlQ6xpZeQKcsV0FdPaqvASvq/CbJi/cEUkrsiyrkOAxTbptgzYjAaA1w2GGPRXrvvUe8NvMFcVqAMMsRrBdRREfPmf2ofFMeGP3SqCj/NKe9uoYZNomk7Z7NR8Tc0hPrFrJw/ZG8qyRX+Mdlj28bKYANVSf2pVqXy2yd1s25dnnO/NSzf7bqkOCiEzzL6+yetWZ31RcWjwHz2jS7JJjbEFWJgj7z/N35Zw0kUKrqz+/ncstRUZPb3vbU1Vgq5TEnxIMIS8Kteno07phxpQnRx/DSHumH4Cr/F3YyDk42dBaGVV429wtSXBblrh9TFEcR8swkzRPkUCkCfrQd3jcTJE5/ElzCqaUdtzBIRvht1Oh30wn/STA5mCjSyukLVMiFMzrdWrxDCrfyhdWQbHcdlfDkVqxHUZ2qje1uipzKjrc7X1jsg2con8j/AoDoQDLSGI+8Yc7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(366004)(346002)(376002)(39850400004)(5660300002)(52116002)(66476007)(8936002)(66556008)(478600001)(66946007)(53546011)(6486002)(16526019)(36756003)(26005)(186003)(2616005)(966005)(15650500001)(8676002)(16576012)(33964004)(31696002)(166002)(86362001)(44832011)(316002)(31686004)(2906002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DMu+JP7oQ/dru2oUoiK/Zt4r1VAXPkyGZppX93YDwKl61D/5X6hdl3bQTi1N+xM0V38jzjROTOKvsxMJO9rHQPsMBIYuiuDp1n5GC644MiL7Or9EHjrjpFuyhBM+fuxqML1/n6BSu0sRraivw/kvfAgckI1flAe+tw/zPFsluq/Az1FufNUljBfXCJoNz0tgdutcvmRv6rgd5ioImyWUv+9HWnOWtYjJTjs1qwSRX1KD8L86KPH1OAUhT7GUhNOXncv264JZr/a6YRNiK0oi5w6R9nAzc4bSCkaSBv+d6UvqMkuKFCyvSnCzXDjK2nAo9Zp1TnePdGJqmwJHhhHPbtass5HdD9m3zRvfAE2yL3zAEvjHqaUDY7IDC8P98mdsSbhn8DrDebgD8mox70LAtqfGA/TDfDkYqJp5OsbfeSv6ZhimZoVi7Cq+bX46R6cJ56zLB4CRGLNhrlhl3Zj1IYo88mFLfKe1wTBWa44UDBowTvJ6Oi94CGNrViGLxg0B
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc1923e-9687-4768-0059-08d7fe519457
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 13:11:03.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enIcuubdjMy3ZO7mx8nSkFQZBFrs3QZLL/wv19qaWkiuXHEjzMKiLLZNJwMexGmn82MQ6/Q3okuB6hOs4Oo6lDxkavCU4aCoL9HztYy9ksY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0050
Content-Type: multipart/alternative;
 boundary="------------D7645A908C3F5035AFC50B57"
Content-Language: en-US

--------------D7645A908C3F5035AFC50B57
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/20 8:13 AM, Domarys Correa wrote:
> Add .inc file to .bb, as updated to python3
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Looks like this is a duplicate of one you submitted the day before?
> ---
>   .../recipes-devtools/python/python-jinja2.inc | 33 --------------
>   .../python/python3-jinja2_2.11.1.bb           |  4 --
>   .../python/python3-jinja2_2.11.2.bb           | 43 +++++++++++++++++++
>   3 files changed, 43 insertions(+), 37 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-jinja2.inc
>   delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
> deleted file mode 100644
> index 927230515..000000000
> --- a/meta-python/recipes-devtools/python/python-jinja2.inc
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
> -
> -PYPI_PACKAGE = "Jinja2"
> -
> -SRC_URI[md5sum] = "5d88c7e77aa63fc852a04f65dbfe5594"
> -SRC_URI[sha256sum] = "93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
> -    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
> -    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
> -
> -CLEANBROKEN = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -inherit ptest
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -	${PYTHON_PN}-unixadmin \
> -"
> -
> -do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
> deleted file mode 100644
> index 284f5f588..000000000
> --- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -inherit pypi setuptools3
> -require python-jinja2.inc
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-asyncio"
> diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
> new file mode 100644
> index 000000000..681acf8f1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
> +
> +SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
> +
> +PYPI_PACKAGE = "Jinja2"
> +
> +CLEANBROKEN = "1"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-unixadmin \
> +"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-asyncio \
> +    ${PYTHON_PN}-crypt \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-markupsafe \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-numbers\
> +    ${PYTHON_PN}-pickle \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-threading \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------D7645A908C3F5035AFC50B57
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/20 8:13 AM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200522121333.25045-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Add .inc file to .bb, as updated to python3

Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Looks like this is a duplicate of one you submitted the day before?<br>
    <blockquote type="cite" cite="mid:20200522121333.25045-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-jinja2.inc | 33 --------------
 .../python/python3-jinja2_2.11.1.bb           |  4 --
 .../python/python3-jinja2_2.11.2.bb           | 43 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 3 files changed, 43 insertions(&#43;), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jinja2.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
deleted file mode 100644
index 927230515..000000000
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
&#43;&#43;&#43; /dev/null
@@ -1,33 &#43;0,0 @@
-DESCRIPTION = &quot;Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python.&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462">&quot;file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462&quot;</a>
-
-PYPI_PACKAGE = &quot;Jinja2&quot;
-
-SRC_URI[md5sum] = &quot;5d88c7e77aa63fc852a04f65dbfe5594&quot;
-SRC_URI[sha256sum] = &quot;93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-markupsafe \
-    ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers&quot;
-
-CLEANBROKEN = &quot;1&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-inherit ptest
-
-SRC_URI &#43;= &quot; \
-	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest &#43;= &quot; \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-&quot;
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
deleted file mode 100644
index 284f5f588..000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,4 &#43;0,0 @@
-inherit pypi setuptools3
-require python-jinja2.inc
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-asyncio&quot;
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
new file mode 100644
index 000000000..681acf8f1
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -0,0 &#43;1,43 @@
&#43;DESCRIPTION = &quot;Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python.&quot;
&#43;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462">&quot;file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;Jinja2&quot;
&#43;
&#43;CLEANBROKEN = &quot;1&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;    install -d ${D}${PTEST_PATH}/tests
&#43;    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-unixadmin \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-asyncio \
&#43;    ${PYTHON_PN}-crypt \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-json \
&#43;    ${PYTHON_PN}-markupsafe \
&#43;    ${PYTHON_PN}-math \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-numbers\
&#43;    ${PYTHON_PN}-pickle \
&#43;    ${PYTHON_PN}-pprint \
&#43;    ${PYTHON_PN}-shell \
&#43;    ${PYTHON_PN}-threading \
&#43;&quot;
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

--------------D7645A908C3F5035AFC50B57--
