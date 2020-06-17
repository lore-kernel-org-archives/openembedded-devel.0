Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.89])
 by mx.groups.io with SMTP id smtpd.web10.7180.1592399412969006353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L94MCUEZ;
 spf=pass (domain: windriver.com, ip: 40.107.77.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXbVx6yYug1raCenFKp70THSaW4PKWl/qPJdm5jTB17GhmADCiDKjTfFgnJERCmWK/oboIuP06k4SRNTJElAxUh8rgt4pPYLOrDuDD+ygod9nqEqn/kv4WVfJI5f9C7U+1CqMGg42lzaw9vaa/KvGVMQcl4KCfG9k3ZZPkQSbdFj1EMBNAbchgeSOMnB+arfMGT/dNoNbAWZOq1FPEBZvkccqfDyIDfbcDz6xs8mfbHkQioaKadlFc9VG99OiA4yIPkL4dgu69WChNkVgcqjaEyxtnZQy79yT7Tg6t0PnGpKUDcoXPjV8FbUBM7Ba220e4u1xV+fcAmiclpCNxuexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a4W/HBXFTQhsfsSOhbeHcKwcbhBsk+t3nIdvVJvWqY=;
 b=LxoyvlfAR2ud3RRAQwxnVHWz+/joaVfmkM0jaEsvVPhIJ8UKxB15xGztnhE+1oPsDrYuWY9/3ckMx26Z4hSvr6gdzRSLiQSEa6YY6M8+aBWzXK0ggx/EV9NuJzHc856Fjjs/p3YkYdlKk1AcjPPE0T+lBNAg/PL1w/dip3qkjpcRY5GETc4qK5+lSYNAe/L6ruajS1z4gy/xuJzN51imFuVInMKtoLZ7wrug5zFWwVhbd7vfZPX/oaLuITbPB6+RvpcNtAL+2LnUrkBmiBg8lZZnQibh4ZYhHZ8NY1QoQpqdsVvm9LL05X62sqs9nW6yVYQwkcSSOBy+SZY3UJ6PHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/a4W/HBXFTQhsfsSOhbeHcKwcbhBsk+t3nIdvVJvWqY=;
 b=L94MCUEZ3Lkk94fdJm4XEYaG//mfX/oXolkj7/McNHYIYPyWrU+1UgaDgbCWmrAqKPc6LBAMmSD0YC338biExEY8Iys/g2esS/gBPaOh87IjsXZM+u3v45D7VOdm98TNPDDiD94Q3OLx5ZOKsybq8xju6zqnNzcD7+Nrf3wAWUk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Wed, 17 Jun
 2020 13:10:11 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 13:10:11 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-geojson: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592231816-3893-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <523ace8b-3f0d-ad9d-7f24-7e415c22928b@windriver.com>
Date: Wed, 17 Jun 2020 09:10:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592231816-3893-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 13:10:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 991123e8-c026-4cc5-89e9-08d812bfc446
X-MS-TrafficTypeDiagnostic: BN8PR11MB3588:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3588C53F90BAA7BC168C55049F9A0@BN8PR11MB3588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u1GOajo2h1O5A632x3AbCEOC+WjXID6Y8vz/7MSApO7nSa0DBZwOKpvRPUA1Sejzq/IWKs7fHG//H/0b3yC84INy/Ds2XA8kb2htajLz/y55prvF6E/D2n41SoyKuSozFTgPN4Eu4H9aaXZMM23P3Xa1JWCVNWwxrqUl9xNxTXZlP/ieDQnTA8jVCJgZS72aug4ThRWXnyONpWmNHeOXOaWY9hekcsboRdGxOuGZCW2nKzDEAYibFc7FR3VGEd3Ux+UY9TCniJcOkSEZoBpjpa1U+EkgjCb+Er9UCaD7hoXfGorOt+/KRLc11SYwFEdKTrlywxugscgr/F8HW4cR7GX2Tn8JYWnpefy7bmv5S3PEPmdnv61/lti6AYKy4dPXRmpBPEe8x9GeQ9EojiJuwqY5pGHAc1Xwnm2NYdj9z+0u8f2l/ijChwnVwBDgcxFF1tGHK6ErkbT9Fg2ROyCGmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(39840400004)(136003)(66556008)(26005)(53546011)(6486002)(166002)(31686004)(8676002)(2906002)(966005)(66946007)(316002)(8936002)(16576012)(66476007)(44832011)(186003)(86362001)(33964004)(52116002)(478600001)(16526019)(36756003)(5660300002)(83380400001)(31696002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/sZOCFx7UOS2re7dB5V6aDF5kpBzA60sxSc4q6z7hpmW04NJ4zqIZowcQAEyxTWoCBaO74rb/qwpfiQBLO6rtZeorvHyzptGEbY3gud4cGp7Z5/BlVaI4rXlQDGqY62/Vu5GI7n2Ac2UtufiJOkdazuUPbb+BqX76w+v3OONY9CGXBCvB0XVarRi/JykKIKFCnOqU8DOSNAu3RC/wj8WlmYYv3es237t8Jw7Q0tCfWgX7Qoq/5dn9ShnMrJx5mzGI6kcVV+9g2fNj6hFp9w5s3AkjKu9uVe+8YOaYcoQM6EHer9d2VjapBnYV16EEiWxLo+I2K2z7tIfYwBafLrZecI8fsJYVvvIagQsCALuV7qTQkr5/SUw44S1/8r9DyG/5P6SBQnwLlzt8kxQdH6HyNwmcVnxePl5gw3upxQ0rtza7N8WZdr3llJjVgNtq2fTlRic99e3JiERuzVM1tqTbAC24rkOtsThFDh8O5tH0go=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991123e8-c026-4cc5-89e9-08d812bfc446
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 13:10:11.6386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA4fyybF8DjlNfaY6MrKBepsuWTfk3gYOVdvG9UMvM6l/lOJR2P+iIzIzVaSe19LPfMOp5gI23+IcG0bh94Gd8CIFaX1q50iufojEY+AjVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
Content-Type: multipart/alternative;
 boundary="------------71E098EDCD9CAFDC7BC282CE"
Content-Language: en-US

--------------71E098EDCD9CAFDC7BC282CE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 10:36 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-geojson/run-ptest              |  3 +++
>   .../python/python3-geojson_2.5.0.bb               | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-geojson/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-geojson/run-ptest b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> index 7c3c23b22..c3fd37c8b 100644
> --- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> @@ -6,7 +6,20 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745"
>   SRC_URI[md5sum] = "14753ed28678828b1de73f68b04e2324"
>   SRC_URI[sha256sum] = "6e4bb7ace4226a45d9c8c8b1348b3fc43540658359f93c3f7e03efa9f15f658a"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
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
>   RDEPENDS_${PN} += "python3-simplejson python3-math"
>   
>
> 

--------------71E098EDCD9CAFDC7BC282CE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 10:36 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592231816-3893-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592231816-3893-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-geojson/run-ptest              |  3 &#43;&#43;&#43;
 .../python/python3-geojson_2.5.0.bb               | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-geojson/run-ptest b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-geojson/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
index 7c3c23b22..c3fd37c8b 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
@@ -6,7 &#43;6,20 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745">&quot;file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745&quot;</a>
 SRC_URI[md5sum] = &quot;14753ed28678828b1de73f68b04e2324&quot;
 SRC_URI[sha256sum] = &quot;6e4bb7ace4226a45d9c8c8b1348b3fc43540658359f93c3f7e03efa9f15f658a&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
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
 
 RDEPENDS_${PN} &#43;= &quot;python3-simplejson python3-math&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------71E098EDCD9CAFDC7BC282CE--
