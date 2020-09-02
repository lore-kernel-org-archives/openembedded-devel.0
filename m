Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.52])
 by mx.groups.io with SMTP id smtpd.web11.10290.1599060710240728485
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lecuPZOH;
 spf=pass (domain: windriver.com, ip: 40.107.236.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBI+knqqq/j832CHhD3QCcO8TcHtUPkNy68nufzWci/9DSpqYFIAtiLUL3aYfvLhVaCOJVZ3dLT3vwhjlY90wllboH/BQBR2Sx88dQkEi9b5ryt4fxXbTZLNo0Ci8WG/b2pQvdrHn+x+eXlbRKh06re19gz+9DLVnk3vJkihXGaNhJb/7pESXv5+XFwutap+e7PfWSZEYGj+uKr6SlOzV8A6ehkRxdZBC24DgYMsrDc8xUuUV+TtGX55bYakRJWk14b0f07Ca9Mgc2CJuBxccnYpOXysoQ5a4QV9lTgZHWURmR2/2nLAGig1HUV+r7HS9RgHuuYAXRoxcB+Q2KbSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdfnN+5k76Fc2J9Ov0KIYA9tDH9smqQWKLe3v8MwGLk=;
 b=OT9E3/Om88U1p6CX38d6SzchxCH36NRS41mUqlgdWIBI96rnPTj/puM3N3AKyqwIPlzYjGUh87XUKZeOX2cLNeqk8nm/S1MFpj/Xbux696tykOTf/j6a00Xix6JwmhK1ZqVFE3yoUe/F8l1NDQIJTkfhcPxbVJKU8P4X3F7SBkkpSHuxuEY9bIustDl6pNF7TVXQN3kdPG8a8duATQryLwgMWibsznU13MHMIaT/4fHIkefGgOEV6rZCsUDIH/jD24ggJcR/sxaLuwIkANcXsWxgXP1fXfRKNAVvEU8+7naZC25sFa5UEZiW2YeilfSerbdA50krFeH5rktc/iBg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdfnN+5k76Fc2J9Ov0KIYA9tDH9smqQWKLe3v8MwGLk=;
 b=lecuPZOHNZp0L/U9sDJNwTVnjk3srGpphBe4eeuK1FyriLCso/y9IJEG7PH4kSAYY16ImfOtE1PtMyILWeGAsvG0BCcHAfG2s4F2tcnCHcqKXTMo71sdXj7WT0u9wZVJj0lkBoa6mB9ugKpGXdDRZ3wtxodfGPo8bG9vstSZwSY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:31:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:31:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-flask-mail: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
 <20200901081147.13556-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <04a8f51f-895e-5675-4120-126aee56f1cf@windriver.com>
Date: Wed, 2 Sep 2020 11:31:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901081147.13556-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:31:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 179984dd-9823-4c7d-92b5-08d84f554e66
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030072C034EB9DE802680769F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1tqA609reLpf5vgQz5cIoGIu/4BAxdIAMFtWdB8/ZeKxggt6h87jceAyZXgOuQnLrgk4HwN39TeEGrw/JrdwkshyD5MBbMFvN9Lf/s3HtsaLJvvfMaXtGlTKWlZHKChdO7yq3yDCADr/pA5MzLyeb5RbgXdzrIQt5iUenv0yyqwdciNLZXepiQU94UUYlc9UIam0R5HWyOt7C+Iz0zAKfjYGvO7GqUx9414zqX/4H4eXVcuWyfE4YSMCU7I4lisfD5KXxMpkzqgRRFSDG6n+f0sPrROI5zhNhZ5gE9GF3dplOi/0tuv8V2LBYJpMtSOKFdTbaC0cEu3s/fWMm50JfGqPDgsZgJKr7gbcz5lNwYxkLEN1OtFNMLdjVxhdIxt3GRvj8Iwdc6078TSO8R6ypkLIWbn6BY8jmmZVYB2f8EIlL9I1hPLV9SaRAowqd/kv7tdo/7RgV9CfvcfhoDij3Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hP1BMmd7E/7OsFUGtcrkRuVPN8+0NcsRMm+vHwYWeuF96jqcJ2FCJvGL5OM9YO2gT32ouzsXRRZPknIxqLRVxLli65Ehw9nkWa4fhNNiiqCGhn6+CdMa0rmZj6gxrwkbVjbUF0blmPEUSjgC/nmjOi0eBI2iEL+wE6M9qsbMFQBCx+vqWZIeJzFZmclb90PrC2n//k9VhoPhpPFs8MAUQFuAgIWAuraYh6aNsiwIMcXzptwex09c7d6NDMEJcPprfRF83rnXqUMVS8/LF+YoMS0IkOW+qZpqyDIW5oKqSLsqR34Z+r2QjCR91w2j5qh+ySTDK15mXoaxKVsvlEPz5TO+TSjWGedQZ4uQhff5HupFXmLQp7aggSDbHwxzD+RXqnKK2rAE50cxP6OTevHfkSq2uGrdLG13uQh1b8FOMKTMecqIn7VoB6FEfS5LSqGcFI5rai7tykaMoNQ4FEatHCwaudWkoJP0YWxS7iijk+tIaHHpdiahU4d6LsqqXU8boPnWihU8h2yEUKNgPU9uFNHncWonsOGBiRlfKsXV1hLcjgSQGlpmDmlDOKwtoFvg+6k5pP7362nuR3Uc10sFJJYEPy8+0PH8A6Z0pjubixgQ8RzUIYdhxZEkVPpXqXBveZt9jNNGGvrZLF3G4oxBAQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179984dd-9823-4c7d-92b5-08d84f554e66
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:31:48.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EBzWcHAsGoDoaqa9vowfLBjCo6m1sT1R93aUniJRxKmNLasUGv2Izr0n7zAwoPQEsm+O4TKpDUPVkD8HfARDr6BXJFX1JXtEqeyz7QFQGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------B2F6D33A7F704E7ACAF2B0A1"
Content-Language: en-US

--------------B2F6D33A7F704E7ACAF2B0A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/20 4:11 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-flask-mail.inc  | 12 ------------
>   .../python/python3-flask-mail_0.9.1.bb             | 14 +++++++++++++-
>   2 files changed, 13 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/meta-python/recipes-devtools/python/python-flask-mail.inc
> deleted file mode 100644
> index 0df276d15..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-mail.inc
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "Flask extension for sending email"
> -DESCRIPTION = "A Flask extension for sending email"
> -HOMEPAGE = " https://github.com/rduplain/flask-email"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
> -
> -SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
> -SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
> -
> -PYPI_PACKAGE = "Flask-Mail"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
> index 0b963be56..7a89cac9d 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
> @@ -1,2 +1,14 @@
> +SUMMARY = "Flask extension for sending email"
> +DESCRIPTION = "A Flask extension for sending email"
> +HOMEPAGE = " https://github.com/rduplain/flask-email"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
> +
> +SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
> +SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
> +
> +PYPI_PACKAGE = "Flask-Mail"
> +
>   inherit pypi setuptools3
> -require python-flask-mail.inc
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-flask"
>
> 

--------------B2F6D33A7F704E7ACAF2B0A1
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
    <blockquote type="cite" cite="mid:20200901081147.13556-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200901081147.13556-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-flask-mail.inc  | 12 ------------
 .../python/python3-flask-mail_0.9.1.bb             | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/meta-python/recipes-devtools/python/python-flask-mail.inc
deleted file mode 100644
index 0df276d15..000000000
--- a/meta-python/recipes-devtools/python/python-flask-mail.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = &quot;Flask extension for sending email&quot;
-DESCRIPTION = &quot;A Flask extension for sending email&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rduplain/flask-email">&quot; https://github.com/rduplain/flask-email&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770">&quot;file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770&quot;</a>
-
-SRC_URI[md5sum] = &quot;04b35a42a44ec7aa724ec8ce55e2e08e&quot;
-SRC_URI[sha256sum] = &quot;22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41&quot;
-
-PYPI_PACKAGE = &quot;Flask-Mail&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index 0b963be56..7a89cac9d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -1,2 +1,14 @@
+SUMMARY = &quot;Flask extension for sending email&quot;
+DESCRIPTION = &quot;A Flask extension for sending email&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rduplain/flask-email">&quot; https://github.com/rduplain/flask-email&quot;</a>
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770">&quot;file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770&quot;</a>
+
+SRC_URI[md5sum] = &quot;04b35a42a44ec7aa724ec8ce55e2e08e&quot;
+SRC_URI[sha256sum] = &quot;22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41&quot;
+
+PYPI_PACKAGE = &quot;Flask-Mail&quot;
+
 inherit pypi setuptools3
-require python-flask-mail.inc
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-flask&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B2F6D33A7F704E7ACAF2B0A1--
