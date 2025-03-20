Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CC6C35FFC
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 03:12:56 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.282.1742440366071430438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 20:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZyB8z5H;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60208b7a6d6so81770eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742440365; x=1743045165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NQrHbeNyJtZXI/k2+YQ5Dd5tSZzY564PDTRh7HUv+k=;
        b=BZyB8z5HFJpmZnPhuIEh2nwzoC2UgT0safQZGoQtO7xUU4qSILPisiUuJf/tput8DK
         Vjp8XAoadXGyosizvzGKpsCJJAQLk2n7mU+TUWrRGtlH1NqBZ86NicVT2uJl6Q1KZoxh
         pkulloVEukildBvkVSCYprPhzxLNQ2BYScmsz5yHce+3sZhyaF4KwL1x1PdtFn0l8cGy
         5OWu0PzbhJPpu8UmFxjXxc6dLxwTuCMPllj/Om6wH7z+PznQL/jZOttNmippf0m5bVXz
         wslYt3a3yyGydiVPmSwAl1wl8U9gDkT9kDeBo8RollkMdA02VNfMJ8YCWKYWK3/zaHcx
         CjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742440365; x=1743045165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NQrHbeNyJtZXI/k2+YQ5Dd5tSZzY564PDTRh7HUv+k=;
        b=GNqU0hxCiKcDFtbSycRU2y6p/nMCnMsH1sbVLXZubZimavbD5UpKIcwlz1o2vgvt75
         XDmzc2mhfMchMdJzMiyqGaO0jTFwIZ7tost7WynIS1FfrNkae8mpKSutFQS5U9MYKr55
         SZYkkrQFwFYt1Xyo8ZEe6erVXYs2/qQLnfdD0Zjqfa0zyRjVqbCDxlmWHLS//FiU4Ygg
         hl4EVXID5iMueOsuFczQrkceey7Jv+A0OvbAck8ontwbwaAvncdiSu/FhvjMf4vcvg8T
         y/T451Gr7FpmCQlCCNYn0VzH+9r5nVzGHbW8qmVSko6NcnL/ZlW8rZfybwOZZR5Snt9Z
         74WA==
X-Forwarded-Encrypted: i=1; AJvYcCWn2KLmw/71Y2KSPYunyDbO0yw8cbkGEuJqwa2GNGvJy1LDeS/C+f9SGxtr11HqBHI3pnJcNwyw64Lz89OjnmHaskI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3wEi//cifcSgLflbT3vnFnqItJn2pkQftHMz3lDXG9A2acg5z
	ejTKYZsOqzcFrS/DaIUD8ok85O6cXXtZ3m2xRNC5WojFlqwIQqA/g594ET4swRxI9RAu1pk78Iw
	k1I537/Hy0oReCL1KWc1KkU7QBdQ=
X-Gm-Gg: ASbGncuVcwUv46LMrDuJ41c88WHkdwb1bq4SchStsqRGIC9DVcHV5vQudTor+3q2ShI
	pS4q1hBcjvaMQeIzEC3TltKuZJP7Kz2VnVVP6M0ztf/hrUaIpDYzgu2QJCvF8pvL0wthujbmFOO
	cW12ydSo/a/ydr/0RScS1JxMav
X-Google-Smtp-Source: AGHT+IEE+2j90sqTqtsaotreILA0JrHTSOMriD41Nh108fVc1loBzLrfWADe/PdB+nCVJJrMSKFM/+qGKQvLfoYv9iM=
X-Received: by 2002:a05:6820:4617:b0:600:1feb:830f with SMTP id
 006d021491bc7-6021e42bdc2mr2878148eaf.4.1742440365155; Wed, 19 Mar 2025
 20:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
 <20250317060612.4111152-1-hongxu.jia@windriver.com> <10d699be-2918-4dd3-b892-ef87b8e0a7be@windriver.com>
In-Reply-To: <10d699be-2918-4dd3-b892-ef87b8e0a7be@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 20:12:19 -0700
X-Gm-Features: AQ5f1JoJTZpBMtZ0y05QX4LohfYxy6FIV-ltODkTAU6_NX3A72Ckb4PPiBeJ82Y
Message-ID: <CAMKF1sqNMaLry1AWr0XsZRkh0Vr_qr+qcJRLSFMWUA5VP=LJCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v4] protobuf: 4.25.5 -> 4.30.0
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 03:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116115

btw this breaks qtgrpc from meta-qt6

