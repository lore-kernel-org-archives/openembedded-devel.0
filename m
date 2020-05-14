Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.14879.1589470478606814731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V6OMmWiX;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 190so3413622qki.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAGiLlp4Z3ydvW0RCexn7NSODEaMVtamtI9UAjZfx3Q=;
        b=V6OMmWiXdnN56ISpIidqVrw6q8Ub+M8KqJV+vfmddpO4KIFvFcin7ebdWvOnZ1FCQx
         GLZHyDN1oEIAyhKdlqO5r7yFikM3/rd1ctFSwepWL6UdOWlMSv1NLrWvFbowjOXpoR3M
         0BASN85cIXlaoFt8O/viuIwpDtnntvlKAjmhkfZCc9Fj/ag4So3zKzKw40kiTPZBgqle
         NYuWQf+dsrGr2G3xz2+guJODNzC6twtXvcMb8y1DQSxPsrSm8m0dFDQQOGMOJtveGtDU
         2fMZJI2nIb7AELuUBBoi2FZBYqwDGYDaCQ6Y+TFPPlfkyiujcreqNbcgSvwHg44w2MmI
         ecrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAGiLlp4Z3ydvW0RCexn7NSODEaMVtamtI9UAjZfx3Q=;
        b=Tf8scZ+QJtFrCCyE4aSSfk3cK8dJ9AlGm3uwy5jiAfFeUvxlEyLXOLfJ2wIsXxgskr
         o/1HjWPsQKlZihKJxTb5Xpb/UCzmjA6STxOq3L80rYDeGwGNQZ36sDyCNlk8gqpqQPMD
         ZWa6XAn4i13Y3YWHhD3pUk0aOOPMjhiULVTfz78/ugXTwcDP5lz7OTsvpbC3CIKjBNXK
         HlP7GcWJZMKwyEtABz/ZFXUGAV6EQf4fBr2jRc6j9ySKBdYb0fNVbUs6pj1tSZvvXjd4
         fSgQcMsD9QuTXclr5IbWlujlKdP3xsK22EURWCOZB/FdAAYnkTBeYciY+4EQCviXGdP7
         yfkQ==
X-Gm-Message-State: AOAM531MUrldnuDhPBW6qfnYYLTXuUZL3Qw7a4ummILeOFWorxq55n2B
	1WMYsNVZxPStAOCDpDSEFrAuaLrJgF4aQp3FBMc=
X-Google-Smtp-Source: ABdhPJxb82rhz6VFbeHbqV4FCtq0fgYKeQlCSjWEcnSfejMbKQxhoarIzo75RuJ6TXNriCnwCcYsEtE0aSVW1Nvs5Ss=
X-Received: by 2002:a37:b847:: with SMTP id i68mr5261743qkf.431.1589470477390;
 Thu, 14 May 2020 08:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200514035648.85149-1-wak@google.com>
In-Reply-To: <20200514035648.85149-1-wak@google.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 14 May 2020 08:34:11 -0700
Message-ID: <CAMKF1sqcq71=9z3DO1UQ9041c9VcmArMq54Jfdf3U0PMsyHeyA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cli11: upgrade 1.8.0 -> 1.9.0
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 13, 2020 at 8:56 PM William A. Kennington III via
lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
>
> Variants of the patches are now included upstream so the local patching
> can be removed.
>

Building with clang fails like below

https://errors.yoctoproject.org/Errors/Details/412048/

core2-32-yoe-linux/cli11/1.9.0+gitAUTOINC+13becaddb6-r0/git/include/CLI/Optional.hpp:6:10:
error: 'istream' file not found [clang-diagnostic-error]
#include <istream>
         ^


> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  .../cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb}  |  8 +---
>  .../files/0001-Add-CLANG_TIDY-check.patch     | 25 ------------
>  ...stallDirs-instead-of-hard-coded-path.patch | 39 -------------------
>  3 files changed, 1 insertion(+), 71 deletions(-)
>  rename meta-oe/recipes-support/cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb} (68%)
>  delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
>  delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> similarity index 68%
> rename from meta-oe/recipes-support/cli11/cli11_1.8.0.bb
> rename to meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> index dd129cbec..151653b22 100644
> --- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> @@ -6,18 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
>  SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
>  PV .= "+git${SRCPV}"
>
> -SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> -            file://0001-Add-CLANG_TIDY-check.patch \
> -            file://0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch \
> -           "
> +SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
>
>  S = "${WORKDIR}/git"
>
>  inherit cmake
>  inherit ptest
>
> -EXTRA_OECMAKE += "-DCLANG_TIDY=OFF"
> -DEPENDS += "boost"
> -
>  # cli11 is a header only C++ library, so the main package will be empty.
>  RDEPENDS_${PN}-dev = ""
> diff --git a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
> deleted file mode 100644
> index 02b3c9bd7..000000000
> --- a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 902b251fd8d6408ee6623e7a92692948cf90187d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 12 Feb 2019 13:22:21 -0800
> -Subject: [PATCH] Add CLANG_TIDY check
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7073a0b..2dd2c02 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -60,7 +60,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
> -         endif()
> -     endif()
> -
> --    if(CMAKE_VERSION VERSION_GREATER 3.6)
> -+    if(CMAKE_VERSION VERSION_GREATER 3.6 AND CLANG_TIDY)
> -         # Add clang-tidy if available
> -         option(CLANG_TIDY_FIX "Perform fixes for Clang-Tidy" OFF)
> -         find_program(
> diff --git a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch b/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
> deleted file mode 100644
> index 4541cd929..000000000
> --- a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 8c51221f748bca1483fe1141e584867d2ff34a07 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 19 Dec 2019 16:26:39 -0800
> -Subject: [PATCH] Use GNUInstallDirs instead of hard-coded path
> -
> -Upstream-Status: Submitted [https://github.com/CLIUtils/CLI11/pull/373]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - CMakeLists.txt | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7073a0b..5236fd2 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -120,17 +120,18 @@ endif()
> - configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/CLI11ConfigVersion.cmake.in"
> -   "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake" @ONLY)
> -
> -+include(GNUInstallDirs)
> - # These installs only make sense for a local project
> - if(CUR_PROJ)
> -     # Make version available in the install
> -     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake"
> --            DESTINATION lib/cmake/CLI11)
> -+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
> -
> -     # Install the export target as a file
> -     install(EXPORT CLI11Targets
> -             FILE CLI11Config.cmake
> -             NAMESPACE CLI11::
> --            DESTINATION lib/cmake/CLI11)
> -+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
> -
> -     # Use find_package on the installed package
> -     export(TARGETS CLI11
> ---
> -2.24.1
> -
> --
> 2.26.2.645.ge9eca65c58-goog
>
> 
