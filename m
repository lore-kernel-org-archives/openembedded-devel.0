Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0D5EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 17:14:20 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.40256.1694366055433599760
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 10:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aWRTZ9i4;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so62727421fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 10:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694366053; x=1694970853; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvnJX8FFlqP3zq0wjzbM1r6k+E2r4Hubu7YFavo4UmU=;
        b=aWRTZ9i497Z4CTXHFC0xBfoDwRrcrj57vR2wPuengV8H7V/qyNmT7q+y1GQPB8Il5x
         wZbdfeNkeUmHpmM2Q+dOoXIsgpxl4sROGbVvHpKAnbLIJnHLpFcYATsNkJOK6aoc1F83
         svcowVUIDTXl0VNgfkMTf7KXzl9mTKqaXzURO2MaXIYX9rB2w6RtFfk8Ey6NxkiZOOKI
         xj4ea9VgOt81eZVtaM0VKaTdHkuf3Gtve9DP5LUodo+uyfd3wf1mKI/1LTV35ACwxdBb
         Rakm3azalrH2vfekc+VcJgeYeZt/fHYs287n//+kfcXBFrRwU25K79v/DkVH6QECXcFd
         5DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694366053; x=1694970853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvnJX8FFlqP3zq0wjzbM1r6k+E2r4Hubu7YFavo4UmU=;
        b=c9mHoaq3Og3m0r434weTtLH5yd/9gzxNtXtY0JBj4uQli5Ij+1z4hG87dXRoarogXr
         BiKp/wKs6+0QGlFCO9vya/wLgvUq1VcctOaNfOFZVk1q1CMFDRloRoTGnIAmydMi486q
         jsqmIrbzGoOrTuk7UBvUliUCRW8LU2zbEq+9xcAIudyaV7lFfQhPTQ7VbxaiPbcM3y/E
         ghTipQqAHgGQwKfa3b38I7VfYBaVukgIrauPHwSF5L0FZQZ11nZV79GhtQDUDb8PegmE
         t89ke0cOgk2WABxFBdGFVMDvbKdy+obx2S9YfcjcZKUMEjmpb/ewcc10ritPzOcq9wc5
         Hz6Q==
X-Gm-Message-State: AOJu0YwajAxjWdvoe2g1fKZA7qYlQHsU3vGCMHyBHfGbL5khLR+Iaolt
	9W7y6pLilT1cfbN2PYl2vV3jdn1TO2EFq4dsJKw=
X-Google-Smtp-Source: AGHT+IE06nnLCouYQ4AV9qCs+iODOdrJWmHnoN1EBjamldyla1sezoNPVvzAqX15oZxpy5VKI6lA2E1+YdLIlRfpkhc=
X-Received: by 2002:a19:4f02:0:b0:4fb:8948:2b28 with SMTP id
 d2-20020a194f02000000b004fb89482b28mr5299987lfb.63.1694366052833; Sun, 10 Sep
 2023 10:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-5-peron.clem@gmail.com>
 <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com>
 <CAJiuCcet1YZb=NAUKejCqumUXSqQkjX64vxe5YCO9c6j+CPzNQ@mail.gmail.com> <CAMKF1sqCWGQh53Lm+2r3ByvCOs2nCx-7UTtqUVmHyPEV9o5bUA@mail.gmail.com>
In-Reply-To: <CAMKF1sqCWGQh53Lm+2r3ByvCOs2nCx-7UTtqUVmHyPEV9o5bUA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 10 Sep 2023 19:14:00 +0200
Message-ID: <CAJiuCccsoPyTDg0of8vSRrR5dzwtNjKrKZ8zVc4uepcq+tn-FA@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] devtools: grpc: bump to 1.56.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 17:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104829

Hi Khem,

On Sun, 10 Sept 2023 at 17:07, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Sep 10, 2023 at 6:19=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com> wrote:
> >
> > Hi Khem,
> >
> > On Sun, 10 Sept 2023 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> seeing a build error in native version
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3103=
/steps/14/logs/stdio
> >
> >
> > Sorry, I thought to have properly retested but my custom gRPC recipe to=
ok priority over the meta-oe one.
> >
> > I have sent a v2.
>
> still seeing problem with usbguard. This links with protobuf and it
> seems protobufs are now linking libabseil
> differently that it finds undefined symbols when using
> --no-allow-shlib-undefined

Sorry I missed your message about this issue.

Will try to fix it.

Regards,


