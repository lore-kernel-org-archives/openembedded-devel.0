Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DECFEE57CD
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 13:19:58 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.35770.1694351995217678290
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 06:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SZEnANDy;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so60705801fa.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694351993; x=1694956793; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzUCISB5Isd1+StsR484jpiUCLLnAyPmV+bgVZmUvyA=;
        b=SZEnANDy0qqEu8ltoPsmCUQQ1+jLgC2aVuLMU/Qba6eHlOI/8qx3pzmQKC7CpZegKD
         BzXmha+sgrSg35nOs0mg9VwZGEeT/I3aa5/3LFt0PRiggxL4XTvWrXMhyGkcUuRtDF/x
         U6qQUXAhHCOtJiEF9ILQUj1st0tgaOvozxyfDwLSunm1occ8GeFSIVVLTnyrdP9dLVrB
         Fd3WDKdElPSnr1h3hJW9nhsJhTel5+MgP9ROrhqHjgjS+DMC9V9h/a2LHwtiwmoVvubf
         f1aCj12WI2q4ldOwZ1+c8jI4MFlEet2q7amzYfVMHbx9zsY9oAGhCGCiiy1ROY3sqW1s
         ZWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694351993; x=1694956793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzUCISB5Isd1+StsR484jpiUCLLnAyPmV+bgVZmUvyA=;
        b=Hg7TdQtkD70YuREg8wh/m4znKNBprOSnQNUk8wl5xbLw6CIfs6YwnCDrRAApaDlMfl
         hjs+ewgwErnWY1eQkW0muYDB5Z3KsIjOyEEmd+8U46TiZM2n3MQ3Ewj5uJpaPtKiP3Yo
         CIalg+b2m9GgDJ57cPnT/m61cexp4BJB9j67merjkcNWSwY/0VyeY/c3S1OJX3ZvD7Rc
         dclULbELN6hEaO3TWbP502e3d38wuD2Sl+7P64kyU01F0pwi7ykDCO6lzQXOBeKpCAi/
         ILGTSSX1pbeKuAr+iQu2FyTFwHO2WJHhrnLobYZprrCzvOpo17tj61pFVyGkCdVwcpCH
         gX2w==
X-Gm-Message-State: AOJu0YyweWaQ0eTWX3A8aTHRnTh4PnO0puGSuJdRDjR0K3lg/4NSrFeq
	CU1FDXVRX0LbF61jlKbaADo4EWHnz1/2nBzr+yc=
X-Google-Smtp-Source: AGHT+IEWFA1z1qtHMY1AcKeuQmrZd7NbPdR/BbYTaypEzpVieyFK5fSXc0wvWXMxgjdsSocMDJAZhs2dUwXZUpjF0Z8=
X-Received: by 2002:a05:6512:3188:b0:500:b63f:4db3 with SMTP id
 i8-20020a056512318800b00500b63f4db3mr6632964lfe.35.1694351992813; Sun, 10 Sep
 2023 06:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-5-peron.clem@gmail.com>
 <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 10 Sep 2023 15:19:40 +0200
Message-ID: <CAJiuCcet1YZb=NAUKejCqumUXSqQkjX64vxe5YCO9c6j+CPzNQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] devtools: grpc: bump to 1.56.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a7ff0f06050110d4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 13:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104827

--000000000000a7ff0f06050110d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Sun, 10 Sept 2023 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:

> seeing a build error in native version
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3103/st=
eps/14/logs/stdio


Sorry, I thought to have properly retested but my custom gRPC recipe took
priority over the meta-oe one.

I have sent a v2.

Regards,



