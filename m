Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.77])
 by mx.groups.io with SMTP id smtpd.web10.10470.1599060731812419529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VDdJdTws;
 spf=pass (domain: windriver.com, ip: 40.107.243.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6SAI3sdPVyTni3uoWjvWr4auAEMVW42MuoFq/6J+ebg3KrDz1OI10LO2mfA7jjC3S/G9kj+VGBIqLl9Y4mnlDbKdLxrBUtR5kZaNqfxdh930PFmQu34GyOX2nIOyOdtEDcdYcZ0Fx7TZA+6ZFnim9eMsuzetXxln2DIFAeXZUCiGxrJQOxWlUtOxCupK7ukHj3LpJGHaFse2a5CFFLFns2pJ4OwP5k9P28N2lOpAxZ3nI12oUYRqdMCJa2ZywCOYgV5chSfXZ2MMKRS7Xx+gFXuKsPvUUz0Abfmci1k4nls8Oj5grIGHxw8m2nalhjWkaCGKE15YpuC1mmdMGMx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmUyWUoWqzsjaRew7jIShemevDzs6254JPjBMtERIWg=;
 b=Cx+nNeG0Kih1uqcqIO9c91dADaKBw13MEgHAhSlU/1pZV6pvV3BwAri8AB2Igbv8XrrCingo7BG3zUhxYfANWbEfigdeTCUCBaUN4iIZCgUwbI9IBCeEZxxnMcET4XGXcMZQDLb99o8d5S84XDU+yBtcOrrno/+uPr4GjGXzC+dmoFHDJOrzk7oJhyKO59H6fiNCmbWi+h8sE0EvnG9QsWYc6wZmeR3lsopPXLZQJt1ztf3+ijThxzDE7LqkmxbjrwC2Iv4dVutOltjXl2+lpZxykpngyiv578u6rsmkUU2fgPM0rRUhuvXie9TvqDgfweArxvLhp5Em5wFRi/6UzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmUyWUoWqzsjaRew7jIShemevDzs6254JPjBMtERIWg=;
 b=VDdJdTwsl14hkPNLtdvqCd1JeB9vfvf5xXq1F+DPiWk450vn6vt0G4tGQKyS4m6IxswrVSBcPx4P7HcZTHjuPmfsG4XXEUhYLnsz8yP24UqBXtqpOrqLLgczbpPA6B7oc/mTXmu/kXQljQsbHw6mBocVmt59QA0gojKfS0gr35w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:32:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:32:09 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-flask-pymongo: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
 <20200901081147.13556-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48b08602-f514-f799-3fda-c04a8c9e7369@windriver.com>
Date: Wed, 2 Sep 2020 11:32:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901081147.13556-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0091.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:32:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8d0cba2-86c1-4dc5-aff0-08d84f555b2a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030B0A0A21E77A241BB73689F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e78H5iRPXG5SWkEb/W2lhMNUcsX2uHewh8GnKD4jCEBBfAO6LtxJ8N8m9hn/UfpNelaxDbDIURqDnp2SWS5glrkBLP+BWH6Ft+qnrMOb1z63ta5WrVAn+wg2GPUXVOsefkI5oeTSA79kgiP6NLqbbes14ZwrdvsqEYsU4awtB+JoUHvX1/C+4wW4hg20wCnlf3QtdechoQXyCnWwdW92JpXzku0CRgxDY0q5YpsE+Y/beJmmQXNJsjMcBbEWfaDGN7XOFqniV48vnN6oxV2NVLAZcLkQWvmyEmA9QEzasEXZyvPYaO/9CuwgLGRhWmhPA/qKSsHAbIA//7n9yRyYUHKX5OOKFOobjc6lMdFSQF1j4GsQnYA17/1rnO2XA1I4mNr3EGkMEDNlG79m2ztUK5Bod/wBy6W04DnmfXQio2WsESouwKOS5N6AnbdvqsCxb06CKubBcW9XGBB4Mw7GwA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(6666004)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	umIwsPquduc4Eh5l6aNbbqowgzyzbhu9vweXfM/q3cCOOz2T5v/8fyNDsbivFILpPND8y5+qxMpjGzuKMoWMooc149C54Ffs/Qtzpx5Nutzgd87CKOiR8Y1M1w1vUZ9UZor9sV7TfpVY/3CaC8Ra8CcJ4YnjbPOweBCKtlSspxwHCJUkbqxOHcL3I+UicmbmPosLkIEDHE2SdyitWdd2ba5ABtHp2JDBE0mA+Yl3Ps5DDfY8VhkOxarw9j1WurW07qF5zzPWGJDofttpdU2v79xV6phIZWOrrUCPLluEl9BIxPbXHEQ5WPFcP4i3X5YzOxO0TkF5EzhpBX5bGCn7HlePthVZkgiB6JkYZkKBGJe3vPo8bkPeBgSFu/3FcH6SXAMrzLvXrd6dkqIyF5XGPQNPrDXsa4NsTqjIeiLhJw2NSA7Whoj0fpSEtT2ExM6KfX1vuxwkCNaDKQT9WLp3P0NAW1y6W1yUq6Ikdbineo1TtAHxI345Bt/kVB14XInDwdeoq1vw3M8WV+v9sTFhDJ0XQv4I9imsWq6rxTPTsIP58LpXcTr7T+APTO4MoWBgw+yGyxxN810lSeTZYqKdU+HKq/c4IyNpBQOwVkqVGmYRq0W5GxdA7P8pxd6yV95E49Cc4kRtBIPju8a8Il3TGA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d0cba2-86c1-4dc5-aff0-08d84f555b2a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:32:09.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJImaNcsPsCzD83qpqeTlul+KJbtT7t1+THJ92ijPGhtfiE4kRP8O6bnwJyCVYO+mg4szaZSDxKG+rADnazCYXqR2uZ+G5oLusCyzUgqpl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------E57D5EA03F28AB337713C275"
Content-Language: en-US

--------------E57D5EA03F28AB337713C275
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 4:11 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-pymongo.inc             | 15 ---------------
>   .../python/python3-flask-pymongo_2.3.0.bb       | 17 ++++++++++++++++-
>   2 files changed, 16 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> deleted file mode 100644
> index 5fc35c193..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "PyMongo support for Flask applications"
> -DESCRIPTION = "PyMongo support for Flask applications."
> -HOMEPAGE = "https://github.com/mitsuhiko/flask/"
> -SECTION = "devel/python"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
> -
> -SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
> -SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
> -
> -PYPI_PACKAGE = "Flask-PyMongo"
> -
> -DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
> index 2102554b6..e3c744d92 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
> @@ -1,2 +1,17 @@
> +SUMMARY = "PyMongo support for Flask applications"
> +DESCRIPTION = "PyMongo support for Flask applications."
> +HOMEPAGE = "https://github.com/mitsuhiko/flask/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
> +
> +SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
> +SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
> +
> +PYPI_PACKAGE = "Flask-PyMongo"
> +
>   inherit pypi setuptools3
> -require python-flask-pymongo.inc
> +
> +DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
>
> 

--------------E57D5EA03F28AB337713C275
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/1/20 4:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200901081147.13556-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901081147.13556-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-pymongo.inc             | 15 ---------------
 .../python/python3-flask-pymongo_2.3.0.bb       | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
deleted file mode 100644
index 5fc35c193..000000000
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = &quot;PyMongo support for Flask applications&quot;
-DESCRIPTION = &quot;PyMongo support for Flask applications.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mitsuhiko/flask/">&quot;https://github.com/mitsuhiko/flask/&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD-2-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d">&quot;file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d&quot;</a>
-
-SRC_URI[md5sum] = &quot;94df71e6800b1d7915cc91a74b70f959&quot;
-SRC_URI[sha256sum] = &quot;620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314&quot;
-
-PYPI_PACKAGE = &quot;Flask-PyMongo&quot;
-
-DEPENDS = &quot;${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-pymongo ${PYTHON_PN}-flask&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
index 2102554b6..e3c744d92 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
@@ -1,2 +1,17 @@
+SUMMARY = &quot;PyMongo support for Flask applications&quot;
+DESCRIPTION = &quot;PyMongo support for Flask applications.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mitsuhiko/flask/">&quot;https://github.com/mitsuhiko/flask/&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;BSD-2-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d">&quot;file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d&quot;</a>
+
+SRC_URI[md5sum] = &quot;94df71e6800b1d7915cc91a74b70f959&quot;
+SRC_URI[sha256sum] = &quot;620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314&quot;
+
+PYPI_PACKAGE = &quot;Flask-PyMongo&quot;
+
 inherit pypi setuptools3
-require python-flask-pymongo.inc
+
+DEPENDS = &quot;${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native&quot;
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-pymongo ${PYTHON_PN}-flask&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E57D5EA03F28AB337713C275--
