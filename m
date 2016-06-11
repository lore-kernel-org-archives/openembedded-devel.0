Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id C69A360796
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jun 2016 10:11:55 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 884DB68A01C; Sat, 11 Jun 2016 11:11:54 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id F067568A019;
	Sat, 11 Jun 2016 11:11:53 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9F80E674018E;
	Sat, 11 Jun 2016 12:11:53 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <575BE3E8.8060809@mlbassoc.com>
Date: Sat, 11 Jun 2016 12:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: Chromium build broken
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
X-List-Received-Date: Sat, 11 Jun 2016 10:11:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Building chromium is broken on my i.MX6 target.

Poky/Yocto info:
BB_VERSION        = "1.31.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-15.10"
TARGET_SYS        = "arm-amltd-linux-gnueabi"
MACHINE           = "teton-p0382"
DISTRO            = "amltd"
DISTRO_VERSION    = "2.1+snapshot-20160611"
TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard       cortexa9"
TARGET_FPU        = "hard"
meta              = "master:40e789d1fee7f0df2d23230fff38325119ad2935"
meta-teton-imx6-p0382 = "master:5f3d52b357c0b05e7ea5cfc309e04c8c3aad1260"
meta-fsl-arm      = "master:00b46e11e32f859a0d2dad5a5d53d5540be9c15e"
meta-fsl-arm-extra = "master:089ce85e2e2dd78e45b773b947643ab8f4e2b965"
meta-browser      = "master:825ea9349fe9b7da39f1de0c3e8e15d9d62f2774"

Error:
| ninja: Entering directory 
`/local/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/out/Release'
| [1/9316] SOLINK lib/libnative_theme.so
| [2/9316] CXX obj/components/infobars/core/infobars_core.infobar_container.o
| [3/9316] CXX obj/components/infobars/core/infobars_core.infobars_switches.o
| [4/9316] CXX obj/components/infobars/core/infobars_core.infobar.o
| [5/9316] STAMP obj/ui/compositor/compositor.compile_depends.stamp
| [6/9316] CXX obj/ui/compositor/compositor.callback_layer_animation_observer.o
| FAILED: if [ ! -e lib/libnative_theme.so -o ! -e lib/libnative_theme.so.TOC ]; then arm-amltd-linux-gnueabi-g++ 
-march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 
--sysroot=/local/p0382_2016-01-13/tmp/sysroots/teton-p0382 -shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed 
-Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags -L. -Wl,-O1 
-Wl,--as-needed -Wl,--gc-sections -o lib/libnative_theme.so -Wl,-soname=libnative_theme.so @lib/libnative_theme.so.rsp 
&& { readelf -d lib/libnative_theme.so | grep SONAME ; arm-amltd-linux-gnueabi-nm -gD -f p lib/libnative_theme.so | cut 
-f1-2 -d' '; } > lib/libnative_theme.so.TOC; else arm-amltd-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon 
-mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/local/p0382_2016-01-13/tmp/sysroots/teton-p0382 -shared -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC 
-Wl,--disable-new-dtags -L. -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -o lib/libnative_theme.so 
-Wl,-soname=libnative_theme.so @lib/libnative_theme.so.rsp && { readelf -d lib/libnative_theme.so | grep SONAME ; 
arm-amltd-linux-gnueabi-nm -gD -f p lib/libnative_theme.so | cut -f1-2 -d' '; } > lib/libnative_theme.so.tmp && if ! cmp 
-s lib/libnative_theme.so.tmp lib/libnative_theme.so.TOC; then mv lib/libnative_theme.so.tmp lib/libnative_theme.so.TOC 
; fi; fi
| obj/ui/native_theme/native_theme.common_theme.o: In function `_GLOBAL__sub_I_common_theme.cc':
| /usr/src/debug/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/ui/native_theme/common_theme.cc:273: undefined reference 
to `gfx::kGoogleBlue500'
| /usr/src/debug/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/ui/native_theme/common_theme.cc:273: undefined reference 
to `gfx::kGoogleBlue300'

Note: I'm still using GCC/4.9.x with the standard linker (not gold)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

