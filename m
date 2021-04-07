Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.10921.1617816772403748816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 10:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E2qYK0V6;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id c3so19569723qkc.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dSV+TvAFZwoA8uEJA8bj4pyYrKYWU+IgEBT8mDBB2/4=;
        b=E2qYK0V6gYDRBYzfGgPxEcO+q4lUE0s4yhtcYLSCFVSCoMrnugKfbMyv8hOMlm5NBl
         mDvulNVz+Xzyqqrjrva+1WAiNpy2Xt/YMDFwQXGsnuAjsikSZ+v5q2/JQOzARZ8VlxjF
         1RgeZ1sypRCm0UojAtzN3olCfng+HABshU3rdVte3+OTmmMXX7bEEOf5JyYs/hkLB4u7
         4U90UVCiCgncvfXPmn7ZjU7vBeI7xAH5ebugNawyWBPWfl3qAe6aLjArIOMBzcKojk0L
         lmxCRxItZfJOm+cOOcFUFDMPRz+qV877IIZ0e5525ylffZVqCOfxuZA/4uhzu/8DXIms
         8ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dSV+TvAFZwoA8uEJA8bj4pyYrKYWU+IgEBT8mDBB2/4=;
        b=apKZ9NtIKncDTnBBfu0Rj9lzHc76YnRsZXUPQ7YV3ayF4v7/kvCN9ij+TCEtIRUfo1
         MBBLumuNFEGo8aUUoxGnTWChpMlbNeRNE6XUWbfNITk+X/RQ29ktAcbXAc1cPSwihc4F
         s/hOZMuDhf5WcZramXJGC78VTDSYkYG9n950G7x+rCgudG6YS1YsLK9Cxit4tG4PR7/R
         8bKnYcSy+ANbt/uK9t1qhLiLWGgIiyxzXSH08IfCJ66eL/nWYNKVrOCutliJORSDWe3Q
         I7lRICN/M2JmtUccvE3l26+E2mylKJcnB47MXAr20BlF1ZXjsUl72w/eofCm1XZ5PJGe
         dnZg==
X-Gm-Message-State: AOAM532iGppf+8r4kT2+ZbNi6lNLaSfFO0LmrKCxNCkGrk7xokHiG3U0
	Rrl5tvwa4B+eHV7/F2BmPztKWZdC1Z2ZKQODZk0=
X-Google-Smtp-Source: ABdhPJxpxjcJaEs4XhWbmYI4JlxB2nGhqC6Bbd0xM7hcQ4bPNKGj+KG0+j8rykmXu+H17WDhoagBArni5xDpCrdS32M=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr4292253qka.119.1617816771246;
 Wed, 07 Apr 2021 10:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210407062210.5883-1-naveen.kumar.saini@intel.com> <CAMKF1srrwWUT0q-0q6zS+=bv5pLZc25zLuhROfd5CZpW4YUu=g@mail.gmail.com>
In-Reply-To: <CAMKF1srrwWUT0q-0q6zS+=bv5pLZc25zLuhROfd5CZpW4YUu=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 10:32:25 -0700
Message-ID: <CAMKF1sqndeKvqZwu_UNp40EmtVVzbKhZynK8U=-xt+Pe=rBLww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tbb: upgrade 2020.3 -> 2021.2.0
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 7, 2021 at 7:25 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/575697/
>
> opencv is looking for a tbb header which is not there
>

This is fixed in 4.5.2 release so I have a local patch for opencv upgrade
however there are additional arches failing to build

rv64 - https://errors.yoctoproject.org/Errors/Details/575734/
rv32 - https://errors.yoctoproject.org/Errors/Details/575733/
x86/musl - https://errors.yoctoproject.org/Errors/Details/575731/
x86_64 - https://errors.yoctoproject.org/Errors/Details/575732/
musl - https://errors.yoctoproject.org/Errors/Details/575728/

you might want to link with libucontext in when using musl.

This is with GCC 11 btw but I. think most of them I not related to gcc ver=
sion.

