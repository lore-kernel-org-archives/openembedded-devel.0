Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9741C6E687
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:37:22 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id i129so91138141vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 10:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=/oEqh8EVY4o3meLGDcb2zhFgWrIfUPEh8e77kQC6Sfg=;
	b=eSxoYl3OVzJZTeUlgJZjJiXngSmrs5VvZixUSeZC2orJzeqh4tJA8hsq7W2Iz3hKhq
	Oeci+JrEKrIMIyLUMDyl2qbx9+ure/WTpEOcAzdLy8KLh4vZ91sPjrqCUzDyqsHNaJ0C
	X7I8s/luOdREKsw6C1tgb8UFGf7AEs+StZXkElx6mHn4XDgHpMFHiJ53bdjMRDmvRUk+
	vZNHOe+F9KUNfbBRKNypmmN5giIZpR8HBVViYhlUiEbRxv+C1rUMD+bxub9gd8gRcq5U
	DoUZLir+TVa36evGLPTx5Gqi5ujad3wtTq+4Rn/m9JwAHcqsJbEAeKID6IBDJSrK5kJb
	9GqQ==
X-Received: by 10.31.148.144 with SMTP id w138mr83194741vkd.44.1452537442707; 
	Mon, 11 Jan 2016 10:37:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Mon, 11 Jan 2016 10:37:03 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 11 Jan 2016 10:37:03 -0800
Message-ID: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Mon, 11 Jan 2016 18:37:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to build qt5 toolchain on fido branch and qtsystems fails.
Following is the log:

Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.12"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:b1bf5b638567cd5be269c5968931de8deeac0c80"
meta-qt5          = "jethro:d5536e34ec985c82b621448ab4325e5cbba38560"
meta-networking
meta-ruby
meta-python
meta-oe           = "fido:e8a8e0be8e39dbb949bf0f0df90abe1c4e3f6470"
meta-ti           = "fido:3b27c871dbf67497ea9a953fe3fa0f819c6e41c9"
meta-linaro-toolchain = "fido:08a46787862966f2236c5a9b3eb4d4ec68263593"
meta              = "fido:9f339f516ab03d598fae0e536b3a420ea4d8ee1a"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (log file is located at
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/temp/log.do_compile.22165)
ERROR: Logfile of failure stored in:
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/temp/log.do_compile.22165
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 4 MAKEFLAGS=-j 4 OE_QMAKE_COMPILER=arm-linux-gnueabihf-gcc
 -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a8
--sysroot=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CC=arm-linux-gnueabihf-gcc  -march=armv7-a -marm
 -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CXX=arm-linux-gnueabihf-g++  -march=armv7-a -marm
 -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CFLAGS=
-isystem/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include
 -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_CXXFLAGS=
-isystem/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include
 -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_LINK=arm-linux-gnueabihf-g++  -march=armv7-a -marm
 -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
