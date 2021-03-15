Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1439.1615834045152187983
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 11:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IlJeZWpg;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso13877pjd.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ywwvfpBHW9vxaoJK1AFgKUBTrO1QmdkAkJtZ2RTu4RY=;
        b=IlJeZWpgkiGnlOclpEbPPdpipVlO/2JquOzVJSR0HjXfcu4suDRS9kVT/qVDjODM17
         jUrXP5HuQIDxJXOxYIttPmTj0cxxwmnFtG1yMOhTagiHCM26VZngPxgrUciTxJlkHcGN
         NJR5t5kmQ93RDmN0bR8bJaGSI7+tXwRXhJqAJiqQP+P/Yehn22g7OH9V0DPx/VYjZmF0
         KZj9iLAuu3Cooy+yZzdaWWdYvxEJ97+FUI3VSdF48LRUna+6VpCVkU4tYYZwozpMVs/8
         3rGkMjhj+XhBhNjW3gFGHb1I4o3WizRFt64owJrMFtfTNkw+GA5Qi+ZKRDJHeXDrHe3R
         Ambg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ywwvfpBHW9vxaoJK1AFgKUBTrO1QmdkAkJtZ2RTu4RY=;
        b=I8JQoIGdFUk3JQTQUgCFGK1xkM878WbjOI3uS3PcslzOczSiKgk3Uw8ToyoYBwpYWX
         cL3YzOq06IHDH6RoerX7Ef9oY/1SqiXqUzHqhcWnV9IY78wjN2q4E4AZsAjdxRuoPYLI
         eyyOBDy/8duQ/fYAc+NCtral98xBg/cAQ6GRkcuPIr/DxE1PgZDGTml/QoUQ9UT4EBtl
         2Mb4+YHbkMxNe6bINkz72lrFO8LQVKJfNRWfE/EZkv7J95+Jy+5ExgtRlZWzzjn/R/Ie
         QrD9GaOsUaxcEnTCwoQBD8hFPz0rf8e7OM6ErRDVqyk75xmuq/+6EIf00SBbG03SuRAd
         AXXg==
X-Gm-Message-State: AOAM532CgZewIXmlubegzW7qiPrbzgLBky/FR+O3OuRuFAMGIxMiXARX
	LeNGrZZD8W/hnikYJpRwjfb5d4PCGFgChA==
X-Google-Smtp-Source: ABdhPJyAzk9KVvk7nmAPj253pAXrTrB5iFiXJQ7yJBDsiNvVwCxNPIUf3JtBTt1h2y7LDgTANy6baA==
X-Received: by 2002:a17:90a:d497:: with SMTP id s23mr494607pju.148.1615834044189;
        Mon, 15 Mar 2021 11:47:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::c2dd? ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id g5sm15771196pfb.77.2021.03.15.11.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 11:47:23 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] tclap: upgrade 1.2.2 -> 1.4.0
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315155528.1471897-1-Randy.MacLeod@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <39e112d5-79f7-da6b-4d26-4824b8201785@gmail.com>
Date: Mon, 15 Mar 2021 11:47:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315155528.1471897-1-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/15/21 8:55 AM, Randy MacLeod wrote:
> Project switched from autotools to CMake so drop the Makefile.am patch.
> The COPYING file copyright years were updated. Add description.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../tclap/Makefile.am-disable-docs.patch      | 31 -------------------
>   meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb | 16 ----------
>   meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb | 22 +++++++++++++
>   3 files changed, 22 insertions(+), 47 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
>   delete mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
>   create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> 
> diff --git a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
> deleted file mode 100644
> index 358cbefdd..000000000
> --- a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
> -From: Ting Liu <b28495@freescale.com>
> -Date: Mon, 15 Apr 2013 16:28:37 +0800
> -Subject: [PATCH] Makefile.am: disable docs
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -docs need some generating tool (for example, doxygen) from host which may
> -be not available. Disable it to avoid build issue.
> -
> -Signed-off-by: Ting Liu <b28495@freescale.com>
> ----
> - Makefile.am |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 0a6ebc9..6b42f41 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,7 +1,7 @@
> -
> - ACLOCAL_AMFLAGS = -I config
> -
> --SUBDIRS = include examples docs tests msc config
> -+SUBDIRS = include examples tests msc config
> -
> - pkgconfigdir = $(libdir)/pkgconfig
> - pkgconfig_DATA = $(PACKAGE).pc
> ---
> -1.7.5
> -
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
> deleted file mode 100644
> index bba8d5c21..000000000
> --- a/meta-oe/recipes-devtools/tclap/tclap_1.2.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY = "Templatized C++ Command Line Parser"
> -HOMEPAGE = "http://tclap.sourceforge.net/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0ca8b9c5c5445cfa7af7e78fd27e60ed"
> -
> -SRCREV = "ec3ddcfe41b0544a4551a57439b6b3682fe31479"
> -SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.2 \
> -    file://Makefile.am-disable-docs.patch \
> -"
> -
> -S = "${WORKDIR}/git"
> -inherit autotools
> -
> -ALLOW_EMPTY_${PN} = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> new file mode 100644
> index 000000000..13f66e47d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.4.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Templatized C++ Command Line Parser"
> +HOMEPAGE = "http://tclap.sourceforge.net/"
> +DESCRIPTION = "TCLAP is a small, flexible library that provides a simple interface \
> +for defining and accessing command line arguments. It was intially inspired by the \

typo - initially

> +user friendly CLAP libary. The difference is that this library is templatized, so \

typo - library

> +the argument class is type independent. Type independence avoids identical-except-for-type \
> +objects, such as IntArg, FloatArg, and StringArg. While the library is not strictly \
> +compliant with the GNU or POSIX standards, it is close. \
> +"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5c64b2e8cc50917b2744a90950faa7cd"
> +
> +SRCREV = "799a8b1f99818e39fee19d0601030770af1221e1"
> +SRC_URI = "git://git.code.sf.net/p/tclap/code;branch=1.4 \
> +"
> +
> +S = "${WORKDIR}/git"
> +inherit cmake
> +
> +ALLOW_EMPTY_${PN} = "1"

is this still needed ?

> +
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
