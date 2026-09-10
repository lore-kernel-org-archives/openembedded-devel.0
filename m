Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F29C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:34:40 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7156.1789018476406516873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TAeIhQ7K;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8623b1e7cb2so49076487b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 22:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789018475; cv=none;
        d=google.com; s=arc-20260327;
        b=YOt93S2B+MUe/NTMSt7P7iYPKaCIM1PFntbgPvajtivGueQiHUIyaPrIV1yBI/QWrs
         M8/5TBqBnV8G57wkimAp6TVWYIpoWDeBAei8bmP7OGxIAzQiDeC27Ckf1JqtKugunj97
         Sanl8YVNVPtTjYWc6YZ5mXmfzLWqMOaERMqYV+gzkbpqg//PFnL6+3Euu70YGLgFv8DG
         zg1iChGmX3d6XCxUzKc4kWpMabxbmZE+TvLJ4v3+jMMhKerxLveAfRdWJQ35eI+cgUHC
         prKVVv/ToPrDv1De4lA3mcaY+UFxlocj3l1dAXr0NqYHTjloid4L6mgbrdSQ9qbDUbE5
         LVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BLgDFuDkl2Pl9KGxXLNo3wXH9xS0JASdBpAd0NnPCx4=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=ICfLaNX3BpXn10FVI54Tgt1bwAYCdLc2wYlo05diaPSC6o0xeKCg3L5KsZLL+kWSeH
         dySuN1taB1Y/jHGm/mq4DO0jEWfWGdq3NTQ8ZDeR+tTXOYqMHe78BhMY1uei2dCsdMBF
         /OHRRbGL5lGiTbMduJZIt2BUNl8LRVRsF9N5ma3lhuI10WxIch7XLXLzJ8ingXcvaYJ2
         CeZpOHDMamL9WSVPb7DXpxpLPTOZK5qRkasvG3jqueNjHnPHvYFTMkHEtEu/yiNldkCJ
         4Z9nYTabi4hKD5NsgB9wVkG4wGPS9ubP1dAgloE5X5bYaMiSH3LSYjP8gXD3EOGxSfg/
         0L4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789018475; x=1789623275; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLgDFuDkl2Pl9KGxXLNo3wXH9xS0JASdBpAd0NnPCx4=;
        b=TAeIhQ7KHg5xzLVf3c1ooT/VMMxCL7i1NZmxM2Bh09MvUL+V+6z6NkyCglDuqjJ7m5
         2Ug1fv3DQsFwCSyMYHz0cPCF66o/M8qi8oM2RlFWcwLgsVoEY3U8bL6wGvWc/cGjMgXH
         x1PStY/Ci3tedMtGE2yx0pPvxoaYfdVeEV2pRju31feGZsassXZvMya0kRxe1AX2DxFa
         6kB8IvZoKvodpStswtUUGFt85HRfdItsq/dtWZHPOAl/64yL6vDG9HJjzjmlschSsBTW
         E+7hmfna8n0ts2cHx1cGPCqGXfW6d8tBxHCnstlItaK1auD3VIcrUu01AHMsIYo9AFB7
         jIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018475; x=1789623275;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLgDFuDkl2Pl9KGxXLNo3wXH9xS0JASdBpAd0NnPCx4=;
        b=i80O1nY7eF2h4UvY8RuAZvTtdi1ANVZf6Wq8eZBS6QpmXHSI0fMgKzHn8KdqSjCVio
         DbwyjFU+UvWqdD5AyYUNkgbseC2vgAwYC0ZK2pX/J5rkPhVay3/ypNQp9Sx3ZRlP+VN+
         5dokGclLkcNKjNTmUqYNmbGRE7vOfDAq2UuWbXWRAiJBVwNmW2ac4vc/31KUZtOR4P9j
         EIWe66+rDJ2J+VkrQk0ZmZC1ndtJgKEr2DMujNZQdb+XAao4GMBQE+dapgfn+v7hlHrA
         JcWSRavfC9R7lSzQXHOM4fm0fQP1lqwSxcp0cActw42wGvS3i2GxTklLUsBILTqpsMmx
         czWg==
X-Gm-Message-State: AFuF++kIrX/Se5UC3wKDgrcDyk1HoWMDGAZbrMEfuIGO2HqDwxEebirv
	lZe11FDQ/2Da7dEf/6pnPbcTBGebx7mwQgVKbeVcd0oVrXAhG1VLkIWbS9+v+ybBeBr5pDxtj09
	vTL7nswgNL0V89mpn7iPuofwrqibg2VBhcTg/
X-Gm-Gg: AYBFou2LXyPs/G3znDL/3ttdjTWh6txh56FB4goT6NUxC+J5SXDC3lqCnsVpqiiQykG
	5j/fKtdNuIxYAoNlv4aKtFDJ0BuMCgeUtY1AHBu8TP5QyFxeaF4NFx3qyRmLiUSW0OTZiDBkz3h
	DTtgWjgYvwnKBqS5dEI1wIcTJQAG/t8o56UmZVRue4y11p+GNMA1IaQEeBrJHlSbkuh5dnfx7w9
	VKc5K/86vXqc+QM/iFxp7CJ5mJdyMFiEViz7mP6TBeOAZSWB8PmEEHWII+/IbWEDHc83btCGiK0
	W9+pyj3H3AV9r42mB8676spwcPCK6+wMbokhpLBH2HfeYcYiI51RD4/i3QXX3/vPdJhlnejdOvv
	O9Qwmcl1XlZZoDAPdrwNZVDvbieinbIjiFyiHMWBXcYFJv9LQVVxUcnBfAFhWdyffwziCoYKj7b
	DUaJvmxqFlIg4V73AP+cE/1ET6/LiilPiKazJkfTbZkF6X3JkP89zfqCcqSVm0HedO8MmaApUXk
	bUuTfBsEpkj3AjNTgmhjtYc
