Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web10.9918.1593089946760733006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hZ1CQkGx;
 spf=pass (domain: windriver.com, ip: 40.107.223.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nN/5FzQZTQyZuuZRW1QthhCWj6aMeYkPMPJhaEUk1ZYNgdMFF3v9W2XVDxWSx0Y85lTHzIjyelfnuYqsAlGKLiRnMOlXpX1dxqQK5YP3jsJ6+pOiJod/oEBVIqQzeGRGqip7QM2m7scEajOOtvmGMdP+V/unJ+bN5AlrZ6UNOBtincKt2oKrKWSpafFsetsfJbTnUBKjU36lg7N16MQrfYoW8IKd1oR9KiBdTtwIvunV6UMtiKaQois6zGkTZms99W2JaQA52kFMW8y6jK/vsC3CBjyPEz91wDuwMvkk9aRjG0zX9/nvJqBnOxCwaWPZUiWrCKKnNQ0p6ZR1JgJTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p/CC683TlYXlclHWWUfFZ+qyAy/I2C7ZOc8wgYE2sU=;
 b=KBOR5fWdgqqPpbz+LW3uBeg7WDNIE9TQH2aFeK9/W+YdOmQ9j0fKRGw7D/TJgN0VlAT0+0Tg5UAgP7su4a9nE/Y+Rold1gU3SfJDOYdvIMoZEdnpufRNQkAy3OobuUZUgILvXG64ISXcyJKT0rVyusyf9Dt/6XN5dzV85aqUPULYJOkGZWCWLLSzjpl9r2gNLf8RWjzr7ErERl6YFrEB9GEk6tKS8OEaUTixHWch+BbBd85WHSE7g+86CsZhW7O9eeIbFcYY1czQ5heB1MKGrvucpwLyvgl4s2sE+zYQ3I+jT2Ym/Jc3B/SnP+779fagpzPF3yII3qvhuLL+W8qTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p/CC683TlYXlclHWWUfFZ+qyAy/I2C7ZOc8wgYE2sU=;
 b=hZ1CQkGxJDDxMquUyRGPQrhx3bk5a6cwXxI7hzsQd8I7izB0GiUMInYKLwQf1WXaA/DIu+vioxAMG6n4Yi/Ym3hiFUgFrO6cGkcAq+YwWu8uBcbdYGF6J8lOs/POMyVpDknspPjd3NEvU9NYFbDmbnvc6cTX3uJUhnTDqcJUp1M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:59:05 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:05 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-license-expression: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0d845e1d-1431-7fbe-4fe9-2316c15b72cb@windriver.com>
Date: Thu, 25 Jun 2020 08:59:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:59:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aea29355-034c-4c88-c4c1-08d819078a66
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39546B6C751234957962F3279F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DphpK5SQyGDo53bOAkBGtrXA4zqZEsmTpgLzRYUx4XQHV+IBgwIHA5OxwcflvmFKyjCPdx15opASIlW9wuDsDbL5MQcvd0+PovKVHvRdahdKYZk2hV8drEZ5Dch3SilWt9VvU4LU0hcxR5/LIV93WRDBhfXY9FeU52mANPLEz1bmoUY70i3MkSf0pH+sh3SH6YXtenoqWi9qK7zut4j4o/jxVXMVGjiOky20xnfcKeP1sBG/1vcwejBqzD2E81VXvVCCyNe7QIpn/rRVf8ybuxV6gc2RA9Ng+SOaNTJrG2slcOWizjBw5seLhaN1unpF+ZnKpLUwmUrUeLRBMtaYY79oya249L6hkfqAo8T0i2GlQnMF97aHxEmkxAdH71VFSgarLNeShla/UszHJGxzoSNZ3SgVNxFuDtoy+JOVBRy6siEu6ykMeA+z4in4wYrG7OdPStdbXPpWD5QZFhzfGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iKz4xm59eLjtnzjKxogdmA5C2awWKG39P7xbZAfymb7MM422CAVM6wl1Q0K07xyfY3IYpGLu21JGF7oSyp4y2tB8V1VuO6DMrJDB19BH5k8BTjrDuIG9pE1A4SJSF5YfqN3BzvyaPWrwUiuQ/4yv2pnN0lkHsMqpd3fM+IZmAMVanvxfMjqSTNVI+ngVlmSzoO5nrrWAmOwzY55jpYH03nSPK8wOB69og2axj+gObKmbDUkdNqJY8EIFr5ArgnwYPFJvycu7mTTxsRqxoYcazQOe07HS1dKMUq53+C/NjjOPuEhp8Ov8F0V1LHZGEV0gjr3j+iS20IXrYhgGRWHXTumlcIPnJQdZx2c6nbRrbn8FvG/8CL+b2RF0T2d8Dvpm7NgQBOSpUUpYsMzcbC07NrHvbjiRKA4u43xVas7AVPoCn0ubzwaAD4zUa04OwO5WOt/I4Sr2Y0jLR+q2cUcQ5Bw6O42ECW3HVlQNQsZivbnNuwS2t4HG2FDAP6icOiYa
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea29355-034c-4c88-c4c1-08d819078a66
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:05.3046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzsRwo1M7rSV0OSlkJNjpCj5Go5/ckvtruusMIhOwdSNgGuGLPgzNlUY+e5sg1UTmp9keBRjm20foBiEpigTNo7kewbGF9z3XF045C0fzM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------BB67EE2BF3FA9789ED4831D8"
Content-Language: en-US

--------------BB67EE2BF3FA9789ED4831D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-license-expression.inc      | 29 -----------------
>   .../python/python3-license-expression_1.0.bb  | 31 +++++++++++++++++--
>   2 files changed, 29 insertions(+), 31 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-license-expression.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
> deleted file mode 100644
> index add25810d..000000000
> --- a/meta-python/recipes-devtools/python/python-license-expression.inc
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
> -HOMEPAGE = "https://github.com/nexB/license-expression"
> -
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
> -
> -SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
> -SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
> -
> -inherit pypi ptest
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-booleanpy \
> -    "
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
> diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> index 10a702ca4..b1c38e95d 100644
> --- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> @@ -1,2 +1,29 @@
> -inherit setuptools3
> -require python-license-expression.inc
> +SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
> +HOMEPAGE = "https://github.com/nexB/license-expression"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +
> +SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
> +SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
> +
> +inherit pypi ptest setuptools3
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-booleanpy \
> +    "
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

--------------BB67EE2BF3FA9789ED4831D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-license-expression.inc      | 29 -----------------
 .../python/python3-license-expression_1.0.bb  | 31 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 29 insertions(&#43;), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-license-expression.inc

diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
deleted file mode 100644
index add25810d..000000000
--- a/meta-python/recipes-devtools/python/python-license-expression.inc
&#43;&#43;&#43; /dev/null
@@ -1,29 &#43;0,0 @@
-SUMMARY = &quot;Utility library to parse, compare, simplify and normalize license expressions&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nexB/license-expression">&quot;https://github.com/nexB/license-expression&quot;</a>
-
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
-
-SRC_URI[md5sum] = &quot;81477f779099f55071c6a7b88a29bb01&quot;
-SRC_URI[sha256sum] = &quot;8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d&quot;
-
-inherit pypi ptest
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-booleanpy \
-    &quot;
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
diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
index 10a702ca4..b1c38e95d 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
@@ -1,2 &#43;1,29 @@
-inherit setuptools3
-require python-license-expression.inc
&#43;SUMMARY = &quot;Utility library to parse, compare, simplify and normalize license expressions&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nexB/license-expression">&quot;https://github.com/nexB/license-expression&quot;</a>
&#43;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;81477f779099f55071c6a7b88a29bb01&quot;
&#43;SRC_URI[sha256sum] = &quot;8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d&quot;
&#43;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-booleanpy \
&#43;    &quot;
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

--------------BB67EE2BF3FA9789ED4831D8--
