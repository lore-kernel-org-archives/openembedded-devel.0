Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 502 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Jan 2015 08:22:08 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 88C5A718E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 08:22:08 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id D8FB427C32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 09:13:44 +0100 (CET)
Message-ID: <54C5F739.40307@pseudoterminal.org>
Date: Mon, 26 Jan 2015 09:13:45 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] qtwebengine in master fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jan 2015 08:22:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I tried to build qtwebengine, but there is a linker error:

[6/6694] LINK genmacro
FAILED: 
/home/dv/misc/yocto-fsl-setup-0002/poky/build/tmp/sysroots/x86_64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ 
-march=armv7-a -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 
--sysroot=/home/dv/misc/yocto-fsl-setup-0002/poky/build/tmp/sysroots/cubox-i 
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro 
-Wl,--fatal-warnings -pthread -Wl,-z,noexecstack -fPIC 
-Wl,--disable-new-dtags -Wl,--gc-sections -o genmacro -Wl,--start-group 
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/genmacro/genmacro.genmacro.o 
-Wl,--end-group
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/genmacro/genmacro.genmacro.o: 
file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

Looking at the ninja 
fileqtwebengine-opensource-src-5.4.0/src/core/Release/obj.host/src/3rdparty/chromium/third_party/yasm/genmacro.ninja 
, apparently this part is causing problems:

build genmacro: link $
obj.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/tools/genmacro/genmacro.genmacro.o

It is linking with arm-poky-linux-gnueabi-g++ , but the object file is 
built with the host's compiler. Considering the name "genmacro", I 
suspect this is some kind of generator tool that is supposed to be run 
as part of the build process, so therefore the linker should be the host 
one. But I have no knowledge about ninja or the webengine internals, so 
I do not know how to fix that. Any suggestions?

