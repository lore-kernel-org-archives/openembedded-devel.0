Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.18124.1589690278432214109
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 21:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kq1aqiVX;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id z9so3148910qvi.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 21:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zR4D6FiA34IVA8h4XsFDNSaalFuH/+Q64Uc/rTuJ6Xc=;
        b=kq1aqiVXus2sMYM0xoeVWeprATYkHZ8ZAdfcBopXYgI0PkACOU4aQDSysnuL/UvLtt
         TA930x5ojLX7O25maKx8M5sOAaZ5/PFW9KbqUWNAK0jCdZW5bITN9P6px9u8OEO+FMcf
         aUV0Rbb0qmneWvVBBtoqoGAH252VHUcJvCUZYLKYKM08aaAywrIwZovpxCjCJXXdY3mD
         RhDnfljGZITadcniIBSKeYBWssxhis/qKMm2v+y0v0uKB8vSKrs8zao0z2nwZqK26GPC
         UaoYRIb3PwpdfwkXKSxNOSICYwetR4zynHOtVb3mQrnEKZ+BVSvVJV9l7yDDbHHXfA+7
         Rh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zR4D6FiA34IVA8h4XsFDNSaalFuH/+Q64Uc/rTuJ6Xc=;
        b=TzRG1xkU9LrTiObByer5529E9BOi4DWtx+0+1ENBT+sZbxOCOhPptVDYe/i6EJVkgh
         cqPrfjd1MglvirnTTPA3t6I428mVeSIKCD9JzssWbNobIkdBLEkiCaYTUV49v7nzYXb3
         Euh1iAL/kcHya7wEy8ZwEcHuxpn0tFEJzUsVN2ZwDU8/ruCStK82VG+zDkQM82CjaVYS
         RIe/wRTv6d4Dkl3EtFUYOLOiR1m9AVFQEo4v70XZ+T5DAUDVinD/I1+dHkXrR7sYQ79M
         O2r010YFuoX+bI53oBHLkHXbO6u0em4vI5YJmNs0wxNVXTL6GlfHVZlC9gVKvxbq23xf
         yoDQ==
X-Gm-Message-State: AOAM530oq5aQLWC+pZxc5TJzi0qcKlpsN5UlhX1c5QVP/pR8spDD3lXx
	aho2J/ZzkZoCwKYnuGoS23UOXv/bXNwu9rfkWQM=
X-Google-Smtp-Source: ABdhPJzeA2KQPftq6we90ivZrNPEw+ssAq6BMW3kOzb3EU2+s4C9gldeAGMYTVlM5LPMZXo4V0wKBnWnc9oWzBMudK4=
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr3257115qvw.146.1589690277100;
 Sat, 16 May 2020 21:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200514035648.85149-1-wak@google.com> <CAMKF1sqcq71=9z3DO1UQ9041c9VcmArMq54Jfdf3U0PMsyHeyA@mail.gmail.com>
In-Reply-To: <CAMKF1sqcq71=9z3DO1UQ9041c9VcmArMq54Jfdf3U0PMsyHeyA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 16 May 2020 21:37:31 -0700
Message-ID: <CAMKF1sp9QjNRyeUm-q-BGRSvSdWjPXdn-neL=j=u9NW+4JyJQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cli11: upgrade 1.8.0 -> 1.9.0
To: "William A. Kennington III" <wak@google.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 8:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 13, 2020 at 8:56 PM William A. Kennington III via
> lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
> >
> > Variants of the patches are now included upstream so the local patching
> > can be removed.
> >
>
> Building with clang fails like below
>
> https://errors.yoctoproject.org/Errors/Details/412048/
>
> core2-32-yoe-linux/cli11/1.9.0+gitAUTOINC+13becaddb6-r0/git/include/CLI/Optional.hpp:6:10:
> error: 'istream' file not found [clang-diagnostic-error]
> #include <istream>
>          ^
>

This was a problem in clang-tidy invocation of cross-compiler as it
was not passing -target option to clang
it was silently ignoring the c++ system headers, this has now been
fixed in meta-clang,  I am applied this
patch as it is to master.

>
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >  .../cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb}  |  8 +---
> >  .../files/0001-Add-CLANG_TIDY-check.patch     | 25 ------------
> >  ...stallDirs-instead-of-hard-coded-path.patch | 39 -------------------
> >  3 files changed, 1 insertion(+), 71 deletions(-)
> >  rename meta-oe/recipes-support/cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb} (68%)
> >  delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
> >  delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
> >
> > diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> > similarity index 68%
> > rename from meta-oe/recipes-support/cli11/cli11_1.8.0.bb
> > rename to meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> > index dd129cbec..151653b22 100644
> > --- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
> > +++ b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
> > @@ -6,18 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
> >  SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
> >  PV .= "+git${SRCPV}"
> >
> > -SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
> > -            file://0001-Add-CLANG_TIDY-check.patch \
> > -            file://0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch \
> > -           "
> > +SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
> >
> >  S = "${WORKDIR}/git"
> >
> >  inherit cmake
> >  inherit ptest
> >
> > -EXTRA_OECMAKE += "-DCLANG_TIDY=OFF"
> > -DEPENDS += "boost"
> > -
> >  # cli11 is a header only C++ library, so the main package will be empty.
> >  RDEPENDS_${PN}-dev = ""
> > diff --git a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
> > deleted file mode 100644
> > index 02b3c9bd7..000000000
> > --- a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -From 902b251fd8d6408ee6623e7a92692948cf90187d Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 12 Feb 2019 13:22:21 -0800
> > -Subject: [PATCH] Add CLANG_TIDY check
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ----
> > - CMakeLists.txt | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index 7073a0b..2dd2c02 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -60,7 +60,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
> > -         endif()
> > -     endif()
> > -
> > --    if(CMAKE_VERSION VERSION_GREATER 3.6)
> > -+    if(CMAKE_VERSION VERSION_GREATER 3.6 AND CLANG_TIDY)
> > -         # Add clang-tidy if available
> > -         option(CLANG_TIDY_FIX "Perform fixes for Clang-Tidy" OFF)
> > -         find_program(
> > diff --git a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch b/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
> > deleted file mode 100644
> > index 4541cd929..000000000
> > --- a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 8c51221f748bca1483fe1141e584867d2ff34a07 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Thu, 19 Dec 2019 16:26:39 -0800
> > -Subject: [PATCH] Use GNUInstallDirs instead of hard-coded path
> > -
> > -Upstream-Status: Submitted [https://github.com/CLIUtils/CLI11/pull/373]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - CMakeLists.txt | 5 +++--
> > - 1 file changed, 3 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index 7073a0b..5236fd2 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -120,17 +120,18 @@ endif()
> > - configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/CLI11ConfigVersion.cmake.in"
> > -   "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake" @ONLY)
> > -
> > -+include(GNUInstallDirs)
> > - # These installs only make sense for a local project
> > - if(CUR_PROJ)
> > -     # Make version available in the install
> > -     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake"
> > --            DESTINATION lib/cmake/CLI11)
> > -+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
> > -
> > -     # Install the export target as a file
> > -     install(EXPORT CLI11Targets
> > -             FILE CLI11Config.cmake
> > -             NAMESPACE CLI11::
> > --            DESTINATION lib/cmake/CLI11)
> > -+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
> > -
> > -     # Use find_package on the installed package
> > -     export(TARGETS CLI11
> > ---
> > -2.24.1
> > -
> > --
> > 2.26.2.645.ge9eca65c58-goog
> >
> > 
