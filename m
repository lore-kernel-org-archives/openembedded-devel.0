Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.3744.1618261824293373041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 14:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzjIiWgy;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id x11so15761603qkp.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dvZzIcDpzLIQZQiDVsXiUAZEvhWVKf8h7Q4GCW1UM2w=;
        b=IzjIiWgyRBUrusIW39E7SQwKYzuuwjQXp5gBKMmtwS1XN4vToBr4mtGA5vw1jpl8oi
         3k8BCmnp3rMqLh6LmkEfc7KzBq98Q9I6NwxR/lQ2gkzncz91Hgm7osm6iajgjsjrRboc
         SFxROCQtmwvcsNEAmlrNV9edL2scYDBkzaqNv9XXYpSvTrgbFJuo4aJ3uVxEcev/HCNI
         nDclVv2NS0oEsUS09zEYGwxS5htOwMo6pCV6USnkQacgP/kuTSuicZF9IxMIdDNdzfFn
         ISmqLaPbWN+ucbaeRR7zieDQ+Bv7q4alv1gHJ4Nq7fiZ8Ql4JIe813Rzj2RjzwSNchMT
         6+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dvZzIcDpzLIQZQiDVsXiUAZEvhWVKf8h7Q4GCW1UM2w=;
        b=SZ5IwuVup8slLbdln4LCptmxD/8dMx2xC7MvfXo8d6vsTe0ASmR6tex4JlBDtmV8uH
         B2MbH0B86P4ncte8FL5cJXzfaOPpg52Ut8jLlIjYoNIIl02aFF8SWpEH1qRGy2t5LVof
         yS0bhvX1dTAMlY3glAKU/feeSi/IOruHMeiqNyCPflJgXIyF/3vz0fAwjJ+j736tmEm/
         X3uhi0aEEveH22dp69dvRwbQePwVv6J2ITXHwVjn4fE3jX6msp2/Y2Bc1l2kB7Df1k7b
         mMDn+Z8pqcQ3qXRqx8gpvDlbDTuOh8Q2wJkEMxfK3qfon9oxLwCmvKtO4doHd36KhXhC
         C/cw==
X-Gm-Message-State: AOAM532DIJHMhu0WWCkqVVPpP2QoEofyMRYLa2WU3TaOR4bPwQeEkitx
	OgikPSrgmWrUTdDaU+N50sfPNOhgr4WTVuwYaCk=
X-Google-Smtp-Source: ABdhPJwBcYihicXEaZa+/jEoWfp5JUsTllJIMymH80xfNgaUmyTB6fDMhKnoJEJdLL8++tvqEkvyzbJQHckoRWzLJ0M=
X-Received: by 2002:a37:9ec9:: with SMTP id h192mr10967459qke.119.1618261823124;
 Mon, 12 Apr 2021 14:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210412070047.24229-1-naveen.kumar.saini@intel.com>
In-Reply-To: <20210412070047.24229-1-naveen.kumar.saini@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 12 Apr 2021 14:09:56 -0700
Message-ID: <CAMKF1sp3v6E5GQccDC8ykF=WYts0pp6xXLsds4M0+ivU1KDa4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] tbb: upgrade 2020.3 -> 2021.2.0
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

two issues still seen

mips - I think it needs to link with libatomic or perhaps it should do
a proper test for builtin atomic support.

https://errors.yoctoproject.org/Errors/Details/576519/

musl/arm64 - It needs to dect context swap functions and/or perhaps
link with libucontext when using musl

https://errors.yoctoproject.org/Errors/Details/576521/

On Sun, Apr 11, 2021 at 11:49 PM Naveen Saini
<naveen.kumar.saini@intel.com> wrote:
>
> Switched to cmake build tool.
>
> Rebased some patches due to directory re-structuring.
> Dropped patches, which are not required anymore.
>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>
> ---
> v2:
> Exclude for riscv machines
> Ref: https://github.com/oneapi-src/oneTBB/blob/onetbb_2021/src/tbb/CMake=
Lists.txt#L58
>
> v3:
> Instead of excluding riscv machines, disable ittnotify
>
> v4:
> Fix for gcc-11
> ---
>  ...akeLists.txt-exclude-riscv64-riscv32.patch | 42 +++++++++++++++++++
>  ...1-Disable-use-of-_tpause-instruction.patch | 34 +++++++++++++++
>  ...nfo-is-glibc-specific-API-mark-it-so.patch | 27 ++++++------
>  .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 22 ++++++----
>  .../tbb/tbb/cross-compile.patch               | 35 ----------------
>  .../tbb/tbb/improve-reproducibility.patch     | 30 -------------
>  meta-oe/recipes-support/tbb/tbb/tbb.pc        | 11 -----
>  .../tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.bb}    | 37 ++++++----------
>  8 files changed, 116 insertions(+), 122 deletions(-)
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-=
exclude-riscv64-riscv32.patch
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-=
_tpause-instruction.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibil=
ity.patch
>  delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
>  rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.bb}=
 (59%)
