Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5EEEE57CD
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 22:28:22 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.26577.1694298500931253577
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 15:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LYyGFg+j;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1c4cf775a14so2223540fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694298500; x=1694903300; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw/KO4a0jCpmBDUsJ3fV8PLy6KgoxZ+Lki9wIZXfJtA=;
        b=LYyGFg+jVrVJIPeGwM99gqu0l6d8Nh5ww7TC/XZxHS+HDezwEWEc+Vn0LPXaI9fRzj
         HTLv1+Lxx2zfrYIGTK5GpWaozzNMyEbFDa4qTt2yNKv2NQn5thL2ZkVm0g+5mRwZ38En
         dBi/0q8B76aMhLLe1snHMnNRIRjCfnDwXMoayVlp6H3RCGt/gCqV7sJIS0J8nXpYAjCy
         kbQoeNHLbj5vBEl6Ye1f2m0nzNtuB585TR2bIL99/S6cqmsZw9vMHrhaWFu4WRfTHMMY
         eKvE6GRZ8xVtox9BKTxKfB5PltdGZMmyAbDVoJURLW5CpzgBLc632kjjVOM1qNSMEQ9E
         Hg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694298500; x=1694903300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw/KO4a0jCpmBDUsJ3fV8PLy6KgoxZ+Lki9wIZXfJtA=;
        b=lohiJ0P9k652owZ7z3szVYpvhn7T2tFIyWRCDuEdJn+aupp/DHdedPTfNqEmOLPdzx
         Syj2W6M2JrLhMOb6npFXihFNX1FnBri9aQbpUcsBc2oldXmnOtliOVa+rnvOl/LP9/0D
         WVgtQA4FFVsfjpIng73Av2fgEGpOIhGuQcxrJT1wutHy34gAt16B0OpXzQiWzJm4KOMS
         TuY5NvAHkMx1pNDPaHKIGpkXIWSUxykJAgUhkyW4BKUs9q6AJF++NMI68Wek4Ql97fv9
         eKhyAGufGjX6tKft07giRSJ6AbOh/YfViGsZtE9xHUQMdKayjTTY3jN2ubjYxMi1o2pr
         /HUQ==
X-Gm-Message-State: AOJu0Yx/uOs2CPWbey+uMZvPmzj2uToU+x6jKuCfmDzuk3Fw9IVzldID
	JnOcHM67ZhlJWrcTfaDJ3vi9qg6/ic1+k9hqMxY=
X-Google-Smtp-Source: AGHT+IG1pghM0pXYsKp9MoAwYRZtPJ1mmauQMMQJdUkOqbnVrIebs6zNoiinh8WpAbici0sFp6zR8yHQdrv02nENZ/U=
X-Received: by 2002:a05:6870:b494:b0:1d0:cbc7:1c92 with SMTP id
 y20-20020a056870b49400b001d0cbc71c92mr7746490oap.28.1694298499833; Sat, 09
 Sep 2023 15:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-5-peron.clem@gmail.com>
In-Reply-To: <20230909093517.444924-5-peron.clem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Sep 2023 15:27:53 -0700
Message-ID: <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] devtools: grpc: bump to 1.56.2
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 22:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104817

seeing a build error in native version

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3103/step=
s/14/logs/stdio

