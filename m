Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79179E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 01:30:17 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.9143.1736299808057053830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 17:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 2CF39A1A;
	Wed,  8 Jan 2025 02:30:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.168.177]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVKtZ-4c8lJB0; Wed, 8 Jan 2025 02:30:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCHv2] openh264: update 2.3.1 -> 2.5.0
Date: Wed,  8 Jan 2025 02:30:21 +0100
Message-ID: <20250108013021.4440-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736299805-497F99C7-2E924A1C/10/3626336762 SUSPECT URL
X-TOI-MSGID: f9376adb-e744-42dd-bd0c-a967c2f5592c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114731

- switch to meson buildsystem

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-cp-options-to-preserve-file-mode.patch |  32 ------
 ...ossibility-to-disable-NEON-extension.patch | 103 ------------------
 .../openh264/openh264_2.3.1.bb                |  55 ----------
 .../openh264/openh264_2.5.0.bb                |  20 ++++
 4 files changed, 20 insertions(+), 190 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/=
0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/=
0002-Makefile-add-possibility-to-disable-NEON-extension.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_=
2.3.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_=
2.5.0.bb

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Ma=
kefile-Use-cp-options-to-preserve-file-mode.patch b/meta-multimedia/recip=
es-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-=
file-mode.patch
deleted file mode 100644
index 92f32948b2..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-=
Use-cp-options-to-preserve-file-mode.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Mar 2020 22:28:25 -0800
-Subject: [PATCH] Makefile: Use cp options to preserve file mode
-
-This fixes packaging issues e.g.
-openh264: /usr/lib/libopenh264.so is owned by uid 1000, which is the sam=
e as the user running bitbake
-
-Upstream-Status: Submitted [https://github.com/cisco/openh264/pull/3245]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 74ff029d..ac643412 100644
---- a/Makefile
-+++ b/Makefile
-@@ -306,8 +306,8 @@ install-shared: $(LIBPREFIX)$(PROJECT_NAME).$(SHARED=
LIBSUFFIX) install-headers $
- 	mkdir -p $(DESTDIR)$(SHAREDLIB_DIR)
- 	install -m 755 $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER) $=
(DESTDIR)$(SHAREDLIB_DIR)
- 	if [ "$(SHAREDLIBSUFFIXFULLVER)" !=3D "$(SHAREDLIBSUFFIX)" ]; then \
--	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTD=
IR)$(SHAREDLIB_DIR) ; \
--	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHA=
REDLIB_DIR) ; \
-+	  cp -R --no-dereference --preserve=3Dmode,links $(LIBPREFIX)$(PROJECT=
_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \
-+	  cp -R --no-dereference --preserve=3Dmode,links $(LIBPREFIX)$(PROJECT=
_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \
- 	fi
- 	mkdir -p $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
- 	install -m 644 $(PROJECT_NAME).pc $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/p=
kgconfig
---=20
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Ma=
kefile-add-possibility-to-disable-NEON-extension.patch b/meta-multimedia/=
recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-dis=
able-NEON-extension.patch
deleted file mode 100644
index 298ac1c013..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-=
add-possibility-to-disable-NEON-extension.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 2001
-From: Benjamin Bara <benjamin.bara@skidata.com>
-Date: Thu, 31 Aug 2023 09:27:31 +0200
-Subject: [PATCH 2/2] Makefile: add possibility to disable NEON extension
-
-README states that the NEON extension is optional. However, currently it
-cannot be turned off, therefore add an option to disable it.
-
-Upstream-Status: Submitted [https://github.com/cisco/openh264/pull/3679]
-Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
----
- Makefile                   |  1 +
- build/arch.mk              |  4 ++++
- build/msvc-common.mk       | 10 ++++++++--
- build/platform-mingw_nt.mk |  5 ++++-
- 4 files changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index baed53a7..cc22c4aa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -35,6 +35,7 @@ CCASFLAGS=3D$(CFLAGS)
- STATIC_LDFLAGS=3D-lstdc++
- STRIP ?=3D strip
- USE_STACK_PROTECTOR =3D Yes
-+USE_NEON=3DYes
-=20
- SHAREDLIB_MAJORVERSION=3D7
- FULL_VERSION :=3D 2.3.1
-diff --git a/build/arch.mk b/build/arch.mk
-index 4e1538c4..fd6a81e4 100644
---- a/build/arch.mk
-+++ b/build/arch.mk
-@@ -17,18 +17,22 @@ ifneq ($(filter-out arm64 arm64e, $(filter arm%, $(A=
RCH))),)
- ifeq ($(USE_ASM), Yes)
- ASM_ARCH =3D arm
- ASMFLAGS +=3D -I$(SRC_PATH)codec/common/arm/
-+ifeq ($(USE_NEON), Yes)
- CFLAGS +=3D -DHAVE_NEON
- endif
- endif
-+endif
-=20
- #for arm64
- ifneq ($(filter arm64 aarch64 arm64e, $(ARCH)),)
- ifeq ($(USE_ASM), Yes)
- ASM_ARCH =3D arm64
- ASMFLAGS +=3D -I$(SRC_PATH)codec/common/arm64/
-+ifeq ($(USE_NEON), Yes)
- CFLAGS +=3D -DHAVE_NEON_AARCH64
- endif
- endif
-+endif
-=20
- #for mips
- ifneq ($(filter mips mips64, $(ARCH)),)
-diff --git a/build/msvc-common.mk b/build/msvc-common.mk
-index 5891ea4e..5a1e2582 100644
---- a/build/msvc-common.mk
-+++ b/build/msvc-common.mk
-@@ -10,7 +10,10 @@ else
- endif
- ifeq ($(ASM_ARCH), arm)
- CCAS =3D gas-preprocessor.pl -as-type armasm -force-thumb -- armasm
--CCASFLAGS =3D -nologo -DHAVE_NEON -ignore 4509
-+CCASFLAGS =3D -nologo -ignore 4509
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS +=3D -DHAVE_NEON
-+endif
- endif
-=20
- CC=3Dcl
-@@ -20,7 +23,10 @@ CXX_O=3D-Fo$@
-=20
- ifeq ($(ASM_ARCH), arm64)
- CCAS =3D clang-cl
--CCASFLAGS =3D -nologo -DHAVE_NEON_AARCH64 --target=3Darm64-windows
-+CCASFLAGS =3D -nologo --target=3Darm64-windows
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS +=3D -DHAVE_NEON_AARCH64
-+endif
- endif
-=20
-=20
-diff --git a/build/platform-mingw_nt.mk b/build/platform-mingw_nt.mk
-index b7a5495d..d73e362a 100644
---- a/build/platform-mingw_nt.mk
-+++ b/build/platform-mingw_nt.mk
-@@ -17,7 +17,10 @@ endif
- endif
- ifeq ($(ASM_ARCH), arm)
- CCAS =3D gas-preprocessor.pl -as-type clang -force-thumb -- $(CC)
--CCASFLAGS =3D -DHAVE_NEON -mimplicit-it=3Dalways
-+CCASFLAGS =3D -mimplicit-it=3Dalways
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS +=3D -DHAVE_NEON
-+endif
- endif
- EXEEXT =3D .exe
-=20
---=20
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.b=
b b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
deleted file mode 100644
index 6dfd759355..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY =3D "Open Source H.264 Codec"
-DESCRIPTION =3D "OpenH264 is a codec library which supports H.264 encodi=
ng and \
-decoding. It is suitable for use in real time applications such as WebRT=
C."
-HOMEPAGE =3D "http://www.openh264.org/"
-SECTION =3D "libs/multimedia"
-
-DEPENDS:append:x86 =3D " nasm-native"
-DEPENDS:append:x86-64 =3D " nasm-native"
-
-LICENSE =3D "BSD-2-Clause"
-LICENSE_FLAGS =3D "commercial"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73=
bcf"
-
-S =3D "${WORKDIR}/git"
-SRCREV =3D "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"
-BRANCH =3D "openh264v${PV}"
-SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
-           file://0001-Makefile-Use-cp-options-to-preserve-file-mode.pat=
ch \
-           file://0002-Makefile-add-possibility-to-disable-NEON-extensio=
n.patch \
-           "
-
-COMPATIBLE_MACHINE:armv7a =3D "(.*)"
-COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
-COMPATIBLE_MACHINE:x86 =3D "(.*)"
-COMPATIBLE_MACHINE:x86-64 =3D "(.*)"
-COMPATIBLE_MACHINE:mips =3D "(.*)"
-COMPATIBLE_MACHINE:mips64 =3D "(.*)"
-COMPATIBLE_MACHINE:powerpc64le =3D "null"
-
-EXTRA_OEMAKE:armv7a =3D "ARCH=3Darm"
-EXTRA_OEMAKE:armv7ve =3D "ARCH=3Darm"
-EXTRA_OEMAKE:aarch64 =3D "ARCH=3Darm64"
-EXTRA_OEMAKE:x86 =3D "ARCH=3Di386"
-EXTRA_OEMAKE:x86-64 =3D "ARCH=3Dx86_64"
-EXTRA_OEMAKE:mips =3D "ARCH=3Dmips"
-EXTRA_OEMAKE:mips64 =3D "ARCH=3Dmips64"
-EXTRA_OEMAKE:riscv64 =3D "ARCH=3Driscv64"
-
-EXTRA_OEMAKE:append:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","ne=
on",""," USE_NEON=3DNo",d)}"
-EXTRA_OEMAKE:append:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","n=
eon",""," USE_NEON=3DNo",d)}"
-
-EXTRA_OEMAKE:append =3D " ENABLEPIC=3DYes"
-do_configure() {
-    :
-}
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR_NAME=3D$=
{baselib} SHAREDLIB_DIR=3D${libdir}
-}
-
-CLEANBROKEN =3D "1"
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.b=
b b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
new file mode 100644
index 0000000000..04e93ce790
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Open Source H.264 Codec"
+DESCRIPTION =3D "OpenH264 is a codec library which supports H.264 encodi=
ng and \
+decoding. It is suitable for use in real time applications such as WebRT=
C."
+HOMEPAGE =3D "http://www.openh264.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "BSD-2-Clause"
+LICENSE_FLAGS =3D "commercial"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73=
bcf"
+
+DEPENDS =3D " nasm-native"
+
+inherit meson pkgconfig
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0"
+BRANCH =3D "openh264v${PV}"
+SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH}"
+
+COMPATIBLE_MACHINE:powerpc64le =3D "null"
+
--=20
2.47.1


