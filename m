Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id B485C60107
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 12:30:57 +0000 (UTC)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8EE7B20880
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1527856258;
	bh=MYJtV3lXOiraiPqt5J+tv7aKjH0x/NjfYfScpqyJldQ=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=egcXN/ggE37dlv3ZblCkGroFsbZC8196EW3/pa1uRFrThkmW2u0YzXOLNaNNbek11
	AlpvmqtrSx4N+rvwwBbL/JOQOtpw7SP4U44DMfnvziK5pS4ro93Irv7qqBukB1eqRN
	B4uujtzazdjmgj5TDn9JMWPLBe4jfDYwXRjMf+Lg=
Received: by mail-wm0-f48.google.com with SMTP id o13-v6so2716856wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 05:30:58 -0700 (PDT)
X-Gm-Message-State: ALKqPwc5CHUsVIHoh387RJThnGA83Ihw8g3qyvTXqQr3yrRt68TcPNW/
	Qrd+HLQGBovIICw2TD0wS/EgpwSAeetDl7Gjjm4=
X-Google-Smtp-Source: ADUXVKLrtfJuRTgIiEUVxv4AAxRY0xSuwo1Y2w+MOs40JV3TLUksK33WBL4hb4WJtwfwl3f7mLKcexYjYfcaIyx3fP8=
X-Received: by 2002:a1c:ce:: with SMTP id 197-v6mr2441097wma.118.1527856257002;
	Fri, 01 Jun 2018 05:30:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9166:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 05:30:56 -0700 (PDT)
In-Reply-To: <1527854794-22548-1-git-send-email-krzk@kernel.org>
References: <1527854794-22548-1-git-send-email-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 1 Jun 2018 14:30:56 +0200
X-Gmail-Original-Message-ID: <CAJKOXPerRse8cMHas3qco+xCZtWinOgMux-UfaQmHucFUoto3Q@mail.gmail.com>
Message-ID: <CAJKOXPerRse8cMHas3qco+xCZtWinOgMux-UfaQmHucFUoto3Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lshw: Add new recipe with B.02.18 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 12:30:57 -0000
Content-Type: text/plain; charset="UTF-8"

+Cc: Fathi Boudra <fathi.boudra@linaro.org>

On Fri, Jun 1, 2018 at 2:06 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Add new recipe for lshw B.02.18 version - a small tool to provide
> detailed information on the hardware configuration of the machine.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> The recipe is based on existing meta-linaro:
> https://layers.openembedded.org/layerindex/recipe/5446/
>
> with changes:
> 1. Bump to 02.18,
> 2. Fix QA issue with GNU_HASH,
> 3. Minor recipe styling fixes.
> ---
>  ...e-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch | 33 ++++++++++++++++++
>  .../lshw/files/cross-compile.patch                 | 39 ++++++++++++++++++++++
>  meta-oe/recipes-devtools/lshw/lshw_02.18.bb        | 37 ++++++++++++++++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
>  create mode 100644 meta-oe/recipes-devtools/lshw/files/cross-compile.patch
>  create mode 100644 meta-oe/recipes-devtools/lshw/lshw_02.18.bb
>
> diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
> new file mode 100644
> index 000000000000..627619fd137f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
> @@ -0,0 +1,33 @@
> +From 2f69ba75608619ba7fc962b1a0338682b644a406 Mon Sep 17 00:00:00 2001
> +From: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
> +Date: Thu, 31 May 2018 16:22:23 +0200
> +Subject: [PATCH] Makefile: Use supplied LDFLAGS to silence OE GNU_HASH QA
> + warning
> +
> +Fix OpenEmbedded/Yocto QA warning:
> +
> +    ERROR: lshw-02.16-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: 'build/tmp/work/cortexa5hf-neon-poky-linux-gnueabi/lshw/02.16-r1/packages-split/lshw/usr/sbin/lshw' [ldflags]
> +    ERROR: lshw-02.16-r1 do_package_qa: QA run found fatal errors. Please consider fixing them.
> +    ERROR: lshw-02.16-r1 do_package_qa: Function failed: do_package_qa
> +
> +Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index f474ff9d56b3..dd7a2a400be2 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -25,7 +25,7 @@ CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
> + ifeq ($(SQLITE), 1)
> +       CXXFLAGS+= -DSQLITE $(shell pkg-config --cflags sqlite3)
> + endif
> +-LDFLAGS=-L./core/ -g
> ++LDFLAGS+=-L./core/ -g
> + ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
> +       LDFLAGS+= -Wl,--as-needed
> + endif
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/lshw/files/cross-compile.patch b/meta-oe/recipes-devtools/lshw/files/cross-compile.patch
> new file mode 100644
> index 000000000000..221b7e538c00
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/files/cross-compile.patch
> @@ -0,0 +1,39 @@
> +---
> + src/Makefile      |    2 +-
> + src/core/Makefile |    2 +-
> + src/gui/Makefile  |    4 ++--
> + 3 files changed, 4 insertions(+), 4 deletions(-)
> +
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -18,7 +18,7 @@ export MANDIR
> + export DATADIR
> + export SQLITE
> +
> +-CXX?=c++
> ++CXX?=$(CROSS_COMPILE)c++
> + INCLUDES=-I./core/
> + DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
> + CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
> +--- a/src/core/Makefile
> ++++ b/src/core/Makefile
> +@@ -1,6 +1,6 @@
> + PACKAGENAME?=lshw
> +
> +-CXX=c++
> ++CXX?=$(CROSS_COMPILE)c++
> + INCLUDES=
> + DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
> + CXXFLAGS?=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
> +--- a/src/gui/Makefile
> ++++ b/src/gui/Makefile
> +@@ -1,7 +1,7 @@
> + PACKAGENAME?=lshw
> +
> +-CXX?=c++
> +-CC?=cc
> ++CXX?=$(CROSS_COMPILE)c++
> ++CC?=$(CROSS_COMPILE)cc
> + STRIP?=strip
> + OBJCOPY?=objcopy
> +
> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
> new file mode 100644
> index 000000000000..aac6707fcea4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "A small tool to provide detailed information on the hardware \
> +configuration of the machine. It can report exact memory configuration, \
> +firmware version, mainboard configuration, CPU version and speed, cache \
> +configuration, bus speed, etc. on DMI-capable or EFI systems."
> +SUMMARY = "Hardware lister"
> +HOMEPAGE = "http://ezix.org/project/wiki/HardwareLiSter"
> +SECTION = "console/tools"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = " \
> +    pciutils \
> +    usbutils \
> +"
> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
> +
> +SRC_URI = " \
> +    http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
> +    file://cross-compile.patch \
> +    file://0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch \
> +"
> +SRC_URI[md5sum] = "8671c6d94d6324a744b7f21f1bfecfd2"
> +SRC_URI[sha256sum] = "ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f"
> +
> +S = "${WORKDIR}/lshw-B.${PV}"
> +
> +do_compile() {
> +    # build core only - don't ship gui
> +    oe_runmake -C src core
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D}
> +    # data files provided by dependencies
> +    rm -rf ${D}/usr/share/lshw
> +}
> --
> 2.7.4
>

