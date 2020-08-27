Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web10.25665.1598552389969867977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f7SRcnxo;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0f0jBFkhYEPN7/Z9CVX1WFqYkgAVIUqSQzgRrGiMTh1lKJOayODv+vItkyQk3EJ5l+sGO4zT6wPA7C4nTmkBhS524ZzJUh/AN6nNeMDfRO6f5uNpHBNuZpCfbj/zaPnEy0hxp1g4Bf8preuNQSA6pbX94osYsjOkomEOa6CCuKcEfpnLr0K6+dIgf9NIAaoVtDcYhmQy/DjL2qyol1kDlbxaTwstMADiET7hrIV035N8BHzojUCS/Ihl9c5Ah+9cYA1c5Tq3QcWDMEFRcoj771AXnG805uLqSxGTIPgch+14sVioAeAEVvIo1apSTqKwBUKCWm+qwT5tRK/Ds6Ysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYiJBWCSub7YOBbRODWE/7RKP2K04+Idi92PgpbD9dM=;
 b=ep3i/8tVB9fc6maZWIKd8hIiY/8QCS5qQF/IlKFd3WrnPN64Ei68h3XJy1D3sAatmLx9p1bbYXv3u/UT8bFrkEB+z3P/axCzOPu965vIKdTpGKWTaQNs1KbfGZgUGaiKWWvrEnxw8z5zhMQ0pDmQ52Yx/utOLeAfxO6GLZ7yTvh86kek/g+gRUZxqaPktmmUXcoEU6G2Jxa/OxgoNtz1+/y29fRidBjv02sj9ZNUxTwHv7CIRDftz9Kd6iHaMZQol1l6Ego65CtsPJBBlvdG9x0XlI1YxAd/xP07LeWPimBWDfvYiN/WbtzumCcDd/IEvyCz0qu7U0PuiFpO1i/rRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYiJBWCSub7YOBbRODWE/7RKP2K04+Idi92PgpbD9dM=;
 b=f7SRcnxoPA4rr3wgMGG2VPY7W60t00ws6U6XtF9DhHj1qbWuYhyMeS38z+8SRcy4vOlhOCh4trLbyYXTDHUYgcA6ZQ715Mgn6iTldHXpu676xHY9No0uSp15H9UXfYlgv5iMCTOmsiO69ltmF5SqwkQcES0Ke1z+B+PpFxmDfcE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:19:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:19:49 +0000
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-flask-wtf: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
 <20200826154020.29208-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2ab9aa56-b21d-5a7c-4002-8afabe8a60ce@windriver.com>
