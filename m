Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.3491.1625089109941285358
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 14:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G55EbVSx;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id dj3so1900659qvb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jEGMbdo/OiH6UbiGE20VmOIZ2diJFG+VRqFVWClqL1g=;
        b=G55EbVSxviig6PyQfSorlH8/WsNELtHywlPLCqEEZEmdqZdaVV2Ykh/wNtx2QdDfCV
         G8C/WSTTRCeZ7+LqJw0HXrfl9eG5ptJAWToSsKT7bqz0AraAk4mxo0yDSr23QGSHmcIu
         ToirfmThpDWmvkXQvlLwvheCiW+K82BgBZsp5EswD1Oa8QxOIhlAUBun0nMLiFj6rCw/
         tMdLTmFrFi2yNm3t2wH6KH33kU5lJk2FXev46JYIfJMH73tzW780I8ERQ47/PWNYFtkX
         U7IglEZ5JtkZzz/m/uNV34F8nmecI1118jFNNDLqnWOfcJZksi+3YCPeMkuHRmwPtDlz
         sUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jEGMbdo/OiH6UbiGE20VmOIZ2diJFG+VRqFVWClqL1g=;
        b=g5lwFoXZEz+NLodk8cTDFZrQAoiNgxKIF0LPC024TVCYTuCK1geVKzt2RApEuoOnw3
         /GTp1uPFv4KCKmKVGXlv18OLm5Xt1b4sRVVdK1BvNxAaiSPfzFVdL2LSNgAkxxcuo0bj
         hUTL1vgTqjXNLX10ImGbrHm51vsbMbKHQkK5BOjkovDqyr6jyyWdVHiS4N+7jDojD2xc
         2ndnvVqPQ2+t3OwNTpL/PE1Tp4sO/40thjOWrvC9yGOmnHmG7UOBME8v45ugjxS9LOSX
         Kfa0WSIsH/Ip2Jgetg93uAvDQXhC+rttOKuQKe0UOb3lzwg0ZVglwEckQ2ztY2JGuljH
         QLaQ==
X-Gm-Message-State: AOAM5301k0TtT0OS6cnu+mUQo8q+tt1Ck2zQIe0Dt7VokWC6wVFeWAD+
	bI8PP50gjE4vy01fzUuLL5ETdigGPlhtKusbfeU=
X-Google-Smtp-Source: ABdhPJxhcPmZXCgs0Wk/r0Y3ZcEJrK/KpPD2ZcllDkXvfFX24DNslPEUxd4r1NbpE/aFyM4GrfAlmBWp/edCd87xhfA=
X-Received: by 2002:a0c:ecc8:: with SMTP id o8mr15160534qvq.55.1625089108850;
 Wed, 30 Jun 2021 14:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210630143719.166267-1-tony.tascioglu@windriver.com>
 <20210630165516.71817-1-tony.tascioglu@windriver.com> <e4f53a3a-e043-d394-4889-333c6e2e0852@gmail.com>
 <d1d63abb-ca8e-3bc5-35be-2507446184ea@windriver.com>
In-Reply-To: <d1d63abb-ca8e-3bc5-35be-2507446184ea@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Jun 2021 14:38:03 -0700
Message-ID: <CAMKF1sr2xtS09tXhrhbQ8PT_A5mBNPqjAcd_nkqoK5Kbbq3G7A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libyang: create recipe for libyang
To: Tony Tascioglu <tony.tascioglu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 12:20 PM Tony Tascioglu
<tony.tascioglu@windriver.com> wrote:
>
> Hello,
>
> rv64 is also incompatible with valgrind, which is used for the ptests.
>
> ERROR: Nothing RPROVIDES 'valgrind' (but libyang_2.0.7.bb RDEPENDS on or
> otherwise requires it)
> valgrind was skipped: incompatible with host riscv64-poky-linux (not in
> COMPATIBLE_HOST)

right I should have also looked at COMPATIBLE_HOST list in valgrind,
since valgrind dependency is
only needed for ptests, we should still allow to build it when ptest
feature is not in distro.

