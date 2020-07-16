Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.81])
 by mx.groups.io with SMTP id smtpd.web11.21594.1594922759788186276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 11:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ma/4TI24;
 spf=pass (domain: windriver.com, ip: 40.107.75.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg406wYDNHXmLAxcZv2hUHitTok1pWFbhKDncBgdXIEFOvLmp0Gw1Dt4LsN6GU/0Pm3cgVQVabk6fJ51vQ42ONb+stotOCg2x2zOuWI+AfpvTFZN2OjS6jSy4tqjl4DxxrdyQX6sB592BvZ2xQS1MEUKR4PTdD262wB1ar8UY7vE8wAqlQhlFCUrnX47k8eJU+9QYpv5mW0A43b5MqudZQ9gTNPP9Gt9WYaLhjWVfzHd35P4THtwJJDIZTlSwj9LwewhpDPLgddwgiJOIDSS7EHRDGC3z3Tvl3HWJ17/YQU6qFXwJirpkPghGlc08R2/I1si619Bf4lbA+CWnONsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miI2q6KlrwxDboQu5NCZjJ4IREuQ7qlsj3JHDqumZXE=;
 b=em0+3p/wa991vMsLDB2bpWlkq/owWeoPBRfl5bCOXu4b7c7PbPpi5+gTXCk2+1qQPBFnr0+duSCfsKk6diGdwvgLDR5KtnL3kpatOXfyUdin/PvVacr+zVaDeFQ2/DesgKThBtrS2X0oOvk9O3ARTn2VPuKmcZ8cCP6+tv1MxFz3apyn64BTSkfhCKGj+h0h5oCPPwCFdoQiJ32gKE8KpeePhHgp/V+HPKhr6fhulgwNLNoh2k9+jjQfAZsH/zfhg3DfT8LnGYEb7cSPBlGks5+W0BWEdSnCm5lS2S1vl96nuKgDB8PY5JFLha32Mm/ZmDp1WMmxrVm/38Ge7odgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miI2q6KlrwxDboQu5NCZjJ4IREuQ7qlsj3JHDqumZXE=;
 b=ma/4TI24yWXhP7HxTc+Lhqc+NqyUMCJuKUIxG4DBRUmDT2fR7zSA70czia2jQj8F3GxdnGuhysnEenmLpGnPhO/YtjkLeKEM+xtoM1wMuYbHTU9RoiQLcWYKYzMQXN/ebl/pwtjZW70GPjZcnzRgB6A6mhInYDfiXpBRErKQRtM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 18:05:58 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Thu, 16 Jul 2020
 18:05:58 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-soupsieve: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1594928600-4618-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594928600-4618-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <966927f2-0bf4-145b-dbb7-8a5684a73f4a@windriver.com>
Date: Thu, 16 Jul 2020 14:05:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1594928600-4618-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::26) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 18:05:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e52254-3c09-446b-0721-08d829b2e402
X-MS-TrafficTypeDiagnostic: CY4PR11MB0008:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB000866AFC6E551F7D0421EC19F7F0@CY4PR11MB0008.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s0h/4oD3/D4yvk1/x7Dr6Rnhsanto6YM9/jrJolfnymcdYqzTZQpnmrYis7Ts9RLEeOic7pbt7iXqVz9ZRjz3+ao5p7W06NGA/rUyg1gJwJTBgi/lbbeVtxi1C24uCSKlO5ym+Ac/PnYvzvhZg/kalLaUS4Euw3cDl+1DxyjcZ28gU2I2zmCWMbopjLNMIM85SIZuedg0/NaXAb6qtxx67jyWjnRuQMOKG56P5rYp2APKLAn7EXFwAJcc6BObL2B7TtREfsfeQXLv1tpUG/xMvcPUYvRpiz1py4qHJ2OIuLNUrJZ/OWLxGB0ttcBbzE7Oquc9zKTAz73/w2892PqwIj/+J/4iZkEJZMZbthDPC8miSCpUx8zlYWGAQYLLrr6AAw1fKh04Ovg2hplV3K3Xi3aq9Uvjjrr5gD84mBwQTMcETqa3rnFFpjoRDo/4kWIRmA3FNfsqyouDdZvhKBiQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(26005)(966005)(44832011)(186003)(16526019)(8936002)(86362001)(31696002)(33964004)(5660300002)(2906002)(53546011)(52116002)(316002)(66946007)(478600001)(83380400001)(166002)(8676002)(31686004)(6486002)(956004)(66556008)(16576012)(36756003)(2616005)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ykvw3V9NIEd833Nett+QdyILceBu3FOwtGRObAX9CzaRZzatx9g1+0dwEiGY4YcBCNSeae6iAUrHHKTtXrSNGRvMDe6AUHIkP3h03c9BYqai+bPv1nSfgdjqarb6+ecG4sFGy7EIGHbusI2NrDz79YxKxvaqNsvxXpwMhcy9gmVU4oMNG6jPJMyMdRgxk58o2CQF653ZaWv1eqB1HeEyAv/fSyQkZ0BSzUpaKV1DrmlfS0g5X8h8Jq/6vyXF8F1baBJ0hp6kmJ1RgHYWDpQmyy/HYjoE+JpjHlH5XzYpqTpuzPDEd7wFFhtsVzKVeoTW3fpaWauhCeIKQOYWgkSD1ZC3VC8/7hKT7H8X/LpYxFkUIp4B4zNIi0rP1//DLDcfapsjqSBuDQXRjaQpz47yKNdz4TgVpoD6GvKIHUPaFSZpB5ysmi4BcE6i2w6sRrjCVs1u02Y1CcLj2vZ/q6aH5dJ6Yh1rvjiAVa6e7kovcoKpJSSdz4nnOtYP8z/6aFms
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e52254-3c09-446b-0721-08d829b2e402
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 18:05:58.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esbPBR6pQVJzt0S3+3PJMnBWra7XFRprI91tFjodk3aXQzj0/O2qUk5mCUv8n/lPMldqjfzxHjUEsw6cWVFwy/KHX+rJIPq3TfZZ+zmxVJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
Content-Type: multipart/alternative;
 boundary="------------DEF35B409E5591268A4894D5"
Content-Language: en-US

--------------DEF35B409E5591268A4894D5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/16/20 3:43 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-soupsieve/run-ptest           |  3 +++
>   .../python/python3-soupsieve_2.0.1.bb            | 16 +++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
> new file mode 100644
> index 0000000000..b63c4de0d9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> index aa087c9200..ae242af562 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> @@ -7,6 +7,20 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>   SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
>   SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
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
> +        ${PYTHON_PN}-beautifulsoup4 \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------DEF35B409E5591268A4894D5
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
    <blockquote type="cite" cite="mid:1594928600-4618-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1594928600-4618-4-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-soupsieve/run-ptest           |  3 &#43;&#43;&#43;
 .../python/python3-soupsieve_2.0.1.bb            | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 18 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
index aa087c9200..ae242af562 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
@@ -7,6 &#43;7,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">&quot;file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5&quot;</a>
 SRC_URI[md5sum] = &quot;62a7481c7dbf6d8cc21e4e3a79c72034&quot;
 SRC_URI[sha256sum] = &quot;a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;        <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;        ${PYTHON_PN}-pytest \
&#43;        ${PYTHON_PN}-beautifulsoup4 \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;        install -d ${D}${PTEST_PATH}/tests
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

--------------DEF35B409E5591268A4894D5--