--sysroot=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_LDFLAGS=
-L/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/lib
-Wl,-rpath-link,/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/lib
-Wl,-O1 -Wl,--hash-style=gnu OE_QMAKE_AR=arm-linux-gnueabihf-ar
OE_QMAKE_STRIP=echo
OE_QMAKE_WAYLAND_SCANNER=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/wayland-scanner
OE_QMAKE_INCDIR_QT=/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm//usr/include/qt5
| cd src/ && ( test -e Makefile ||
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/qt5/qmake
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/
src.pro -o Makefile ) && make -f Makefile
| make[1]: Entering directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src'
| cd publishsubscribe/ && ( test -e Makefile ||
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/qt5/qmake
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/publishsubscribe/
publishsubscribe.pro -o Makefile ) && make -f Makefile
| make[2]: Entering directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/publishsubscribe'
| make[2]: Nothing to be done for `first'.
| make[2]: Leaving directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/publishsubscribe'
| cd serviceframework/ && ( test -e Makefile ||
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/qt5/qmake
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/serviceframework/
serviceframework.pro -o Makefile ) && make -f Makefile
| make[2]: Entering directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/serviceframework'
| make[2]: Nothing to be done for `first'.
| make[2]: Leaving directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/serviceframework'
| cd systeminfo/ && ( test -e Makefile ||
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/qt5/qmake
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/
systeminfo.pro -o Makefile ) && make -f Makefile
| make[2]: Entering directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/systeminfo'
| compiling
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qbatteryinfo_linux_p.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/qdeviceinfo.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/qscreensaver.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/qbatteryinfo.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/qnetworkinfo.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qdeviceinfo_linux_p.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h
| moc
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qudevwrapper_p.h
| compiling .moc/moc_qbatteryinfo_linux_p.cpp
| compiling .moc/moc_qdeviceinfo.cpp
| compiling .moc/moc_qscreensaver.cpp
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:46:0:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint64_t bt_get_le64(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: expected identifier before '*' token
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: expected ',' or '...' before '(' token
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: expected ';' at end of member declaration
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: '__v' does not name a type
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: 'typeof' was not declared in this scope
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: 'struct bt_get_le64(const void*)::<anonymous>' has no member named
'__v'
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
error: void value not ignored as it ought to be
|   return bt_get_unaligned((const uint64_t *) ptr);
|          ^
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:37:0,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:46:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint64_t bt_get_be64(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: expected identifier before '*' token
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: expected ',' or '...' before '(' token
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: expected ';' at end of member declaration
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: '__v' does not name a type
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: 'typeof' was not declared in this scope
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:18:
error: 'struct bt_get_be64(const void*)::<anonymous>' has no member named
'__v'
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:164:9:
error: invalid use of void expression
|   return bswap_64(bt_get_unaligned((const uint64_t *) ptr));
|          ^
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:46:0:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint32_t bt_get_le32(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: expected identifier before '*' token
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: expected ',' or '...' before '(' token
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: expected ';' at end of member declaration
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: '__v' does not name a type
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: 'typeof' was not declared in this scope
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: 'struct bt_get_le32(const void*)::<anonymous>' has no member named
'__v'
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:169:9:
error: void value not ignored as it ought to be
|   return bt_get_unaligned((const uint32_t *) ptr);
|          ^
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:37:0,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:46:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint32_t bt_get_be32(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: expected identifier before '*' token
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: expected ',' or '...' before '(' token
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: expected ';' at end of member declaration
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: '__v' does not name a type
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: 'typeof' was not declared in this scope
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:18:
error: 'struct bt_get_be32(const void*)::<anonymous>' has no member named
'__v'
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:174:9:
error: invalid use of void expression
|   return bswap_32(bt_get_unaligned((const uint32_t *) ptr));
|          ^
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:46:0:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint16_t bt_get_le16(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: expected identifier before '*' token
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: expected ',' or '...' before '(' token
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: expected ';' at end of member declaration
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: '__v' does not name a type
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: 'typeof' was not declared in this scope
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: 'struct bt_get_le16(const void*)::<anonymous>' has no member named
'__v'
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:179:9:
error: void value not ignored as it ought to be
|   return bt_get_unaligned((const uint16_t *) ptr);
|          ^
| In file included from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bits/byteswap.h:34:0,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/endian.h:60,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bits/waitstatus.h:64,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/stdlib.h:42,
|                  from
/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/cstdlib:72,
|                  from
/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/bits/stl_algo.h:59,
|                  from
/home/nws/gcc-4.9/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/include/c++/4.9.3/algorithm:62,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/qt5/QtCore/qglobal.h:85,
|                  from
../../include/QtSystemInfo/../../../git/src/systeminfo/qsysteminfoglobal.h:48,
|                  from ../../include/QtSystemInfo/qsysteminfoglobal.h:1,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/qnetworkinfo.h:37,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48,
|                  from
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux.cpp:34:
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:
In function 'uint16_t bt_get_be16(const void*)':
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: expected identifier before '*' token
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: expected ',' or '...' before '(' token
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: expected ';' at end of member declaration
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: '__v' does not name a type
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: 'typeof' was not declared in this scope
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: 'struct bt_get_be16(const void*)::<anonymous>' has no member named
'__v'
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
|
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:184:18:
error: void value not ignored as it ought to be
|   return bswap_16(bt_get_unaligned((const uint16_t *) ptr));
|                   ^
| make[2]: *** [.obj/qnetworkinfo_linux.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src/systeminfo'
| make[1]: *** [sub-systeminfo-make_first-ordered] Error 2
| make[1]: Leaving directory
`/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/build/src'
| make: *** [sub-src-make_first-ordered] Error 2
| ERROR: oe_runmake failed
| WARNING:
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/temp/run.do_compile.22165:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0577ffca58-r0/temp/log.do_compile.22165)
ERROR: Task 754
(/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2088 tasks of which 1910 didn't need to be
rerun and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/qt5/
qtsystems_git.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

How to fix this one ?

Regards
Ankur

