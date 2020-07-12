Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.76])
 by mx.groups.io with SMTP id smtpd.web11.2198.1594578146905468703
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 11:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LsqaPPEO;
 spf=pass (domain: windriver.com, ip: 40.107.94.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwp2uWb1fmyO3edvnGafWMzbaD0xlc4fODInXOx6bDCwlwwkQRW0VV4vBac1+92YXgl7h13JL2F9JR6K8sE0Ox74rKjl5OHKtN1F5jIfrcaP4YFdwSJiSNuSJMCvRsEYkuo6vrMPHwsGay69nbl9EEwz/JINENSkhb3ia16vmQtmEPDZ324vNsOnEYFeiGf41+WY2URdvE75wvhDMPHhTtIXK1sSnqz1UY50QPcHVbRm86/xjCrJRfcZeAPtkfuNye+LmChd7aNUn37xnoC4KsUOo3BquEZv/tMARLVugVtWZoQxqvEAgAqx8mPw/hLAShNZ/XmTGH8RrUpioEWukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvp0nhl0o/BrDAOrGDPkIUVeVOtq4mitQn0GYVyukUU=;
 b=lkKdcTLpGvxQIBGkw9Ho5kA4AZatb7g7s8JIGT82XuMuU7maPQi1KJZ4k5CLVBrL4Thn0YpILEpfcEeLzJGQwNJRwxjnZWIFP7P4pyVbqHxk5RpEvno10U0Fzrz4dUjaTGXTOO+SK5IFphYCHY/bt3u5CCQ9GlbjnFTUzcbD9QKRfkpyOsi3cGvEmNH3ySjQaEtmHfnMQTA7VCVO2cgUlV+Zn51GLrxD4pIN6Z3SQwy27C0aGWI/Dbu//P5HSA4L+0+t/NKU4FTglI/myoVACGZ8MpfAkPnkuDhjVImcSOw5u7hBW/0MtQ/qoET3apnOSwzp+eSPseFtjs7KMRkUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvp0nhl0o/BrDAOrGDPkIUVeVOtq4mitQn0GYVyukUU=;
 b=LsqaPPEO2l32AiR78D/3Du5wHob2kcJybkxinK409zTbqEwgCGgBGfl+p0mz8bxQOxutK7wF6hQH72g5hf9loSdyjZpO0PGjKM3z6cf4wE3o6BQvPkj6cfYu1XChgxq3f/1MEB5xx+g7JB8osCuF7HRCzzvU/t5TT+jF1aAOnHY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2844.namprd11.prod.outlook.com (2603:10b6:5:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.23; Sun, 12 Jul 2020 18:22:25 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3174.025; Sun, 12 Jul 2020
 18:22:25 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-pybind11: Use cmake to build and add -native version
To: Philip Balister <philip@balister.org>,
 openembedded-devel@lists.openembedded.org
References: <20200710161906.7297-1-philip@balister.org>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c07e2716-6c91-e4e9-fdcf-970f251632ae@windriver.com>
Date: Sun, 12 Jul 2020 14:22:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710161906.7297-1-philip@balister.org>
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Sun, 12 Jul 2020 18:22:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d9c0a28-1de4-419a-c620-08d826908683
X-MS-TrafficTypeDiagnostic: DM6PR11MB2844:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB28446900750E78DB99A0BE2F9F630@DM6PR11MB2844.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	auCpfjc41wcWleKjzrVXGIZoYKjEbixQhbM8bsMgqRJW5D6zJTxhvUWASQjn0pP0z6YHJPKG9cg+RKi9yXzggnp2id6iDt0SIDvc9O987Lt4IoO05Hv/ei2RARujt+xJJhVgr0LSjjUat7MmfVv+t4MUrkZHZdrqm6nrdMDOkHJ607XhtN8voDfUB7qDWhsvGBPhQ5wwpsLkafXZ0VbBbBclsohCkxbZwYOs2YX5jS96WE3lGSVzFFXuunZsmEcJxLd45c8kmgqC5ytqWIlT5uk9OATtaGGgnZr1fBXWMRbgPtChfK1Qp4kDhsuBGJkr06K1/BCHp4cQyRSCKFBNtUuOeE9ei8PKXe/8cX6NUI2KDOz4OTyhcePX6bobke2+G3ghYJSzc3/wNzQOBchOd1eIIa0WU2QNGSIdVaxhEQguhq5lNB4uSGd8pg6yG8USXfphUqK8CJ8VepzW5D8FeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(39830400003)(376002)(346002)(396003)(86362001)(30864003)(31696002)(31686004)(66946007)(52116002)(66476007)(5660300002)(16576012)(316002)(66556008)(26005)(966005)(478600001)(33964004)(53546011)(8676002)(8936002)(6486002)(36756003)(2616005)(44832011)(956004)(83380400001)(16526019)(186003)(2906002)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CVIpwy7iwwhB3qe0AyoMORXAlAwJ/jOH+kK7LDwUJ35FjBuMBIubEoqD1TOz0SNmMlwVo/XCE7jfMxNfxankqDT5W8JicwHHoSk7UJKHTTEVC7H/UWDnjoJIFTq+8fuQmqsm4zjPz39u/J1+kXDKU5Fu13Rxq+8r+lfCWGZfcIrOO3k1K5htpONalyIeHGx5IhDFwy//Vq5NApCI9bXvyCQrdbHl8skDJa96QGTQtnPz9GAM9ZS2dHL4qUxBCYJl75k3W4p6RA24L8D1bCoUxl/WFcf/T2hMhPpT0bCOP02zpjiFXCJN6ZM06iN22R2xZlxCzKqeXhXM1EgomiX/kNytwIW8Z2WhMCcuvnoJIwy0F08eUj0H6x3UzoMU345qaxtLCo12vHl5zDC4OA8kPCJl1o9ktiiDTIuy/LENUWuPFdBR7H9LMMKyGM15pnaNwIGPhp1+aOSKUt3iMlmcmrExT+s2z9Y7s1J8pFOCrmw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9c0a28-1de4-419a-c620-08d826908683
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2020 18:22:24.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sS8iYIvMAHFqrQs/pb4lqVO1Apvu1H9CaR7NcXrxigBXImo9usWzXfYbQyEMxmjTHDFa+R6vCF//OMMyYD6/jNixHA5spTDpY6yDaiwy5bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2844
Content-Type: multipart/alternative;
 boundary="------------3163D35E51B339FB9EF460BD"
Content-Language: en-US

--------------3163D35E51B339FB9EF460BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 12:19 PM, Philip Balister wrote:
>   * Switch to git repo to pick up cmake files for recipes to use
>   * Use cmake to build innstead of pypi so cmake files are included in sysroot
>   * Disable tests to prevent configure failure (I tried adding pytest asa DEPEND)
>   * Patch out cmake that strips output to prevent QA failures
>   * Do not check pointer length for installed python when cross compiling.
>   * With this I can build gnuradio using pybind11.
>
> Signed-off-by: Philip Balister <philip@balister.org>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t-check-pointer-size-when-cross-compiling.patch | 30 +++++++++++++++++
>   .../0001-Do-not-strip-binaries.patch               | 39 ++++++++++++++++++++++
>   .../python/python3-pybind11_2.5.0.bb               | 17 ++++++++--
>   3 files changed, 83 insertions(+), 3 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
> new file mode 100644
> index 000000000..6455c95e7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
> @@ -0,0 +1,30 @@
> +From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@balister.org>
> +Date: Fri, 10 Jul 2020 10:14:59 -0400
> +Subject: [PATCH] Do not check pointer size when cross compiling.
> +
> +It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
> +| CMake Error at tools/FindPythonLibsNew.cmake:127 (message):
> +|   Python config failure: Python is 64-bit, chosen compiler is 32-bit
> +
> +Signed-off-by: Philip Balister <philip@balister.org>
> +---
> + tools/FindPythonLibsNew.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
> +index d0c8fa2..8479e70 100644
> +--- a/tools/FindPythonLibsNew.cmake
> ++++ b/tools/FindPythonLibsNew.cmake
> +@@ -123,7 +123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
> +
> + # Make sure the Python has the same pointer-size as the chosen compiler
> + # Skip if CMAKE_SIZEOF_VOID_P is not defined
> +-if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> ++if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> +     if(PythonLibsNew_FIND_REQUIRED)
> +         math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
> +         math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
> +--
> +2.25.4
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
> new file mode 100644
> index 000000000..07ab9a03b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
> @@ -0,0 +1,39 @@
> +From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@balister.org>
> +Date: Wed, 8 Jul 2020 09:41:43 -0400
> +Subject: [PATCH] Do not strip binaries.
> +
> + * OpenEmbedded strips them after creating debug packages.
> +
> +Signed-off-by: Philip Balister <philip@balister.org>
> +---
> + tools/pybind11Tools.cmake | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
> +index a3603ab..b4c8f63 100644
> +--- a/tools/pybind11Tools.cmake
> ++++ b/tools/pybind11Tools.cmake
> +@@ -230,19 +230,6 @@ function(pybind11_add_module target_name)
> +
> +   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
> +
> +-  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
> +-    # Strip unnecessary sections of the binary on Linux/Mac OS
> +-    if(CMAKE_STRIP)
> +-      if(APPLE)
> +-        add_custom_command(TARGET ${target_name} POST_BUILD
> +-                           COMMAND ${CMAKE_STRIP} -x $<TARGET_FILE:${target_name}>)
> +-      else()
> +-        add_custom_command(TARGET ${target_name} POST_BUILD
> +-                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
> +-      endif()
> +-    endif()
> +-  endif()
> +-
> +   if(MSVC)
> +     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
> +     # needed for bigger binding projects due to the limit to 64k addressable sections
> +--
> +2.25.4
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> index dc3b8f6ad..46bba8d8d 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> @@ -3,7 +3,18 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>   
> -SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
> -SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
> +DEPENDS = "boost"
>   
> -inherit pypi setuptools3
> +SRC_URI = "git://github.com/pybind/pybind11.git \
> +           file://0001-Do-not-strip-binaries.patch \
> +           file://0001-Do-not-check-pointer-size-when-cross-compiling.patch \
> +          "
> +SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native"
> +
> +EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
> +
> +inherit cmake python3native
>
> 

--------------3163D35E51B339FB9EF460BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 12:19 PM, Philip Balister
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710161906.7297-1-philip@balister.org">
      <pre class="moz-quote-pre" wrap=""> * Switch to git repo to pick up cmake files for recipes to use
 * Use cmake to build innstead of pypi so cmake files are included in sysroot
 * Disable tests to prevent configure failure (I tried adding pytest asa DEPEND)
 * Patch out cmake that strips output to prevent QA failures
 * Do not check pointer length for installed python when cross compiling.
 * With this I can build gnuradio using pybind11.

Signed-off-by: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710161906.7297-1-philip@balister.org">
      <pre class="moz-quote-pre" wrap="">
---
 ...t-check-pointer-size-when-cross-compiling.patch | 30 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../0001-Do-not-strip-binaries.patch               | 39 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../python/python3-pybind11_2.5.0.bb               | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 3 files changed, 83 insertions(&#43;), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
new file mode 100644
index 000000000..6455c95e7
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-check-pointer-size-when-cross-compiling.patch
@@ -0,0 &#43;1,30 @@
&#43;From 3abfa65517959ad279481021fafefba28f955e76 Mon Sep 17 00:00:00 2001
&#43;From: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
&#43;Date: Fri, 10 Jul 2020 10:14:59 -0400
&#43;Subject: [PATCH] Do not check pointer size when cross compiling.
&#43;
&#43;It is reasonable to build for 32 machine on a 64 bit build machine. Prevents:
&#43;| CMake Error at tools/FindPythonLibsNew.cmake:127 (message):
&#43;|   Python config failure: Python is 64-bit, chosen compiler is 32-bit
&#43;
&#43;Signed-off-by: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
&#43;---
&#43; tools/FindPythonLibsNew.cmake | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/tools/FindPythonLibsNew.cmake b/tools/FindPythonLibsNew.cmake
&#43;index d0c8fa2..8479e70 100644
&#43;--- a/tools/FindPythonLibsNew.cmake
&#43;&#43;&#43;&#43; b/tools/FindPythonLibsNew.cmake
&#43;@@ -123,7 &#43;123,7 @@ list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
&#43; 
&#43; # Make sure the Python has the same pointer-size as the chosen compiler
&#43; # Skip if CMAKE_SIZEOF_VOID_P is not defined
&#43;-if(CMAKE_SIZEOF_VOID_P AND (NOT &quot;${PYTHON_SIZEOF_VOID_P}&quot; STREQUAL &quot;${CMAKE_SIZEOF_VOID_P}&quot;))
&#43;&#43;if((NOT CMAKE_CROSSCOMPILING) AND CMAKE_SIZEOF_VOID_P AND (NOT &quot;${PYTHON_SIZEOF_VOID_P}&quot; STREQUAL &quot;${CMAKE_SIZEOF_VOID_P}&quot;))
&#43;     if(PythonLibsNew_FIND_REQUIRED)
&#43;         math(EXPR _PYTHON_BITS &quot;${PYTHON_SIZEOF_VOID_P} * 8&quot;)
&#43;         math(EXPR _CMAKE_BITS &quot;${CMAKE_SIZEOF_VOID_P} * 8&quot;)
&#43;-- 
&#43;2.25.4
&#43;
diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
new file mode 100644
index 000000000..07ab9a03b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
@@ -0,0 &#43;1,39 @@
&#43;From 918f3ef01c7a67f3beb67307966698474f144581 Mon Sep 17 00:00:00 2001
&#43;From: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
&#43;Date: Wed, 8 Jul 2020 09:41:43 -0400
&#43;Subject: [PATCH] Do not strip binaries.
&#43;
&#43; * OpenEmbedded strips them after creating debug packages.
&#43;
&#43;Signed-off-by: Philip Balister <a class="moz-txt-link-rfc2396E" href="mailto:philip@balister.org">&lt;philip@balister.org&gt;</a>
&#43;---
&#43; tools/pybind11Tools.cmake | 13 -------------
&#43; 1 file changed, 13 deletions(-)
&#43;
&#43;diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
&#43;index a3603ab..b4c8f63 100644
&#43;--- a/tools/pybind11Tools.cmake
&#43;&#43;&#43;&#43; b/tools/pybind11Tools.cmake
&#43;@@ -230,19 &#43;230,6 @@ function(pybind11_add_module target_name)
&#43; 
&#43;   _pybind11_add_lto_flags(${target_name} ${ARG_THIN_LTO})
&#43; 
&#43;-  if (NOT MSVC AND NOT ${CMAKE_BUILD_TYPE} MATCHES Debug|RelWithDebInfo)
&#43;-    # Strip unnecessary sections of the binary on Linux/Mac OS
&#43;-    if(CMAKE_STRIP)
&#43;-      if(APPLE)
&#43;-        add_custom_command(TARGET ${target_name} POST_BUILD
&#43;-                           COMMAND ${CMAKE_STRIP} -x $&lt;TARGET_<a class="moz-txt-link-freetext" href="FILE:$">FILE:$</a>{target_name}&gt;)
&#43;-      else()
&#43;-        add_custom_command(TARGET ${target_name} POST_BUILD
&#43;-                           COMMAND ${CMAKE_STRIP} $&lt;TARGET_<a class="moz-txt-link-freetext" href="FILE:$">FILE:$</a>{target_name}&gt;)
&#43;-      endif()
&#43;-    endif()
&#43;-  endif()
&#43;-
&#43;   if(MSVC)
&#43;     # /MP enables multithreaded builds (relevant when there are many files), /bigobj is
&#43;     # needed for bigger binding projects due to the limit to 64k addressable sections
&#43;-- 
&#43;2.25.4
&#43;
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index dc3b8f6ad..46bba8d8d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -3,7 &#43;3,18 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wjakob/pybind11">&quot;https://github.com/wjakob/pybind11&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62">&quot;file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62&quot;</a>
 
-SRC_URI[md5sum] = &quot;5355e1fd05c8eedef19cc9bfd3d82a77&quot;
-SRC_URI[sha256sum] = &quot;ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad&quot;
&#43;DEPENDS = &quot;boost&quot;
 
-inherit pypi setuptools3
&#43;SRC_URI = &quot;git://github.com/pybind/pybind11.git \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Do-not-strip-binaries.patch">file://0001-Do-not-strip-binaries.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Do-not-check-pointer-size-when-cross-compiling.patch">file://0001-Do-not-check-pointer-size-when-cross-compiling.patch</a> \
&#43;          &quot;
&#43;SRCREV = &quot;3b1dbebabc801c9cf6f0953a4c20b904d444f879&quot;
&#43;
&#43;S = &quot;${WORKDIR}/git&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native&quot;
&#43;
&#43;EXTRA_OECMAKE =  &quot;-DPYBIND11_TEST=OFF&quot;
&#43;
&#43;inherit cmake python3native
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3163D35E51B339FB9EF460BD--
