Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web10.25624.1598552317766969026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Bpe0KJTX;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTtZzfAE8lRAlhIqzT8VL6LceZiz0pQdZkmbZ7iADdXtax/VPCUzNDcTc9hDwUIgXGGw5F7XY0/1cQoY3KH72h79aVzwljQR1v9FZ8Dp3i8mrFUp9cgCsnVPke0HrIqIkPHLN7jCXLTF9lMjuvuqs7x4sjo6BkcWuIU+foPAU+1W9d18XvVSVR5dRIDA46tOLnKIhs/ZF7XLP8GXhKMshxln1AUni07Nsx02Em8brcvvZo6k39/EyfEfj+KcZhJ/T0rQm/nl+RWkoq5kjj2QvSThHC33tnlcWRWXhTILYlXXgZOjWL5Y7GTvb45GXy1voaqtyuUpc958Ory9vliVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSLAyFedSUa9XPg/gzuJnrlxXms3BwC9SK0vj+a9PY0=;
 b=DQOzRnmM2HtR9QL8iUnlJ4KvcOWxgNlmddIumP5dGj8QQBB0dvyNbPbP4fraUVY4PI9nD21EmXazRsLdUM1RX2ErTXPkapyuKX5ou8fR76QGiH7HhB/aS8TRKDF9PCB7oMfkszEXXdt8UHXO4gyqS6+ckoi+ofr1QB3nnizIbB5s1hlP+zUBTTrNKUDEERxRB2Kpb7P3UDMZD5i1NJEbHzLgRi1PDprgqdvLaXMRtkpaef2VY5LlPrYB/sk2TldbctxQXHqQDNRw/CfsUsiLbaiA3VgtE5/QdkQ1tQrUa01jRWpERLNfDgIIwrwUPZGNZx1X+tIMa2tAQtmzrCLjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSLAyFedSUa9XPg/gzuJnrlxXms3BwC9SK0vj+a9PY0=;
 b=Bpe0KJTXd01MIc8V3QQhaeb1FfB34n3f4UE1RMPEPe+vrQT3xK/8vlLw24IitBbH82g/MzWGGN8lrXdqmAIeIQarDF56qAAEprXKmZ/CVQFfNL958kv546OysNguzXIDqG7W3UDzE+0uOmuJBcBCYvHvcUaZxDax8xLea8Jwg3I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 18:18:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:18:36 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-flask: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <476f6b86-8e15-34fe-feb2-c4e9c585519e@windriver.com>
Date: Thu, 27 Aug 2020 14:18:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Thu, 27 Aug 2020 18:18:35 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f53094d-ded8-4e70-bae0-08d84ab59d5f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2806:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB280697AFFCBD3F85A05752479F550@BYAPR11MB2806.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NaKI1QhKvS3Ya0Q7+YdIGauhJXazIdcbGnrsCFCR80/9RJnFaAByDxSLN5Y4H14T/ZJf6OJvJqeAHnRZ0jUWLZBro+4F9XxG7I2kJyk8oD4Ef/LHAKjjB5nvJsgYeSDDKo7AEUj2MkIwZ3Z3NjxhnTBPWibp5m+XjtCms/FQGtVFdf/28zTVNljxhGDiauvmLE52fojGd3bU2LR81Nkmu7kTlNgoCCHfdX/SAXfnLrgY+BldVYKbU1gCnj7JuPaS4kK9bp1sb7nw+VpGIIlL9o0gEvQrwt2nEHUeImOTWcURUfirnO4tCglkIfsqzPdVN0bcCjnMPOG3g2CG/gz+08XfetYttW8u0QZLwabeNI0blMUBk1sbMRWFR0/d5EdRItfIcacgCiW4tQTxRCTTBdNdglLmpLSG8wV3VCEnamVnv3mW05u8czQpll70zlQKkp1pwZVIkaaKEgSMbpMlGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(8936002)(36756003)(6486002)(8676002)(478600001)(5660300002)(16576012)(966005)(166002)(316002)(31686004)(956004)(2906002)(52116002)(86362001)(33964004)(31696002)(83380400001)(53546011)(186003)(66946007)(2616005)(44832011)(66476007)(26005)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kXvF08lrc2ufuWXCciUhArrRV0ZaZXR65mIZ5O35ZKUpRCUE6E/+b4hN5V2FZ69MdlkHVzb1AoBg0zj27DdvGU7sySOnPlN3mvXCrWFTM5WhduQf1wIqw0jYVogO0yKjDDEbW5Xm4ngsD4A5KrdKKN74r35n2hR1wmPhzjlQqIRZz2LA7XcP8ZPsOGMxDqlOkS7D45lBODmKMeRwC6fR1FUQ1Wf47Wo7Gnshym+fesdomhCnibrmaUx9NU8EGKrj7qzyLEt1vF7JKOuTakN49jPc60/27QoOojgKYuO9+MjmCGRcXopy/rNvQd8VVDXNJD5TmuuYXnzNdqbrbiPIRXxSJEQ4w0memepfrBTNKoXfG4uEKifRgCZBkPi7N4Pd446vE16uSvo2oNdua44X/Nf2VOcDPUlUKKlg5kwDsfyGOiNOHJQ5qAEKwGuFEZV5+NbF6vlVDk8j0fsLLZDM/qQwUkMnnf+9QI/X+J6xBA62jiH/Bmld9Ro+lOQtPN2hICy4suNZWDk3fWXBj2cbeE5GaWluy9zo+6tasyaqFZyzB86UjqNEo3d29aG3tCXqW1e8P4tLYFrnlgUJPdPXdJFD6yYiIIiQBe526hpSjAxjWdZKVtadAwYgnzQ87wH1CUBDj+nw5nRoQYMH7iHUJw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f53094d-ded8-4e70-bae0-08d84ab59d5f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:18:36.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3voS6NFs3DNZvX14pn8+QsS1w4TnQUv2r7QOFLIOOCHkpScw2+WcfIEJiuUJhc3/5iXuhnoWMRBX+TBuhv/Ja+l3/tloGPV9TKX6ov+M0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
Content-Type: multipart/alternative;
 boundary="------------4881BC7B025912BAA379A3D0"