X-Received: by 2002:a05:690c:9a8c:b0:873:5c0f:293 with SMTP id
 00721157ae682-8735c0f0769mr134549537b3.61.1789018475242; Wed, 09 Sep 2026
 22:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260909155543.2469658-1-leon.anavi@konsulko.com> <20260909155543.2469658-2-leon.anavi@konsulko.com>
In-Reply-To: <20260909155543.2469658-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Sep 2026 22:34:08 -0700
X-Gm-Features: AcwNN1V8DqvRSHAEnQ7VbhtyKq3v5K3n01hVLhWlOVIr6e55pdOZiAeawGuH1wg
Message-ID: <CAMKF1so4R9HOiudoiXAixOSVGZJNR7ahqZqWa0ZY3oXFA9-4OQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] bit7z: Upgrade 4.0.12 -> 4.1.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6a8cc065b1a52a9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 05:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129905

--000000000000b6a8cc065b1a52a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:55=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 4.1.0:
>
> - Nested archives support: the new BitNestedArchiveReader class
>   lets you open and inspect archives that are embedded as items
>   inside another archive, without extracting them to disk first.
> - Native file I/O: file streams have been rewritten to use
>   low-level Win32 APIs on Windows and POSIX I/O on Unix, replacing
>   std::fstream. This dramatically improves the performance of both
>   extraction and compression operations.
> - New extraction callbacks: RenameCallback (dynamically rename or
>   skip items during extraction), RawDataCallback (stream raw bytes
>   directly to user code without touching the filesystem), and
>   BufferCallback (route each extracted file to a separate,
>   independently chosen buffer) unlock extraction patterns that were
>   previously impossible.
> - Multi-volume LRU file-handle cache: when reading or creating
>   large multi-volume archives, bit7z now keeps only the most
>   recently used volume file handles open, preventing file
>   descriptor exhaustion on archives with many volumes.
> - Timestamp control: two complementary additions give full control
>   over timestamps when creating archives. BitAbstractArchiveCreator
>   gains setStoreLastWriteTime(), setStoreCreationTime(), and
>   setStoreLastAccessTime() to control which timestamp types are
>   stored globally (format support varies: 7z has the most complete
>   support; TAR does not support creation/last-access timestamps).
>   Additionally, BitOutputArchive::addFile() now returns a
>   BitInputItem&, allowing per-item timestamp overrides via
>   setCreationTime(), setLastWriteTime(), and setLastAccessTime().
> - Deferred library loading: Bit7zLibraryLoader allows constructing
>   a loader without immediately loading the 7-zip DLL/SO, then
>   loading (and unloading) it at any later point. Useful for
>   plugin systems and applications that need to control when the
>   native library is brought in.
> - Self-extracting (SFX) archive support (since beta): bit7z
>   correctly handles SFX executables.
> - Root-folder extraction (since beta): extract the contents of an
>   archive's single top-level folder without knowing its name in
>   advance.
> - Locked-file compression (since beta): the new setStoreOpenFiles()
>   setting on BitAbstractArchiveCreator opens files with shared
>   read/write access on Windows, mirroring 7-Zip's -ssw switch, so
>   you can archive files another process holds open for writing
>   instead of failing with "access denied". No effect on non-Windows
>   platforms.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...01-cmake-disable-filesystem-gitclone.patch | 54 +++++++++++++----
>  ...Lists.txt-Remove-reference-to-TMPDIR.patch | 60 +++++++++++++++++++
>  .../7zip/{bit7z_4.0.12.bb =3D> bit7z_4.1.0.bb}  | 31 ++++++----
>  3 files changed, 124 insertions(+), 21 deletions(-)
>  create mode 100644
> meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-refe=
rence-to-TMPDIR.patch
>  rename meta-oe/recipes-extended/7zip/{bit7z_4.0.12.bb =3D> bit7z_4.1.0.b=
b}
> (75%)
>
> diff --git
> a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitcl=
one.patch
> b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitcl=
one.patch
> index 917b70f58e..47860167bf 100644
> ---
> a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitcl=
one.patch
> +++
> b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitcl=
one.patch
> @@ -1,3 +1,6 @@
> +From cc4874a304379aaf372955a3ecd83ae825fd5ed3 Mon Sep 17 00:00:00 2001
> +From: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Date: Wed, 9 Sep 2026 11:09:16 +0300
>  Subject: [PATCH] cmake: disable filesystem gitclone
>
>  In Yocto we don't download filesystem, it is satisfied from source dir.
> @@ -9,29 +12,58 @@ Fix error log as following:
>  | CMake Error at
> bit7z/4.0.11/build/_deps/ghc_filesystem-subbuild/ghc_filesystem-populate-=
prefix/tmp/ghc_filesystem-populate-gitclone.cmake:50
> (message):
>  |   Failed to clone repository: 'https://github.com/rikyoz/filesystem.gi=
t
> '
>
> +
> +Apply the same approach for bit7z-test-data in tests/CMakeLists.txt
> +to fix error log as following:
> +
> +|   Failed to clone repository:
> +|
> +|     'https://github.com/rikyoz/bit7z-test-data.git'
> +
>  Upstream-Status: Inappropriate [OE-specific]
>
>  Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   cmake/Dependencies.cmake | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> + tests/CMakeLists.txt     | 2 +-
> + 2 files changed, 2 insertions(+), 3 deletions(-)
>
>  diff --git a/cmake/Dependencies.cmake b/cmake/Dependencies.cmake
> -index 110d9c2b..dc1dead8 100644
> +index 1e787070..03dfa3d9 100644
>  --- a/cmake/Dependencies.cmake
>  +++ b/cmake/Dependencies.cmake
> -@@ -39,10 +39,9 @@ if( NOT USE_STANDARD_FILESYSTEM OR NOT
> STANDARD_FILESYSTEM_COMPILES OR BIT7Z_BUI
> -     CPMAddPackage( NAME ghc_filesystem
> -                    GITHUB_REPOSITORY rikyoz/filesystem
> -                    GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
> --                   DOWNLOAD_ONLY YES )
> -+                   SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem" )
> +@@ -84,7 +84,7 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )
> +         GITHUB_REPOSITORY rikyoz/filesystem
> +         GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
> +         GIT_PROGRESS ON
> +-        DOWNLOAD_ONLY YES
> ++        SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem"
> +     )
> +
> +     # Normalize to a plain "ghc_filesystem" target that the rest of the
> build and the tests link,
> +@@ -92,7 +92,6 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )
>       if( ghc_filesystem_ADDED )
> +         # Downloaded sources: expose the header-only library straight
> from its source tree.
>           message( STATUS "ghc::filesystem source code available at
> ${ghc_filesystem_SOURCE_DIR}" )
>  -        add_library( ghc_filesystem INTERFACE IMPORTED )
>           target_include_directories( ghc_filesystem SYSTEM INTERFACE
> ${ghc_filesystem_SOURCE_DIR}/include )
> -     endif()
> - endif()
> ---
> +         if( BIT7Z_USE_PCH AND CMAKE_VERSION VERSION_GREATER_EQUAL
> "3.16.0" )
> +             target_precompile_headers(
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 5f5c8c62..ddfd735a 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -72,8 +72,8 @@ if( BIT7Z_TESTS_FILESYSTEM )
> +             NAME bit7z_test_data
> +             GITHUB_REPOSITORY "rikyoz/bit7z-test-data"
> +             VERSION 1.18.2
> +-            DOWNLOAD_ONLY YES
> +             GIT_PROGRESS ON
> ++            SOURCE_DIR "${CPM_SOURCE_CACHE}/bit7z_test_data"
> +         )
> +         if( bit7z_test_data_ADDED )
> +             set( BIT7Z_TESTS_DATA_DIR ${bit7z_test_data_SOURCE_DIR} )
> +--
>  2.43.0
>
> diff --git
> a/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-re=
ference-to-TMPDIR.patch
> b/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-re=
ference-to-TMPDIR.patch
> new file mode 100644
> index 0000000000..eba1d66846
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-re=
ference-to-TMPDIR.patch
> @@ -0,0 +1,60 @@
> +From 0ea00afd5217683074f263027df6c28c03b25e1e Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Wed, 9 Sep 2026 16:00:00 +0300
> +Subject: [PATCH] tests/CMakeLists.txt: Remove reference to TMPDIR
> +
> +Adjust the path where the tests data directory will actually be
> +located when running the tests on the target device.
> +
> +Fixes:
> +
> +ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
> +/usr/lib/bit7z/ptest/bit7z-tests-public-cpp20 in package
> +bit7z-ptest contains reference to TMPDIR [buildpaths]
> +ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
> +/usr/lib/bit7z/ptest/bit7z-tests in package bit7z-ptest contains
> +reference to TMPDIR [buildpaths]
> +ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
> +/usr/lib/bit7z/ptest/bit7z-tests-public in package bit7z-ptest
> +contains reference to TMPDIR [buildpaths]
> +ERROR: bit7z-4.1.0-r0 do_package_qa: Fatal QA errors were found,
> +failing task.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + tests/CMakeLists.txt | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 2af67faa..64573893 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -94,8 +94,15 @@ if( BIT7Z_TESTS_FILESYSTEM )
> +         message( STATUS "Custom test data dir: ${BIT7Z_TESTS_DATA_DIR}"=
 )
> +     endif()
> +
> ++    # Adjust the path where the tests data directory will actually be
> ++    # located when running the tests on the target device.
> ++    set( BIT7Z_TESTS_DATA_DIR_TARGET "" CACHE STRING "The path of the
> tests data directory at run time" )
> ++    if( BIT7Z_TESTS_DATA_DIR_TARGET STREQUAL "" )
> ++        set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TESTS_DATA_DIR} )
> ++    endif()
> ++
> +     target_compile_definitions(
> +-        ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FILESYSTEM
> BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_DATA_DIR}"
> ++        ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FILESYSTEM
> BIT7Z_TESTS_DATA_DIR=3D"${BIT7Z_TESTS_DATA_DIR_TARGET}"
> +     )
> +
> +     if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
> +@@ -224,4 +231,4 @@ if( "cxx_std_20" IN_LIST CMAKE_CXX_COMPILE_FEATURES =
)
> +     set_property( TARGET ${TESTS_TARGET_PUBLIC_CPP20} PROPERTY
> CXX_STANDARD_REQUIRED ON )
> + endif()
> +
> +-catch_discover_tests( ${TESTS_TARGET} )
> +\ No newline at end of file
> ++catch_discover_tests( ${TESTS_TARGET} )
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
> b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
> similarity index 75%
> rename from meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
> rename to meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
> index 1399130e11..4661046220 100644
> --- a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
> +++ b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
> @@ -8,24 +8,25 @@ SRC_URI =3D " \
>      ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST')=
,
> 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
>  "
>
> -SRCREV =3D "9a43c9fb96003141dcb49c82843382a52afec86a"
> +SRCREV =3D "c81c6c1cbf44e148cd4b06f4bb69d7ea1e299742"
>
>  # ptest dependencies and their revisions
>  SRC_URI_PTEST =3D " \
>      git://
> github.com/rikyoz/filesystem.git;protocol=3Dhttps;branch=3Dglibcxx_wchar_=
streams_workaround;name=3Dfilesystem;destsuffix=3Dfilesystem
> \
> -    git://
> github.com/rikyoz/bit7z-test-data.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dtestdata;destsuffix=3Dtestdata
> \
> +    git://
> github.com/rikyoz/bit7z-test-data.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${TAG_testdata};name=3Dtestdata;destsuffix=3Dtestdata
> <http://github.com/rikyoz/bit7z-test-data.git;protocol=3Dhttps;branch=3Dm=
ain;tag=3Dv$%7BTAG_testdata%7D;name=3Dtestdata;destsuffix=3Dtestdata>
> \
>      git://
> github.com/rikyoz/Catch2.git;protocol=3Dhttps;branch=3Dsingle-header-v2.x=
;name=3Dcatch2;destsuffix=3Dcatch2
> \
>
> https://github.com/cpm-cmake/CPM.cmake/releases/download/v${TAG_CPM}/CPM.=
cmake;downloadfilename=3DCPM_${TAG_CPM}.cmake
> \
>      file://run-ptest \
>      file://0001-cmake-disable-filesystem-gitclone.patch \
> +    file://0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch \
>  "
>  SRCREV_FORMAT =3D "${@bb.utils.contains('PTEST_ENABLED', '1',
> 'default_filesystem_testdata_catch2', 'default', d)}"
>  SRCREV_filesystem =3D "b99c2aebd5ddd6fb2f190731ba80b949fc3842b5"
> -SRCREV_testdata =3D "077e407b1c07b7443626b5902eeb4819388bf656"
> +SRCREV_testdata =3D "4a24af69edf59cd6e737e84e6477ce752ef77bdd"
> +TAG_testdata =3D "1.18.2"
>  SRCREV_catch2 =3D "27d8db1770dd5cd3688656095f242474431584a1"
> -SRCHASH_CPM =3D
> "2020b4fc42dba44817983e06342e682ecfc3d2f484a581f11cc5731fbe4dce8a"
> -TAG_CPM =3D "0.42.0"
> -SRC_URI[sha256sum] =3D "${SRCHASH_CPM}"
> +TAG_CPM =3D "0.42.3"
> +SRC_URI[sha256sum] =3D
> "a609e875fd532b067174250f6abbc3dac22fe2d64869783fb1e80bda1625c844"
>
>
>  inherit cmake ptest
> @@ -34,7 +35,8 @@ DEPENDS =3D "7zip"
>
>  EXTRA_OECMAKE +=3D "-DBIT7Z_CUSTOM_7ZIP_PATH=3D${STAGING_INCDIR}/7zip"
>
> -CXXFLAGS:append =3D " -Wno-error=3Darray-bounds"
> +CXXFLAGS:append =3D " -Wno-error=3Darray-bounds -Wno-sfinae-incomplete"
>

 -Wsfinae-incomplete is a GCC 15+ diagnostic, clang does not know this
