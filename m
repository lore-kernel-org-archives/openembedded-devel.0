Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3972EEE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 15:07:09 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.37724.1694358421820182494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 08:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Uh++HsLj;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5732481b22eso2419508eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694358421; x=1694963221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7v0hzCdCdSU5TflMVoWNfgeDys72zWEQU45gdqsbKbk=;
        b=Uh++HsLjzfOVjx1UKQ23Akzt7hc5C8luhlXxUIyIyc1U4RWFup9XAMyxtqDv4uIcUb
         9wpKYujefBdnSVo+9hSfUHHAit/8+5NAJNRzFgV7LFJldqjXfrj8z6F0Hgp+SCB/i9l2
         FgdYQ+IQ/dlWDQ1jjnqkpafyv5Y9I14W/esVG9717F6GdPq/3FV2BjItaKR4Y4EqlkwU
         qBbndraAhqYPuROdAbqxhuER97UyqH//uFxszPl9buQTktsl1rGRSKPCT/ALWNOHVNC8
         mv08GPE8PXualQILKhNSFfcdIWT3GirIanLBtjkrQkj6qLx/I+jw0nJLkOn/eSt0m3f7
         ejsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694358421; x=1694963221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7v0hzCdCdSU5TflMVoWNfgeDys72zWEQU45gdqsbKbk=;
        b=PSFBPDxnLGyW9Jx+g7LyDYCDovUf7nUxa7aPjWzi9u2rGSDENEFf4d9hzlRotSRN/g
         U6qIC3MD3+x1nZDFJDSrEMPJ7WFdegn8IsDk9hX8OXhEaTWOrBXIDqSess1HnHGn/jKr
         aXBjPDIetRVO/F7mAGlolLb2xjTyJGn+nd+Zx3HEnqlUD3881lfS/yEAB7uzyc8QmBmD
         1GAPktoNd61XkAKJ9a/o+iTF4A+hSZgZJgYgCYdF/JShECCIAyBNZDl10AixBiVS/8ZT
         EGN7LyEVvK16mjMk1/QMSV4gqnL7I1vuw0/2F8yeROwxJKjOdwMm059967YKjMM5MFVj
         Xchg==
X-Gm-Message-State: AOJu0Yxr0WzVILCTTSwn5PMwynDmxC+jWcLKKS1eAtXU/xhvtX05bNH2
	82GJ8Gn9NzWBXa8+nNf+/z2UCfxUitob1MADGTM=
X-Google-Smtp-Source: AGHT+IFY3EHbyuCRtO9D0V6R4enEfsIXCqvwyBwKEoVuakquavjyHR8Vg90CU0HvUbZbXOLYXSurMNx02EIazlZYXUA=
X-Received: by 2002:a05:6870:a68c:b0:1be:f311:4a29 with SMTP id
 i12-20020a056870a68c00b001bef3114a29mr9702671oam.20.1694358420871; Sun, 10
 Sep 2023 08:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-5-peron.clem@gmail.com>
 <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com> <CAJiuCcet1YZb=NAUKejCqumUXSqQkjX64vxe5YCO9c6j+CPzNQ@mail.gmail.com>
In-Reply-To: <CAJiuCcet1YZb=NAUKejCqumUXSqQkjX64vxe5YCO9c6j+CPzNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Sep 2023 08:06:34 -0700
Message-ID: <CAMKF1sqCWGQh53Lm+2r3ByvCOs2nCx-7UTtqUVmHyPEV9o5bUA@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] devtools: grpc: bump to 1.56.2
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104828

On Sun, Sep 10, 2023 at 6:19=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:
>
> Hi Khem,
>
> On Sun, 10 Sept 2023 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> seeing a build error in native version
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3103/s=
teps/14/logs/stdio
>
>
> Sorry, I thought to have properly retested but my custom gRPC recipe took=
 priority over the meta-oe one.
>
> I have sent a v2.

still seeing problem with usbguard. This links with protobuf and it
seems protobufs are now linking libabseil
differently that it finds undefined symbols when using
--no-allow-shlib-undefined