>
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude=
-riscv64-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.tx=
t-exclude-riscv64-riscv32.patch
> new file mode 100644
> index 000000000..ff6154808
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv6=
4-riscv32.patch
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
> +-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|ar=
m64)" OR
> ++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|ar=
m64|riscv64|riscv32)" OR
> +          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
> +          WINDOWS_STORE OR
> +          TBB_WINDOWS_DRIVER))
> +diff --git a/src/tbbmalloc/CMakeLists.txt b/src/tbbmalloc/CMakeLists.tx=
t
> +index de7ca7ea..31e854fe 100644
> +--- a/src/tbbmalloc/CMakeLists.txt
> ++++ b/src/tbbmalloc/CMakeLists.txt
> +@@ -28,7 +28,7 @@ target_compile_definitions(tbbmalloc
> +                            PRIVATE
> +                            __TBBMALLOC_BUILD)
> +
> +-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|ar=
m64)" OR
> ++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|ar=
m64|riscv64|riscv32)" OR
> +          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
> +          WINDOWS_STORE OR
> +          TBB_WINDOWS_DRIVER))
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause=
-instruction.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_t=
pause-instruction.patch
> new file mode 100644
> index 000000000..7a4cc3e4e
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instru=
ction.patch
> @@ -0,0 +1,34 @@
> +From 26bc87fdad9f29c00a5e37d6d9aed7f6dc7ff416 Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Mon, 12 Apr 2021 14:15:53 +0800
> +Subject: [PATCH] Disable use of _tpause instruction
> +
> +It is assuming right now that WAITPKG instructions are available when u=
sing
> +gcc 11 or clang 12. It's possible that we are building for a
> +CPU where it's not available - in this case anything older than Alder L=
ake.
> +
> +Disable for now until the detection isn't fixed upstream.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + src/tbb/scheduler_common.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/tbb/scheduler_common.h b/src/tbb/scheduler_common.h
> +index ee13dbf9..49052001 100644
> +--- a/src/tbb/scheduler_common.h
> ++++ b/src/tbb/scheduler_common.h
> +@@ -219,7 +219,7 @@ inline void prolonged_pause_impl() {
> + #endif
> +
> + inline void prolonged_pause() {
> +-#if __TBB_WAITPKG_INTRINSICS_PRESENT && (_WIN32 || _WIN64 || __linux__=
) && (__TBB_x86_32 || __TBB_x86_64)
> ++#if 0
> +     if (governor::wait_package_enabled()) {
> +         std::uint64_t time_stamp =3D machine_time_stamp();
> +         // _tpause function directs the processor to enter an implemen=
tation-dependent optimized state
> +--
> +2.29.0
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-spec=
ific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-i=
s-glibc-specific-API-mark-it-so.patch
> index 7e66945fa..49325447e 100644
> --- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-AP=
I-mark-it-so.patch
> +++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-AP=
I-mark-it-so.patch
> @@ -1,22 +1,23 @@
> -From 6b2b136caa68912d77ffe26143cd3da768b9ef80 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 3 Jun 2017 08:39:37 -0700
> +From 52c1586bff0ecb418ac21d6678f8963d70959f04 Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Wed, 7 Apr 2021 11:14:13 +0800
>  Subject: [PATCH] mallinfo() is glibc specific API mark it so
>
>  Helps compiling with musl
>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
>  Upstream-Status: Pending
>
> - src/tbbmalloc/proxy.cpp | 2 ++
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> +---
> + src/tbbmalloc_proxy/proxy.cpp | 2 ++
>   1 file changed, 2 insertions(+)
>
> -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> -index 5ef279d..06c4872 100644
> ---- a/src/tbbmalloc/proxy.cpp
> -+++ b/src/tbbmalloc/proxy.cpp
> -@@ -185,6 +185,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
> +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.=
cpp
> +index f9942bf1..fe0dad89 100644
> +--- a/src/tbbmalloc_proxy/proxy.cpp
> ++++ b/src/tbbmalloc_proxy/proxy.cpp
> +@@ -253,6 +253,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
>       return 1;
>   }
>
> @@ -24,7 +25,7 @@ index 5ef279d..06c4872 100644
>   struct mallinfo mallinfo() __THROW
>   {
>       struct mallinfo m;
> -@@ -192,6 +193,7 @@ struct mallinfo mallinfo() __THROW
> +@@ -260,6 +261,7 @@ struct mallinfo mallinfo() __THROW
>
>       return m;
>   }
> @@ -33,5 +34,5 @@ index 5ef279d..06c4872 100644
>   #if __ANDROID__
>   // Android doesn't have malloc_usable_size, provide it to be compatibl=
e
>  --
> -2.13.0
> +2.17.1
>
> diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined=
-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-define=
d-on-musl.patch
> index 6f28f6f3a..fb10684cd 100644
> --- a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-mus=
l.patch
> +++ b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-mus=
l.patch
> @@ -1,7 +1,7 @@
> -From 27956d4c5fb615098231cebfb8eef11057639d3c Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 8 Dec 2019 18:14:38 +0100
> -Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined=
 on
> +From 5cac8b5fffa4ebf5f0090456c9e0cbf43827242a Mon Sep 17 00:00:00 2001
> +From: Naveen Saini <naveen.kumar.saini@intel.com>
> +Date: Wed, 7 Apr 2021 11:32:52 +0800
> +Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined=
 on
>   musl
>
>  Do not call __GLIBC_PREREQ if it is not defined otherwise build will
> @@ -12,14 +12,15 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gm=
ail.com>
>  Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/2=
03]
>
>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
>  ---
> - src/tbbmalloc/proxy.cpp | 6 ++++--
> + src/tbbmalloc_proxy/proxy.cpp | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> -index d96ae7a0..709ae839 100644
> ---- a/src/tbbmalloc/proxy.cpp
> -+++ b/src/tbbmalloc/proxy.cpp
> +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.=
cpp
> +index fe0dad89..93e68049 100644
> +--- a/src/tbbmalloc_proxy/proxy.cpp
> ++++ b/src/tbbmalloc_proxy/proxy.cpp
>  @@ -24,7 +24,8 @@
>   // of aligned_alloc as required by new C++ standard, this makes it har=
d to
>   // redefine aligned_alloc here. However, running on systems with new l=
ibc
> @@ -40,3 +41,6 @@ index d96ae7a0..709ae839 100644
>   #endif // __linux__ && !__ANDROID__
>
>   #include "proxy.h"
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-=
oe/recipes-support/tbb/tbb/cross-compile.patch
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
> --CPLUS ?=3D clang++
> --CONLY ?=3D clang
> -+CPLUS ?=3D $(CXX)
> -+CONLY ?=3D $(CC)
> - COMPILE_ONLY =3D -c -MMD
> - PREPROC_ONLY =3D -E -x c++
> - INCLUDE_KEY =3D -I
> -diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> -index d820c15d..62c76afd 100644
> ---- a/build/linux.gcc.inc
> -+++ b/build/linux.gcc.inc
> -@@ -12,8 +12,8 @@
> - # See the License for the specific language governing permissions and
> - # limitations under the License.
> -
> --CPLUS ?=3D g++
> --CONLY ?=3D gcc
> -+CPLUS ?=3D $(CXX)
> -+CONLY ?=3D $(CC)
> - COMPILE_ONLY =3D -c -MMD
> - PREPROC_ONLY =3D -E -x c++
> - INCLUDE_KEY =3D -I
> diff --git a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.pat=
ch b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
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
> -Upstream-Status: Inappropriate [sed WORKDIR does not applies to upstrea=
m]
> -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ----
> - build/version_info_linux.sh | 4 +-
> - 1 file changed, 2 insertion(+), 2 deletion(-)
> -
> -diff --git a/build/version_info_linux.sh b/build/version_info_linux.sh
> -index 793cad11..ed6f4b2a 100644
> ---- a/build/version_info_linux.sh
> -+++ b/build/version_info_linux.sh
> -@@ -25,6 +25,6 @@ echo '#N": BUILD_GCC'"\t\t"`g++ --version </dev/null =
2>&1 | grep 'g++'`'" ENDL \
> - echo '#N": BUILD_LIBC'"\t"`getconf GNU_LIBC_VERSION | grep glibc | sed=
 -e 's/^glibc //'`'" ENDL \'
> - echo '#N": BUILD_LD'"\t\t"`ld -v 2>&1 | grep 'version'`'" ENDL \'
> - echo '#N": BUILD_TARGET'"\t$arch on $runtime"'" ENDL \'
> --echo '#N": BUILD_COMMAND'"\t"$*'" ENDL \'
> -+echo '#N": BUILD_COMMAND'"\t"$(echo $* | sed 's#'$WORKDIR'#/workdir#g'=
)'" ENDL \'
> - echo ""
> --echo "#define __TBB_DATETIME \""`date -u`"\""
> -+echo "#define __TBB_DATETIME \""`$(date -u -d "@$SOURCE_DATE_EPOCH"  2=
>/dev/null || date -u -r "$SOURCE_DATE_EPOCH"  2>/dev/null || date -u )`"\"=
"
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-su=
pport/tbb/tbb/tbb.pc
> deleted file mode 100644
> index 4f9da1140..000000000
> --- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=3D/usr
> -exec_prefix=3D${prefix}
> -libdir=3D${exec_prefix}/lib
> -includedir=3D${prefix}/include
> -
> -Name: Threading Building Blocks
> -Description: Intel's parallelism library for C++
> -URL: https://software.intel.com/en-us/tbb
> -Version: 2020.2
> -Libs: -L${libdir} -ltbb
> -Cflags: -I${includedir}
> diff --git a/meta-oe/recipes-support/tbb/tbb_2020.3.bb b/meta-oe/recipes=
-support/tbb/tbb_2021.2.0.bb
> similarity index 59%
> rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
> rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> index 8e0094b31..d0e231140 100644
> --- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
> +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> @@ -5,37 +5,26 @@ DESCRIPTION =3D "Parallelism library for C++ - runtime=
 files \
>      and threading mechanism for performance and scalability."
>  HOMEPAGE =3D "https://software.intel.com/en-us/tbb"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f=
4327"
> -BRANCH =3D "tbb_2020"
> -SRCREV =3D "eca91f16d7490a8abfdee652dadf457ec820cc37"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986=
968f4327"
> +BRANCH =3D "onetbb_2021"
> +SRCREV =3D "2dba2072869a189b9fdab3ffa431d3ea49059a19"
>  SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;br=
anch=3D${BRANCH} \
> -           file://cross-compile.patch \
> -           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch =
\
> -           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> -           file://tbb.pc \
> -           file://improve-reproducibility.patch \
> +            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch=
 \
> +            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> +            file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
> +            file://0001-Disable-use-of-_tpause-instruction.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> -PE =3D "1"
>
> -COMPILER ?=3D "gcc"
> -COMPILER_toolchain-clang =3D "clang"
> +inherit cmake
>
> -do_compile() {
> -    oe_runmake compiler=3D${COMPILER} arch=3D${HOST_ARCH}
> -}
> +# test build fails, error: 'mallinfo mallinfo()' is deprecated
> +EXTRA_OECMAKE +=3D " \
> +                    -DTBB_TEST=3DOFF \
> +                    -DCMAKE_BUILD_TYPE=3DRelease \
> +                "
>
> -do_install() {
> -    install -d ${D}${includedir} ${D}${libdir}
> -    rm ${S}/include/tbb/index.html -f
> -    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/include/tbb =
${D}${includedir}
> -    for f in ${B}/build/linux_*_release/lib*.so*
> -    do
> -        install -Dm 0755 $f ${D}${libdir}/
> -    done
> -    install -Dm 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig/tbb.pc
> -}
>
>  # fails with thumb enabled:
>  # | arm-oe-linux-gnueabi-g++  -march=3Darmv7-a -mthumb -mthumb-interwor=
k -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a9 -mcpu=3Dcortex-a9 -D=
__ARM__ -D__LINUX_ARM_ARCH__=3D7 -funwind-tables -mvectorize-with-neon-quad=
 -rdynamic --sysroot=3D/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0 -=
DUSE_PTHREAD -fPIC -D__TBB_BUILD=3D1 -Wall -Wno-parentheses -Wno-non-virtua=
l-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibilit=
y-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ../.=
./src/tbb/concurrent_queue.cpp
> --
> 2.17.1
>
>
>=20
>
