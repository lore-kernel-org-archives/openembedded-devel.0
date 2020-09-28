Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web10.35831.1601297841622107900
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A0BAEOxY;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2/meTrQazf7AuRf60vWy5goC9MPuFHxvyrVUgwb3cewYvDfIItlK9DUf7ZmERIlI7PHQQ+qEO/bqMgiczu4uaMfYdGpw2+KPK6vKz8HjCqzsweURNJhM+FpatJET4bIWSS3jWnRC67aA3aFXJQsaa0WjQbUMUjGCbe7yvoLOuSLBN5Hd1iUbxuoVHktkDQ1gm6rg82xGZJwBn3xHAzf9cvjER6MMjo3osMetlwffJM/SGhI3Ptpsr8aFucPPvcJ4NoO/t1PQ0Ja3UWsgoylJezOJgdxUX8qEvgyR1VXge/UadRu4/iHa3OLs0JBAuU/PeXXRjNuXfoa4LSaPxpfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgG1MN5idmCWaZKockDCT+xVUlNZmyB2GwTxVIo4+dI=;
 b=MNC0OBfmKKb6Hf5VCuIcR78mb/DuZIga/2q8H270zzNGvIU9f4gi+WEz7pMtIHF5++Mr6+V4KVs8CtpFxNouzK24EsBG6Qq8WY0sFlgHdFasNF6RcqFqO2KeDLD788uPxydPht9MX0n44ojiPgf68Vz4ozHXlaxUmIRn+lz+ItnLS8C54+BygkaCrn0FQEcfgxHJoUWacJU82h2vmls1EaUr6VllwjtwH1xkHk9WulpEMP8dAzfnCTR7HatgzkVqaTggXNYfawUtwYsvdKOtp1rSGQquCNZCaDfKyPwSqk+nXJeZQ/6QMXxq8kvfdYGQhvIPNGXc3u9JN0z5kr51vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgG1MN5idmCWaZKockDCT+xVUlNZmyB2GwTxVIo4+dI=;
 b=A0BAEOxYPbwHe9LHA00Y5qwEd9jxdZD5jA0trN4Db54ca3mfw8AyZVUoO1G+yusdz+W2pSY/TMZOestSIS755ojBi6fkicRUDwKD1C5iE8apiDZOA8/S1zOjF1cO6JFu99IZJjbeNtq6jJG2xG6CEtLzY/2s5dveR1PbrkUjs8M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4435.namprd11.prod.outlook.com (2603:10b6:a03:1ce::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 12:57:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:57:20 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-pycrypto: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
 <20200925112321.3195-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <702f8f97-e7cb-925f-9397-14f71a3f3904@windriver.com>
Date: Mon, 28 Sep 2020 08:57:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925112321.3195-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 12:57:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cd8d906-0d1b-4a75-bbfb-08d863ae08c2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4435:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4435820698506EEE53B816D99F350@BY5PR11MB4435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lqJ05SajGx5QcHc342RrKff3mFSkk5LRw/LaXnI8OQwRwFVXefiwt6lwSWZj9vje+UTsVKzec4qzh4jSiGPESiKbMxz6uxcHbcJzCL5PRKX88WLq46YKueBJGfYuIm+iDEBVA9WZV0j0NK2gZeLOZzP+ZN8lT0hkdGvyFSDi1KqkeRULRlXzKXfK+Og7wXBSATAZUy+gFNU0Jl8ul9qbWM/4jUNqgPCjtz/jo/aRtu/n1RQ/Xgr65ykXw/2C5Ls3iSh6ENX+KF277quV50r1oZ1Ry70ecistMAYvi8N0oMVIF7YvrfzTwd7Y4QjN2sOLRdrswQ656XjJ4XQGX5CFHxbCGqE8Bbhs7dFDNRoYRVn2jH2Z3r7FELnlaf4pvSCCIxWPZ+/VbpTKvSsgFl4YMMPGCr2XjJBHaoZlSmOIQ5kbhWHjwR23Ei8UQ3UjVN6KboTR17qA4/7OS8mh0d79Ek+1JiDt28CTJhhUYWNGJrzjpezvl6Pex/Q4EGY06YGI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(6666004)(166002)(86362001)(36756003)(31686004)(956004)(83380400001)(2616005)(16526019)(186003)(6486002)(8936002)(33964004)(8676002)(66476007)(66556008)(66946007)(316002)(16576012)(31696002)(53546011)(26005)(44832011)(2906002)(478600001)(966005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TgDS0Rd9ScEc/3gG+hlDc+YNj3R7frSQ4Sj7sysMYlamdQ0YcJ7hUtR3W9HkLhqb+JHb8Vxlthr8ysb5T7jMYok1MgYDlqLvRToclkUFr1EMDRvP1lnxbd16u3sGbFxDgc8vmFjPuC+lnQlDZ5dRXimbMLHEdLVJfNVY6ZwehIWbbJUWJRGKabUiUF1hNpCT8scwbv5z/7USX9iolYpcntfLGOtWxLfbVowYBTlRRSGrDNnGinQkL8z+wKbQZT7viHrtHGTCtxcN/91ycCHNAHG7led3JS5bKb03qjXuHNh6by3SmmlqlFSPuWUxOlkR9KED6J8fHNRRHjO2JjBhCzobzYTj1s+7zUxRwkRw9Tvdnz4kYYMdrUn6+rC0AKoXeeFF8KV1GmjWhrn8omm8WBirwrXBbQWut376L1n8pNYosc6OyIAzAqygVU6dRhe2EBNUybu1L/6f1JwT4yBdBPj5PcEA6TncfDXpPT9y/BOBcGS4WQwwXt2R+Z79mJIQRU7mkF3Wuq+/LLEoQLMDI0SgpXY/FF2AD7jCwBYLk6nguymnChyP8xuwh/3/1T4CMUnT27qjLx56d9R0s92uM+Lo2w2wRvgyoh8HZJJ4RO4IBK0W8myDL+RAyso9Lk9XQxgniFRNVxA76FmbKFnMLg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd8d906-0d1b-4a75-bbfb-08d863ae08c2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:57:19.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYfD6x0G+lixI6nNlc/nx37azvGhKv8A787qbGVJkAkgwEHlh1Knceb8dvHGZ64clIM1DK1n3WUHhdosgJ6F/uGlts5IKGq17DQbp5w/lqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4435
Content-Type: multipart/alternative;
 boundary="------------18119F4A86CB86C9C58A45C9"
Content-Language: en-US

--------------18119F4A86CB86C9C58A45C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/20 7:23 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-pycrypto.inc                | 21 ----------------
>   .../CVE-2013-7459.patch                       |  0
>   .../cross-compiling.patch                     |  0
>   .../python/python3-pycrypto_2.6.1.bb          | 24 ++++++++++++++++---
>   4 files changed, 21 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pycrypto.inc
>   rename meta-python/recipes-devtools/python/{python-pycrypto => python3-pycrypto}/CVE-2013-7459.patch (100%)
>   rename meta-python/recipes-devtools/python/{python-pycrypto => python3-pycrypto}/cross-compiling.patch (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
> deleted file mode 100644
> index 232cdb7116..0000000000
> --- a/meta-python/recipes-devtools/python/python-pycrypto.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Cryptographic modules for Python."
> -HOMEPAGE = "http://www.pycrypto.org/"
> -LICENSE = "PSFv2"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
> -
> -DEPENDS += " gmp"
> -
> -inherit pypi autotools-brokensep
> -
> -SRC_URI += "file://cross-compiling.patch \
> -            file://CVE-2013-7459.patch \
> -           "
> -
> -SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
> -SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
> -
> -do_compile[noexec] = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch b/meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
> rename to meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
> diff --git a/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
> rename to meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
> diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> index a20eafec43..78a1ef2ac0 100644
> --- a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
> @@ -1,7 +1,23 @@
> -inherit distutils3
> -require python-pycrypto.inc
> +DESCRIPTION = "Cryptographic modules for Python."
> +HOMEPAGE = "http://www.pycrypto.org/"
> +LICENSE = "PSFv2"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
>   
> -SRC_URI += "file://0001-Replace-time.clock-with-time.process_time.patch"
> +DEPENDS += " gmp"
> +
> +export HOST_SYS
> +
> +inherit pypi autotools-brokensep distutils3
> +
> +SRC_URI += "file://cross-compiling.patch \
> +            file://CVE-2013-7459.patch \
> +            file://0001-Replace-time.clock-with-time.process_time.patch \
> +           "
> +
> +SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
> +SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
> +
> +do_compile[noexec] = "1"
>   
>   # We explicitly call distutils_do_install, since we want it to run, but
>   # *don't* want the autotools install to run, since this package doesn't
> @@ -9,3 +25,5 @@ SRC_URI += "file://0001-Replace-time.clock-with-time.process_time.patch"
>   do_install() {
>          distutils3_do_install
>   }
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------18119F4A86CB86C9C58A45C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/20 7:23 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200925112321.3195-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200925112321.3195-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-pycrypto.inc                | 21 ----------------
 .../CVE-2013-7459.patch                       |  0
 .../cross-compiling.patch                     |  0
 .../python/python3-pycrypto_2.6.1.bb          | 24 ++++++++++++++++---
 4 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycrypto.inc
 rename meta-python/recipes-devtools/python/{python-pycrypto =&gt; python3-pycrypto}/CVE-2013-7459.patch (100%)
 rename meta-python/recipes-devtools/python/{python-pycrypto =&gt; python3-pycrypto}/cross-compiling.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
deleted file mode 100644
index 232cdb7116..0000000000
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = &quot;Cryptographic modules for Python.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.pycrypto.org/">&quot;http://www.pycrypto.org/&quot;</a>
-LICENSE = &quot;PSFv2&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d">&quot;file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d&quot;</a>
-
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pycrypto:&quot;
-
-DEPENDS += &quot; gmp&quot;
-
-inherit pypi autotools-brokensep
-
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://cross-compiling.patch\-file://CVE-2013-7459.patch\-">&quot;file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-           &quot;</a>
-
-SRC_URI[md5sum] = &quot;55a61a054aa66812daf5161a0d5d7eda&quot;
-SRC_URI[sha256sum] = &quot;f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c&quot;
-
-do_compile[noexec] = &quot;1&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch b/meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
rename to meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
diff --git a/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
rename to meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
index a20eafec43..78a1ef2ac0 100644
--- a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -1,7 +1,23 @@
-inherit distutils3
-require python-pycrypto.inc
+DESCRIPTION = &quot;Cryptographic modules for Python.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.pycrypto.org/">&quot;http://www.pycrypto.org/&quot;</a>
+LICENSE = &quot;PSFv2&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d">&quot;file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d&quot;</a>
 
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-Replace-time.clock-with-time.process_time.patch">&quot;file://0001-Replace-time.clock-with-time.process_time.patch&quot;</a>
+DEPENDS += &quot; gmp&quot;
+
+export HOST_SYS
+
+inherit pypi autotools-brokensep distutils3
+
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://cross-compiling.patch\+file://CVE-2013-7459.patch\+file://0001-Replace-time.clock-with-time.process_time.patch\+">&quot;file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+            file://0001-Replace-time.clock-with-time.process_time.patch \
+           &quot;</a>
+
+SRC_URI[md5sum] = &quot;55a61a054aa66812daf5161a0d5d7eda&quot;
+SRC_URI[sha256sum] = &quot;f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c&quot;
+
+do_compile[noexec] = &quot;1&quot;
 
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
@@ -9,3 +25,5 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-Replace-time.clock-with-time.process_time.patch">&quot;file://0001-Replace-time.clock-with-time.process_time.patch&quot;</a>
 do_install() {
        distutils3_do_install
 }
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------18119F4A86CB86C9C58A45C9--
