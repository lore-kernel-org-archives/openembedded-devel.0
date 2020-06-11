Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.62])
 by mx.groups.io with SMTP id smtpd.web10.6957.1591881098176557695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FkgjRb/6;
 spf=pass (domain: windriver.com, ip: 40.107.236.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTPs13ynhDJFnkmCpf9m+FlZsvHVNqZlSfKggtXH4TuDg1QYjIEVvqOW6Oi2Ch9a/RdSV2laFOrssZCG4OGJ1qnFFYs4J6AIMMOg3yljAtaFE8cqgbGolflkqhIPemDN9a8fZH80xAwEQPo2nxLYdKOy5/OqyhTJxA9rPh3RM9Vtfh9dbMvEqkybpP4H+XfUSKgOZxz0cUzoNWQPGjRKBgekfVLXsj9dNzHOsA9sJIXtTTjYjj41SvQBKatfHEp4NfzAT41BVM7x2gjyVfOzsz43FcQbn9sHiYCr0+lpQnA3Vi0JGW+Bk8bNxW51KnNp4l9quQJ3MA1SMm15Gcobqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpe31Im5vwmM8YJXZPctuM6G1I3ISpje75p92L2GmTY=;
 b=RH5HkIp0/Y7p9pkX+74PblyzJePIPtbzYY2RQjlIXIwXAxBf7P7XAlkejVoBTj46449eG9PKW3jZyqKXqU4E6qil+F75WuunGc0tPbL/n7pWfGF4rzmqwszlQaapc3QeN+pKTAC6FUm7zf3KZ+jec2j/Qq2WOI1HpM0Moq9TJ+LCwvM3aQbJq+Vn5QdfoCP7tVTp7P3ZSAKK/mylcHqwc5bd+Y3g1m6uzzVZUqHEu3lw9TKiKvNW5eHboWaSRg7aUT458ZkTP6qgYEVMUlEoti71xhtFynkaBduOMuqXFAXl0GRun3gYSYVduL5GZjotYnauFdFxS+OyvRFR6ZembA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpe31Im5vwmM8YJXZPctuM6G1I3ISpje75p92L2GmTY=;
 b=FkgjRb/68sdLqPJmRRNSUmOVk0T8YEZNgPgujzfvqUgs9bBkHSnUrPAQd9GhP7sYSRkIJkTDbtSb6zd1tXHT+tBQBmBQ1Pie09P3BSz+VQSXgSZgphnAKbt8KrXTjbTiw2wETd9AISXUUZiUJ1GulIJr8UH/LF5UcqcHuJNzBX8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3956.namprd11.prod.outlook.com (2603:10b6:405:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 13:11:36 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:11:36 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-inflection: upgrade 0.3.1 -> 0.5.0
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1591727528-3402-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c2e95a78-c5b7-74ec-f976-741b6764813b@windriver.com>
Date: Thu, 11 Jun 2020 09:11:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1591727528-3402-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Thu, 11 Jun 2020 13:11:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c66d0e7-f3e8-4150-3570-08d80e08f82a
X-MS-TrafficTypeDiagnostic: BN6PR11MB3956:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39566C697DA8C21CCB683D419F800@BN6PR11MB3956.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YiaoIuQ+CDO26EKJqMuLfql/rnhMbffF9e3F6Ym/G/5E5NBd44vpQRYKjsuz0V4jnafZ7ErtkNh/EahcnK4PfcTNg6L2zgEbVEwfGkE+m0gjyU4VFGJwSHFKfruVufj/sxBy/wctVtiSD0Cz6F5bVCy3lYhWkT2NY/IPW8Ed/MX/0K/vmT5iyOP903BtWfPY1lzzrE4fhoV8aF8YBDWG0BJujqlujGFIXZ4mS/R5SvlS9d93GuyyLxEok3Uv+pfifZUelLivSPGCxvhtEN+2fu/d56PT6xmP+n2uBg7yZSVyki1VrwMA8qJz9jQl3k5sCG3uVi4ejBLiXQdSp6ugFOE0i1SHKrx0HOPSTj648k67Zp+4bpUgzi4bDOzQ5EkWaFcnQTFKhMdQPHjFCgWRC6rF08n6AEBFkp5I7XDzsqEU5UAi8DJD6sG6F5EiX8zmwoD4+S+OhZV4NW1qwdkndw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(366004)(396003)(376002)(346002)(6486002)(166002)(86362001)(16576012)(52116002)(8936002)(83380400001)(16526019)(33964004)(31696002)(316002)(66946007)(2616005)(66476007)(966005)(478600001)(26005)(186003)(5660300002)(956004)(44832011)(8676002)(53546011)(31686004)(66556008)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7qaQO+3LN73BRd2uZ0oRStkgljqsY3lvOP/dFE9cZqbVGCF/mudCUN5clzHgOMDCYlI+MqTElO3CuqgFP2K3lgiIX3vIiETzEYGGUWrduDQu3T3zyCNyl+uLiLCTUCA/+uV7gMhfKHCY7+1cGlekQzzwrttLLBgS8ERLyBIAq3u4UfO44lHO6WnmJwdZwbfeN5OkA+wLRVz0NgfePnnjjsKxiz0woBe9P1PUL8MobdKKAod9HyIBBXobDQUmY9FIUrW3LEPZnK+uO7UGolExE53aVb1ri2ETCycLYh1zdRNjG8OftDaHosLnIZFVflAKycfyftaKUKDMrVKezDMdjyCYADVAux4ANFIDUfzE6hR6A7mAt40jav7TM9AT38gAAVM2SJMlnjgnAA7VsEywK544OZ7Xz9md6X9YVRoBO6wREp0Yr8spERt6AaJ6hJdykCZ5Gmm1PdcaL7hFVIDiD8a5pOXBWCUXk9wyaGAVbiM+ULJ0vu9WcViKJAe8xoY8
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c66d0e7-f3e8-4150-3570-08d80e08f82a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:11:36.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYZsTKaT5duhtcn9fcjNU0b47Myesi/yDF8nvJ7Pgh9OFPmtTGdFR/Ttx7Szx9z6V7aXaBWmnBTp/UlrEOVP0ihM86QL1Hwc+1jvqz5kIMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3956
Content-Type: multipart/alternative;
 boundary="------------EC0402CE61B58FAE5721513B"
Content-Language: en-US

--------------EC0402CE61B58FAE5721513B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 2:32 PM, zhengruoqin wrote:
> -Enable ptest.
>
> -Consolidate into a single file.
>
> -License-Update: Copyright year updated to 2020.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-inflection.inc              | 14 ----------
>   .../python/python3-inflection/run-ptest       |  4 +++
>   .../python/python3-inflection_0.3.1.bb        |  2 --
>   .../python/python3-inflection_0.5.0.bb        | 27 +++++++++++++++++++
>   4 files changed, 31 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-inflection.inc
>   create mode 100644 meta-python/recipes-devtools/python/python3-inflection/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-inflection.inc b/meta-python/recipes-devtools/python/python-inflection.inc
> deleted file mode 100644
> index 556b26820..000000000
> --- a/meta-python/recipes-devtools/python/python-inflection.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "A port of Ruby on Rails' inflection to Python."
> -HOMEPAGE = "https://pypi.org/project/inflection"
> -LICENSE = "MIT"
> -SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=de7833d9c2ce0052a4073928c76a13d7"
> -
> -SRC_URI[md5sum] = "7941165e9f148e0520023941c0886b40"
> -SRC_URI[sha256sum] = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-pytest"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-inflection/run-ptest b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
> new file mode 100644
> index 000000000..0caffb794
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO test_inflection.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> +
> diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
> deleted file mode 100644
> index cc36a02a7..000000000
> --- a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-inflection.inc
> diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
> new file mode 100644
> index 000000000..0a3b7734c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "A port of Ruby on Rails' inflection to Python."
> +HOMEPAGE = "https://pypi.org/project/inflection"
> +LICENSE = "MIT"
> +SECTION = "devel/python"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31"
> +
> +SRC_URI[md5sum] = "87b2ab6ffdd6e15aa31d109ce5ff10bb"
> +SRC_URI[sha256sum] = "f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI +=" \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}_ptest +=" \
> +	${PYTHON_PN}_pytest \
> +"
> +
> +do_install_ptest() {
> +	cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
> +}
> +
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pytest"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------EC0402CE61B58FAE5721513B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 2:32 PM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1591727528-3402-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-Enable ptest.

-Consolidate into a single file.

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:1591727528-3402-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-inflection.inc              | 14 ----------
 .../python/python3-inflection/run-ptest       |  4 &#43;&#43;&#43;
 .../python/python3-inflection_0.3.1.bb        |  2 --
 .../python/python3-inflection_0.5.0.bb        | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 4 files changed, 31 insertions(&#43;), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-inflection.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-inflection/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-inflection.inc b/meta-python/recipes-devtools/python/python-inflection.inc
deleted file mode 100644
index 556b26820..000000000
--- a/meta-python/recipes-devtools/python/python-inflection.inc
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-SUMMARY = &quot;A port of Ruby on Rails' inflection to Python.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/inflection">&quot;https://pypi.org/project/inflection&quot;</a>
-LICENSE = &quot;MIT&quot;
-SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=de7833d9c2ce0052a4073928c76a13d7">&quot;file://LICENSE;md5=de7833d9c2ce0052a4073928c76a13d7&quot;</a>
-
-SRC_URI[md5sum] = &quot;7941165e9f148e0520023941c0886b40&quot;
-SRC_URI[sha256sum] = &quot;18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-pytest&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-inflection/run-ptest b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
new file mode 100644
index 000000000..0caffb794
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-inflection/run-ptest
@@ -0,0 &#43;1,4 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO test_inflection.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
&#43;
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb b/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
deleted file mode 100644
index cc36a02a7..000000000
--- a/meta-python/recipes-devtools/python/python3-inflection_0.3.1.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit setuptools3
-require python-inflection.inc
diff --git a/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
new file mode 100644
index 000000000..0a3b7734c
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-inflection_0.5.0.bb
@@ -0,0 &#43;1,27 @@
&#43;SUMMARY = &quot;A port of Ruby on Rails' inflection to Python.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/inflection">&quot;https://pypi.org/project/inflection&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31">&quot;file://LICENSE;md5=2fb6fa1a6f1792d78de19ad1bb653c31&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;87b2ab6ffdd6e15aa31d109ce5ff10bb&quot;
&#43;SRC_URI[sha256sum] = &quot;f576e85132d34f5bf7df5183c2c6f94cfb32e528f53065345cf71329ba0b8924&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;=&quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}_ptest &#43;=&quot; \
&#43;	${PYTHON_PN}_pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	cp -f ${S}/test_inflection.py ${D}${PTEST_PATH}/
&#43;}
&#43;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-pytest&quot;
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

--------------EC0402CE61B58FAE5721513B--
