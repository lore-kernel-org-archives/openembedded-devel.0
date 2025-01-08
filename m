Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604EEE77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 01:31:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.8959.1736299862207521381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 17:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 38989E83;
	Wed,  8 Jan 2025 02:31:00 +0100 (CET)
Received: from [192.168.178.67] ([84.154.168.177]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVKuR-2vux280; Wed, 8 Jan 2025 02:30:59 +0100
Date: Wed, 08 Jan 2025 02:31:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] openh264: update 2.3.1 -> 2.5.0
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <8KXQPS.GXXYUCJGXQND@t-online.de>
In-Reply-To: <1818937A0E7D4478.18084@lists.openembedded.org>
References: <1818937A0E7D4478.18084@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-xjKQVDvV3UHHoP5c9Xe9"
X-TOI-EXPURGATEID: 150726::1736299859-213739DC-195B1B18/10/3626336762 SUSPECT URL
X-TOI-MSGID: dd181757-92c2-4c95-9df0-1a1d47a93a12
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114732

--=-xjKQVDvV3UHHoP5c9Xe9
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: also remove unneeded patches

On Wed, Jan 8 2025 at 02:30:21 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - switch to meson buildsystem
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  ...Use-cp-options-to-preserve-file-mode.patch |  32 ------
>  ...ossibility-to-disable-NEON-extension.patch | 103 
> ------------------
>  .../openh264/openh264_2.3.1.bb                |  55 ----------
>  .../openh264/openh264_2.5.0.bb                |  20 ++++
>  4 files changed, 20 insertions(+), 190 deletions(-)
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
>  create mode 100644 
> meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch 
> b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
> deleted file mode 100644
> index 92f32948b2..0000000000
> --- 
> a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Tue, 3 Mar 2020 22:28:25 -0800
> -Subject: [PATCH] Makefile: Use cp options to preserve file mode
> -
> -This fixes packaging issues e.g.
> -openh264: /usr/lib/libopenh264.so is owned by uid 1000, which is the 
> same as the user running bitbake
> -
> -Upstream-Status: Submitted 
> [<https://github.com/cisco/openh264/pull/3245>]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 74ff029d..ac643412 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -306,8 +306,8 @@ install-shared: 
> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) install-headers $
> - 	mkdir -p $(DESTDIR)$(SHAREDLIB_DIR)
> - 	install -m 755 
> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER) 
> $(DESTDIR)$(SHAREDLIB_DIR)
> - 	if [ "$(SHAREDLIBSUFFIXFULLVER)" != "$(SHAREDLIBSUFFIX)" ]; then \
> --	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) 
> $(DESTDIR)$(SHAREDLIB_DIR) ; \
> --	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) 
> $(DESTDIR)$(SHAREDLIB_DIR) ; \
> -+	  cp -R --no-dereference --preserve=mode,links 
> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) 
> $(DESTDIR)$(SHAREDLIB_DIR) ; \
> -+	  cp -R --no-dereference --preserve=mode,links 
> $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) 
> $(DESTDIR)$(SHAREDLIB_DIR) ; \
> - 	fi
> - 	mkdir -p $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
> - 	install -m 644 $(PROJECT_NAME).pc 
> $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
> ---
> -2.25.1
> -
> diff --git 
> a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch 
> b/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
> deleted file mode 100644
> index 298ac1c013..0000000000
> --- 
> a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 
> 2001
> -From: Benjamin Bara <benjamin.bara@skidata.com 
> <mailto:benjamin.bara@skidata.com>>
> -Date: Thu, 31 Aug 2023 09:27:31 +0200
> -Subject: [PATCH 2/2] Makefile: add possibility to disable NEON 
> extension
> -
> -README states that the NEON extension is optional. However, 
> currently it
> -cannot be turned off, therefore add an option to disable it.
> -
> -Upstream-Status: Submitted 
> [<https://github.com/cisco/openh264/pull/3679>]
> -Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com 
> <mailto:benjamin.bara@skidata.com>>
> ----
> - Makefile                   |  1 +
> - build/arch.mk              |  4 ++++
> - build/msvc-common.mk       | 10 ++++++++--
> - build/platform-mingw_nt.mk |  5 ++++-
> - 4 files changed, 17 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index baed53a7..cc22c4aa 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -35,6 +35,7 @@ CCASFLAGS=$(CFLAGS)
> - STATIC_LDFLAGS=-lstdc++
> - STRIP ?= strip
> - USE_STACK_PROTECTOR = Yes
> -+USE_NEON=Yes
> -
> - SHAREDLIB_MAJORVERSION=7
> - FULL_VERSION := 2.3.1
> -diff --git a/build/arch.mk b/build/arch.mk
> -index 4e1538c4..fd6a81e4 100644
> ---- a/build/arch.mk
> -+++ b/build/arch.mk
> -@@ -17,18 +17,22 @@ ifneq ($(filter-out arm64 arm64e, $(filter arm%, 
> $(ARCH))),)
> - ifeq ($(USE_ASM), Yes)
> - ASM_ARCH = arm
> - ASMFLAGS += -I$(SRC_PATH)codec/common/arm/
> -+ifeq ($(USE_NEON), Yes)
> - CFLAGS += -DHAVE_NEON
> - endif
> - endif
> -+endif
> -
> - #for arm64
> - ifneq ($(filter arm64 aarch64 arm64e, $(ARCH)),)
> - ifeq ($(USE_ASM), Yes)
> - ASM_ARCH = arm64
> - ASMFLAGS += -I$(SRC_PATH)codec/common/arm64/
> -+ifeq ($(USE_NEON), Yes)
> - CFLAGS += -DHAVE_NEON_AARCH64
> - endif
> - endif
> -+endif
> -
> - #for mips
> - ifneq ($(filter mips mips64, $(ARCH)),)
> -diff --git a/build/msvc-common.mk b/build/msvc-common.mk
> -index 5891ea4e..5a1e2582 100644
> ---- a/build/msvc-common.mk
> -+++ b/build/msvc-common.mk
> -@@ -10,7 +10,10 @@ else
> - endif
> - ifeq ($(ASM_ARCH), arm)
> - CCAS = gas-preprocessor.pl -as-type armasm -force-thumb -- armasm
> --CCASFLAGS = -nologo -DHAVE_NEON -ignore 4509
> -+CCASFLAGS = -nologo -ignore 4509
> -+ifeq ($(USE_NEON), Yes)
> -+CCASFLAGS += -DHAVE_NEON
> -+endif
> - endif
> -
> - CC=cl
> -@@ -20,7 +23,10 @@ CXX_O=-Fo$@
> -
> - ifeq ($(ASM_ARCH), arm64)
> - CCAS = clang-cl
> --CCASFLAGS = -nologo -DHAVE_NEON_AARCH64 --target=arm64-windows
> -+CCASFLAGS = -nologo --target=arm64-windows
> -+ifeq ($(USE_NEON), Yes)
> -+CCASFLAGS += -DHAVE_NEON_AARCH64
> -+endif
> - endif
> -
> -
> -diff --git a/build/platform-mingw_nt.mk b/build/platform-mingw_nt.mk
> -index b7a5495d..d73e362a 100644
> ---- a/build/platform-mingw_nt.mk
> -+++ b/build/platform-mingw_nt.mk
> -@@ -17,7 +17,10 @@ endif
> - endif
> - ifeq ($(ASM_ARCH), arm)
> - CCAS = gas-preprocessor.pl -as-type clang -force-thumb -- $(CC)
> --CCASFLAGS = -DHAVE_NEON -mimplicit-it=always
> -+CCASFLAGS = -mimplicit-it=always
> -+ifeq ($(USE_NEON), Yes)
> -+CCASFLAGS += -DHAVE_NEON
> -+endif
> - endif
> - EXEEXT = .exe
> -
> ---
> -2.34.1
> -
> diff --git 
> a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb 
> b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
> deleted file mode 100644
> index 6dfd759355..0000000000
> --- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -SUMMARY = "Open Source H.264 Codec"
> -DESCRIPTION = "OpenH264 is a codec library which supports H.264 
> encoding and \
> -decoding. It is suitable for use in real time applications such as 
> WebRTC."
> -HOMEPAGE = "<http://www.openh264.org/>"
> -SECTION = "libs/multimedia"
> -
> -DEPENDS:append:x86 = " nasm-native"
> -DEPENDS:append:x86-64 = " nasm-native"
> -
> -LICENSE = "BSD-2-Clause"
> -LICENSE_FLAGS = "commercial"
> -LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf" 
> <file://license;md5=bb6d3771da6a07d33fd50d4d9aa73bcf/>
> -
> -S = "${WORKDIR}/git"
> -SRCREV = "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"
> -BRANCH = "openh264v${PV}"
> -SRC_URI = 
> "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
> -           
> file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch 
> <file://0001-makefile-use-cp-options-to-preserve-file-mode.patch/> \
> -           
> file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch 
> <file://0002-makefile-add-possibility-to-disable-neon-extension.patch/> 
> \
> -           "
> -
> -COMPATIBLE_MACHINE:armv7a = "(.*)"
> -COMPATIBLE_MACHINE:aarch64 = "(.*)"
> -COMPATIBLE_MACHINE:x86 = "(.*)"
> -COMPATIBLE_MACHINE:x86-64 = "(.*)"
> -COMPATIBLE_MACHINE:mips = "(.*)"
> -COMPATIBLE_MACHINE:mips64 = "(.*)"
> -COMPATIBLE_MACHINE:powerpc64le = "null"
> -
> -EXTRA_OEMAKE:armv7a = "ARCH=arm"
> -EXTRA_OEMAKE:armv7ve = "ARCH=arm"
> -EXTRA_OEMAKE:aarch64 = "ARCH=arm64"
> -EXTRA_OEMAKE:x86 = "ARCH=i386"
> -EXTRA_OEMAKE:x86-64 = "ARCH=x86_64"
> -EXTRA_OEMAKE:mips = "ARCH=mips"
> -EXTRA_OEMAKE:mips64 = "ARCH=mips64"
> -EXTRA_OEMAKE:riscv64 = "ARCH=riscv64"
> -
> -EXTRA_OEMAKE:append:armv7a = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("TUNE_FEATURES","neon",""," 
> USE_NEON=No",d)}"
> -EXTRA_OEMAKE:append:armv7ve = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("TUNE_FEATURES","neon",""," 
> USE_NEON=No",d)}"
> -
> -EXTRA_OEMAKE:append = " ENABLEPIC=Yes"
> -do_configure() {
> -    :
> -}
> -
> -do_compile() {
> -    oe_runmake
> -}
> -
> -do_install() {
> -    oe_runmake install DESTDIR=${D} PREFIX=${prefix} 
> LIBDIR_NAME=${baselib} SHAREDLIB_DIR=${libdir}
> -}
> -
> -CLEANBROKEN = "1"
> diff --git 
> a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb 
> b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
> new file mode 100644
> index 0000000000..04e93ce790
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Open Source H.264 Codec"
> +DESCRIPTION = "OpenH264 is a codec library which supports H.264 
> encoding and \
> +decoding. It is suitable for use in real time applications such as 
> WebRTC."
> +HOMEPAGE = "<http://www.openh264.org/>"
> +SECTION = "libs/multimedia"
> +LICENSE = "BSD-2-Clause"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf" 
> <file://license;md5=bb6d3771da6a07d33fd50d4d9aa73bcf/>
> +
> +DEPENDS = " nasm-native"
> +
> +inherit meson pkgconfig
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0"
> +BRANCH = "openh264v${PV}"
> +SRC_URI = 
> "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH}"
> +
> +COMPATIBLE_MACHINE:powerpc64le = "null"
> +
> --
> 2.47.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114731): 
> <https://lists.openembedded.org/g/openembedded-devel/message/114731>
> Mute This Topic: <https://lists.openembedded.org/mt/110490016/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-xjKQVDvV3UHHoP5c9Xe9
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: also remove unneeded patches</div></div><div id="geary-quote" dir="auto"><br>On Wed, Jan 8 2025 at 02:30:21 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- switch to meson buildsystem

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 ...Use-cp-options-to-preserve-file-mode.patch |  32 ------
 ...ossibility-to-disable-NEON-extension.patch | 103 ------------------
 .../openh264/openh264_2.3.1.bb                |  55 ----------
 .../openh264/openh264_2.5.0.bb                |  20 ++++
 4 files changed, 20 insertions(+), 190 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
deleted file mode 100644
index 92f32948b2..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Use-cp-options-to-preserve-file-mode.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1c3bda45c55d2334af384caf9e7f240b7aaf2eb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Tue, 3 Mar 2020 22:28:25 -0800
-Subject: [PATCH] Makefile: Use cp options to preserve file mode
-
-This fixes packaging issues e.g.
-openh264: /usr/lib/libopenh264.so is owned by uid 1000, which is the same as the user running bitbake
-
-Upstream-Status: Submitted [<a href="https://github.com/cisco/openh264/pull/3245">https://github.com/cisco/openh264/pull/3245</a>]
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 74ff029d..ac643412 100644
---- a/Makefile
-+++ b/Makefile
-@@ -306,8 +306,8 @@ install-shared: $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) install-headers $
- 	mkdir -p $(DESTDIR)$(SHAREDLIB_DIR)
- 	install -m 755 $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXFULLVER) $(DESTDIR)$(SHAREDLIB_DIR)
- 	if [ "$(SHAREDLIBSUFFIXFULLVER)" != "$(SHAREDLIBSUFFIX)" ]; then \
--	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \
--	  cp -a $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \
-+	  cp -R --no-dereference --preserve=mode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER) $(DESTDIR)$(SHAREDLIB_DIR) ; \
-+	  cp -R --no-dereference --preserve=mode,links $(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIX) $(DESTDIR)$(SHAREDLIB_DIR) ; \
- 	fi
- 	mkdir -p $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
- 	install -m 644 $(PROJECT_NAME).pc $(DESTDIR)$(PREFIX)/$(LIBDIR_NAME)/pkgconfig
--- 
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
deleted file mode 100644
index 298ac1c013..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 2001
-From: Benjamin Bara &lt;<a href="mailto:benjamin.bara@skidata.com">benjamin.bara@skidata.com</a>&gt;
-Date: Thu, 31 Aug 2023 09:27:31 +0200
-Subject: [PATCH 2/2] Makefile: add possibility to disable NEON extension
-
-README states that the NEON extension is optional. However, currently it
-cannot be turned off, therefore add an option to disable it.
-
-Upstream-Status: Submitted [<a href="https://github.com/cisco/openh264/pull/3679">https://github.com/cisco/openh264/pull/3679</a>]
-Signed-off-by: Benjamin Bara &lt;<a href="mailto:benjamin.bara@skidata.com">benjamin.bara@skidata.com</a>&gt;
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
-@@ -35,6 +35,7 @@ CCASFLAGS=$(CFLAGS)
- STATIC_LDFLAGS=-lstdc++
- STRIP ?= strip
- USE_STACK_PROTECTOR = Yes
-+USE_NEON=Yes
- 
- SHAREDLIB_MAJORVERSION=7
- FULL_VERSION := 2.3.1
-diff --git a/build/arch.mk b/build/arch.mk
-index 4e1538c4..fd6a81e4 100644
---- a/build/arch.mk
-+++ b/build/arch.mk
-@@ -17,18 +17,22 @@ ifneq ($(filter-out arm64 arm64e, $(filter arm%, $(ARCH))),)
- ifeq ($(USE_ASM), Yes)
- ASM_ARCH = arm
- ASMFLAGS += -I$(SRC_PATH)codec/common/arm/
-+ifeq ($(USE_NEON), Yes)
- CFLAGS += -DHAVE_NEON
- endif
- endif
-+endif
- 
- #for arm64
- ifneq ($(filter arm64 aarch64 arm64e, $(ARCH)),)
- ifeq ($(USE_ASM), Yes)
- ASM_ARCH = arm64
- ASMFLAGS += -I$(SRC_PATH)codec/common/arm64/
-+ifeq ($(USE_NEON), Yes)
- CFLAGS += -DHAVE_NEON_AARCH64
- endif
- endif
-+endif
- 
- #for mips
- ifneq ($(filter mips mips64, $(ARCH)),)
-diff --git a/build/msvc-common.mk b/build/msvc-common.mk
-index 5891ea4e..5a1e2582 100644
---- a/build/msvc-common.mk
-+++ b/build/msvc-common.mk
-@@ -10,7 +10,10 @@ else
- endif
- ifeq ($(ASM_ARCH), arm)
- CCAS = gas-preprocessor.pl -as-type armasm -force-thumb -- armasm
--CCASFLAGS = -nologo -DHAVE_NEON -ignore 4509
-+CCASFLAGS = -nologo -ignore 4509
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS += -DHAVE_NEON
-+endif
- endif
- 
- CC=cl
-@@ -20,7 +23,10 @@ CXX_O=-Fo$@
- 
- ifeq ($(ASM_ARCH), arm64)
- CCAS = clang-cl
--CCASFLAGS = -nologo -DHAVE_NEON_AARCH64 --target=arm64-windows
-+CCASFLAGS = -nologo --target=arm64-windows
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS += -DHAVE_NEON_AARCH64
-+endif
- endif
- 
- 
-diff --git a/build/platform-mingw_nt.mk b/build/platform-mingw_nt.mk
-index b7a5495d..d73e362a 100644
---- a/build/platform-mingw_nt.mk
-+++ b/build/platform-mingw_nt.mk
-@@ -17,7 +17,10 @@ endif
- endif
- ifeq ($(ASM_ARCH), arm)
- CCAS = gas-preprocessor.pl -as-type clang -force-thumb -- $(CC)
--CCASFLAGS = -DHAVE_NEON -mimplicit-it=always
-+CCASFLAGS = -mimplicit-it=always
-+ifeq ($(USE_NEON), Yes)
-+CCASFLAGS += -DHAVE_NEON
-+endif
- endif
- EXEEXT = .exe
- 
--- 
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
deleted file mode 100644
index 6dfd759355..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Open Source H.264 Codec"
-DESCRIPTION = "OpenH264 is a codec library which supports H.264 encoding and \
-decoding. It is suitable for use in real time applications such as WebRTC."
-HOMEPAGE = "<a href="http://www.openh264.org/">http://www.openh264.org/</a>"
-SECTION = "libs/multimedia"
-
-DEPENDS:append:x86 = " nasm-native"
-DEPENDS:append:x86-64 = " nasm-native"
-
-LICENSE = "BSD-2-Clause"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf" "="">file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"</a>
-
-S = "${WORKDIR}/git"
-SRCREV = "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"
-BRANCH = "openh264v${PV}"
-SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
-           <a href="file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch">file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch</a> \
-           <a href="file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch">file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch</a> \
-           "
-
-COMPATIBLE_MACHINE:armv7a = "(.*)"
-COMPATIBLE_MACHINE:aarch64 = "(.*)"
-COMPATIBLE_MACHINE:x86 = "(.*)"
-COMPATIBLE_MACHINE:x86-64 = "(.*)"
-COMPATIBLE_MACHINE:mips = "(.*)"
-COMPATIBLE_MACHINE:mips64 = "(.*)"
-COMPATIBLE_MACHINE:powerpc64le = "null"
-
-EXTRA_OEMAKE:armv7a = "ARCH=arm"
-EXTRA_OEMAKE:armv7ve = "ARCH=arm"
-EXTRA_OEMAKE:aarch64 = "ARCH=arm64"
-EXTRA_OEMAKE:x86 = "ARCH=i386"
-EXTRA_OEMAKE:x86-64 = "ARCH=x86_64"
-EXTRA_OEMAKE:mips = "ARCH=mips"
-EXTRA_OEMAKE:mips64 = "ARCH=mips64"
-EXTRA_OEMAKE:riscv64 = "ARCH=riscv64"
-
-EXTRA_OEMAKE:append:armv7a = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("TUNE_FEATURES","neon",""," USE_NEON=No",d)}"
-EXTRA_OEMAKE:append:armv7ve = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("TUNE_FEATURES","neon",""," USE_NEON=No",d)}"
-
-EXTRA_OEMAKE:append = " ENABLEPIC=Yes"
-do_configure() {
-    :
-}
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIBDIR_NAME=${baselib} SHAREDLIB_DIR=${libdir}
-}
-
-CLEANBROKEN = "1"
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
new file mode 100644
index 0000000000..04e93ce790
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Open Source H.264 Codec"
+DESCRIPTION = "OpenH264 is a codec library which supports H.264 encoding and \
+decoding. It is suitable for use in real time applications such as WebRTC."
+HOMEPAGE = "<a href="http://www.openh264.org/">http://www.openh264.org/</a>"
+SECTION = "libs/multimedia"
+LICENSE = "BSD-2-Clause"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf" "="">file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"</a>
+
+DEPENDS = " nasm-native"
+
+inherit meson pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0"
+BRANCH = "openh264v${PV}"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH}"
+
+COMPATIBLE_MACHINE:powerpc64le = "null"
+
<div>-- 
</div>2.47.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#114731): <a href="https://lists.openembedded.org/g/openembedded-devel/message/114731">https://lists.openembedded.org/g/openembedded-devel/message/114731</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/110490016/3618223">https://lists.openembedded.org/mt/110490016/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-xjKQVDvV3UHHoP5c9Xe9--


