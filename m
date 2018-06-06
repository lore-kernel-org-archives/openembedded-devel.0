Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id A10377554F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 01:17:05 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id g14-v6so2923995qkm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 18:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ptAo7B5Nr2qWUc+ofnFRvFp9Rudp7Fk6B4Hm+U+OjMw=;
	b=dd2TWk99nA8BXR6yiKhodHN6W31iykJq9X8WxFYu4qn72qKs7x0lUWxKEsB5p4sMA8
	Uavi2XDHJqQTvZyXGCLmhp/MxTOB30ZerKCQlXrBr5KxrUzBtczmeyDnPuSRcQPofas6
	ybhbHw14yM7P6l/RIT3H2Gv/1GnHQtHMNcHFaootLUuy/VzDvpOYXYuoD1v19eIXAsXn
	Yd81l3OJtoooIpjaEAyF/brxRB3RlwQ2tO8r6s4Ge3wKhxhDXsEwCizneEWv1yovwQSe
	ATeBDgb1Qwz+mdaKHNI3cPEv4MF8pvyj6Nl7RKGaPyQKDthVT8alVtuC1DjE/M+RgKnb
	OsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ptAo7B5Nr2qWUc+ofnFRvFp9Rudp7Fk6B4Hm+U+OjMw=;
	b=FxZW5dZ6O+9MiF5oR3dEwLr3f9vMx4QfX65/eLrDreFwnTQb5KGOjXXeOYAgYuvt2Q
	INgG4x/MjYvGvMFvIzJtmZGaBTpnO15rpB0/8vXZxR0OR1XKE0kZaNr4kbiTpREV/TY+
	aiv46UBmWazSPQ0bU/OueB3Nj6JFPJMueZQfx2HCIzQBjchoe/xBqnibFQ/+eqTPlwOR
	En8G85F7U6H+MRLyPot+CJvvsFIyzt+8w/aH3VV4kOOnMSpRsGHAn+noc8gCS5RCjZhS
	9mc+QeU89PgOYJTGtLUtSncTznJQC1475hyqmarhr5ahKxGR1YRphvqakfCz5Kkd6Vj3
	74CQ==
X-Gm-Message-State: APt69E3lPi6REcDsy9n7eTZS5+AsEJxB88DfGK7XMOpgJSjlTFdkuGz1
	kUjSBFRSKh5S9os+rdrzTRxd22pJ45r89JMDbDo=
X-Google-Smtp-Source: ADUXVKKTQSkwuMmFT1XVs121tcgy/SEvBUhcJFgoPsXVpV333Mhxn0nH/962H8yus/RZvsD4LUKZ0aPiu9i07MBw6X0=
X-Received: by 2002:a37:b8c4:: with SMTP id
	i187-v6mr870356qkf.412.1528247826201; 
	Tue, 05 Jun 2018 18:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:946b:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 18:16:32 -0700 (PDT)
In-Reply-To: <1528107496-14737-1-git-send-email-krzk@kernel.org>
References: <1528107496-14737-1-git-send-email-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2018 18:16:32 -0700
Message-ID: <CAMKF1spWoahwg8+kiEdYQ086q651=+67DCb9Cwx7gkjuwjcBug@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] lshw: Add new recipe with B.02.18 version
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
X-List-Received-Date: Wed, 06 Jun 2018 01:17:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof

This fails on musl due to basename() API not being available
you might want to fix it on the same lines as

http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/poppler/poppler/basename-include.patch

| make[1]: *** [Makefile:20: dasd.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| sysfs.cc: In function 'std::__cxx11::string sysfs_getbustype(const string&)':
| sysfs.cc:102:21: error: 'basename' was not declared in this scope
|        "/devices/" + basename(path.c_str());
|                      ^~~~~~~~
| sysfs.cc:102:21: note: suggested alternative: 'rename'
|        "/devices/" + basename(path.c_str());
|                      ^~~~~~~~
|                      rename
| sysfs.cc: In function 'std::__cxx11::string sysfstobusinfo(const string&)':
| sysfs.cc:142:19: error: 'basename' was not declared in this scope
|      string name = basename(path.c_str());
|                    ^~~~~~~~
| sysfs.cc:142:19: note: suggested alternative: 'rename'
|      string name = basename(path.c_str());
|                    ^~~~~~~~
|                    rename
| sysfs.cc: In member function 'std::__cxx11::string
sysfs::entry::driver() const':
| sysfs.cc:210:10: error: 'basename' was not declared in this scope
|    return basename(readlink(driverlink).c_str());
|           ^~~~~~~~
| sysfs.cc:210:10: note: suggested alternative: 'rename'
|    return basename(readlink(driverlink).c_str());
|           ^~~~~~~~
|           rename
| sysfs.cc: In member function 'std::__cxx11::string
sysfs::entry::name() const':
| sysfs.cc:291:10: error: 'basename' was not declared in this scope
|    return basename(This->devpath.c_str());
|           ^~~~~~~~
| sysfs.cc:291:10: note: suggested alternative: 'rename'
|    return basename(This->devpath.c_str());
|           ^~~~~~~~
|           rename
| make[1]: *** [Makefile:20: sysfs.o] Error 1
| make[1]: Leaving directory
'/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/lshw/02.18-r0/lshw-B.02.18/src/core'

On Mon, Jun 4, 2018 at 3:18 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Add new recipe for lshw B.02.18 version - a small tool to provide
> detailed information on the hardware configuration of the machine.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Drop dependency on pciutils and usbutils and use pci.ids and usb.ids
>    bundled with lshw.  Recent usbutils do not provide usb.ids (moved to
>    udev-hwdb).
>    pciutils do provide pci.ids... but in gzipped form which is not yet
>    supported by lshw (next release should support it).
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
>  meta-oe/recipes-devtools/lshw/lshw_02.18.bb        | 31 +++++++++++++++++
>  3 files changed, 103 insertions(+)
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
> index 000000000000..2565ccfffe71
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
> @@ -0,0 +1,31 @@
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
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

