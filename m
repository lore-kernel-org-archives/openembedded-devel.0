Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.307.1617140529113189378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RshMV4WU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id g10so6845568plt.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 14:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eSAlwAnIBUVMDX0xX/G6IiYmlJak+iLBvH/DAG31kYE=;
        b=RshMV4WUUcXpiwEbW/3od0lRg5nI5oMMSDzz/leELam/JPgxQlUDIc8Cv2xdL1QXAW
         ydB35WYZm0H/9hYhKGz7/LoWY96/3fm/0L/RNQSqLVk3Fa5OcI68rkxF2FsE+SwSUSrA
         FSxK2DlVT3JhxhdqGMpRj2pJbA6Eqo86bHDA1wfZaSH4Q4pGAn5Vc+RE8DyyshlGanDA
         LLmLNZAFpT6DNZUqwhUHLKdw6KtCaoOjcEFnGg7sfTt+BxLG4pI1C3Bw4p2egz6XWSy3
         Y5lBs67pD0ENddZ+KF162E+ac3qdpdMj0VWKXsO1zGeX5q18SWNv5ccsGn06IpIlUAP/
         jvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eSAlwAnIBUVMDX0xX/G6IiYmlJak+iLBvH/DAG31kYE=;
        b=kXMntS5O582ix+VCNndZVBlsXDmfaCataC1keGJP5BzIjJb3g/EjyjwHmdedmdtvKk
         +GLTCoAJD3uOpA9uSrJ5OZils/caj4p/o//AnKhGMznkC+DEQAzoegKukWPS+CBf6Mv8
         DCpeEud8JaiOsRaM7OQsIu2MDCFucTHhuq5WawY3X1pNG2239qFV9KjOUQG/xyt7Biel
         waTGBszbx7gDRi5CY8KSB29uordXexkLbEbcK/HNcfZz0m7Cgh7okcI9E0DcsLIQ+ywi
         w1oQXyOI+iGqLy3ps83+AtLLnmGduZVV/O8ErsGM7AfF9QucdpgGdsQ26zzMwaenbk1w
         ROUg==
X-Gm-Message-State: AOAM533rrZE93oarhnRsS0Wtuo2nE9j8/C+2zo38Vk2bDhgr5OHlqSC9
	lWWtO8ymhNf0xNnoFalLbJRb0WUIRFtUTQ==
X-Google-Smtp-Source: ABdhPJziSJE/3YS5zBuR2y/z9yzQugCh0tasdV56LT5bXbd8q/+ISgRYLq0rRHSZL4aEZtjhlHotTw==
X-Received: by 2002:a17:902:fe88:b029:e7:1edf:84cb with SMTP id x8-20020a170902fe88b02900e71edf84cbmr330850plm.62.1617140527923;
        Tue, 30 Mar 2021 14:42:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d828:cc50:358c:26a2? ([2601:646:9200:a0f0:d828:cc50:358c:26a2])
        by smtp.gmail.com with ESMTPSA id u4sm3013pfk.131.2021.03.30.14.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 14:42:07 -0700 (PDT)
Subject: Re: [oe] [PATCH] flashrom: recipe cleanup
To: Ross Burton <ross@burtonini.com>,
 openembedded-devel@lists.openembedded.org
References: <20210330171437.2556065-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e6d8ee55-8879-3477-1927-dfa662a19616@gmail.com>
Date: Tue, 30 Mar 2021 14:42:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330171437.2556065-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/30/21 10:14 AM, Ross Burton wrote:
> Use Meson to build instead of the bare Makefiles, as the Meson build also
> generates pkgconfig files which are needed fwupd.
> 
> Add PACKAGECONFIG options for the platform dependencies (libpci, libusb,
> libftdi).  Add a patch to the meson.build to ensure that these options
> work as intended.
> 
> Fix LICENSE, as this is GPLv2-or-later.
> 
> Replace 0001-typecast-enum-conversions-explicitly.patch with upstreamed
> patch.
> 
> Drop 0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch as
> this is only needed for the Makefile build.
> 

interestingly it starts to fail for rv32/rv64 [1] [2]

../flashrom-v1.2/hwaccess.h:300:2: error: #error Unknown architecture, 
please check if it supports PCI port IO.
   300 | #error Unknown architecture, please check if it supports PCI 
port IO.
       |  ^~~~~

I will also take a look at what changed and perhaps disabling rv32/rv64 
targets is ok here.

