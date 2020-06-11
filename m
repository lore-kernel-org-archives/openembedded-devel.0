Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.67])
 by mx.groups.io with SMTP id smtpd.web10.8551.1591916608435999209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EAMP8F3g;
 spf=pass (domain: windriver.com, ip: 40.107.243.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfeD4h6Jft7r0zy4w2AzopNCzO5YpkrJ/9NKpiziyN/LhrEZ5jQhxq3UQiELOlErwHUfOu0Xu2iGxV/SNHYf1j/omewB6TPoWCs/OcYh/uqKfFrC7Qq2aUMgVCwehT8/xvKSnNsUVmsG4h8ghRL4gaTD2Y01lhHlFno43jDKgHYIAo16EyUxniSUjPnQo5IrzaabMMYCjyXraMHMTqtwfWM+vhEvs85kPeOWrtkKbX715RhWIARbsU5YcewdwDNfuIbjLk7fiAPS8mDFfhw0U4AlaBD185r4GlwiJw2YFPmklNqSMeT0AB+L4Zv3Fznm4SwLuEoNhQovIaH8jNMu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V63NGQNMOsB/6wqtzieOupMwbRRdWYysOaoepHbPus=;
 b=HWbAcxbmncarFEvND9reh+VLb6/vmIIUGuvoO3BnYT6BOHSus+7Wh0pPd/EQBRx6w7qdiySfr9eeEiRviEpqqIqBVRvXMYo6F8owlvyVSRLqA1eEEmfsdhxRNsb2cQ+NL4oCrW7B8VEMy/f6dejicCvy/pqtb1HAvH9LaiUc0xsvBWloobIDVS29+nWFUf1zuXi15i7GVjuDYa3bVKdLowgBlpkQV9oV16dMZBinIBZYfR4r7M9Od/xxqwJF5TrXagBsCmVQk9/tW/niBZHij8RoMuvY0sQygtgqlhaSJQS+8Tdy7Xcc4m+DHP2N1/oR7IWxZuxob6uJy8hZKgVQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V63NGQNMOsB/6wqtzieOupMwbRRdWYysOaoepHbPus=;
 b=EAMP8F3gbevMvfDbZg1st8apbme2At13eOHzmUq93eI5oAcBczjZ0hjzVvdIADTSfhhqL6CbxeYHrRe6zpkcfZXGoJlHB5ryn7N7iExNDWly0fWZW7iWEaguwdGrDDsTuMiTmkmJ+LRXf8gu5FfUw/earGh50z743ydEF6z7chs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:03:25 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:03:24 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pika: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7fff5bdb-3841-460d-830c-fc0e8809a70e@windriver.com>
Date: Thu, 11 Jun 2020 19:03:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22 via Frontend Transport; Thu, 11 Jun 2020 23:03:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01d6f97a-495b-4b8c-32c8-08d80e5ba4eb
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39553D07766AD60D9D3DE0E39F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LX2VJec0/7NfKnKLYbEDmikj1Md/gMxy2IqFyImrFYZF2zS6x40YodE7GlyyPaTnYTjA8myla9KrvmRJHvJXiZ4f9kge/p7Gp7CvL8HJ5akFq7YP5NetELMoyeXcAs3KFnoW3ta3VJoWB8I9L56TSDqKrHC8zy7pW7WApdP6c+3/W7KcNv0NmZIDt1eL+/DqWQhdE8H8Ja46Rn2gy9kqpz1QbNMJiXwtlla2jhHaLnhxctRdAy5dV5945SUkJT2eihPs0PX2xXnhfg3LHgKaVMkv1Puq6jtVMCMqgMEfccfPbO+t9rVIsz6tRt7hKE6nk4IUZI54wnltkL2vNGSvJuH/KEIpS0IQB1JEQnMedC9RMdRUSIxAH8UEoWZUBKcBLbWR7nktDXEt4dYUK+4hZ/8BnT8fnHjVrGmWD48wRscofKNc8HL7ANtbaJxEFHWG1ZYjdhdOnsSXbDzL9dRUKw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(136003)(39850400004)(396003)(6486002)(8936002)(31686004)(966005)(8676002)(478600001)(31696002)(316002)(166002)(2616005)(36756003)(66946007)(44832011)(956004)(66556008)(66476007)(83380400001)(33964004)(53546011)(86362001)(186003)(6666004)(16526019)(5660300002)(16576012)(26005)(52116002)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GGdACLitPw5psrDcHXQcgx+T/NMgjecc7LRwGB6QRrwG7R7tM06uMipKoo2kFE/ydWoHeu0SMUvVGfUdITNiWmt4y6FzkmkQ8AYhkV7TXnImLjKiwteRiQoBQ5LQwNWXvUh9PGZ5XHKJMWWyptVqTDwd9PnMHQ9n13KULki+dn2ecSOpwHX2vaTTs7fZm2jieRou+z8P3e+rEJQxodGS+KnG74NPHu7jO1jrTUois5GKiEyPEfXVUYBAuc3JXJ5R5AunWZv3J0ZBCjwaGWMr6k99j4HGISooxrV1iT1bp1TWnh4EwQ3DEt/LzUQrF8f4HOhED/aCPhYzYM510B6YO35NzqLefAGc/oDILm+EIlKNeFUEZx+MTkws4YgBZQtzzYWH9A/Pzly4qQoIK7eiFqPnMejh9mktpYCKXlm08JagUPiqYOxGb2Ja2erlldpbSqcJxPPLtJ1Bv5Mx/6t8Xo27EN4bnRpbQhRWGXdMvf46+2cy9Gd4LYiLyOaKBYpu
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d6f97a-495b-4b8c-32c8-08d80e5ba4eb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:03:24.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHPrpfjU118wq+RIJW0aminpZCV3hgJqihV++cmsZ1VBeJI0S+8Ot7i5V4Gc1FuUdsTENeL537LchjcHngr7N1j+4OAUsDYTUg5KE0jm4WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------DE78393558F5B8574F790922"
Content-Language: en-US

--------------DE78393558F5B8574F790922
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/20 5:08 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pika.inc   | 22 -----------------
>   .../python/python3-pika_1.1.0.bb              | 24 +++++++++++++++++--
>   2 files changed, 22 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pika.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pika.inc b/meta-python/recipes-devtools/python/python-pika.inc
> deleted file mode 100644
> index bde154fe7..000000000
> --- a/meta-python/recipes-devtools/python/python-pika.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY = "Pika is a RabbitMQ (AMQP 0-9-1) client library for Python."
> -DESCRIPTION = " \
> -Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
> -including RabbitMQ’s extensions. \
> -"
> -SECTION = "devel/python"
> -HOMEPAGE = "https://pika.readthedocs.io"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
> -
> -SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
> -SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "pika"
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-tornado \
> -    ${PYTHON_PN}-twisted \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
> index a1515881f..c61d47c47 100644
> --- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
> @@ -1,2 +1,22 @@
> -inherit setuptools3
> -require python-pika.inc
> +SUMMARY = "Pika is a RabbitMQ (AMQP 0-9-1) client library for Python."
> +DESCRIPTION = " \
> +Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
> +including RabbitMQ’s extensions. \
> +"
> +SECTION = "devel/python"
> +HOMEPAGE = "https://pika.readthedocs.io"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
> +
> +SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
> +SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "pika"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-tornado \
> +    ${PYTHON_PN}-twisted \
> +"
>
> 

--------------DE78393558F5B8574F790922
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200611090904.29772-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pika.inc   | 22 -----------------
 .../python/python3-pika_1.1.0.bb              | 24 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 22 insertions(&#43;), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pika.inc

diff --git a/meta-python/recipes-devtools/python/python-pika.inc b/meta-python/recipes-devtools/python/python-pika.inc
deleted file mode 100644
index bde154fe7..000000000
--- a/meta-python/recipes-devtools/python/python-pika.inc
&#43;&#43;&#43; /dev/null
@@ -1,22 &#43;0,0 @@
-SUMMARY = &quot;Pika is a RabbitMQ (AMQP 0-9-1) client library for Python.&quot;
-DESCRIPTION = &quot; \
-Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
-including RabbitMQ’s extensions. \
-&quot;
-SECTION = &quot;devel/python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pika.readthedocs.io">&quot;https://pika.readthedocs.io&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=535836bf0a5de515a7bfee026075701d">&quot;file://LICENSE;md5=535836bf0a5de515a7bfee026075701d&quot;</a>
-
-SRC_URI[md5sum] = &quot;6002400cdd33bf85ec8680ece72910d4&quot;
-SRC_URI[sha256sum] = &quot;9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf&quot;
-
-inherit pypi
-
-PYPI_PACKAGE = &quot;pika&quot;
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-tornado \
-    ${PYTHON_PN}-twisted \
-<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-pika_1.1.0.bbb/meta-python/recipes-devtools/python/python3-pika_1.1.0.bbindexa1515881f..c61d47c47100644---a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb@@-1,2&#43;1,22@@-inheritsetuptools3-requirepython-pika.inc&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
index a1515881f..c61d47c47 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
@@ -1,2 &#43;1,22 @@
-inherit setuptools3
-require python-pika.inc
&#43;SUMMARY = &quot;</a>Pika is a RabbitMQ (AMQP 0-9-1) client library for Python.&quot;
&#43;DESCRIPTION = &quot; \
&#43;Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
&#43;including RabbitMQ’s extensions. \
&#43;&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pika.readthedocs.io">&quot;https://pika.readthedocs.io&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=535836bf0a5de515a7bfee026075701d">&quot;file://LICENSE;md5=535836bf0a5de515a7bfee026075701d&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;6002400cdd33bf85ec8680ece72910d4&quot;
&#43;SRC_URI[sha256sum] = &quot;9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;PYPI_PACKAGE = &quot;pika&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-logging \
&#43;    ${PYTHON_PN}-tornado \
&#43;    ${PYTHON_PN}-twisted \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE78393558F5B8574F790922--
