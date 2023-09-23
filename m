Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034A2CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 12:35:09 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.19626.1695472507245293245
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 05:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZC0fUUV;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-503397ee920so5704161e87.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695472505; x=1696077305; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qGjfvgdGamwg0qW1wxROuBQcj+6HcjszvEwUoGvHsY=;
        b=lZC0fUUVT/gnLhN2uftTNXoPgsAtE0zdTDLGcb3dgI47N7OcMQju/1plU+hpwW3qYU
         c5QaPNNvgomkzXL8hGDYDv+p5nA/Hz2e0Vga2Q4qhO7oBcgtR2az1IgaC06Pj7NnudN3
         QHx4SslX2r3ZJNLJo5gBhf4LwXDycxg74fn8rfnays4ghFd6DDbGcmRiiAxwvb9BJtYn
         yQdc2fmYzHy7zf7IA7U+0JmB9Uf9sfRblMi0itLzhCMAbxWG2HUOvIGoIxqCCpzK2+w9
         S4iqB98/BGqse8ohJnawgFU26/iy6v8AQ5QEGlqlmaQJNoR37OhouY8nUCiXLZIAzm9m
         wOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695472505; x=1696077305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qGjfvgdGamwg0qW1wxROuBQcj+6HcjszvEwUoGvHsY=;
        b=tZuGw9reou+maUAKsKnTvLrgBHNG5Su9KaOdGnwksBcFZlVqVb7PAsbUFMQzLjcCke
         RQVKS5tYUboNYVCKqNcjN0K9RNlqU/EYJZ+KlgRVBkFoIkKOM6Ip68uUwHmmYrqzErto
         9MEUb4Dq0u68sU1cR9QBZswSjISzdNmagbAPCkGg8aWhbatXmrTnkw4kUsf3BnemOIfd
         tJMOdFnBMG44OlxYtIB09BRktEQHxeNYj636iSetoHlFqny7MlwrPPFmLklzH7Xuq7yX
         SyTr1++EpJpkK4KgNSY4B7G/VCpi6hHN69JkGpyAPD6aF53LvLOMwXRcX5O4vl93JzMs
         YIhA==
X-Gm-Message-State: AOJu0YxG67DUzFPxXt7bcc2fmFUC6+yiT3Y66+4OPODKZLo2r24mwwED
	cHLYDxRjZzsGRFFlQ0Kcm2J/OyhhC/sDZgU5MEs=
X-Google-Smtp-Source: AGHT+IE4xBYwBNEQaishFwfT6hgUSLxOLZZ8Y+OsovnDDbK+UsWzYzDDg7Kmm4yfB/iKru4UHsVW5enE9XLmaBO/iuU=
X-Received: by 2002:a19:5002:0:b0:4f8:77db:1d9e with SMTP id
 e2-20020a195002000000b004f877db1d9emr1799674lfb.12.1695472504946; Sat, 23 Sep
 2023 05:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230909093517.444924-1-peron.clem@gmail.com> <20230909093517.444924-5-peron.clem@gmail.com>
 <CAMKF1sqAv8HrONEMnJm+esu-6kDDNbSrsUiGUi41saA4hUOwHQ@mail.gmail.com>
 <CAJiuCcet1YZb=NAUKejCqumUXSqQkjX64vxe5YCO9c6j+CPzNQ@mail.gmail.com>
 <CAMKF1sqCWGQh53Lm+2r3ByvCOs2nCx-7UTtqUVmHyPEV9o5bUA@mail.gmail.com> <178398F3617F1875.4559@lists.openembedded.org>
In-Reply-To: <178398F3617F1875.4559@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 23 Sep 2023 14:34:53 +0200
Message-ID: <CAJiuCcf3_KKpCNaq2Cu9a--QB0qQERPGi+sUmZQsH-X3vu0SNA@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] devtools: grpc: bump to 1.56.2
To: peron.clem@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 12:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105089

Hi Khem,

On Sun, 10 Sept 2023 at 19:14, Cl=C3=A9ment P=C3=A9ron via
lists.openembedded.org <peron.clem=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Khem,
>
> On Sun, 10 Sept 2023 at 17:07, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Sep 10, 2023 at 6:19=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.=
clem@gmail.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Sun, 10 Sept 2023 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> seeing a build error in native version
> > >>
> > >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/31=
03/steps/14/logs/stdio


Just to be sure, I'm trying to reproduce the issue but first I got an
error with "etcd-cpp-apiv3" recipe.

Is using this yaml file for KAS.

and they do $> kas build kas.yml

is equivalent to the CI?

$> cat kas.yml

header:
  version: 8

machine: qemux86-64
distro: poky
target:
  - world

