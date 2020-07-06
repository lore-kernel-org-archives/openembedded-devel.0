Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.47])
 by mx.groups.io with SMTP id smtpd.web11.60631.1594049902752535871
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XHZq8964;
 spf=pass (domain: windriver.com, ip: 40.107.92.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+pPvINnzTiOqs/94WetIM93grMV42RfM3lKIpVC4nfl2BEjIuhLVCWfwDkEa3r0PS1TXvR5FJwCsKNCmQSZTRDRztsL3WwAwDsyL9r1uv7SLe4uZCltDTG3EM9CSevETcTh8eg0EBHi2OAxeCzLOBKxrckBASRBn1DZm9a+Jj9+2HvAhnh2eX14Cu6/qjI3UW8D9eUZddGWWHYvZjnd5nEasFHH8UPqGZ3luddC2ENMeFDL8VCTp/VOk3d3vulifbpHoGzA1sYcoEzhniiNpughDRP0xgw5xJH+LoVkYonoTZoSxK06TdRjCd/kb8psJSIsZc4Xv60SVM1F8/Y5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU4JECZfLq1lREtnPOlrLS0EXa2+8yaNj73Pq5l+bf4=;
 b=PYCmDB0aY+wWJPEaj5anXYsdpZ5JrKgeErQ6oQMjo7ZMb+HJNHyjg5k7C1eGsx1aQXG6Y/HNXDj6ewtIEFIQE1QoeHIsDhkxFwYqmpJQjgC7uo88MVvQaxrKlEugViR5sXYnxc6BxeuvB/gYwNP761NnZYPtAymUMbvbq9UKJ0t0ivC/2ZeS1b5dUkSg2WI89KONeleI0LhwoSZBDvGTnA1OdxTAqX1OBZk1ahAelHJ3I7b3Y6emTleqv6hwT4B74qRAdbIMip4NH/paqVnyaKtYYN5AFJpAe/7YAU6ZZvbMcFf0XubfyzxsAcDQyXYJ+r2oCvXWTf+kSm6F+RzpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU4JECZfLq1lREtnPOlrLS0EXa2+8yaNj73Pq5l+bf4=;
 b=XHZq8964i4PPF8S/4sW4XYRJQazbNHGRp4Agt2Y8jUfWfn81eoIj0PaXiNYTDemZQ3rTaBvEkxYOdIHc0WXYKl//XwYFzK7nF1+raf9iBMYERJPcvCNs7DRTTLBxQrImdjKmzCa9NWqHN4O4rTAvrmiqI8KDbKhypY/Ul88p5sM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:38:21 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:38:21 +0000
Subject: Re: [oe] [meta-python] [PATCHv2] python3-wcwidth: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593597190-5737-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a09bc59a-6328-694a-6a0e-0b1b35fd12a2@windriver.com>
Date: Mon, 6 Jul 2020 11:38:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593597190-5737-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:38:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d38e6a1-31bc-4a80-7ab0-08d821c29ce2
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB282765766A957320B0F657EA9F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ur5xNNPim3gUxkp4trwgfDd8NMnbDumYJ2FvW+3gkZsydxXM2TfQT0EwnnwfDUcXw+YvOnSDYLtsgi4wucoEfI2ae96HLvSZZP+KtDR6vTopxm0IKe7CFCU8wVCoeEJOZuZmRXBvmOUf30N1glUyvC49EXjlId683692xYYbKXQNW1NoZjEpM/JJLfAGhzVPKWZWKcFCO0auGohDRzvmaldHo9ILcWJAWVTOdQMHBk7P/M3f8UNQZE/p5OQJzt0Qlx52RYsiJhqelcj2kUekTIpln79gyjZAFYPj5vZr36Fr3rUrYIJ/c12oVrFeL+2gAX7mTtL5Hv8CuC+Vz44x5xyIDqd7WNaPXJoGKy5pHcFNmfaW900EsUUNtAPNqmlCzcJhHhm/whgc4YC12p+jHnE9NFMXiL+MHq6Q/Lb42Q/AfucGCyLeAlVVJftRe/yj5HCGa4fnTm2x8dDfItwCyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(366004)(396003)(376002)(136003)(8676002)(66476007)(66946007)(66556008)(966005)(44832011)(478600001)(956004)(2616005)(16526019)(26005)(5660300002)(2906002)(53546011)(31686004)(186003)(52116002)(316002)(8936002)(33964004)(166002)(83380400001)(31696002)(36756003)(86362001)(6486002)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	16fbg0nd4pklsQYcVqwXgb8pWxvgybmOZviCh0pNLYBPv6XQ2KAqvGQRN+wYg/h6nV2N7S6FnHzm1YafjFsZ2SRu2/UpErNBjALTmyFNj/MTHlFMc0j1chivK0j1oT7ouWnOgkfZE0KvwhYUL+sv8wv7nyRfoJ5ewN/JH2dLyLXwO5wmppJEotx1zAxVLCn8y9jK5KktJWfw+/ZMGuRrk7Sy6oO6v/ajw1wcfCeIYyBQO/2k1YoCFlV8MP11HyMmPYTqsAj90nPlBJQQhiUc/E5NQ4XRMxII9KRhTX/GE1a5aqCmkwgjda/wxTAiuqhSVOTVtV0TEzGAdCYKmiPlodVbYyz97DB30PfpJQ5B5L4IiPBZyfxlsrz297jOrZFoYdmQ69SyLkmeQhQXbBbwrVxUbPip4vMTW8ASkX2QTHc1o0BU4Pg8Ho07o5ua2NVzQVB4dslpA8pOazJYr08htweHs1MU5O4xw0FgS3aJYIg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d38e6a1-31bc-4a80-7ab0-08d821c29ce2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:38:21.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKDXnRUiMdRFJFELVUAxJDc7aqDdXe/7GZOOfxMDuFNHA0m/IkeQ+cfNkTBmTK9wgKzwxShZM/zVXB7oi4r0498rmfmBJkEOsP0c8ntUXr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------3B2952651F0B12B950C779A2"
Content-Language: en-US

--------------3B2952651F0B12B950C779A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 5:53 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-wcwidth/run-ptest              |  3 +++
>   .../python/python3-wcwidth_0.2.5.bb               | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> index 710b35913..bb4aae2e8 100644
> --- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
> @@ -7,6 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
>   SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
>   SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI += " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +      install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------3B2952651F0B12B950C779A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 5:53 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593597190-5737-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593597190-5737-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-wcwidth/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-wcwidth_0.2.5.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
index 710b35913..bb4aae2e8 100644
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
@@ -7,6 &#43;7,19 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb">&quot;file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb&quot;</a>
 SRC_URI[md5sum] = &quot;a07a75f99d316e14838ac760c831ea37&quot;
 SRC_URI[sha256sum] = &quot;c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;       ${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;      install -d ${D}${PTEST_PATH}/tests
&#43;        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B2952651F0B12B950C779A2--