[1] https://errors.yoctoproject.org/Errors/Details/575212/
[2] https://errors.yoctoproject.org/Errors/Details/575213/

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   ...or-last-line-only-from-preprocessed-.patch | 57 ----------------
>   ...typecast-enum-conversions-explicitly.patch | 66 ++++++------------
>   .../flashrom/flashrom/meson-fixes.patch       | 68 +++++++++++++++++++
>   meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  | 15 ++--
>   4 files changed, 96 insertions(+), 110 deletions(-)
>   delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
>   create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
> 
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
> deleted file mode 100644
> index 7a8be83746..0000000000
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 3c078497e506bd6acb406da5cde7ce20e8896353 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 23 Jul 2020 14:13:59 -0700
> -Subject: [PATCH] Makefile: Check for last line only from preprocessed output
> -
> -This started to fail with glibc 2.32 since glibc added additional
> -attributes to functions in signal.h therefore existing regexp started to
> -fail as it is not able to handle these functions e.g.
> -
> -extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ , __leaf__))
> -  __attribute__ ((__deprecated__ ("Use sigaction with SA_RESTART instead")));
> -
> -grep -v '^\#' | grep '"' | cut -f 2 -d'"'
> -bit outside of fd_set selected
> -Use sigaction with SA_RESTART instead
> -arm
> -
> -So changing it to
> -tail -1 | grep '"' | cut -f 2 -d'"'
> -arm
> -
> -Produces the expected result, this was hidden until now
> -
> -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/43770]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Change-Id: I123a046e142d54632f12d54e2aa09b0928c02b91
> ----
> - Makefile | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 803529f..3795681 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -106,7 +106,7 @@ endif
> - # IMPORTANT: The following line must be placed before TARGET_OS is ever used
> - # (of course), but should come after any lines setting CC because the line
> - # below uses CC itself.
> --override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
> -+override TARGET_OS := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E os.h 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
> -
> - ifeq ($(TARGET_OS), Darwin)
> - override CPPFLAGS += -I/opt/local/include -I/usr/local/include
> -@@ -460,8 +460,8 @@ endif
> - # IMPORTANT: The following line must be placed before ARCH is ever used
> - # (of course), but should come after any lines setting CC because the line
> - # below uses CC itself.
> --override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
> --override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | grep -v '^\#'))
> -+override ARCH := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E archtest.c 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
> -+override ENDIAN := $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E endiantest.c 2>/dev/null | tail -1))
> -
> - # Disable the internal programmer on unsupported architectures (everything but x86 and mipsel)
> - ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
> ---
> -2.27.0
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
> index 7ac53650f2..f2302dbcc3 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
> @@ -1,69 +1,45 @@
> -From 8a236330f2af56bde21e9f69208ea3e59f529f0c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 15 Mar 2020 17:02:30 -0700
> -Subject: [PATCH] typecast enum conversions explicitly
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
>   
> -clang complains like below
> +From 3a0c1966e4c66f91e6e8551e906b6db38002acb4 Mon Sep 17 00:00:00 2001
> +From: Angel Pons <th3fanbus@gmail.com>
> +Date: Wed, 27 May 2020 12:15:51 +0200
> +Subject: [PATCH] libflashrom.c: Use casts on enum conversions
>   
> -libflashrom.c:191:43: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> -                        supported_boards[i].working = binfo[i].working;
> -                                                    ~ ~~~~~~~~~^~~~~~~
> -libflashrom.c:229:46: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
> -                        supported_chipsets[i].status = chipset[i].status;
> -                                                     ~ ~~~~~~~~~~~^~~~~~
> +This allows flashrom to build with GCC 10.
>   
> -However these enums are exactly same so they can be typecasted
> -
> -libflashrom.h
> -
> -/** @ingroup flashrom-query */
> -enum flashrom_test_state {
> -        FLASHROM_TESTED_OK  = 0,
> -        FLASHROM_TESTED_NT  = 1,
> -        FLASHROM_TESTED_BAD = 2,
> -        FLASHROM_TESTED_DEP = 3,
> -        FLASHROM_TESTED_NA  = 4,
> -};
> -
> -flash.h
> -
> -enum test_state {
> -          OK = 0,
> -          NT = 1, /* Not tested */
> -          BAD,    /* Known to not work */
> -          DEP,    /* Support depends on configuration (e.g. Intel flash descriptor) */
> -          NA,     /* Not applicable (e.g. write support on ROM chips) */
> -  };
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Change-Id: I2166cdf3681452631ef8e980face2924e9a6c81a
> +Signed-off-by: Angel Pons <th3fanbus@gmail.com>
> +Reviewed-on: https://review.coreboot.org/c/flashrom/+/41775
> +Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
> +Reviewed-by: HAOUAS Elyes <ehaouas@noos.fr>
>   ---
> - libflashrom.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + libflashrom.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
>   
>   diff --git a/libflashrom.c b/libflashrom.c
> -index 0dec22e..7956685 100644
> +index ab7e364..c20d9c7 100644
>   --- a/libflashrom.c
>   +++ b/libflashrom.c
> -@@ -188,7 +188,7 @@ struct flashrom_board_info *flashrom_supported_boards(void)
> +@@ -188,7 +188,8 @@ struct flashrom_board_info *flashrom_supported_boards(void)
>    		for (; i < boards_known_size; ++i) {
>    			supported_boards[i].vendor = binfo[i].vendor;
>    			supported_boards[i].name = binfo[i].name;
>   -			supported_boards[i].working = binfo[i].working;
> -+			supported_boards[i].working = (enum flashrom_test_state)binfo[i].working;
> ++			supported_boards[i].working =
> ++				(enum flashrom_test_state) binfo[i].working;
>    		}
>    	} else {
>    		msg_gerr("Memory allocation error!\n");
> -@@ -226,7 +226,7 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
> +@@ -226,7 +227,8 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
>    			supported_chipsets[i].chipset = chipset[i].device_name;
>    			supported_chipsets[i].vendor_id = chipset[i].vendor_id;
>    			supported_chipsets[i].chipset_id = chipset[i].device_id;
>   -			supported_chipsets[i].status = chipset[i].status;
> -+			supported_chipsets[i].status = (enum flashrom_test_state)chipset[i].status;
> ++			supported_chipsets[i].status =
> ++				(enum flashrom_test_state) chipset[i].status;
>    	  }
>    	} else {
>    		msg_gerr("Memory allocation error!\n");
>   --
>   2.25.1
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
> new file mode 100644
> index 0000000000..e45236ee07
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
> @@ -0,0 +1,68 @@
> +Add a ftdi option alongside USB and PCI to control the external dependency, and
> +ensure that the build is successful in all combinations of options.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/meson.build b/meson.build
> +index 375089c..0df9d69 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -91,6 +91,8 @@ else
> +   config_digilent_spi = false
> +   config_developerbox_spi = false
> +   config_pickit2_spi = false
> ++  config_stlinkv3_spi = false
> ++  config_usbblaster_spi = false
> + endif
> +
> + # some programmers require libpci
> +@@ -118,6 +120,21 @@ else
> +   config_satasii = false
> + endif
> +
> ++# some programmers require libftdi
> ++if get_option('ftdi')
> ++  deps += dependency('libftdi1')
> ++else
> ++  config_ft2232_spi = false
> ++  config_usbblaster_spi = false
> ++endif
> ++
> ++if not (target_machine.cpu_family() == 'x86' or target_machine.cpu_family() == 'x86_64')
> ++  config_satamv = false
> ++  config_nic3com = false
> ++  config_rayer_spi = false
> ++  config_nicrealtek = false
> ++endif
> ++
> + # set defines for configured programmers
> + if config_atahpt
> +   srcs += 'atahpt.c'
> +@@ -163,7 +180,6 @@ endif
> + if config_ft2232_spi
> +   srcs += 'ft2232_spi.c'
> +   cargs += '-DCONFIG_FT2232_SPI=1'
> +-  deps += dependency('libftdi1')
> +   cargs += '-DHAVE_FT232H=1'
> + endif
> + if config_gfxnvidia
> +@@ -216,6 +232,7 @@ endif
> + if config_nicintel
> +   srcs += 'nicintel.c'
> +   cargs += '-DCONFIG_NICINTEL=1'
> ++  need_raw_access = true
> + endif
> + if config_nicintel_eeprom
> +   srcs += 'nicintel_eeprom.c'
> +diff --git a/meson_options.txt b/meson_options.txt
> +index ea87311..b6b842d 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -1,5 +1,6 @@
> + option('pciutils', type : 'boolean', value : true, description : 'use pciutils')
> + option('usb', type : 'boolean', value : true, description : 'use libusb1')
> ++option('ftdi', type : 'boolean', value : true, description : 'use libftdi')
> +
> + option('config_atahpt', type : 'boolean', value : false, description : 'Highpoint (HPT) ATA/RAID controllers')
> + option('config_atapromise', type : 'boolean', value : false, description : 'Promise ATA controller')
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> index 66ae34af94..4e0b2d4a8c 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
> @@ -1,21 +1,20 @@
>   DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2+"
>   HOMEPAGE = "http://flashrom.org"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -DEPENDS = "pciutils libusb libusb-compat"
> -
>   SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
>              file://0001-typecast-enum-conversions-explicitly.patch \
> -           file://0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch \
> +           file://meson-fixes.patch \
>              "
>   SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
>   SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
>   
>   S = "${WORKDIR}/flashrom-v${PV}"
>   
> -inherit pkgconfig
> +inherit meson pkgconfig
>   
> -do_install() {
> -    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> -}
> +PACKAGECONFIG ??= "pci usb ftdi"
> +PACKAGECONFIG[pci] = "-Dpciutils=true,-Dpciutils=false,pciutils"
> +PACKAGECONFIG[usb] = "-Dusb=true,-Dusb=false,libusb"
> +PACKAGECONFIG[ftdi] = "-Dftdi=true,-Dftdi=false,libftdi"
> 
> 
> 
> 
> 
