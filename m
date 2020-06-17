Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.84])
 by mx.groups.io with SMTP id smtpd.web12.9263.1592405076700139952
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H2fgoCWr;
 spf=pass (domain: windriver.com, ip: 40.107.75.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFoblI8c1n3hp2XjBCFXgUNf+bf6YCKwHW4b7c5pu+8ejBVS2jSdHUeKxY1kIwPU01HRWdFbCKm5rjGzonatY6wlFHhAPKtD2e9SeQCUEHt7AYYGKCaiBCiy4OcWwUSi+yP+nydhqWlStVNO4QjFHBcjQYIYuB+zhCJxYuc36MSdYFeqHlqKZat/45EX/O2hTJ6de8jKe3lFZnVwTog10hYlCX5XJOxfBbyjHFHsTocSUV3zQOuU8k+QNeiuhVIUYqeDj5lsRRvmFH3I/vdRwJ2z6X0MPuaP/KBetv7RjGIWJ5EoBILLECw77AA8p+hzI0ZKUm2oUlnML4DSD2/oHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k2rJdE8DabqtgLnjZgHbl9FDQMun8eytp7e3moxeKY=;
 b=Upx6Uu2KkzC0C7ZLnBSIKPurQ+B/mcDjNcb1e2RteTNE6Q1W4hd0JPa1k53pE7nGfansc7lWAeZluclA199CaDyLn19zgipTbKE2jg6GcJLHQ3EmF1EiJpmvAWdriB7EbPUb4H0WYAPgL/1oyCeYdzVlPRcGlevg8+MrjdKT7lNDAYSONavZYa+nQlno1Xn4IxtHoXFNBmvQloGHbfbjLr4WoEZChvukz5NHuf0HfFCMIjAIyEL7av+q2gN7tZumqVvAlFWm4N234OzrpFQGZTpQwqpC16oKV2IiuMRr52uhMvoW2qdVL4rlPlaFaRRi9j5pALFSEo/4/y9FePyk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k2rJdE8DabqtgLnjZgHbl9FDQMun8eytp7e3moxeKY=;
 b=H2fgoCWr+J7sLURKx8NiZ0ErXhbzQ/GZ2PmC9useVoEuSnGDe2CdSs71tpcnq7C4PZFzQoQBTxgm0o8MBKGXyKPOFRxhHOmn7vPvSKxJLDhnXK9g3qI9U69I85dU27P5Iy0kDFg9CgacSIb/i8mXaT0o41C5sMG68GE0b2gPbvc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1875.namprd11.prod.outlook.com (2603:10b6:404:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 14:44:34 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:44:34 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-intervals: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592231844-3955-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2a1aa3c9-6166-41fa-80cf-5f8e7a3bad8f@windriver.com>
Date: Wed, 17 Jun 2020 10:44:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592231844-3955-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 14:44:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dc9bcc-1938-45c7-84a8-08d812ccf3b6
X-MS-TrafficTypeDiagnostic: BN6PR11MB1875:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB187553A156F2A1DF4336E49E9F9A0@BN6PR11MB1875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	781huXvR4i7iDsicLq7tdIkJacYpXI+gBZQqjSzbkNv/wk5Ty6nw0bZyfgGxMgof8pPgI1k6nWplnnfJk1DEc7/EAOfpFIHbOslPgs6zl6t6HwvJlmW+QlOzVUfl5SAHh3GlcLOw9bbMVS+DtuAob0aWIyQlO58kPSE1RYr+DeLkTR5KRYvbQW0f/XELxRbMKZVmTbPxqx6FsvuGNItrphShBhME1O9E3nugQMuQfqYSCrq8Elf7ERgMfDkCioMRgN/yz98kk8tUvP+veA8PZdEBEOpBNdIsocotKlZrMQ0SJeJOAlVU9PzGrnWOVVGpCkYbiwB+g97YmcA7caPelRDlhlDiL7bmYqVNsbQ3DT2NFMcZIaMdq5/cZZ5Lhq6M7/GnfXhyyxsjGDNTK0/Ir8dXXhpxOiUs7WtDs+9X0ae7mmin5TkYdT3GlWaBriPn/dP+dHTKPLx4FvlhjCsvmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(396003)(136003)(346002)(39850400004)(2906002)(26005)(966005)(16526019)(66476007)(66556008)(186003)(52116002)(66946007)(5660300002)(316002)(16576012)(53546011)(478600001)(44832011)(6486002)(33964004)(956004)(2616005)(166002)(8936002)(31686004)(86362001)(31696002)(8676002)(83380400001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SgZ/1hlXgqELE3dXP452qeG8hvTI7RkXKTGeQMpWms+zO0vEOIbQPfuLB9c8+1/75ihEdJRKITPl4EHHmEUdxFE4amdKrVf/VriE4HLWK5xMNQtlgFZ4v51pxVLwqB7geeQzlOxA33fqixYxkKqgnU9SQMvt3YR6GT0GDuwVFD4Fb+paG+VAxrVrcf/RhfFp9KhAhIOYSq/SYtP1DISU7V73pQstq+m1Xl38nQeYRFDnRGiKMLMfVG0aJK3ZbAgaJo2UuG8D6n1+HceGsSaKneg+prfktZzra6SrhlA00hXo63kAanCwSR601BtmqYYLFCwnRq9ii3jUbqNQkhXefUMQgn+fMHVLPNFmRQfIo9LRqMhbOW1qH/EmEgud5Hso5p3hQyaIjZ0sX8cbpy3pQbV2/HHMRXYi5pbLs2ybtK4XlyN5smvamEa1f9G9v3ca6L747/0A3GekO5jlUKwyKaELrofuAYxQHb5gc+i34PE+42CWAKXpHzMb/WvIKFcE
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dc9bcc-1938-45c7-84a8-08d812ccf3b6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:44:34.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlEN1KasuW8rbd3k+s8nD3ihq5l1lSeNO/nvIIC8WK4EYElALCdkhSiMSPYjSrvAOlEQYVe0yHZcoonNXZVeCw4psXF1whAYsXYVddwsKpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1875
Content-Type: multipart/alternative;
 boundary="------------09015CE5A7FF0E9FB0E18FA2"
Content-Language: en-US

--------------09015CE5A7FF0E9FB0E18FA2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:37 AM, zangrc wrote:
> -Consolidate into a single file.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-intervals.inc               | 15 ----------
>   .../python/python3-intervals/run-ptest        |  3 ++
>   .../python/python3-intervals_1.10.0.bb        | 30 +++++++++++++++++--
>   3 files changed, 31 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-intervals.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-intervals/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
> deleted file mode 100644
> index 4489aa59d..000000000
> --- a/meta-python/recipes-devtools/python/python-intervals.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Interval arithmetic for Python"
> -HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
> -SECTION = "devel/python"
> -
> -LICENSE = "LGPLv3"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
> -
> -PYPI_PACKAGE := "python-intervals"
> -
> -inherit pypi
> -
> -SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
> -SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python3-intervals/run-ptest b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
> new file mode 100644
> index 000000000..357d8cb98
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO test_intervals.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
> index 8cbe1090f..2e8276ec7 100644
> --- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
> @@ -1,2 +1,28 @@
> -inherit setuptools3
> -require python-intervals.inc
> +DESCRIPTION = "Interval arithmetic for Python"
> +HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
> +SECTION = "devel/python"
> +
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
> +
> +PYPI_PACKAGE := "python-intervals"
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +inherit pypi setuptools3 ptest
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +	cp -f ${S}/test_intervals.py ${D}${PTEST_PATH}
> +	cp -f ${S}/README.md ${D}${PTEST_PATH}
> +}
> +
> +SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
> +SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------09015CE5A7FF0E9FB0E18FA2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:37 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592231844-3955-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-Consolidate into a single file.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592231844-3955-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-intervals.inc               | 15 ----------
 .../python/python3-intervals/run-ptest        |  3 &#43;&#43;
 .../python/python3-intervals_1.10.0.bb        | 30 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 3 files changed, 31 insertions(&#43;), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-intervals.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-intervals/run-ptest

diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
deleted file mode 100644
index 4489aa59d..000000000
--- a/meta-python/recipes-devtools/python/python-intervals.inc
&#43;&#43;&#43; /dev/null
@@ -1,15 &#43;0,0 @@
-DESCRIPTION = &quot;Interval arithmetic for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/python-intervals">&quot;https://github.com/AlexandreDecan/python-intervals&quot;</a>
-SECTION = &quot;devel/python&quot;
-
-LICENSE = &quot;LGPLv3&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab">&quot;file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab&quot;</a>
-
-PYPI_PACKAGE := &quot;python-intervals&quot;
-
-inherit pypi
-
-SRC_URI[md5sum] = &quot;8955317ff4e42590c90ba6247b1caaed&quot;
-SRC_URI[sha256sum] = &quot;0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5&quot;
-
-BBCLASSEXTEND = &quot;native&quot;
diff --git a/meta-python/recipes-devtools/python/python3-intervals/run-ptest b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
new file mode 100644
index 000000000..357d8cb98
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-intervals/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO test_intervals.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index 8cbe1090f..2e8276ec7 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -1,2 &#43;1,28 @@
-inherit setuptools3
-require python-intervals.inc
&#43;DESCRIPTION = &quot;Interval arithmetic for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/AlexandreDecan/python-intervals">&quot;https://github.com/AlexandreDecan/python-intervals&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;
&#43;LICENSE = &quot;LGPLv3&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab">&quot;file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab&quot;</a>
&#43;
&#43;PYPI_PACKAGE := &quot;python-intervals&quot;
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	cp -f ${S}/test_intervals.py ${D}${PTEST_PATH}
&#43;	cp -f ${S}/README.md ${D}${PTEST_PATH}
&#43;}
&#43;
&#43;SRC_URI[md5sum] = &quot;8955317ff4e42590c90ba6247b1caaed&quot;
&#43;SRC_URI[sha256sum] = &quot;0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5&quot;
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

--------------09015CE5A7FF0E9FB0E18FA2--
