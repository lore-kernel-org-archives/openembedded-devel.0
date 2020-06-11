Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web11.8755.1591916640700397977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LmFSOU8G;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD7ZQ4jHGjzk2ne9IiW6FALYK5UqM9+7IZKgfFCJXCRrEGxhFOiseGA+g7C+WKyC+cItsPc1w3NdIe8toded2qEu1U8OqtnD+4HwSNoSKMObvIFsd1MPA3K1iUjdDpduldvJLiusjOdwPemM/XVdqpPF4ayW9U/TUOVG7o0S1tXNAr3ESsVdH2EDbi01t5gr1K9GSGCGL5onCmIGe3FcUWpWAMmGWM7kzZHiU3sgpFcTK0Ezm5Ji/H3Q/t0xf5eOwB0aes24cXPkzXVQJ4bPRgoKXjc7dXFXUlfJqDhegGV9lB+l2Vu/QmY5uHli+gffKnh2bQ+8m3KvGLnthmoCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WPwsmswvjdbL88Ze29TaV9e4jnHXlwlcs9bZZdt0W4=;
 b=lgz06XNYSY4Wae26Fj/6Y3IAyPcg4NcwbuoEXQaj92/2BzwvUaMlKRDeHl3OBbl1gXQ4qSHyL7kTMswzlTNcaqic8jsC9G9sTT3TjLrvqFF0AVt/VIv3jutDwu4k4HojD6tzjMYPdAP1HClx/nHmVy8UXqBuCp8RZVk9T54pPVW7ajiHO/kU+BfLF9kq/m29adIQegiOdkz4RUsCP1CQfEl/8RjnJCdO6bsCGIskWrDBH6qa+tbLaf12dlIYj5mcSC+kr8Yh1iWRgwc8P1gZAsJ5wXRFORsFYXlzhOxguyUXh30gTGxdil+Dx+zU5Y59k8JY2XxsfnsQ+aljVZsM0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WPwsmswvjdbL88Ze29TaV9e4jnHXlwlcs9bZZdt0W4=;
 b=LmFSOU8GyaZbWIydbw0cL7tKbgUjv4UhMzPsmIRDDggswMBIWGApGehIBUmDMHTYjNvuevbeKBsxZZV7vDFcQ3J7Vn9BhYAbgjPOZ3+Ech9HTmS7KlI1h7sODRkCrZnTvsPT3pE3FJoWkXZPEa/+sI5aWNG5dDchpxy9Z+Rtryk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:03:59 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:03:59 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-pluggy: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ef0c1d61-21d6-10c3-b285-121b70712831@windriver.com>
Date: Thu, 11 Jun 2020 19:03:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::8) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0129.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:03:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71949f84-24a9-49a1-5a44-08d80e5bb9b1
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3955764EAB1906FFA007F4609F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yyL9MZcKWpMchWaLsxhzXHR6rDHnOHVCEohGPKHcxQrauMad4LIo3i9Gh6vn4mMYokQQHw7kow727wvcAF64FHLfTEXEyfbOz3GEh5TDypHVZl8f6OfTtruc1AoE5GcVGVKDrYSyRo4PP7MVMG6gtNCWGM4VZAA76PR4cWvTEezUuMEwsWLy76wZmEzOFBmppt6mKBRomHKx55nVOR8A81q14XmvDe3CBapjjkEIyqwSIS1C9gFUz/7FKX0AUJSwHzM43dJN1+V/zTUpsQuZCpBRuShCTQaDs9hvfIiFt0qSPE8jBNSWFc/YlXDR4RKUelXp+TriUXLLyx0u44tYZzgdo9B1HSRe9KtH97JBGKsPqVXrc/YPHJ7E0cQr3Caq171+YSyOEU/LBVWRGskwAsY0Q6TB7L2jaPm/euLlD7b9BuHpyE6EeTgdzTW/YzKZG3S3djZNblVV7jgtEKW7OA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(2616005)(36756003)(66556008)(66476007)(44832011)(956004)(316002)(83380400001)(31696002)(166002)(16526019)(5660300002)(26005)(52116002)(2906002)(16576012)(33964004)(186003)(53546011)(86362001)(966005)(8676002)(8936002)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UAZB3bfZMV8aSGtzOcA5JmdhT/x/XFiaFdRp/GIeuUUC77S9bxdq6nqCEqrHRAx0r3bxzGMZ3GcAonFVhLogGlsnmPhQfZBIDVKeJdNdKQqy7l5ybnIPnZykMFbmOKxHoN4ijy9aR4Mlnack5V0ZjPiBuVxu/wjeiWq5M/OTqqlSnJs20RREanXj6BAANIOug9q+OFrfSBsY9CXZnEYpoSai0cjet7sa8bwS8WTGDeIBLUbNk5PoXmGdWEnmWzRS5atxAOdK8cD4SEgMHM3bnCi7YDqaEN9pdEYR4jml/hFCH2yH1TOJ32CDdLI8z2zCPM3KKg6NkXlLz+3wKjbZl2eD/ETzAxY5DqeXmyavqNjXcM9tx+oxKnSDgEomLvTUzbcQeELk4zrYgjGdPqHC6yhQmd5Td6GdxoiUEq/UwdrmyGhehsRFAPeSpecaINJfLjMRPgjWUUGZ7NT5SK/P+VS+xEpi7WVFjBXzutwfNVHh+2eZyrqh9XIJkAP94SAj
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71949f84-24a9-49a1-5a44-08d80e5bb9b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:03:59.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMKM8v3fm+h9cL+uNozyYG1pnEwWjiQkg/13TPbKFUe4Fk5bzgzqtoNESCxYMcb6NdpaS7oF1x64nQJ99sVRFdclwtWfyJPeKWXkK3H2/Ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------DC1D35A064447E8629B481E9"
Content-Language: en-US

