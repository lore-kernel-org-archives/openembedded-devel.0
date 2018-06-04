Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 04A8B71A60
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:00:06 +0000 (UTC)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 027B620891
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1528099208;
	bh=SakqKoj0/yjccttK4ScY2SDv3PhwFauuGUXbDsiNenU=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=iiVS8JkRMK52rr4Ktypc1I/HNOuRP80ViheYQpXrxAYT7aDBD0DZ2EI+P1wsfkDDz
	HfO1YlCt0/5CorS8yGFzCeUWrTWLz3o4h/H/pjJ7UjQWERhXw1jV0DZFZbmK9QV6Ej
	E628Ge+AllOwP1jaH0Opf8x9cfnB4n5ASX954R8M=
Received: by mail-wr0-f179.google.com with SMTP id y15-v6so42126531wrg.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 01:00:07 -0700 (PDT)
X-Gm-Message-State: ALKqPwf5uWQKlYXOfRBRbxAVl8KB4/EukqomL8sEP6GeIFxhyR3NXl2x
	t3k6UpSNhHC0wQWONOOsd+TZMSPGPUeWyhovG0Y=
X-Google-Smtp-Source: ADUXVKIC9JVr5MJaN76aKAdL6HPj0Xk/pxlOJDjSqKejVhYRy6afp2igjGWbc/H+g679aZGo8r4hkC6JlfvmE5/sxcw=
X-Received: by 2002:adf:9dc9:: with SMTP id
	q9-v6mr15937532wre.12.1528099206454; 
	Mon, 04 Jun 2018 01:00:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9166:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 01:00:05 -0700 (PDT)
In-Reply-To: <f037c80f-2b51-48a8-9846-1ef1c8217396@gmail.com>
References: <1527854794-22548-1-git-send-email-krzk@kernel.org>
	<f037c80f-2b51-48a8-9846-1ef1c8217396@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 4 Jun 2018 10:00:05 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeRZ1XwhXR4pUJ0SXNQWt6gxVgAbKPxPpN0HU=epvVxqw@mail.gmail.com>
