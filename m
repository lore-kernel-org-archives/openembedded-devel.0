Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.46])
 by mx.groups.io with SMTP id smtpd.web10.15268.1593523448958511075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dB5drhPr;
 spf=pass (domain: windriver.com, ip: 40.107.68.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg1tshkzhsiGOFnXbFPVUewo6fqXVP/hq7kR+536KnXGh9MNIdlc3MHO4rmelcNuWfoCKq2v7MUr6iqhMor3IzRnbxImcUzHjcLEAPLZvy3LBXVUpkCjl7MyBv9i4VMYSVrcDydgez2b0AhE/l2x1Vji/eOWtm531XsauPjt6d/wMMYbUvil+ETtue98Tde2eFHJmwiImEgTXN+gVy3Iwbj+2hATfN8IbVnS3A0qYQ8fymjpZyWhFfnAFS4EFeM8V91WGXWLkWjX5xN/lScMDJ/17DmIE5+2OWauYmbtVCgYWdpccjvJy+7Om9xLRnMezSuWFgA6M1Qjut36STS6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7ytW/mznp8rMu80CDV5NwRKxdSgKJCWXap6h8EDji0=;
 b=gboHBW8tVPkiyTEV7iCxXJ/6WcuxsrL5/SRu7sCGu6f+r7QdcZmtV7zzUkoHH0n1eNp5h2HQW/87GZmoUD5uCUex2h3Y4XkUsLsru23b0+n+QyqM/n1rhgcgZs75A87UdH6B8olJfFCSvVu248ID//r2yyS2PVMoig3VbYAugE8sIeKfCPnKCOSt2MDalRhc7ZMoGwXcTaCcyBI8BaUwVBjBWWK7dgYqStAgLHrqq9BA1cC524zzFovJFm/B3d0bTVCxSeToRJEOd9w667klJnmleQYnen3Vns5jKa2pVxezK6n/DSljhgG0NQU8XlZJ9kCdkN2vsGtubFxqg4/9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7ytW/mznp8rMu80CDV5NwRKxdSgKJCWXap6h8EDji0=;
 b=dB5drhPr2cTtPr1WF7nCKk+ipgQy8ih6K8RPHqC0Jk86hQD9YnO5w4IG4JQxfPjwkl9jKdxqx64ALes5Ym8fp+h/iEvBTKAk/63mjT+rmi3mXuIM84EcXspM1xYS4OZ0T81AyUxX0/aclg6LzlsE+JR4KYtdbsE0MNfvwxdoMgI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1286.namprd11.prod.outlook.com (2603:10b6:903:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 13:24:07 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:24:07 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-pywbem: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1a97a3b5-4d82-2b50-4d6f-8665093c81ff@windriver.com>
Date: Tue, 30 Jun 2020 09:24:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Tue, 30 Jun 2020 13:24:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e021f3f-5b75-4dd2-7cc3-08d81cf8dde4
X-MS-TrafficTypeDiagnostic: CY4PR11MB1286:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1286F94CC72829BECC7FAF249F6F0@CY4PR11MB1286.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BP8yIieiBZ34ksr8G2J1amF7FtsmpDX4DGvNfeZoqtt38TCSJ7J7dn+q2Dq9MlnGx8H12IhO9HO/oOrcifJzZlHUwSgAjXg3kv224bxBTxoS9BGjFR+uOjFpRMtpfdzZlOtpup7WKpIfRCLi4+hzY6flE6ypNX1O+LN5s0dsrV6yCTpvgk0E5SCBgL5s/86Qkqgon3QtdaLDBsuumd2ERg9IuDM6pyzYvQ27NQEAoGqEy/XXS7lYdtPVO3lmSp5J0CrkfDFvFoKbHfmVeMYd5oeOvghtRRKuvzsd9856vGI29+9jkQVA3WQjb1XJLuH62rCG/QXiWvpXuk1k/Gb5o/TqUfiGM7CqqFWE+Z2LHnFbVB0o829QC6mCktrg2Ggh509NxHqskDkDsPX/KeThzrV3V+BRxLAaiphyZDww59/PU6Fcqd2QgtfkBTmLmR5VqDz1am7hlqFobQf0exEQDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(478600001)(31696002)(83080400001)(86362001)(31686004)(166002)(2906002)(30864003)(966005)(5660300002)(19273905006)(83380400001)(26005)(33964004)(53546011)(186003)(52116002)(66476007)(16526019)(66946007)(66556008)(316002)(16576012)(956004)(2616005)(6486002)(8676002)(36756003)(8936002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nTjlZhrr5vWSEzdMNVj4hCzxhU1Vpfh/10b1C+m0h4JlnS9azfHF+VBypZHJoHNcZKmygnPiONvGc81PHOgIIL2WIxx1h8CUP8lqtK4pBlDaZBLgUiNz+eGG+z96v9vqQX7zYUkAk/9gVpWMD0O4DLmjjo7HZR5LAGbQBWFYnwKeaXf1TZCQNDf11oX1btE6tNRTBza2P0hFuIVupp5uaCOLO9IW7b8MYYsufMnHMV0ZAPbm2Db+Nc8q4ipYTuhR+xo3LR90yoo5sGreT1xg+VrjSlRzKdJAb3trYnSwob3Pl6oBqrXTZfPXPHk92sk3foDIQ3aaASbRdtSDl4QOzYx+qD33ByeO5BK/AR88bAEG6cq53Y3Qsuzk7G+ud5RD0QAiaMCzr1fjgjnEE9LLFkkPLW529Vc1VaIYZI8hWHMtm77NP7ihMxJSHIe/QHgGfuUjI2DW1v04e6O/ksg4l3qHOdHDMtBfBFhFO4PW43Dmcn2Y2cEv4tj9DXUYfX2P
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e021f3f-5b75-4dd2-7cc3-08d81cf8dde4
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:24:07.4760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJh7v2PMO7CJTPhTChSTgJK6qIDGy2RG4vJZEvRxT6tfFigfA7liN/T9Cv6avsbWuOlivDLHRO12LLgV0MDicoMFjmi9kW5qsGGBF36Wguk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1286
Content-Type: multipart/alternative;
 boundary="------------30742B4082677D43303C038B"
Content-Language: en-US

--------------30742B4082677D43303C038B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-extended/pywbem/python-pywbem.inc | 51 ------------------
>   .../pywbem/python3-pywbem_0.15.0.bb           | 53 ++++++++++++++++++-
>   2 files changed, 51 insertions(+), 53 deletions(-)
>   delete mode 100644 meta-python/recipes-extended/pywbem/python-pywbem.inc
>
> diff --git a/meta-python/recipes-extended/pywbem/python-pywbem.inc b/meta-python/recipes-extended/pywbem/python-pywbem.inc
> deleted file mode 100644
> index 98508b0c3..000000000
> --- a/meta-python/recipes-extended/pywbem/python-pywbem.inc
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -SUMMARY = "Python WBEM Client and Provider Interface"
> -DESCRIPTION = "\
> -A Python library for making CIM (Common Information Model) operations over \
> -HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
> -WBEM client should be easy to use and not necessarily require a large amount \
> -of programming knowledge. It is suitable for a large range of tasks from \
> -simply poking around to writing web and GUI applications. \
> -\
> -WBEM, or Web Based Enterprise Management is a manageability protocol, like \
> -SNMP, standardised by the Distributed Management Task Force (DMTF) available \
> -at http://www.dmtf.org/standards/wbem. \
> -\
> -It also provides a Python provider interface, and is the fastest and easiest \
> -way to write providers on the planet."
> -HOMEPAGE = "http://pywbem.github.io"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
> -
> -inherit pypi
> -
> -SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
> -PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
> -
> -S = "${WORKDIR}/git"
> -
> -DEPENDS += " \
> -    ${PYTHON_PN}-ply-native \
> -    ${PYTHON_PN}-pyyaml-native \
> -    ${PYTHON_PN}-six-native \
> -"
> -
> -do_install_append() {
> -    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> -
> -    rm -f ${D}${bindir}/*.bat
> -}
> -
> -RDEPENDS_${PN}_class-target += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-ply \
> -    ${PYTHON_PN}-pyyaml \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-stringold \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-unixadmin \
> -    ${PYTHON_PN}-xml \
> -"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
> index abfb8d920..cbb55b8f7 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
> @@ -1,5 +1,52 @@
> -require python-pywbem.inc
> -inherit setuptools3 update-alternatives
> +SUMMARY = "Python WBEM Client and Provider Interface"
> +DESCRIPTION = "\
> +A Python library for making CIM (Common Information Model) operations over \
> +HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
> +WBEM client should be easy to use and not necessarily require a large amount \
> +of programming knowledge. It is suitable for a large range of tasks from \
> +simply poking around to writing web and GUI applications. \
> +\
> +WBEM, or Web Based Enterprise Management is a manageability protocol, like \
> +SNMP, standardised by the Distributed Management Task Force (DMTF) available \
> +at http://www.dmtf.org/standards/wbem. \
> +\
> +It also provides a Python provider interface, and is the fastest and easiest \
> +way to write providers on the planet."
> +HOMEPAGE = "http://pywbem.github.io"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
> +
> +inherit pypi setuptools3 update-alternatives
> +
> +SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
> +PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-ply-native \
> +    ${PYTHON_PN}-pyyaml-native \
> +    ${PYTHON_PN}-six-native \
> +"
> +
> +do_install_append() {
> +    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> +
> +    rm -f ${D}${bindir}/*.bat
> +}
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-ply \
> +    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-stringold \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-unixadmin \
> +    ${PYTHON_PN}-xml \
> +"
>   
>   ALTERNATIVE_${PN} = "mof_compiler pywbemcli wbemcli"
>   ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
> @@ -7,3 +54,5 @@ ALTERNATIVE_TARGET[pywbemcli] = "${bindir}/pywbemcli"
>   ALTERNATIVE_TARGET[wbemcli] = "${bindir}/wbemcli"
>   
>   ALTERNATIVE_PRIORITY = "60"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------30742B4082677D43303C038B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-extended/pywbem/python-pywbem.inc | 51 ------------------
 .../pywbem/python3-pywbem_0.15.0.bb           | 53 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 51 insertions(&#43;), 53 deletions(-)
 delete mode 100644 meta-python/recipes-extended/pywbem/python-pywbem.inc

diff --git a/meta-python/recipes-extended/pywbem/python-pywbem.inc b/meta-python/recipes-extended/pywbem/python-pywbem.inc
deleted file mode 100644
index 98508b0c3..000000000
--- a/meta-python/recipes-extended/pywbem/python-pywbem.inc
&#43;&#43;&#43; /dev/null
@@ -1,51 &#43;0,0 @@
-SUMMARY = &quot;Python WBEM Client and Provider Interface&quot;
-DESCRIPTION = &quot;\
-A Python library for making CIM (Common Information Model) operations over \
-HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
-WBEM client should be easy to use and not necessarily require a large amount \
-of programming knowledge. It is suitable for a large range of tasks from \
-simply poking around to writing web and GUI applications. \
-\
-WBEM, or Web Based Enterprise Management is a manageability protocol, like \
-SNMP, standardised by the Distributed Management Task Force (DMTF) available \
-at <a class="moz-txt-link-freetext" href="http://www.dmtf.org/standards/wbem">http://www.dmtf.org/standards/wbem</a>. \
-\
-It also provides a Python provider interface, and is the fastest and easiest \
-way to write providers on the planet.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
-LICENSE = &quot;LGPLv2.1&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
-
-inherit pypi 
-
-SRCREV = &quot;b3386b3bee8876d15f0745147c0b08937d8ab18e&quot;
-PYPI_SRC_URI = &quot;git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15&quot;
-
-S = &quot;${WORKDIR}/git&quot;
-
-DEPENDS &#43;= &quot; \
-    ${PYTHON_PN}-ply-native \
-    ${PYTHON_PN}-pyyaml-native \
-    ${PYTHON_PN}-six-native \
-&quot;
-
-do_install_append() {
-    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-
-    rm -f ${D}${bindir}/*.bat
-}
-
-RDEPENDS_${PN}_class-target &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-ply \
-    ${PYTHON_PN}-pyyaml \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-unixadmin \
-    ${PYTHON_PN}-xml \
-&quot;
-
-BBCLASSEXTEND = &quot;native<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bbb/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bbindexabfb8d920..cbb55b8f7100644---a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb&#43;&#43;&#43;b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb@@-1,5&#43;1,52@@-requirepython-pywbem.inc-inheritsetuptools3update-alternatives&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
index abfb8d920..cbb55b8f7 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
@@ -1,5 &#43;1,52 @@
-require python-pywbem.inc
-inherit setuptools3 update-alternatives
&#43;SUMMARY = &quot;</a>Python WBEM Client and Provider Interface&quot;
&#43;DESCRIPTION = &quot;\
&#43;A Python library for making CIM (Common Information Model) operations over \
&#43;HTTP using the WBEM CIM-XML protocol. It is based on the idea that a good \
&#43;WBEM client should be easy to use and not necessarily require a large amount \
&#43;of programming knowledge. It is suitable for a large range of tasks from \
&#43;simply poking around to writing web and GUI applications. \
&#43;\
&#43;WBEM, or Web Based Enterprise Management is a manageability protocol, like \
&#43;SNMP, standardised by the Distributed Management Task Force (DMTF) available \
&#43;at <a class="moz-txt-link-freetext" href="http://www.dmtf.org/standards/wbem">http://www.dmtf.org/standards/wbem</a>. \
&#43;\
&#43;It also provides a Python provider interface, and is the fastest and easiest \
&#43;way to write providers on the planet.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pywbem.github.io">&quot;http://pywbem.github.io&quot;</a>
&#43;LICENSE = &quot;LGPLv2.1&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24">&quot;file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24&quot;</a>
&#43;
&#43;inherit pypi setuptools3 update-alternatives
&#43;
&#43;SRCREV = &quot;b3386b3bee8876d15f0745147c0b08937d8ab18e&quot;
&#43;PYPI_SRC_URI = &quot;git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15&quot;
&#43;
&#43;S = &quot;${WORKDIR}/git&quot;
&#43;
&#43;DEPENDS &#43;= &quot; \
&#43;    ${PYTHON_PN}-ply-native \
&#43;    ${PYTHON_PN}-pyyaml-native \
&#43;    ${PYTHON_PN}-six-native \
&#43;&quot;
&#43;
&#43;do_install_append() {
&#43;    mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
&#43;
&#43;    rm -f ${D}${bindir}/*.bat
&#43;}
&#43;
&#43;RDEPENDS_${PN}_class-target &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-ply \
&#43;    ${PYTHON_PN}-pyyaml \
&#43;    ${PYTHON_PN}-six \
&#43;    ${PYTHON_PN}-stringold \
&#43;    ${PYTHON_PN}-threading \
&#43;    ${PYTHON_PN}-unixadmin \
&#43;    ${PYTHON_PN}-xml \
&#43;&quot;
 
 ALTERNATIVE_${PN} = &quot;mof_compiler pywbemcli wbemcli&quot;
 ALTERNATIVE_TARGET[mof_compiler] = &quot;${bindir}/mof_compiler&quot;
@@ -7,3 &#43;54,5 @@ ALTERNATIVE_TARGET[pywbemcli] = &quot;${bindir}/pywbemcli&quot;
 ALTERNATIVE_TARGET[wbemcli] = &quot;${bindir}/wbemcli&quot;
 
 ALTERNATIVE_PRIORITY = &quot;60&quot;
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

--------------30742B4082677D43303C038B--
