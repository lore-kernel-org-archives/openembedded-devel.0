Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 8131C6066D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 12:13:47 +0000 (UTC)
Received: (qmail 27049 invoked by uid 1003); 9 Aug 2013 12:13:48 -0000
Received: from unknown (HELO ?192.168.1.103?)
	(philip@opensdr.com@71.171.36.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Aug 2013 12:13:47 -0000
Message-ID: <5204DCFA.6090101@balister.org>
Date: Fri, 09 Aug 2013 08:13:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
	<1376038471-32202-10-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1376038471-32202-10-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCH 10/12] uhd: add dependency on ncurses
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
X-List-Received-Date: Fri, 09 Aug 2013 12:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Thanks for catching this Martin!

Philip

On 08/09/2013 04:54 AM, Martin Jansa wrote:
> * when it's not found in target sysroots it's trying to use native one
>   | cd uhd/1_3.5.3-r3.0/git/host/build/examples && sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_script CMakeFiles/rx_ascii_art_dft.dir/link.txt --verbose=1
>   | sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++    -march=armv5te -marm -mthumb-interwork  --sysroot=sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fpermissive -O2 -pipe -g -feliminate-unused-debug-types  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -DNDEBUG  -march=armv5te -marm -mthumb-interwork  --sysroot=sysroots/qemuarm  -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed CMakeFiles/rx_ascii_art_dft.dir/rx_ascii_art_dft.cpp.o  -o rx_ascii_art_dft
>   -Lsysroots/x86_64-linux/usr/lib -rdynamic ../lib/libuhd.so.003.005 -lcurses sysroots/x86_64-linux/usr/lib/libform.so -lboost_date_time-mt -lboost_filesystem-mt -lboost_program_options-mt -lboost_regex-mt -lboost_system-mt -lboost_thread-mt -lboost_unit_test_framework -lrt -lusb-1.0 -lpthread -ldl -Wl,-rpath,uhd/1_3.5.3-r3.0/git/host/build/lib:sysroots/x86_64-linux/usr/lib:
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: sysroots/x86_64-linux/usr/lib/libform.so: incompatible target
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libncurses.so.5 while searching for libncurses.so.5
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libncurses.so.5 while searching for libncurses.so.5
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: cannot find libncurses.so.5
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: warning: skipping incompatible sysroots/x86_64-linux/usr/lib/libtinfo.so while searching for tinfo
>   | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: cannot find -ltinfo
>   | uhd/1_3.5.3-r3.0/git/host/examples/rx_ascii_art_dft.cpp:149: error: undefined reference to 'initscr'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/uhd/uhd.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
> index d3cc4c8..476b763 100644
> --- a/meta-oe/recipes-connectivity/uhd/uhd.inc
> +++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.ettus.com"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=51b35d652c070d136bf20244494be2d3"
>  
> -DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native"
> +DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native ncurses"
>  RDEPENDS_${PN} += "uhd-firmware"
>  
>  PE = "1"
> 

