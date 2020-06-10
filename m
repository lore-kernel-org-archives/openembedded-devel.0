Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.43])
 by mx.groups.io with SMTP id smtpd.web12.12197.1591799412461268540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aMAtjjPP;
 spf=pass (domain: windriver.com, ip: 40.107.243.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtYhYMbghUSOCSnGatAap1hEE6/yu/7euAFUrTIuUqhd8yrPlTFSvCuqz35kVGn7tAPGsn3EGgl1YOAgslQXUIJrU54n/pHbGf4pSJKj3zb/XtWs0VYuzpS6ZYpJ3ZIHSNYr7dvJVxRNB0k9va2lO4E54SfrqOIbG/if8+i8YjrFtml7cHkSRVmrLSGQrD++VOmKn+Fl3UEuZ6khnJ3G4f/vnr3IYzMrR4JcLDDNzXG+SFGz5qXLePAkckid168q38jfNPolU6l+3RsHd4NRHXBpejT5on0UxmTY7MfomSUmsI6wuDrM+80bckbD6wWzLoVEXFvjtAtJtNPXKJHDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhTlKLOuabK8dkWTnCcVYNa265HXtBrvMbwJiBJCf98=;
 b=QwWoh5H2soeVNYB19D6AsUedjjaembrrmCMrXHNaemdvMs8+ujJTzwMestZ7Q9ePHEWKjrR6e3mI/WdvmqEUjiN4NYIykhDnxrGEDBzWSpRjbKeawVdIA8GnNDYf7rBfJ9sVj7Ot+HirTKe9L/Ngezw5QvISqllcN2l7Lvh2cShWkgwYFcTVjCkM5VwZ57QqyRFdyZLxI5QiB7OB5WIKTq0nFJ/B1r1x6OgwYroj7t9UFyIKlFI/oa+NfMsAz4ocxF12mLpXerQCrXJE4u17bkspf/4MnrrePtkBloQQKKx3dSU6frYG0aSgshTpo7pwpR1cmDsTFHugNiZkUZ47jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhTlKLOuabK8dkWTnCcVYNa265HXtBrvMbwJiBJCf98=;
 b=aMAtjjPPL/07tz/YBjRUitSby4w5KcwnHJsVedGXDnhA6mddEiaDUDg/izKyTbWNewpvxEobkS2aItuB77aGGQFTMenYG28QmTD1gMOJTpPLClAaw0FjcHY0SLLVnys5IpRCFbfuVHozP6gQ5Zbd/454PRnNxw6qPZB9fAfpvQU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1393.namprd11.prod.outlook.com (2603:10b6:404:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 14:30:10 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:30:10 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-prettytable: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <094b85d3-cfd3-6406-5a71-0507324824c7@windriver.com>
Date: Wed, 10 Jun 2020 10:30:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0096.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 14:30:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e465ce78-4efa-453c-7d79-08d80d4ac7bb
X-MS-TrafficTypeDiagnostic: BN6PR11MB1393:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB13932B57092B73EF4A54D9749F830@BN6PR11MB1393.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tIbYngiqKPZQT1Ag+PjToofmN6cyXDyiXag/28wR4Bf9OZxUPNtnSW2LMIfW6ywa4E9KANqt80gwpzHqPW11uAM3prbtEuIN2P7v9lq+FhUcGIhL3m/gSld7f1uaOWQHLu/UZPuVr+4Gbiy0VzyzTbs3KX0juxaaO4cYfuPnlIVE98CHgX2tvMW0rMbOqvlpbpx6aM6exZ36v4ey8S4cYZnFzK7vtDLnjzZm8bblgds1LEkmbi65h8pWrj9QohG5AmvXSYHbOpQ84zykkyHNS/Fv16CvT+ijqBRdvh582GdbgYpHEiN/f8OAia8Qe9HOax/fL7GKpH4B0NXNPInP4rgPfhXc0XHoFYZz/FwQjUl6XQR0EwdUVfR/4t9l/xH1yw9D6OZxqH/4vJwUeyw52U3GXPXrl2evzS2QVGsxKH4AI2HSxUtdW0rNUQPTKOcj4foRyDSkpEz9RU6cZC6U5Krx3tcrsCjAIuIwJQEL2Ik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(136003)(376002)(346002)(396003)(366004)(44832011)(2616005)(2906002)(478600001)(956004)(86362001)(31686004)(16576012)(316002)(31696002)(36756003)(8936002)(966005)(5660300002)(16526019)(66556008)(66946007)(19273905006)(66476007)(83380400001)(166002)(8676002)(186003)(33964004)(26005)(53546011)(6486002)(52116002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vWQVg6Wa3l4d/eYgH/7CKSbGhgT52v6BbONlnk9tSm9qJTH9HIWBT4u3pCsXdvgzp0WxsSZWA1cI+ORdkaAn9sTH/XIbAVE8x3YBaKLZwoK4Q9tAgEav0Hs1VkiLAtSnFxSsEslkM4IyWssll/lLg9eCl2hSl2YdqkZYG3TNCLVDkUS/5U12NwFWp0FvB9dwSlRYHWEOx07d20Icj4V0srjv4MiB8qYzL8718vFcmvGAFj2GXD6iDrOsOglmitdQCml2kxUz9aSo9xSNb43GLIftgSGVTiXXIbgxrhGkpjLeaV7EZxGY+pP5pHngIJD+S4T50wDvxkEb1kkfwgYgpunkeej2C2cIKvm+L0C7Zmc3RYmnXAMhguitSg8QFQ0p40LAXWTjIVqDWSovp2YZUoMO6Cqe36LvihmqiK1pIU5ej0wJzEhJMKIRTKECl6v/572LjnoQuU6FCKsfRVVXWwTXe6Vigd/80p4yH7Ah3mA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e465ce78-4efa-453c-7d79-08d80d4ac7bb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:30:10.4508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHfwMBSqXULNXRk96baHXGJDwd/cCae3pCqTR/0qB2gdlg0R/L5AX5GS4FgU1xw9Yc2j2UUPdxlZ75RUE3l/TPJXDKayDUoItmtSWy0STow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1393
Content-Type: multipart/alternative;
 boundary="------------B63C87DC694C6D61144F7144"
Content-Language: en-US

--------------B63C87DC694C6D61144F7144
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file. Inherit pypi.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-prettytable.inc             | 43 -------------------
>   .../python/python3-prettytable_0.7.2.bb       | 38 +++++++++++++++-
>   2 files changed, 36 insertions(+), 45 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-prettytable.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
> deleted file mode 100644
> index c77a49191..000000000
> --- a/meta-python/recipes-devtools/python/python-prettytable.inc
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -SUMMARY = "Python library for displaying tabular data in a ASCII table format"
> -HOMEPAGE = "http://code.google.com/p/prettytable"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
> -
> -SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
> -SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
> -
> -SRCNAME = "prettytable"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -do_install_append() {
> -    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
> -    for f in $perm_files; do
> -        chmod 644 "${f}"
> -    done
> -}
> -
> -UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
> -UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -inherit ptest
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS_${PN} += " \
> -	${PYTHON_PN}-math \
> -	${PYTHON_PN}-html \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
> index 5445f1019..18f339061 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
> @@ -1,3 +1,37 @@
> -inherit setuptools3
> -require python-prettytable.inc
> +SUMMARY = "Python library for displaying tabular data in a ASCII table format"
> +HOMEPAGE = "http://code.google.com/p/prettytable"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
>   
> +SRC_URI[md5sum] = "a6b80afeef286ce66733d54a0296b13b"
> +SRC_URI[sha256sum] = "2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
> +
> +do_install_append() {
> +    perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
> +    for f in $perm_files; do
> +        chmod 644 "${f}"
> +    done
> +}
> +
> +UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
> +UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +inherit pypi ptest setuptools3
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN} += " \
> +	${PYTHON_PN}-math \
> +	${PYTHON_PN}-html \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
> +}
>
> 

--------------B63C87DC694C6D61144F7144
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file. Inherit pypi.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-prettytable.inc             | 43 -------------------
 .../python/python3-prettytable_0.7.2.bb       | 38 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 36 insertions(&#43;), 45 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-prettytable.inc

diff --git a/meta-python/recipes-devtools/python/python-prettytable.inc b/meta-python/recipes-devtools/python/python-prettytable.inc
deleted file mode 100644
index c77a49191..000000000
--- a/meta-python/recipes-devtools/python/python-prettytable.inc
&#43;&#43;&#43; /dev/null
@@ -1,43 &#43;0,0 @@
-SUMMARY = &quot;Python library for displaying tabular data in a ASCII table format&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3e73500ffa52de5071cff65990055282">&quot;file://COPYING;md5=3e73500ffa52de5071cff65990055282&quot;</a>
-
-SRC_URI[md5sum] = &quot;0c1361104caff8b09f220748f9d69899&quot;
-SRC_URI[sha256sum] = &quot;a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f&quot;
-
-SRCNAME = &quot;prettytable&quot;
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip">&quot;https://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip&quot;</a>
-
-S = &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;
-
-do_install_append() {
-    perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
-    for f in $perm_files; do
-        chmod 644 &quot;${f}&quot;
-    done
-}
-
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/PrettyTable/">&quot;https://pypi.python.org/pypi/PrettyTable/&quot;</a>
-UPSTREAM_CHECK_REGEX = &quot;/PrettyTable/(?P&lt;pver&gt;(\d&#43;[\.\-_]*)&#43;)&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-inherit ptest
-
-SRC_URI &#43;= &quot; \
-	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-	${PYTHON_PN}-math \
-	${PYTHON_PN}-html \
-&quot;
-
-RDEPENDS_${PN}-ptest &#43;= &quot; \
-	${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
index 5445f1019..18f339061 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-prettytable_0.7.2.bb
@@ -1,3 &#43;1,37 @@
-inherit setuptools3
-require python-prettytable.inc
&#43;SUMMARY = &quot;Python library for displaying tabular data in a ASCII table format&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/prettytable">&quot;http://code.google.com/p/prettytable&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3e73500ffa52de5071cff65990055282">&quot;file://COPYING;md5=3e73500ffa52de5071cff65990055282&quot;</a>
 
&#43;SRC_URI[md5sum] = &quot;a6b80afeef286ce66733d54a0296b13b&quot;
&#43;SRC_URI[sha256sum] = &quot;2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9&quot;
&#43;
&#43;do_install_append() {
&#43;    perm_files=`find &quot;${D}${PYTHON_SITEPACKAGES_DIR}/&quot; -name &quot;*.txt&quot; -o -name &quot;PKG-INFO&quot;`
&#43;    for f in $perm_files; do
&#43;        chmod 644 &quot;${f}&quot;
&#43;    done
&#43;}
&#43;
&#43;UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/PrettyTable/">&quot;https://pypi.python.org/pypi/PrettyTable/&quot;</a>
&#43;UPSTREAM_CHECK_REGEX = &quot;/PrettyTable/(?P&lt;pver&gt;(\d&#43;[\.\-_]*)&#43;)&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;	${PYTHON_PN}-math \
&#43;	${PYTHON_PN}-html \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	cp -f ${S}/prettytable_test.py ${D}${PTEST_PATH}/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B63C87DC694C6D61144F7144--