>
> Regards,
>
>
>>
>>
>>
>> On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com> wrote:
>> >
>> > Remove merged patch that export plugin to a separate targets
>> >
>> > Remove no more applicatable patch
>> >
>> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> > ---
>> >  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
>> >  ...d-separate-export-for-plugin-targets.patch | 93 ------------------=
-
>> >  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
>> >  3 files changed, 2 insertions(+), 159 deletions(-)
>> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Cha=
nged-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
>> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-=
separate-export-for-plugin-targets.patch
>> >  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2=
.bb} (92%)
>> >
>> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GR=
PCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/g=
rpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
>> > deleted file mode 100644
>> > index b245ad865..000000000
>> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_AB=
SEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
>> > +++ /dev/null
>> > @@ -1,62 +0,0 @@
>> > -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 200=
1
>> > -From: Martin Jansa <Martin.Jansa@gmail.com>
>> > -Date: Tue, 19 Oct 2021 17:09:55 +0200
>> > -Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYN=
C
>> > - (#25681)"
>> > -
>> > -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
>> > -
>> > -Fixes sysdig from meta-oe and other recipes (like com.webos.service.t=
ts
>> > -libgoogleassistant from meta-webosose) failing with:
>> > -
>> > -| FAILED: userspace/sysdig/sysdig
>> > -| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27=
.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m6=
4 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-str=
ong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-=
sec
>> > -urity  --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-typ=
es -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -f
>> > -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -f=
debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdi=
g/0.27.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE=
/bu
>> > -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-=
sysroot-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=
=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOU=
RCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/=
OE/build
>> > -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sys=
root -Wall -ggdb   -std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -ma=
rch=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  =
-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secur=
ity
>> > ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig=
/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fma=
cro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/=
0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p
>> > -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig=
/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p=
refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.=
1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/=
oe-
>> > -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=
-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 =
-Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/build=
/oe-cor
>> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -W=
l,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build=
/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug=
/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-co=
r
>> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/debug/=
sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe-cor=
e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D      =
                -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2=
-
>> > -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-=
z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/=
OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/s=
rc/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/bui=
ld/
>> > -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/=
debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/=
oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D=
                      -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work=
/
>> > -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,r=
elro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.=
cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sysd=
ig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
>> > - -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  -l=
grpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lp=
rotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -lp=
thread && :
>> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to 'absl::lts_20210324::Mutex::~Mutex()'
>> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to 'absl::lts_20210324::Mutex::~Mutex()'
>> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: und=
efined reference to 'absl::lts_20210324::Mutex::~Mutex()'
>> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: und=
efined reference to 'absl::lts_20210324::Mutex::~Mutex()'
>> > -| collect2: error: ld returned 1 exit status
>> > -
>> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > -
>> > ----
>> > -Upstream-Status: Pending
>> > -
>> > - include/grpcpp/impl/codegen/sync.h | 4 ++--
>> > - 1 file changed, 2 insertions(+), 2 deletions(-)
>> > -
>> > -diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl=
/codegen/sync.h
>> > -index 4cb8133c7c..3d10d9a3a0 100644
>> > ---- a/include/grpcpp/impl/codegen/sync.h
>> > -+++ b/include/grpcpp/impl/codegen/sync.h
>> > -@@ -47,7 +47,7 @@
>> > - namespace grpc {
>> > - namespace internal {
>> > -
>> > --#ifdef GPR_ABSEIL_SYNC
>> > -+#ifdef GRPCPP_ABSEIL_SYNC
>> > -
>> > - using Mutex =3D absl::Mutex;
>> > - using MutexLock =3D absl::MutexLock;
>> > -@@ -142,7 +142,7 @@ class CondVar {
>> > -   gpr_cv cv_;
>> > - };
>> > -
>> > --#endif  // GPR_ABSEIL_SYNC
>> > -+#endif  // GRPCPP_ABSEIL_SYNC
>> > -
>> > - template <typename Predicate>
>> > - GRPC_DEPRECATED("incompatible with thread safety analysis")
>> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separat=
e-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001=
-cmake-add-separate-export-for-plugin-targets.patch
>> > deleted file mode 100644
>> > index 679bd3882..000000000
>> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-expor=
t-for-plugin-targets.patch
>> > +++ /dev/null
>> > @@ -1,93 +0,0 @@
>> > -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 200=
1
>> > -From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> > -Date: Tue, 18 Feb 2020 14:17:07 +0100
>> > -Subject: [PATCH] cmake: add separate export for plugin targets
>> > -
>> > -Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
>> > -
>> > -
>> > ----
>> > - CMakeLists.txt | 18 +++++++++++-------
>> > - 1 file changed, 11 insertions(+), 7 deletions(-)
>> > -
>> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> > -index efdaf8936d..6608b1b00c 100644
>> > ---- a/CMakeLists.txt
>> > -+++ b/CMakeLists.txt
>> > -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
>> > -
>> > -
>> > - if(gRPC_INSTALL)
>> > --  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
>> > -+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
>> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
>> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
>> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
>> > -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
>> > -     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
>> > -     NAMESPACE gRPC::
>> > -   )
>> > -+  install(EXPORT gRPCPluginTargets
>> > -+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
>> > -+    NAMESPACE gRPC::
>> > -+  )
>> > - endif()
>> > -
>> > - include(CMakePackageConfigHelpers)
>> > ---
>> > -2.30.2
>> > -
>> > diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/re=
cipes-devtools/grpc/grpc_1.56.2.bb
>> > similarity index 92%
>> > rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
>> > rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
>> > index 45bfcb857..ac54d704a 100644
>> > --- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
>> > +++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
>> > @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${PN}-=
compiler"
>> >  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>> >
>> >  S =3D "${WORKDIR}/git"
>> > -SRCREV_grpc =3D "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
>> > -BRANCH =3D "v1.50.x"
>> > +SRCREV_grpc =3D "c0d1c393d9365664d47df41746e992ae97b651ef"
>> > +BRANCH =3D "v1.56.x"
>> >  SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;name=
=3Dgrpc;branch=3D${BRANCH} \
>> > -           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEI=
L_SYNC.patch \
>> > -           file://0001-cmake-add-separate-export-for-plugin-targets.p=
atch \
>> >             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
>> >             file://0001-fix-CVE-2023-32732.patch \
>> >             "
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#104813): https://lists.openembedded.org/g/openembe=
dded-devel/message/104813
>> > Mute This Topic: https://lists.openembedded.org/mt/101253581/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

