Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041D7C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 23:32:15 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.25207.1741735934504934970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 16:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QFfsajWY;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f556b90790so1805227b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 16:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735934; x=1742340734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJoFtcX5bnyvHEQRQ760BLG6AZZhXWat9Nk5QPvs85s=;
        b=QFfsajWYo03SCI9Bxueq+Fh0Bd9J4vbuNJ7uu05ebDXUFAsZ0UrOUQxRlmGK6QTH7M
         8YD8R49x+RSM6I79zhK5Xk+18LHRAf702NIp33PfIFmmqij/p5WmJt7jqavxOEVocTID
         RJL3K6KtA8GLDOQVgHnziSwxWOiZ+7MsuA5qH7WBF2dybWDpFygKAqkMmbJLBUAw2dKG
         OSSGeGSDvt96G3qmW2f+VO2LDUtgWi0EU5FUWuiBexxE07ahj+KRT4mLy6R6dL5TjbZh
         N4DjJR9v/HrOjZlt47OFiYah6KLtXiPyff6LXiN009zDuD/M/5fgN3TFHwaXKl4IhYSs
         2t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735934; x=1742340734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJoFtcX5bnyvHEQRQ760BLG6AZZhXWat9Nk5QPvs85s=;
        b=OjVXEeN+KjQO0kwUOmM/l/xqnSkOUf5yzTOt6CtMcSUYqmzGARStXf/bBX74joxCOe
         ThxqF93ZbTyavWAuU6U3FYNlf7mBZvYfmxgNcq+ryTTLBAZdmnTc9ggHAC1ZbdaCVpH2
         HIMgEVBcIz4BTAp4hN2INfdFvlYtpIzM2F5K+3pGYSRH8A2Reqvrqt3Xea9aZfp74dbR
         lqmjVT3b+XS1Ojm/P8KQCcDgxK59HRVzOcm0M/w2JfyFrwP1dt2qqI//jIczCvhzrfp9
         TKbJlhPwaqmXcUxrVdd4g4Jy7Zw/oILQS+/mJre1zHPmXJnYSHu0rNHr8Cjt4xsKQO6X
         OBlA==
X-Gm-Message-State: AOJu0YyXT9PJEI8uYzggWJ8XbgBDf/QWgyZXQonJypwwQ011jig7EYq2
	Gz/d2FSiyUNlQ7u5imdD93kJPrelpzP0yae9ny5Ik10eSL1XRIx/G/f84NHGQjY3/dN9eJ9cq5S
	U8FcURbu6wLdkzjYen5ra3L5N6hs=
X-Gm-Gg: ASbGncv75q6YTyQ0et/7OKEg/Q4cwipotgxB+SRDC0q0Yo6eXVvLadTb7eqOdfa/AM3
	v3yRqwHnmAZnyM2MC2uq4mu8ZE9iNmNEVqVmT5j2aMj6KUew3EyJEdTAUeNrDf5VDfd4p17TXCA
	xgWPy3VChuTjiLeOs8kAled7vm
X-Google-Smtp-Source: AGHT+IGQKr2Fcnnuw+PewrmG9XAys14QMeBVStLyZ+GEfOeYpcyRvldcJH4o99hLJY+Dz/Xqyfh+TXaR/geE4emRbqA=
X-Received: by 2002:a05:6808:2f19:b0:3f6:8c64:8bc8 with SMTP id
 5614622812f47-3f697bf12admr10690982b6e.38.1741735933587; Tue, 11 Mar 2025
 16:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250311084128.2366058-1-hongxu.jia@windriver.com>
In-Reply-To: <20250311084128.2366058-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Mar 2025 16:31:46 -0700
X-Gm-Features: AQ5f1Jqr95xN1A2fMCuPOj_WHIR1_D2UIb4ZS7EjKH_BmAUhJIC8up2vDUPcVe0
Message-ID: <CAMKF1srsD=LQz0XT_awW74PN-pyf9ZgbgV2V1=Z+xemkdpNtcg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 23:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115896

This causes protobuf-c to not build see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/446/step=
s/14/logs/stdio

On Tue, Mar 11, 2025 at 1:41=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Refresh local patches
> - 0001-Fix-build-on-mips-clang.patch
> - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>
> Drop the fix for gold linker build
>
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-Fix-build-on-mips-clang.patch        | 26 ++++++++-----
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 37 ++++++-------------
>  ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  4 +-
>  3 files changed, 31 insertions(+), 36 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> protob=
uf_4.30.0.bb} (98%)
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
> index 7c4bf260eb..5457d0d6bc 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,36 +1,23 @@
> -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
> +From 88d4e5afb2c3b56933c529216cd8b733e10a5b7b Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Fri, 28 Jun 2019 13:50:52 +0000
> -Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
> - with gold
> +Date: Tue, 11 Mar 2025 16:35:39 +0800
> +Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
>
>  * move pkg-config call to separate variable, so that the final version
>    of the whole command so it's shown in log.do_compile_ptest_base
> -* add ../src/google/protobuf/.libs/timestamp.pb.o when linking
> -  add_person_cpp otherwise it fails to link with gold:
> -  i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc -=
o add_person_cpp `pkg-config --cflags --libs protobuf`
> -  /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto:=
 error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftime=
stamp_2eproto'
> -  /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto=
_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2f=
timestamp_2eproto'
> -  collect2: error: ld returned 1 exit status
> -  Makefile:43: recipe for target 'add_person_cpp' failed
> -
> -* and the same with list_people_cpp this time with pkg-config already th=
rough the variable:
> -  i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -pthread -Icore2-32-oe-linux/prot=
obuf/3.8.0-r0/git/src -Lcore2-32-oe-linux/protobuf/3.8.0-r0/git/src/.libs -=
Lcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot/usr/lib -lprotobuf list=
_people.cc addressbook.pb.cc -o list_people_cpp
> -  /tmp/ccpaI5Su.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto:=
 error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftime=
stamp_2eproto'
> -  /tmp/ccpaI5Su.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto=
_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2f=
timestamp_2eproto'
> -  collect2: error: ld returned 1 exit status
> -  Makefile:49: recipe for target 'list_people_cpp' failed
>
>  Upstream-Status: Pending
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
> +index 5290fdb03f..b695b03707 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -2,6 +2,8 @@
> @@ -42,20 +29,20 @@ index ef7a4ef58..7206e14e1 100644
>   all: cpp java python
>
>   cpp:    add_person_cpp    list_people_cpp
> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> +@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
>
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cp=
p `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(C=
XX) -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_=
cpp
> +-      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config=
 --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) $(PROTOBUF) add_person.cc addressbo=
ok.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> --      c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_=
cpp `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timest=
amp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$=
(CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_peo=
ple_cpp
> +-      c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-conf=
ig --cflags --libs protobuf`
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS) $(PROTOBUF) list_people.cc addressb=
ook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> ---
> +--
>  2.34.1
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> index a470a7c643..f899a1dc07 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> @@ -14,9 +14,9 @@ LIC_FILES_CHKSUM =3D " \
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
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115849): https://lists.openembedded.org/g/openembedde=
d-devel/message/115849
> Mute This Topic: https://lists.openembedded.org/mt/111636359/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

