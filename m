Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.41])
 by mx.groups.io with SMTP id smtpd.web11.2836.1591818680082242211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ob4rM2Cn;
 spf=pass (domain: windriver.com, ip: 40.107.92.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nX6clhuMnt5vjv8J5vf4ZZvINj2HtB9Ek1Xy48X35hMen7dDXZVN1qxQ5A3T/SdQIIhJ77KrDmela3naHVRPJcAkPRRl/405xjKWXojkuu4kCDi76Y88HCpG3XBtedG1BkDYRd61GkuF4Qzlspw7Daz6jEguuRC+L7A33AmHpYFblNxe7iMEHNJTZSKVNlPQ6Hh+MycrsW+SbnAJDn4MYfYYclNGvcp7Z8FRjIvZ+8ooLqj5hGjGruykB2s648XKBucHbG01hZnmIS48HKxS79HMh6Ks6TXgj1wXo//W1nxLKUNcpKEefYtafBeINKc72aDaVABTq0F6f6U2qWf8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqxL9QeX/bMoOpoRdnGHitciSxIHm0dlvIDVhjla644=;
 b=IOsmzGW55j4xHy9rRptfi7k+fKLtd7E8JEYd5duIlpNQRE134XSfUpvHLHU8Ujys/uz5h2u6dXXh6v2rj6QzKl/KLfnOSh3kKnNbJwZyrCXYwTTwfZlP9gGyQ/up9saOnPqtb1dqwi61lSkMiCbL59FxIPY7KyuiBQDQ9aWZdmM0uJRyxW3GFj9AX3/yHBX+3A37eNzT6PEpJJhDR1J3oGPyNnkgLdV3g7FRnuoQhLrV4pWnpnR+6zbLUeYWvZdyRfo9e8NKONrt98bSC+kd9+YfBnMogQRyFapiwW50wOo3wsw4fBj9g+4Us3cqRdF6m5xdh04eZObi6n1mP9SU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqxL9QeX/bMoOpoRdnGHitciSxIHm0dlvIDVhjla644=;
 b=ob4rM2CnQzYXM2Vzptbwy5LX9macelnKBbMP12lsaLSA9j7rG3s5VdfypQ59sln2XSfEST00MNfOQwGu/ke57FbdQER/1Eefl1OUH2cUi0edpHE7QvXIJNdZ/NHn85n0X3upuNDBX3XNFn2hsOpVDyfhFyC/mNvzOf/TP2c+Em8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:51:18 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:51:18 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-oauthlib: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609091121.23832-1-leon.anavi@konsulko.com>
 <20200609091121.23832-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <caf68945-27c5-fe4c-5094-2b94fe705f58@windriver.com>
Date: Wed, 10 Jun 2020 15:51:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609091121.23832-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::36) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:51:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 840b1fb0-fc0b-40ab-2f5b-08d80d77a483
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39247F8CF899888F9D952BC09F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c3brRzMWd7Lj57UOTl8PSBn/JD2GYtaSD886ncyzquhxt31Il7Y9BLYnIkWLHiUtlNf8rPi1TL8prnbDOu7G0KEo+PbsysTUYr+mIn/gkNAoayhXq30puqYSb8hwIgZ7d2abyUIwKsxrdvkzuDIqkhSkKLpkRdCMuqwEac0cxn/IHanCy1ZDmwA4DqJzizuQQiU7AevaFyHrwrq043KOXdV7xrBgMewVABq4QXbW6H+XXdtttpBYDNsYf5l0Xk99LtLWvRs9viqN/ZnCqGwk6h6o9hyjztoBQ7n0ERih8ED+8GFODCf1pnU9x+xaHJLZQsIz/E1VfqlGLdZPm5FXoeywY7EC4leoZO4WJiOeeb/PMzCb6vKGXI7dnvqWLdi7O08d6G/i+AqS7Z8uGDUi9xIwOJU7QXGjYaIazdFb6KVzL9d248YieETL7vn5rTZvEaWlvF2DMfr6gZeNJxmFiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LqQqT1k2VtI8DFM9fWh0hdUFonR482zhtuQSTOgw5MZ2rJE127zDsfFNZMXFuvX/dKL+ct8W6xb6hLlxS1cBzrPXyZu0I4FBLN3JB3WG11jK9M8M0LfRfq3XSRzk3jfWGEOYsGcQepiN0QR59CQ+mHE50YEMrqyZf9KQGXOcgTdq/OMhTZFims3Czfl3/zGq+mGcvPs1rq27je8+iinC+BOKy8fMCAFozJBzMsYaxWCj4UtJFPNkFwRjYb55mAsAiURhY1RsBWfXvMRtM/GIyj0HoJMwL5YaLAOe7T7NXE2bC7SqEb/rHb5Yf0xKtk5s+tTE9GHTWL6Ir6GBBkbe29RGE14j9Tsjnj2MAFGWlyU4M3ex9QQ1cMcjgs7QiaJ2+FKW+LmN9U0krYbFTM1VpvDjDFAv1A6eAWtJz4eaEHpvnjOR1wnVBaSNAwUJHdDXyya5w6XU0tvOog8qp/HagfeW8uSHJG7mAUfUSBRxNADNQD4RcxkbsBztelkfZeCe
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840b1fb0-fc0b-40ab-2f5b-08d80d77a483
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:51:18.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrul/rUX3IOP/lvvstERQgGbnELvCOFquBnwh8OMBWEhLk2a5Et+9KkLert8YgQr5DoFZ3pGnwiKHLaQOsEAq24xUp/zagvgeiurMnQFRoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------C9EF236A8A0566465418670A"
Content-Language: en-US