--------------DC1D35A064447E8629B481E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:09 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pluggy.inc | 27 -----------------
>   .../python/python3-pluggy_0.13.1.bb           | 29 +++++++++++++++++--
>   2 files changed, 27 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pluggy.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
> deleted file mode 100644
> index 1198d5f74..000000000
> --- a/meta-python/recipes-devtools/python/python-pluggy.inc
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Plugin and hook calling mechanisms for python"
> -HOMEPAGE = "https://github.com/pytest-dev/pluggy"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
> -
> -SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
> -SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
> -                   ${PYTHON_PN}-more-itertools \
> -"
> -
> -inherit pypi ptest
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
> -	install -d ${D}${PTEST_PATH}/testing
> -	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
> index 941e8e3d8..d3e0365ca 100644
> --- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
> @@ -1,2 +1,27 @@
> -inherit setuptools3
> -require python-pluggy.inc
> +SUMMARY = "Plugin and hook calling mechanisms for python"
> +HOMEPAGE = "https://github.com/pytest-dev/pluggy"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
> +
> +SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
> +SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
> +                   ${PYTHON_PN}-more-itertools \
> +"
> +
> +inherit pypi ptest setuptools3
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
> +	install -d ${D}${PTEST_PATH}/testing
> +	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
> +}
>
> 

--------------DC1D35A064447E8629B481E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:09 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200611090904.29772-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pluggy.inc | 27 -----------------
 .../python/python3-pluggy_0.13.1.bb           | 29 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 27 insertions(&#43;), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pluggy.inc

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
deleted file mode 100644
index 1198d5f74..000000000
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
&#43;&#43;&#43; /dev/null
@@ -1,27 &#43;0,0 @@
-SUMMARY = &quot;Plugin and hook calling mechanisms for python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pluggy">&quot;https://github.com/pytest-dev/pluggy&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2">&quot;file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2&quot;</a>
-
-SRC_URI[md5sum] = &quot;7f610e28b8b34487336b585a3dfb803d&quot;
-SRC_URI[sha256sum] = &quot;15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0&quot;
-
-DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-importlib-metadata \
-                   ${PYTHON_PN}-more-itertools \
-&quot;
-
-inherit pypi ptest
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
-	install -d ${D}${PTEST_PATH}/testing
-	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
-}
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
index 941e8e3d8..d3e0365ca 100644
--- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
@@ -1,2 &#43;1,27 @@
-inherit setuptools3
-require python-pluggy.inc
&#43;SUMMARY = &quot;Plugin and hook calling mechanisms for python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pytest-dev/pluggy">&quot;https://github.com/pytest-dev/pluggy&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2">&quot;file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;7f610e28b8b34487336b585a3dfb803d&quot;
&#43;SRC_URI[sha256sum] = &quot;15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0&quot;
&#43;
&#43;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-importlib-metadata \
&#43;                   ${PYTHON_PN}-more-itertools \
&#43;&quot;
&#43;
&#43;inherit pypi ptest setuptools3
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
&#43;	install -d ${D}${PTEST_PATH}/testing
&#43;	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DC1D35A064447E8629B481E9--
