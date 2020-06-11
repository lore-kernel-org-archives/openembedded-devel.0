Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.55])
 by mx.groups.io with SMTP id smtpd.web10.7183.1591881783747493486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QzXJGJ2q;
 spf=pass (domain: windriver.com, ip: 40.107.69.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErulYPdFcuTFixpqsXHCifRoDsbfSfKAgfcTFrxmwj9e40/E657TMheDSxlOvM6XnFGxl/jmPoO0SCYIG+WHk3/Do0BEBpnXUjlKn1rXsicV0WELOsdxJ/EoEW1BlvuEmeRUDjDZ3YLIm0IhaSG1/jsR3PTW6ObGC9MJyXwshwPdFYDNR2/6ykaDTg7wQOt+XdmXMS7kEVQoZDdGNpe5XUzjhXkFboPFeSD6oD2JptbiImSSweIolu1WE1bA0gosvGoKfM7g3tZvDrfFKwysjGimfOgXlzeOAiBFAELNjAEnE86wqlaJ647SFih2aXXhY1VQ5CbdgIIQnyA5Xi49Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3fVSZEhfENk4xBPwmv28a5Z27KcGjJxevPRJf4s+xo=;
 b=DMadoGFtRyY7Cyp5MiuGwU5J8okcYYOkAuxjrl/0SVajt6BzhbfP4XUQahJmIbIQus9/m5g2uAz8miuJXAp5kTDuA9TJR2oXpYgppgH79qPRK4ZvALAnwtNNryZdT3NaZds0qW/ZB0rXFz9AqPHmYtxDrjJB4GkiB+gH2P1wkOUwD2198fG4eylS0OduWT5Oy0kYjL3uzYK2ltkJy0YW+wyJD0tqICpzyjx9grTJzbJhVpE1S+TjskkDCCb8Tbxq7OAOO05RisJAIvSAUcItQ5pAbAFxZE8HGzqasZxiqcPYtwkEqR9uzIzBn+TPWTTz+Gu6HJEaqd8WRgfNR4bipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3fVSZEhfENk4xBPwmv28a5Z27KcGjJxevPRJf4s+xo=;
 b=QzXJGJ2qVGj2bR9z2OCWAZ472wepjYgmUTCYTdOEHqo8Z2tMxieZnuljLo8kks2yiX6ZfPCLM779b9cgKtXtRMabvmrRWvy3JwSk0Wea1o/TP8uTbI4hRKF2PPqzY9OX+/8VK6L+x6if6JBTT/G/nOLyYyJpARjXfmJO/wu4cl4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 11 Jun
 2020 13:23:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:23:02 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-markupsafe: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5405e2da-abe1-955b-7981-5420197d88d7@windriver.com>
Date: Thu, 11 Jun 2020 09:23:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 13:23:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17fecade-bb41-4e49-a400-08d80e0a9153
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB17800156F845C39D39E6FBE39F800@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vfYRUhxXGn3v1SW1n66CkRVUvT/pM0Y1S0dAZU2zBOznEOEw/lZJKubgw7Az1DqsWn80GijdH4JYKoS+o+G0hZvIoEinTwU+WTJp+QFuO5iPOq+4ZxX7g2I2SHotuW83JmepYIUIWIUi2cn4FHrpmCfPB+bEhU+5J4hYekm0vXWrlEZ1l3FASpFBw+NoW3kqycyTPimZtczM2MX67j1RnRYs1BNEdo4Hli2rrJEgCjczVvdBPTUbiGGrEhxTm3mGpkf/z23T8MK5uUYfzo1i80Eje/PFqfzKJ3zFkQjODVo+EsLfUW3kzzgcNR12gFT9al/eLkULTmvtAiymk2mnQkgpInJCsUTbYUC6tjZ/OnLXRF/Is7ZC8SBP0ziQXR9fsZbwmRO23a6CY7OMxGq4xmzXXHN40ugIiIqL1gjkRa7cS3GoYEr3JoGW58dum7qGGrYJyjC2jwPw9dXKA/XE0eywSobwYgHvN7UO8GW+t8c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(16526019)(186003)(5660300002)(2906002)(86362001)(6486002)(66556008)(66946007)(66476007)(52116002)(33964004)(16576012)(31696002)(19273905006)(316002)(53546011)(31686004)(36756003)(956004)(8676002)(478600001)(2616005)(8936002)(26005)(44832011)(966005)(83380400001)(166002)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	z6ZDYsukJZjL57y9IyTnvXYRvEYzOh39LGHFWCCDMSZAwQ7SFzaRCcMxmc3lIcFJ9TmIhjtmYkUIsXJtIhakw2pnmcl7cqcOGu8zo11NyjCxVZ1+HpR6zkPmJLamZsTMP3sQhA8Avp4z2vasjrPeWgN6RXJ+vdYL/h5O3oZYeROnqs1XqZRLtf7VFticZS8NDKgCoA9cvASYAOmasRNJlE1Qr7vTTQBYwrFCdX02IH335DTmqe4SZ/4Ins8J29GD7tqXUwM7se0smvQbW4vR8D0jQtG3MgKL7g8PzKk6YpqZDvHuoZmkjqoZNSK+12iV5PYdHVaq6CMl9wdqhKqE5u8VlP0FOrR2N73koMWCjbRV5+GUKTYNvU/L3rW7UFxQqadkn9WZoWqqSlMMWDdJvCVPNafrKylNxssWGYVksVkvhFdlVyuWFAxgvRF5hgndkCQNMd8QJLkTi+TdpPdCk+Gq1cjTM3c72mb2GdVTtCMCXnkosn1R0YJHT4Tklfz9
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fecade-bb41-4e49-a400-08d80e0a9153
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:23:02.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jf4SuJjaYfLh4ycfXG9whv22aepbZ2vsk9owjwYLj6V6IGBBC+ZIPTwZp+bFEc+fTLWGKAzXHjaBQZHDqd+xLZXA9qA/7VwqXd0+ps2q9n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------D38BA086B3EABDB0A934BD21"
Content-Language: en-US

--------------D38BA086B3EABDB0A934BD21
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-markupsafe.inc              | 27 -----------------
>   .../python/python3-markupsafe_1.1.1.bb        | 29 +++++++++++++++++--
>   2 files changed, 27 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-markupsafe.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
> deleted file mode 100644
> index 480876268..000000000
> --- a/meta-python/recipes-devtools/python/python-markupsafe.inc
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
> -HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> -
> -SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
> -SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
> -
> -PYPI_PACKAGE = "MarkupSafe"
> -inherit pypi ptest
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
> -
> -BBCLASSEXTEND = "native nativesdk"
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
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> index 765e3c906..7de57cbd6 100644
> --- a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
> @@ -1,2 +1,27 @@
> -inherit setuptools3
> -require python-markupsafe.inc
> +DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
> +HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> +
> +SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
> +SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
> +
> +PYPI_PACKAGE = "MarkupSafe"
> +inherit pypi ptest setuptools3
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
> +
> +BBCLASSEXTEND = "native nativesdk"
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
> +	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------D38BA086B3EABDB0A934BD21
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-markupsafe.inc              | 27 -----------------
 .../python/python3-markupsafe_1.1.1.bb        | 29 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 27 insertions(&#43;), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-markupsafe.inc

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
deleted file mode 100644
index 480876268..000000000
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
&#43;&#43;&#43; /dev/null
@@ -1,27 &#43;0,0 @@
-DESCRIPTION = &quot;Implements a XML/HTML/XHTML Markup safe string for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mitsuhiko/markupsafe">&quot;http://github.com/mitsuhiko/markupsafe&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
-
-SRC_URI[md5sum] = &quot;43fd756864fe42063068e092e220c57b&quot;
-SRC_URI[sha256sum] = &quot;29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b&quot;
-
-PYPI_PACKAGE = &quot;MarkupSafe&quot;
-inherit pypi ptest
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-stringold&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
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
-	install -d ${D}${PTEST_PATH}/tests
-	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
index 765e3c906..7de57cbd6 100644
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
@@ -1,2 &#43;1,27 @@
-inherit setuptools3
-require python-markupsafe.inc
&#43;DESCRIPTION = &quot;Implements a XML/HTML/XHTML Markup safe string for Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/mitsuhiko/markupsafe">&quot;http://github.com/mitsuhiko/markupsafe&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;43fd756864fe42063068e092e220c57b&quot;
&#43;SRC_URI[sha256sum] = &quot;29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;MarkupSafe&quot;
&#43;inherit pypi ptest setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-stringold&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
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
&#43;	cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D38BA086B3EABDB0A934BD21--
