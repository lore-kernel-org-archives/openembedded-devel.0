Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F49ECAAD2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 05:59:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web12.33710.1661493584048340582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 22:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UaW8YQuk;
 spf=pass (domain: gmail.com, ip: 209.85.128.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-31f445bd486so11110277b3.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 22:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=eYeUWQBirxKMMPZ/Hq6LRxuT5qTkB3XDN+WvZxCSmmY=;
        b=UaW8YQukvJBgU9NDqqn3BD2RkFxfq5Xp0WbJzrQTf9cU0YceSJyvbjAbPUisohhO4w
         ytyQQ9ktAgA57sEBEKuZwUkyVrHye9l+yVXP+oXgTc5GiP7tkjZo8iBOvTqeV3oBZi+E
         +gtoEcOl2l/Dt/LJjhG3FczC5HWxy6P1quEcdMiJMeop2X6g+GeT/30lWOwP4evOFRNh
         XYnfGWl9rcuBUfcAqdDbRbhnyM5+rqIX2hpnHybz8Vh5rDscyGjL0UdywMtVtIfHUbUN
         iPl6gLfzL9AbFdBRA+hMIrEBt88LtsZl8+/RpWx7wXiqPPm3qXVzWPBZ3ebdNP0b35T7
         g4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=eYeUWQBirxKMMPZ/Hq6LRxuT5qTkB3XDN+WvZxCSmmY=;
        b=IHc/7Adu1YaZB6M5/SUqfVwAvmpboxtlFe9EAe+ZkniXcaU6l0wBOoGObj9qMm2gLZ
         0vkoN/hSv9ggRpHbf71anF4PSmV9g6S98r30fEy7tcvAXQbUm5+/Eu7ZefjlsDBIoEFr
         qL6u7G2eVvxNDuTP/8iQ7nJtZKCkfUJXfwg8327Tvqh33wB+fjK0WcJwfa9R5OGkrGlj
         r1rxBWyGmv9WH3A/2ToRusGuUS2uIqp2ycUYGfkgNFXzCs7MfxyDWHDp44VivDtMdL2i
         chCLtUZLv373u+Dzc9rtCDFCP1fRRGzo/kVFKj4xos12ueMfwCnQM6EdqKkqskC77zft
         EwsA==
X-Gm-Message-State: ACgBeo3emaYQ8FQFwmayfWM7VA9/3QzfaWtsZkzOWgMH5xOFN9INNXuI
	qNR/2WpxSs6K27FZ/2KPPe/e6jMXGquupDoWCRw=
X-Google-Smtp-Source: 
 AA6agR4Zak+fF83xkx9I4mLwPLuHBTin2/0XUQfy5idBpC3o/44ucyyQBNA6N4afjMViPxcCig28Jf84oaxnsgTGedc=
X-Received: by 2002:a0d:d4c1:0:b0:33d:ce57:6ae2 with SMTP id
 w184-20020a0dd4c1000000b0033dce576ae2mr2225171ywd.162.1661493583109; Thu, 25
 Aug 2022 22:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220825114622.2978807-1-uvv.mail@gmail.com>
In-Reply-To: <20220825114622.2978807-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 22:59:16 -0700
Message-ID: 
 <CAMKF1spe5Z77e6mpFSU=eqimm1EWSu6+fhTE8LvZLWht3VA_mQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] protobuf: 3.19.4 -> 3.21.5 upgrade
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 05:59:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98463

its fails to build

https://errors.yoctoproject.org/Errors/Build/152159/