repos:
  poky:
    url: https://git.yoctoproject.org/git/poky
    path: layers/poky
    refspec: master
    layers:
      meta:
      meta-poky:
      meta-yocto-bsp:

  meta-openembedded:
    url: https://github.com/clementperon/meta-openembedded
    path: layers/meta-openembedded
    refspec: bump_grpc
    layers:
      meta-oe:
      meta-networking:
      meta-python:

bblayers_conf_header:
  standard: |
    POKY_BBLAYERS_CONF_VERSION =3D "2"
    BBPATH =3D "${TOPDIR}"
    BBFILES ?=3D ""

local_conf_header:
  standard: |
    CONF_VERSION =3D "2"
    PACKAGE_CLASSES =3D "package_ipk"
  debug-tweaks: |
    EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"

Thanks
Clement

> > >
> > >
> > > Sorry, I thought to have properly retested but my custom gRPC recipe =
took priority over the meta-oe one.
> > >
> > > I have sent a v2.
> >
> > still seeing problem with usbguard. This links with protobuf and it
> > seems protobufs are now linking libabseil
> > differently that it finds undefined symbols when using
> > --no-allow-shlib-undefined
>
> Sorry I missed your message about this issue.
>
> Will try to fix it.
>
> Regards,
>
>
> >
> > >
> > > Regards,
> > >
> > >
> > >>
> > >>
> > >>
> > >> On Sat, Sep 9, 2023 at 2:35=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <pero=
n.clem@gmail.com> wrote:
> > >> >
> > >> > Remove merged patch that export plugin to a separate targets
> > >> >
> > >> > Remove no more applicatable patch
> > >> >
> > >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > >> > ---
> > >> >  ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
> > >> >  ...d-separate-export-for-plugin-targets.patch | 93 --------------=
-----
> > >> >  .../grpc/{grpc_1.50.1.bb =3D> grpc_1.56.2.bb}   |  6 +-
> > >> >  3 files changed, 2 insertions(+), 159 deletions(-)
> > >> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert=
-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> > >> >  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-=
add-separate-export-for-plugin-targets.patch
> > >> >  rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb =3D> grpc_1.=
56.2.bb} (92%)
> > >> >
> > >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Change=
d-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/gr=
pc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> > >> > deleted file mode 100644
> > >> > index b245ad865..000000000
> > >> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCP=
P_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
> > >> > +++ /dev/null
> > >> > @@ -1,62 +0,0 @@
> > >> > -From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00=
 2001