> On Tue, Apr 6, 2021 at 11:10 PM Naveen Saini
> <naveen.kumar.saini@intel.com> wrote:
> >
> > Switched to cmake build tool.
> >
> > Rebased some patches due to directory re-structuring.
> > Dropped patches, which are not required anymore.
> >
> > Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > ---
> >  ...nfo-is-glibc-specific-API-mark-it-so.patch | 27 +++++++-------
> >  .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 22 +++++++-----
> >  .../tbb/tbb/cross-compile.patch               | 35 ------------------=
-
> >  .../tbb/tbb/improve-reproducibility.patch     | 30 ----------------
> >  meta-oe/recipes-support/tbb/tbb/tbb.pc        | 11 ------
> >  .../tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.bb}    | 35 ++++++----------=
---
> >  6 files changed, 38 insertions(+), 122 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patc=
h
> >  delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducib=
ility.patch
> >  delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
> >  rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb =3D> tbb_2021.2.0.b=
b} (59%)
> >
> > diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-sp=
ecific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo=
-is-glibc-specific-API-mark-it-so.patch
> > index 7e66945fa..49325447e 100644
> > --- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-=
API-mark-it-so.patch
> > +++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-=
API-mark-it-so.patch
> > @@ -1,22 +1,23 @@
> > -From 6b2b136caa68912d77ffe26143cd3da768b9ef80 Mon Sep 17 00:00:00 200=
1
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 3 Jun 2017 08:39:37 -0700
> > +From 52c1586bff0ecb418ac21d6678f8963d70959f04 Mon Sep 17 00:00:00 200=
1
> > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > +Date: Wed, 7 Apr 2021 11:14:13 +0800
> >  Subject: [PATCH] mallinfo() is glibc specific API mark it so
> >
> >  Helps compiling with musl
> >
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> >  Upstream-Status: Pending
> >
> > - src/tbbmalloc/proxy.cpp | 2 ++
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> > +---
> > + src/tbbmalloc_proxy/proxy.cpp | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> > -index 5ef279d..06c4872 100644
> > ---- a/src/tbbmalloc/proxy.cpp
> > -+++ b/src/tbbmalloc/proxy.cpp
> > -@@ -185,6 +185,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
> > +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/prox=
y.cpp
> > +index f9942bf1..fe0dad89 100644
> > +--- a/src/tbbmalloc_proxy/proxy.cpp
> > ++++ b/src/tbbmalloc_proxy/proxy.cpp
> > +@@ -253,6 +253,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
> >       return 1;
> >   }
> >
> > @@ -24,7 +25,7 @@ index 5ef279d..06c4872 100644
> >   struct mallinfo mallinfo() __THROW
> >   {
> >       struct mallinfo m;
> > -@@ -192,6 +193,7 @@ struct mallinfo mallinfo() __THROW
> > +@@ -260,6 +261,7 @@ struct mallinfo mallinfo() __THROW
> >
> >       return m;
> >   }
> > @@ -33,5 +34,5 @@ index 5ef279d..06c4872 100644
> >   #if __ANDROID__
> >   // Android doesn't have malloc_usable_size, provide it to be compati=
ble
> >  --
> > -2.13.0
> > +2.17.1
> >
> > diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defin=
ed-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defi=
ned-on-musl.patch
> > index 6f28f6f3a..fb10684cd 100644
> > --- a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-m=
usl.patch
> > +++ b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-m=
usl.patch
> > @@ -1,7 +1,7 @@
> > -From 27956d4c5fb615098231cebfb8eef11057639d3c Mon Sep 17 00:00:00 200=
1
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Sun, 8 Dec 2019 18:14:38 +0100
> > -Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defin=
ed on
> > +From 5cac8b5fffa4ebf5f0090456c9e0cbf43827242a Mon Sep 17 00:00:00 200=
1
> > +From: Naveen Saini <naveen.kumar.saini@intel.com>
> > +Date: Wed, 7 Apr 2021 11:32:52 +0800
> > +Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defin=
ed on
> >   musl
> >
> >  Do not call __GLIBC_PREREQ if it is not defined otherwise build will
> > @@ -12,14 +12,15 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@=
gmail.com>
> >  Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull=
/203]
> >
> >  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > +Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> >  ---
> > - src/tbbmalloc/proxy.cpp | 6 ++++--
> > + src/tbbmalloc_proxy/proxy.cpp | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > -diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
> > -index d96ae7a0..709ae839 100644
> > ---- a/src/tbbmalloc/proxy.cpp
> > -+++ b/src/tbbmalloc/proxy.cpp
> > +diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/prox=
y.cpp
> > +index fe0dad89..93e68049 100644
> > +--- a/src/tbbmalloc_proxy/proxy.cpp
> > ++++ b/src/tbbmalloc_proxy/proxy.cpp
> >  @@ -24,7 +24,8 @@
> >   // of aligned_alloc as required by new C++ standard, this makes it h=
ard to
> >   // redefine aligned_alloc here. However, running on systems with new=
 libc
