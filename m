Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.212.1625067218569533377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 08:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bpNfgPyV;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 21so2808964pfp.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vfaGt/gp5fcuUQvxwo734HyJa1tSN1efVUArwqb+7iM=;
        b=bpNfgPyV6NMNnwVKvqHo09JNqHeYEhbSyURudzZOAKnw6ukCEBtmrQcYy2FTz1cxHU
         3bpFs9FfucfFE1ezv3ReEyhXxra0Ap33RrlXxsXidkVoc1+DV7sogbIhJ+9mvNAQRslG
         lyWYTQXGTb8fl0PvALsnqLuBPUkaEcv4A2Zq/Y/tK/cYFuP5xB0JcYDl5uQQt+8l559O
         jE8wjxbp3HzjZqbzjzq+hFokafVDq7eH9zA8xIdAVIGZoghHamOv6DrzkmoLWPzGU8n4
         NZlQJWQYsqzRN2xk3Ti7QVlsSJQSWQXkgOF6VEssjdbo8xaeYyALodM4lT9L308Io48B
         Syyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vfaGt/gp5fcuUQvxwo734HyJa1tSN1efVUArwqb+7iM=;
        b=Zx3ybnqR0X0Uel/NYIjDSJCjI+6fKvvFG54QUdes6c808i89eBYkfXBIOZUfxCVrhG
         GYKWdmfqf2yQYqB21e4s2IgzqSK+iv4rtlOmPKEsw8Lk8WJmAyfWm6zmLDRD6RSdcbH5
         24vYYu1DyjLPTJ3J81gAeja/OojMpSSiq+vdwOxHcP3HBDEY2w6UovQmYbhOSlqOPHJS
         BAl9aDULqkOyKJh8+UrIV1iPh0AFvdMXo6TlvUwFbuoktAJnKtiDhADfMvj43p5vCnNS
         bTH/OMjS37FaJOoC2ujzVHVNhoCV/CUs+79pUhgC0Q45tuPh1iWTLqQHZzpZbwMx8bnB
         m1IQ==
X-Gm-Message-State: AOAM530GT3rNQtifYOHT3OrGr5gYCWM9xCspFbGXIgGr+kfQBC5ubTdt
	uFnRlvt3JdtXunKxAtP8xy4=
X-Google-Smtp-Source: ABdhPJxirfGhy8tVO/zmJ3XQlwdHfDrYocaP3Pt7PkL/Aqq31dXKaPAts9OfrYFa5vyupRj+AWMHHw==
X-Received: by 2002:a65:508a:: with SMTP id r10mr11145113pgp.96.1625067217858;
        Wed, 30 Jun 2021 08:33:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:bda3:c742:f39c:c543? ([2601:646:9200:a0f0:bda3:c742:f39c:c543])
        by smtp.gmail.com with ESMTPSA id b18sm6995905pjq.2.2021.06.30.08.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 08:33:37 -0700 (PDT)
To: Tony Tascioglu <tony.tascioglu@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20210630143719.166267-1-tony.tascioglu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [oe] [meta-oe][PATCH] libyang: create recipe for libyang
Message-ID: <0189c044-3880-a141-9dc9-132ca5528f1d@gmail.com>
Date: Wed, 30 Jun 2021 08:33:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630143719.166267-1-tony.tascioglu@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/30/21 7:37 AM, Tony Tascioglu wrote:
> Add a new recipe, patches, and ptest coverage for libyang.
> 
> The recipe follows from upstream, using the cmake build system.
> 
> There were 2 small changes needed to get the package building:
>    - Remove call to pcre2-config
>    - Add missing import statement
> 
> The recipe has a dependency on libpcre2, which satisfies the minimum
> requirements for libyang. In addition, for tests, cmocka is required
> during build and runtime, and valgrind is required in the runtime for
> some tests.
> 
> Due to the way the library by default builds in a debug mode, release
> mode was specified. However, this disables building the built-in tests,
> so an EXTRA_OECMAKE was added based on whether or not ptests are enabled
> to specifiy the required extra flag.
> 
> Binconfig-disabled is inherited since using pcre2-config directly is not
> suggested anymore. Cmocka as a dependency depends on whether ptests have
> been enabled. Since ptests are built with the main package, we need
> cmocka installed before the test are compiled if they are needed.
> 
> Ptest coverage:
> The ptests come from the original tests included with the library.
> Ptests are in ctest format by default, so we compare the return code to
> print it in Yocto format. However, as each "test" target executable has
> multiple tests in it, the full stdout and stderr logs are saved for
> troubleshooting.
> 
> Currently, several of the tests fail due to hardcoded paths in the
> executable binaries generated, this is an issue we will take upstream.
> For now, only the tests which work on a different target are enabled as
> the ptests. The list can be updated in the run-ptest script, which is
> portable shell compatible, without requiring bash.
> 
> The recipe also has libyang-bin as a split package, which includes
> yanglint should it be needed.
> This recipe was tested using buildall-qemu as well as from within qemu
> in x86_64 and arm64.
> 