Content-Language: en-US

--------------4881BC7B025912BAA379A3D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-flask.inc   | 16 ----------------
>   .../python/python3-flask_1.1.1.bb              | 18 +++++++++++++++++-
>   2 files changed, 17 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
> deleted file mode 100644
> index 1263383da..000000000
> --- a/meta-python/recipes-devtools/python/python-flask.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
> -DESCRIPTION = "\
> -Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
> -intentions. And before you ask: It’s BSD licensed!"
> -HOMEPAGE = "https://github.com/mitsuhiko/flask/"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> -
> -SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
> -SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
> -
> -CLEANBROKEN = "1"
> -
> -PYPI_PACKAGE = "Flask"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
> diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
> index cd439900c..fbe1ca00e 100644
> --- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
> @@ -1,2 +1,18 @@
> +SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
> +DESCRIPTION = "\
> +Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
> +intentions. And before you ask: It’s BSD licensed!"
> +HOMEPAGE = "https://github.com/mitsuhiko/flask/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
> +
> +SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
> +SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
> +
> +PYPI_PACKAGE = "Flask"
> +
>   inherit pypi setuptools3
> -require python-flask.inc
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
>
> 

--------------4881BC7B025912BAA379A3D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-flask.inc   | 16 ----------------
 .../python/python3-flask_1.1.1.bb              | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask.inc

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
deleted file mode 100644
index 1263383da..000000000
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = &quot;A microframework based on Werkzeug, Jinja2 and good intentions&quot;
-DESCRIPTION = &quot;\
-Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
-intentions. And before you ask: It’s BSD licensed!&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mitsuhiko/flask/">&quot;https://github.com/mitsuhiko/flask/&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
-
-SRC_URI[md5sum] = &quot;0e3ed44ece1c489ed835d1b7047e349c&quot;
-SRC_URI[sha256sum] = &quot;13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52&quot;
-
-CLEANBROKEN = &quot;1&quot;
-
-PYPI_PACKAGE = &quot;Flask&quot;
-
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
index cd439900c..fbe1ca00e 100644
--- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
@@ -1,2 +1,18 @@
+SUMMARY = &quot;A microframework based on Werkzeug, Jinja2 and good intentions&quot;
+DESCRIPTION = &quot;\
+Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
+intentions. And before you ask: It’s BSD licensed!&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mitsuhiko/flask/">&quot;https://github.com/mitsuhiko/flask/&quot;</a>
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
+
+SRC_URI[md5sum] = &quot;0e3ed44ece1c489ed835d1b7047e349c&quot;
+SRC_URI[sha256sum] = &quot;13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52&quot;
+
+PYPI_PACKAGE = &quot;Flask&quot;
+
 inherit pypi setuptools3
-require python-flask.inc
+
+CLEANBROKEN = &quot;1&quot;
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4881BC7B025912BAA379A3D0--