>
> So far, the only obstacle for other architectures has been the ptest
> runtime dependency on valgrind.
>
> Thanks, Tony
>
> On 6/30/21 2:26 PM, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On 6/30/21 9:55 AM, Tony Tascioglu wrote:
> >> Add a new recipe, patches, and ptest coverage for libyang.
> >>
> >> The recipe follows from upstream, using the cmake build system.
> >>
> >> There were 2 small changes needed to get the package building:
> >>    - Remove call to pcre2-config
> >>    - Add missing import statement
> >>
> >> The recipe has a dependency on libpcre2, which satisfies the minimum
> >> requirements for libyang. In addition, for tests, cmocka is required
> >> during build and runtime, and valgrind is required in the runtime for
> >> some tests.
> >>
> >> Due to the way the library by default builds in a debug mode, release
> >> mode was specified. However, this disables building the built-in tests,
> >> so an EXTRA_OECMAKE was added based on whether or not ptests are enabled
> >> to specifiy the required extra flag.
> >>
> >> Binconfig-disabled is inherited since using pcre2-config directly is not
> >> suggested anymore. Cmocka as a dependency depends on whether ptests have
> >> been enabled. Since ptests are built with the main package, we need
> >> cmocka installed before the test are compiled if they are needed.
> >>
> >> Ptest coverage:
> >> The ptests come from the original tests included with the library.
> >> Ptests are in ctest format by default, so we compare the return code to
> >> print it in Yocto format. However, as each "test" target executable has
> >> multiple tests in it, the full stdout and stderr logs are saved for
> >> troubleshooting.
> >>
> >> Currently, several of the tests fail due to hardcoded paths in the
> >> executable binaries generated, this is an issue we will take upstream.
> >> For now, only the tests which work on a different target are enabled as
> >> the ptests. The list can be updated in the run-ptest script, which is
> >> portable shell compatible, without requiring bash.
> >>
> >> The recipe also has libyang-bin as a split package, which includes
> >> yanglint should it be needed.
> >> This recipe was tested using buildall-qemu as well as from within qemu
> >> in x86_64 and arm64.
> >>
> >> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> >> ---
> >>   ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++++++++
> >>   .../libyang/libyang/run-ptest                 | 46 ++++++++++++++++
> >>   .../recipes-extended/libyang/libyang_2.0.7.bb | 37 +++++++++++++
> >>   3 files changed, 138 insertions(+)
> >>   create mode 100644
> >> meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> >>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-ptest
> >>   create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> >>
> >> diff --git
> >> a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> >> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> >>
> >> new file mode 100644
> >> index 000000000..e3b2d0e02
> >> --- /dev/null
> >> +++
> >> b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> >> @@ -0,0 +1,55 @@
> >> +From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
> >> +From: Tony Tascioglu <tony.tascioglu@windriver.com>
> >> +Date: Mon, 21 Jun 2021 12:34:22 -0400
> >> +Subject: [PATCH] libyang: fix initial build errors
> >> +
> >> +This patch addresses build errors seen when integrating libyang as a
> >> +recipe.
> >> +
> >> +The call to pcre2-config has been commented out. *-config calls are
> >> +being replaced by pkgconfig, and we want to avoid the binary config
> >> +calls. This call can safely be discarded since it is used to check
> >> +the version of libpcre2 on the system, and all recent YP builds meet
> >> +the minimum required version (v10.21).
> >> +
> >> +There is a missing include statement for stdint.h in utests.h which
> >> +causes build problems. stdint.h is required to be imported by cmocka.h
> >> +prior to the cmocka file. Adding the stdint allows it to build the
> >> +tests correctly
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> >> +---
> >> + CMakeModules/FindPCRE2.cmake | 2 +-
> >> + tests/utests/utests.h        | 1 +
> >> + 2 files changed, 2 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/CMakeModules/FindPCRE2.cmake
> >> b/CMakeModules/FindPCRE2.cmake
> >> +index 8f60daa2..ad014f14 100644
> >> +--- a/CMakeModules/FindPCRE2.cmake
> >> ++++ b/CMakeModules/FindPCRE2.cmake
> >> +@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
> >> + FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
> >> +
> >> + # Check required version
> >> +-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE
> >> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> >> ++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE
> >> PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> >> +
> >> + # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to
> >> TRUE if all listed variables are TRUE.
> >> + INCLUDE(FindPackageHandleStandardArgs)
> >> +diff --git a/tests/utests/utests.h b/tests/utests/utests.h
> >> +index 5bea0459..a256120c 100644
> >> +--- a/tests/utests/utests.h
> >> ++++ b/tests/utests/utests.h
> >> +@@ -23,6 +23,7 @@
> >> + #include <stddef.h>
> >> + #include <stdlib.h>
> >> +
> >> ++#include <stdint.h>
> >> + #include <cmocka.h>
> >> +
> >> + #include <string.h>
> >> +--
> >> +2.32.0
> >> +
> >> diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest
> >> b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> >> new file mode 100644
> >> index 000000000..1c9f8f47f
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> >> @@ -0,0 +1,46 @@
> >> +#!/bin/sh
> >> +# Valid tests to run
> >> +tests="utest_binary \
> >> +       utest_bits \
> >> +       utest_common \
> >> +       utest_hash_table \
> >> +       utest_inet_types \
> >> +       utest_int8 \
> >> +       utest_json \
> >> +       utest_list \
> >> +       utest_merge \
> >> +       utest_metadata \
> >> +       utest_parser_yang \
> >> +       utest_parser_yin \
> >> +       utest_pattern \
> >> +       utest_printer_yang \
> >> +       utest_printer_yin \
> >> +       utest_range \
> >> +       utest_schema \
> >> +       utest_set \
> >> +       utest_string \
> >> +       utest_tree_data \
> >> +       utest_tree_schema_compile \
> >> +       utest_types \
> >> +       utest_xml \
> >> +       utest_xpath \
> >> +       utest_yang_types \
> >> +       utest_yanglib"
> >> +
> >> +# cd into right directory
> >> +ptestdir=$(dirname "$(readlink -f "$0")")
> >> +cd "$ptestdir"/tests || exit
> >> +
> >> +# Run specified tests
> >> +for f in $tests
> >> +do
> >> +    if test -e ./"$f"; then
> >> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> >> +            echo "PASS: $f"
> >> +        else
> >> +            echo "FAIL: $f"
> >> +        fi
> >> +    else
> >> +        echo "SKIP: $f"
> >> +    fi
> >> +done
> >> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> >> b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> >> new file mode 100644
> >> index 000000000..8e9e8cc02
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> >> @@ -0,0 +1,37 @@
> >> +SUMMARY = "YANG data modeling language library"
> >> +DESCRIPTION = "libyang is a YANG data modelling language parser and
> >> toolkit written (and providing API) in C."
> >> +HOMEPAGE = "https://github.com/CESNET/libyang"
> >> +SECTION = "libs"
> >> +LICENSE = "BSD-3-Clause"
> >> +
> >> +LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
> >> +
> >> +SRCREV = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
> >> +
> >> +SRC_URI = "git://github.com/CESNET/libyang.git \
> >> +           file://libyang-skip-pcre2-config-add-stdint-h.patch \
> >> +           file://run-ptest \
> >> +           "
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +COMPATIBLE_HOST_riscv32 = "null"
> >> +COMPATIBLE_HOST_armv5 = "null"
> >> +COMPATIBLE_HOST_riscv64 = "null"
> >
> > what issue do you see on rv64
> >
> >> +
> >> +# Main dependencies
> >> +inherit cmake pkgconfig lib_package binconfig-disabled ptest
> >> +DEPENDS = "libpcre2"
> >> +DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '',
> >> d)}"
> >> +BINCONFIG = "${bindir}/pcre2-config"
> >> +
> >> +# Ptest dependencies
> >> +RDEPENDS_${PN}-ptest += "valgrind"
> >> +
> >> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> >> +EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1',
> >> '-DENABLE_BUILD_TESTS=ON', '', d)}"
> >> +
> >> +do_install_ptest () {
> >> +    cp -fR ${B}/tests/ ${D}${PTEST_PATH}/
> >> +}
> >> +
> >>
> >>
> >>
> >> 
> >>
