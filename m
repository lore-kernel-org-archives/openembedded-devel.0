Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.79])
 by mx.groups.io with SMTP id smtpd.web12.2274.1590098357681149252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 14:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KygC7zgP;
 spf=pass (domain: windriver.com, ip: 40.107.76.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXZUJzKra++AiO5XVw2s2NHGWWwT7sOG84GY8BLIt5Bb71L4lthzeSMCAM08y6t9t/hkhA4C7n68z4sWTKpw67ZE22QYixJpLEnn+J+juN9nK5uo5YVKlsM00QARfoj6q2ljjV6GthDWQ7YLv/JeEMO2+5n+6Gl4G4+KgwUnrMHDCy7SeEtQwh+G2Ktc39Ba5mkLc01ePl71FvhSlRL7drdShijkFfV3z1rqDJm4mKaApYv75aGfTs9akmPK8wkyvBYdvPg11TLrRKHp7IRofMRanoTadJ56lle+q6mhGBSIoW5C/Sdtn2k8/KEb4Y4fhYyNkaOYBnUT3UODITW3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOHvsOPmB57shh5Q1LULB8z630YnleOo1us1rya5It4=;
 b=CTmH7I5/EZBRPz/mX3Xpi7TcKL1nAOwyze8S1vy1P5FZnlKEvbAzUsyCRH+c2YLEX/MY1TIstfA96eQjG1yyW1cmjHxpQSNx5q6TM3Q9EqgRbCMIoBWBV6J7AFa9Zw5Vva0oHphksVS7Bhoj6CogJ4+BFvTf3au93HxRhavskieiIM5CqAvQ3QnLS3MilG61JENxusdT74Q3e3JQfgbjtp9tf1lAXsSl3XViOEMqAtcneKDC+p0hIJYs0OAYjSfMlTN4genX5S+Dyyis87LFtTkaAE3mRPl7VzYHZSab1HmI/+f1VUSBkY76UlXOyfDSHKOew9LA1CZrdNLiPNLJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOHvsOPmB57shh5Q1LULB8z630YnleOo1us1rya5It4=;
 b=KygC7zgPktoPn5DuGFUkmWt8sxjOJ10rncSXY4VpMjQ/++IghcKnS8Lhj+dWB/Q/Hozg/EsQejnKA+/vhT923LnHwvMEBfByq+s9yWfGio5mO+GIgYy0l0UoQXgdaJkVQ3S+O6bQIBLrWsGI+3Q7uAZ81Czeex6D7jSJ1nTHrlw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 21:59:14 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 21:59:14 +0000
Subject: Re: [oe] [PATCH] python3-jinja2: Update 2.11.1 -> 2.11.2
To: Domarys Correa <domarys.correa@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20200521150603.6360-1-domarys.correa@ossystems.com.br>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0f030e01-2222-c15a-33c6-b2544a4aa472@windriver.com>
Date: Thu, 21 May 2020 17:59:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200521150603.6360-1-domarys.correa@ossystems.com.br>
X-ClientProxiedBy: YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::6) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0127.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 21:59:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161412fe-6d9a-4259-614d-08d7fdd2334c
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1780CCE44B2F0908E89AE7869FB70@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8dV/TQEZQIxlx+cR3PoBJWoh4pORgQm+qH34JQZmyi9G2sgkfNaxt032nugkK83vPxXR5x/axbPRaE+DbmZEWEUnZZy58uMoJdPyKLNWWebF3ITCoXGnPw7+oG+T1fKkvr2lXy1179E3zDzfAmwrDD7QWd9MiMDO4I6EiivZug2NONcqFXLGkR1/gfVK286DlX4l83+cOZtTj4Gb/7e+Ef2iTrMtNm7Aq44iZrQhZD2S/g4X7NJ8YengNMqd3FuGpwjD7lhf1M9Ls/7GyVTKRNmlwNCPLiRxIYvNOxqTyfPUI7lf0ZJhEC1RlWbYKRVor3ZO3NQxVnmkgm8MZEO2BkhTJztwGz8Fa0HzSJJCLCBXn64F834QsPj3zOnUqQgH/2PQFmazRUtTjPXrgtUAYG/SznM+c6n8wydFolcq4xeakU9AjpwkP5bdUVkn96bV5MjNrJFDbnj8O0hOpEXYmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(39850400004)(366004)(396003)(8936002)(66476007)(66556008)(66946007)(36756003)(956004)(44832011)(966005)(2616005)(16526019)(31686004)(186003)(15650500001)(16576012)(5660300002)(8676002)(478600001)(316002)(26005)(31696002)(86362001)(6486002)(2906002)(52116002)(166002)(33964004)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KkVzRJM6RaAVm1JJh5yuo3xvoW8m6tBf7PVfXUntYeNvGFpfav7PRcEss5wmfGSz29anZwES9LkevGZzVG0keXavpZ/bhKNkzcPtDPHTE3YNkNMdcR9ZFytrGfd9LBSI2CMaf4z7baU2YAGVUF0StUWfUNEJ4O7UAzVJtNk9TY7YJaUphc6zyjpH3LeM3OnO4pJxzjdZUGal87HCnBnVNOI2srZxb6BPJJt01Jst3Q4TkDVb/MUvqO1eaaNFOePZQJzWhe9vs7xqdQPpC4fuvzHNeT34M/VO278g35E4hMdJasCcijIFoQIFrIThJSB7vUsAGTCmnG/7SOLafTGUkjeGLLT/Finnqeyxxwi7nMBHNFVEpsBC8qcM39rcLPR5q0ad5pzD4HZFJKoV6PoWeg8fDoFs3p0m0TtqLWmhIBpEcd2Vr2hT/huKZHsC6Js8eD2OoDoCV8vcuH+Xm3c5APgLE0D+dy33WKgGy6hpxfumt4gd+oomorRkQX841eZp
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161412fe-6d9a-4259-614d-08d7fdd2334c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 21:59:14.4086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG0Hy5hxckNIp+bDZ9nByvdI7/TagT4BoFgTIi5/AP0w1qJ02tP+osljRD7hPidxujDlAlNPUSMiUxl5zFbguEWRhmN9cHhjPYSjy/3utIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------B74086A3FA6B46546C45F4D6"
Content-Language: en-US

--------------B74086A3FA6B46546C45F4D6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 11:06 AM, Domarys Correa wrote:
> Add .inc file to .bb, as updated to python3
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
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

--------------B74086A3FA6B46546C45F4D6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 11:06 AM, Domarys Correa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200521150603.6360-1-domarys.correa@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">Add .inc file to .bb, as updated to python3

Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200521150603.6360-1-domarys.correa@ossystems.com.br">
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

--------------B74086A3FA6B46546C45F4D6--