--------------C9EF236A8A0566465418670A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 5:11 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file. Inherit pypi.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-oauthlib.inc                | 25 -------------------
>   .../python/python3-oauthlib_2.0.6.bb          | 25 +++++++++++++++++--
>   2 files changed, 23 insertions(+), 27 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-oauthlib.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-oauthlib.inc b/meta-python/recipes-devtools/python/python-oauthlib.inc
> deleted file mode 100644
> index fea071449..000000000
> --- a/meta-python/recipes-devtools/python/python-oauthlib.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
> -HOMEPAGE = "https://github.com/idan/oauthlib"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
> -
> -SRC_URI = "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
> -SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
> -SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
> -
> -S = "${WORKDIR}/oauthlib-${PV}"
> -
> -# The following configs & dependencies are from setuptools extras_require.
> -# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
> -# The upstream names may not correspond exactly to bitbake package names.
> -#
> -# Uncomment this line to enable all the optional features.
> -#PACKAGECONFIG ?= "test signedtoken signals rsa"
> -PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
> -PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
> -PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
> -PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest"
> -
> diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
> index da13b55d8..73fd30cb3 100644
> --- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
> @@ -1,2 +1,23 @@
> -inherit setuptools3
> -require python-oauthlib.inc
> +SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
> +HOMEPAGE = "https://github.com/idan/oauthlib"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
> +
> +SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
> +SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
> +
> +inherit pypi setuptools3
> +
> +# The following configs & dependencies are from setuptools extras_require.
> +# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
> +# The upstream names may not correspond exactly to bitbake package names.
> +#
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?= "test signedtoken signals rsa"
> +PACKAGECONFIG[test] = ",,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt"
> +PACKAGECONFIG[signedtoken] = ",,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt"
> +PACKAGECONFIG[signals] = ",,,${PYTHON_PN}-blinker"
> +PACKAGECONFIG[rsa] = ",,,${PYTHON_PN}-cryptography"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest"
>
> 

--------------C9EF236A8A0566465418670A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 5:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609091121.23832-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file. Inherit pypi.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609091121.23832-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-oauthlib.inc                | 25 -------------------
 .../python/python3-oauthlib_2.0.6.bb          | 25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 23 insertions(&#43;), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-oauthlib.inc

diff --git a/meta-python/recipes-devtools/python/python-oauthlib.inc b/meta-python/recipes-devtools/python/python-oauthlib.inc
deleted file mode 100644
index fea071449..000000000
--- a/meta-python/recipes-devtools/python/python-oauthlib.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-SUMMARY = &quot;A generic, spec-compliant, thorough implementation of the OAuth request-signing logic&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/idan/oauthlib">&quot;https://github.com/idan/oauthlib&quot;</a>
-
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5ba9ce41463615e082609806255bce1b">&quot;file://LICENSE;md5=5ba9ce41463615e082609806255bce1b&quot;</a>
-
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz">&quot;https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz&quot;</a>
-SRC_URI[md5sum] = &quot;277a9a966cc8c72e492b4eeb41332445&quot;
-SRC_URI[sha256sum] = &quot;ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1&quot;
-
-S = &quot;${WORKDIR}/oauthlib-${PV}&quot;
-
-# The following configs &amp; dependencies are from setuptools extras_require.
-# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
-# The upstream names may not correspond exactly to bitbake package names.
-#
-# Uncomment this line to enable all the optional features.
-#PACKAGECONFIG ?= &quot;test signedtoken signals rsa&quot;
-PACKAGECONFIG[test] = &quot;,,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt&quot;
-PACKAGECONFIG[signedtoken] = &quot;,,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt&quot;
-PACKAGECONFIG[signals] = &quot;,,,${PYTHON_PN}-blinker&quot;
-PACKAGECONFIG[rsa] = &quot;,,,${PYTHON_PN}-cryptography&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest&quot;
-
diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
index da13b55d8..73fd30cb3 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
@@ -1,2 &#43;1,23 @@
-inherit setuptools3
-require python-oauthlib.inc
&#43;SUMMARY = &quot;A generic, spec-compliant, thorough implementation of the OAuth request-signing logic&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/idan/oauthlib">&quot;https://github.com/idan/oauthlib&quot;</a>
&#43;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5ba9ce41463615e082609806255bce1b">&quot;file://LICENSE;md5=5ba9ce41463615e082609806255bce1b&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;277a9a966cc8c72e492b4eeb41332445&quot;
&#43;SRC_URI[sha256sum] = &quot;ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;# The following configs &amp; dependencies are from setuptools extras_require.
&#43;# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
&#43;# The upstream names may not correspond exactly to bitbake package names.
&#43;#
&#43;# Uncomment this line to enable all the optional features.
&#43;#PACKAGECONFIG ?= &quot;test signedtoken signals rsa&quot;
&#43;PACKAGECONFIG[test] = &quot;,,,${PYTHON_PN}-blinker ${PYTHON_PN}-cryptography ${PYTHON_PN}-nose ${PYTHON_PN}-pyjwt&quot;
&#43;PACKAGECONFIG[signedtoken] = &quot;,,,${PYTHON_PN}-cryptography ${PYTHON_PN}-pyjwt&quot;
&#43;PACKAGECONFIG[signals] = &quot;,,,${PYTHON_PN}-blinker&quot;
&#43;PACKAGECONFIG[rsa] = &quot;,,,${PYTHON_PN}-cryptography&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-core ${PYTHON_PN}-crypt ${PYTHON_PN}-datetime ${PYTHON_PN}-json ${PYTHON_PN}-logging ${PYTHON_PN}-math ${PYTHON_PN}-netclient ${PYTHON_PN}-unittest&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C9EF236A8A0566465418670A--
