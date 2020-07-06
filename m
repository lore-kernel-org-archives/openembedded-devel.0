Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.53])
 by mx.groups.io with SMTP id smtpd.web11.60920.1594050584614986204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dA2HNrFK;
 spf=pass (domain: windriver.com, ip: 40.107.69.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcB9AUOjqo0SwSqkfjn16Uust+xqSFisckAAnxQJsGwlURXeicbEvMlQJpLDKcqrwZ2p+tpQFPGL0P/UyQDrFjv6s0mD6MP6/atMwF7HmuQ5AQcqe8e/sMkXM+tlCb6vWOZswv4p2Tmre6CrUZ/5bG14p31d498TqbaV+s0bZHHpqz4Mr0CR3uB5SERLnxq+ksNSjkymqh88ton61YMvFYD+WjuqvLYro2BLx3LUjTajFSzA2gWCHKhqdC74LUGgsn+ks55xD3FfgdWKI3leD8OB2EFhDJVmFNxkFbVX+Xk4zhUT2QvKUQTgTtVp9LsfLwa6hZpG9Afcz20/h4AstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pX9FBbIi9qRUcVme/yNghYHvtjO+zVHpqiXZ0e8xZuQ=;
 b=Tj94Ohsi1bi1BfrQS1QJwn6+qMeauux3jDam7hph8cslZOBPBuOpgZWjeQCOVMA04v+6fYavCLC68jzBrtuiFhnk1O9aWeqNhTvFojOz39iPlGhDf8y3q0DseGlMujbAPcmJHoeihdk1JibHIDDo5kSB0i6sEHdDp/5DhclWS8jTCTc0OHqmbmglRnkUNRQkUjmLF4gzgduIZTYSPX+L2B89pqRuvAF7ZRjeVCu8VY/G91CneYQVkLkFstqc6nmbCoWYLWrn6kLop8s4LxgWkjqYoltLX0WePLm1eQIJxC4KRwmIhaxiJ/o5DpXY10I4Yk0LcY3ePDX8l9vVA8m2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pX9FBbIi9qRUcVme/yNghYHvtjO+zVHpqiXZ0e8xZuQ=;
 b=dA2HNrFKA4Ry64DetHyXbWHHajZlGDsFBij2LcEwxvDK39rOJlFAdmok9uxMMi1h3JBqoqwoQQxg8PApXb9BnQEuXllfDBvUAOj2iyU6cjGEW01x1DB4yPemitjjHI4pJsks2o1OCbXYDTptyUYVgbmGPOH70MevV5q1fEYAxwY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:49:43 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:49:43 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-pyasn1-modules: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <442b3a62-1f7b-45df-a1d0-147d224dbcbb@windriver.com>
Date: Mon, 6 Jul 2020 11:49:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:49:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5642bed-d089-4471-8679-08d821c43396
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1899CE1D15EE853479C520189F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NDW2O1pJK0PB2pbrvKoTUmBkY973p6AO9O9w/zThqvD95qiYW6WswOsNLPgg935BNU94ijEcn4AlP+ioKZe/80RILsH7xZyBe0TZsDmeb0JQaNzmbO2YB+9EJicRGv7ZHhBTdaXxMFL1DIsW05gz6Ipse0qNWTGNzaWn+Kw/5h+OZarCxlA+o+7yK4LXQuAnii3yxs9h5oyJ01k3MEKL91LN6n/U7XqfKtNQhRH/7pQGh+1ZWqPN4vgADdM/UDt4FTog8FTPrg2U1eWOylfETs0m61/hmzdp6FtPTrIF2cPyOUX+4EoqCFnRO4y0C43vnIc5h1pTE/GyKbiuHUk92iIFR6lGLaVH4alH4LlEM3x+g6yqPZK2vfWzSz1YfQjb1ry/9oRbR13gzk2xSS6K2JNg5Nx0iVKH35g3nSV1Jk4/1arE7g4+eo8tY2aAo2eObruuyRXaxYgeXm3gtFy6ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(16576012)(5660300002)(31686004)(86362001)(83380400001)(498600001)(31696002)(6486002)(966005)(36756003)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1yYaiPCE00orQgcWFcI5IEYEFFduUGA2lPXHkm+g1Hq3cBVGRkdQAYYyM6dZ/NsTG+WfvBj2TzXwq9YuatpVYUV22wZO/TeZxvEA5JPuE1YHTNzkHRPtxjF8RshNtXS6nvn1k7cT7SpAYGMkHSTLhQBBWurkQ4K4/Sk51aUAQraRAgwMf8ouY7XmrDGQnFqyhFByvI+zQqPU1IAzVTLjYjPat1MJipJ1S+WZN1hsgFZBbXoWQ49h4nwmVOFhH+hiT2S1MWlwe1/CfxX9WeigZ9Qdux+KnkCZNFfIXZV+/+EHuirZm2zJMRKYXZO9UptfbSP9UBK54MVy0RfXJ+zN3fKSxjGBqVsKlN6X+1PJHXUlgewlYD4ZRmo/0ua3mlSemDRjAlFBl0yjbVH6oA2BIkF3ijB94rYnzvMlZX6mhmru+MT9LnbXFYtqm7c48Lcy1ffv0MlK5HHotOx+dI4jtT7wgaDetKbNBt7Y6vuTn0BTYP2j/uC8sR24hF+OrrL8
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5642bed-d089-4471-8679-08d821c43396
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:49:43.6714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZDrxsf6sSf9bqsNQmV5lgCIEbGyJuPIv5NfUpMbl72zoiQ1IAZMA7X5gShnVOFSnmwKTXzbUKhKPWb6ttab0G5t+HP6BQI9qnCE/9A6RfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------268D8354FF76951251B6AAF0"
Content-Language: en-US

--------------268D8354FF76951251B6AAF0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-pyasn1-modules.inc          | 29 -----------------
>   .../python/python3-pyasn1-modules_0.2.7.bb    | 31 +++++++++++++++++--
>   2 files changed, 29 insertions(+), 31 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
> deleted file mode 100644
> index ce9791993c..0000000000
> --- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY = "A collection of ASN.1-based protocols modules."
> -DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
> - classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
> - data structures (X.509, PKCS etc.)."
> -HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
> -
> -SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
> -SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
> -
> -inherit pypi ptest
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
> index 3b1186f06c..f2a836b04a 100644
> --- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
> @@ -1,2 +1,29 @@
> -require python-pyasn1-modules.inc
> -inherit setuptools3
> +SUMMARY = "A collection of ASN.1-based protocols modules."
> +DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
> + classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
> + data structures (X.509, PKCS etc.)."
> +HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
> +
> +SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
> +SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
> +
> +inherit pypi ptest setuptools3
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-pyasn1"
> +
> +BBCLASSEXTEND = "native nativesdk"
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
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------268D8354FF76951251B6AAF0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-pyasn1-modules.inc          | 29 -----------------
 .../python/python3-pyasn1-modules_0.2.7.bb    | 31 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 29 insertions(&#43;), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyasn1-modules.inc

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
deleted file mode 100644
index ce9791993c..0000000000
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
&#43;&#43;&#43; /dev/null
@@ -1,29 &#43;0,0 @@
-SUMMARY = &quot;A collection of ASN.1-based protocols modules.&quot;
-DESCRIPTION = &quot;A collection of ASN.1 modules expressed in form of pyasn1\
- classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
- data structures (X.509, PKCS etc.).&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/etingof/pyasn1-modules">&quot;https://github.com/etingof/pyasn1-modules&quot;</a>
-LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd">&quot;file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd&quot;</a>
-
-SRC_URI[md5sum] = &quot;18c77d56abeef631d94f95ff2d652859&quot;
-SRC_URI[sha256sum] = &quot;0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b&quot;
-
-inherit pypi ptest
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-pyasn1&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-SRC_URI &#43;= &quot; \
-	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest &#43;= &quot; \
-	${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
index 3b1186f06c..f2a836b04a 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
@@ -1,2 &#43;1,29 @@
-require python-pyasn1-modules.inc
-inherit setuptools3
&#43;SUMMARY = &quot;A collection of ASN.1-based protocols modules.&quot;
&#43;DESCRIPTION = &quot;A collection of ASN.1 modules expressed in form of pyasn1\
&#43; classes. Includes protocols PDUs definition (SNMP, LDAP etc.) and various\
&#43; data structures (X.509, PKCS etc.).&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/etingof/pyasn1-modules">&quot;https://github.com/etingof/pyasn1-modules&quot;</a>
&#43;LICENSE = &quot;BSD-2-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd">&quot;file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;18c77d56abeef631d94f95ff2d652859&quot;
&#43;SRC_URI[sha256sum] = &quot;0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b&quot;
&#43;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;RDEPENDS_${PN} = &quot;${PYTHON_PN}-pyasn1&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------268D8354FF76951251B6AAF0--