On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
>
> Remove merged patch that export plugin to a separate targets
>
> Remove no more applicatable patch
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
>  ...d-separate-export-for-plugin-targets.patch | 93 -------------------
>  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
>  3 files changed, 2 insertions(+), 159 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Change=
d-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
>  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-sep=
arate-export-for-plugin-targets.patch
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb=
} (92%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCP=
P_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/grpc=
/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> deleted file mode 100644
> index b245ad865..000000000
> --- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEI=
L_SYNC-to-GPR_ABSEIL_SYNC.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 19 Oct 2021 17:09:55 +0200
> -Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYNC
> - (#25681)"
> -
> -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
> -
> -Fixes sysdig from meta-oe and other recipes (like com.webos.service.tts
> -libgoogleassistant from meta-webosose) failing with:
> -
> -| FAILED: userspace/sysdig/sysdig
> -| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-=
r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -=
march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong=
  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec
> -urity  --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sys=
dig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -f
> -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdeb=
ug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0=
.27.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/bu
> -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sys=
root-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dc=
ore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/=
build
> -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroo=
t -Wall -ggdb   -std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -march=
=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2=
 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
> ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.=
27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro=
-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.2=
7.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p
> -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.=
27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-pref=
ix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r=
0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/oe-
> -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-na=
tive=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -m=
sse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wf=
ormat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/build/oe=
-cor
> -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wl,-=
O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/oe=
-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/sy=
sdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-cor
> -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/sys=
dig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-core/t=
mp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D         =
             -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-
> -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,n=
ow -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/=
build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/=
debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/
> -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/deb=
ug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-=
core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D   =
                   -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/
> -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,relr=
o,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.cpp=
.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sysdig/=
sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
> - -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  -lgrp=
c_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprot=
obuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -lpthr=
ead && :
> -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefi=
ned reference to 'absl::lts_20210324::Mutex::~Mutex()'
> -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefi=
ned reference to 'absl::lts_20210324::Mutex::~Mutex()'
> -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefi=
ned reference to 'absl::lts_20210324::Mutex::~Mutex()'
> -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: undefi=
ned reference to 'absl::lts_20210324::Mutex::~Mutex()'
> -| collect2: error: ld returned 1 exit status
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> ----
> -Upstream-Status: Pending
> -
> - include/grpcpp/impl/codegen/sync.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl/co=
degen/sync.h
> -index 4cb8133c7c..3d10d9a3a0 100644
> ---- a/include/grpcpp/impl/codegen/sync.h
> -+++ b/include/grpcpp/impl/codegen/sync.h
> -@@ -47,7 +47,7 @@
> - namespace grpc {
> - namespace internal {
> -
> --#ifdef GPR_ABSEIL_SYNC
> -+#ifdef GRPCPP_ABSEIL_SYNC
> -
> - using Mutex =3D absl::Mutex;
> - using MutexLock =3D absl::MutexLock;
> -@@ -142,7 +142,7 @@ class CondVar {
> -   gpr_cv cv_;
> - };
> -
> --#endif  // GPR_ABSEIL_SYNC
> -+#endif  // GRPCPP_ABSEIL_SYNC
> -
> - template <typename Predicate>
> - GRPC_DEPRECATED("incompatible with thread safety analysis")
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-e=
xport-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cm=
ake-add-separate-export-for-plugin-targets.patch
> deleted file mode 100644
> index 679bd3882..000000000
> --- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-f=
or-plugin-targets.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
> -From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> -Date: Tue, 18 Feb 2020 14:17:07 +0100
> -Subject: [PATCH] cmake: add separate export for plugin targets
> -
> -Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
> -
> -
> ----
> - CMakeLists.txt | 18 +++++++++++-------
> - 1 file changed, 11 insertions(+), 7 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index efdaf8936d..6608b1b00c 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
> -
> -
> - if(gRPC_INSTALL)
> --  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
> -+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
> -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
> -     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> -     NAMESPACE gRPC::
> -   )
> -+  install(EXPORT gRPCPluginTargets
> -+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> -+    NAMESPACE gRPC::
> -+  )
> - endif()
> -
> - include(CMakePackageConfigHelpers)
> ---
> -2.30.2
> -
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.56.2.bb
> similarity index 92%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> index 45bfcb857..ac54d704a 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-com=
piler"
>  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>
>  S =3D "${WORKDIR}/git"
> -SRCREV_grpc =3D "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
> -BRANCH =3D "v1.50.x"
> +SRCREV_grpc =3D "c0d1c393d9365664d47df41746e992ae97b651ef"
> +BRANCH =3D "v1.56.x"
>  SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgr=
pc;branch=3D${BRANCH} \
> -           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_S=
YNC.patch \
> -           file://0001-cmake-add-separate-export-for-plugin-targets.patc=
h \
>             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
>             file://0001-fix-CVE-2023-32732.patch \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104813): https://lists.openembedded.org/g/openembedde=
d-devel/message/104813
> Mute This Topic: https://lists.openembedded.org/mt/101253581/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

