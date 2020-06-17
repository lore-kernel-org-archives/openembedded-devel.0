Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.74])
 by mx.groups.io with SMTP id smtpd.web11.9308.1592405087254868180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a5T0xANP;
 spf=pass (domain: windriver.com, ip: 40.107.76.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz8DmddlXI9jL9zAm+eqslUvwTWDsum7Skt7GYazleJekfES2ZIZBzIKdwvG8dFq1n3jiSv8o46zLS8US6Wbqjg9vMfX0E3A8U5D/LWYR1e4P1eH2NRfHnfGtMjo8p0ftMjiiv4Cu+m9gOeoZ9uV04rNzGCDgTKW+Ilc2BThF0jo42qus5OFVoXYwjimjqq9R5AOPie51AhrgVVHxw4Ktvy8hUj1NjGKYvuD4hexBuXnwlqa+6zeDNRX21TxlKMeb152xY2cWP1CeLwY4Rp4MBFMC2/lsmGEtkqCo4dKQyjS93TQ5OeqGs+55j+W2ONyWOovo8RF0m1NdHkKI4oI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUx9XmhWQMdlsdTh0q8Kxgrf4J40LDe/zhhFBnRMF0E=;
 b=IIY750LXKnzP3SiDtBJfL0OVcgmHOLSZkq2xWxN2pxN7Jvb3x7COhWhYX3yNU4nC8xtX3lqGw6ou0mSEGqFu9AfzdDbMZwlQ8QajzjxoB6TJYN8kC/JF0eCYxXwSa80qlKleH1d3pJZNDrvXmjxz6/WHHG8eJugE7TMGd0rzTHgSlJilMKSc4i9y/paVjjh3ou6DEcq6W2MImkz8rRY/mKi1utnPlLplazCX+xD8XUtSt7L877NOPQlkltU02AYMZW9l/B0oTK016QlQzMk7d464hAZ70CxXvZUkcpfUGX9Wxd803OT/54OnQwG5XogKafdMfzIikAUD3TZd5rs92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUx9XmhWQMdlsdTh0q8Kxgrf4J40LDe/zhhFBnRMF0E=;
 b=a5T0xANP9lXxWKU/pZkRPWFQnPt9MthgPHpt/NXXSqDrOv1G5hApNMeXCzPYYZZgLq6/AsT0SRHDDMcfX4mvOGI/ppcz4E/KDPBK/s25rm0LUQAuwoFqlZ7KwRaZA82x6t9n1IPTYAGvBxLr2akUzRIoMcLIYFxI9jbMi7dnRyc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 14:44:46 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:44:46 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-ipy: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592231885-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <37d43bf5-2d44-b9b6-cd64-968116f1f438@windriver.com>
Date: Wed, 17 Jun 2020 10:44:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592231885-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:44:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30b0249-b641-4c2b-e911-08d812ccfa72
X-MS-TrafficTypeDiagnostic: BN6PR11MB1875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1875E5AFA192F534111B8F189F9A0@BN6PR11MB1875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8/17dEL4QoJaluPbLCCTNdU3pnIMPz/F+iVnwnuKgAfDOYl3cnNniQA+tofY9q2MZJb0+YhulDQpVblNW5QkuhL4LHV9ttOUh5sjFEYjW9S4aGlTRNqse3cK44mvx7eUBOHANqxWCFi2tnXivSnlMBjR1vC4qktgpw0QUOzkUuRmhdh+IQT3ceiaE3A9IHb3wA4Rfh3crljeaq/e7u0SguLHuXgxIBhSRfKBxs73LaYU2K+JcgUlnu9MBAP9mw3x4GjbWVQE8kQsiNZnZhLQGBk5gNuesO2k5sXBldSl/Z5zn11EdF224gecv2dijyfTgYtAA1wCwaAWckxw0O09KjwCuZZw+DmZ5o7u7ANmwXOJtU7dtu+bmePpYq8ttxXO3wQlNgTUR5akpFoTXVbUbd/vO5ZpBtOKUZ77Sf/kpal0qz0MODSVCKbWsnkghgHS2nUtUVPozsi6fTESEJU+xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(396003)(136003)(346002)(39850400004)(2906002)(26005)(966005)(16526019)(66476007)(66556008)(186003)(52116002)(66946007)(5660300002)(316002)(16576012)(53546011)(478600001)(44832011)(6486002)(33964004)(956004)(2616005)(166002)(8936002)(31686004)(86362001)(31696002)(8676002)(83380400001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	oMcd0IN6d3zxhIuFJ03FZOqYZ3uXU1g/25Vk0AJCgQx6/TwCoZdv3AhIKW54KlQV+1k4WBAkMOCdXZB96qeHQrPIrcpnQnrPwrirGtDNdhqpt0gqrdQoILuUmxbNSWgHcBEZufAx+D0LKCUuxLWBhe8J5k9tmE8hqz40xmhfd3TElfIVVmITyN5iDEWZA2XCZh1DZcyS9soT55RJoji9ymr3FgbOjP2XCeevGyME7gG6Le2EuyK+dRp2ll3PqCKU6hEISfp0Qpn6gAlyTu9n8K8clf40dP+XmG8mQSaw8YfMKqkuFtP62O7abGgQfxY3YZQDyuhVa2IS+pesAWnAyiP/ytpcLli6/FlfO/Bz0n5ncip0h3utOX0fuwVKExwQQiUEcPqySxxNDr8fzXGmJ1ym3FRfXKJ86Pnv1rtRqFby+ot9QE/D658HuoojP0l13KLOLky3dKIQpRzkrmfCslpeLxt6tzY7jOeK9Fv8vEYyK/BPNmnkejsiS/ZBICSP
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30b0249-b641-4c2b-e911-08d812ccfa72
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:44:45.8855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQqc86LJP4r/77Ery95OcMpktDyyZCndhvx94vhMzNlVFCWSSlE0Vc3uOdHqZXvm/1fGVqvTcmXITZvLE32U5DFPlKYTKNJOTSbeHsxCeuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1875
Content-Type: multipart/alternative;
 boundary="------------BFCC3DD98AF2F08F013792F9"
Content-Language: en-US

--------------BFCC3DD98AF2F08F013792F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:38 AM, zangrc wrote:
> -Consolidate into a single file.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-ipy.inc    | 19 -----------
>   .../python/python3-ipy/run-ptest              |  3 ++
>   .../python/python3-ipy_1.00.bb                | 34 +++++++++++++++++--
>   3 files changed, 35 insertions(+), 21 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-ipy.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python-ipy.inc b/meta-python/recipes-devtools/python/python-ipy.inc
> deleted file mode 100644
> index 46b2fad03..000000000
> --- a/meta-python/recipes-devtools/python/python-ipy.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
> -DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
> -in a fashion similar to perl's Net::IP and friends. The IP class allows \
> -a comfortable parsing and handling for most notations in use for IPv4 \
> -and IPv6 Addresses and Networks."
> -SECTION = "devel/python"
> -HOMEPAGE = "https://github.com/autocracy/python-ipy"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
> -
> -SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
> -SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "IPy"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
> index ea6a1055a..14931546e 100644
> --- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
> @@ -1,2 +1,32 @@
> -inherit setuptools3
> -require python-ipy.inc
> +SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
> +DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
> +in a fashion similar to perl's Net::IP and friends. The IP class allows \
> +a comfortable parsing and handling for most notations in use for IPv4 \
> +and IPv6 Addresses and Networks."
> +SECTION = "devel/python"
> +HOMEPAGE = "https://github.com/autocracy/python-ipy"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
> +
> +SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
> +SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/test/
> +	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
> +}
> +
> +PYPI_PACKAGE = "IPy"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------BFCC3DD98AF2F08F013792F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:38 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592231885-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-Consolidate into a single file.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592231885-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-ipy.inc    | 19 -----------
 .../python/python3-ipy/run-ptest              |  3 &#43;&#43;
 .../python/python3-ipy_1.00.bb                | 34 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 3 files changed, 35 insertions(&#43;), 21 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ipy.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-ipy.inc b/meta-python/recipes-devtools/python/python-ipy.inc
deleted file mode 100644
index 46b2fad03..000000000
--- a/meta-python/recipes-devtools/python/python-ipy.inc
&#43;&#43;&#43; /dev/null
@@ -1,19 &#43;0,0 @@
-SUMMARY = &quot;IPy - class and tools for handling of IPv4 and IPv6 addresses and networks&quot;
-DESCRIPTION = &quot;IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
-in a fashion similar to perl's Net::IP and friends. The IP class allows \
-a comfortable parsing and handling for most notations in use for IPv4 \
-and IPv6 Addresses and Networks.&quot;
-SECTION = &quot;devel/python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/autocracy/python-ipy">&quot;https://github.com/autocracy/python-ipy&quot;</a>
-
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=848d24919845901b4f48bae5f13252e6">&quot;file://COPYING;md5=848d24919845901b4f48bae5f13252e6&quot;</a>
-
-SRC_URI[md5sum] = &quot;1a90c68174234672241a7e60c7ea0fb9&quot;
-SRC_URI[sha256sum] = &quot;2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621&quot;
-
-inherit pypi
-
-PYPI_PACKAGE = &quot;IPy&quot;
-
-BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
index ea6a1055a..14931546e 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
@@ -1,2 &#43;1,32 @@
-inherit setuptools3
-require python-ipy.inc
&#43;SUMMARY = &quot;IPy - class and tools for handling of IPv4 and IPv6 addresses and networks&quot;
&#43;DESCRIPTION = &quot;IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
&#43;in a fashion similar to perl's Net::IP and friends. The IP class allows \
&#43;a comfortable parsing and handling for most notations in use for IPv4 \
&#43;and IPv6 Addresses and Networks.&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/autocracy/python-ipy">&quot;https://github.com/autocracy/python-ipy&quot;</a>
&#43;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=848d24919845901b4f48bae5f13252e6">&quot;file://COPYING;md5=848d24919845901b4f48bae5f13252e6&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;1a90c68174234672241a7e60c7ea0fb9&quot;
&#43;SRC_URI[sha256sum] = &quot;2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/test/
&#43;	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
&#43;}
&#43;
&#43;PYPI_PACKAGE = &quot;IPy&quot;
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

--------------BFCC3DD98AF2F08F013792F9--