option
 turn this into CXXFLAGS:append:toolchain-gcc =3D " -Wno-sfinae-incomplete"

+CXXFLAGS:append =3D " -I${B}/cpm_cache/ghc_filesystem/include"
>
>
(target_include_directories(ghc_filesystem SYSTEM INTERFACE ...) in
cmake/Dependencies.cmake).
With a plain -I the warnings coming out of
ghc/filesystem.hpp are reported and the testsuite build enables -Werror so
make this

CXXFLAGS:append =3D " -isystem ${B}/cpm_cache/ghc_filesystem/include"



>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)}"
>  PACKAGECONFIG[tests] =3D " \
> @@ -47,9 +49,18 @@ PACKAGECONFIG[tests] =3D " \
>  do_configure:prepend() {
>      # verify that all dependencies have correct version
>      grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cmake || bbfata=
l
> "ERROR: dependency version mismatch, please update 'SRCREV_filesystem'!"
> -    grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfatal
> "ERROR: dependency version mismatch, please update 'SRCREV_testdata'!"
> +
> +    FOUND_VERSION=3D$(grep -A5 "NAME bit7z_test_data"
> ${S}/tests/CMakeLists.txt | grep -oP 'VERSION \K[0-9.]+' | head -1 | tr -=
d
> '[:space:]')
> +    if [ "${TAG_testdata}" !=3D "${FOUND_VERSION}" ]; then
> +        bbfatal "ERROR: dependency version mismatch, please update
> 'TAG_testdata'!"
> +    fi
> +
>      grep -q ${SRCREV_catch2} ${S}/tests/CMakeLists.txt || bbfatal "ERROR=
:
> dependency version mismatch, please update 'SRCREV_catch2'!"
> -    grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfatal
> "ERROR: dependency version mismatch, please update 'SRCHASH_CPM'!"
> +
> +    FOUND_VERSION=3D$(grep -oP 'CPM_DOWNLOAD_VERSION\s+\K[0-9.]+'
> ${S}/cmake/Dependencies.cmake | tr -d '[:space:]')
> +    if [ "${TAG_CPM}" !=3D "${FOUND_VERSION}" ]; then
> +        bbfatal "ERROR: dependency version mismatch, please update
> 'TAG_CPM'!"
> +    fi
>
>      if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)};
> then
>          # use cache instead of download for CPM (CMake's missing package
> manager)
> @@ -73,7 +84,7 @@ do_install() {
>  do_install_ptest() {
>      install -m 0755 ${S}/bin/*/* ${D}${PTEST_PATH}
>      install -d ${D}${PTEST_PATH}/data
> -    cp -r ${UNPACKDIR}/testdata/test_archives
> ${UNPACKDIR}/testdata/test_filesystem ${B}/tests/data/test_filesystem
> ${D}${PTEST_PATH}/data
> +    cp -r ${UNPACKDIR}/testdata/test_archives
> ${UNPACKDIR}/testdata/test_filesystem
> ${B}/cpm_cache/bit7z_test_data/test_filesystem ${D}${PTEST_PATH}/data
>  }
>
>  # this package contains static library so main package is empty, but
> ptest package rdepends on it
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129890):
> https://lists.openembedded.org/g/openembedded-devel/message/129890
> Mute This Topic: https://lists.openembedded.org/mt/121165161/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b6a8cc065b1a52a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 9, =
2026 at 8:55=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulk=
o.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to=
 release 4.1.0:<br>
<br>
- Nested archives support: the new BitNestedArchiveReader class<br>
=C2=A0 lets you open and inspect archives that are embedded as items<br>
=C2=A0 inside another archive, without extracting them to disk first.<br>
- Native file I/O: file streams have been rewritten to use<br>
=C2=A0 low-level Win32 APIs on Windows and POSIX I/O on Unix, replacing<br>
=C2=A0 std::fstream. This dramatically improves the performance of both<br>
=C2=A0 extraction and compression operations.<br>
- New extraction callbacks: RenameCallback (dynamically rename or<br>
=C2=A0 skip items during extraction), RawDataCallback (stream raw bytes<br>
=C2=A0 directly to user code without touching the filesystem), and<br>
=C2=A0 BufferCallback (route each extracted file to a separate,<br>
=C2=A0 independently chosen buffer) unlock extraction patterns that were<br=
>
=C2=A0 previously impossible.<br>
- Multi-volume LRU file-handle cache: when reading or creating<br>
=C2=A0 large multi-volume archives, bit7z now keeps only the most<br>
=C2=A0 recently used volume file handles open, preventing file<br>
=C2=A0 descriptor exhaustion on archives with many volumes.<br>
- Timestamp control: two complementary additions give full control<br>
=C2=A0 over timestamps when creating archives. BitAbstractArchiveCreator<br=
>
=C2=A0 gains setStoreLastWriteTime(), setStoreCreationTime(), and<br>
=C2=A0 setStoreLastAccessTime() to control which timestamp types are<br>
=C2=A0 stored globally (format support varies: 7z has the most complete<br>
=C2=A0 support; TAR does not support creation/last-access timestamps).<br>
=C2=A0 Additionally, BitOutputArchive::addFile() now returns a<br>
=C2=A0 BitInputItem&amp;, allowing per-item timestamp overrides via<br>
=C2=A0 setCreationTime(), setLastWriteTime(), and setLastAccessTime().<br>
- Deferred library loading: Bit7zLibraryLoader allows constructing<br>
=C2=A0 a loader without immediately loading the 7-zip DLL/SO, then<br>
=C2=A0 loading (and unloading) it at any later point. Useful for<br>
=C2=A0 plugin systems and applications that need to control when the<br>
=C2=A0 native library is brought in.<br>
- Self-extracting (SFX) archive support (since beta): bit7z<br>
=C2=A0 correctly handles SFX executables.<br>
- Root-folder extraction (since beta): extract the contents of an<br>
=C2=A0 archive&#39;s single top-level folder without knowing its name in<br=
>
=C2=A0 advance.<br>
- Locked-file compression (since beta): the new setStoreOpenFiles()<br>
=C2=A0 setting on BitAbstractArchiveCreator opens files with shared<br>
=C2=A0 read/write access on Windows, mirroring 7-Zip&#39;s -ssw switch, so<=
br>
=C2=A0 you can archive files another process holds open for writing<br>
=C2=A0 instead of failing with &quot;access denied&quot;. No effect on non-=
Windows<br>
=C2=A0 platforms.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...01-cmake-disable-filesystem-gitclone.patch | 54 +++++++++++++----<=
br>
=C2=A0...Lists.txt-Remove-reference-to-TMPDIR.patch | 60 ++++++++++++++++++=
+<br>
=C2=A0.../7zip/{<a href=3D"http://bit7z_4.0.12.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bit7z_4.0.12.bb</a> =3D&gt; <a href=3D"http://bit7z_4.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">bit7z_4.1.0.bb</a>}=C2=A0 | 31 ++++++-=
---<br>
=C2=A03 files changed, 124 insertions(+), 21 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMa=
keLists.txt-Remove-reference-to-TMPDIR.patch<br>
=C2=A0rename meta-oe/recipes-extended/7zip/{<a href=3D"http://bit7z_4.0.12.=
bb" rel=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a> =3D&gt; <a hre=
f=3D"http://bit7z_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">bit7z_4.1.=
0.bb</a>} (75%)<br>
<br>
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesys=
tem-gitclone.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable=
-filesystem-gitclone.patch<br>
index 917b70f58e..47860167bf 100644<br>
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-git=
clone.patch<br>
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-git=
clone.patch<br>
@@ -1,3 +1,6 @@<br>
+From cc4874a304379aaf372955a3ecd83ae825fd5ed3 Mon Sep 17 00:00:00 2001<br>
+From: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_=
blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
+Date: Wed, 9 Sep 2026 11:09:16 +0300<br>
=C2=A0Subject: [PATCH] cmake: disable filesystem gitclone<br>
<br>
=C2=A0In Yocto we don&#39;t download filesystem, it is satisfied from sourc=
e dir.<br>
@@ -9,29 +12,58 @@ Fix error log as following:<br>
=C2=A0| CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-subbuild/ghc=
_filesystem-populate-prefix/tmp/ghc_filesystem-populate-gitclone.cmake:50 (=
message):<br>
=C2=A0|=C2=A0 =C2=A0Failed to clone repository: &#39;<a href=3D"https://git=
hub.com/rikyoz/filesystem.git" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/rikyoz/filesystem.git</a>&#39;<br>
<br>
+<br>
+Apply the same approach for bit7z-test-data in tests/CMakeLists.txt<br>
+to fix error log as following:<br>
+<br>
+|=C2=A0 =C2=A0Failed to clone repository:<br>
+|<br>
+|=C2=A0 =C2=A0 =C2=A0&#39;<a href=3D"https://github.com/rikyoz/bit7z-test-=
data.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/rikyoz/bi=
t7z-test-data.git</a>&#39;<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [OE-specific]<br>
<br>
=C2=A0Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.co=
m" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
+Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 cmake/Dependencies.cmake | 3 +--<br>
- 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+ tests/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ 2 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/cmake/Dependencies.cmake b/cmake/Dependencies.cmake<br>
-index 110d9c2b..dc1dead8 100644<br>
+index 1e787070..03dfa3d9 100644<br>
=C2=A0--- a/cmake/Dependencies.cmake<br>
=C2=A0+++ b/cmake/Dependencies.cmake<br>
-@@ -39,10 +39,9 @@ if( NOT USE_STANDARD_FILESYSTEM OR NOT STANDARD_FILESYS=
TEM_COMPILES OR BIT7Z_BUI<br>
-=C2=A0 =C2=A0 =C2=A0CPMAddPackage( NAME ghc_filesystem<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GITH=
UB_REPOSITORY rikyoz/filesystem<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GIT_=
TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DOWN=
LOAD_ONLY YES )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SOUR=
CE_DIR &quot;${CPM_SOURCE_CACHE}/ghc_filesystem&quot; )<br>
+@@ -84,7 +84,7 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GITHUB_REPOSITORY rikyoz/filesystem<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949=
fc3842b5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_PROGRESS ON<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 DOWNLOAD_ONLY YES<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOURCE_DIR &quot;${CPM_SOURCE_CACHE}/ghc_file=
system&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# Normalize to a plain &quot;ghc_filesystem&quot; targ=
et that the rest of the build and the tests link,<br>
+@@ -92,7 +92,6 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )<b=
r>
=C2=A0 =C2=A0 =C2=A0 if( ghc_filesystem_ADDED )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Downloaded sources: expose the header-=
only library straight from its source tree.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message( STATUS &quot;ghc::filesystem so=
urce code available at ${ghc_filesystem_SOURCE_DIR}&quot; )<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_library( ghc_filesystem INTERFACE IM=
PORTED )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_include_directories( ghc_filesyst=
em SYSTEM INTERFACE ${ghc_filesystem_SOURCE_DIR}/include )<br>
-=C2=A0 =C2=A0 =C2=A0endif()<br>
- endif()<br>
--- <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( BIT7Z_USE_PCH AND CMAKE_VERSION VERS=
ION_GREATER_EQUAL &quot;3.16.0&quot; )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_precompile_headers(=
<br>
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt<br>
+index 5f5c8c62..ddfd735a 100644<br>
+--- a/tests/CMakeLists.txt<br>
++++ b/tests/CMakeLists.txt<br>
+@@ -72,8 +72,8 @@ if( BIT7Z_TESTS_FILESYSTEM )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAME bit7z_test_data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GITHUB_REPOSITORY &quot;ri=
kyoz/bit7z-test-data&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VERSION 1.18.2<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DOWNLOAD_ONLY YES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIT_PROGRESS ON<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SOURCE_DIR &quot;${CPM_SOURCE_C=
ACHE}/bit7z_test_data&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( bit7z_test_data_ADDED )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set( BIT7Z_TESTS_DATA_DIR =
${bit7z_test_data_SOURCE_DIR} )<br>
+--<br>
=C2=A02.43.0<br>
<br>
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-=
Remove-reference-to-TMPDIR.patch b/meta-oe/recipes-extended/7zip/bit7z/0002=
-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch<br>
new file mode 100644<br>
index 0000000000..eba1d66846<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-=
reference-to-TMPDIR.patch<br>
@@ -0,0 +1,60 @@<br>
+From 0ea00afd5217683074f263027df6c28c03b25e1e Mon Sep 17 00:00:00 2001<br>
+From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" target=3D"=
_blank">leon.anavi@konsulko.com</a>&gt;<br>
+Date: Wed, 9 Sep 2026 16:00:00 +0300<br>
+Subject: [PATCH] tests/CMakeLists.txt: Remove reference to TMPDIR<br>
+<br>
+Adjust the path where the tests data directory will actually be<br>
+located when running the tests on the target device.<br>
+<br>
+Fixes:<br>
+<br>
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File<br>
+/usr/lib/bit7z/ptest/bit7z-tests-public-cpp20 in package<br>
+bit7z-ptest contains reference to TMPDIR [buildpaths]<br>
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File<br>
+/usr/lib/bit7z/ptest/bit7z-tests in package bit7z-ptest contains<br>
+reference to TMPDIR [buildpaths]<br>
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File<br>
+/usr/lib/bit7z/ptest/bit7z-tests-public in package bit7z-ptest<br>
+contains reference to TMPDIR [buildpaths]<br>
+ERROR: bit7z-4.1.0-r0 do_package_qa: Fatal QA errors were found,<br>
+failing task.<br>
+<br>
+Upstream-Status: Inappropriate [OE-specific]<br>
+<br>
+Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
+---<br>
+ tests/CMakeLists.txt | 11 +++++++++--<br>
+ 1 file changed, 9 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt<br>
+index 2af67faa..64573893 100644<br>
+--- a/tests/CMakeLists.txt<br>
++++ b/tests/CMakeLists.txt<br>
+@@ -94,8 +94,15 @@ if( BIT7Z_TESTS_FILESYSTEM )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message( STATUS &quot;Custom test data d=
ir: ${BIT7Z_TESTS_DATA_DIR}&quot; )<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+ <br>
++=C2=A0 =C2=A0 # Adjust the path where the tests data directory will actua=
lly be<br>
++=C2=A0 =C2=A0 # located when running the tests on the target device.<br>
++=C2=A0 =C2=A0 set( BIT7Z_TESTS_DATA_DIR_TARGET &quot;&quot; CACHE STRING =
&quot;The path of the tests data directory at run time&quot; )<br>
++=C2=A0 =C2=A0 if( BIT7Z_TESTS_DATA_DIR_TARGET STREQUAL &quot;&quot; )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TEST=
S_DATA_DIR} )<br>
++=C2=A0 =C2=A0 endif()<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0target_compile_definitions(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FI=
LESYSTEM BIT7Z_TESTS_DATA_DIR=3D&quot;${BIT7Z_TESTS_DATA_DIR}&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FI=
LESYSTEM BIT7Z_TESTS_DATA_DIR=3D&quot;${BIT7Z_TESTS_DATA_DIR_TARGET}&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem=
/empty )<br>
+@@ -224,4 +231,4 @@ if( &quot;cxx_std_20&quot; IN_LIST CMAKE_CXX_COMPILE_F=
EATURES )<br>
+=C2=A0 =C2=A0 =C2=A0set_property( TARGET ${TESTS_TARGET_PUBLIC_CPP20} PROP=
ERTY CXX_STANDARD_REQUIRED ON )<br>
+ endif()<br>
+ <br>
+-catch_discover_tests( ${TESTS_TARGET} )<br>
+\ No newline at end of file<br>
++catch_discover_tests( ${TESTS_TARGET} )<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.0.12.b=
b" rel=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a> b/meta-oe/recip=
es-extended/7zip/<a href=3D"http://bit7z_4.1.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bit7z_4.1.0.bb</a><br>
similarity index 75%<br>
rename from meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.0.12.bb=
" rel=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a><br>
rename to meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">bit7z_4.1.0.bb</a><br>
index 1399130e11..4661046220 100644<br>
--- a/meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.0.12.bb" rel=
=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a><br>
+++ b/meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">bit7z_4.1.0.bb</a><br>
@@ -8,24 +8,25 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#3=
9;, d.getVar(&#39;SRC_URI_PTEST&#39;), &#39;file://0001-cmake-disable-depen=
dency-inclusion.patch&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;9a43c9fb96003141dcb49c82843382a52afec86a&quot;<br>
+SRCREV =3D &quot;c81c6c1cbf44e148cd4b06f4bb69d7ea1e299742&quot;<br>
<br>
=C2=A0# ptest dependencies and their revisions<br>
=C2=A0SRC_URI_PTEST =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/rikyoz/filesystem.gi=
t;protocol=3Dhttps;branch=3Dglibcxx_wchar_streams_workaround;name=3Dfilesys=
tem;destsuffix=3Dfilesystem" rel=3D"noreferrer" target=3D"_blank">github.co=
m/rikyoz/filesystem.git;protocol=3Dhttps;branch=3Dglibcxx_wchar_streams_wor=
karound;name=3Dfilesystem;destsuffix=3Dfilesystem</a> \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/rikyoz/bit7z-test-data.gi=
t;protocol=3Dhttps;branch=3Dmain;name=3Dtestdata;destsuffix=3Dtestdata" rel=
=3D"noreferrer" target=3D"_blank">github.com/rikyoz/bit7z-test-data.git;pro=
tocol=3Dhttps;branch=3Dmain;name=3Dtestdata;destsuffix=3Dtestdata</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/rikyoz/bit7z-test-data.gi=
t;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BTAG_testdata%7D;name=3Dtestdata=
;destsuffix=3Dtestdata" rel=3D"noreferrer" target=3D"_blank">github.com/rik=
yoz/bit7z-test-data.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${TAG_testdat=
a};name=3Dtestdata;destsuffix=3Dtestdata</a> \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/rikyoz/Catch2.git;pr=
otocol=3Dhttps;branch=3Dsingle-header-v2.x;name=3Dcatch2;destsuffix=3Dcatch=
2" rel=3D"noreferrer" target=3D"_blank">github.com/rikyoz/Catch2.git;protoc=
ol=3Dhttps;branch=3Dsingle-header-v2.x;name=3Dcatch2;destsuffix=3Dcatch2</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/cpm-cmake/CPM.cmake/relea=
ses/download/v$%7BTAG_CPM%7D/CPM.cmake;downloadfilename=3DCPM_$%7BTAG_CPM%7=
D.cmake" rel=3D"noreferrer" target=3D"_blank">https://github.com/cpm-cmake/=
CPM.cmake/releases/download/v${TAG_CPM}/CPM.cmake;downloadfilename=3DCPM_${=
TAG_CPM}.cmake</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-cmake-disable-filesystem-gitclone.patch \<b=
r>
+=C2=A0 =C2=A0 file://0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.=
patch \<br>
=C2=A0&quot;<br>
=C2=A0SRCREV_FORMAT =3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39;,=
 &#39;1&#39;, &#39;default_filesystem_testdata_catch2&#39;, &#39;default&#3=
9;, d)}&quot;<br>
=C2=A0SRCREV_filesystem =3D &quot;b99c2aebd5ddd6fb2f190731ba80b949fc3842b5&=
quot;<br>
-SRCREV_testdata =3D &quot;077e407b1c07b7443626b5902eeb4819388bf656&quot;<b=
r>
+SRCREV_testdata =3D &quot;4a24af69edf59cd6e737e84e6477ce752ef77bdd&quot;<b=
r>
+TAG_testdata =3D &quot;1.18.2&quot;<br>
=C2=A0SRCREV_catch2 =3D &quot;27d8db1770dd5cd3688656095f242474431584a1&quot=
;<br>
-SRCHASH_CPM =3D &quot;2020b4fc42dba44817983e06342e682ecfc3d2f484a581f11cc5=
731fbe4dce8a&quot;<br>
-TAG_CPM =3D &quot;0.42.0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;${SRCHASH_CPM}&quot;<br>
+TAG_CPM =3D &quot;0.42.3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a609e875fd532b067174250f6abbc3dac22fe2d648697=
83fb1e80bda1625c844&quot;<br>
<br>
<br>
=C2=A0inherit cmake ptest<br>
@@ -34,7 +35,8 @@ DEPENDS =3D &quot;7zip&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DBIT7Z_CUSTOM_7ZIP_PATH=3D${STAGING_INCDIR}=
/7zip&quot;<br>
<br>
-CXXFLAGS:append =3D &quot; -Wno-error=3Darray-bounds&quot;<br>
+CXXFLAGS:append =3D &quot; -Wno-error=3Darray-bounds -Wno-sfinae-incomplet=
e&quot;<br></blockquote><div><br></div><div>=C2=A0-Wsfinae-incomplete is a =
GCC 15+ diagnostic, clang does not know this option</div><div>=C2=A0turn th=
is into=C2=A0CXXFLAGS:append:toolchain-gcc =3D &quot; -Wno-sfinae-incomplet=
e&quot;</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+CXXFLAGS:append =3D &quot; -I${B}/cpm_cache/ghc_filesystem/include&quot;<b=
r>
<br></blockquote><div><br></div><div>(target_include_directories(ghc_filesy=
stem SYSTEM INTERFACE ...) in=C2=A0<span style=3D"background-color:transpar=
ent">cmake/Dependencies.cmake). With a plain -I the warnings coming out of<=
/span></div>ghc/filesystem.hpp are reported and the testsuite build enables=
 -Werror so make this</div><div class=3D"gmail_quote gmail_quote_container"=
><br></div><div class=3D"gmail_quote gmail_quote_container">CXXFLAGS:append=
 =3D &quot; -isystem ${B}/cpm_cache/ghc_filesystem/include&quot;</div><div =
class=3D"gmail_quote gmail_quote_container"><br><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[tests] =3D &quot; \<br>
@@ -47,9 +49,18 @@ PACKAGECONFIG[tests] =3D &quot; \<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# verify that all dependencies have correct version<br>
=C2=A0 =C2=A0 =C2=A0grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cm=
ake || bbfatal &quot;ERROR: dependency version mismatch, please update &#39=
;SRCREV_filesystem&#39;!&quot;<br>
-=C2=A0 =C2=A0 grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfa=
tal &quot;ERROR: dependency version mismatch, please update &#39;SRCREV_tes=
tdata&#39;!&quot;<br>
+<br>
+=C2=A0 =C2=A0 FOUND_VERSION=3D$(grep -A5 &quot;NAME bit7z_test_data&quot; =
${S}/tests/CMakeLists.txt | grep -oP &#39;VERSION \K[0-9.]+&#39; | head -1 =
| tr -d &#39;[:space:]&#39;)<br>
+=C2=A0 =C2=A0 if [ &quot;${TAG_testdata}&quot; !=3D &quot;${FOUND_VERSION}=
&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;ERROR: dependency version mismat=
ch, please update &#39;TAG_testdata&#39;!&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0grep -q ${SRCREV_catch2} ${S}/tests/CMakeLists.txt || b=
bfatal &quot;ERROR: dependency version mismatch, please update &#39;SRCREV_=
catch2&#39;!&quot;<br>
-=C2=A0 =C2=A0 grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfa=
tal &quot;ERROR: dependency version mismatch, please update &#39;SRCHASH_CP=
M&#39;!&quot;<br>
+<br>
+=C2=A0 =C2=A0 FOUND_VERSION=3D$(grep -oP &#39;CPM_DOWNLOAD_VERSION\s+\K[0-=
9.]+&#39; ${S}/cmake/Dependencies.cmake | tr -d &#39;[:space:]&#39;)<br>
+=C2=A0 =C2=A0 if [ &quot;${TAG_CPM}&quot; !=3D &quot;${FOUND_VERSION}&quot=
; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;ERROR: dependency version mismat=
ch, please update &#39;TAG_CPM&#39;!&quot;<br>
+=C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;1=
&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use cache instead of download for CPM (=
CMake&#39;s missing package manager)<br>
@@ -73,7 +84,7 @@ do_install() {<br>
=C2=A0do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/bin/*/* ${D}${PTEST_PATH}<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/data<br>
-=C2=A0 =C2=A0 cp -r ${UNPACKDIR}/testdata/test_archives ${UNPACKDIR}/testd=
ata/test_filesystem ${B}/tests/data/test_filesystem ${D}${PTEST_PATH}/data<=
br>
+=C2=A0 =C2=A0 cp -r ${UNPACKDIR}/testdata/test_archives ${UNPACKDIR}/testd=
ata/test_filesystem ${B}/cpm_cache/bit7z_test_data/test_filesystem ${D}${PT=
EST_PATH}/data<br>
=C2=A0}<br>
<br>
=C2=A0# this package contains static library so main package is empty, but =
ptest package rdepends on it<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129890" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121165161/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121165161/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b6a8cc065b1a52a9--

