Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.777.1594339905006059041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 17:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdtNYT9/;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b185so3692286qkg.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1oGuxW1Ww4nBFJF0T1dRMthHB53YkTJTDyZ5DZwF2Zc=;
        b=PdtNYT9/eArcGKhkED/74K+zl5x1pbE7dF3vhrHhHbUTE7tYeq3Eaa/xs6aYZNDUMP
         Cx1lC7ju4kQB/SMRaH28hwIR9X1Q6czwIqNzYaRrBjg/ev+JGj732FaVxMby0Q9zi/Nn
         WoewpH1N21IcipHDGmBHc40EKKlzeAIRF0Km4KH5CbliVq1ypxkba8/+JjjFuNgxwZ5K
         CNs7jlLXYSsZrLS/VZNMpI7JJuK9Sjv/hwhHWD87C0m3C/j9XzRpCNU92TpfCFgZb5/8
         HGNLQyaXOpDV+PHy614NfwmQyA5fGgK+Rpk5sT8svudkM1BK4bY0/bWn9h1JIQVKqR+T
         f0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1oGuxW1Ww4nBFJF0T1dRMthHB53YkTJTDyZ5DZwF2Zc=;
        b=ZChVpmzYnVt8w3GHUzgQ2hGHla+YUhoa/AFCnH+Z9t+rrgcOtaRHIi1ks3EdYxpwiV
         fMHMSQjmWF34DW4PuqNLL9Y5ku67gg14EsXQ75OrtROX/M7+P0ay27SZ9mivoRGye/8d
         bF5onqGpcLkI45X7uPrqIArd+/bmCmGWLlADuYlReEU7ruusSqg5Mcm6EKfsE4Famey3
         j9yhqEtTXujcZ6mizN56CGByHYhwbLROer76bRdYD3nkd5FmuQAJiC2hCazvlJGatJIw
         bxDoUcitcRUMS7vr+JT29CfXxIjNG5nkNhcJwaNHgZsU5xzDKUhUzrgELkvJplF/FSA+
         jZgQ==
X-Gm-Message-State: AOAM532DFlQK8zrFS1Q/XZCVq02iG6ntwczAR2PoM83L4jyBRI3d2xT8
	rqq5BdccoOb35Eb0GwPzxwMW/4TRRUubSHERnUIqtMkkFwQ=
X-Google-Smtp-Source: ABdhPJzTE+A1P34SxtVgyOLXn5hXcGuU5+wMRzHt7TjBiZg+rl+5AyghFaKJkAtq535ENi11IL9zo34vRAhQ5+DaDnA=
X-Received: by 2002:a37:6197:: with SMTP id v145mr64896081qkb.225.1594339903871;
 Thu, 09 Jul 2020 17:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200708210048.7409-1-philip@balister.org>
In-Reply-To: <20200708210048.7409-1-philip@balister.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Jul 2020 17:11:18 -0700
Message-ID: <CAMKF1spzX4id_4iAwO6tpcQ_bQrJDd2FOqHprhH4MZf0PcratA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pybind11: Use cmake to build and add -native version
To: Philip Balister <philip@balister.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this fails for 32bit arches on 64bit build hosts see

https://errors.yoctoproject.org/Errors/Details/419353/

On Wed, Jul 8, 2020 at 2:01 PM Philip Balister <philip@balister.org> wrote:
>
>  * Switch to git repo to pick up cmake files for recipes to use
>  * Use cmake to build innstead of pypi so cmake files are included in sysroot
>  * Disable tests to prevent configure failure (I tried adding pytest asa DEPEND)
>  * Patch out cmake that strips output to prevent QA failures
>  * With this I can build gnuradio using pybind11.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../0001-Do-not-strip-binaries.patch               | 39 ++++++++++++++++++++++
>  .../python/python3-pybind11_2.5.0.bb               | 15 +++++++--
>  2 files changed, 51 insertions(+), 3 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
>
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
> index dc3b8f6ad..7dcf71e13 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> @@ -3,7 +3,16 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
>
> -SRC_URI[md5sum] = "5355e1fd05c8eedef19cc9bfd3d82a77"
> -SRC_URI[sha256sum] = "ea5a4e7a880112915463826f1acbec5892df36dfe102ecb249229ac514fb54ad"
> +DEPENDS = "boost"
>
> -inherit pypi setuptools3
> +SRC_URI = "git://github.com/pybind/pybind11.git \
> +           file://0001-Do-not-strip-binaries.patch"
> +SRCREV = "3b1dbebabc801c9cf6f0953a4c20b904d444f879"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native"
> +
> +EXTRA_OECMAKE =  "-DPYBIND11_TEST=OFF"
> +
> +inherit cmake python3native
> --
> 2.13.6
>
> 
