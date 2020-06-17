Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.52])
 by mx.groups.io with SMTP id smtpd.web11.9353.1592405168758832529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 07:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q8dhXvv0;
 spf=pass (domain: windriver.com, ip: 40.107.220.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NomUxstNsh26duWKkfnQmEgHu3z4i0L4nTYzXSpxxpXo/pFuLGC4RdBaMctn48zrJEuBmrPFY7h5Dz/i2qejRrZqIDDjRAx22l1cOmCwgwSAitUoYlz+RO9o76sSCJ0Rx/WAgU+g636kwa0HlopH0VZj+u2NGPed/TJdMcEnvDmjxMxTF400dYSHVhdo8yK8uaBbR/zLRlwCSeTTiIXcUSHVn66JI3cqw5MA1ufXNtr+5PuRJPvHuR+dDjXC+6sql/JKzTh5L6WxStQgv7OLTBgU8JVsKX8XAHFgN4fK8VzqSRFHF2dFcQCb02XDC6ii9YH6QyVPlYRd5uNr8anKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtDJ99IBNL3XoYeAqcIlnadthwY6hX95i/UF6D30W0Q=;
 b=K0Pz9H8R+yVg3pk/mmbvrFvWDX8mDQ1Mfenc91Omn2ZO2EtTn2l13T2BTnnoWA00Ufi0rPteITyAa3AwreBsi0HF9P/wI1o+yOmhB+gkmGe7MxWSsXOhHQe3qZ35Fvtur5EN1sjDjwBklQEkWB7SJRk8xj5ZqAllF9+yZSPNwxTJH5yS+Frf3cKeOozkNSdND4ST+Wojit9T7nv2Zh1yl1/puusQG3GBv96B5sIT3GHJ5QdUgPSO0j9/nxj/ynIsENyDA6+IiRD1wt7ddmXdSKp/DlpFnxYwox5lVKnRwPLOb9EYczHBC0VYnxz/fOF5WrHv1B00B0GkD3QCqzEYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtDJ99IBNL3XoYeAqcIlnadthwY6hX95i/UF6D30W0Q=;
 b=Q8dhXvv0Xbz8x3LDJ7MwtT0aIqnQ2klcp4SH0ApuqGuP+sB/1WbcwaGaWv6lyizhS0DKela13c7z46YiO0EU6Pn3lXVzz8soQNqksAI6W6W1YluqTognfmBMCOWAGZMqdNorlWkIZiLKFtxe5OBYDiAmNg4wlAo0d5Vfyq7MEws=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4162.namprd11.prod.outlook.com (2603:10b6:405:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 14:46:07 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 14:46:07 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-cachetools: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1592242115-113629-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d4d02db7-761d-e62d-3835-79033c5677f5@windriver.com>
Date: Wed, 17 Jun 2020 10:46:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592242115-113629-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 14:46:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b2be25-a449-448e-7665-08d812cd2aec
X-MS-TrafficTypeDiagnostic: BN6PR11MB4162:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB416211BBA622614B74384F409F9A0@BN6PR11MB4162.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2ZBneaVxwjgyZXrYFBw1Ki+B4YYAXnSq7L/S2sUKagt1UwJKJkyKMMH70+nxRnCs44d4Kgsx00ndNeOq+Ff9mW4mD3DZ4EKQ89t/C4Mga/tEjsQSFjlAUaW1agGPlQYR880NIIs29isJ+K7YHMKIn1C+8d74NFVh+mBWobytUsSrWZz2x0zRfp++kP989IXrdXCxPKoBJf8cOEiLQOnFwPCz5pKtQ2gBEHsI/hCnQ8QylSaGHqeBCRZRhBj+X0SZVIlVnmT7AwJdTIzCtTczjYEuoOex+ACjL3nOMFx6pbdFOriNh/dkiv5uMT446dZJdSuujBgt5ceUCp3KIzm+VOPrLK4QJQC1Mqs9v0DFirkSrR/BzHEHaBIibm/vfyPqCTo9d4yejNDkzUnETRh8s29PP7xBF0U3ma8KLOVNgzB7DqRO4QTNMNtYCOswAK3KzUFrYugqI+rNJ0s4VaSP3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(39850400004)(396003)(346002)(376002)(53546011)(52116002)(31686004)(6486002)(33964004)(83380400001)(44832011)(66476007)(66946007)(966005)(26005)(16526019)(66556008)(186003)(5660300002)(16576012)(86362001)(166002)(8676002)(31696002)(36756003)(316002)(478600001)(2616005)(8936002)(2906002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SOQY2izsVudRDjDVscKBVA30Si1aJGIYEm0Mw71AVpXi7FAtg/vbA3euGqvJ3UfsFOK1CfvtUHrxC2ZOU0JBHGSjTEcbQIkuTe0c5Ygs4pv2rwMEJy7oyBWIO4smqq41Xk5SbGQ9H0LUdVLGLOOhAymL3ceB+CSMS5xmv8ijnUe/UmEbU6XyAATQhz649+Gf2PYJMCcuBovvsk4m6aAM5+Qz5QLbfZHrUyrjUbgiZqeT/NIXs2v19GE5p7DO9alkZcZCm44NDoIeOxw3gYlj8zwYuGSLgKrqc+i1xwuccxXYVxiElKlGEEp8KXJD+a9GlgpAtbE1kio7AHRI0Rnc0XLEJO7cbpHokEpMgwSbdU6ttLs/jQ9mXwBmHbH8cTZcCt/EYvPt9lsNlJTOWpzIAX+CG076zSXTdzyKExhyUTLYd0VQ8JtRG2Wdl6c1Ici5oM7F+0leLpsTj4vxVG1Vr70sz6G/5r7fTwpTkjoTA7nXz4xLmAnnCz3FmkLZVU+a
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b2be25-a449-448e-7665-08d812cd2aec
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 14:46:07.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2x2rIfthYfQlEKuUhy5ikBQAchzW3KsD+afBzgcuYcVvY6wgEt6CGQB43J+JDTy18S4/kH4qg+77ay5hdY8zKW9Ebe0P2LTzVyHkSsSH9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4162
Content-Type: multipart/alternative;
 boundary="------------2B86EB937A3DE058CCEA8CF9"
Content-Language: en-US

--------------2B86EB937A3DE058CCEA8CF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/15/20 1:28 PM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-cachetools/run-ptest           |  3 +++
>   .../python/python3-cachetools_4.1.0.bb            | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cachetools/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
> index 7411a749d..07d86cfc5 100644
> --- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
> @@ -8,7 +8,20 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2d1e1bf0ccb26126a230c51f997ce362"
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
>   SRC_URI[md5sum] = "4468da43443115a00c02c126cf601ae0"
>   SRC_URI[sha256sum] = "1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab"
>
> 

--------------2B86EB937A3DE058CCEA8CF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/15/20 1:28 PM, zhengruoqin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592242115-113629-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592242115-113629-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-cachetools/run-ptest           |  3 &#43;&#43;&#43;
 .../python/python3-cachetools_4.1.0.bb            | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cachetools/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
index 7411a749d..07d86cfc5 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
@@ -8,7 &#43;8,20 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=2d1e1bf0ccb26126a230c51f997ce362">&quot;file://LICENSE;md5=2d1e1bf0ccb26126a230c51f997ce362&quot;</a>
 
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
 
 SRC_URI[md5sum] = &quot;4468da43443115a00c02c126cf601ae0&quot;
 SRC_URI[sha256sum] = &quot;1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2B86EB937A3DE058CCEA8CF9--