>
> >
> > Regards,
> >
> >
> >>
> >>
> >>
> >> On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.=
clem@gmail.com> wrote:
> >> >
> >> > Remove merged patch that export plugin to a separate targets
> >> >
> >> > Remove no more applicatable patch
> >> >
> >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >> > ---
> >> >  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
> >> >  ...d-separate-export-for-plugin-targets.patch | 93 ----------------=
---
> >> >  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
> >> >  3 files changed, 2 insertions(+), 159 deletions(-)
> >> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-C=
hanged-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> >> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-ad=
d-separate-export-for-plugin-targets.patch
> >> >  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56=
.2.bb} (92%)
> >> >
> >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-=
GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc=
/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> >> > deleted file mode 100644
> >> > index b245ad865..000000000
> >> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_=
ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> >> > +++ /dev/null
> >> > @@ -1,62 +0,0 @@
> >> > -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2=
001
> >> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> >> > -Date: Tue, 19 Oct 2021 17:09:55 +0200
> >> > -Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_S=
YNC
> >> > - (#25681)"
> >> > -
> >> > -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
> >> > -
> >> > -Fixes sysdig from meta-oe and other recipes (like com.webos.service=
.tts
> >> > -libgoogleassistant from meta-webosose) failing with:
> >> > -
> >> > -| FAILED: userspace/sysdig/sysdig
> >> > -| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.=
27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -=
m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-s=
trong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dforma=
t-sec
> >> > -urity  --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-t=
ypes -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -=
f
> >> > -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      =
-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sys=
dig/0.27.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/=
OE/bu
> >> > -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recip=
e-sysroot-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtun=
e=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SO=
URCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D=
/OE/build
> >> > -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-s=
ysroot -Wall -ggdb   -std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -=
march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong=
  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> >> > ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysd=
ig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -f=
macro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdi=
g/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-=
p
> >> > -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysd=
ig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug=
-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.2=
7.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/buil=
d/oe-
> >> > -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysro=
ot-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcor=
e2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D=
2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/bui=
ld/oe-cor
> >> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot =
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/bui=
ld/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/deb=
ug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-=
cor
> >> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debu=
g/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-c=
ore/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D    =
                  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/cor=
e2-
> >> > -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,relro=
,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=
=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/u=
sr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE=
/build/
> >> > -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/sr=
c/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/buil=
d/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/w=
ork/
> >> > -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z=
,relro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_inf=
o.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sy=
sdig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
> >> > - -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  =
-lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -=
lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -=
lpthread && :
> >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: u=
ndefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: u=
ndefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: u=
ndefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: u=
ndefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> >> > -| collect2: error: ld returned 1 exit status
> >> > -
> >> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> > -
> >> > ----
> >> > -Upstream-Status: Pending
> >> > -
> >> > - include/grpcpp/impl/codegen/sync.h | 4 ++--
> >> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> >> > -
> >> > -diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/im=
pl/codegen/sync.h
> >> > -index 4cb8133c7c..3d10d9a3a0 100644
> >> > ---- a/include/grpcpp/impl/codegen/sync.h
> >> > -+++ b/include/grpcpp/impl/codegen/sync.h
> >> > -@@ -47,7 +47,7 @@
> >> > - namespace grpc {
> >> > - namespace internal {
> >> > -
> >> > --#ifdef GPR_ABSEIL_SYNC
> >> > -+#ifdef GRPCPP_ABSEIL_SYNC
> >> > -
> >> > - using Mutex =3D absl::Mutex;
> >> > - using MutexLock =3D absl::MutexLock;
> >> > -@@ -142,7 +142,7 @@ class CondVar {
> >> > -   gpr_cv cv_;
> >> > - };
> >> > -
> >> > --#endif  // GPR_ABSEIL_SYNC
> >> > -+#endif  // GRPCPP_ABSEIL_SYNC
> >> > -
> >> > - template <typename Predicate>
> >> > - GRPC_DEPRECATED("incompatible with thread safety analysis")
> >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separ=
ate-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/00=
01-cmake-add-separate-export-for-plugin-targets.patch
> >> > deleted file mode 100644
> >> > index 679bd3882..000000000
> >> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-exp=
ort-for-plugin-targets.patch
> >> > +++ /dev/null
> >> > @@ -1,93 +0,0 @@
> >> > -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2=
001
> >> > -From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.co=
m>
> >> > -Date: Tue, 18 Feb 2020 14:17:07 +0100
> >> > -Subject: [PATCH] cmake: add separate export for plugin targets
> >> > -
> >> > -Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328=
]
> >> > -
> >> > -
> >> > ----
> >> > - CMakeLists.txt | 18 +++++++++++-------
> >> > - 1 file changed, 11 insertions(+), 7 deletions(-)
> >> > -
> >> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> >> > -index efdaf8936d..6608b1b00c 100644
> >> > ---- a/CMakeLists.txt
> >> > -+++ b/CMakeLists.txt
> >> > -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plug=
in
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
> >> > -
> >> > -
> >> > - if(gRPC_INSTALL)
> >> > --  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
> >> > -+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
> >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> >> > -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
> >> > -     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> >> > -     NAMESPACE gRPC::
> >> > -   )
> >> > -+  install(EXPORT gRPCPluginTargets
> >> > -+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> >> > -+    NAMESPACE gRPC::
> >> > -+  )
> >> > - endif()
> >> > -
> >> > - include(CMakePackageConfigHelpers)
> >> > ---
> >> > -2.30.2
> >> > -
> >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/=
recipes-devtools/grpc/grpc_1.56.2.bb
> >> > similarity index 92%
> >> > rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> >> > rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> >> > index 45bfcb857..ac54d704a 100644
> >> > --- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> >> > +++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> >> > @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN=
}-compiler"
> >> >  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> >> >
> >> >  S =3D "${WORKDIR}/git"
> >> > -SRCREV_grpc =3D "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
> >> > -BRANCH =3D "v1.50.x"
> >> > +SRCREV_grpc =3D "c0d1c393d9365664d47df41746e992ae97b651ef"
> >> > +BRANCH =3D "v1.56.x"
> >> >  SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=
=3Dgrpc;branch=3D${BRANCH} \
> >> > -           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABS=
EIL_SYNC.patch \
> >> > -           file://0001-cmake-add-separate-export-for-plugin-targets=
.patch \
> >> >             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch=
 \
> >> >             file://0001-fix-CVE-2023-32732.patch \
> >> >             "
> >> > --
> >> > 2.34.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#104813): https://lists.openembedded.org/g/openem=
bedded-devel/message/104813
> >> > Mute This Topic: https://lists.openembedded.org/mt/101253581/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >

