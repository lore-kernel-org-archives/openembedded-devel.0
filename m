Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.48])
 by mx.groups.io with SMTP id smtpd.web10.53106.1598879590575103413
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UA6SMypW;
 spf=pass (domain: windriver.com, ip: 40.107.243.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVxcdMvt8kwshh/En8AfwrKsKwyZV/h4EmZTnUxLWWYMKvF3gLSjFh6pRt1SkrbVq3gc6djloraQ4Ppr9m7ouWMeEQPMfWBP/GpuPNo84R/Ob23uzop1+/VvojqZZw+AQT60CUBFxYF9tj1JOGznS6OwJiOxH3NZOGGt0snpWun3ilsUvMtUeP7HkIQ1lJaDWiFyVDQd+LzAd+dcbdTYIZCD2aKKYfV9tnDH5OnGSrN/hgZ/zXKFJAlp9URUcg/3L1zzXc9yRcjHc2UkIC5vRL+vC5JnAnqv2opQlepdCNiA07DEWFWpY+QxPoUXSgcPpC5IqaZ7yaG25r5kj6wJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/NPblysW3UI0YbpTs1MqJzUheySpPJZBwn5IhmZGPY=;
 b=CUx1rBMD4/ICvz1ibPx/pCcaMYHQqOWTAGRl23idvDLwVa6qV/zUYMCfeuQvmKAxaUgovoZ70v0rLaUPkeulzd3YJ3P2SLcXM3VkMgIfcZEJAXbmG9/rXyfvmJvwiRhaL6eDdGypLG8E4lEsbqfzNo8aPvQuqpft+xUCH6s2wi+h0qm6w5o5fZBs7kTAvs7qYvmoAeYZXUQj5tIMPxuyCSFp9jBXv6BIf8L0TFcXnQ2K4p1eGqGDus21gj0NMkVResRTn+u22gwlK/IWEaYEkKUVCOw85tTVCF5nox1ue8IE7CGbrigYn5A4R79DiKRgShe2H4NCG3SaTWk0l9Lywg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/NPblysW3UI0YbpTs1MqJzUheySpPJZBwn5IhmZGPY=;
 b=UA6SMypWZIEtWZ5hLgcFGvYQCwPr2aYOL0mKlpV8JMTHFYnwAOtyVzMhPOCUKJHNAnEJdKt9zxDig7/z3SKRdNJQNr43moOM71R2WwnURI1kZLfYwVzdi74JF0ZAEWiLvyaSyz9zK9juc81Eiy9ybQ1viZ4IdSascZBeTt8cuVc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 13:13:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:13:09 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-flask-sqlalchemy: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2475b0fa-0a7f-c645-9d73-0a5559830fa3@windriver.com>
Date: Mon, 31 Aug 2020 09:13:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:13:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a73afd-3586-4df5-529a-08d84daf9b3b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42269E36020975F21CF602BF9F510@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8BfXuB7oEWPxkJoHOgJ8hNV/YFnjlqUArj2C7yLd3gi3jPSI2mENxsN7MWOrq1EMIIPU6SNAzZ1rk5C6EalCWn9TEHtmxrYNhhEqmC8koFBaeFXnp2NilWhwUrzkDqD/8/DCj+D2LFXQSMLQjNbN3b7yOCjr89XHhterazlIRmkst9IY0F8032j9mr0fXZUpb7kb0LrO+9cD4WF6fmzlJcEzskJSpOdq19Oe4+1aFn9mV2aI21QEm8TwL/Cfmeo9XTwUn5IoTq8unE+EGHW9bRzDZYwma5/Z/cMD9tkYAZ1F1ZPq/P8awyN0pB7vyIVijA/cQVHveRf52r7t5a/IJwAxIEWN6X8p8P8bPbHspg6oSQGA/eak3jPjRlwPV/BYZ+xPYSpcrgqGsjPhmteSO/u+NrbY3xzjcsNDXOCViJyBx3Pre67g2IUE5+hY9+lJagGjACyPlShckwhlsb+McQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(186003)(8936002)(2906002)(966005)(36756003)(478600001)(8676002)(16576012)(66556008)(52116002)(83380400001)(66476007)(5660300002)(26005)(956004)(2616005)(44832011)(316002)(166002)(66946007)(31686004)(6486002)(33964004)(86362001)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XUrYc8NiXFpQxueSCbBu0ZIxs5Y7rxtJJtIjD/qviQ/gh1Zwfdyj1uX+NFsGo+Pb7ZR4G1tECS/H2dLl2Wb4JCwVzTxInxCe4NkR2fFqc4iIPW3Z+tg8gqo1bautWxL23zAPjD51qukm1ffQbolLmFcx3key8v3WinmrEwiTaqWP4xmxcHtuZwpoJ6lzhy/njkH+g+ccB3JrFJ1omBHhhiGAEhMg/k2KTrSbWnaBsv3S+4ksYW0kkj0N5MC8USyYn1CO2OhmSr4lvpc57o5p6n9JawNaFUzkdgJ79KgkFfWP+lVStf/ISbR9Hza5QQ5uu4D9CIQCoiApYtNsQJwlwurwDCcR6NUdiLvN/b4EUiejHtGWUn7mFvY/pfYSLMux8mEHOKkjuMoPLC8SqogEzi328mv7F76IfiFfaDEcqa7zJnuS6LDUc61rZFzKD4fGc2fY/JViKBcm9nsXLmEyAxnGewOHu/2EFoSKqeUpxDO8a5dq0+ol4QP30LZPNMIUVczLw1jegR0JVIIYA5AGpnUp4u5F9tD4X+T50UDpmC522z/8lTSDOLZIrgld41pioJWRFLmfi0qrnDcxK49FT1GaseZeKPI5iL5eK9ogx6ROR4B1UCPgwiRdTo52wR6Vp8OzuLomFCc4JPeh9f2Mgg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a73afd-3586-4df5-529a-08d84daf9b3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:13:09.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3N2e0YPnkDrb0k2C9jUwOSBgNATEHoSZXHHfmUUKL1sWhlGA6nquUHIlXUL91gs8aPzpAa/11OOADiJ5hPj3e/y9eKTIu9WCKDzenmEkbt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------F5D6D356DFEFBAF661D88B81"
Content-Language: en-US

--------------F5D6D356DFEFBAF661D88B81
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:55 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-sqlalchemy.inc               | 10 ----------
>   .../python/python3-flask-sqlalchemy_2.4.1.bb         | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
> deleted file mode 100644
> index 86ba9dda5..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> -
> -SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
> -SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
> -
> -PYPI_PACKAGE = "Flask-SQLAlchemy"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
> index 07f45bcff..2c6110d0b 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
> @@ -1,2 +1,12 @@
> +DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> +
> +SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
> +SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
> +
> +PYPI_PACKAGE = "Flask-SQLAlchemy"
> +
>   inherit pypi setuptools3
> -require python-flask-sqlalchemy.inc
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
>
> 

--------------F5D6D356DFEFBAF661D88B81
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-sqlalchemy.inc               | 10 ----------
 .../python/python3-flask-sqlalchemy_2.4.1.bb         | 12 +++++++++++-
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
deleted file mode 100644
index 86ba9dda5..000000000
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = &quot;Adds SQLAlchemy support to your Flask application.&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
-
-SRC_URI[md5sum] = &quot;1f5781cf3e1a2b1aabda47a5b20d2073&quot;
-SRC_URI[sha256sum] = &quot;6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d&quot;
-
-PYPI_PACKAGE = &quot;Flask-SQLAlchemy&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
index 07f45bcff..2c6110d0b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
@@ -1,2 +1,12 @@
+DESCRIPTION = &quot;Adds SQLAlchemy support to your Flask application.&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
+
+SRC_URI[md5sum] = &quot;1f5781cf3e1a2b1aabda47a5b20d2073&quot;
+SRC_URI[sha256sum] = &quot;6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d&quot;
+
+PYPI_PACKAGE = &quot;Flask-SQLAlchemy&quot;
+
 inherit pypi setuptools3
-require python-flask-sqlalchemy.inc
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F5D6D356DFEFBAF661D88B81--