> > @@ -40,3 +41,6 @@ index d96ae7a0..709ae839 100644
> >   #endif // __linux__ && !__ANDROID__
> >
> >   #include "proxy.h"
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/met=
a-oe/recipes-support/tbb/tbb/cross-compile.patch
> > deleted file mode 100644
> > index 36578543f..000000000
> > --- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > -
> > -Upstream-Status: unsuitable
> > ----
> > -
> > -diff --git a/build/linux.clang.inc b/build/linux.clang.inc
> > -index fe9b5c98..b0dcd68b 100644
> > ---- a/build/linux.clang.inc
> > -+++ b/build/linux.clang.inc
> > -@@ -12,8 +12,8 @@
> > - # See the License for the specific language governing permissions an=
d
> > - # limitations under the License.
> > -
> > --CPLUS ?=3D clang++
> > --CONLY ?=3D clang
> > -+CPLUS ?=3D $(CXX)
> > -+CONLY ?=3D $(CC)
> > - COMPILE_ONLY =3D -c -MMD
> > - PREPROC_ONLY =3D -E -x c++
> > - INCLUDE_KEY =3D -I
> > -diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> > -index d820c15d..62c76afd 100644
> > ---- a/build/linux.gcc.inc
> > -+++ b/build/linux.gcc.inc
> > -@@ -12,8 +12,8 @@
> > - # See the License for the specific language governing permissions an=
d
> > - # limitations under the License.
> > -
> > --CPLUS ?=3D g++
> > --CONLY ?=3D gcc
> > -+CPLUS ?=3D $(CXX)
> > -+CONLY ?=3D $(CC)
> > - COMPILE_ONLY =3D -c -MMD
> > - PREPROC_ONLY =3D -E -x c++
> > - INCLUDE_KEY =3D -I
> > diff --git a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.p=
atch b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
> > deleted file mode 100644
> > index 91d10cb7a..000000000
> > --- a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From f56eeb18a07df139864a99e1967d450cc5c8c0bb Mon Sep 17 00:00:00 200=
1
> > -From: Lee Chee Yang <chee.yang.lee@intel.com>
> > -Date: Wed, 30 Sep 2020 16:18:35 +0800
> > -Subject: [PATCH] improve reproducibility
> > -
> > -remove the WORKDIR info from BUILD_COMMAND to improve reproducibility=
.
> > -also use SOURCE_DATE_EPOCH as DATETIME wherever possible.
> > -
> > -Upstream-Status: Inappropriate [sed WORKDIR does not applies to upstr=
eam]
> > -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > ----
> > - build/version_info_linux.sh | 4 +-
> > - 1 file changed, 2 insertion(+), 2 deletion(-)
> > -
> > -diff --git a/build/version_info_linux.sh b/build/version_info_linux.s=
h
> > -index 793cad11..ed6f4b2a 100644
> > ---- a/build/version_info_linux.sh
> > -+++ b/build/version_info_linux.sh
> > -@@ -25,6 +25,6 @@ echo '#N": BUILD_GCC'"\t\t"`g++ --version </dev/nul=
l 2>&1 | grep 'g++'`'" ENDL \
> > - echo '#N": BUILD_LIBC'"\t"`getconf GNU_LIBC_VERSION | grep glibc | s=
ed -e 's/^glibc //'`'" ENDL \'
> > - echo '#N": BUILD_LD'"\t\t"`ld -v 2>&1 | grep 'version'`'" ENDL \'
> > - echo '#N": BUILD_TARGET'"\t$arch on $runtime"'" ENDL \'
> > --echo '#N": BUILD_COMMAND'"\t"$*'" ENDL \'
> > -+echo '#N": BUILD_COMMAND'"\t"$(echo $* | sed 's#'$WORKDIR'#/workdir#=
g')'" ENDL \'
> > - echo ""
> > --echo "#define __TBB_DATETIME \""`date -u`"\""
> > -+echo "#define __TBB_DATETIME \""`$(date -u -d "@$SOURCE_DATE_EPOCH" =
 2>/dev/null || date -u -r "$SOURCE_DATE_EPOCH"  2>/dev/null || date -u )`"=
\""
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-=
support/tbb/tbb/tbb.pc
> > deleted file mode 100644
> > index 4f9da1140..000000000
> > --- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -prefix=3D/usr
> > -exec_prefix=3D${prefix}
> > -libdir=3D${exec_prefix}/lib
> > -includedir=3D${prefix}/include
> > -
> > -Name: Threading Building Blocks
> > -Description: Intel's parallelism library for C++
> > -URL: https://software.intel.com/en-us/tbb
> > -Version: 2020.2
> > -Libs: -L${libdir} -ltbb
> > -Cflags: -I${includedir}
> > diff --git a/meta-oe/recipes-support/tbb/tbb_2020.3.bb b/meta-oe/recip=
es-support/tbb/tbb_2021.2.0.bb
> > similarity index 59%
> > rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
> > rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > index 8e0094b31..357fbba34 100644
> > --- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
> > +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > @@ -5,37 +5,24 @@ DESCRIPTION =3D "Parallelism library for C++ - runti=
me files \
> >      and threading mechanism for performance and scalability."
> >  HOMEPAGE =3D "https://software.intel.com/en-us/tbb"
> >  LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd898696=
8f4327"
> > -BRANCH =3D "tbb_2020"
> > -SRCREV =3D "eca91f16d7490a8abfdee652dadf457ec820cc37"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D86d3f3a95c324c9479bd89=
86968f4327"
> > +BRANCH =3D "onetbb_2021"
> > +SRCREV =3D "2dba2072869a189b9fdab3ffa431d3ea49059a19"
> >  SRC_URI =3D "git://github.com/oneapi-src/oneTBB.git;protocol=3Dhttps;=
branch=3D${BRANCH} \
> > -           file://cross-compile.patch \
> > -           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patc=
h \
> > -           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> > -           file://tbb.pc \
> > -           file://improve-reproducibility.patch \
> > +            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.pat=
ch \
> > +            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
> >  "
> >
> >  S =3D "${WORKDIR}/git"
> > -PE =3D "1"
> >
> > -COMPILER ?=3D "gcc"
> > -COMPILER_toolchain-clang =3D "clang"
> > +inherit cmake
> >
> > -do_compile() {
> > -    oe_runmake compiler=3D${COMPILER} arch=3D${HOST_ARCH}
> > -}
> > +# test build fails, error: 'mallinfo mallinfo()' is deprecated
> > +EXTRA_OECMAKE +=3D " \
> > +                    -DTBB_TEST=3DOFF \
> > +                    -DCMAKE_BUILD_TYPE=3DRelease \
> > +                "
> >
> > -do_install() {
> > -    install -d ${D}${includedir} ${D}${libdir}
> > -    rm ${S}/include/tbb/index.html -f
> > -    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/include/tb=
b ${D}${includedir}
> > -    for f in ${B}/build/linux_*_release/lib*.so*
> > -    do
> > -        install -Dm 0755 $f ${D}${libdir}/
> > -    done
> > -    install -Dm 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig/tbb.pc
> > -}
> >
> >  # fails with thumb enabled:
> >  # | arm-oe-linux-gnueabi-g++  -march=3Darmv7-a -mthumb -mthumb-interw=
ork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a9 -mcpu=3Dcortex-a9 =
-D__ARM__ -D__LINUX_ARM_ARCH__=3D7 -funwind-tables -mvectorize-with-neon-qu=
ad -rdynamic --sysroot=3D/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0=
 -DUSE_PTHREAD -fPIC -D__TBB_BUILD=3D1 -Wall -Wno-parentheses -Wno-non-virt=
ual-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibil=
ity-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ..=
/../src/tbb/concurrent_queue.cpp
> > --
> > 2.17.1
> >
> >
> >=20
> >
