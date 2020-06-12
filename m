Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.82])
 by mx.groups.io with SMTP id smtpd.web12.21610.1591972865111486988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ML/kYkL5;
 spf=pass (domain: windriver.com, ip: 40.107.244.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKyzkxSZzfierkn5UJvo8AAEToZ+gJn4paVLcYPJsOpFXygDjugsfCoMK+NAoPkGswJl0k3qIJadSDsWqBZW9hhQjljiS5z/ljIdJzEK/hr8DWgeSbeWN+yKa6CFennfnIrPbBS8awIPTqkiDMh2zr9wo7bvl3xm8NLYyIKqQbJgc6cdWSrkJwmwA2ssCdSQzSdjIaPR4WPo+/xfkbs8XCH5cR2CBXKWmEbhMQUhAMH6V3Lf4n6UxTFNE8SLWZoCl25pizBTz+ClI96lgfbPqRK3MoEFfa1TZm+xIrtGv+2ULKlH9wJD+W/VkXfP5ygfGRTu7E1C00lVaUpr1C26/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9uJHFhdHKLswgwpBmlpxuDg4CVKD+XSLmJU0TtWul8=;
 b=dl9ZIVv6wjAj67GJdUTrPQctjMUmuVlJspSXVxGNqLZ8o3OL+AVfFYznOgff4GKQW9P+3ptRIBr9ufe+Xm+7ca9C+0SLtQyCcLHkDsk5klJWUXl3skMNYhY9bOY28Plb7CPfPqYra9faPktu7vXobW+lnOEm3sh8iNP9Lk8mMCD6f2InCNrGL8FF15otQDk5p1QTRCQ4ZbyfgaXEpY0L01OFuyd9vnUnFMncgGSXdEu1O8omNMUe0fTOJELY1c7u9Sl5ButX6skz1sK9dUI+i+L5XuHRXuqdq3PUSyvP7QP6NXawI3NN+5MybNl5o+VaV42eTTH1cYMsbKYqpcWEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9uJHFhdHKLswgwpBmlpxuDg4CVKD+XSLmJU0TtWul8=;
 b=ML/kYkL5O160W4DtWDNKFe/oEUhSRnF3bkltHzBYQTLOLb3ooeCBOFu4x+8ZOQgABif1pnGJvvg9FgieB4UYjpmu4qx0DqBawcudqwcL7iO6u9JZIC6yqwX/rfyUq3fh+Vr49RFXSTDqFr6pjk2On5mG2VNP9COy1x5es7s+jLE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 14:41:03 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:41:03 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-parse-type: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
 <20200612094757.22146-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <66417bc9-cee5-d28e-161d-6ed137efa865@windriver.com>
Date: Fri, 12 Jun 2020 10:41:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612094757.22146-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Fri, 12 Jun 2020 14:41:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09cdeaae-e888-44cb-62e7-08d80edea1bb
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2546F33C6548359A50CB1E8F9F810@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HbY/+P3CtZCUhLq+VnANvdRrA2MVIQP5vGhnENhJROobMN0J1mnBguOwv6wA7ajdUobxwG6pZvX+/IpqRgG6ge71zIwjkgSopnoSRF1wdszYenat9nPiHiwj5K1JZaXtfevhxIDdMKTmjrJYDMxFSbpe6xEQjE6zdLUZtKx2egexXwT4uvEIejrbQTHWiw8ZqfhfocScVcEFRdmSnd6kHurAGo/w/VYIDHMFMS7IjMj5P0I292RTdyDr2SbtwvKckHqhMjmUOnIBirlAoNUG1ZyzRJXsaMnZkCTmwQ4XJLhJINnKQO90aXRyh0rsCnTicjjhlKDgHI4stauYaTv1TctK6lphWQSCj38JDJd80C75KmUsIggDhIEKohHdWVKhxYafX6YPn9U4+QkvEToEDHH+aebHensayCyJcYfv716I8ymK7tQNTh6x1zoRuB/EyIOzc2E37CutrhvUcM9dIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(66556008)(83380400001)(166002)(2906002)(26005)(52116002)(16526019)(53546011)(33964004)(5660300002)(186003)(966005)(2616005)(956004)(44832011)(478600001)(66476007)(16576012)(8936002)(316002)(6486002)(31686004)(31696002)(8676002)(36756003)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GdiWpHIz62Zg4T8Qzg/yPwdfFolRQ8UjsnWRwGMYLnZafkHzlPyI7llI5mWLxRPNfu55HmsUQq0YOqGoUW8ioaJT3sS5csUsVc/hX73wn/AUnTGSVDuVwCjOwdE+P99Vtmg2WR3+gWLMw8FlN8EUa5ntXi4XH2wW8Ga5MDfeXMRvVrQA0Eg5FHDb6ovMzQXFNwSH+hJltej4pYOdraY2E5xjtbTGr1IBiBs/E7UgVM5X8qQYPDh62pBM0AY9mXmRoEeBtLk5BEnuPOB3ugerIiG1fEax5ZJq81uc9S1lffV2VoAKgmz2tyd+Q1sJwnoHB9PX2IvXA9V5KkAMPIVclvb8LYL579raajbHrkxb9+MUKFtSh/SrGcXB3aTyUTH1zQlanoMhZbbKqYNjAqZqtVbXLU4kX24UNW0aCSnvAlLB9vsKPOQ/2fBDNBc6Hfcm21V8Ee7f+0sCrTsFlaEFIYhwS1muIt7fM4czdCfuZmNG4yh/HVKi+IG0rdggjpPt
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cdeaae-e888-44cb-62e7-08d80edea1bb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:41:03.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MouAZx6UPr54h0LSHL56UOTo60/oEddShT/evPuxA5/w8wT/6MwzXXjcbZpPAkdHJg4l6Fn7WYAfyjT8TPyJNDJUwCzvy34TYGPUiJ0TLac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------418C94CEFFD86E97C9F400B1"
Content-Language: en-US

--------------418C94CEFFD86E97C9F400B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 5:47 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-parse-type.inc              | 25 -----------------
>   .../python/python3-parse-type_0.4.2.bb        | 27 +++++++++++++++++--
>   2 files changed, 25 insertions(+), 27 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
> deleted file mode 100644
> index 147ea6443..000000000
> --- a/meta-python/recipes-devtools/python/python-parse-type.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "Simplifies building parse types based on the parse module"
> -HOMEPAGE = "https://github.com/jenisys/parse_type"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> -
> -SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> -SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> -
> -PYPI_PACKAGE = "parse_type"
> -inherit pypi ptest
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-parse"
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
> diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> index 91d9ce2d4..a9e7a53ee 100644
> --- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
> @@ -1,2 +1,25 @@
> -inherit setuptools3
> -require python-parse-type.inc
> +SUMMARY = "Simplifies building parse types based on the parse module"
> +HOMEPAGE = "https://github.com/jenisys/parse_type"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
> +
> +SRC_URI[md5sum] = "b5fa59e45965d1b2896023742df2e707"
> +SRC_URI[sha256sum] = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"
> +
> +PYPI_PACKAGE = "parse_type"
> +inherit pypi ptest setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-parse"
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

--------------418C94CEFFD86E97C9F400B1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 5:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612094757.22146-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612094757.22146-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-parse-type.inc              | 25 -----------------
 .../python/python3-parse-type_0.4.2.bb        | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 25 insertions(&#43;), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse-type.inc

diff --git a/meta-python/recipes-devtools/python/python-parse-type.inc b/meta-python/recipes-devtools/python/python-parse-type.inc
deleted file mode 100644
index 147ea6443..000000000
--- a/meta-python/recipes-devtools/python/python-parse-type.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-SUMMARY = &quot;Simplifies building parse types based on the parse module&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jenisys/parse_type">&quot;https://github.com/jenisys/parse_type&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95">&quot;file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95&quot;</a>
-
-SRC_URI[md5sum] = &quot;b5fa59e45965d1b2896023742df2e707&quot;
-SRC_URI[sha256sum] = &quot;f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c&quot;
-
-PYPI_PACKAGE = &quot;parse_type&quot;
-inherit pypi ptest
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-parse&quot;
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
diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
index 91d9ce2d4..a9e7a53ee 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-parse-type_0.4.2.bb
@@ -1,2 &#43;1,25 @@
-inherit setuptools3
-require python-parse-type.inc
&#43;SUMMARY = &quot;Simplifies building parse types based on the parse module&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jenisys/parse_type">&quot;https://github.com/jenisys/parse_type&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95">&quot;file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;b5fa59e45965d1b2896023742df2e707&quot;
&#43;SRC_URI[sha256sum] = &quot;f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;parse_type&quot;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-parse&quot;
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

--------------418C94CEFFD86E97C9F400B1--
