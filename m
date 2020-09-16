Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.69])
 by mx.groups.io with SMTP id smtpd.web11.22466.1600263537946406441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=d0nset25;
 spf=pass (domain: windriver.com, ip: 40.107.68.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP/sS5HZsx8mpBnvjvZ6E6vtcJ7zAP339HT+qMifIxpTd7ZQWEV6XY8HpCzEpimF9gMhNNiOn/AT9I8BFSo3rAYIeTX0mCCUuhtRobixBYMerBDLmURhEIt3VDDsY4/tHZ2QU73hmk5Pob73poL51FfWySlIUd3sHf4Ff4df7upmCneU9ayI2BsLheSbMfb0TIbNTkIZvGCUgxlxlbuuZaew1sxi547vijwQev574zb2kaOLjpswHu5GFcKNm4HJH84EP+uaAwcltcTqBan1Wc4nxMaoXxBMyaSLHvfO4bOyw+UNGQAYQIQzMX1uv2dl1M1Qs5eIVpZMjjdLDge7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TVt9pQjIxGPU2XXM0sDjM7fP9FFN/zMPWW1was2C68=;
 b=B1g8soWtIIe2LuQnzoCMfH5MYMPaJMJ/qfRr2Tstzyjbbe2O09h89aG0PceerBREs0MEHnpI9yEZ+IeBe9FMMqBEgCGU+AsGAPbBgx2/VRz5xkmCVLmNqiG2bT0/u05sRxV51OiXYUgdIlPdMakueA61O/6prpM22LTX1kmwZMdc5j31CKWY30D84Y2Kw8R75ZxD8dwNMxsA+giES5Opm02g/MsUaXjxIMM74yYaKs3aThSMJRD/1ENgarETUExt7rPhxrL3kS/eJ4ksRHcioN+nRqMiSFUjhjXYl95MzStQav4MoPGQ7+voPeTeGlnCplAwwsOteae6S128xbIo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TVt9pQjIxGPU2XXM0sDjM7fP9FFN/zMPWW1was2C68=;
 b=d0nset25LnQ+RB0BPCwbB743i+Q19qnLEf2ip5J1kTdnS51voXdnZ48C38rWpcnbOjangaC6QY/N9gpsNtX3Pmq6iibZMDEG2W2azpelgzys5Y2g7XV41mCxmRXAj8KGY65kd+QIfwvoLVssdrLRSJnEEIhf1rLJE3gn84yMya4=
Authentication-Results: cn.fujitsu.com; dkim=none (message not signed)
 header.d=none;cn.fujitsu.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:38:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:38:55 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-test-generator: Enable ptest
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
References: <20200916045809.2153795-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <24944444-8a05-9f78-b901-9a6939b7d3d6@windriver.com>
Date: Wed, 16 Sep 2020 09:38:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916045809.2153795-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 13:38:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1190465b-1498-4a4e-0969-08d85a45db7c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB267972B73D441CF1285AFAF29F210@BYAPR11MB2679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Anrs2NNWL1YKK1EqGBpeiM88v4ioz4vXQ6ECORBjyzYAeoK4/sZW5XJTEDTZ5Fbv2BzNZvCXtp1UHDZSSXUhU+68WrTCJaZE/Fty7Q+M033RnLooSfXI/NEAkQ2+5QWn1xqfJOd0HLO62yHDrvuPk8BocrCyEo9iU0/sWVWsiAZc5VhosjXGHPp49OxSEhSCmtbmIMN+uQ3wcW/gBQo9aXOoAlEOMcpuyQJzVPMFamaO6nQ+WPrzvAx9ZtcX8iA4IfoQX28/ZhipSdFuQoCJTx9aFzHpWAdkv96GVDQ56YHkiKIGtIuppcEc3h6u1F1iJ2UUohCqF+YJz18mlS+pG82LfDLE5R+f1XTyCh5cXAD+2RgYJLW6PYmX3F5dUYK5lrplDnreMZP9GAA41ismlRsSM7AgilJSXJuLpIg5jdp5JaRzvFtAw5AmhW9vIXBc8AwtU9KEVMqjwinjt2cRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(66476007)(66946007)(52116002)(478600001)(6666004)(66556008)(966005)(33964004)(53546011)(316002)(44832011)(16576012)(2616005)(16526019)(26005)(186003)(5660300002)(956004)(36756003)(83380400001)(31686004)(2906002)(8936002)(8676002)(166002)(4326008)(31696002)(86362001)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GDtuYu0lQHH7vWPQkxeKgModdhb1nZ+sMZdtkjIrHlQvYBafOazKBxryUHvnVoLO2HNB03lhBixdEtGU3V+D6fIilF2KKAda5x6kGiZkjWM8nfhq4K1rFaYYY6RPPLl9p0f7ESen/fY4aSpiUOZDEeTxjev2ocCDN3pskwT5ZXRAezcyKAOEfIH0MaTFiBl/OwA1shU1GosJkMCUEIrQqffuc2uZ2wtkh8EspFBHlO58JiO3eh6dn+3m4PUC5bSZrEYlOgQh/Wb1gP1uItVdlalLThLBpD1kykV/PCv2eIfJh+2P1gCWNvPa74u/6A83PWHvVXujNphiEpKXIRjJ5GL9eEoogZcVevI4lf2mx8JOjJlkS6I2L1xdAQIWzipxtBQBgZe1fqIH2PWyLttvd5spEVo6LhHMLqX9BJ/b0aOJ2M/DAM3b3NjGkUb/iZ4KeZ7ibPrq7Txp8AzU2htIUQiLRUnbw+wu2RVoXH9CDc8Xsbg8kHVvSHs83v3aILiWrXFnE8cljdVyj2uejEQcXhz+vD3NTCzimxhnyG0BrVLYIa+hn43Hom3Ncyc3o+NYYD1F/OpekPz8ruMcIRqQLNZHxzo6OE7fRLJ/FZu6P0NQxBdCsEzzA2RMYWDXo2lXrXIsXJ0QQC7xfckFieCmQw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1190465b-1498-4a4e-0969-08d85a45db7c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:38:55.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO4r6fZswBUO/hFfZBRnm5a7Outa7pM+VoVdJOCu11mdLMi2yPc1H0Ec0XYfTlKeaQKXfUW5CyhYXuv3wcb8yHGe6oVCzm10A2uVHJvYbKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
Content-Type: multipart/alternative;
 boundary="------------60C79D3848E8BD1F258CCEA2"
Content-Language: en-US

--------------60C79D3848E8BD1F258CCEA2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/20 12:58 AM, Khem Raj wrote:
> From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-test-generator/run-ptest      |  3 +++
>   .../python/python3-test-generator_0.1.2.bb       | 16 +++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
> new file mode 100644
> index 0000000000..5cec711696
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> index 14943a4bd5..a83ee5efc2 100644
> --- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
> @@ -5,10 +5,24 @@ parsers that prevent any potentially malicious operation."
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
>   
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
>   SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
>   SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-mock \
> +"
> +
> +do_install_ptest() {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   DEPENDS += "python3-nose-native"
>   
>
> 

--------------60C79D3848E8BD1F258CCEA2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/16/20 12:58 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200916045809.2153795-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a>

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200916045809.2153795-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-test-generator/run-ptest      |  3 +++
 .../python/python3-test-generator_0.1.2.bb       | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
index 14943a4bd5..a83ee5efc2 100644
--- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
@@ -5,10 +5,24 @@ parsers that prevent any potentially malicious operation.&quot;
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00">&quot;file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00&quot;</a>
 
+SRC_URI += &quot; \
+	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+&quot;
+
 SRC_URI[md5sum] = &quot;6c69e73ba5b4b3ed62f7bcda071c64f1&quot;
 SRC_URI[sha256sum] = &quot;ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a&quot;
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += &quot; \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-mock \
+&quot;
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 DEPENDS += &quot;python3-nose-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------60C79D3848E8BD1F258CCEA2--