> > >> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> > >> > -Date: Tue, 19 Oct 2021 17:09:55 +0200
> > >> > -Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL=
_SYNC
> > >> > - (#25681)"
> > >> > -
> > >> > -This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
> > >> > -
> > >> > -Fixes sysdig from meta-oe and other recipes (like com.webos.servi=
ce.tts
> > >> > -libgoogleassistant from meta-webosose) failing with:
> > >> > -
> > >> > -| FAILED: userspace/sysdig/sysdig
> > >> > -| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/=
0.27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++=
 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector=
-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dfor=
mat-sec
> > >> > -urity  --sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-l=
inux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug=
-types -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-li=
nux/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                     =
 -f
> > >> > -debug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-l=
inux/sysdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                    =
  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s=
ysdig/0.27.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=
=3D/OE/bu
> > >> > -ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/rec=
ipe-sysroot-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mt=
une=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_=
SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=
=3D/OE/build
> > >> > -/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe=
-sysroot -Wall -ggdb   -std=3Dc++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64=
 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-stro=
ng  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-s=
ecurity
> > >> > ---sysroot=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sys=
dig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdebu=
g-p
> > >> > -refix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sy=
sdig/0.27.1-r0=3D/usr/src/debug/sysdig/0.27.1-r0                      -fdeb=
ug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0=
.27.1-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/bu=
ild/oe-
> > >> > -core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sys=
root-native=3D  -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dc=
ore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=3D/OE/=
build/oe-cor
> > >> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroo=
t -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/b=
uild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/d=
ebug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/o=
e-cor
> > >> > -e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/src/de=
bug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/build/oe=
-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=3D  =
                    -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/c=
ore2-
> > >> > -64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,-z,rel=
ro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=
=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/u=
sr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE=
/build/
> > >> > -oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=3D/usr/=
src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=3D/OE/bu=
ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroo=
t=3D                      -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/=
work/
> > >> > -core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=3D  -Wl,=
-z,relro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_i=
nfo.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/=
sysdig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
> > >> > - -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure=
  -lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure =
 -lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl =
 -lpthread && :
> > >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:=
 undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:=
 undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error:=
 undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > >> > -| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error:=
 undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
> > >> > -| collect2: error: ld returned 1 exit status
> > >> > -
> > >> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >> > -
> > >> > ----
> > >> > -Upstream-Status: Pending
> > >> > -
> > >> > - include/grpcpp/impl/codegen/sync.h | 4 ++--
> > >> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > >> > -
> > >> > -diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/=
impl/codegen/sync.h
> > >> > -index 4cb8133c7c..3d10d9a3a0 100644
> > >> > ---- a/include/grpcpp/impl/codegen/sync.h
> > >> > -+++ b/include/grpcpp/impl/codegen/sync.h
> > >> > -@@ -47,7 +47,7 @@
> > >> > - namespace grpc {
> > >> > - namespace internal {
> > >> > -
> > >> > --#ifdef GPR_ABSEIL_SYNC
> > >> > -+#ifdef GRPCPP_ABSEIL_SYNC
> > >> > -
> > >> > - using Mutex =3D absl::Mutex;
> > >> > - using MutexLock =3D absl::MutexLock;
> > >> > -@@ -142,7 +142,7 @@ class CondVar {
> > >> > -   gpr_cv cv_;
> > >> > - };
> > >> > -
> > >> > --#endif  // GPR_ABSEIL_SYNC
> > >> > -+#endif  // GRPCPP_ABSEIL_SYNC
> > >> > -
> > >> > - template <typename Predicate>
> > >> > - GRPC_DEPRECATED("incompatible with thread safety analysis")
> > >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-sep=
arate-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/=
0001-cmake-add-separate-export-for-plugin-targets.patch
> > >> > deleted file mode 100644
> > >> > index 679bd3882..000000000
> > >> > --- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-e=
xport-for-plugin-targets.patch
> > >> > +++ /dev/null
> > >> > @@ -1,93 +0,0 @@
> > >> > -From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00=
 2001
> > >> > -From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.=
com>
> > >> > -Date: Tue, 18 Feb 2020 14:17:07 +0100
> > >> > -Subject: [PATCH] cmake: add separate export for plugin targets
> > >> > -
> > >> > -Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/293=
28]
> > >> > -
> > >> > -
> > >> > ----
> > >> > - CMakeLists.txt | 18 +++++++++++-------
> > >> > - 1 file changed, 11 insertions(+), 7 deletions(-)
> > >> > -
> > >> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > >> > -index efdaf8936d..6608b1b00c 100644
> > >> > ---- a/CMakeLists.txt
> > >> > -+++ b/CMakeLists.txt
> > >> > -@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_pl=
ugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTarge=
ts
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
> > >> > -
> > >> > -
> > >> > - if(gRPC_INSTALL)
> > >> > --  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
> > >> > -+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
> > >> > -     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> > >> > -     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> > >> > -     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> > >> > -@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
> > >> > -     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> > >> > -     NAMESPACE gRPC::
> > >> > -   )
> > >> > -+  install(EXPORT gRPCPluginTargets
> > >> > -+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> > >> > -+    NAMESPACE gRPC::
> > >> > -+  )
> > >> > - endif()
> > >> > -
> > >> > - include(CMakePackageConfigHelpers)
> > >> > ---
> > >> > -2.30.2
> > >> > -
> > >> > diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-o=
e/recipes-devtools/grpc/grpc_1.56.2.bb
> > >> > similarity index 92%
> > >> > rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> > >> > rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> > >> > index 45bfcb857..ac54d704a 100644
> > >> > --- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
> > >> > +++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
> > >> > @@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D " ${=
PN}-compiler"
> > >> >  # RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > >> >
> > >> >  S =3D "${WORKDIR}/git"
> > >> > -SRCREV_grpc =3D "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
> > >> > -BRANCH =3D "v1.50.x"
> > >> > +SRCREV_grpc =3D "c0d1c393d9365664d47df41746e992ae97b651ef"
> > >> > +BRANCH =3D "v1.56.x"
> > >> >  SRC_URI =3D "gitsm://github.com/grpc/grpc.git;protocol=3Dhttps;na=
me=3Dgrpc;branch=3D${BRANCH} \
> > >> > -           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_A=
BSEIL_SYNC.patch \
> > >> > -           file://0001-cmake-add-separate-export-for-plugin-targe=
ts.patch \
> > >> >             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.pat=
ch \
> > >> >             file://0001-fix-CVE-2023-32732.patch \
> > >> >             "
> > >> > --
> > >> > 2.34.1
> > >> >
> > >> >
> > >> >
> > >> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104829): https://lists.openembedded.org/g/openembedde=
d-devel/message/104829
> Mute This Topic: https://lists.openembedded.org/mt/101253581/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

