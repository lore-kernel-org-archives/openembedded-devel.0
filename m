Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BC63A731D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:15:32 +0000 (UTC)
Received: from [172.16.1.106] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3B9FF2EBC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 13:15:32 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <575BE3E8.8060809@mlbassoc.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <57628A53.201@pseudoterminal.org>
Date: Thu, 16 Jun 2016 13:15:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <575BE3E8.8060809@mlbassoc.com>
Subject: Re: Chromium build broken
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
X-List-Received-Date: Thu, 16 Jun 2016 11:15:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

This indicates a problem related to this patch: 
0012-Workaround-for-unused-variable-error-in-ui-gfx-color.patch
It is possible that the new .cc file needs to be linked in somewhere 
else as well.

I tried to do it differently by disabling the unused-variable warning 
inline, but it did not work.

On 2016-06-11 12:11, Gary Thomas wrote:
> Building chromium is broken on my i.MX6 target.
>
> Poky/Yocto info:
> BB_VERSION        = "1.31.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-15.10"
> TARGET_SYS        = "arm-amltd-linux-gnueabi"
> MACHINE           = "teton-p0382"
> DISTRO            = "amltd"
> DISTRO_VERSION    = "2.1+snapshot-20160611"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon 
> callconvention-hard       cortexa9"
> TARGET_FPU        = "hard"
> meta              = "master:40e789d1fee7f0df2d23230fff38325119ad2935"
> meta-teton-imx6-p0382 = "master:5f3d52b357c0b05e7ea5cfc309e04c8c3aad1260"
> meta-fsl-arm      = "master:00b46e11e32f859a0d2dad5a5d53d5540be9c15e"
> meta-fsl-arm-extra = "master:089ce85e2e2dd78e45b773b947643ab8f4e2b965"
> meta-browser      = "master:825ea9349fe9b7da39f1de0c3e8e15d9d62f2774"
>
> Error:
> | ninja: Entering directory 
> `/local/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/out/Release'
> | [1/9316] SOLINK lib/libnative_theme.so
> | [2/9316] CXX 
> obj/components/infobars/core/infobars_core.infobar_container.o
> | [3/9316] CXX 
> obj/components/infobars/core/infobars_core.infobars_switches.o
> | [4/9316] CXX obj/components/infobars/core/infobars_core.infobar.o
> | [5/9316] STAMP obj/ui/compositor/compositor.compile_depends.stamp
> | [6/9316] CXX 
> obj/ui/compositor/compositor.callback_layer_animation_observer.o
> | FAILED: if [ ! -e lib/libnative_theme.so -o ! -e 
> lib/libnative_theme.so.TOC ]; then arm-amltd-linux-gnueabi-g++ 
> -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 
> --sysroot=/local/p0382_2016-01-13/tmp/sysroots/teton-p0382 -shared 
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro 
> -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags 
> -L. -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -o 
> lib/libnative_theme.so -Wl,-soname=libnative_theme.so 
> @lib/libnative_theme.so.rsp && { readelf -d lib/libnative_theme.so | 
> grep SONAME ; arm-amltd-linux-gnueabi-nm -gD -f p 
> lib/libnative_theme.so | cut -f1-2 -d' '; } > 
> lib/libnative_theme.so.TOC; else arm-amltd-linux-gnueabi-g++  
> -march=armv7-a -marm -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 
> --sysroot=/local/p0382_2016-01-13/tmp/sysroots/teton-p0382 -shared 
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro 
> -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -Wl,--disable-new-dtags 
> -L. -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -o 
> lib/libnative_theme.so -Wl,-soname=libnative_theme.so 
> @lib/libnative_theme.so.rsp && { readelf -d lib/libnative_theme.so | 
> grep SONAME ; arm-amltd-linux-gnueabi-nm -gD -f p 
> lib/libnative_theme.so | cut -f1-2 -d' '; } > 
> lib/libnative_theme.so.tmp && if ! cmp -s lib/libnative_theme.so.tmp 
> lib/libnative_theme.so.TOC; then mv lib/libnative_theme.so.tmp 
> lib/libnative_theme.so.TOC ; fi; fi
> | obj/ui/native_theme/native_theme.common_theme.o: In function 
> `_GLOBAL__sub_I_common_theme.cc':
> | 
> /usr/src/debug/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/ui/native_theme/common_theme.cc:273: 
> undefined reference to `gfx::kGoogleBlue500'
> | 
> /usr/src/debug/chromium/48.0.2548.0-r0/chromium-48.0.2548.0/ui/native_theme/common_theme.cc:273: 
> undefined reference to `gfx::kGoogleBlue300'
>
> Note: I'm still using GCC/4.9.x with the standard linker (not gold)
>