Thanks for describing the changes so well.

> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> ---
>   ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++++++++
>   .../libyang/libyang/run-ptest                 | 46 ++++++++++++++++
>   .../recipes-extended/libyang/libyang_2.0.7.bb | 33 +++++++++++
>   3 files changed, 134 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-ptest
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> 
> diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> new file mode 100644
> index 000000000..e3b2d0e02
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> @@ -0,0 +1,55 @@
> +From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
> +From: Tony Tascioglu <tony.tascioglu@windriver.com>
> +Date: Mon, 21 Jun 2021 12:34:22 -0400
> +Subject: [PATCH] libyang: fix initial build errors
> +
> +This patch addresses build errors seen when integrating libyang as a
> +recipe.
> +
> +The call to pcre2-config has been commented out. *-config calls are
> +being replaced by pkgconfig, and we want to avoid the binary config
> +calls. This call can safely be discarded since it is used to check
> +the version of libpcre2 on the system, and all recent YP builds meet
> +the minimum required version (v10.21).
> +
> +There is a missing include statement for stdint.h in utests.h which
> +causes build problems. stdint.h is required to be imported by cmocka.h
> +prior to the cmocka file. Adding the stdint allows it to build the
> +tests correctly
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> +---
> + CMakeModules/FindPCRE2.cmake | 2 +-
> + tests/utests/utests.h        | 1 +
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeModules/FindPCRE2.cmake b/CMakeModules/FindPCRE2.cmake
> +index 8f60daa2..ad014f14 100644
> +--- a/CMakeModules/FindPCRE2.cmake
> ++++ b/CMakeModules/FindPCRE2.cmake
> +@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
> + FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
> +
> + # Check required version
> +-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> ++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> +
> + # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to TRUE if all listed variables are TRUE.
> + INCLUDE(FindPackageHandleStandardArgs)
> +diff --git a/tests/utests/utests.h b/tests/utests/utests.h
> +index 5bea0459..a256120c 100644
> +--- a/tests/utests/utests.h
> ++++ b/tests/utests/utests.h
> +@@ -23,6 +23,7 @@
> + #include <stddef.h>
> + #include <stdlib.h>
> +
> ++#include <stdint.h>
> + #include <cmocka.h>
> +
> + #include <string.h>
> +--
> +2.32.0
> +
> diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> new file mode 100644
> index 000000000..1c9f8f47f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +# Valid tests to run
> +tests="utest_binary \
> +       utest_bits \
> +       utest_common \
> +       utest_hash_table \
> +       utest_inet_types \
> +       utest_int8 \
> +       utest_json \
> +       utest_list \
> +       utest_merge \
> +       utest_metadata \
> +       utest_parser_yang \
> +       utest_parser_yin \
> +       utest_pattern \
> +       utest_printer_yang \
> +       utest_printer_yin \
> +       utest_range \
> +       utest_schema \
> +       utest_set \
> +       utest_string \
> +       utest_tree_data \
> +       utest_tree_schema_compile \
> +       utest_types \
> +       utest_xml \
> +       utest_xpath \
> +       utest_yang_types \
> +       utest_yanglib"
> +
> +# cd into right directory
> +ptestdir=$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +# Run specified tests
> +for f in $tests
> +do
> +    if test -e ./"$f"; then
> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    else
> +        echo "SKIP: $f"
> +    fi
> +done
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> new file mode 100644
> index 000000000..9cab6507e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "YANG data modeling language library"
> +DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
> +HOMEPAGE = "https://github.com/CESNET/libyang"
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
> +
> +SRCREV = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
> +
> +SRC_URI = "git://github.com/CESNET/libyang.git \
> +           file://libyang-skip-pcre2-config-add-stdint-h.patch \
> +           file://run-ptest \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +# Main dependencies
> +inherit cmake pkgconfig lib_package binconfig-disabled ptest
> +DEPENDS = "libpcre2"
> +DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
> +BINCONFIG = "${bindir}/pcre2-config"
> +
> +# Ptest dependencies
> +RDEPENDS_${PN}-ptest += "valgrind"
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> +EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_BUILD_TESTS=ON', '', d)}"
> +
> +do_install_ptest () {
> +    cp -a ${B}/tests/ ${D}${PTEST_PATH}/


perhaps use cp -fR instead of cp -a which is gnu specific.

> +}
> +
> 
> 
> 
> 
> 