Date: Thu, 27 Aug 2020 14:19:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:19:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef67cde-220e-4d11-6a02-08d84ab5c892
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726ED8F57C3E02463E409A99F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xohh1HoPIYBMh4QwE60ovybDjACS6M7/nAoUekKaHE5wBFlxRG2I7kqTD/2cyUxNdx40oDr5VXDVRH7hIJH3MMFoCbut42wb2PjVn+L0Rp+qjH2G0oigrS4lnEga2aYaNhPcYGJNcT0hbL4SqR0d/9zvdazSdE66frU7YqE8MrjuOG1ySMmX6kM528QAk6Dfwj51tNo5xitz68XKYgZhht8zyjGMeGDF8ILQAOfHOuJuJMOSZQIBLhGbCU6eUVFQ/aRU38vNzE4PYE5yKjBCb53qIzxmyTORVuWo/h41c8+wr7ESecrugCf4gWe2hOyXX8JI/S2OxNMv9keMEkmEdeoNceAr4CQJAhDxZ+5zEmtVL6qu7tjpI0FTpGroYltMd++OYz6+okG4oaurYfMGigG6/4RN8VQrDa9Y6y6mdVvAnCDREc59VawKNkyTloORaQrgBHXTEFvAJnkDYFK44g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o2C5jmGL34xAaeYWX0ruRY7RUKLe3LnBAW0P37p4R9hZb2hBn8pZhgGmt0kZMJdxGefEnGSwUDKH6p936e7eekXn8cREfZASsEsucriTQGix06Kx7iaKj06LqSr8i8VQ5P2DZQ22zurQ2A+gCiEUIKbn2l/nHzzPl8GcqfZQ9Ya00TogqBrGpuVrqism2vrynRAWWSIvq9BJ9+xwKSmh1ULedUHbnbIhZVVScJwvllnGTWfqNiTN6HxGcB3R/IRfxyNXNTfZwEbwbQjNAIPEpdGI9OnCBs3PQnCpNNDWP+f9wHdBjDTNJoIYlBEKHJE16diotxMrm2GSWDkltCLynpk7++r0K8iNI51YZqeLCHihEWNhCMAhLHjnOCBT4+YSkuiVL9TEh4GQnr0C9AmsTQGbToxjoinqJoe3MbTBTSXqhf+Uk/6G+j4RgQrwyosoBEsAmBcjg+5w5nY1Pyx9DNrZs40XQO1Po2A5ohqX59bkASHE77q8RSJONBdhYa+DDiGRLetnbOt3N6AOVUMhM6g2+p5xLDXbYazg49wWZuwyFRcHK8mD52P7BCAwcQ2LwvvrisSwuDUiU+5ICNAUyuT0K0TsGw4OTbGNG45aW4HE0vq3SzIe3S/NGBz9QDvr/t/OyQLC1OOw64LczmviCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef67cde-220e-4d11-6a02-08d84ab5c892
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:19:48.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkD/o+P9ZpCTHEPiDr8f4Wo8Y6ExpEok6+MK6GdI7kRPK5MmuScntHMaxedHI77IutBBmiNOTmoHDfN3cLfInr3p3+t9wf4Gz5TeHXr0UiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------1DDB7BC919B11811AD3ACC5D"
Content-Language: en-US

--------------1DDB7BC919B11811AD3ACC5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-wtf.inc                 | 15 ---------------
>   .../python/python3-flask-wtf_0.14.2.bb          | 17 ++++++++++++++++-
>   2 files changed, 16 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
> deleted file mode 100644
> index 863671153..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-wtf.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION = "Simple integration of Flask and WTForms."
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
> -
> -SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
> -SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
> -
> -PYPI_PACKAGE = "Flask-WTF"
> -
> -RDEPENDS_${PN} = "\
> -    ${PYTHON_PN}-flask \
> -    ${PYTHON_PN}-itsdangerous \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-wtforms \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
> index 52362a865..33387045e 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
> @@ -1,2 +1,17 @@
> +DESCRIPTION = "Simple integration of Flask and WTForms."
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
> +
> +SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
> +SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
> +
> +PYPI_PACKAGE = "Flask-WTF"
> +
>   inherit pypi setuptools3
> -require python-flask-wtf.inc
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-flask \
> +    ${PYTHON_PN}-itsdangerous \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-wtforms \
> +"
>
> 

--------------1DDB7BC919B11811AD3ACC5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/20 11:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200826154020.29208-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200826154020.29208-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-wtf.inc                 | 15 ---------------
 .../python/python3-flask-wtf_0.14.2.bb          | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
deleted file mode 100644
index 863671153..000000000
--- a/meta-python/recipes-devtools/python/python-flask-wtf.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = &quot;Simple integration of Flask and WTForms.&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80">&quot;file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80&quot;</a>
-
-SRC_URI[md5sum] = &quot;586f50f233926cade42e3d744aca3e8f&quot;
-SRC_URI[sha256sum] = &quot;5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36&quot;
-
-PYPI_PACKAGE = &quot;Flask-WTF&quot;
-
-RDEPENDS_${PN} = &quot;\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-itsdangerous \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-wtforms \
-&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
index 52362a865..33387045e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
@@ -1,2 +1,17 @@
+DESCRIPTION = &quot;Simple integration of Flask and WTForms.&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80">&quot;file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80&quot;</a>
+
+SRC_URI[md5sum] = &quot;586f50f233926cade42e3d744aca3e8f&quot;
+SRC_URI[sha256sum] = &quot;5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36&quot;
+
+PYPI_PACKAGE = &quot;Flask-WTF&quot;
+
 inherit pypi setuptools3
-require python-flask-wtf.inc
+
+RDEPENDS_${PN} = &quot;\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-wtforms \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1DDB7BC919B11811AD3ACC5D--
