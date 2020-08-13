Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.55])
 by mx.groups.io with SMTP id smtpd.web11.13247.1597334108302355976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G0iDCoYQ;
 spf=pass (domain: windriver.com, ip: 40.107.93.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qtk0fCrryhES6iHZWIz8AnBQbsQo3nYUNHds8l4QPd53bCTvzwMbgQ4Nwt4qNQOvECCcQVKpu3VchWd7skcyiixKkiSo99SGuE+pueOcoZDAcYfM/QtvFbmyCVHGbZjfYPq5H9hGmyQwevQhxDxpFZThIdrP80RR15kqJWi8wMTBRS+oH5V4dlWpwtdhvVZXl9z8fq3IAQ3sc1OhSbhwkMBdeDvfK9BiIOr3Rma2H+jGMDGC6ITQwqOPSbMPuibV7QyBv1YgEqwPk9dfzmAkYD7cSG0Xlh/5m4r+1UgFMy03n1OyBtCnSNHgpnIwGnfOE2B/BuaI8eRp+vHiGC+HWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtwN/M8S6bnleJsVSxmBWWXDJ6w+nplgJF2CdzZhmEU=;
 b=fr+VXaWTVUbM74GkOrw9ZgqhmjkGhbnd3p9qI1Wo+3LuCVjnc4uZLyTBWijuRT9dg9cTJIeSgTWp2+uJE6B0T52tFh//oaaqt/HnXbZGUQ2Zaa7cmOn8O0QPiQshYcZNCA++FJPmtdWszTEH6Eckt4uZ9CbYkO3SWceDfOj/ExMlgXl9VaCyVxy/cwJ2bnch56l1UCFvwKLdBl8rUttC5K9OEPvxAmAzX7ZjHg86t0uu9yKzrce9ku+JhJy0gZEJTtf6h4+i0l/eq7dSfeojeuqMeBpP0Kdl0kFux6qvEJ1AjTuSkX3PDr7QqK1rnUztDOffzG1R5EvXobcnfArQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtwN/M8S6bnleJsVSxmBWWXDJ6w+nplgJF2CdzZhmEU=;
 b=G0iDCoYQ45C4GnAx3VSRxCUGsA7icTMoc6zeMnDkfdId3ydRyouJyMuTLMXRwiGiwMxTohKh1PB9AxcP1EpKCoqiuBOUfalA0cykphJftSnD/7SZdwY4OvfvdG4u/2f+IfUc9pLBBkgwSPS7Gt2QRH6b1RsC+rqVwvZhnH7cUFw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:55:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:55:07 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-flask-login: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <443f675b-29f4-dc62-3114-39ad0b0acdfc@windriver.com>
Date: Thu, 13 Aug 2020 11:55:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:55:06 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4a56b38-997e-4f74-070d-08d83fa13ffd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814BC835028B2092D8625C19F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MiPzkONh4l8fJuuKpGZRkN4oAmqxrhuOUc6zHI+6a0oaAlJioGcsUWXQQrL1EGw+5dc3NCVsfpkYz8D71AFIquEWFcXCQrQ/3fessR8JmM7jhvtwFL3YY1VW74qjH5mPLQFBhkzzOO4ruNDpX03zD535Vb9tDwONxMDvpCdIqjuf4HQPh9mfkpBFgoHcxr9bruIC02YRZt1dG/JkIOLLnp8+iqIGdVrwBK/ezl+cPYa+lFEIJ30xMZG9Buq6rhjcPxXx6QNru28zUuiOeudzuBw4xNzZubuNQrlJM5yBMpPk7MrpxHdDb59MXH1koKQ8bNzun2KUGJTcAOsKFj0vlGg2nYdCEp92rgEVpRhujTgZrSJM60KpfUaSc9KX4qoKxUCvweiFiqeqtM1IUM+k3RStWwxs/DDkn4Q5YCutR1v9YVRtb86gejtU3Y/Dcbr/VOgVfx4f9hDeI8kQTuDOGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	IWclXDdkJlF24j3FewI1IHo9zrG1BdnOUvc4tCcC3CyUIDLap7ZM+vb5o1KgZRTHV/jL5lg4SbOf+yKnMAv+hkDONnW59TGZNZWI4nQwehYACRGBnU1NO4DwKxenoIwhYHFcS2JIAoXjG1l1b0mlj/eWC/FfofDugoO3ZVGo2p5hB+16NUHuofDX2LMdzW3gumSAwmptB0lYF5mgSy8vWfuXWMCSZJgu4BXB6XlLU55dbPDhFJv6PwBPns+Nzz6gL6Wh3pjad+sRMgu7m0E6w5ThdKbhBiUit4guGlwrxMsNSAiFbFL98dC8sfIE2vjBoY6MSZxAowo8V8T68WA44NboX+sT3Fbka2rRdUCC03OgZ5qTfk7o2dsZjQsLZInOwhQRzWIDUjtdeDZxLMi+UGCyR3/nqAIPkDn+XUEey+w7VuOamyK0hbGal7XrFgKwlCsEOmzSnptlQBQmSho4B/qVCf3TFWyzIK5sxBcirRrQfhsrc1CV6pfdUUOUsgzIxYuS/de4GfBxybU8zwNr22uUjkWBfDAE0DvjzJT7DmrpUb/TUfEEn6wHqsa67JbAX+ztnlplcgP+6hq9Ymbm7pLpobks0k5q+SGHhtamZShved7NXw+cTG6e6BFVFa9+v+eaYIowT52O2LvJiU45TA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a56b38-997e-4f74-070d-08d83fa13ffd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:55:07.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yotGsAB3VJY4bJfgp8YrlvOznnT3lOeJESn8NTo0W3NNNoOSY5t6kZC/lM53xw5DP+/t4XsIlsTP9hePbI//g76Twe9WXnu3Z3XGsFqfF8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------51C37D373EE6BB0BCFF53468"
Content-Language: en-US

--------------51C37D373EE6BB0BCFF53468
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-login.inc                | 14 --------------
>   .../python/python3-flask-login_0.4.1.bb          | 16 +++++++++++++++-
>   2 files changed, 15 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-login.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
> deleted file mode 100644
> index 59eb64f77..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-login.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "User session management for Flask"
> -DESCRIPTION = "Flask-Login provides user session management for Flask. \
> -It handles the common tasks of logging in, logging out, and remembering \
> -your users’ sessions over extended periods of time."
> -HOMEPAGE = " https://github.com/maxcountryman/flask-login"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
> -
> -SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
> -SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
> -
> -PYPI_PACKAGE = "Flask-Login"
> -
> -RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
> index 2d23fe167..ba335579b 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
> @@ -1,2 +1,16 @@
> +SUMMARY = "User session management for Flask"
> +DESCRIPTION = "Flask-Login provides user session management for Flask. \
> +It handles the common tasks of logging in, logging out, and remembering \
> +your users’ sessions over extended periods of time."
> +HOMEPAGE = " https://github.com/maxcountryman/flask-login"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
> +
> +SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
> +SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
> +
> +PYPI_PACKAGE = "Flask-Login"
> +
>   inherit pypi setuptools3
> -require python-flask-login.inc
> +
> +RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
>
> 

--------------51C37D373EE6BB0BCFF53468
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-login.inc                | 14 --------------
 .../python/python3-flask-login_0.4.1.bb          | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-login.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
deleted file mode 100644
index 59eb64f77..000000000
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = &quot;User session management for Flask&quot;
-DESCRIPTION = &quot;Flask-Login provides user session management for Flask. \
-It handles the common tasks of logging in, logging out, and remembering \
-your users’ sessions over extended periods of time.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/maxcountryman/flask-login">&quot; https://github.com/maxcountryman/flask-login&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596">&quot;file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596&quot;</a>
-
-SRC_URI[md5sum] = &quot;25b34c74bd509792f291c16e184225df&quot;
-SRC_URI[sha256sum] = &quot;c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec&quot;
-
-PYPI_PACKAGE = &quot;Flask-Login&quot;
-
-RDEPENDS_${PN}_class-target = &quot;${PYTHON_PN}-flask&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
index 2d23fe167..ba335579b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
@@ -1,2 +1,16 @@
+SUMMARY = &quot;User session management for Flask&quot;
+DESCRIPTION = &quot;Flask-Login provides user session management for Flask. \
+It handles the common tasks of logging in, logging out, and remembering \
+your users’ sessions over extended periods of time.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/maxcountryman/flask-login">&quot; https://github.com/maxcountryman/flask-login&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596">&quot;file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596&quot;</a>
+
+SRC_URI[md5sum] = &quot;25b34c74bd509792f291c16e184225df&quot;
+SRC_URI[sha256sum] = &quot;c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec&quot;
+
+PYPI_PACKAGE = &quot;Flask-Login&quot;
+
 inherit pypi setuptools3
-require python-flask-login.inc
+
+RDEPENDS_${PN}_class-target = &quot;${PYTHON_PN}-flask&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------51C37D373EE6BB0BCFF53468--
