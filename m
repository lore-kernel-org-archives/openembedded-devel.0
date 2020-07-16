Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.81])
 by mx.groups.io with SMTP id smtpd.web10.21376.1594922745568609900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PgP5lrMI;
 spf=pass (domain: windriver.com, ip: 40.107.75.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtLveORuMVvXIFEi8fxrs5qpOIO465wB22uXrTSJVPJ6cCvhkNXoV/75FlutI7AgR2T5K039O8boSOy8Fed8OC3rJfzcRQjvhKMQ7nF0yw/Df9JbS8PEwA5QH5LV59v7JVZqKOQy0FOeVSCuuCc2qSeTrx+jWKR+C5kt4dtmgSRshxL9wxIx8akZQNlYJ0mtQbRIYhgq7xVRyfGoRIH+8Rytl9AWRgI2VoqSvChBIcfkkXd2rj2ydWB7ryGAU5AlF72jIL3fonRvNUVWOMjEVKdcVMKNvth85zyBXpo+v1ZNhNTriXojbhXV4Fo6FxNxf5+7SxOumEDmmXaL6Hv5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O6ZvctIsihwBTH2sTrANAgStwCCF4mHkNylw4p07Uc=;
 b=AHNJlUvQ9SFulPT75+uER0UozyNY/etsZr+urctdyL6pSFFruK0SKNNkpEysbzO8V9/UkeVj7+RCWGvr2+l8b6UlY1336Gt4S4AHCvTiPn0uRv6rWS77cW5hyAdUlaqKR1xZZVeBzJeQ5prWKqmPf6dv6ErYyWDunyGP5DT1eDvFf1f6Qn0qZKWQxsT7yvYZ5bTL4HFkq7PbLkCfUvGrWLk4JjtuEehhMl98pI1VbCBjE8IWrMgDn6HflYQ7zWS5asY8F165a+ak58QCtQVHTiNukjZ3YP79NdmmmotHZgo2+bRpmM5NyOM+1UnUfV0NKntKhUTTs1wg2dJKAsdaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O6ZvctIsihwBTH2sTrANAgStwCCF4mHkNylw4p07Uc=;
 b=PgP5lrMIHomwCCd5jGJPIyaWJuS2iUofYOUhWWUw95hQu0zbNmt1WLimdkmGKQ3SaHbFfyvFwJXhRrYLzWoOik26bmpzWcvHgB399h04hHuun0EoxLHa0TVgRQtqBikmxDKQr4kkyBTIYuP9gqv6VQqzNAgAM7JgonoHodz/Pew=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:05:44 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:05:44 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-smpplib: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928600-4618-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <50103ded-37a1-f027-22b6-f11f013c4293@windriver.com>
Date: Thu, 16 Jul 2020 14:05:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594928600-4618-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 18:05:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2606f827-92d1-4130-7558-08d829b2dba4
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB00086061B6F9192890D515459F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nMSdyLDWE1/4b/TMMfuoZlqKIi4F5edbwPHvN+FtsPGm6G9TEs7OcxAFww2M0MCctc9Gp+914Ddkm5zeKwZKzIuxPjgcQChbKIX0N7pslnDTr+zskJvNh7pfy72LH2LCtxlEDuqmNy9jvgxmvU+GYQU1tQhsuGanpIydcaee17B/2JbOIzNUDh1BnldcnAhlC1Cy2zfjKUNv68MfKfXr5RKFUK7AHHV0aLC9S3gxbWrkC2f2Gn2IhIPS+oZ07np4f3vsU3/7F0fNW+4qzqGqVAcWCtRyXAiwyqpO8G1/xW/XTZTuUh5O2yAIZaToxACphT9sYhf3IdThTeZTc9CKSUONdwMImwWmpiLwzYZO5ED9GVBv+VEzK7Xhkri+MRTAe/hRK9mULGj4rWmHyOzh55sZDrpyPP2b7CAp9OLxrMq2KtGrfUz3yzLrf4Z3ySxwiNl4Ll1CF6sIWbOirEk67Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pyEQq2BLfNNP9LvznYgwY7LjwXxNeLeiN5c8ajBpjfMukK4/OCo2efOvvyfUEwrF9BtUnfJU+mr93mf6ODa2mmRIztlUhbOJTmDqYEaCzTscHKaZmCDdcfZooKI0rLZwSpu+sKITe1/lS6NjJUsgA5pShN1n6ivqBzLxVvWEwfLWiqQuJldsvIuFBekPbVohUNsDzce8hTI6DeLX4nszbFxhxBnXwT94x4FztxhbhL+I8KoZROTHauBmKe5fxIho3DD6pJxYA5AFD1NjemuMb6QhG2vLpSCgY7y2fHgOHl1EXV5iT50c9sMtXV8GXl5WqCxiselwpxaykNrrQOKp9WQBjV6s9Xt48Iw6B6PKho+Iex7gYbIcSJBJjMZbhC+lBwAT4sXebJSuMO0114RxfHuQGDh9Mb4dHxVlgfI1xGL4g5xefmXvQiH13BCHDR3sD9pzDYmNhkIWNdKMuUfdy+ukRA0uqVRbpJdn71AKHrnSpXUWROEY97s5zPalizrG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2606f827-92d1-4130-7558-08d829b2dba4
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:05:44.1319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqJSr98x6tv27uvMkG15aLy/vYlsNjQbkuJu9gGeWRadamFEyqBPvrba/0zaOTbJxDrgR0Ae7KO07Ek2GxptyPQZ0mR3biJf4GHS7Fh4Uwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------C6279AEC997168753116DFFC"
Content-Language: en-US

--------------C6279AEC997168753116DFFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 3:43 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-smpplib/run-ptest            |  3 +++
>   .../python/python3-smpplib_2.1.0.bb             | 17 ++++++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-smpplib/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> index 948af58aab..15b326bad4 100644
> --- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> @@ -6,4 +6,19 @@ LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
>   PYPI_PACKAGE = "smpplib"
>   SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +        ${PYTHON_PN}-pytest \
> +        ${PYTHON_PN}-unittest \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +	sed -i 's/mock/unittest.mock/g' ${D}${PTEST_PATH}/tests/*
> +}
>
> 

--------------C6279AEC997168753116DFFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/16/20 3:43 PM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1594928600-4618-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594928600-4618-3-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-smpplib/run-ptest            |  3 &#43;&#43;&#43;
 .../python/python3-smpplib_2.1.0.bb             | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 19 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
index 948af58aab..15b326bad4 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
@@ -6,4 &#43;6,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe">&quot;file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe&quot;</a>
 PYPI_PACKAGE = &quot;smpplib&quot;
 SRC_URI[sha256sum] = &quot;df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;        ${PYTHON_PN}-pytest \
&#43;        ${PYTHON_PN}-unittest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;        install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;	sed -i 's/mock/unittest.mock/g' ${D}${PTEST_PATH}/tests/*
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C6279AEC997168753116DFFC--