>
>
> On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:
> >
> > Remove merged patch that export plugin to a separate targets
> >
> > Remove no more applicatable patch
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
> >  ...d-separate-export-for-plugin-targets.patch | 93 -------------------
> >  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
> >  3 files changed, 2 insertions(+), 159 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC=
-to-GPR_ABSEIL_SYNC.patch
> >  delete mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plu=
gin-targets.patch
> >  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.=
bb}
> (92%)
> >
> > diff --git
> a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SY=
NC-to-GPR_ABSEIL_SYNC.patch
> b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SY=
NC-to-GPR_ABSEIL_SYNC.patch
> > deleted file mode 100644
> > index b245ad865..000000000
> > ---
> a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SY=
NC-to-GPR_ABSEIL_SYNC.patch
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2001
> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> > -Date: Tue, 19 Oct 2021 17:09:55 +0200
> > -Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYNC
> > - (#25681)"
> > -
> > -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
> > -
> > -Fixes sysdig from meta-oe and other recipes (like com.webos.service.tt=
s
> > -libgoogleassistant from meta-webosose) failing with:
> > -
> > -| FAILED: userspace/sysdig/sysdig
> > -| : &&
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recip=
e-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++
> -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
> -Wformat-security -Werror=3Dformat-sec
> > -urity
> --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.2=
7.1-r0/recipe-sysroot
> -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>                     -f
> >
> -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>
> -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0/recipe-sysroot=3D
>                     -fdebug-prefix-map=3D/OE/bu
> >
> -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sys=
root-native=3D
> -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wform=
at
> -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/build
> >
> -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroo=
t
> -Wall -ggdb   -std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64
> -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-str=
ong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> >
> ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.=
27.1-r0/recipe-sysroot
> -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>                     -fdebug-p
> >
> -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.=
27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>
> -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0/recipe-sysroot=3D
>                     -fdebug-prefix-map=3D/OE/build/oe-
> >
> -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-na=
tive=3D
> -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wform=
at
> -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/build/oe-cor
> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>                     -fdebug-prefix-map=3D/OE/build/oe-cor
> >
> -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/sys=
dig/0.27.1-r0
>
> -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0/recipe-sysroot=3D
>
> -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-
> > -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0
>                     -fdebug-prefix-map=3D/OE/build/
> >
> -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/deb=
ug/sysdig/0.27.1-r0
>
> -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0/recipe-sysroot=3D
>                     -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work=
/
> > -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now   -rdynamic
> userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.cpp.o
> userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o
> userspace/sysdig/sysdig  userspace/libsinsp/libsinsp.a
> userspace/libscap/libscap.a
> > - -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure
> -lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure
> -lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl
> -lpthread && :
> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:
> undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:
> undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:
> undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error:
> undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > -| collect2: error: ld returned 1 exit status
> > -
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > -
> > ----
> > -Upstream-Status: Pending
> > -
> > - include/grpcpp/impl/codegen/sync.h | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/include/grpcpp/impl/codegen/sync.h
> b/include/grpcpp/impl/codegen/sync.h
> > -index 4cb8133c7c..3d10d9a3a0 100644
> > ---- a/include/grpcpp/impl/codegen/sync.h
> > -+++ b/include/grpcpp/impl/codegen/sync.h
> > -@@ -47,7 +47,7 @@
> > - namespace grpc {
> > - namespace internal {
> > -
> > --#ifdef GPR_ABSEIL_SYNC
> > -+#ifdef GRPCPP_ABSEIL_SYNC
> > -
> > - using Mutex =3D absl::Mutex;
> > - using MutexLock =3D absl::MutexLock;
> > -@@ -142,7 +142,7 @@ class CondVar {
> > -   gpr_cv cv_;
> > - };
> > -
> > --#endif  // GPR_ABSEIL_SYNC
> > -+#endif  // GRPCPP_ABSEIL_SYNC
> > -
> > - template <typename Predicate>
> > - GRPC_DEPRECATED("incompatible with thread safety analysis")
> > diff --git
> a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-p=
lugin-targets.patch
> b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-p=
lugin-targets.patch
> > deleted file mode 100644
> > index 679bd3882..000000000
> > ---
> a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-p=
lugin-targets.patch
> > +++ /dev/null
> > @@ -1,93 +0,0 @@
> > -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
> > -From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > -Date: Tue, 18 Feb 2020 14:17:07 +0100
> > -Subject: [PATCH] cmake: add separate export for plugin targets
> > -
> > -Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
> > -
> > -
> > ----
> > - CMakeLists.txt | 18 +++++++++++-------
> > - 1 file changed, 11 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index efdaf8936d..6608b1b00c 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
> > -
> > -
> > - if(gRPC_INSTALL)
> > --  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
> > -+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
> > -     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> > -     NAMESPACE gRPC::
> > -   )
> > -+  install(EXPORT gRPCPluginTargets
> > -+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> > -+    NAMESPACE gRPC::
> > -+  )
> > - endif()
> > -
> > - include(CMakePackageConfigHelpers)
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> > similarity index 92%
> > rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> > rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> > index 45bfcb857..ac54d704a 100644
> > --- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> > +++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> > @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D "
> ${PN}-compiler"
> >  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> >
> >  S =3D "${WORKDIR}/git"
> > -SRCREV_grpc =3D "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
> > -BRANCH =3D "v1.50.x"
> > +SRCREV_grpc =3D "c0d1c393d9365664d47df41746e992ae97b651ef"
> > +BRANCH =3D "v1.56.x"
> >  SRC_URI =3D "gitsm://
> github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;branch=3D${BRANCH}
> <http://github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;branch=3D$%=
7BBRANCH%7D>
> \
> > -
>  file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
> > -
>  file://0001-cmake-add-separate-export-for-plugin-targets.patch \
> >             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
> >             file://0001-fix-CVE-2023-32732.patch \
> >             "
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#104813):
> https://lists.openembedded.org/g/openembedded-devel/message/104813
> > Mute This Topic: https://lists.openembedded.org/mt/101253581/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a7ff0f06050110d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Khem,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, 10 Sept 2023 at 00:28, Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">seeing a build error in native version<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/3103/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3103/steps/14/logs/=
stdio</a></blockquote><div><br><div class=3D"gmail_default" style=3D"font-f=
amily:monospace">Sorry, I thought to have properly retested but my custom g=
RPC recipe took priority over the meta-oe one.</div><div class=3D"gmail_def=
ault" style=3D"font-family:monospace"><br></div><div class=3D"gmail_default=
" style=3D"font-family:monospace">I have sent a v2.</div><div class=3D"gmai=
l_default" style=3D"font-family:monospace"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace">Regards,</div><br>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron &lt;<a href=
=3D"mailto:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Remove merged patch that export plugin to a separate targets<br>
&gt;<br>
&gt; Remove no more applicatable patch<br>
&gt;<br>
&gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cle=
m@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------=
<br>
&gt;=C2=A0 ...d-separate-export-for-plugin-targets.patch | 93 -------------=
------<br>
&gt;=C2=A0 .../grpc/{<a href=3D"http://grpc_1.50.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">grpc_1.50.1.bb</a> =3D&gt; <a href=3D"http://grpc_1.56.2.b=
b" rel=3D"noreferrer" target=3D"_blank">grpc_1.56.2.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 6 +-<br>
&gt;=C2=A0 3 files changed, 2 insertions(+), 159 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Rever=
t-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake=
-add-separate-export-for-plugin-targets.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/grpc/{<a href=3D"http://grpc_1.5=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.1.bb</a> =3D&gt; <a =
href=3D"http://grpc_1.56.2.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.=
56.2.bb</a>} (92%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GR=
PCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/g=
rpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b245ad865..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_AB=
SEIL_SYNC-to-GPR_ABSEIL_SYNC.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,62 +0,0 @@<br>
&gt; -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -Date: Tue, 19 Oct 2021 17:09:55 +0200<br>
&gt; -Subject: [PATCH] Revert &quot;Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEI=
L_SYNC<br>
&gt; - (#25681)&quot;<br>
&gt; -<br>
&gt; -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.<br>
&gt; -<br>
&gt; -Fixes sysdig from meta-oe and other recipes (like com.webos.service.t=
ts<br>
&gt; -libgoogleassistant from meta-webosose) failing with:<br>
&gt; -<br>
&gt; -| FAILED: userspace/sysdig/sysdig<br>
&gt; -| : &amp;&amp; /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sys=
dig/0.27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux=
-g++ -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-prote=
ctor-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Wer=
ror=3Dformat-sec<br>
&gt; -urity=C2=A0 --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-=
linux/sysdig/0.27.1-r0/recipe-sysroot=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64=
-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -f<br>
&gt; -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/=
OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-s=
ysroot=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -fdebug-prefix-map=3D/OE/bu<br>
&gt; -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-=
sysroot-native=3D=C2=A0 -fvisibility-inlines-hidden=C2=A0 -m64 -march=3Dcor=
e2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong=C2=A0 -O2 =
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=
=C2=A0 --sysroot=3D/OE/build<br>
&gt; -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sys=
root -Wall -ggdb=C2=A0 =C2=A0-std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG=
=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-pro=
tector-strong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -W=
error=3Dformat-security<br>
&gt; ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig=
/0.27.1-r0/recipe-sysroot=C2=A0 -O2 -pipe -g -feliminate-unused-debug-types=
 -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-p<br>
&gt; -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig=
/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/buil=
d/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=
=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -fdebug-prefix-map=3D/OE/build/oe-<br>
&gt; -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=
-native=3D=C2=A0 -fvisibility-inlines-hidden=C2=A0 -m64 -march=3Dcore2 -mtu=
ne=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong=C2=A0 -O2 -D_FORT=
IFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=C2=A0 -=
-sysroot=3D/OE/build/oe-cor<br>
&gt; -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -W=
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build=
/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug=
/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/oe-cor<br>
&gt; -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/=
sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/cor=
e2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/=
OE/build/oe-core/tmp-glibc/work/core2-<br>
&gt; -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D=C2=A0 -Wl,-z,re=
lro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-ma=
p=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/=
usr/src/debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/<br>
&gt; -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/=
debug/sysdig/0.27.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/w=
ork/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-=
map=3D/OE/build/oe-core/tmp-glibc/work/<br>
&gt; -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D=C2=A0 -Wl=
,-z,relro,-z,now=C2=A0 =C2=A0-rdynamic userspace/sysdig/CMakeFiles/sysdig.d=
ir/fields_info.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o=
 userspace/sysdig/sysdig=C2=A0 userspace/libsinsp/libsinsp.a=C2=A0 userspac=
e/libscap/libscap.a<br>
&gt; - -lelf=C2=A0 -lz=C2=A0 -lcurl=C2=A0 -ljsoncpp=C2=A0 -ltbb=C2=A0 -lcar=
es=C2=A0 -lgrpc++_unsecure=C2=A0 -lgrpc_unsecure=C2=A0 -lprotobuf=C2=A0 -lc=
ares=C2=A0 -lgrpc++_unsecure=C2=A0 -lgrpc_unsecure=C2=A0 -lprotobuf=C2=A0 -=
ljq=C2=A0 -lb64=C2=A0 -lrt=C2=A0 -lanl=C2=A0 -lssl=C2=A0 -lcrypto=C2=A0 -ll=
uajit-5.1=C2=A0 -ldl=C2=A0 -lpthread &amp;&amp; :<br>
&gt; -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>
&gt; -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>
&gt; -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>
&gt; -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: und=
efined reference to &#39;absl::lts_20210324::Mutex::~Mutex()&#39;<br>
&gt; -| collect2: error: ld returned 1 exit status<br>
&gt; -<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; - include/grpcpp/impl/codegen/sync.h | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl=
/codegen/sync.h<br>
&gt; -index 4cb8133c7c..3d10d9a3a0 100644<br>
&gt; ---- a/include/grpcpp/impl/codegen/sync.h<br>
&gt; -+++ b/include/grpcpp/impl/codegen/sync.h<br>
&gt; -@@ -47,7 +47,7 @@<br>
&gt; - namespace grpc {<br>
&gt; - namespace internal {<br>
&gt; -<br>
&gt; --#ifdef GPR_ABSEIL_SYNC<br>
&gt; -+#ifdef GRPCPP_ABSEIL_SYNC<br>
&gt; -<br>
&gt; - using Mutex =3D absl::Mutex;<br>
&gt; - using MutexLock =3D absl::MutexLock;<br>
&gt; -@@ -142,7 +142,7 @@ class CondVar {<br>
&gt; -=C2=A0 =C2=A0gpr_cv cv_;<br>
&gt; - };<br>
&gt; -<br>
&gt; --#endif=C2=A0 // GPR_ABSEIL_SYNC<br>
&gt; -+#endif=C2=A0 // GRPCPP_ABSEIL_SYNC<br>
&gt; -<br>
&gt; - template &lt;typename Predicate&gt;<br>
&gt; - GRPC_DEPRECATED(&quot;incompatible with thread safety analysis&quot;=
)<br>
&gt; diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separat=
e-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001=
-cmake-add-separate-export-for-plugin-targets.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 679bd3882..000000000<br>
&gt; --- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-expor=
t-for-plugin-targets.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,93 +0,0 @@<br>
&gt; -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsm=
eier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.=
com</a>&gt;<br>
&gt; -Date: Tue, 18 Feb 2020 14:17:07 +0100<br>
&gt; -Subject: [PATCH] cmake: add separate export for plugin targets<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/grpc/grpc/p=
ull/29328" rel=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grp=
c/pull/29328</a>]<br>
&gt; -<br>
&gt; -<br>
&gt; ----<br>
&gt; - CMakeLists.txt | 18 +++++++++++-------<br>
&gt; - 1 file changed, 11 insertions(+), 7 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; -index efdaf8936d..6608b1b00c 100644<br>
&gt; ---- a/CMakeLists.txt<br>
&gt; -+++ b/CMakeLists.txt<br>
&gt; -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_node_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin=
<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets<br=
>
&gt; -+=C2=A0 install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTarg=
ets<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_php_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_python_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin<br>
&gt; -<br>
&gt; -<br>
&gt; - if(gRPC_INSTALL)<br>
&gt; --=C2=A0 install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets<br>
&gt; -+=C2=A0 install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets<br>
&gt; -=C2=A0 =C2=A0 =C2=A0RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0BUNDLE DESTINATION=C2=A0 ${gRPC_INSTALL_BINDIR}<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}<br>
&gt; -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0DESTINATION ${gRPC_INSTALL_CMAKEDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0NAMESPACE gRPC::<br>
&gt; -=C2=A0 =C2=A0)<br>
&gt; -+=C2=A0 install(EXPORT gRPCPluginTargets<br>
&gt; -+=C2=A0 =C2=A0 DESTINATION ${gRPC_INSTALL_CMAKEDIR}<br>
&gt; -+=C2=A0 =C2=A0 NAMESPACE gRPC::<br>
&gt; -+=C2=A0 )<br>
&gt; - endif()<br>
&gt; -<br>
&gt; - include(CMakePackageConfigHelpers)<br>
&gt; ---<br>
&gt; -2.30.2<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.50=
.1.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.1.bb</a> b/meta-oe/re=
cipes-devtools/grpc/<a href=3D"http://grpc_1.56.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">grpc_1.56.2.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.50.=
1.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.1.bb</a><br>
&gt; rename to meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.56.2.=
bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.56.2.bb</a><br>
&gt; index 45bfcb857..ac54d704a 100644<br>
&gt; --- a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.50.1.bb" =
rel=3D"noreferrer" target=3D"_blank">grpc_1.50.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.56.2.bb" =
rel=3D"noreferrer" target=3D"_blank">grpc_1.56.2.bb</a><br>
&gt; @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D &quot; $=
{PN}-compiler&quot;<br>
&gt;=C2=A0 # RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -SRCREV_grpc =3D &quot;90ccf24d22b6fc909a1021ebd89fd8c838467d26&quot;<=
br>
&gt; -BRANCH =3D &quot;v1.50.x&quot;<br>
&gt; +SRCREV_grpc =3D &quot;c0d1c393d9365664d47df41746e992ae97b651ef&quot;<=
br>
&gt; +BRANCH =3D &quot;v1.56.x&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/grpc/grpc=
.git;protocol=3Dhttps;name=3Dgrpc;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer=
" target=3D"_blank">github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;b=
ranch=3D${BRANCH}</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-Changed-G=
RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-add-separa=
te-export-for-plugin-targets.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-Link-=
with-libatomic-on-rv32-rv64.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-CVE-202=
3-32732.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#104813): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/104813" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/104813</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10125358=
1/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101253581/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a7ff0f06050110d4--