Message-ID: <CAJKOXPeRZ1XwhXR4pUJ0SXNQWt6gxVgAbKPxPpN0HU=epvVxqw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 04 Jun 2018 08:00:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 6:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Krzysztof
>
> On 6/1/18 5:06 AM, Krzysztof Kozlowski wrote:
>> Add new recipe for lshw B.02.18 version - a small tool to provide
>> detailed information on the hardware configuration of the machine.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> ---
>>
>> The recipe is based on existing meta-linaro:
>> https://layers.openembedded.org/layerindex/recipe/5446/
>>
>> with changes:
>> 1. Bump to 02.18,
>> 2. Fix QA issue with GNU_HASH,
>> 3. Minor recipe styling fixes.
>> ---
>>  ...e-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch | 33 ++++++++++++++++++
>>  .../lshw/files/cross-compile.patch                 | 39 ++++++++++++++++++++++
>>  meta-oe/recipes-devtools/lshw/lshw_02.18.bb        | 37 ++++++++++++++++++++
>>  3 files changed, 109 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
>>  create mode 100644 meta-oe/recipes-devtools/lshw/files/cross-compile.patch
>>  create mode 100644 meta-oe/recipes-devtools/lshw/lshw_02.18.bb
>>
>> diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
>> new file mode 100644
>> index 000000000000..627619fd137f
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
>> @@ -0,0 +1,33 @@
>> +From 2f69ba75608619ba7fc962b1a0338682b644a406 Mon Sep 17 00:00:00 2001
>> +From: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
>> +Date: Thu, 31 May 2018 16:22:23 +0200
>> +Subject: [PATCH] Makefile: Use supplied LDFLAGS to silence OE GNU_HASH QA
>> + warning
>> +
>> +Fix OpenEmbedded/Yocto QA warning:
>> +
>> +    ERROR: lshw-02.16-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: 'build/tmp/work/cortexa5hf-neon-poky-linux-gnueabi/lshw/02.16-r1/packages-split/lshw/usr/sbin/lshw' [ldflags]
>> +    ERROR: lshw-02.16-r1 do_package_qa: QA run found fatal errors. Please consider fixing them.
>> +    ERROR: lshw-02.16-r1 do_package_qa: Function failed: do_package_qa
>> +
>> +Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@proceq.com>
>> +---
>> + src/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/Makefile b/src/Makefile
>> +index f474ff9d56b3..dd7a2a400be2 100644
>> +--- a/src/Makefile
>> ++++ b/src/Makefile
>> +@@ -25,7 +25,7 @@ CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
>> + ifeq ($(SQLITE), 1)
>> +     CXXFLAGS+= -DSQLITE $(shell pkg-config --cflags sqlite3)
>> + endif
>> +-LDFLAGS=-L./core/ -g
>> ++LDFLAGS+=-L./core/ -g
>> + ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
>> +     LDFLAGS+= -Wl,--as-needed
>> + endif
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/lshw/files/cross-compile.patch b/meta-oe/recipes-devtools/lshw/files/cross-compile.patch
>> new file mode 100644
>> index 000000000000..221b7e538c00
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/lshw/files/cross-compile.patch
>> @@ -0,0 +1,39 @@
>> +---
>> + src/Makefile      |    2 +-
>> + src/core/Makefile |    2 +-
>> + src/gui/Makefile  |    4 ++--
>> + 3 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +--- a/src/Makefile
>> ++++ b/src/Makefile
>> +@@ -18,7 +18,7 @@ export MANDIR
>> + export DATADIR
>> + export SQLITE
>> +
>> +-CXX?=c++
>> ++CXX?=$(CROSS_COMPILE)c++
>> + INCLUDES=-I./core/
>> + DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
>> + CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
>> +--- a/src/core/Makefile
>> ++++ b/src/core/Makefile
>> +@@ -1,6 +1,6 @@
>> + PACKAGENAME?=lshw
>> +
>> +-CXX=c++
>> ++CXX?=$(CROSS_COMPILE)c++
>> + INCLUDES=
>> + DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
>> + CXXFLAGS?=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
>> +--- a/src/gui/Makefile
>> ++++ b/src/gui/Makefile
>> +@@ -1,7 +1,7 @@
>> + PACKAGENAME?=lshw
>> +
>> +-CXX?=c++
>> +-CC?=cc
>> ++CXX?=$(CROSS_COMPILE)c++
>> ++CC?=$(CROSS_COMPILE)cc
>> + STRIP?=strip
>> + OBJCOPY?=objcopy
>> +
>> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
>> new file mode 100644
>> index 000000000000..aac6707fcea4
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
>> @@ -0,0 +1,37 @@
>> +DESCRIPTION = "A small tool to provide detailed information on the hardware \
>> +configuration of the machine. It can report exact memory configuration, \
>> +firmware version, mainboard configuration, CPU version and speed, cache \
>> +configuration, bus speed, etc. on DMI-capable or EFI systems."
>> +SUMMARY = "Hardware lister"
>> +HOMEPAGE = "http://ezix.org/project/wiki/HardwareLiSter"
>> +SECTION = "console/tools"
>> +
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +DEPENDS = " \
>> +    pciutils \
>> +    usbutils \
>> +"
>> +COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>> +
>> +SRC_URI = " \
>> +    http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
>> +    file://cross-compile.patch \
>> +    file://0001-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch \
>> +"
>> +SRC_URI[md5sum] = "8671c6d94d6324a744b7f21f1bfecfd2"
>> +SRC_URI[sha256sum] = "ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f"
>> +
>> +S = "${WORKDIR}/lshw-B.${PV}"
>> +
>> +do_compile() {
>> +    # build core only - don't ship gui
>> +    oe_runmake -C src core
>> +}
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=${D}
>> +    # data files provided by dependencies
>> +    rm -rf ${D}/usr/share/lshw
>
> who should be providing these files ?
> should these packages be in rrecommends for this to work effectively ?

Thanks for catching this. They were indeed missing in the image. I can
add all of them as RDEPENDS or maybe as PACKAGECONFIG and then
customize the install with check for respective dependencies. I think
I will go with the second as it gives greater flexibility.

Best regards,
Krzysztof