| /mnt/b/yoe/master/build/tmp/work/x86_64-linux/qtgrpc-native/6.9.0/git/src=
/tools/qtprotobufgen/qprotobufgenerator.cpp:205:82:
error: could not convert
=E2=80=98file->google::protobuf::FileDescriptor::dependency(i)->google::pro=
tobuf::FileDescriptor::name()=E2=80=99
from =E2=80=98google::protobuf::internal::DescriptorStringView=E2=80=99 {ak=
a
=E2=80=98std::basic_string_view<char>=E2=80=99} to =E2=80=98std::string=E2=
=80=99 {aka
=E2=80=98std::__cxx11::basic_string<char>=E2=80=99}
|   205 |
internalIncludes.insert(utils::removeFileSuffix(file->dependency(i)->name()=
)
|       |
~~~~~~~~~~~~~~~~~~~~~~~~~^~
|       |
                    |
|       |
                    google::protobuf::internal::DescriptorStringView
{aka std::basic_string_view<char>}

On Wed, Mar 19, 2025 at 10:46=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-03-17 2:06 a.m., hongxu via lists.openembedded.org wrote:
>
> Refresh local patches
> - 0001-Fix-build-on-mips-clang.patch
> - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>
> Fix protobuf-native build failure with gcc 10
>
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++------
>  ...buf-native-build-failure-with-gcc-10.patch | 43 +++++++++++++++++++
>  ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  5 ++-
>
>
> Ping Khem:
>     Does that fix the ubu-20.04 problem?
>
> Also, Hongxu, should the python package also be updated?
>
> =E2=9D=AF fd protobuf_4
> meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
>
> ../Randy
>
>
>  4 files changed, 76 insertions(+), 23 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-p=
rotobuf-native-build-failure-with-gcc-10.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> protob=
uf_4.30.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on=
-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-bui=
ld-on-mips-clang.patch
> index 9f6116c4c4..6db22c26d3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
> @@ -1,6 +1,6 @@
> -From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
> +From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 31 Oct 2021 23:39:44 -0700
> +Date: Mon, 10 Mar 2025 19:59:19 -0700
>  Subject: [PATCH] Fix build on mips/clang
>
>  clang13 crashes on mips, until its fixed upstream disable tailcall on
> @@ -10,17 +10,25 @@ https://bugs.llvm.org/show_bug.cgi?id=3D52367
>
>  Upstream-Status: Inappropriate [Clang workaround]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - src/google/protobuf/port_def.inc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + src/google/protobuf/port_def.inc | 1 +
> + 1 file changed, 1 insertion(+)
>
> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
> +index 35f49afb4..e9597af0d 100644
>  --- a/src/google/protobuf/port_def.inc
>  +++ b/src/google/protobuf/port_def.inc
> -@@ -255,6 +255,7 @@
> +@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
>   #error PROTOBUF_TAILCALL was previously defined
>   #endif
> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> + #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
>  +    !defined(__mips__) && \
> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> -     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
> + // Compilation fails on ARM32: b/195943306
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Mak=
efile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/p=
rotobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.=
patch
> index 7c4bf260eb..1b68c24c96 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,13 +1,12 @@
> -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
> +From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Fri, 28 Jun 2019 13:50:52 +0000
> -Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
> - with gold
> +Date: Thu, 13 Mar 2025 10:54:01 +0800
> +Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
>
>  * move pkg-config call to separate variable, so that the final version
>    of the whole command so it's shown in log.do_compile_ptest_base
>  * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
> -  add_person_cpp otherwise it fails to link with gold:
> +  add_person_cpp otherwise it fails:
>    i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc -=
o add_person_cpp `pkg-config --cflags --libs protobuf`
>    /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto:=
 error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftime=
stamp_2eproto'
>    /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto=
_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2f=
timestamp_2eproto'
> @@ -25,12 +24,14 @@ Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   examples/Makefile | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index ef7a4ef58..7206e14e1 100644
> +index 5290fdb03f..3b9545bf2a 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -2,6 +2,8 @@
> @@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
>   all: cpp java python
>
>   cpp:    add_person_cpp    list_people_cpp
> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> +@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
>
>   add_person_cpp: add_person.cc protoc_middleman
>   pkg-config --cflags protobuf  # fails if protobuf is not installed
> -- c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pk=
g-config --cflags --libs protobuf`
> -+ $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -=
std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
> +- c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cf=
lags --libs protobuf`
> ++ $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>   pkg-config --cflags protobuf  # fails if protobuf is not installed
> -- c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_cpp `=
pkg-config --cflags --libs protobuf`
> -+ $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX)=
 -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_c=
pp
> +- c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --=
cflags --libs protobuf`
> ++ $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> ---
> +--
>  2.34.1
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf=
-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protobuf=
/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
> new file mode 100644
> index 0000000000..d7c9f38eff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native=
-build-failure-with-gcc-10.patch
> @@ -0,0 +1,43 @@
> +From 03dabf4b153071ec1bdcd2c278461984cc6f1714 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 17 Mar 2025 13:28:13 +0800
> +Subject: [PATCH] fix protobuf-native build failure with gcc 10
> +
> +Build protobuf-native failed on ubuntu 20.04 which has gcc 10
> +
> +protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
> +error: static assertion failed: Protobuf only supports C+
> +   =E2=86=AA +17 and newer.
> +   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
> +   |       |                                   ~~~~~~~~~~~~~^~~~~
> +   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30.0=
/git/src/google/protobuf/port_def.inc:119:15:
> +note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
> +   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
> +   |       |               ^~~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ae3c324..eda19aa 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -14,6 +14,10 @@ endif()
> + # Project
> + project(protobuf C CXX)
> +
> ++set(CMAKE_CXX_STANDARD 17)
> ++set(CMAKE_CXX_STANDARD_REQUIRED ON)
> ++set(CMAKE_CXX_EXTENSIONS OFF)
> ++
> + if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
> +   if(CMAKE_PROJECT_NAME STREQUAL "protobuf")
> +     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR} DIRECTO=
RY)
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> index a470a7c643..0d6123dfa0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> @@ -14,11 +14,12 @@ LIC_FILES_CHKSUM =3D " \
>  DEPENDS =3D "zlib abseil-cpp jsoncpp"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
> -SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
> +SRCREV =3D "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
>
> -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25.x=
;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D30.x=
;protocol=3Dhttps \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
> +           file://0001-fix-protobuf-native-build-failure-with-gcc-10.pat=
ch \
>             "
>  SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on-mips-=
clang.patch "
>  SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-on-mip=
s-clang.patch "
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116020): https://lists.openembedded.org/g/openembedde=
d-devel/message/116020
> Mute This Topic: https://lists.openembedded.org/mt/111744582/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

