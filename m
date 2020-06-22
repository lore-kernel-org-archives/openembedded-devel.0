Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.78])
 by mx.groups.io with SMTP id smtpd.web12.17819.1592833599559413546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UMWXvoSy;
 spf=pass (domain: windriver.com, ip: 40.107.75.78, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZHNRK9vjo/hc5jSQcW0/lrQQgAkouLXLIjhEHEKT37Wt+P6mITTsuZ7w4fkxmNdubnwy0vf+4d3URxfZjLapfRt+lqVxLwusWa7vpsbR096mg/cQRinQnzT0L+BkPo6Rwjhjc4SZWUW55UnFfaKG81MRSQiMl95p54EUsOqCT+hNlfqSy7D9mrw4kJIL6Uj7vNy272ISExlAh+MI7Bmrz/38AMwpJ5iWB7qJsTo672tnp0eOXXz+wIp8EBaOs2KKuHMDFPaJxI12teGaJPJVgOeRrC15/RhuY9SZwLt+FanrHrWtjIivRBUXA1lhmm/d43EQM6jX+agh7zPIzlQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN6ssEmKupZwVB7DuCJlQ0SA3Hgx1U2FFg1koC6UkjQ=;
 b=dlCY/Fwp/21rauV3hkOhXu2kw5vwHQYgPVyGMUEwgBZ61tChXoJxRIIpsii/CiwfQRJDGnbse/WvokvYZtqbKE31inGak7VrwDOoU4dO13rANGuxxMEcOaO+i5CnEpsA8SmCpm+4jLIfgqXWvyZrFsj2siTzshuafnI0Dbzqi3rnboqDCfUj3ZycpH7hiwcHSwarMRW1DML+LWP1U5FS0/xTvNIq+eRwaDDwrhtfMH0Fx1NiSJB9e7BUfxD5ImQ+LAuGMNBveOTwdmw2i9Xh+hYRiDa8K2wMZc0iLH2qNbKxzEX2pgKanynVItsLBDOLB+wgWoWo5I09X1jCsxwlOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN6ssEmKupZwVB7DuCJlQ0SA3Hgx1U2FFg1koC6UkjQ=;
 b=UMWXvoSyNWuI9O6l2d+JWNgOI3xzkTkjnthDXRokFi4AXiqWy1iWlHpsZo6V/dfYTtPiJ8SAk6J5nmDY1oYNLI997UiBwCqCuDUYUL1KAoTu00pMcrzyHmUxeNybZSY/tJH1SrtA0JyYyLn1gJX8AnPx5e0E5o4w/RdLj47krmQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:46:38 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:46:38 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-ptyprocess: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a8316458-fc30-3f72-e8c9-77f9bb6d865b@windriver.com>
Date: Mon, 22 Jun 2020 09:46:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:46:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d136cf20-7cde-43af-f58d-08d816b2af96
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546F6205FA2EE30A2C646019F970@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VJSETH8JemKt5atNE5Zn9WrMZNoXqZsPvDQ6X2m53P0fiZh4qHTnMMYrMJa1Cd687s1sl9CB6DV/72vgl8oifzYRtnlNHD6ctrv+OZ0C13wE06fw9qCseX3sRhLqvfeWA8IsP6VZtdplKKXrwdC8O+FlghC87hGNKV30mYywVDSR7VnVJGyfUpYRtO/T5jmabCAFOPiJDBj4wGKflkyPeIq1n3r/XwWU5jv4LDMtUpaseV0yMIUYmjtOeQXph8X2tMwoPRsLeQUdOPYxyppPRWKzSlGXXzcXBAx0rtt+Kixzpu7k89V/Tgb8FcIb8pqr4LEgQIAL6Naysf07yGHduiJdc9FJojiNOyfmfqwRM9Y/8nIOMTiTA+JEb55mF5hxsOODNzkdHXA+VuZda/if0Zi8NQ/Gw8/x2yt+m27ro/ItrICj9M8B1uXKmnfLtSn4wIFpO8mhAmiPheSrImhN+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(39850400004)(396003)(376002)(66556008)(36756003)(2906002)(53546011)(186003)(6486002)(166002)(16526019)(52116002)(31686004)(26005)(83380400001)(31696002)(5660300002)(86362001)(33964004)(16576012)(44832011)(316002)(66946007)(66476007)(8936002)(2616005)(956004)(478600001)(966005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iXaGv3m9CDXLI1Qrg800GXUk8R4CdhVW/nB9ps+LBFGf+NsHeDTWbm4GXVuW+ILceyO0Bv1rITOQVoNDwZRW2cW3+YyGtPgp6NqO7rslBE/aGg8JnWZP4/ev/9B664drAigSuxOrN8UcIeHbO5GZQmZtaIezYcD3u96xO/+6n5vPXWOlCNFFOQIaZwkyyjA/0/6ykZi+VROA5vhdPSaPjgq78eaaaUMgk73RBaSpaNJZNMwffxDpB34es4evUCMrw/bAP6nHAavjROOp7JHj+7kpcM6bhvdGhl15rFypYhD2nEEu/icdZTpRUPK2nJHQB/IW9ugXrtsn+jqFfWbT7mVUpZMT+DH2L8t/x85DNEyF3m/RfKC9ClGhHqoz0nORGhwJjm03A77NoQHfLAp2wCX5geudluGciLE3Mo5qgzIw6N4E+eYjFfQJIqvGPTEQwJMZ9FsQxQQxujs2B0O+uiC88s+auS0Gb5r7fYqhc3k=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d136cf20-7cde-43af-f58d-08d816b2af96
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:46:38.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OgtlnAew+UnuQoyzneC5mmO2lCOIoJfK89uE+0LvmXi6sbdjTEPs+CZnS2S5NSECVCvtv79zE/qkDaT4YPhIatCf93fkXHd3nV9OMQ4GhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------98D813A990522DDBE3DC55F9"
Content-Language: en-US

--------------98D813A990522DDBE3DC55F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-ptyprocess.inc              | 41 ------------------
>   .../python/python3-ptyprocess_0.6.0.bb        | 43 ++++++++++++++++++-
>   2 files changed, 42 insertions(+), 42 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-ptyprocess.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
> deleted file mode 100644
> index a6dc21cf1..000000000
> --- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY = "Run a subprocess in a pseudo terminal"
> -HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
> -SECTION = "devel/python"
> -LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
> -
> -SRCNAME = "ptyprocess"
> -
> -SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
> -SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
> -
> -UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-core \
> -    ${PYTHON_PN}-fcntl \
> -    ${PYTHON_PN}-terminal \
> -    ${PYTHON_PN}-resource \
> -"
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
> -	${PYTHON_PN}-fcntl \
> -	${PYTHON_PN}-terminal \
> -	${PYTHON_PN}-resource \
> -"
> -
> -do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
> index bdcd0e253..87911e02e 100644
> --- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
> @@ -1,2 +1,43 @@
> -require python-ptyprocess.inc
> +SUMMARY = "Run a subprocess in a pseudo terminal"
> +HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
> +SECTION = "devel/python"
> +LICENSE = "ISC"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
> +
> +SRCNAME = "ptyprocess"
> +
> +SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
> +SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
> +
>   inherit pypi setuptools3
> +
> +UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-terminal \
> +    ${PYTHON_PN}-resource \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +inherit ptest
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-fcntl \
> +	${PYTHON_PN}-terminal \
> +	${PYTHON_PN}-resource \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------98D813A990522DDBE3DC55F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-ptyprocess.inc              | 41 ------------------
 .../python/python3-ptyprocess_0.6.0.bb        | 43 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 42 insertions(&#43;), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ptyprocess.inc

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
deleted file mode 100644
index a6dc21cf1..000000000
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
&#43;&#43;&#43; /dev/null
@@ -1,41 &#43;0,0 @@
-SUMMARY = &quot;Run a subprocess in a pseudo terminal&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://ptyprocess.readthedocs.io/en/latest/">&quot;http://ptyprocess.readthedocs.io/en/latest/&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;ISC&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490">&quot;file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490&quot;</a>
-
-SRCNAME = &quot;ptyprocess&quot;
-
-SRC_URI[md5sum] = &quot;37402d69f3b50913d4d483587bffad8f&quot;
-SRC_URI[sha256sum] = &quot;923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0&quot;
-
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/ptyprocess">&quot;https://pypi.python.org/pypi/ptyprocess&quot;</a>
-
-S = &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;
-
-RDEPENDS_${PN} = &quot;\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
-&quot;
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
-	${PYTHON_PN}-fcntl \
-	${PYTHON_PN}-terminal \
-	${PYTHON_PN}-resource \
-&quot;
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
index bdcd0e253..87911e02e 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
@@ -1,2 &#43;1,43 @@
-require python-ptyprocess.inc
&#43;SUMMARY = &quot;Run a subprocess in a pseudo terminal&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://ptyprocess.readthedocs.io/en/latest/">&quot;http://ptyprocess.readthedocs.io/en/latest/&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;ISC&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490">&quot;file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490&quot;</a>
&#43;
&#43;SRCNAME = &quot;ptyprocess&quot;
&#43;
&#43;SRC_URI[md5sum] = &quot;37402d69f3b50913d4d483587bffad8f&quot;
&#43;SRC_URI[sha256sum] = &quot;923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0&quot;
&#43;
 inherit pypi setuptools3
&#43;
&#43;UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/ptyprocess">&quot;https://pypi.python.org/pypi/ptyprocess&quot;</a>
&#43;
&#43;S = &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;
&#43;
&#43;RDEPENDS_${PN} = &quot;\
&#43;    ${PYTHON_PN}-core \
&#43;    ${PYTHON_PN}-fcntl \
&#43;    ${PYTHON_PN}-terminal \
&#43;    ${PYTHON_PN}-resource \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;
&#43;inherit ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;	${PYTHON_PN}-fcntl \
&#43;	${PYTHON_PN}-terminal \
&#43;	${PYTHON_PN}-resource \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------98D813A990522DDBE3DC55F9--
