Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.11629.1617984149063033122
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 09:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lAfLtuSz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id d10so4232907pgf.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Apr 2021 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0uLUjxHjnLZlfWjLx+P6mibGgIsifSzjrVToomkEtrI=;
        b=lAfLtuSzMI0iPojNVXh1NZk1R1NO41Hyj9SYKtBTvOC7jVta9PFGGo4e+KvTngPhaM
         krMKIfk40sD8N+4xmn2nKCKQu7VdlE/SOez4J68CbicC4TISUISllRLHk3BgMY0Rwzae
         rI4o6I5WxKRXkEoBW8XupIlq+eD94ni1mg4buk/4fuhtnFRwy6p1Zg1Q5bv7BW7o+SwJ
         7jc/wvN3TuAQBXQXXTTJ3RxIfYXLL6oYbspKUb7cwMQ5qwxx3TIFzPslZx1E0sF1tLL6
         7Ke32ey5J2Pzi0tuTSvrWy2pQM3tBj2sjMlUvUwKMUvloKJ6wsOzxPmDl2k2URA3C+rU
         olXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0uLUjxHjnLZlfWjLx+P6mibGgIsifSzjrVToomkEtrI=;
        b=PfXLU/mMmgRG4AfXJR0S7zP0yY393HoB31Znf+8BMzldxRmXRLVuoftoqEM0wC5XK0
         tzeEcaC3x4axzuPouV519VLrbYxG8CxHS3w/jpiOk/z8Z+y+jVNz0Nx+p2VKeLZVaQYb
         zlTXylpHM2kGT5gdxguZm+xfBNUZfdR262LJJ57r/UmJH3hUUzzPybRacNAaiRSfMZy3
         wfWp9JRIIsWSVAtLl6zntRK+rZ2+VdIF4HQu6Aq0IWH7EEua/cakV8BQqJvMAgF6Wu6V
         dzjuJ6Re+phAVXUCtcBo00TolVXTfCYhew09APpG+ELPdYiA+BCrOi/X98bdAFMSnhxD
         tTJQ==
X-Gm-Message-State: AOAM533USGEQlM8GFNxT4d4Hb2Q1BJDopYg27yyZJ5UQvboJcul54E39
	vDLRmTsnyIXxQXDBhhIqdM6SRG75BeBtsQ==
X-Google-Smtp-Source: ABdhPJytdnubgVJe31X6AOTPIgy01IzvcWBrS6MZsfoy92wbr+TJN7AJ88kxEth9CVAYxXzSrwm7Bw==
X-Received: by 2002:a62:6101:0:b029:215:3a48:4e6e with SMTP id v1-20020a6261010000b02902153a484e6emr13366851pfb.2.1617984147796;
        Fri, 09 Apr 2021 09:02:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:351b:2de3:223:1924? ([2601:646:9200:a0f0:351b:2de3:223:1924])
        by smtp.gmail.com with ESMTPSA id m195sm2875766pfd.99.2021.04.09.09.02.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 09:02:27 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v3] tbb: upgrade 2020.3 -> 2021.2.0
To: openembedded-devel@lists.openembedded.org
References: <20210409083219.7943-1-naveen.kumar.saini@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ef96b11b-540d-147f-863d-809df29e61ac@gmail.com>
Date: Fri, 9 Apr 2021 09:02:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210409083219.7943-1-naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/9/21 1:32 AM, Naveen Saini wrote:
> Switched to cmake build tool.
> 
> Rebased some patches due to directory re-structuring.
> Dropped patches, which are not required anymore.
> 
> ---
> v2:
> Exclude for riscv machines
> Ref: https://github.com/oneapi-src/oneTBB/blob/onetbb_2021/src/tbb/CMakeLists.txt#L58
> 
> v3:
> Instead of excluding riscv machines, disable ittnotify
> 

thanks this looks better. I have staged it in master-next

> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>   ...akeLists.txt-exclude-riscv64-riscv32.patch | 42 +++++++++++++++++++
>   ...nfo-is-glibc-specific-API-mark-it-so.patch | 27 ++++++------
>   .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 22 ++++++----
>   .../tbb/tbb/cross-compile.patch               | 35 ----------------
>   .../tbb/tbb/improve-reproducibility.patch     | 30 -------------
>   meta-oe/recipes-support/tbb/tbb/tbb.pc        | 11 -----
>   .../tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb}    | 36 ++++++----------
>   7 files changed, 81 insertions(+), 122 deletions(-)
>   create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
>   delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
>   delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
>   delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
>   rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb} (59%)
> 
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
> new file mode 100644
> index 000000000..ff6154808
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
> @@ -0,0 +1,42 @@
> +From cb9e9b5b1ad05dd9de07a65ee7147cdb3433746a Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Fri, 9 Apr 2021 15:41:35 +0800
> +Subject: [PATCH] CMakeLists.txt: exclude riscv64 & riscv32
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + src/tbb/CMakeLists.txt       | 2 +-
> + src/tbbmalloc/CMakeLists.txt | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/tbb/CMakeLists.txt b/src/tbb/CMakeLists.txt
> +index a6edb6ad..4f261813 100644
> +--- a/src/tbb/CMakeLists.txt
> ++++ b/src/tbb/CMakeLists.txt
> +@@ -55,7 +55,7 @@ target_compile_definitions(tbb
> +                            PRIVATE
> +                            __TBB_BUILD)
> +
> +-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
> ++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
> +          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
> +          WINDOWS_STORE OR
> +          TBB_WINDOWS_DRIVER))
> +diff --git a/src/tbbmalloc/CMakeLists.txt b/src/tbbmalloc/CMakeLists.txt
> +index de7ca7ea..31e854fe 100644
> +--- a/src/tbbmalloc/CMakeLists.txt
> ++++ b/src/tbbmalloc/CMakeLists.txt
> +@@ -28,7 +28,7 @@ target_compile_definitions(tbbmalloc
> +                            PRIVATE
> +                            __TBBMALLOC_BUILD)
> +
> +-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
> ++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
> +          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
> +          WINDOWS_STORE OR
> +          TBB_WINDOWS_DRIVER))
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
> index 7e66945fa..49325447e 100644
> --- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
> @@ -1,22 +1,23 @@
> -From 6b2b136caa68912d77ffe26143cd3da768b9ef80 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 Jun 2017 08:39:37 -0700
> +From 52c1586bff0ecb418ac21d6678f8963d70959f04 Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Wed, 7 Apr 2021 11:14:13 +0800
>   Subject: [PATCH] mallinfo() is glibc specific API mark it so
>   
>   Helps compiling with musl
>   
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>   Upstream-Status: Pending
>   
> - src/tbbmalloc/proxy.cpp | 2 ++
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + src/tbbmalloc_proxy/proxy.cpp | 2 ++
>    1 file changed, 2 insertions(+)
>   
> -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> -index 5ef279d..06c4872 100644
> ---- a/src/tbbmalloc/proxy.cpp
> -+++ b/src/tbbmalloc/proxy.cpp
> -@@ -185,6 +185,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
> +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
> +index f9942bf1..fe0dad89 100644
> +--- a/src/tbbmalloc_proxy/proxy.cpp
> ++++ b/src/tbbmalloc_proxy/proxy.cpp
> +@@ -253,6 +253,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
>        return 1;
>    }
>    
> @@ -24,7 +25,7 @@ index 5ef279d..06c4872 100644
>    struct mallinfo mallinfo() __THROW
>    {
>        struct mallinfo m;
> -@@ -192,6 +193,7 @@ struct mallinfo mallinfo() __THROW
> +@@ -260,6 +261,7 @@ struct mallinfo mallinfo() __THROW
>    
>        return m;
>    }
> @@ -33,5 +34,5 @@ index 5ef279d..06c4872 100644
>    #if __ANDROID__
>    // Android doesn't have malloc_usable_size, provide it to be compatible
>   --
> -2.13.0
> +2.17.1
>   
> diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
> index 6f28f6f3a..fb10684cd 100644
> --- a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
> +++ b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
> @@ -1,7 +1,7 @@
> -From 27956d4c5fb615098231cebfb8eef11057639d3c Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 8 Dec 2019 18:14:38 +0100
> -Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on
> +From 5cac8b5fffa4ebf5f0090456c9e0cbf43827242a Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Wed, 7 Apr 2021 11:32:52 +0800
> +Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on
>    musl
>   
>   Do not call __GLIBC_PREREQ if it is not defined otherwise build will
> @@ -12,14 +12,15 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/203]
>   
>   Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>   ---
> - src/tbbmalloc/proxy.cpp | 6 ++++--
> + src/tbbmalloc_proxy/proxy.cpp | 6 ++++--
>    1 file changed, 4 insertions(+), 2 deletions(-)
>   
> -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> -index d96ae7a0..709ae839 100644
> ---- a/src/tbbmalloc/proxy.cpp
> -+++ b/src/tbbmalloc/proxy.cpp
> +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
> +index fe0dad89..93e68049 100644
> +--- a/src/tbbmalloc_proxy/proxy.cpp
> ++++ b/src/tbbmalloc_proxy/proxy.cpp
>   @@ -24,7 +24,8 @@
>    // of aligned_alloc as required by new C++ standard, this makes it hard to
>    // redefine aligned_alloc here. However, running on systems with new libc
> @@ -40,3 +41,6 @@ index d96ae7a0..709ae839 100644
>    #endif // __linux__ && !__ANDROID__
>    
>    #include "proxy.h"
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> deleted file mode 100644
> index 36578543f..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: unsuitable
> ----
> -
> -diff --git a/build/linux.clang.inc b/build/linux.clang.inc
> -index fe9b5c98..b0dcd68b 100644
> ---- a/build/linux.clang.inc
> -+++ b/build/linux.clang.inc
> -@@ -12,8 +12,8 @@
> - # See the License for the specific language governing permissions and
> - # limitations under the License.
> -
> --CPLUS ?= clang++
> --CONLY ?= clang
> -+CPLUS ?= $(CXX)
> -+CONLY ?= $(CC)
> - COMPILE_ONLY = -c -MMD
> - PREPROC_ONLY = -E -x c++
> - INCLUDE_KEY = -I
> -diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> -index d820c15d..62c76afd 100644
> ---- a/build/linux.gcc.inc
> -+++ b/build/linux.gcc.inc
> -@@ -12,8 +12,8 @@
> - # See the License for the specific language governing permissions and
> - # limitations under the License.
> -
> --CPLUS ?= g++
> --CONLY ?= gcc
> -+CPLUS ?= $(CXX)
> -+CONLY ?= $(CC)
> - COMPILE_ONLY = -c -MMD
> - PREPROC_ONLY = -E -x c++
> - INCLUDE_KEY = -I
> diff --git a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
> deleted file mode 100644
> index 91d10cb7a..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From f56eeb18a07df139864a99e1967d450cc5c8c0bb Mon Sep 17 00:00:00 2001
> -From: Lee Chee Yang <chee.yang.lee@intel.com>
> -Date: Wed, 30 Sep 2020 16:18:35 +0800
> -Subject: [PATCH] improve reproducibility
> -
> -remove the WORKDIR info from BUILD_COMMAND to improve reproducibility.
> -also use SOURCE_DATE_EPOCH as DATETIME wherever possible.
> -
> -Upstream-Status: Inappropriate [sed WORKDIR does not applies to upstream]
> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ----
> - build/version_info_linux.sh | 4 +-
> - 1 file changed, 2 insertion(+), 2 deletion(-)
> -
> -diff --git a/build/version_info_linux.sh b/build/version_info_linux.sh
> -index 793cad11..ed6f4b2a 100644
> ---- a/build/version_info_linux.sh
> -+++ b/build/version_info_linux.sh
> -@@ -25,6 +25,6 @@ echo '#N": BUILD_GCC'"\t\t"`g++ --version </dev/null 2>&1 | grep 'g++'`'" ENDL \
> - echo '#N": BUILD_LIBC'"\t"`getconf GNU_LIBC_VERSION | grep glibc | sed -e 's/^glibc //'`'" ENDL \'
> - echo '#N": BUILD_LD'"\t\t"`ld -v 2>&1 | grep 'version'`'" ENDL \'
> - echo '#N": BUILD_TARGET'"\t$arch on $runtime"'" ENDL \'
> --echo '#N": BUILD_COMMAND'"\t"$*'" ENDL \'
> -+echo '#N": BUILD_COMMAND'"\t"$(echo $* | sed 's#'$WORKDIR'#/workdir#g')'" ENDL \'
> - echo ""
> --echo "#define __TBB_DATETIME \""`date -u`"\""
> -+echo "#define __TBB_DATETIME \""`$(date -u -d "@$SOURCE_DATE_EPOCH"  2>/dev/null || date -u -r "$SOURCE_DATE_EPOCH"  2>/dev/null || date -u )`"\""
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-support/tbb/tbb/tbb.pc
> deleted file mode 100644
> index 4f9da1140..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=/usr
> -exec_prefix=${prefix}
> -libdir=${exec_prefix}/lib
> -includedir=${prefix}/include
> -
> -Name: Threading Building Blocks
> -Description: Intel's parallelism library for C++
> -URL: https://software.intel.com/en-us/tbb
> -Version: 2020.2
> -Libs: -L${libdir} -ltbb
> -Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-support/tbb/tbb_2020.3.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> similarity index 59%
> rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
> rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> index 8e0094b31..5fe386ea0 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> @@ -5,37 +5,25 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
>       and threading mechanism for performance and scalability."
>   HOMEPAGE = "https://software.intel.com/en-us/tbb"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> -BRANCH = "tbb_2020"
> -SRCREV = "eca91f16d7490a8abfdee652dadf457ec820cc37"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
> +BRANCH = "onetbb_2021"
> +SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
>   SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
> -           file://cross-compile.patch \
> -           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> -           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> -           file://tbb.pc \
> -           file://improve-reproducibility.patch \
> +            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> +            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> +            file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
>   "
>   
>   S = "${WORKDIR}/git"
> -PE = "1"
>   
> -COMPILER ?= "gcc"
> -COMPILER_toolchain-clang = "clang"
> +inherit cmake
>   
> -do_compile() {
> -    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH}
> -}
> +# test build fails, error: 'mallinfo mallinfo()' is deprecated
> +EXTRA_OECMAKE += " \
> +                    -DTBB_TEST=OFF \
> +                    -DCMAKE_BUILD_TYPE=Release \
> +                "
>   
> -do_install() {
> -    install -d ${D}${includedir} ${D}${libdir}
> -    rm ${S}/include/tbb/index.html -f
> -    cp -R --no-dereference --preserve=mode,links -v ${S}/include/tbb ${D}${includedir}
> -    for f in ${B}/build/linux_*_release/lib*.so*
> -    do
> -        install -Dm 0755 $f ${D}${libdir}/
> -    done
> -    install -Dm 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig/tbb.pc
> -}
>   
>   # fails with thumb enabled:
>   # | arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9 -mcpu=cortex-a9 -D__ARM__ -D__LINUX_ARM_ARCH__=7 -funwind-tables -mvectorize-with-neon-quad -rdynamic --sysroot=/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0 -DUSE_PTHREAD -fPIC -D__TBB_BUILD=1 -Wall -Wno-parentheses -Wno-non-virtual-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ../../src/tbb/concurrent_queue.cpp
> 
> 
> 
> 
> 