On Thu, Aug 25, 2022 at 4:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrot=
e:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> Drop the patch that was accepted upstream
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  .../0001-Fix-linking-error-with-ld-gold.patch |  6 +-
>  ...r-init-prio-for-extension-attributes.patch | 79 -------------------
>  ...ude-descriptor.cc-when-building-libp.patch |  8 +-
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 10 +--
>  .../0001-protobuf-fix-configure-error.patch   | 10 +--
>  ...{protobuf_3.19.4.bb =3D> protobuf_3.21.5.bb} |  5 +-
>  6 files changed, 16 insertions(+), 102 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower=
-init-prio-for-extension-attributes.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.4.bb =3D> protob=
uf_3.21.5.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-=
error-with-ld-gold.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-=
Fix-linking-error-with-ld-gold.patch
> index 488c1f6ff..2bcb13873 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-w=
ith-ld-gold.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-w=
ith-ld-gold.patch
> @@ -1,4 +1,4 @@
> -From ddb9c5147883f8b27b4205450139e4a115d9961f Mon Sep 17 00:00:00 2001
> +From a91130bb95528743a3f7253f8fe945b7505047d5 Mon Sep 17 00:00:00 2001
>  From: Kyungjik Min <dp.min@lge.com>
>  Date: Mon, 28 Dec 2020 15:56:09 +0900
>  Subject: [PATCH] Fix linking error with ld-gold
> @@ -19,6 +19,7 @@ N/A
>  :Issues Addressed:
>  [PLAT-130467] Fix build error for libgoogleassistant with latest
>                protobuf-3.11.4
> +
>  ---
>   src/libprotobuf-lite.map | 2 ++
>   src/libprotobuf.map      | 2 ++
> @@ -64,6 +65,3 @@ index 391554669..a1853ca6c 100644
>
>     local:
>       *;
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-p=
rio-for-extension-attributes.patch b/meta-oe/recipes-devtools/protobuf/prot=
obuf/0001-Lower-init-prio-for-extension-attributes.patch
> deleted file mode 100644
> index a1200e01c..000000000
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio-for=
-extension-attributes.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -From 8ff34dbff1eac612326b492d0b2cb93901ad7e2b Mon Sep 17 00:00:00 2001
> -From: Jani Nurminen <jani.nurminen@windriver.com>
> -Date: Fri, 24 Sep 2021 09:56:11 +0200
> -Subject: [PATCH] Lower init prio for extension attributes
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Added PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY in
> -code generation for extension attributes.
> -It has lower prio than PROTOBUF_ATTRIBUTE_INIT_PRIORITY to
> -ensure that extension attributes are initialized after
> -other attribute.
> -This is needed in some applications to avoid segmentation fault.
> -
> -Reported by Karl-Herman N=C3=A4slund.
> -
> -Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
> -
> -Rebase on master
> -
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - src/google/protobuf/compiler/cpp/cpp_extension.cc |  2 +-
> - src/google/protobuf/port_def.inc                  | 12 ++++++++++++
> - src/google/protobuf/port_undef.inc                |  1 +
> - 3 files changed, 14 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/google/protobuf/compiler/cpp/cpp_extension.cc b/src/goo=
gle/protobuf/compiler/cpp/cpp_extension.cc
> -index 8604da5f2..984345ebe 100644
> ---- a/src/google/protobuf/compiler/cpp/cpp_extension.cc
> -+++ b/src/google/protobuf/compiler/cpp/cpp_extension.cc
> -@@ -164,7 +164,7 @@ void ExtensionGenerator::GenerateDefinition(io::Prin=
ter* printer) {
> -   }
> -
> -   format(
> --      "PROTOBUF_ATTRIBUTE_INIT_PRIORITY "
> -+      "PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY "
> -       "::$proto_ns$::internal::ExtensionIdentifier< $extendee$,\n"
> -       "    ::$proto_ns$::internal::$type_traits$, $field_type$, $packed=
$ >\n"
> -       "  $scoped_name$($constant_name$, $1$);\n",
> -diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
> -index 7e9119112..a5117090d 100644
> ---- a/src/google/protobuf/port_def.inc
> -+++ b/src/google/protobuf/port_def.inc
> -@@ -614,6 +614,18 @@
> - #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY
> - #endif
> -
> -+// Some embedded systems get a segmentation fault if extension attribut=
es are
> -+// initialized with higher or equal priority as other attributes. This =
gives
> -+// extension attributes high priority, but lower than other attributes.
> -+#ifdef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
> -+#error PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY was previously define=
d
> -+#endif
> -+#if PROTOBUF_GNUC_MIN(3, 0) && (!defined(__APPLE__) || defined(__clang_=
_)) && !((defined(sun) || defined(__sun)) && (defined(__SVR4) || defined(__=
svr4__)))
> -+#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY __attribute__((init_=
priority((103))))
> -+#else
> -+#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
> -+#endif
> -+
> - #ifdef PROTOBUF_PRAGMA_INIT_SEG
> - #error PROTOBUF_PRAGMA_INIT_SEG was previously defined
> - #endif
> -diff --git a/src/google/protobuf/port_undef.inc b/src/google/protobuf/po=
rt_undef.inc
> -index ccc5daf56..2b28f3a31 100644
> ---- a/src/google/protobuf/port_undef.inc
> -+++ b/src/google/protobuf/port_undef.inc
> -@@ -83,6 +83,7 @@
> - #undef PROTOBUF_HAVE_ATTRIBUTE_WEAK
> - #undef PROTOBUF_ATTRIBUTE_NO_DESTROY
> - #undef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
> -+#undef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
> - #undef PROTOBUF_PRAGMA_INIT_SEG
> - #undef PROTOBUF_ASAN
> - #undef PROTOBUF_MSAN
> ---
> -2.26.2
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-=
include-descriptor.cc-when-building-libp.patch b/meta-oe/recipes-devtools/p=
rotobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.=
patch
> index bd3a277a3..59d43072c 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include=
-descriptor.cc-when-building-libp.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include=
-descriptor.cc-when-building-libp.patch
> @@ -1,4 +1,4 @@
> -From 8515ceec5ba3e2fcdbc819b5bf10fe742d7c9d5d Mon Sep 17 00:00:00 2001
> +From 76980e1c84374e8bfa4dffcca78c5050783e83b9 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Thu, 27 Jun 2019 13:27:18 +0000
>  Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building
> @@ -17,14 +17,14 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index d4f11ce79..96d911746 100644
> +index e6a7dc7fd..6b0fe6686 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -323,6 +323,7 @@ libprotoc_la_LDFLAGS +=3D -Wl,--version-script=3D$(s=
rcdir)/libprotoc.map
> +@@ -326,6 +326,7 @@ libprotoc_la_LDFLAGS +=3D -Wl,--version-script=3D$(s=
rcdir)/libprotoc.map
>   EXTRA_libprotoc_la_DEPENDENCIES =3D libprotoc.map
>   endif
>   libprotoc_la_SOURCES =3D                                         \
>  +  google/protobuf/descriptor.pb.cc                             \
>     google/protobuf/compiler/code_generator.cc                   \
>     google/protobuf/compiler/command_line_interface.cc           \
> -   google/protobuf/compiler/cpp/cpp_enum.cc                     \
> +   google/protobuf/compiler/cpp/enum.cc                         \
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Mak=
efile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/p=
rotobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.=
patch
> index 934c98193..36c3c597a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,4 +1,4 @@
> -From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
> +From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Fri, 28 Jun 2019 13:50:52 +0000
>  Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
> @@ -24,12 +24,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLA=
GS variables, fix build
>  Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +
>  ---
>   examples/Makefile | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index e9f9635ae..b2fbe2de1 100644
> +index 1c7ec8d63..85f591231 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -2,6 +2,8 @@
> @@ -41,7 +42,7 @@ index e9f9635ae..b2fbe2de1 100644
>   all: cpp java python
>
>   cpp:    add_person_cpp    list_people_cpp
> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> +@@ -40,11 +42,11 @@ protoc_middleman_dart: addressbook.proto
>
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installe=
d
> @@ -55,6 +56,3 @@ index e9f9635ae..b2fbe2de1 100644
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix=
-configure-error.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-pr=
otobuf-fix-configure-error.patch
> index a2f7a4b77..7c87dbe26 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-config=
ure-error.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-config=
ure-error.patch
> @@ -1,4 +1,4 @@
> -From 52959e8e01e39139d18f752e97283e45b4b7a426 Mon Sep 17 00:00:00 2001
> +From 2649fe191ad3f086274a9bf1520212a4c715c944 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 18 Jul 2018 17:52:34 +0800
>  Subject: [PATCH] protobuf: fix configure error
> @@ -12,15 +12,16 @@ caused by missing submodule googletest.
>  Upstream-Status: Inappropriate [oe-specific]
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   configure.ac | 1 -
>   1 file changed, 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index aec10cf..7fbe57d 100644
> +index 375a79d93..1d73cd73f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -214,7 +214,6 @@ AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
> +@@ -241,7 +241,6 @@ AC_SUBST([LIBLOG_LIBS])
>   #   too.
>   export CFLAGS
>   export CXXFLAGS
> @@ -28,6 +29,3 @@ index aec10cf..7fbe57d 100644
>
>   AC_CONFIG_FILES([Makefile src/Makefile benchmarks/Makefile conformance/=
Makefile protobuf.pc protobuf-lite.pc])
>   AC_OUTPUT
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> index 566233084..a8828ec40 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> @@ -10,15 +10,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37b5762e07=
f0af8c74ce80a8bda4266b"
>  DEPENDS =3D "zlib"
>  DEPENDS:append:class-target =3D " protobuf-native"
>
> -SRCREV =3D "22d0e265de7d2b3d2e9a00d071313502e7d4cccf"
> +SRCREV =3D "ab840345966d0fa8e7100d771c92a73bfbadd25c"
>
> -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D3.19=
.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D21.x=
;protocol=3Dhttps \
>             file://run-ptest \
>             file://0001-protobuf-fix-configure-error.patch \
>             file://0001-Makefile.am-include-descriptor.cc-when-building-l=
ibp.patch \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
>             file://0001-Fix-linking-error-with-ld-gold.patch \
> -           file://0001-Lower-init-prio-for-extension-attributes.patch \
>             "
>  SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on-mips-=
clang.patch "
>  SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-on-mip=
s-clang.patch "
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98430): https://lists.openembedded.org/g/openembedded=
-devel/message/98430
> Mute This Topic: https://lists.openembedded.org/mt/93246133/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

